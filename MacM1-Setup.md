## Links for reference guide:
### Setup: https://github.com/renzwo/cardano-plutus-apps-install-m1/blob/main/README.md
### Uninstall: https://iohk.zendesk.com/hc/en-us/articles/4415830650265-Uninstall-nix-on-MacOS

## Setting up
1 download the nix package manager and install it
```console
sh <(curl -L https://nixos.org/nix/install) --darwin-use-unencrypted-nix-store-volume
```
2 restart terminal

3 open the nix config file
```console
sudo nano /etc/nix/nix.conf
```
4 be sure these lines are all inside the file
```console
build-users-group = nixbld

substituters        = https://hydra.iohk.io https://iohk.cachix.org https://cache.nixos.org/
trusted-public-keys = hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ= iohk.cachix.org-1:DpRUyj7h7V830dp/i6Nti+NEO2/nhblbov/8MW7Rqoo= cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=

system = x86_64-darwin
extra-platforms = x86_64-darwin aarch64-darwin

sandbox = false
extra-sandbox-paths = /System/Library/Frameworks /System/Library/PrivateFrameworks /usr/lib /private/tmp /private/var/tmp /usr/bin/env
experimental-features = nix-command
extra-experimental-features = flakes
```
5 restart mac

## Uninstalling
