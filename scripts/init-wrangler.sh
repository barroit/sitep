#!/bin/sh
# SPDX-License-Identifier: GPL-3.0-or-later

mkdir -p assets
ln -sf ../../sitep/cloudflare/_headers assets/_headers

mkdir -p worker
cp -f ../sitep/cloudflare/entry.js worker/entry.js

json5 wrangler.jsonc | jq --indent 3 '
	.assets.directory = "" |
	.assets.html_handling = "drop-trailing-slash" |
	.compatibility_date = "2025-08-31" |
	.main = "worker/entry.js" |
	.routes[0].pattern = "" |
	.routes[0].custom_domain = true
' >wrangler.jsonc.tmp

mv wrangler.jsonc.tmp wrangler.jsonc
