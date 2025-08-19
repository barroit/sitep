# SPDX-License-Identifier: GPL-3.0-or-later

objtree := build
shared  := shared/styles

SETUP  := scripts/init-shared.sh
LIVE   := npx vite $(host_opt)
BUNDLE := npx vite build
