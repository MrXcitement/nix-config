{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "mike";
  home.homeDirectory = "/home/mike";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  # git config
  programs.git = {
    enable = true;
    userName = "Mike Barker";
    userEmail = "mike@thebarkers.com";
    extraConfig = {
      init = { 
        defaultBranch = "main";
      };
    };
  };
  # vim config
  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      vim-airline
    ];
    extraConfig = ''
      set number
      set relativenumber
      '';
  };
  # VS Code and use extensions without additional config
  # https://nixos.wiki/wiki/Visual_Studio_Code#Use_VS_Code_extensions_without_additional_configuration
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhs;
  };
}
