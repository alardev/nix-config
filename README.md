# Nixos template

This template gives you a good starting point for configuring Nixos with home-manager and no flakes.

## Configuring
edit the nixos/configuration.nix and home-manager/ files. After finalizing changes run:

```
sudo nixos-rebuild switch --upgrade -I nixos-config=path/to/configuration.nix
```

## Testing your new configuration

To test your configuration simply run the following command

```
nix run .
```
