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
    };

    zpool.tank = {
      type = "zpool";
      mode = "";
      options = { ashift = "12"; };
      rootFsOptions = {
        compression = "zstd";
        atime = "off";
        mountpoint = "/tank";
        "com.sun:auto-snapshot" = "false";
      };
      datasets = {
        "media" = { type = "zfs_fs"; mountpoint = "/tank/media"; };
        "media/shows" = { type = "zfs_fs"; mountpoint = "/tank/media/shows"; };
        "media/movies" = { type = "zfs_fs"; mountpoint = "/tank/media/movies"; };
        "media/books" = { type = "zfs_fs"; mountpoint = "/tank/media/books"; };
        "media/music" = { type = "zfs_fs"; mountpoint = "/tank/media/music"; };
        "photos" = { type = "zfs_fs"; mountpoint = "/tank/photos"; };
        "apps" = { type = "zfs_fs"; mountpoint = "/tank/apps"; };
        "apps/jellyfin" = { type = "zfs_fs"; mountpoint = "/tank/apps/jellyfin"; };
        "apps/radarr" = { type = "zfs_fs"; mountpoint = "/tank/apps/radarr"; };
        "apps/sonarr" = { type = "zfs_fs"; mountpoint = "/tank/apps/sonarr"; };
        "apps/vaultwarden" = { type = "zfs_fs"; mountpoint = "/tank/apps/vaultwarden"; };
        "apps/immich" = { type = "zfs_fs"; mountpoint = "/tank/apps/immich"; };
        "apps/jellyseerr" = { type = "zfs_fs"; mountpoint = "/tank/apps/jellyseerr"; };
      };
    };
  };
}
