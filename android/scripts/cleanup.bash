#!/bin/bash

# Set the apks_file
apks_file='local_app.apks'
exported_apks_dir='testing_locally'

# Check the file is exists or not
if [ -f $apks_file ]; then rm "$apks_file" ; fi
if [ -d $exported_apks_dir ]; then rm -rf "$exported_apks_dir" ; fi