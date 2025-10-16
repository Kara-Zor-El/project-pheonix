{ config, lib, pkgs, ... }:

let
  haveModule = builtins.hasAttr "jellyseerr" config.services;
  port = 5055;
  listen = "127.0.0.1";
  dataDir = "/tank/apps/jellyseerr";
  user = "jellyseerr";
  group = "media";
in
{
  config = lib.mkMerge [
    (lib.mkIf haveModule {
      services.jellyseerr = {
        enable = true;
        inherit user group;
        inherit dataDir;
        listenAddress = listen;
        inherit port;
      };
    })
    (lib.mkIf (!haveModule) {
      users.users.${user} = {
        isSystemUser = true;
        description = "Jellyseerr service user";
        home = dataDir;
        group = group;
      };
      systemd.services.jellyseerr = {
        description = "Jellyseerr Service";
        wantedBy = [ "multi-user.target" ];
        after = [ "network.target" ];
        serviceConfig = {
          User = user;
          Group = group;
          WorkingDirectory = dataDir;
          ExecStart = ''${pkgs.jellyseerr}/bin/jellyseerr --port ${toString port} --host ${listen}'';
          Restart = "on-failure";
        };
      };
    })
  ];
}
