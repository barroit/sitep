/* SPDX-License-Identifier: CC0-1.0 */

async function fetch_handler(request, env, ctx)
{
	return new Response(null, { status: 404 })
}

export default {
	fetch: fetch_handler
}
