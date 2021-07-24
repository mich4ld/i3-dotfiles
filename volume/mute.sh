msgID="2345"
muted="$(pamixer --get-mute)"

# check volume
if [ $muted = "true" ]
then
	dunstify  "  Muted " -t 800 -r $msgID
else
	volume="$(pamixer --get-volume)"
	dunstify  "  $volume" -t 800 -r $msgID

fi
