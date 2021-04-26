{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim
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
