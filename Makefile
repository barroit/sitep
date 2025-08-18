# SPDX-License-Identifier: GPL-3.0-or-later

BUILD_DIR  := build
ADDR_FILE  = $(BUILD_DIR)/host
READ_ADDR  = $$(cat $(ADDR_FILE))
WRITE_ADDR := ./scripts/private-ip.py

VITE_HOST     = --host=$(READ_ADDR)
WRANGLER_HOST = --ip=$(READ_ADDR)

ifneq ($(HOSTFREE),)
  ADDR_FILE     := /dev/null
  WRITE_ADDR    :=
  VITE_HOST     :=
  WRANGLER_HOST :=
endif

include exec.mk

.PHONY: init-shared live bundle preview deploy

live:

$(BUILD_DIR):
	mkdir $(BUILD_DIR)

init-shared: $(BUILD_DIR)
	$(INIT_SHARED) $(SHARED_DIR)

$(ADDR_FILE): $(BUILD_DIR)
	$(WRITE_ADDR) >$(ADDR_FILE)

live: init-shared $(ADDR_FILE)
	$(LIVE)

bundle: init-shared
	$(BUNDLE)

preview: bundle $(ADDR_FILE)
	npx wrangler dev $(WRANGLER_HOST)

deploy: bundle
	npx wrangler deploy
