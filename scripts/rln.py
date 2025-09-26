#!/usr/bin/python3
# SPDX-License-Identifier: GPL-3.0-or-later

from os import link, listdir, makedirs, mkdir, path
from sys import argv, exit

if len(argv) < 3:
	exit(1)

files = argv[1:-1]
target = argv[-1]

def rln(names, parent):
	for name in names:
		src = f"{parent}/{name}"
		dst = f"{target}/{src}"

		if path.isdir(src):
			next = listdir(src)

			mkdir(dst)
			rln(next, src)

		else:
			link(src, dst)

makedirs(target, exist_ok=True)
rln(files, '.')
