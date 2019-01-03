#!/bin/bash

rm -rf txts
mkdir txts

#too slow
#unoconv -f txt -o ./txts -e FilterOptions=UTF8,LF ./latest/*.doc*

#docx
for i in $(find ./latest -name "*.docx"); do
	b=$(basename $i)
	docx2txt $i ./txts/$b.txt
done

#doc
for i in $(find ./latest -name "*.doc"); do
	b=$(basename $i)
	catdoc $i > ./txts/$b.txt
done
