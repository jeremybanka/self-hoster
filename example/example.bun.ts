#!/usr/bin/env bun

import { ParentSocket } from "atom.io/realtime-server"
import { serve } from "bun"

const PORT = 3333
const parentSocket = new ParentSocket()

serve({
	port: PORT,
	async fetch(req) {
		parentSocket.logger.info("🚀", req.method, req.url)
		const text = await req.text()
		if (text) {
			parentSocket.logger.info("📬", { text })
		}
		return new Response("Welcome!")
	},
})

parentSocket.emit("alive")
parentSocket.on("updatesReady", () => {
	parentSocket.emit("readyToUpdate")
})
