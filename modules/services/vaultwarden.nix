{ config, lib, pkgs, domain, ... }:

{
  systemd.tmpfiles.rules = [
    "d /var/lib/secrets 0750 root root - -"
  ];

  services.vaultwarden = {
    enable = true;
    # Use environment-like config via Nix options where possible
    config = {
      ROCKET_ADDRESS = "127.0.0.1";
      ROCKET_PORT = 8222;
      DOMAIN = "https://vault.${domain}";
      SIGNUPS_ALLOWED = false;
      ADMIN_TOKEN_FILE = "/var/lib/secrets/vaultwarden-admin-token";
    };
    # Database: built-in sqlite by default
    backupDir = "/var/backup/vaultwarden";
  };
}
