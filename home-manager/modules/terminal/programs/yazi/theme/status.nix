{ theme, ... }:

{
  programs.yazi.theme.status = {
    separator_open = "";
    separator_close = "";
    separator_style = {
      fg = theme.colorScheme.foreground4Hex;
      bg = theme.colorScheme.foreground4Hex;
    };

    # Mode
    mode_normal = {
      fg = theme.colorScheme.background1Hex;
      bg = theme.colorScheme.cyanHex;
      bold = true;
    };
    mode_select = {
      fg = theme.colorScheme.background1Hex;
      bg = theme.colorScheme.greenHex;
      bold = true;
    };
    mode_unset = {
      fg = theme.colorScheme.background1Hex;
      bg = theme.colorScheme.magentaHex;
      bold = true;
    };

    # Progress
    progress_label = { bold = true; };
    progress_normal = {
      fg = theme.colorScheme.blueHex;
      bg = theme.colorScheme.background1Hex;
    };
    progress_error = {
      fg = theme.colorScheme.redHex;
      bg = theme.colorScheme.background1Hex;
    };

    # Permissions
    permissions_t = { fg = theme.colorScheme.blueHex; };
    permissions_r = { fg = theme.colorScheme.yellowHex; };
    permissions_w = { fg = theme.colorScheme.redHex; };
    permissions_x = { fg = theme.colorScheme.greenHex; };
    permissions_s = { fg = theme.colorScheme.foreground4Hex; };
  };
}
