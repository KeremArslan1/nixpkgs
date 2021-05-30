{ ... }: {
  # Kitty terminal
  # https://sw.kovidgoyal.net/kitty/conf.html
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.kitty.enable
  programs.kitty.enable = true;

  # General config ----------------------------------------------------------------------------- {{{

  programs.kitty.settings = {
    font_family = "MonoLisa";
    font_size = "17.0";
    adjust_line_height = "120%";
    disable_ligatures = "cursor";
    hide_window_decorations = "yes";
    scrollback_lines = "50000";

    # The interval (in seconds) at which to blink the cursor. Set to zero to
    # disable blinking.
    cursor_blink_interval = "0.5";
    # Stop blinking cursor after the specified number of seconds of keyboard inactivity. Set to
    # zero or a negative number to never stop blinking.
    cursor_stop_blinking_after = "10.0";
    # The width (in pts) of window borders. Will be rounded to the nearest number of pixels based on screen resolution.
    window_border_width = "0.7pt";
    draw_minimal_borders = "yes";

    listen_on = "unix:/tmp/mykitty";

    # normal
    color0 = "#20232A";
    color1 = "#e86671";
    color2 = "#98c379";
    color3 = "#e0af68";
    color4 = "#61afef";
    color5 = "#c678dd";
    color6 = "#56b6c2";
    color7 = "#798294";

    # bright";
    color8 = "#5c6370";
    color9 = "#e86671";
    color10 = "#98c379";
    color11 = "#e0af68";
    color12 = "#61afef";
    color13 = "#c678dd";
    color14 = "#56b6c2";
    color15 = "#abb2bf";

    # extended colors";
    color16 = "#d19a66";
    color17 = "#f65866";

    url_color = "#98c379";

    background = "#282c34";
    foreground = "#abb2bf";
    selection_background = "#393f4a";
    selection_foreground = "#abb2bf";

    # Tabs
    active_tab_background = "#282c34";
    active_tab_foreground = "#abb2bf";
    inactive_tab_background = "#242b38";
    inactive_tab_foreground = "#5c6370";

  };

  programs.kitty.keybindings = {
    "kitty_mod+t" = "new_tab_with_cwd";
    "kitty_mod+enter" = "new_window_with_cwd";
    "cmd+t" = "new_tab_with_cwd";
    "cmd+enter" = "new_window_with_cwd";
    "cmd+k" =
      "combine : clear_terminal scrollback active : send_text normal x0c";
    "ctrl+f" =
      "launch --type=overlay --stdin-source=@screen_scrollback fzf --no-sort --no-mouse --exact -i";
    "cmd+f" =
      "launch --type=overlay --stdin-source=@screen_scrollback fzf --no-sort --no-mouse --exact -i";
  };
}
