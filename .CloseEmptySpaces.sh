# jq '.[] | select(.windows | length == 0) | .index' - get all empty spaces

windows_to_close=$(yabai -m query --spaces | jq '.[] | select(.windows | length == 0) | .index')
windows_to_close_rev=$(echo $windows_to_close | rev)
for window in $windows_to_close_rev 
do
	yabai -m space --destroy "$window"
done

