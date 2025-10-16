{ config, lib, pkgs, domain, acmeEmail, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/storage/disko.nix
    ../../modules/storage/zfs.nix
    ../../modules/network/caddy.nix
    ../../modules/services/jellyfin.nix
    ../../modules/services/arr.nix
    ../../modules/services/vaultwarden.nix
    ../../modules/services/immich.nix
    ../../modules/services/jellyseerr.nix
    ../../modules/users/media.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "phoenix";
  time.timeZone = "UTC";
  i18n.defaultLocale = "en_US.UTF-8";

  users.users.kara = {
    isNormalUser = true;
    description = "Kara Wilson";
    extraGroups = [ "wheel" "media" ];
    openssh.authorizedKeys.keys = [ ];
  };

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
      X11Forwarding = false;
    };
  };

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 80 443 ];
  };

  services.fail2ban = {
    enable = true;
    banaction = "nftables-multiport";
    ignoreIP = [ "127.0.0.1/8" "::1" ];
    bantime = "1h";
    findtime = "10m";
    maxretry = 5;
    jails = {
      sshd = ''
        enabled = true
        backend = systemd
        port = ssh
        journalmatch = _SYSTEMD_UNIT=sshd.service
      '';
    };
  };

  system.stateVersion = "24.11";
}
