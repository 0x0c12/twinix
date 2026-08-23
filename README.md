# Setup instructions

just do a simple

```sh
git clone https://github.com/0x0c12/twinix ~/twinix
```

~~it doesn't HAVE to be ur home directory tbh~~

UPDATE: NOW, it does hahahaha(i hate myself)

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

ONE VERY IMPORTANT THING BTW, since I have decoupled the configurations for
config.nix and home-manager, you kinda have to run them separately if you modify any
now according to me this is nice, because my home user doesn't need to update system
packages everytime I change one line in the config file. Likewise, I don't have ot update my user data everytime I change something in config.

You do something like this

```sh
sudo nixos-rebuild switch --flake .#twinix
```

for system-wide

and

```sh
home-manager switch --flake .#twilight
```

for user-specific

# File structure

```
.
├── flake.lock
├── flake.nix
├── nixos
│   ├── configuration.nix
│   ├── hardware-configuration.nix
│   └── home
│       ├── fonts.nix
│       ├── git.nix
│       ├── home.nix
│       ├── kitty.nix
│       ├── programs.nix
│       └── sway.nix
└── README.md
```

I just added this to flex the tree command which I found cool :3
