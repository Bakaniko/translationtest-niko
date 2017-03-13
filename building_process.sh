#! /bin/bash

# clean the folder, make the .po files and send them to transifex
# this is used to ease the testing process, it won't be in the final process

rm -Rf build && make gettext && sphinx-intl update-txconfig-resources --pot-dir build/en/gettext/ --transifex-project-name test_osgeolive && tx push -s

