{
  services.yabai = {
    enable = true;
    enableScriptingAddition = true;
    # logFile ="/var/tmp/yabai.log";
    config = {
      auto_balance = "off";
      focus_follows_mouse = "off";
      layout = "bsp";
      mouse_drop_action = "swap";
      mouse_follows_focus = "off";
      mouse_modifier = "alt";
      mouse_action1 = "move";
      mouse_action2 = "resize";
      window_gap = 5;
      left_padding = 5;
      right_padding = 5;
      top_padding = 5;
      bottom_padding = 5;
      window_origin_display = "default";
      window_placement = "second_child";
      window_shadow = "float";
      # Add rules later, surely I will remember
    };
  };
}
