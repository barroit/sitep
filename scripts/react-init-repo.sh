#!/bin/sh
# SPDX-License-Identifier: GPL-3.0-or-later

set -e

../barroit/site-lib/scripts/init-repo.sh

ln -snf ../../barroit/site-lib/react shared/
ln -snf ../build/shared/react page/

if diff ../barroit/site-lib/exec.mk exec.mk >/dev/null; then
	cp ../barroit/site-lib/react-exec.mk exec.mk
fi
