{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    dotnet-sdk_5
    pkgs.nodejs
    openssl
  ];

  environment.sessionVariables = with pkgs; {
    DOTNET_ROOT="${dotnet-sdk_5}";
    DOTNET_CLI_TELEMETRY_OPTOUT="1";

    # This is a hack to help dotnet core to load libssl.
    # NixOS 21.05 uses openssl 1.1.
    # See: https://github.com/dotnet/runtime/issues/12747#issuecomment-495929002
    # Make sure that `openssl version` is 1.1
    CLR_OPENSSL_VERSION_OVERRIDE="1.1";
  };
}
