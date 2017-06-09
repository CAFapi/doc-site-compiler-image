#!/bin/sh
#
# Copyright 2015-2017 Hewlett Packard Enterprise Development LP.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


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
