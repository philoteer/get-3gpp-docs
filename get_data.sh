#bin/bash

mkdir -p data

#get data
wget --recursive --no-clobber --page-requisites --html-extension --convert-links --restrict-file-names=windows --domains 3gpp.org --no-parent  http://www.3gpp.org/ftp/Specs/archive/38_series/ -P ./data/

#remove unnecessary files
find ./data/ -name "*.txt" -type f -delete

find ./data/ -name "*.html" -type f -delete

#remove undesired chars in file names.
detox -r ./data
