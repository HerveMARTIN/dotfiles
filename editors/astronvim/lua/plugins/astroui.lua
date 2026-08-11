-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    colorscheme = "astrodark",
    highlights = {
      -- astrodark links NonText to #3A3E47, the same color it uses for window
      -- borders. The snacks picker reuses NonText for the path prefix and for
      -- hidden/ignored entries, which leaves them at a 1.5:1 contrast ratio
      -- against the #1A1D23 background -- unreadable. Lift them onto the
      -- palette's real text greys instead, keeping the visual hierarchy
      -- ignored < dir/hidden < filename (#ADB0BB).
      astrodark = {
        SnacksPickerDir = { fg = "#797D87" }, -- dirname prefix (<Leader>ff, <Leader>fw)
        SnacksPickerPathHidden = { fg = "#797D87" }, -- dotfiles: <Leader>ff shows them inside a git repo
        SnacksPickerPathIgnored = { fg = "#696C76" }, -- gitignored, only via <Leader>fF / <Leader>fW
      },
    },
  },
}
