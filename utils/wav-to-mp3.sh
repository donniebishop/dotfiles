#!/usr/bin/env sh

# not proud to have vibe coded this but I will admit chatgpt did a good job

set -e

usage() {
    echo "Usage: $0 [-f] [-o output.mp3] input.wav"
    echo "  -o FILE   Set output filename"
    echo "  -f        Force overwrite if output exists"
    exit 1
}

OUTPUT=""
INPUT=""
FORCE=0

# Parse arguments
while [ "$#" -gt 0 ]; do
    case "$1" in
        -o)
            shift
            if [ -z "$1" ]; then
                echo "Error: -o requires a file name."
                usage
            fi
            OUTPUT="$1"
            ;;
        -f|--force)
            FORCE=1
            ;;
        -*)
            echo "Unknown option: $1"
            usage
            ;;
        *)
            INPUT="$1"
            ;;
    esac
    shift
done

# Validate input
if [ -z "$INPUT" ]; then
    echo "Error: No input file provided."
    usage
fi

if [ ! -f "$INPUT" ]; then
    echo "Error: File '$INPUT' not found."
    exit 1
fi

# Check ffmpeg
if ! command -v ffmpeg >/dev/null 2>&1; then
    echo "Error: ffmpeg not found. Install it first."
    echo "macOS: brew install ffmpeg"
    exit 1
fi

### Normalize output name
if [ -n "$OUTPUT" ]; then
    case "$OUTPUT" in
        *.mp3|*.MP3)
            OUTPUT="${OUTPUT%.*}"
            ;;
    esac
else
    BASE="${INPUT%.*}"
    OUTPUT="$BASE"
fi

OUTPUT="${OUTPUT}.mp3"

### Overwrite protection
if [ -f "$OUTPUT" ] && [ "$FORCE" -ne 1 ]; then
    echo "Error: Output file '$OUTPUT' already exists."
    echo "Use -f to overwrite."
    exit 1
fi

echo "Converting '$INPUT' → '$OUTPUT' at 320 kbps..."

ffmpeg -hide_banner -loglevel error \
    -i "$INPUT" \
    -codec:a libmp3lame -b:a 320k \
    "$OUTPUT"

echo "Output file: $OUTPUT"

