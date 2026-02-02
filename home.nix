{ lib, pkgs, ... }: {
  home = {
    username = "marco";
    homeDirectory = "/home/marco";

    packages = with pkgs; [
      cowsay
    ];

    programs.bash.shellAliases = {
        ll = "ls -la";
    };

    stateVersion = "25.11";
  };
}
