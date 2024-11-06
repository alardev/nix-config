# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "com/mattjakeman/ExtensionManager" = {
      height = 1169;
      last-used-version = "0.5.1";
      width = 1010;
    };

    "org/gnome/Console" = {
      last-window-maximised = false;
      last-window-size = mkTuple [
        1369
        763
      ];
    };

    "org/gnome/Weather" = {
      window-height = 496;
      window-maximized = false;
      window-width = 992;
    };

    "org/gnome/control-center" = {
      last-panel = "color";
      window-state = mkTuple [
        1536
        906
        false
      ];
    };

    "org/gnome/desktop/a11y" = {
      always-show-universal-access-status = true;
    };

    "org/gnome/desktop/app-folders" = {
      folder-children = [
        "Utilities"
        "YaST"
        "Pardus"
      ];
    };

    "org/gnome/desktop/app-folders/folders/Pardus" = {
      categories = [ "X-Pardus-Apps" ];
      name = "X-Pardus-Apps.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/Utilities" = {
      apps = [
        "gnome-abrt.desktop"
        "gnome-system-log.desktop"
        "nm-connection-editor.desktop"
        "org.gnome.baobab.desktop"
        "org.gnome.Connections.desktop"
        "org.gnome.DejaDup.desktop"
        "org.gnome.Dictionary.desktop"
        "org.gnome.DiskUtility.desktop"
        "org.gnome.Evince.desktop"
        "org.gnome.FileRoller.desktop"
        "org.gnome.fonts.desktop"
        "org.gnome.Loupe.desktop"
        "org.gnome.seahorse.Application.desktop"
        "org.gnome.tweaks.desktop"
        "org.gnome.Usage.desktop"
        "vinagre.desktop"
      ];
      categories = [ "X-GNOME-Utilities" ];
      name = "X-GNOME-Utilities.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/YaST" = {
      categories = [ "X-SuSE-YaST" ];
      name = "suse-yast.directory";
      translate = true;
    };

    "org/gnome/desktop/background" = {
      color-shading-type = "solid";
      picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/blobs-l.svg";
      picture-uri-dark = "file:///run/current-system/sw/share/backgrounds/gnome/blobs-d.svg";
      primary-color = "#241f31";
      secondary-color = "#000000";
    };

    "org/gnome/desktop/datetime" = {
      automatic-timezone = true;
    };

    "org/gnome/desktop/input-sources" = {
      sources = [
        (mkTuple [
          "xkb"
          "ua+phonetic"
        ])
        (mkTuple [
          "xkb"
          "us"
        ])
        (mkTuple [
          "xkb"
          "ee"
        ])
        (mkTuple [
          "xkb"
          "ru+phonetic"
        ])
      ];
      xkb-options = [ "terminate:ctrl_alt_bksp" ];
    };

    "org/gnome/desktop/interface" = {
      accent-color = "purple";
      clock-format = "24h";
      clock-show-seconds = true;
      clock-show-weekday = true;
      color-scheme = "prefer-dark";
      show-battery-percentage = true;
    };

    "org/gnome/desktop/media-handling" = {
      automount = false;
      automount-open = false;
      autorun-never = true;
    };

    "org/gnome/desktop/notifications" = {
      application-children = [
        "org-gnome-console"
        "gnome-power-panel"
        "firefox-devedition"
        "org-gnome-software"
        "org-telegram-desktop"
      ];
    };

    "org/gnome/desktop/notifications/application/firefox-devedition" = {
      application-id = "firefox-devedition.desktop";
      force-expanded = true;
    };

    "org/gnome/desktop/notifications/application/gnome-power-panel" = {
      application-id = "gnome-power-panel.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-console" = {
      application-id = "org.gnome.Console.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-software" = {
      application-id = "org.gnome.Software.desktop";
    };

    "org/gnome/desktop/notifications/application/org-telegram-desktop" = {
      application-id = "org.telegram.desktop.desktop";
    };

    "org/gnome/desktop/peripherals/keyboard" = {
      numlock-state = false;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/screensaver" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/blobs-l.svg";
      primary-color = "#241f31";
      secondary-color = "#000000";
    };

    "org/gnome/desktop/session" = {
      idle-delay = mkUint32 900;
    };

    "org/gnome/desktop/sound" = {
      event-sounds = false;
    };

    "org/gnome/evolution-data-server" = {
      migrated = true;
    };

    "org/gnome/gnome-system-monitor" = {
      show-dependencies = true;
    };

    "org/gnome/mutter" = {
      dynamic-workspaces = true;
      edge-tiling = true;
      experimental-features = [ "variable-refresh-rate" ];
    };

    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "list-view";
      migrated-gtk-settings = true;
      search-filter-time-type = "last_modified";
    };

    "org/gnome/nautilus/window-state" = {
      initial-size = mkTuple [
        1267
        838
      ];
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
      night-light-schedule-automatic = false;
    };

    "org/gnome/settings-daemon/plugins/power" = {
      sleep-inactive-ac-type = "nothing";
      sleep-inactive-battery-timeout = 1800;
    };

    "org/gnome/shell" = {
      disabled-extensions = [ "places-menu@gnome-shell-extensions.gcampax.github.com" ];
      enabled-extensions = [
        "drive-menu@gnome-shell-extensions.gcampax.github.com"
        "freon@UshakovVasilii_Github.yahoo.com"
        "weatherornot@somepaulo.github.io"
      ];
      favorite-apps = [
        "org.telegram.desktop.desktop"
        "Alacritty.desktop"
        "firefox-devedition.desktop"
        "org.gnome.Nautilus.desktop"
        "org.gnome.Software.desktop"
        "org.gnome.Settings.desktop"
      ];
      last-selected-power-profile = "power-saver";
      welcome-dialog-last-shown-version = "45.4";
    };

    "org/gnome/shell/extensions/display-brightness-ddcutil" = {
      ddcutil-binary-path = "/etc/profiles/per-user/will/bin/ddcutil";
      show-value-label = true;
    };

    "org/gnome/shell/extensions/nightthemeswitcher/gtk-variants" = {
      enabled = true;
    };

    "org/gnome/shell/extensions/nightthemeswitcher/time" = {
      always-enable-ondemand = true;
      manual-schedule = false;
      nightlight-follow-disable = true;
    };

    "org/gnome/shell/extensions/openweatherrefined" = {
      has-run = true;
      weather-provider = "openweathermap";
    };

    "org/gnome/shell/extensions/weatherornot" = {
      position = "clock-left";
    };

    "org/gnome/shell/weather" = {
      automatic-location = true;
    };

    "org/gnome/shell/world-clocks" = {
      locations = [ ];
    };

    "org/gnome/software" = {
      check-timestamp = mkInt64 1730729853;
      first-run = false;
      flatpak-purge-timestamp = mkInt64 1730740750;
    };

    "org/gnome/system/location" = {
      enabled = true;
    };

    "org/gtk/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = false;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 170;
      sort-column = "name";
      sort-directories-first = false;
      sort-order = "ascending";
      type-format = "category";
      window-position = mkTuple [
        26
        23
      ];
      window-size = mkTuple [
        1231
        902
      ];
    };

    "system/locale" = {
      region = "en_IE.UTF-8";
    };

  };
}
