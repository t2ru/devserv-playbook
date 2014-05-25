#!/bin/bash

while getopts i:v:r: OPT; do
  case $OPT in
    i) INIFILE=$OPTARG ;;
    v) VENV=$OPTARG ;;
    r) REPOS=$OPTARG ;;
  esac
done

shift $((OPTIND - 1))

[ "x$INIFILE" = "x" ] && (echo "production.ini path is required." >2; exit 1)
[ "x$VENV" = "x" ] && (echo "virtualenv path is required." >2; exit 1)
[ "x$REPOS" = "x" ] && (echo "repository path is required." >2;exit 1)

. $VENV/bin/activate

paster setup-rhodecode $INIFILE --force-yes \
  --user=admin --password=admin --email=admin@localhost --repos=$REPOS

deactivate

