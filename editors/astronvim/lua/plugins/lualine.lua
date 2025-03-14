return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      component_separators = '',
      icons_enabled = true,
      section_separators = '',
      theme = "powerline",
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { { "filename", file_status = true, path = 1 } },
      lualine_c = { { "branch", icon = "" } },
      lualine_x = { "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    tabline = {
      lualine_a = { "buffers" },
    },
  },
}
