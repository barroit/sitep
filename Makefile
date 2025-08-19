# SPDX-License-Identifier: GPL-3.0-or-later

objtree := build
host    = $(objtree)/host
shared  := shared/styles

rd_host = $$(cat $(host))
wr_host := ./scripts/private-ip.py

host_opt = --host=$(rd_host)
ip_opt   = --ip=$(rd_host)

SETUP  := scripts/setup-shared.sh
LIVE   = npx vite $(host_opt)
BUNDLE := npx vite build

ifneq ($(HOSTFREE),)
  host     := /dev/null
  wr_host  :=
  host_opt :=
  ip_opt   :=
endif

ifneq ($(wildcard exec.mk),)
  include exec.mk
endif

.PHONY: setup live bundle preview deploy

live:

$(objtree):
	mkdir $(objtree)

setup: $(objtree)
	$(SETUP) $(shared)

$(host): $(objtree)
	$(wr_host) >$(host)

live: setup $(host)
	$(LIVE)

bundle: setup
	$(BUNDLE)

preview: bundle $(host)
	npx wrangler dev $(ip_opt)

deploy: bundle
	npx wrangler deploy
