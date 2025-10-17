{ config, lib, pkgs, ... }:

let
  haveModule = builtins.hasAttr "jellyseerr" config.services;
  port = 5055;
  dataDir = "/tank/apps/jellyseerr";
in
{
  config = lib.mkIf haveModule {
    services.jellyseerr = {
      enable = true;
      port = port;
    };
  };
}
