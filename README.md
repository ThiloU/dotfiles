# dotfiles
These are all the configuration files for my (OpenSuse Tumbleweed) system.

### Dependencies

###### Programs
- polybar
- rofi
- alacritty
- python3
- wmctrl
- nvidia-smi (comes with official nvidia drivers)
- htop
- xflock
- xfce4-session-logout
- systemctl
- xprop
- awesome

###### Fonts
The fonts can be installed by moving the font files to ~/.local/share/fonts/
- [Font Awesome v5](https://fontawesome.com/v5.15/how-to-use/on-the-desktop/setup/getting-started)

### Themes
These have to be applied in `xfce4-appearance-settings` (also in in `xfwm4-settings` if you are using xfwm4)
- [Nord (Atom, Alacritty, ...)](https://www.nordtheme.com/ports)
- [Firefox Theme](https://github.com/daaniiieel/nord-firefox)
- [xfce](https://www.xfce-look.org/p/1267246/) my modified version is found in ./themes


### Rofi
The /.config/rofi files are from [here](https://github.com/adi1090x/rofi).
Every configuration can be launched by running launch.sh in the appropriate directory  
(e.g. for the powermenu run `~/.config/rofi/powermenu/powermenu.sh`).


### Polybar
To run polybar, execute `~/.config/polybar/launch.sh`  
The GPU module works with the `nvidia-smi` command, so you need a Nvidia GPU to use that module.  
The code for the GPU, CPU, PulseAudio and openWindows modules is located in /.config/polybar/polybar-scripts/.  You can left-click on the GPU / CPU modules to open nvidia-smi / htop.  
The terminal these commands will get displayed in is alacritty, but this can be changed in the file /.config/polybar/modules.ini.  
The audio manager was made [here](https://github.com/marioortizmanero/polybar-pulseaudio-control) and the openWindows script was originally made [there](https://github.com/tam-carre/polywins).

### Picom
I am using a [custom picom fork](https://github.com/ibhagwan/picom) for dual_kawase blur and rounded window borders.
You may have to recompile it, but there is a precompiled binary in the ./picom folder.
Execute it using `~/.config/picom/ibhagwan-picom/picom --experimental-backends --xrender-sync-fence`.

### AwesomeWM

As a window manager I use AwesomeWM instead of the default xfwm4. To change the default window manager use these commands or follow [this](https://wiki.archlinux.org/title/xfce#Use_a_different_window_manager) guide.  
- `xfconf-query -c xfce4-session -p /sessions/Failsafe/Client0_Command -t string -sa xfsettingsd`  
- `xfconf-query -c xfce4-session -p /sessions/Failsafe/Client1_Command -t string -sa WM_NAME`  
(where you would replace WM_NAME with awesome)




