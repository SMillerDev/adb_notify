#!/bin/bash
i=1
ARRAY=()
arr=()
search1=deleteIntent=PendingIntent
rep1=App:


array_contains2 () { 
    local array="$1[@]"
    local seeking="$2"
    local in=1
    for element in "${!array}"; do
        if [[ $element == $seeking ]]; then
            in=0
            break
        fi
    done
    return "$in"
}


while true
do
	TEMP="$(adb shell dumpsys notification | grep "deleteIntent=PendingIntent")"
	string="error: device not found\n"
	if [[ $text == *"$string"* ]]; then
		echo "error: device not found, aborting";
		break;
	else
		if [[ -z "$TEMP" ]]; then
			echo empty;
		else
			readarray -t TEMP3 <<< "$TEMP"
			array_contains2 ARRAY "$TEMP3"  && echo yes || paplay /usr/share/sounds/freedesktop/stereo/message-new-instant.oga
			array_contains2 ARRAY "$TEMP3"  && echo yes || notify-send "Android Notification" "$TEMP3" -t 3000 -i "/home/smillernl/android/additional/adb_notify/android-icon.png"
			array_contains2 ARRAY "$TEMP3"  && echo yes || ARRAY=("${ARRAY[@]}" "${TEMP3[@]}")
			(( i++ ))
		fi
	fi
	sleep 5
done


