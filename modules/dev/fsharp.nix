{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    unstable.dotnet-sdk_5
    unstable.jetbrains.rider
    pkgs.nodejs
    openssl
  ];

  environment.sessionVariables = with pkgs; {
    DOTNET_ROOT="${dotnet-sdk_5}";
    DOTNET_CLI_TELEMETRY_OPTOUT="1";
  };
}
