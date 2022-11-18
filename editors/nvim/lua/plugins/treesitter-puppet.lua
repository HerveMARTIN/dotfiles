local status_parsers_ok, parsers = pcall(require, "nvim-treesitter.parsers")
if not status_parsers_ok then
  vim.notify("Error loading parsers")
  return
end

local parser_config = parsers.get_parser_configs()
parser_config.puppet = {
  install_info = {
    url = "https://github.com/neovim-puppet/tree-sitter-puppet.git",
    files = {"src/parser.c", "src/scanner.cc"},
    branch = "main",
  },
  filetype = "puppet",
}
