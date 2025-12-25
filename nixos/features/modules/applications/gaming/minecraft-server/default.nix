{ config, lib, pkgs, inputs, ... }:

{
  options.programs.gaming.mc-server = {
    enable = lib.mkEnableOption "Minecraft server";
  };
  config = let
    cfg = config.programs.gaming.mc-server;
    serverName = "NoteArcade";
    vanillaTweaksPath = ./vanilla_tweaks;
  in lib.mkIf cfg.enable {
    environment = {
      systemPackages = with pkgs; [
        packwiz
        rcon
      ];
    };

    services.minecraft-servers = { 
      enable = true;
      eula = true;
      openFirewall = true;
      dataDir = "/var/lib/minecraft";
      managementSystem = {
        systemd-socket.enable = true;
      };
      servers = {
        ${serverName} = {
          enable = true;
          autoStart = false;
          package = pkgs.fabricServers.fabric-1_21_10;
          serverProperties = {
            debug = "true";
            white-list = false;
            gamemode = "survival";
            max-players = 8;
            difficulty = "easy";
            online-mode = false;
            hardcore = false;
            enable-rcon = true;
            autorestart = false;
            motd = "Minecraft server!";
            "rcon.password" = "listener";
          };
          whitelist = {
#            rootgin = "e2f0ed4f-5e78-4fcd-bf67-47070da7627d";
rootgin = "5045a5ec-5c00-30bf-b7c9-04b932468753";
            k4t     = "44edb391-b791-3fa2-8ec3-f858a13bf62a";
            xJ4yyz  = "8a107888-e53e-3c2f-bfb9-6710eaafcac0";
          };
          jvmOpts = [
            "-Djava.net.preferIPv6Addresses=true"
            "-Xms4092M -Xmx4092M -XX:+UseG1GC"
          ];
          symlinks = {
#            "world/datapacks" = vanillaTweaksPath;
            mods = pkgs.linkFarmFromDrvs "mods" (
              builtins.attrValues { 
                Sodium = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/AANobbMI/versions/sFfidWgd/sodium-fabric-0.7.3%2Bmc1.21.10.jar";
                  sha256 = "sLz6Mk+mrPiTS3vVrRlG5aADqrhvh30qZK8iD+KEtoM=";
                };                    
                Lithium = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/gvQqBUqZ/versions/NsswKiwi/lithium-fabric-0.20.1%2Bmc1.21.10.jar";
                  sha256 = "R4Z0hlDjXdFlcrhenM0YOadgbATGdqWbZEUOhEadKJo=";
                };
                Ferrite-core = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/uXXizFIs/versions/MGoveONm/ferritecore-8.0.2-fabric.jar";
                  sha256 = "LGn9gXMEu2l1zUti/TK/IaXVyPDDUj6sxzTAwlB+2nc=";
                };
                Fabric-API = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/dQ3p80zK/fabric-api-0.138.3%2B1.21.10.jar";
                  sha256 = "rCB1kEGet1BZqpn+FjliQEHB1v0Ii6Fudi5dfs9jOVM=";
                };
#                SkinRestorer = pkgs.fetchurl {
#                  url = "https://cdn.modrinth.com/data/TsLS8Py5/versions/2nKqb3RY/SkinsRestorer-Mod-15.9.1-fabric.jar";
#                  sha256 = "lZFdPqfltTHJtsg3tD5WyMFpQJzrxLIoQpIBUU0heII=";
#                }; #Dependency conflict for some reason
              }
            );
          };
        };
      };      
    };
    networking.firewall = {
      enable = true;
      allowedTCPPorts = [ 25565 25575 ];
      allowedUDPPorts = [ 25565 ];
    };
  };
}
