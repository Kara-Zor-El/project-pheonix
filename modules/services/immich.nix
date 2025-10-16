{ config, lib, pkgs, ... }:

{
  services.immich = {
    enable = true;
    port = 2283;
    mediaLocation = "/tank/photos";
  };
}
