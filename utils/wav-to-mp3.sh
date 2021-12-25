#!/bin/bash

usage()
{
	echo "wav-to-mp3.sh -i INPUT -o OUTPUT"
}

while getopts "hi:o:" option; do
	case "${option}" in
		h)
			usage
			exit
			;;
		i)
			INPUT=${OPTARG}
			;;
		o) 
			OUTPUT=${OPTARG}
			;;
	esac
done

if [[ -z "${INPUT+x}" && -z "${OUTPUT+x}" ]]; then
	ffmpeg -i $INPUT -ar 44100 -ac 2 -b:a 320k $OUTPUT
else
	usage 
fi

