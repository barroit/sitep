#!/bin/sh
# SPDX-License-Identifier: GPL-3.0-or-later

set -e

../barroit/site-lib/scripts/init-repo.sh

ln -snf ../../barroit/site-lib/react shared/
ln -snf ../build/shared/react page/

if [ ! -f exec.mk ]; then
	cat <<-EOF >exec.mk
		# SPDX-License-Identifier: GPL-3.0-or-later

		shared += shared/react
	EOF
fi
