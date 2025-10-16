{ config, lib, pkgs, ... }:

{
  users.groups.media = { };

  users.users.jellyfin.extraGroups = [ "media" ];
  users.users.radarr.extraGroups = [ "media" ];
  users.users.sonarr.extraGroups = [ "media" ];
  users.users.vaultwarden.extraGroups = [ "media" ];
  users.users.immich.extraGroups = [ "media" ];
  users.users.jellyseerr.extraGroups = [ "media" ];

  # Ensure critical directories exist with media ownership
  systemd.tmpfiles.rules = [
    "d /tank/media 2775 root media - -"
    "d /tank/media/shows 2775 root media - -"
    "d /tank/media/movies 2775 root media - -"
    "d /tank/media/books 2775 root media - -"
    "d /tank/media/music 2775 root media - -"
    "d /tank/photos 2775 root media - -"
    "d /tank/apps 2775 root media - -"
    "d /tank/apps/jellyfin 2775 root media - -"
    "d /tank/apps/radarr 2775 root media - -"
    "d /tank/apps/sonarr 2775 root media - -"
    "d /tank/apps/vaultwarden 2775 root media - -"
    "d /tank/apps/immich 2775 root media - -"
    "d /tank/apps/jellyseerr 2775 root media - -"
  ];
}
