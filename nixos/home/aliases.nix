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

    		pwntime() {
    		  pwninit "$@"

    		  local patched_bin
    		  patched_bin=$(ls -t *_patched 2>/dev/null | head -n 1)

    		  if [ -z "$patched_bin" ]; then
    		    echo "[-] No patched binary found... maybe pwninit failed?"
    		    return 1
    		  fi
    		  
    		  local orig_bin="''${patched_bin%_patched}"

    		  if [ -f "$orig_bin" ]; then
    		    mv "$orig_bin" "''${orig_bin}.old"
    		    mv "$patched_bin" "$orig_bin"
    		    echo "[+] Successfully renamed $orig_bin to ''${orig_bin}.old"
    		    echo "[+] Successfully replaced $orig_bin with patched ver"
    		  else
    		    echo "[-] Original binary $orig_bin not found to rename."
    		  fi
    		}
    	'';
}
