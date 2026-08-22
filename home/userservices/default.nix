{ pkgs, ... }:

{
  systemd.user.services.easyeffects = {
  Unit = {
    Description = "EasyEffects";
    After = [ "pipewire.service" ];
    Requires = [ "pipewire.service" ];
  };

  Service = {
    Type = "simple";

    # Wait 5 seconds before starting EasyEffects
    ExecStartPre = "${pkgs.coreutils}/bin/sleep 5";

    ExecStart = "${pkgs.easyeffects}/bin/easyeffects --service-mode --hide-window";
    ExecStop = "${pkgs.easyeffects}/bin/easyeffects --quit";

    Restart = "on-failure";
  };

  Install = {
    WantedBy = [ "default.target" ];
  };
};
}