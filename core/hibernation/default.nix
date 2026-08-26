{
  boot.kernelParams = ["resume_offset=40085504"];
  boot.resumeDevice = "/dev/disk/by-uuid/68a1c4e0-42b3-47c6-836a-a479d79b6805";

  powerManagement.enable = true;

  services.power-profiles-daemon.enable = true;
  services.logind.settings.Login.PowerKey  ="hibernate";
  services.logind.settings.Login.PowerKeyLongPress = "poweroff";
}