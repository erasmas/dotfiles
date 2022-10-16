{ pkgs, ... }:
{
  services.nextcloud = {
    enable = true;
    hostName = "nextcloud.tld";
    config = {
      dbtype = "pgsql";
      dbuser = "nextcloud";
      dbhost = "/run/postgresql";
      dbname = "nextcloud";
      adminpassFile = "/var/nextcloud/nextcloud-admin-pass";
      adminuser = "admin";
    };
  };

  services.postgresql = {
    enable = true;
    ensureDatabases = [ "nextcloud" ];
    ensureUsers = [
     { name = "nextcloud";
       ensurePermissions."DATABASE nextcloud" = "ALL PRIVILEGES";
     }
    ];
  };

  # ensure that postgres is running *before* running the setup
  systemd.services."nextcloud-setup" = {
    requires = ["postgresql.service"];
    after = ["postgresql.service"];
  };

  networking.firewall.allowedTCPPorts = [ 80 443 ];
}
