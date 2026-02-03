{ config, pkgs, ... }:

{
    home.username = "marco";
    home.homeDirectory = "/home/marco";

    home.packages = with pkgs; [
      cowsay
    ];

    programs.bash.enable = true;
    programs.bash.shellAliases = {
        ll = "ls -la";
    };

    home.file.".config/blubb/blubb.conf".text = ''
        Bla
        Blubb
        Bla
        Bla2
    '';

    home.file.".config/blubb/blubb2.conf".source = ./blubb2.conf;

    home.stateVersion = "25.11";
}
