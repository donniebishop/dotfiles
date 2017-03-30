#!/bin/bash
#
# teknik - Upload files/scrots/urls to teknik.io (rip pomf & uguu ;_;7)
# This script requires maim / xclip / wget be installed.
# By onodera, modified by SirCmpwn
# Further modified by alusion


## CONFIGURATION
# Copy links to clipboard after upload (requires xclip)
clipboard=true
# Send a notification when done
notify=true
# Open URL in browser
browser=false
# Log URLs
log=true
# Log file location
logfile="$HOME/.teknik"

## FUNCTIONS

bin_there() {
	if ! type "$@" >/dev/null 2>&1 ; then
		echo "$@ not installed."
		exit 1
	fi
}

# This function sets $file to a selection scrot
selection() {
	bin_there "maim"
	uploadme="/tmp/scrot.png"

	maim --hidecursor -s -b 3 -c 250,250,250 "$uploadme" 2> "/dev/null"
	if [[ "$?" -ge 1 ]]; then
		echo "Selection cancelled.">&2
		exit 1
	fi

	word=selection
}

# This function sets $file to your clipboard contents
clipboard() {
	bin_there "xclip"
	uploadme="/tmp/scrot.txt"

	xclip -o > "$uploadme"

	word=clipboard
}

# This function sets $file an url
url() {
	bin_there "wget"
	type="$(echo "$location" | rev | cut -d "." -f 1 | rev)"
	uploadme="/tmp/url.$type"

	wget --quiet "$location" -O "$uploadme"

	word=url
}

# This function sets $file a file
file() {
	if [[ -f "$location" ]]; then
		uploadme="$location"
	else
		echo "File not found.">&2
		exit 1
	fi

	word=file
}

# This function sets $file to a full screen scrot
desktop() {
	bin_there "maim"
	uploadme="/tmp/scrot.png"
	maim --hidecursor "$uploadme"

	word=desktop
}

# This function uploads the $file
upload(){
    if
        [[ ${uploadme} =~ png ]] 
    then
        url=$(curl -silent -F file="@$uploadme;type=image/png" "https://api.teknik.io/v1/Upload")
        if
            [[ "${url}" =~ "error" ]]; then
            printf  'error uploading file!\n'
            exit 1
        else
            url="${url##*fileName\":\"}"
            url="https://u.teknik.io/${url%%\"*}"
            fi
    else
        url=$(curl -silent -F file="@$uploadme" "https://api.teknik.io/v1/Upload")
        if
            [[ "${url}" =~ "error" ]]; then
            printf	'error uploading file!\n'
            exit 1
            else 
		url="${url##*fileName\":\"}"
		url="https://u.teknik.io/${url%%\"*}"
    fi
	fi
}

# This function logs the url,  copies the url to the clipboard, and/or opens the url in your browser
feedback() {
	# Copy url to clipboard
	if [[ "$clipboard" == true ]]; then
		bin_there "xclip"
		echo "$url" | xclip -selection primary
		echo "$url" | xclip -selection clipboard
	fi

	# Log url
	if [[ "$log" == true ]]; then
		echo "$url" >> "$logfile"
	fi

	# Open url in browser
	if [[ "$browser" == true ]]; then
		xdg-open "$url"
	fi

	# Send notification
	if [[ "$notify" == true ]]; then
		notify-send "Upload complete: $url"
	fi

	echo "${url}"
}

## EXECUTE

if [[ "$#" -ge 1 ]]; then
	case "$@" in
		-h|--help)
			echo "usage: teknik [options] [file/url]"
			echo "options:"
			echo "  -h,   --help            print help and exit"
			echo "  -p,   --paste       	upload your clipboard as text"
			echo "  -s,   --selection       upload selection scrot"
			echo "  -v,   --version         print version and exit"
			exit 0
			;;
		-s|--selection)
			selection
			;;
		-v|--version)
			echo "teknik 0.1.1"
			exit 0
			;;
		-p|--paste)
			clipboard
			;;
		http*)
			location="$@"
			url
			;;
		*)
			location="$@"
			file
			;;
	esac
else
	desktop
fi


if [[ "$#" -eq 0 ]]; then
	desktop
fi

upload
feedback
