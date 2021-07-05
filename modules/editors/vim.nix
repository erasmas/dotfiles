{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    unstable.neovim
  ];

  nixpkgs.overlays = [
    (self: super: {
      neovim = super.neovim.override {
        viAlias = true;
        vimAlias = true;
      };
    })
  ];
}
