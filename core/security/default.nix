{ config, pkgs, ... }:

{
  security.pam.services.login.fprintAuth = false;
}