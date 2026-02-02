{ config, pkgs, ... }:

{
    username = "marco";
    homeDirectory = "/home/marco";

    packages = with pkgs; [
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
    '';

    home.file.".config/blubb/blubb2.conf".source = ./blubb2.conf;

    home.stateVersion = "25.11";
}
