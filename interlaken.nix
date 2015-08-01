# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./interlaken-hardware-configuration.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda";

  networking.hostName = "interlaken"; # Define your hostname.
  networking.hostId = "453986ff";
  # networking.wireless.enable = true;  # Enables wireless.

  # Select internationalisation properties.
  i18n = {
    consoleFont = "lat9w-16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  # environment.systemPackages = with pkgs; [
  #   wget
  # ];

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable the KDE Desktop Environment.
  # services.xserver.displayManager.kdm.enable = true;
  # services.xserver.desktopManager.kde4.enable = true;

  security.sudo.wheelNeedsPassword = false;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.luke = {
    isNormalUser = true;
    uid = 1000;
    description = "Luke Gorrie";
    extraGroups = [ "wheel" "networkmanager" ];
    openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC4r6GXZXtq57aqnASJdyLlcmImJFhL12oElwTixUkerB/WMyJO5DWjJd0WKYFPl/BhLQWD3/LFUOyiHYjzWSa9rhO6jc9Ly9Di8/kSulEbf/907TydL04zzhYPd/UQdC3qWixX9Nml5g0CjiBiq3XArJBVcaw4ykZbnL2UOFYrBPiEYpREtjLPHOfLbHl1ZIMSJ1vmSyXRtkY74+hclf6nLBU5FYzVDxSyZZ5fwEqA0f+y47ejcKHlJW2FL8uE8Rh1obAc7pYFsa/xXWOSM8F7bXbVn4ktV/mXA8rMpy1LIG6giC0v+1lFYhKh8trFhYf37xE/mZNmzDC4NkdfolXx" ];
  };

  users.extraUsers.javier = {
    isNormalUser = true;
    uid = 1001;
    description = "Javier Guerra";
    extraGroups = [ "wheel" "networkmanager" ];
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCxOGl1egCc4VvuMyoNpgj2v723aVD2kIW8XplbDQdMUscaJxNN7jNL2Vxe75iWMxnzTw/vQ70H++RCizSZplK95q0A3i7CC33TXMwfvI1eM4x0V/WxyXDrFOVNlFghb38ROF95c+4q9MLCXtxlqwcQ1Xq2+twQ/lrYoPNXjgOfFJogu7fETOURiqfgw2ChohGcf1w6NZb6OFd/XBavqiNso8ZdeKQnNBYOHrp4cpoGfZ0iUf1cc0jc/wUHEZGZZWCTK660uPXjvkxEdewaaZCHhhrQPqUUErLWSZizo6Y1YTBVAMjKKI6gdcpJbKgp1cxZM1YWDKmUI/z6kQghmVe/ javier@remanta",
      "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAIEAw3jTiDO6z93QcKEXEaUF8eIG1qcnPVA2nyodXIMzzyG6AIW9ydNi2H/vZ8RNb1EUZOusi3NNVmEEe3D/NXlaXLrmHouCkWbq0zsAbix0vSEdbGAvPOVTtchN+jiRU/sVtdcs3dD2cPYiayTwXpSDkZrd/cho9U52qgaVNvwwUik= javier@chusma"
    ];
  };

}
