# SPDX-License-Identifier: GPL-3.0-or-later

ADDR_FILE  := build/host
READ_ADDR  := $$(cat $(ADDR_FILE))
WRITE_ADDR := ./scripts/private-ip.py

VITE_HOST     := --host $(READ_ADDR)
WRANGLER_HOST := --ip   $(READ_ADDR)

ifneq ($(HOSTFREE),)
  ADDR_FILE     := /dev/null
  WRITE_ADDR    :=
  VITE_HOST     :=
  WRANGLER_HOST :=
endif

include exec.mk

.PHONY: init-shared live bundle preview deploy

live:

build:
	mkdir build

init-shared: build
	$(INIT_SHARED) $(SHARED_DIR)

build/host: build
	$(WRITE_ADDR) >$(ADDR_FILE)

live: init-shared build/host
	$(LIVE)

bundle: init-shared
	$(BUNDLE)

preview: bundle build/host
	npx wrangler dev $(WRANGLER_HOST)

deploy: bundle
	npx wrangler deploy
