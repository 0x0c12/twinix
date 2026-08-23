# Setup instructions

just do a simple

```sh
git clone https://github.com/0x0c12/twinix ~/twinix
```

it doesn't HAVE to be ur home directory tbh

also I haven't included the config files for git and hardware because:
- i genuinely cannot guess ur hardware and partition configs and ur partition UUIDs(so don't blame me for a broken system)
- the git.nix file contains sm personal info

anyway, to generate hardware do this

```sh
nixos-generate-config --show-hardware-config > ~/twinix/nixos/hardware-configuration.nix
```

and as for your git config just do this:

```sh
cat > ~/twinix/nixos/home/git.nix << "EOF"
{ config, pkgs, ... }:

{
    programs.git = {
        enable = true;
    };
}
EOF
```

you may have to bootstrap home-manager as well


```sh
nix run github:nix-community/home-manager -- switch --flake .#twilight
```

-# Note that you only need to run this ONCE, then you can just use home-manager
-# simply as given below

```sh
home-manager switch --flake .#twilight
```

# Actually configuring it yourself

If you wanted to add some packages to home manager, just add a program in the
program.nix

If you want to add something configurable, create a new nix file, import it into home.nix and then configure it yourself.

I didn't really modularise the system configuration(which I tbh should), but I am WAY too lazy for that
