```bash
sudo nix --extra-experimental-features 'nix-command flakes' \
  run github:nix-community/disko -- \
  --mode disko /etc/nixos/modules/storage/disko.nix
```
