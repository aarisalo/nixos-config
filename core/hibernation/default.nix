{
  # resume_offset = byte offset of /var/lib/swapfile on the root partition,
  # in 4096-byte sectors. It is a literal kernel parameter; NixOS cannot
  # compute it at build time. The swapfile is (re)created by `swapDevices`
  # in core/swap, so if it is ever recreated/moved or the root partition
  # changes, this value becomes stale and hibernate-resume silently fails.
  # Regenerate it with:
  #   sudo sh -c 'echo resume_offset=$(( $(sudo filefrag -v /var/lib/swapfile | awk "/^0:/ {print \\$2}") / 4096 ))'
  # and verify it still matches the running kernel parameter afterwards.
  boot.kernelParams = ["resume_offset=40085504"];
  boot.resumeDevice = "/dev/disk/by-uuid/68a1c4e0-42b3-47c6-836a-a479d79b6805";

  powerManagement.enable = true;

  services.power-profiles-daemon.enable = true;
  services.logind.settings.Login.PowerKey  ="hibernate";
  services.logind.settings.Login.PowerKeyLongPress = "poweroff";
}