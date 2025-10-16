{ config, lib, pkgs, ... }:

{
  boot.supportedFilesystems = [ "zfs" ];

  services.zfs.autoScrub = {
    enable = true;
    interval = "weekly";
  };

  services.zfs.autoSnapshot = {
    enable = false; # think about this
    frequent = 24; # hourly, keep last 24
    daily = 7;
    weekly = 4;
    monthly = 3;
  };
}
