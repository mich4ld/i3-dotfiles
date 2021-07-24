volume="$(pamixer --get-volume)"
muted="$(pamixer --get-mute)"

if [ $muted = "true" ]; then 
    echo "  Muted"
elif [ "$volume" -gt "50" ]; then
	echo "  $volume"
elif [ "$volume" == "0" ]; then
	echo "  Muted"
elif [ "$volume" = "Connection error\n" ]; then
	echo "  Muted"
else
	echo "  $volume"
fi
