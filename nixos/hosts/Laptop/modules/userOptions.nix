{ config, ... }:
{
  config.userOptions = {
    browser = "helium";
    colorScheme = "nord";
    dots = "/home/${config.userOptions.username}/.dotfiles";
    hostName = "Laptop";
    username = "rootgin";
    wallpaper = "kanagawa.png";
  };
}
