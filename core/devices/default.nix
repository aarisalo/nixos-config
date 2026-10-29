{ config, pkgs, ... }:

{
  hardware.logitech.wireless.enable = true;

  # Keychron keyboards need user access to their hidraw devices for the
  # web launcher (WebHID) to connect, e.g. K2 HE. See
  # https://launcher.keychron.com
  services.udev.extraRules = ''
    KERNEL=="hidraw*", ATTRS{idVendor}=="3434", MODE="0660", GROUP="input"
  '' ;
}