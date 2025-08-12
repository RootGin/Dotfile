{ theme, ... }:

{
  programs.btop.themes = {
    Nord = ''
      # Main background, empty for terminal default (Nord #2e3440)
      theme[main_bg]="${theme.colorScheme.background1Hex}"

      # Main text color
      theme[main_fg]="${theme.colorScheme.foreground3Hex}"

      # Title color for boxes
      theme[title]="${theme.colorScheme.foreground3Hex}"

      # Highlight color for keyboard shortcuts
      theme[hi_fg]="${theme.colorScheme.cyanHex}"

      # Background color of selected item in processes box
      theme[selected_bg]="${theme.colorScheme.background2Hex}"

      # Foreground color of selected item in processes box
      theme[selected_fg]="${theme.colorScheme.cyanHex}"

      # Color of inactive/disabled text
      theme[inactive_fg]="${theme.colorScheme.foreground4Hex}"

      # Color of text appearing on top of graphs
      theme[graph_text]="${theme.colorScheme.foreground3Hex}"

      # Background color of the percentage meters
      theme[meter_bg]="${theme.colorScheme.background2Hex}"

      # Misc colors for processes box
      theme[proc_misc]="${theme.colorScheme.foreground3Hex}"

      # Box outline colors
      theme[cpu_box]="${theme.colorScheme.blueHex}"
      theme[mem_box]="${theme.colorScheme.greenHex}"
      theme[net_box]="${theme.colorScheme.redHex}"
      theme[proc_box]="${theme.colorScheme.cyanHex}"

      # Box divider line and small boxes line color
      theme[div_line]="${theme.colorScheme.background2Hex}"

      # Temperature graph color
      theme[temp_start]="${theme.colorScheme.greenHex}"
      theme[temp_mid]="${theme.colorScheme.yellowHex}"
      theme[temp_end]="${theme.colorScheme.redHex}"

      # CPU graph colors
      theme[cpu_start]="${theme.colorScheme.blueHex}"
      theme[cpu_mid]="${theme.colorScheme.cyanHex}"
      theme[cpu_end]="${theme.colorScheme.foreground4Hex}"

      # Mem/Disk free meter
      theme[available_start]="${theme.colorScheme.yellowHex}"
      theme[available_mid]="${theme.colorScheme.orangeHex}"
      theme[available_end]="${theme.colorScheme.redHex}"

      # Mem/Disk cached meter
      theme[cached_start]="${theme.colorScheme.cyanHex}"
      theme[cached_mid]="${theme.colorScheme.blueHex}"
      theme[cached_end]="${theme.colorScheme.foreground4Hex}"

      # Mem/Disk used meter
      theme[used_start]="${theme.colorScheme.greenHex}"
      theme[used_mid]="${theme.colorScheme.blueHex}"
      theme[used_end]="${theme.colorScheme.foreground4Hex}"

      # Download graph colors
      theme[download_start]="${theme.colorScheme.yellowHex}"
      theme[download_mid]="${theme.colorScheme.orangeHex}"
      theme[download_end]="${theme.colorScheme.redHex}"

      # Upload graph colors
      theme[upload_start]="${theme.colorScheme.greenHex}"
      theme[upload_mid]="${theme.colorScheme.cyanHex}"
      theme[upload_end]="${theme.colorScheme.blueHex}"

      # Process box color gradient for threads, mem and cpu usage
      theme[process_start]="${theme.colorScheme.cyanHex}"
      theme[process_mid]="${theme.colorScheme.blueHex}"
      theme[process_end]="${theme.colorScheme.foreground4Hex}"
    '';
  };
}
