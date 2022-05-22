local wezterm = require 'wezterm';

return {
  font_size = 14,
  line_height = 0.85,
  window_background_image = "/home/user/nextcloud/media/wallpapers/bg-1536-dark.png",
  hide_tab_bar_if_only_one_tab = true,
  exit_behavior="Close",
  scrollback_lines = 100000,
  enable_scroll_bar = true,
  harfbuzz_features = {"calt=0", "clig=0", "liga=0"}, -- https://github.com/wez/wezterm/issues/1264
  check_for_updates = false,
  disable_default_key_bindings = true,
  keys = {
--    {key="/", mods="CTRL", action="DisableDefaultAssignment"},
    {key="c", mods="CTRL|SHIFT", action=wezterm.action{CopyTo="Clipboard"}},
    {key="c", mods="ALT", action=wezterm.action{CopyTo="Clipboard"}},
    {key="Copy", mods="", action=wezterm.action{CopyTo="Clipboard"}},
    {key="v", mods="CTRL|SHIFT", action=wezterm.action{PasteFrom="Clipboard"}},
    {key="v", mods="ALT", action=wezterm.action{PasteFrom="Clipboard"}},
    {key="Paste", mods="", action=wezterm.action{PasteFrom="Clipboard"}},
    {key="Insert", mods="CTRL", action=wezterm.action{CopyTo="PrimarySelection"}},
    {key="Insert", mods="SHIFT", action=wezterm.action{PasteFrom="PrimarySelection"}},
    {key="n", mods="CTRL|SHIFT", action="SpawnWindow"},
    {key="-", mods="CTRL", action="DecreaseFontSize"},
    {key="=", mods="CTRL", action="IncreaseFontSize"},
    {key="0", mods="CTRL", action="ResetFontSize"},
    {key="t", mods="CTRL|SHIFT", action=wezterm.action{SpawnTab="CurrentPaneDomain"}},
    {key="t", mods="ALT", action=wezterm.action{SpawnTab="DefaultDomain"}},
    {key="w", mods="CTRL|SHIFT", action=wezterm.action{CloseCurrentTab={confirm=true}}},
    {key="Tab", mods="CTRL|SHIFT", action=wezterm.action{ActivateTabRelative=-1}},
    {key="Tab", mods="CTRL", action=wezterm.action{ActivateTabRelative=1}},
    {key="r", mods="CTRL|SHIFT", action="ReloadConfiguration"},
    {key="d", mods="CTRL|SHIFT", action="ShowDebugOverlay"},
    {key="f", mods="CTRL|SHIFT", action=wezterm.action{Search={CaseSensitiveString=""}}},
    {key="x", mods="CTRL|SHIFT", action="ActivateCopyMode"},
    {key="Space", mods="CTRL|SHIFT", action="QuickSelect"},
    {key="\\", mods="CTRL|SHIFT", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
    {key="?", mods="CTRL|SHIFT", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
    {key="LeftArrow", mods="CTRL|SHIFT", action=wezterm.action{AdjustPaneSize={"Left", 1}}},
    {key="RightArrow", mods="CTRL|SHIFT", action=wezterm.action{AdjustPaneSize={"Right", 1}}},
    {key="UpArrow", mods="CTRL|SHIFT", action=wezterm.action{AdjustPaneSize={"Up", 1}}},
    {key="DownArrow", mods="CTRL|SHIFT", action=wezterm.action{AdjustPaneSize={"Down", 1}}},
    {key="LeftArrow", mods="ALT", action=wezterm.action{ActivatePaneDirection="Left"}},
    {key="RightArrow", mods="ALT", action=wezterm.action{ActivatePaneDirection="Right"}},
    {key="UpArrow", mods="ALT", action=wezterm.action{ActivatePaneDirection="Up"}},
    {key="DownArrow", mods="ALT", action=wezterm.action{ActivatePaneDirection="Down"}},
    {key="z", mods="CTRL|SHIFT", action="TogglePaneZoomState"},
--    {key="", mods="CTRL|SHIFT", action=wezterm.action{=""}},
--    {key="", mods="CTRL|SHIFT", action=""},


    {key="l", mods="CTRL|SHIFT", action="ShowLauncher"},
    {key="l", mods="ALT", action="ShowLauncher"},
    {key="1", mods="ALT", action=wezterm.action{ActivateTab=0}},
    {key="2", mods="ALT", action=wezterm.action{ActivateTab=1}},
    {key="3", mods="ALT", action=wezterm.action{ActivateTab=2}},
    {key="4", mods="ALT", action=wezterm.action{ActivateTab=3}},
    {key="5", mods="ALT", action=wezterm.action{ActivateTab=4}},
    {key="6", mods="ALT", action=wezterm.action{ActivateTab=5}},
    {key="7", mods="ALT", action=wezterm.action{ActivateTab=6}},
    {key="8", mods="ALT", action=wezterm.action{ActivateTab=7}},
    {key="9", mods="ALT", action=wezterm.action{ActivateTab=8}},
    {key="0", mods="ALT", action=wezterm.action{ActivateTab=9}},
    -- TODO: https://wezfurlong.org/wezterm/config/lua/keyassignment/ActivateTab.html
  },

  launch_menu = {
    {
      args = {"htop"},
    },
    {
      label = "bash",
      args = {"bash", "-l"},
      cwd = "/home/user"
      -- set_environment_variables = { FOO = "bar" },
    },
    {
      label = "fish",
      args = {"fish", "-l"},
    },
  }
}
