#!/bin/bash
mkdir DATASETSNEW

cd DATASETSOLD

find . -type f -name "desktop.ini" -delete

find . -type f -name "*.ini" -delete

find . -type f -name "*.md" -delete

# Remove all .DS_Store files (macOS metadata files)
find . -type f -name ".DS_Store" -delete

find . -name '*.tsv' -exec sh -c 'mv "$1" "${1%.tsv}"' _ {} \;

# Copy directory structure only (excluding files like .DS_Store)
rsync -a -f"+ */" -f"- *" --exclude=".DS_Store" . ../DATASETSNEW/

mv DATASETSNEW UCR2018 # Rename to run experiments

rm -r DATASETSOLD
