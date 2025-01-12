


# Solo Zero
* Copy this file into an empty folder.
* Customise the specifics.
* Invoke the scriptlets.


## Preliminarily
```bash
clear
source path diva
source $DIVA_HOME/lib/day-zero
```


## The Specifics
```bash
export MAJOR=0
export PRODUCT='Rho System'
export PREDICATE='is a collection of utility libraries'
export PROJECT="$(kebab "$PRODUCT")"
export PROGRAM="$PROJECT"
export EXECUTORY=~/studio/product
export DATE=$(date +%m-%d)
export YEAR=$(date +%Y)
#
export VAULT="
product=$PRODUCT
predicate=$PREDICATE
project=$PROJECT
program=$PROGRAM
executory=$EXECUTORY/$PROJECT
crumbs=[$PRODUCT](readme.md)
title=$PRODUCT
offset=
git-root=$PROJECT
git-base=$PROJECT
major=$MAJOR
date=$YEAR-$DATE
year=$YEAR"
fon_oy "$PRODUCT"
```


## The Generics
```bash
kgp MAJOR PRODUCT PREDICATE PROJECT PROGRAM EXECUTORY YEAR DATE\
&& echo "$VAULT" > vault\
&& tiler tile "$TEMPLATE/solo/readme.md"    vault "readme.md"\
&& tiler tile "$TEMPLATE/zero/artisan.md"   vault "artisan.md"\
&& tiler tile "$TEMPLATE/zero/builder.md"   vault "builder.md"\
&& tiler tile "$TEMPLATE/zero/changes.md"   vault "changes.md"\
&& tiler tile "$TEMPLATE/zero/git-ignore"   vault ".gitignore"\
&& tiler tile "$TEMPLATE/zero/Main.hs"      vault "app/Main.hs"\
&& tiler tile "$TEMPLATE/zero/Strings.hs"   vault "app/Strings.hs"\
&& tiler tile "$TEMPLATE/zero/stack.yaml"   vault "etc/stack.yaml"\
&& tiler tile "$TEMPLATE/zero/package.yaml" vault "etc/package.yaml"\
&& tiler tile "$TEMPLATE/zero/completion"   vault "etc/completion"\
&& tiler tile "$TEMPLATE/zero/license"      vault "etc/license"\
&& tiler tile "$TEMPLATE/zero/usage"        vault "usr/usage"\
&& tiler tile "$TEMPLATE/zero/use"          vault "usr/use"\
&& rm vault\
&& diva update clean build test check install zippe\
&& diva show gitbase database state task
```
```bash
gyt init main\
&& gyt enhub "$PRODUCT $PREDICATE."\
&& gyt stage "zero.md"\
&& diva stage commit entag push release\
&& gyt show releases commits files status
```
Navigate from the [read-me](readme.md) and use the builder scriptlets.
