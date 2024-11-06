{ pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      #      window = {
      #        decorations = "none";
      #        dynamic_padding = true;
      #        padding = {
      #          x = 20;
      #          y = 20;
      #        };
      #        startup_mode = "Windowed";
      #      };

      scrolling.history = 10000;
      selection.save_to_clipboard = true;

      #      font = {
      #        normal.family = "JetBrains Mono";
      #        bold.family = "JetBrains Mono";
      #        italic.family = "JetBrains Mono";
      #        size = 10;
      #      };

      #      draw_bold_text_with_bright_colors = true;
      window.opacity = 0.9;

      keyboard.bindings = [
        {
          action = "Copy";
          key = "C";
          mods = "Control|Shift";
        }
        {
          action = "Paste";
          key = "V";
          mods = "Control|Shift";
        }
        {
          action = "ClearSelection";
          key = "C";
          mode = "Vi";
          mods = "Control";
        }
      ];

      mouse.bindings = [
        {
          action = "Paste";
          mouse = "Right";
        }
      ];

      #      imports = [
      #        (pkgs.fetchurl {
      #          url = "https://raw.githubusercontent.com/dracula/alacritty/9ae0fdedd423803f0401f6e7a23cd2bb88c175b2/dracula.toml";
      #          hash = "sha256-6d46eSVIyBEhaMHdGLVlHR6+4ok5dc2kzNnEwEMMh7g=";
      #        })
      #      ];
    };
  };
}
