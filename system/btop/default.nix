{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.btop-rocm
  ];

  # Fix for btop not showing cpu wattage
  systemd.tmpfiles.rules = [
    "Z /sys/class/powercap/intel-rapl:0/energy_uj 0444 root root - -"
  ];
}