{ config, lib, pkgs, ... }:

{
  disko.devices = {
    disk = {
      sda = {
        type = "disk";
        device = "/dev/sda";
        content = {
          type = "gpt";
          partitions = {
            tank = {
              size = "100%";
              content = { type = "zfs"; pool = "tank"; };
            };
          };
        };
      };
      sdb = {
        type = "disk";
        device = "/dev/sdb";
        content = {
          type = "gpt";
          partitions = {
            tank = {
              size = "100%";
              content = { type = "zfs"; pool = "tank"; };
            };
          };
        };
      };
      sdc = {
        type = "disk";
        device = "/dev/sdc";
        content = {
          type = "gpt";
          partitions = {
            tank = {
              size = "100%";
              content = { type = "zfs"; pool = "tank"; };
            };
          };
        };
      };
      sdd = {
        type = "disk";
        device = "/dev/sdd";
        content = {
          type = "gpt";
          partitions = {
            tank = {
              size = "100%";
              content = { type = "zfs"; pool = "tank"; };
            };
          };
        };
      };
      sde = {
        type = "disk";
        device = "/dev/sde";
        content = {
          type = "gpt";
          partitions = {
            tank = {
              size = "100%";
              content = { type = "zfs"; pool = "tank"; };
            };
          };
        };
      };
      sdf = {
        type = "disk";
        device = "/dev/sdf";
        content = {
          type = "gpt";
          partitions = {
            tank = {
              size = "100%";
              content = { type = "zfs"; pool = "tank"; };
            };
          };
        };
      };
    };

    zpool.tank = {
      mode = "stripe";
      options = { ashift = "12"; };
      rootFsOptions = {
        compression = "zstd";
        atime = "off";
        mountpoint = "/tank";
        "com.sun:auto-snapshot" = "false";
      };
      datasets = {
        "media" = { mountpoint = "/tank/media"; };
        "media/shows" = { mountpoint = "/tank/media/shows"; };
        "media/movies" = { mountpoint = "/tank/media/movies"; };
        "media/books" = { mountpoint = "/tank/media/books"; };
        "media/music" = { mountpoint = "/tank/media/music"; };
        "photos" = { mountpoint = "/tank/photos"; };
        "apps" = { mountpoint = "/tank/apps"; };
        "apps/jellyfin" = { mountpoint = "/tank/apps/jellyfin"; };
        "apps/radarr" = { mountpoint = "/tank/apps/radarr"; };
        "apps/sonarr" = { mountpoint = "/tank/apps/sonarr"; };
        "apps/vaultwarden" = { mountpoint = "/tank/apps/vaultwarden"; };
        "apps/immich" = { mountpoint = "/tank/apps/immich"; };
        "apps/jellyseerr" = { mountpoint = "/tank/apps/jellyseerr"; };
      };
    };
  };
}
