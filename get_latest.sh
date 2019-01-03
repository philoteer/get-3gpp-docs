#!/bin/bash

#empty latest dir (a bit unsafe way, perhaps)
rm -rf latest
mkdir -p latest

#move latest versions of docs to "./latest" directory.
for i in $(find ./data/ -name "*" -type d); do 
	
	LATEST=$(ls -Art "$i" | tail -n 1)	#get latest files
	LATEST_FULLPATH="$i/$LATEST"

	#cp files
	if [[ -f $LATEST_FULLPATH ]]; then
		cp $LATEST_FULLPATH ./latest/
	fi

done

#unzip
for i in $(find ./latest/ -name "*.zip"); do
	unzip -j $i -d ./latest
	rm $i
done

#remove undesired chars in file names.
detox -r ./latest
