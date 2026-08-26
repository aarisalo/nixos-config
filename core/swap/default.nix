{
  swapDevices = [{
    device = "/var/lib/swapfile";
    size = 32 * 1024; # 32 GiB
  }];

  boot.zswap = {
    enable = true;
  };
}