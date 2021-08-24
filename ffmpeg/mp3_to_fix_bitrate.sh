#!/bin/bash

pth="$1"

cd $pth
mkdir -p "out"

find . -iname "*.mp3" | while read -r f
do
	outfile=`basename $f`
  	if [ -e "out/$outfile" ]; then
  		echo "${outfile} file exists";
  	else
  if grep "mp3" <<< "$outfile"; then
  	
  	echo "$pth/out/$outfile"
    #ffmpeg -i "$f" -codec:a libmp3lame -b:a 128k "$outfile"
  	#ffmpeg -i "$f" -loglevel quiet -codec:a libmp3lame -qscale:a 5 "out/$outfile"
    < /dev/null ffmpeg -i "$f" -codec:a libmp3lame -b:a 44k "out/$outfile"
	fi
  fi
done