{ config, pkgs, ... }:
{
  imports = [
    # ./modules/waybar.nix
    # ./modules/hyprland.nix
  ];
  nixpkgs.config = {
    allowUnfree = true;
  };
  # ${pkgs.swww}/bin/swww img ${./Pictures/aesthetic-wallpapers/images/art-lake.png} &
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "jack";
  home.homeDirectory = "/home/jack";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.htop
    pkgs.neofetch
    pkgs.eza
    pkgs.zoxide
    pkgs.obsidian
    pkgs.keychain
    pkgs.oh-my-zsh
    pkgs.dunst
    pkgs.fuzzel
    pkgs.waybar
    pkgs.swww
    pkgs.discord
    pkgs.spotify
    pkgs.xfce.thunar
    pkgs.pavucontrol
    pkgs.catppuccin-gtk
    pkgs.google-chrome
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "JetBrainsMono"]; })
    pkgs.go
    pkgs.odin
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".zshrc".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/.zshrc_laptop";
    ".config/alacritty".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/.config/alacritty";
    ".config/waybar".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/.config/waybar";
    ".config/hypr".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/.config/hypr";
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/jack/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "neovim";
  };

  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  catppuccin.flavor = "mocha";

  gtk = {
    enable = true;
    catppuccin.enable = true;

    # iconTheme = {
    #   package = pkgs.gnome.adwaita-icon-theme;
    #   name = "Adwaita";
    # };

    font = {
      name = "Sans";
      size = 11;
    };
  };

  fonts.fontconfig.enable = true;

  programs.git = {
    enable = true;
    userName = "jamibu";
    userEmail = "bucher.codes@gmail.com";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
