# Goals
Work on the structure of the OSGeo-live files to provide a worflow for raw rst files in english to translated HTML files using the transifex plate-form.

Currently using a test project:

https://www.transifex.com/bakanikos-lab/test_osgeolive/dashboard/


This is inspired by the process used by [Richard Duivenvoorde](https://github.com/rduivenvoorde/translationtest/blob/master/README.rst) 

## requirements
* [sphinx](http://www.sphinx-doc.org/en/stable/)

* [transifex client](https://docs.transifex.com/client/introduction)

* gettext

## config files
* conf.py (in the source folder) : main config file, used by sphinx
* makefile: used to build the HTML files

#  Commands

## folder initialisation

The first time you need to initialize the folder, keeping the default values.

```bash

tx init

```

If you don't want to build the .po files, but you can skip the next command.


## .po files creation

From the.rst files, run gettext to build the .po files used by transifex as resources. The pot files will be in the `build/en/gettext` folder

```bash

make gettext

```

## adding the new ressources to transifex project (locally) 

Here the project is *test_osgeolive* but the goal is [the OSGeo-Live project](https://www.transifex.com/osgeo/osgeolive/dashboard/) 

```bash
sphinx-intl update-txconfig-resources --pot-dir build/en/gettext/ --transifex-project-name test_osgeolive

```

## Pushing the ressources online (to the translation project web page)

```bash
 tx push -s

```

## Translate

Go to the [the test project](https://www.transifex.com/bakanikos-lab/test_osgeolive/dashboard/) and do some translations (currently french)

# Building the HTML pages

## Getting the translation from transifex

```bash

 tx pull -l fr

```

This will pull the po files with translations from tx into the locale folder


## building the translated pages

Now you can build the french site with :

```bash

 make html LANG=fr

```


# Updating the files

If you now add *new strings* to excisting files

```bash

 make gettext
 tx push -s

```


**BUT** if you add a **new** rst file or resource

```bash

 make gettext
 sphinx-intl update-txconfig-resources --pot-dir build/en/gettext/ --transifex-project-name test_osgeolive
 tx push -s

```
