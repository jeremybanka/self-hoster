#!/bin/env bun

import { $ } from "bun"
import { existsSync, lstatSync } from "node:fs"
import { homedir } from "node:os"
import { join, resolve } from "node:path"
import { symlink, unlink } from "node:fs/promises"

const appConfigDir = join(import.meta.dirname, `..`, `apps`)

await configureBun()
await installNpmGlobals()

async function configureBun() {
	const sourceDir = resolve(appConfigDir, `bun`)
	const targetDir = join(homedir(), `.bun`, `install`, `global`)
	for (const filename of [`package.json`, `bun.lockb`]) {
		const sourcePath = join(sourceDir, filename)
		const targetPath = join(targetDir, filename)
		console.log(`Configuring Bun`, { appConfigDir, sourcePath, targetPath })
		try {
			if (!existsSync(sourcePath)) {
				throw new Error(`Source file does not exist: ${sourcePath}`)
			}

			if (existsSync(targetPath)) {
				const isSymlink = lstatSync(targetPath).isSymbolicLink()
				if (isSymlink) {
					console.log(`Symlink already exists: ${targetPath}`)
					return
				} else {
					console.log(`Removing existing file: ${targetPath}`)
					await unlink(targetPath)
				}
			}

			await symlink(sourcePath, targetPath)
			console.log(`Symlink created: ${sourcePath} -> ${targetPath}`)
		} catch (thrown) {
			if (thrown instanceof Error) {
				console.error(thrown.message)
			} else {
				console.error(thrown)
			}
		}
	}
}




async function installNpmGlobals() {
	const globalPackageDir = join(homedir(), `.bun`, `install`, `global`)
	console.log(`\x1b[32mUsing global package.json from:\x1b[0m`)
	await $`bun pm ls --global`
	console.log(`\x1b[32mInstalling with:\x1b[0m`)
	await $`bun install --cwd ${globalPackageDir}`
	console.log(`\x1b[32mDone!\x1b[0m`)
}
