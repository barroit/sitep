/* SPDX-License-Identifier: MIT */
/*
 * Copyright 2025 Jiamu Sun <barroit@linux.com>
 */

export default function digitlen(n)
{
	return (Math.log10(n) >>> 0) + 1
}
