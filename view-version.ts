#!/usr/bin/env bun

import { $ } from "bun"

const releaseVersion = `${process.argv.at(-1)}\n`
const availableVersion = (
	await $`npm view tempest.games version`
).stdout.toString()

if (availableVersion !== releaseVersion) process.exit(1)
