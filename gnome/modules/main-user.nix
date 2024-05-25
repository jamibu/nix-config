{ pkgs, lib, config, ... }:

let
  cfg = config.main-user;
in
{
  options = {
    main-user.enable = lib.mkEnableOption "enable user module";

    main-user.userName = lib.mkOption {
      default = "mainuser";
      description = ''
        username
      '';
    };
  };

  config = {
    users.users."main-user" = {
      isNormalUser = true;
      initialPassword = "12345";
      description = "main user";
      shell = pkgs.zsh;
    };
  };
}
