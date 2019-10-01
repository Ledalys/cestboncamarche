#!/bin/bash

command -v convert >/dev/null 2>&1 || { echo >&2 "convert is required but imagemagick is not installed.  Aborting."; exit 1; }

# récupération des arguments
# source : https://stackoverflow.com/a/29754866
getopt --test > /dev/null
if [[ $? -ne 4 ]]; then
    echo "I’m sorry, `getopt --test` failed in this environment. Make sure you have util-linux installed"
    exit 1
fi

################################### Define your parameters here
OPTIONS=t:s:
LONGOPTIONS=text:,screen:


# -temporarily store output to be able to check for errors
# -e.g. use “--options” parameter by name to activate quoting/enhanced mode
# -pass arguments only via   -- "$@"   to separate them correctly
PARSED=$(getopt --options=$OPTIONS --longoptions=$LONGOPTIONS --name "$0" -- "$@")
if [[ $? -ne 0 ]]; then
    # e.g. $? == 1
    #  then getopt has complained about wrong arguments to stdout
    exit 2
fi
# read getopt’s output this way to handle the quoting right:
eval set -- "$PARSED"

has_args=false

# now enjoy the options in order and nicely split until we see --
################################### Check you parameters here
while true; do
    case "$1" in
        -t|--text)
            the_text=$2
            has_args=true
            shift 2
            ;;
        -s|--screen)
            the_screen=$2
            has_args=true
            shift 2
            ;;
        --)
            shift
            break
            ;;
        *)
            echo "Programming error"
            exit 3
            ;;
    esac
done

the_output=$1

if [ ! -d "$the_output" ]; then
    echo "Cannot find output directory";
    exit 4;
fi

missing_args=false
if [ "$has_args" == "$missing_args" ]; then
    echo "--text or --screen expected";
    exit 5;
fi

if [ -n "$the_screen" ]; then
    if [ ! -f "$the_screen" ]; then
        echo "Cannot find the screen file";
        exit 4;
    fi
fi

convert \
    -size 500x350 \
    xc:white \
    -fill green \
    -draw "line 0,270 500,270" \
    -draw "line 62,270 67,260" \
    -draw "line 62,270 62,258" \
    -fill brown \
    -stroke black \
    -draw "ellipse 200,280 40,40 210,30" \
    -draw "line 240,270 260,200" \
    -draw "ellipse 300,300 40,40 175,355" \
    -draw "line 328,270 260,200" \
    -fill orange \
    -draw "roundrectangle 100,50 400,200 20,15" \
    /tmp/step1.gif

convert \
    -size 500x350 \
    xc:white \
    -fill green \
    -draw "line 0,270 500,270" \
    -draw "line 125,270 130,260" \
    -draw "line 125,270 125,258" \
    -fill brown \
    -stroke black \
    -draw "ellipse 220,300 40,40 185,5" \
    -draw "line 250,275 260,200" \
    -draw "ellipse 310,285 40,40 160,340" \
    -draw "line 328,250 260,200" \
    -fill orange \
    -draw "roundrectangle 100,50 400,200 20,15" \
    /tmp/step2.gif

convert \
    -size 500x350 \
    xc:white \
    -fill green \
    -draw "line 0,270 500,270" \
    -draw "line 187,270 192,260" \
    -draw "line 187,270 187,258" \
    -fill brown \
    -stroke black \
    -draw "ellipse 240,300 40,40 180,0" \
    -draw "line 270,275 260,200" \
    -draw "ellipse 290,285 40,40 170,350" \
    -draw "line 310,250 260,200" \
    -fill orange \
    -draw "roundrectangle 100,50 400,200 20,15" \
    /tmp/step3.gif

convert \
    -size 500x350 \
    xc:white \
    -fill green \
    -draw "line 0,270 500,270" \
    -draw "line 250,270 255,260" \
    -draw "line 250,270 250,258" \
    -fill brown \
    -stroke black \
    -draw "ellipse 260,300 40,40 180,0" \
    -draw "line 290,275 260,200" \
    -draw "ellipse 250,285 40,40 180,0" \
    -draw "line 270,250 260,200" \
    -fill orange \
    -draw "roundrectangle 100,50 400,200 20,15" \
    /tmp/step4.gif

convert \
    -size 500x350 \
    xc:white \
    -fill green \
    -draw "line 0,270 500,270" \
    -draw "line 312,270 317,260" \
    -draw "line 312,270 312,258" \
    -fill brown \
    -stroke black \
    -draw "ellipse 300,300 40,40 175,355" \
    -draw "line 328,270 260,200" \
    -draw "ellipse 200,280 40,40 210,30" \
    -draw "line 240,270 260,200" \
    -fill orange \
    -draw "roundrectangle 100,50 400,200 20,15" \
    /tmp/step5.gif

convert \
    -size 500x350 \
    xc:white \
    -fill green \
    -draw "line 0,270 500,270" \
    -draw "line 375,270 380,260" \
    -draw "line 375,270 375,258" \
    -fill brown \
    -stroke black \
    -draw "ellipse 310,285 40,40 160,340" \
    -draw "line 328,250 260,200" \
    -draw "ellipse 220,300 40,40 185,5" \
    -draw "line 250,275 260,200" \
    -fill orange \
    -draw "roundrectangle 100,50 400,200 20,15" \
    /tmp/step6.gif

convert \
    -size 500x350 \
    xc:white \
    -fill green \
    -draw "line 0,270 500,270" \
    -draw "line 437,270 441,260" \
    -draw "line 437,270 436,258" \
    -fill brown \
    -stroke black \
    -draw "ellipse 290,285 40,40 170,350" \
    -draw "line 310,250 260,200" \
    -draw "ellipse 240,300 40,40 180,0" \
    -draw "line 270,275 260,200" \
    -fill orange \
    -draw "roundrectangle 100,50 400,200 20,15" \
    /tmp/step7.gif

convert \
    -size 500x350 \
    xc:white \
    -fill green \
    -draw "line 0,270 500,270" \
    -draw "line 0,270 5,260" \
    -draw "line 0,270 0,258" \
    -fill brown \
    -stroke black \
    -draw "ellipse 250,285 40,40 180,0" \
    -draw "line 270,250 260,200" \
    -draw "ellipse 260,300 40,40 180,0" \
    -draw "line 290,275 260,200" \
    -fill orange \
    -draw "roundrectangle 100,50 400,200 20,15" \
    /tmp/step8.gif

if [ -n "$the_screen" ]; then
    # screen
    convert \
        $the_screen \
        -resize 250x130 \
        /tmp/marchepas.gif
elif [ -n "$the_text" ]; then
    # text
    convert \
        -background white \
        -size 250x130 \
        -fill black \
        -pointsize 18 \
        -gravity center \
        caption:"$the_text" \
        /tmp/marchepas.gif
fi

convert \
    -delay 30 \
    /tmp/step1.gif \
    /tmp/step2.gif  \
    /tmp/step3.gif  \
    /tmp/step4.gif  \
    /tmp/step5.gif  \
    /tmp/step6.gif  \
    /tmp/step7.gif  \
    /tmp/step8.gif  \
    -loop 0  \
    -coalesce null: /tmp/marchepas.gif \
    -geometry +125+60 \
    -layers composite \
    "$the_output"/camarche.gif

rm /tmp/marchepas.gif /tmp/step1.gif /tmp/step2.gif /tmp/step3.gif /tmp/step4.gif /tmp/step5.gif /tmp/step6.gif /tmp/step7.gif /tmp/step8.gif

echo "$the_output"/camarche.gif
command -v eog >/dev/null 2>&1 && { eog "$the_output"/camarche.gif; }
