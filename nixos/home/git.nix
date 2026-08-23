{ config, pkgs, ... }:

{
	programs.git = {
		enable = true;		
		settings = {
			user = {
				name = "0x0c12";
				email = "atharv.batra@outlook.com";
			};
		init.defaultBranch = "main";
		};	
	};

	services.ssh-agent.enable = true;
}
