{ config, lib, pkgs, ... }:

{
  services.radarr = {
    enable = true;
    openFirewall = false;
  };

  services.sonarr = {
    enable = true;
    openFirewall = false;
  };
}
