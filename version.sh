#!/bin/sh

if [ -r "VERSION" ] ; then
  . ./VERSION
fi

if [ -z "$MAJOR" -o -z "$RELEASE" -o -z "$REVISION" ] ; then
  MAJOR="1"
  RELEASE="$(date +%Y%m%d)"
  REVISION="1"
fi

VERSION="$MAJOR.$RELEASE.$REVISION"

case $1 in
  --major) echo "$MAJOR" ;;
  --header) 
    echo "#ifndef _VERSION_H_"
    echo "#define _VERSION_H_"
    echo "static const char *FEX_VERSION = \"$VERSION\";"
    echo "#endif /* ifndef _VERSION_H */"
    ;;
  --shell)
    echo "MAJOR=\"$MAJOR\""
    echo "RELEASE=\"$RELEASE\""
    echo "REVISION=\"$REVISION\""
    ;;
  *) echo "$VERSION" ;;
esac
