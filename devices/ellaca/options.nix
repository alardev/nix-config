{ ... }: {
  full = true;

  withAudio = true;
  withBluetooth = true;

  withNiri = true;
  withGnome = false;
  withPlasma = false;

  withVM = false;
  withContainers = true;
  withGames = true;

  hwmonPath = "/sys/class/hwmon/hwmon1/temp1_input";
}
