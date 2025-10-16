{
  description = "Kara's NixOS media server";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    disko.url = "github:nix-community/disko";
  };

  outputs = { self, nixpkgs, disko }: {
    nixosConfigurations.phoenix = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        disko.nixosModules.disko
        ./hosts/phoenix/configuration.nix
      ];
      specialArgs = {
        domain = "kmp3e.xyz";
        acmeEmail = "kara.wilson.2005.08@gmail.com";
      };
    };
  };
}
