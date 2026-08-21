{ config, pkgs, ... }:
  
{
  fileSystems."/mnt/bulkstorage" = {
    device = "/dev/disk/by-uuid/9966e65f-6621-40e6-a225-bc8e0924af88";
    fsType = "ext4";
    options = [ "nofail" ];
  };
}