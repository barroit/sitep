#!/bin/sh
# SPDX-License-Identifier: GPL-3.0-or-later

set -e

cp -f ../sitep/.gitignore .gitignore
cp -f ../sitep/cmd.mk cmd.mk

ln -sf  ../sitep/Makefile .
ln -snf ../sitep/styles styles
ln -snf ../sitep/shared shared

mkdir -p scripts
ln -sf ../sitep/scripts/rln.sh scripts/
ln -sf ../sitep/scripts/ifaddr.py scripts/

mkdir -p page
ln -snf ../build/shared page/shared
ln -sf ../build/styles/index.css page/

../sitep/scripts/init-wrangler.sh
