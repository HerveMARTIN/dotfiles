-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

vim.opt.mouse = ""

-- NOTE: depuis AstroNvim v6, les filetypes personnalisés se déclarent via
-- l'option `filetypes` d'AstroCore (`lua/plugins/astrocore.lua`), plus ici.

-- Neutraliser rubocop sur les Puppetfile : nvim les detecte en filetype ruby,
-- mais la syntaxe hashrocket (:git => '...') y est la convention r10k, donc
-- Style/HashSyntax et le reformatage automatique sont des faux positifs.
-- La vraie validation du Puppetfile se fait via `rake r10k:syntax`.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "ruby",
  callback = function(args)
    if vim.fs.basename(vim.api.nvim_buf_get_name(args.buf)) == "Puppetfile" then
      vim.b[args.buf].autoformat = false
      vim.diagnostic.enable(false, { bufnr = args.buf })
    end
  end,
})
