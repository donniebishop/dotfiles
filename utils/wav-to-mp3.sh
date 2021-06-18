#!/bin/bash

while getopts "i:o:" option; do
	case "${option}" in
		i)
			INPUT=${OPTARG}
			;;
		o) 
			OUTPUT=${OPTARG}
			;;
	esac
done

ffmpeg -i $INPUT -ar 44100 -ac 2 -b:a 320k $OUTPUT
