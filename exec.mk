# SPDX-License-Identifier: GPL-3.0-or-later

BUILD_DIR := build

SHARED_DIR  := shared/styles
INIT_SHARED := scripts/init-shared.sh

LIVE := npx vite $(VITE_HOST)

BUNDLE := npx vite build
