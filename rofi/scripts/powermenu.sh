# Options
shutdown=""
reboot=""
logout=""

result=$(printf "$shutdown\n$reboot\n$logout\n" | rofi -dmenu -no-config -theme ~/.config/miszq-dots/rofi/powermenu.rasi)

if [ -z $result ]
then
    echo "Nothing happened..."
    exit 0
elif [ $result = $shutdown ]
then
    echo "Shutdown..."
    systemctl poweroff
elif [ $result = $reboot ]
then
    echo "Rebooting"
    systemctl reboot
else
    echo "Login out..."
    i3-msg exit
fi
