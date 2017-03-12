rm -Rf build && make gettext && sphinx-intl update-txconfig-resources --pot-dir build/en/gettext/ --transifex-project-name test_osgeolive && tx push -s

