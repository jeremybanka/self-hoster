#!/usr/bin/env bun

import { $ } from "bun"
import { homedir } from "node:os"
import { join } from "node:path"

await installNpmGlobals()

async function installNpmGlobals() {
	const globalPackageDir = join(homedir(), `.bun`, `install`, `global`)
	console.log(`\x1b[32mInstalling with:\x1b[0m`)
	await $`bun install --cwd ${globalPackageDir}`
	console.log(`\x1b[32mUsed global package.json from:\x1b[0m`)
	await $`bun pm ls --global`
	console.log(`\x1b[32mDone!\x1b[0m`)
}
