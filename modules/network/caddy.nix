{ config, lib, pkgs, domain, acmeEmail, ... }:

{
  services.caddy = {
    enable = true;
    email = acmeEmail;
    virtualHosts = {
      "jellyfin.${domain}".extraConfig = ''
        encode zstd gzip
        reverse_proxy 127.0.0.1:8096
      '';
      "seerr.${domain}".extraConfig = ''
        encode zstd gzip
        reverse_proxy 127.0.0.1:5055
      '';
      "jellyseerr.${domain}".extraConfig = ''
        encode zstd gzip
        reverse_proxy 127.0.0.1:5055
      '';
      "immich.${domain}".extraConfig = ''
        encode zstd gzip
        reverse_proxy 127.0.0.1:2283
      '';
      "radarr.${domain}".extraConfig = ''
        encode zstd gzip
        reverse_proxy 127.0.0.1:7878
      '';
      "sonarr.${domain}".extraConfig = ''
        encode zstd gzip
        reverse_proxy 127.0.0.1:8989
      '';
      "vault.${domain}".extraConfig = ''
        encode zstd gzip
        reverse_proxy 127.0.0.1:8222
      '';
    };
  };
}
