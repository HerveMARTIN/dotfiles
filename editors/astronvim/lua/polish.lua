-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

vim.opt.mouse = ""
-- Set up custom filetypes
vim.filetype.add {
  extension = {
    foo = "fooscript",
  },
  filename = {
    ["Foofile"] = "fooscript",
  },
  pattern = {
    ["~/%.config/foo/.*"] = "fooscript",
  },
}

-- Désactiver le formatage automatique pour les fichiers Puppetfile
vim.api.nvim_create_autocmd("FileType", {
  pattern = "ruby",
  callback = function()
    if vim.fn.expand("%:t") == "Puppetfile" then
      vim.b.autoformat = false
    end
  end,
})
