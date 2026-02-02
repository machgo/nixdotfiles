{ lib, pkgs, ... }: {
  home = {
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

    stateVersion = "25.11";
  };
}
