#!/bin/sh
# SPDX-License-Identifier: GPL-3.0-or-later

set -e

../sitep/scripts/init.sh

ln -snf ../sitep/react react
ln -snf ../build/react page/

printf '\n%s\n' 'shared += react' >cmd.mk
