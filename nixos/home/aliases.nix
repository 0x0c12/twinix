{ config, ... }:

{
  home.shellAliases = {
    edh = "pushd '${config.home.homeDirectory}/twinix/nixos/home/' && hx . && popd";
    eds = "pushd '${config.home.homeDirectory}/twinix/nixos/' && hx configuration.nix && popd";
  };

  programs.bash.initExtra = ''
    		hmb() {
    			echo "Starting Home Manager switch..."
    			pushd ${config.home.homeDirectory}/twinix
    			git add .
    			home-manager switch --flake .#${config.home.username}
    			popd 
    			echo "Done!"
    		}

    		sysb() {
    			echo "Rebuilding NixOS system..."
    			pushd ${config.home.homeDirectory}/twinix
    			git add .
    			sudo nixos-rebuild switch --flake .#twinix
    			popd
    			echo "Done!"
    		}
    	'';
}
