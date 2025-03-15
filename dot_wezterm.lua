-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Catppuccin Frappe'
config.font = wezterm.font 'Berkeley Mono'
config.font_size = 18.0
config.window_close_confirmation = 'NeverPrompt'
config.scrollback_lines = 30000
config.switch_to_last_active_tab_when_closing_tab = true
config.cell_width = 1
config.line_height = 1.0
config.window_background_opacity = 1.0
config.inactive_pane_hsb = {
  saturation = 0.7,
  brightness = 0.6,
}

config.window_frame = {
  -- The font used in the tab bar.
  -- Roboto Bold is the default; this font is bundled
  -- with wezterm.
  -- Whatever font is selected here, it will have the
  -- main font setting appended to it to pick up any
  -- fallback fonts you may have used there.
  font = wezterm.font { family = 'BerkeleyMono Nerd Font Mono Plus Font Awesome Plus Font Awesome Extension Plus Octicons Plus Power Symbols Plus Codicons Plus Pomicons Plus Font Logos Plus Material Design Icons Plus Weather Icons', weight = 'Bold' },

  -- The size of the font in the tab bar.
  -- Default to 10.0 on Windows but 12.0 on other systems
  font_size = 18.0,

  -- The overall background color of the tab bar when
  -- the window is focused
  active_titlebar_bg = '#333333',

  -- The overall background color of the tab bar when
  -- the window is not focused
  inactive_titlebar_bg = '#333333',
}

config.colors = {
  tab_bar = {
    -- The color of the inactive tab bar edge/divider
    inactive_tab_edge = '#575757',
  },
}

-- and finally, return the configuration to wezterm

local act = wezterm.action
config.keys = {
  {
    key = 'D',
    mods = 'CMD|SHIFT',
    action = wezterm.action.TogglePaneZoomState,
  },
  { key = '\\', mods = 'CMD', action = act.PaneSelect },
  { key = ']', mods = 'CMD', action = act.ActivatePaneDirection 'Next' },
  { key = '[', mods = 'CMD', action = act.ActivatePaneDirection 'Prev' },
  {
    key = "-",
    mods = "CMD|SHIFT",
    action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "=",
    mods = "CMD|SHIFT",
    action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
  {
    key = 'LeftArrow',
    mods = 'CMD|SHIFT',
    action = act.AdjustPaneSize { 'Left', 5 },
  },
  {
    key = 'DownArrow',
    mods = 'CMD|SHIFT',
    action = act.AdjustPaneSize { 'Down', 5 },
  },
  {
    key = 'UpArrow',
    mods = 'CMD|SHIFT',
    action = act.AdjustPaneSize { 'Up', 5 } },
  {
    key = 'RightArrow',
    mods = 'CMD|SHIFT',
    action = act.AdjustPaneSize { 'Right', 5 },
  },
  {
    key = 'R',
    mods = 'CMD|SHIFT',
    action = act.PromptInputLine {
      description = 'Enter new name for tab',
      action = wezterm.action_callback(function(window, _, line)
        -- line will be `nil` if they hit escape without entering anything
        -- An empty string if they just hit enter
        -- Or the actual line of text they wrote
        if line then
          window:active_tab():set_title(line)
        end
      end),
    },
  },
  {
    key = ',',
    mods = 'CMD',
    action = act.SpawnCommandInNewTab {
      cwd = os.getenv('WEZTERM_CONFIG_DIR'),
      set_environment_variables = {
        TERM = 'screen-256color',
      },
      args = {
        '/opt/homebrew/bin/nvim',
        os.getenv('WEZTERM_CONFIG_FILE'),
      },
    },
  },
  {
    key = 't',
    mods = 'CMD|SHIFT',
    action = act.ShowTabNavigator,
  },
  {
    key = 'w',
    mods = 'CMD',
    action = act.CloseCurrentPane { confirm = false },
  }
}

return config
