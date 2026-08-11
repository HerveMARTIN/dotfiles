-- Customize None-ls sources

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    local null_ls = require "null-ls"
    local h = require "null-ls.helpers"
    local methods = require "null-ls.methods"

    local severities = {
      error = vim.diagnostic.severity.ERROR,
      warning = vim.diagnostic.severity.WARN,
    }

    -- The stock puppet_lint builtin runs on every change but passes $FILENAME,
    -- which none-ls resolves to `params.temp_path or params.bufname` -- and with
    -- no temp file that is the path on disk. So it re-lints the last *saved*
    -- content on every keystroke: you fix a line and the diagnostic stays until
    -- the next write. `to_temp_file` makes it lint the buffer instead.
    --
    -- The temp file is created next to the real one as `.null-ls_<n>_<name>.pp`,
    -- which breaks autoloader_layout -- that check derives the expected class
    -- name from the filename. Disabled here and run separately below.
    local puppet_lint = null_ls.builtins.diagnostics.puppet_lint.with {
      name = "puppet_lint",
      to_temp_file = true,
      prepend_extra_args = true,
      extra_args = { "--no-autoloader_layout-check" },
      -- The builtin sets `filename = f.fullpath`; against a temp file none-ls
      -- would `bufadd` that path and hang the diagnostics off a phantom buffer.
      -- Dropping it attaches them to the buffer being linted, which is correct
      -- since we only ever lint one.
      on_output = function(params)
        local diagnostics = {}
        for _, file in ipairs(params.output or {}) do
          for _, d in ipairs(file) do
            table.insert(diagnostics, {
              row = d.line,
              col = d.column,
              source = d.check,
              message = d.message,
              severity = severities[d.kind],
            })
          end
        end
        return diagnostics
      end,
    }

    -- autoloader_layout needs the real path, so it only makes sense on save.
    local puppet_lint_autoloader = null_ls.builtins.diagnostics.puppet_lint.with {
      name = "puppet_lint_autoloader",
      method = methods.internal.DIAGNOSTICS_ON_SAVE,
      prepend_extra_args = true,
      extra_args = { "--only-checks", "autoloader_layout" },
    }

    -- puppet-lint only checks style: it parses leniently and stays completely
    -- silent on a manifest that puppet itself refuses to compile. `puppet
    -- parser validate` is the only thing that reports an actual syntax error,
    -- so the two are complementary rather than redundant.
    --
    -- It costs a Ruby VM start (~0.5s vs ~0.08s for puppet-lint), hence
    -- DIAGNOSTICS_ON_SAVE instead of running on every keystroke.
    local puppet_parser = h.make_builtin {
      name = "puppet_parser",
      meta = {
        url = "https://www.puppet.com/docs/puppet/8/man/parser",
        description = "Validate Puppet manifest syntax with `puppet parser validate`.",
      },
      method = methods.internal.DIAGNOSTICS_ON_SAVE,
      filetypes = { "puppet" },
      condition = function() return vim.fn.executable "puppet" == 1 end,
      generator_opts = {
        command = "puppet",
        args = { "parser", "validate", "--color=false", "$FILENAME" },
        from_stderr = true,
        format = "line",
        check_exit_code = function(code) return code <= 1 end,
        on_output = h.diagnostics.from_patterns {
          {
            -- Error: Could not parse for environment production: Syntax error at 'ensure' (file: /path/x.pp, line: 3, column: 5)
            pattern = "^Error: (.*) %(file: .-, line: (%d+), column: (%d+)%)",
            groups = { "message", "row", "col" },
            overrides = { diagnostic = { severity = vim.diagnostic.severity.ERROR, source = "puppet" } },
          },
          {
            -- Errors that carry no position, e.g. a missing file or a bad environment
            pattern = "^Error: (.*)$",
            groups = { "message" },
            overrides = {
              diagnostic = { row = 1, severity = vim.diagnostic.severity.ERROR, source = "puppet" },
            },
          },
          {
            pattern = "^Warning: (.*)$",
            groups = { "message" },
            overrides = {
              diagnostic = { row = 1, severity = vim.diagnostic.severity.WARN, source = "puppet" },
            },
          },
        },
      },
      factory = h.generator_factory,
    }

    -- Only insert new sources, do not replace the existing ones
    opts.sources = require("astrocore").list_insert_unique(opts.sources, {
      puppet_lint,
      puppet_lint_autoloader,
      puppet_parser,
    })
  end,
}
