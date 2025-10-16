{ config, lib, pkgs, ... }:

{
  services.jellyfin = {
    enable = true;
  };

  # Jellyfin listens on 8096 by default; keep it local via Caddy frontend.
  networking.firewall.allowedTCPPorts = lib.mkForce [ 22 80 443 ];
}
