return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          ["J"] = { "10jzz", desc = "Down 10 lines" },
          ["K"] = { "10kzz", desc = "Up 10 lines" },
          ["<C-l>"] = { ":bn<CR>", desc = "Buffer on the right" },
          ["<C-h>"] = { ":bp<CR>", desc = "Buffer on the left" },
          ["<CR>"] = { ":b#<CR>", desc = "Previous buffer" },
          ["<leader>op"] = { ":e Puppetfile<CR>", desc = "Open Puppetfile" },
          ["<leader>oj"] = { ":e Jenkinsfile<CR>", desc = "Open Jenkinsfile" },
          ["<leader>or"] = { ":e Rakefile<CR>", desc = "Open Rakefile" },
          ["<leader>od"] = { ":e Dockerfile<CR>", desc = "Open Dockerfile" },
          ["<leader>og"] = { ":e Gemfile<CR>", desc = "Open Gemfile" },
          ["<leader>rc"] = { ":AstroReload<CR>", desc = "Reload Astro Config" },
        },
      },
    },
  },
}
