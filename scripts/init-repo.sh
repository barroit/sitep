#!/bin/sh
# SPDX-License-Identifier: GPL-3.0-or-later

set -e

ln -sf  ../barroit/site-lib/Makefile .

if [ ! -f exec.mk ]; then
	cp ../barroit/site-lib/exec.mk .
fi

mkdir -p shared
ln -snf ../../barroit/site-lib/styles shared/

mkdir -p scripts
ln -snf ../../barroit/site-lib/scripts/init-shared.sh scripts/
ln -snf ../../barroit/scripts/private-ip.py scripts/

mkdir -p page
ln -sf ../build/shared/styles/index.css page/

if [ ! -f assets/_headers ]; then
	mkdir -p assets
	cp ../barroit/site-lib/headers assets/_headers
fi

if [ ! -f pnpm-workspace.yaml ]; then
	cp ../barroit/site-lib/pnpm-workspace.yaml .
fi

pnpm add -D wrangler@latest

if [ ! -f wrangler.jsonc ]; then
	cp ../barroit/site-lib/wrangler.jsonc .
fi

if [ ! -f worker/entry.js ]; then
	mkdir -p worker
	cp ../barroit/site-lib/worker.js worker/entry.js
fi
