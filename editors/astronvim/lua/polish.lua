-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

vim.opt.mouse = ""

-- NOTE: depuis AstroNvim v6, les filetypes personnalisés se déclarent via
-- l'option `filetypes` d'AstroCore (`lua/plugins/astrocore.lua`), plus ici.

-- Désactiver le formatage automatique pour les fichiers Puppetfile
vim.api.nvim_create_autocmd("FileType", {
  pattern = "ruby",
  callback = function()
    if vim.fn.expand("%:t") == "Puppetfile" then
      vim.b.autoformat = false
    end
  end,
})
