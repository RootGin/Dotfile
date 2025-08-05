{ config, lib, pkgs, ... }:with lib;
let
  cfg = config.modules.hyprland;
  scriptsDir = "${config.xdg.configHome}/hypr/scripts";
  wallpaperDir = "${config.xdg.configHome}/home-manager/assets/wallpapers";
in {
  config = mkIf cfg.enable {
    home.file = {
      "${scriptsDir}/crop_wallpaper.py".text = ''
        import cv2
        import numpy as np
        import sys
        import os

        # Path to save cropped image
        output_path = sys.argv[2]

        # Load the image
        input_image_path = sys.argv[1]
        img = cv2.imread(input_image_path)

        if img is None:
            print(f"Error loading image: {input_image_path}")
            sys.exit(1)

        # Convert the image to grayscale (required for face detection)
        gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

        # Load pre-trained Haar Cascade Classifier for face detection
        face_cascade = cv2.CascadeClassifier(cv2.data.haarcascades + 'haarcascade_frontalface_default.xml')

        # Detect faces in the image
        faces = face_cascade.detectMultiScale(gray, scaleFactor=1.1, minNeighbors=5, minSize=(30, 30), flags=cv2.CASCADE_SCALE_IMAGE)

        if len(faces) == 0:
            print("No faces detected, cropping the center of the image")
            # If no faces detected, crop the center of the image
            height, width = img.shape[:2]
            center = (width // 2, height // 2)
            size = min(width, height)
            cropped_img = img[center[1] - size // 2:center[1] + size // 2, center[0] - size // 2:center[0] + size // 2]
        else:
            # Crop around the largest face
            x, y, w, h = max(faces, key=lambda rect: rect[2] * rect[3])  # Find the largest face by area
            cropped_img = img[y:y+h, x:x+w]

        # Save the cropped image
        cv2.imwrite(output_path, cropped_img)
        print(f"Cropped image saved to {output_path}")
      '';

      "${scriptsDir}/mpvpaper_slideshow.sh" = {
        text = ''
          #!/bin/bash
          set -euo pipefail

          wallpaperDirs=(
            "${wallpaperDir}/Characters"  # Direct path
            "${wallpaperDir}/Simplicity"   # Direct path
          )
          imageExts=("jpg" "jpeg" "png" "bmp" "gif")
          videoExts=("mp4" "mkv" "webm" "avi")

          videoWeight=60
          imageWeight=40

          if (( videoWeight + imageWeight != 100 )); then
            echo "ERROR: Weights don't add up to 100. Seriously, this sum gen Z shit." >&2
            exit 1
          fi

          separate_images=1
          separate_videos=0

          videoMute=0
          videoVolume=100

          transitionInterval=240

          scalingOptions="--panscan=1.0 --keepaspect"

          historyFile="/tmp/mpvpaper_history"
          pidFile="/tmp/mpvpaper_slideshow_pid"
          logFile="/tmp/mpvpaper_slideshow.log"

          log_message() {
              msg="$(date '+%Y-%m-%d %H:%M:%S') - $1"
              echo "$msg"
              echo "$msg" >> "$logFile"
          }

          nuke_all_mpvpaper() {
              log_message "Nuking ALL mpvpaper instances with killall."
              killall -q mpvpaper || true
              sleep 1
          }

          echo $$ > "$pidFile"
          log_message "Main script PID: $$"
          trap 'rm -f "$pidFile"; nuke_all_mpvpaper; exit' EXIT

          get_monitors() {
              monitors=()
              if command -v hyprctl >/dev/null 2>&1 && hyprctl -j monitors >/dev/null 2>&1; then
                  log_message "Using hyprctl for monitor detection."
                  monitors=( $(hyprctl -j monitors | jq -r '.[].name') )
              elif command -v wlr-randr >/dev/null 2>&1; then
                  log_message "Using wlr-randr for monitor detection."
                  while IFS= read -r line; do
                      monitor=$(echo "$line" | awk '{print $1}')
                      monitors+=("$monitor")
                  done < <(wlr-randr | grep -E '^\S')
              else
                  log_message "No supported monitor detection tool found. Install hyprctl (with jq) or wlr-randr."
                  exit 1
              fi

              if [[ ''${#monitors[@]} -eq 0 ]]; then
                  log_message "No monitors found. Fuck off."
                  exit 1
              fi
              log_message "Monitors detected: ''${monitors[*]}"
          }

          index_wallpapers() {
              videoFiles=()
              imageFiles=()
              for dir in "''${wallpaperDirs[@]}"; do
                  if [[ -d "$dir" ]]; then
                      for file in "$dir"/*; do
                          [[ -f "$file" ]] || continue
                          ext="''${file##*.}"
                          ext="''${ext,,}"
                          if [[ " ''${imageExts[*]} " =~ " $ext " ]]; then
                              imageFiles+=("$file")
                          elif [[ " ''${videoExts[*]} " =~ " $ext " ]]; then
                              videoFiles+=("$file")
                          else
                              log_message "Discarding unsupported file: $file"
                          fi
                      done
                  else
                      log_message "Directory not found: $dir"
                  fi
              done
              log_message "Indexed ''${#videoFiles[@]} videos and ''${#imageFiles[@]} images."
              if [[ ''${#videoFiles[@]} -eq 0 && ''${#imageFiles[@]} -eq 0 ]]; then
                  log_message "No valid wallpaper files found."
                  exit 1
              fi
          }

          pick_cycle() {
              totalWeight=$(( videoWeight + imageWeight ))
              rand=$(( RANDOM % totalWeight ))
              if [[ $rand -lt $videoWeight ]] && [[ ''${#videoFiles[@]} -gt 0 ]]; then
                  cycleType="video"
              elif [[ ''${#imageFiles[@]} -gt 0 ]]; then
                  cycleType="image"
              else
                  cycleType="video"
              fi

              cycle=()
              if [[ $cycleType == "image" ]]; then
                  if (( separate_images )); then
                      for (( i=0; i<''${#monitors[@]}; i++ )); do
                          idx=$(( RANDOM % ''${#imageFiles[@]} ))
                          cycle+=("''${imageFiles[$idx]}")
                      done
                  else
                      idx=$(( RANDOM % ''${#imageFiles[@]} ))
                      for (( i=0; i<''${#monitors[@]}; i++ )); do
                          cycle+=("''${imageFiles[$idx]}")
                      done
                  fi
              else
                  if (( separate_videos )); then
                      for (( i=0; i<''${#monitors[@]}; i++ )); do
                          idx=$(( RANDOM % ''${#videoFiles[@]} ))
                          cycle+=("''${videoFiles[$idx]}")
                      done
                  else
                      idx=$(( RANDOM % ''${#videoFiles[@]} ))
                      for (( i=0; i<''${#monitors[@]}; i++ )); do
                          cycle+=("''${videoFiles[$idx]}")
                      done
                  fi
              fi

              cycleRecord="$cycleType ''${cycle[*]}"
              echo "$cycleRecord" >> "$historyFile"
              currentCycle=$(wc -l < "$historyFile")
              log_message "Picked new cycle #$currentCycle of type $cycleType: ''${cycle[*]}"
          }

          display_cycle() {
              record=$(sed -n "''${currentCycle}p" "$historyFile")
              read -r cycleType rest <<< "$record"
              read -r -a wallpapers <<< "$rest"
              log_message "Displaying cycle #$currentCycle ($cycleType) on monitors: ''${monitors[*]}"

              old_pids=$(pgrep -x mpvpaper || true)
              log_message "Previous mpvpaper PIDs: $old_pids"

              declare -a new_pids
              for i in "''${!monitors[@]}"; do
                  monitor="''${monitors[$i]}"
                  wallpaper="''${wallpapers[$i]}"
                  if [[ $cycleType == "video" ]]; then
                      if (( videoMute )); then
                          mpv_options="no-audio --loop-playlist ''${scalingOptions}"
                      else
                          mpv_options="--loop-playlist --volume=''${videoVolume} ''${scalingOptions}"
                      fi
                      mpvpaper -f -o "$mpv_options" "$monitor" "$wallpaper" &
                  else
                      mpvpaper -f -n "$transitionInterval" -o "''${scalingOptions}" "$monitor" "$wallpaper" &
                  fi
                  new_pid=$!
                  new_pids+=($new_pid)
                  log_message "Launched mpvpaper on $monitor with PID $new_pid"
              done

              (
                  sleep 5
                  if [ -n "$old_pids" ]; then
                      log_message "Delayed termination of old PIDs: $old_pids"
                      for pid in $old_pids; do
                          if ps -p "$pid" > /dev/null; then
                              kill "$pid" 2>/dev/null && log_message "Killed PID $pid" || true
                          fi
                      done
                  fi
              ) &
              disown

              log_message "Scheduled old instance termination in 5 seconds"
          }

          next_cycle() {
              totalCycles=$(wc -l < "$historyFile")
              if (( currentCycle >= totalCycles )); then
                  pick_cycle
              else
                  currentCycle=$(( currentCycle + 1 ))
                  log_message "Moving forward to cycle #$currentCycle"
              fi
              display_cycle
          }

          previous_cycle() {
              if (( currentCycle > 1 )); then
                  currentCycle=$(( currentCycle - 1 ))
                  log_message "Moving backward to cycle #$currentCycle"
                  display_cycle
              else
                  log_message "Already at the first cycle; cannot go back."
              fi
          }

          trap 'log_message "SIGUSR1 caught - triggering next cycle"; next_cycle' SIGUSR1
          trap 'log_message "SIGUSR2 caught - triggering previous cycle"; previous_cycle' SIGUSR2

          sleep_with_signals() {
              local remaining=$1
              while (( remaining > 0 )); do
                  sleep 1 || true
                  (( remaining-- ))
              done
          }

          get_monitors
          index_wallpapers
          > "$historyFile"
          pick_cycle
          display_cycle

          while true; do
              log_message "Sleeping for $transitionInterval seconds before next cycle..."
              sleep_with_signals "$transitionInterval"
              next_cycle
          done
        '';
        executable = true;
      };

      "${scriptsDir}/restart_slideshow.sh" = {
        text = ''
          #!/bin/bash

          # Path to the original slideshow script
          SLIDESHOW_SCRIPT="$HOME/.config/hypr/scripts/slideshow.sh"

          # Check if the slideshow script is currently running
          if pgrep -f "$SLIDESHOW_SCRIPT" > /dev/null; then
              echo "Killing existing slideshow process..."
              pkill -f "$SLIDESHOW_SCRIPT"
          fi

          echo "Starting slideshow..."
          $SLIDESHOW_SCRIPT
        '';
        executable = true;
      };

      "${scriptsDir}/slideshow.sh" = {
        text = ''
          #!/bin/bash

          # Set the paths to both directories
          wallpapersDir1="${wallpaperDir}/Characters/"
          wallpapersDir2="${wallpaperDir}/Simplicity/"

          # Combine both directories into one array
          allWallpapers=("''${wallpapersDir1}"/* "''${wallpapersDir2}"/*)

          # Function to change the wallpaper
          change_wallpaper() {
              # Check if the wallpapers array is empty
              if [ ''${#allWallpapers[@]} -eq 0 ]; then
                  # Refill the array if empty
                  allWallpapers=("''${wallpapersDir1}"/* "''${wallpapersDir2}"/*)
              fi

              # Select a random wallpaper from the array
              wallpaperIndex=$(( RANDOM % ''${#allWallpapers[@]} ))
              selectedWallpaper="''${allWallpapers[$wallpaperIndex]}"

              # Apply the wallpaper
              swww img --fill-color "#2e3440" --transition-type grow --transition-pos 0.854,0.977 --transition-step 90 "$selectedWallpaper"
          }

          # Function to handle the skip signal
          skip_wallpaper() {
              pkill -USR1 -f "$0"
          }

          # Trap the USR1 signal to skip the wallpaper
          trap skip_wallpaper SIGUSR1

          # Infinite loop to change wallpaper every 5 minutes
          while true; do
              change_wallpaper
              sleep 1m &
              wait $!
          done
        '';
        executable = true;
      };

      "${scriptsDir}/trigger_next_wallpaper.sh" = {
        text = ''
          #!/bin/bash
          pidFile="/tmp/mpvpaper_slideshow_pid"

          if [[ -f "$pidFile" ]]; then
              kill -SIGUSR1 "$(cat "$pidFile")"
              echo "Triggered next wallpaper."
          else
              echo "Slideshow script not running. Start it first, dumbass."
          fi
        '';
        executable = true;
      };

      "${scriptsDir}/trigger_prev_wallpaper.sh" = {
        text = ''
          #!/bin/bash
          pidFile="/tmp/mpvpaper_slideshow_pid"

          if [[ -f "$pidFile" ]]; then
              kill -SIGUSR2 "$(cat "$pidFile")"
              echo "Triggered previous wallpaper."
          else
              echo "Slideshow script not running. Can't go back in time, genius."
          fi
        '';
        executable = true;
      };

      "${scriptsDir}/UpTime.sh" = {
        text = ''
          #!/usr/bin/env bash
          # Script parses /proc/uptime to get the system uptime
          # and prints it in a human-readable format
          # This is a workaround for system where `uptime` command is taken from coreutils
          # where `uptime -p` is not supported

          if [[ -r /proc/uptime ]]; then
              s=$(< /proc/uptime)
              s=''${s/.*}
          else
              echo "Error UptimeNixOS.sh: Uptime could not be determined." >&2
              exit 1
          fi

          d="$((s / 60 / 60 / 24)) days"
          h="$((s / 60 / 60 % 24)) hours"
          m="$((s / 60 % 60)) minutes"

          # Remove plural if < 2.
          ((''${d/ *} == 1)) && d=''${d/s}
          ((''${h/ *} == 1)) && h=''${h/s}
          ((''${m/ *} == 1)) && m=''${m/s}

          # Hide empty fields.
          ((''${d/ *} == 0)) && unset d
          ((''${h/ *} == 0)) && unset h
          ((''${m/ *} == 0)) && unset m

          uptime=''${d:+$d, }''${h:+$h, }$m
          uptime=''${uptime%', '}
          uptime=''${uptime:-$s seconds}

          echo "up $uptime"
        '';
        executable = true;
      };
    };
  };
}
