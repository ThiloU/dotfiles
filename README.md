# dotfiles
![Screenshot](/screenshots/riceScreenshot.png)
These are all the configuration files for my system.

### Dependencies

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


### Themes not included in this repository
- [Visual Studio Code](https://github.com/one-dark/vscode-one-dark-theme)
- [Firefox](https://github.com/daaniiieel/nord-firefox)


### Rofi
My configs are built upon [these](https://github.com/adi1090x/rofi).
Every configuration can be launched by running the shell script in the appropriate directory  
(e.g. for the powermenu run `~/.config/rofi/powermenu/powermenu.sh`).


### Polybar
To run polybar, execute `~/.config/polybar/launch.sh`  
The GPU module works with the `nvidia-smi` command, so you need a Nvidia GPU to use that module.  
You can left-click on the GPU / CPU modules to open nvidia-smi / htop.  
The terminal these commands will get displayed in is alacritty, but this can be changed in the file /.config/polybar/modules.ini.  
The audio manager was made [here](https://github.com/marioortizmanero/polybar-pulseaudio-control) and the openWindows script was originally made [here](https://github.com/tam-carre/polywins).

### Picom
I am using a [custom picom fork](https://github.com/ibhagwan/picom) for dual_kawase blur and rounded window borders.
You have to compile it yourself and  replace the precompiled binary in the ./picom folder.
Execute it using `~/.config/picom/ibhagwan-picom/picom --experimental-backends --xrender-sync-fence`.

### AwesomeWM

As a window manager I use AwesomeWM instead of the default xfwm4. To change the default window manager use these commands or follow [this](https://wiki.archlinux.org/title/xfce#Use_a_different_window_manager) guide.  
- `xfconf-query -c xfce4-session -p /sessions/Failsafe/Client0_Command -t string -sa xfsettingsd`  
- `xfconf-query -c xfce4-session -p /sessions/Failsafe/Client1_Command -t string -sa WM_NAME`  
(where you would replace WM_NAME with awesome)

### Wallpaper

Can be found in the [screenshots](https://github.com/ThiloU/dotfiles/tree/master/screenshots) folder.
