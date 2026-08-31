source /usr/share/cachyos-fish-config/cachyos-config.fish



# Let Niri finish assigning Ghostty its final column size before Fastfetch
# measures the terminal. Otherwise its wide output is rendered first and then
# reflowed when the new window is tiled.
function fish_greeting
    sleep 0.2
    if test $COLUMNS -lt 80
        command fastfetch --logo arch_small \
            --structure Title:Separator:OS:Kernel:Uptime:Shell:WM:Memory:Colors
    else if test $COLUMNS -lt 135
        command fastfetch --logo arch_small
    else
        command fastfetch --logo arch
    end
end
