# SPDX-License-Identifier: GPL-3.0-or-later

objtree := build
host     = $(objtree)/host
shared  := styles shared

cat-host = $$(cat $(host))
host-opt = --host=$(cat-host)
ip-opt   = --ip=$(cat-host)

ifneq ($(HOSTFREE),)
  host     := .
  host-opt :=
  ip-opt   :=
endif

include cmd.mk

.PHONY: setup live bundle preview deploy

live:

$(objtree):
	mkdir $(objtree)

setup: $(objtree)
	$(setup-cmd) $(shared)

$(host): $(objtree)
	./scripts/ifaddr.py >$(host)

live: setup $(host)
	$(live-cmd)

bundle: setup
	$(bundle-cmd)

preview: bundle $(host)
	npx wrangler dev $(ip-opt)

deploy: bundle
	npx wrangler deploy
