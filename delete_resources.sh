#!/bin/bash

## used commandes
# tx delete -r <project_slug>.<resource_slug>

project_slug="test_osgeolive"
resource_slug=""


getFiles() {
   Rep="$1"
   for item in $Rep/*
   do

   ligne=$project_slug"."$(basename "$item")
   tx delete -r $ligne
   # [ -f "$item" ] && echo "$item" # deleted"

    [ -d "$item" ] && getFiles "$item"


   done
}

[ -d "${1:-.}" ] && getFiles ${1:-.}
