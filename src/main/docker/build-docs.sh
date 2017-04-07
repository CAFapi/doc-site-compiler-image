#!/bin/sh

echo "Source Directory Listing:"
ls -la
echo

#echo "Running bundle install..."
#bundle install
#echo

#echo "Running npm install..."
#npm install
#echo

echo "Running bower install..."
bower install
echo

echo "Creating Target File..."
tar -cz --exclude-vcs-ignores -f ${TARGET_FILE}.tmp .
mv ${TARGET_FILE}.tmp ${TARGET_FILE}
echo

echo "Target File Listing:"
ls -la ${TARGET_FILE}
echo
