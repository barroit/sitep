#!/bin/sh
# SPDX-License-Identifier: GPL-3.0-or-later

set -e

find -L $@ -type f | while read name; do
	mkdir -p build/$(dirname $name)
	ln -f $name build/$name
done
