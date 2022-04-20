{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # unstable.dotnet-sdk
    unstable.jetbrains.rider
  ];

  # environment.sessionVariables = with pkgs; {
  #   DOTNET_ROOT="${dotnet-sdk}";
  #   DOTNET_CLI_TELEMETRY_OPTOUT="1";
  # };
}
