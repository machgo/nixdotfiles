{ config, pkgs, ... }:
let
    dotfiles = "${config.home.homeDirectory}/s/dotfiles";
    create_symlink = path: config.lib.file.mkOutOfStoreSymlink path; #alias for symlinks to write less in the bottom
in
{
    home.username = "marco";
    home.homeDirectory = "/home/marco";

    home.packages = with pkgs; [
      neovim
      ripgrep
      nil
      nixpkgs-fmt
      nodejs
      gcc
      git
      tmux
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

    home.file.".config/blubb/blubb2.conf".source = ./files/blubb2.conf;

    xdg.configFile."nvim" = {
        source = create_symlink "${dotfiles}/nvim/";
        recursive = true;
    };

    home.stateVersion = "25.11";
}
