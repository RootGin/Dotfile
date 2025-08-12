{ theme, ... }:

{
  programs.yazi.theme.manager = {
    cwd = { fg = "#${theme.colorScheme.cyanHex}"; };

    # Hovered
    hovered = {
      fg = "#${theme.colorScheme.background1Hex}";
      bg = "#${theme.colorScheme.cyanHex}";
    };
    preview_hovered = {
      fg = "#${theme.colorScheme.background1Hex}";
      bg = "#${theme.colorScheme.cyanHex}";
    };

    # Find
    find_keyword = {
      fg = "#${theme.colorScheme.yellowHex}";
      italic = true;
    };
    find_position = {
      fg = "#${theme.colorScheme.magentaHex}";
      bg = "reset";
      italic = true;
    };

    # Marker
    marker_selected = {
      fg = "#${theme.colorScheme.greenHex}";
      bg = "#${theme.colorScheme.greenHex}";
    };
    marker_copied = {
      fg = "#${theme.colorScheme.yellowHex}";
      bg = "#${theme.colorScheme.yellowHex}";
    };
    marker_cut = {
      fg = "#${theme.colorScheme.redHex}";
      bg = "#${theme.colorScheme.redHex}";
    };

    # Tab
    tab_active = {
      fg = "#${theme.colorScheme.background1Hex}";
      bg = "#${theme.colorScheme.cyanHex}";
    };
    tab_inactive = {
      fg = "#${theme.colorScheme.foreground3Hex}";
      bg = "#${theme.colorScheme.foreground4Hex}";
    };
    tab_width = 1;

    # Border
    border_symbol = "│";
    border_style = { fg = "#${theme.colorScheme.foreground4Hex}"; };

    # Offset
    folder_offset = [1 0 1 0];
    preview_offset = [1 1 1 1];

    # Highlighting
    syntect_theme = "";
  };
}
