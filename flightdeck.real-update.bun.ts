import { write } from "bun";
import { mkdir } from "node:fs/promises";

import type { RestEndpointMethodTypes } from "@octokit/rest";

/***********************************/
await downloadLatestPackageRelease();
/***********************************/

type ListReleasesResponse =
	RestEndpointMethodTypes["repos"]["listReleases"]["response"]["data"];

async function downloadLatestPackageRelease(
	user: string = import.meta.env.USER ?? "jeremybanka",
	repo: string = import.meta.env.REPO ?? "wayforge",
	proj: string = import.meta.env.PROJ ?? "tempest.games",
	outputDir = "./services/update",
	compareFn: (release: ListReleasesResponse[number]) => boolean = (release) => {
		return release.tag_name.startsWith(proj);
	},
) {
	const releasesUrl = `https://api.github.com/repos/${user}/${repo}/releases`;

	try {
		// Fetch all releases
		const releasesResponse = await fetch(releasesUrl);
		if (!releasesResponse.ok) {
			throw new Error(
				`Failed to fetch releases: ${releasesResponse.status} ${releasesResponse.statusText}`,
			);
		}
		console.log(releasesResponse);

		const releasesData =
			(await releasesResponse.json()) as ListReleasesResponse;

		// Filter releases based on the comparison function
		const matchingReleases = releasesData.filter(compareFn);

		if (matchingReleases.length === 0) {
			console.log("No matching releases found.");
			return;
		}

		// Sort matching releases by published_at date in descending order (latest first)
		matchingReleases.sort(
			(a, b) =>
				new Date(b.published_at).getTime() - new Date(a.published_at).getTime(),
		);

		const latestRelease = matchingReleases[0];
		const { assets } = latestRelease;

		if (!assets || assets.length === 0) {
			console.log("No assets found in the latest matching release.");
			return;
		}

		// Ensure the output directory exists
		await mkdir(outputDir, { recursive: true });

		// Download each asset
		for (const asset of assets) {
			const assetUrl = asset.browser_download_url;
			const fileName = asset.name;
			const filePath = `${outputDir}/${fileName}`;

			console.log(`Downloading ${fileName}...`);

			const assetResponse = await fetch(assetUrl);

			if (!assetResponse.ok) {
				console.error(
					`Failed to download asset ${fileName}: ${assetResponse.status} ${assetResponse.statusText}`,
				);
				continue;
			}

			// Write the response directly to a file
			await write(filePath, assetResponse);

			console.log(`Downloaded ${fileName} to ${filePath}`);
		}
	} catch (error) {
		console.error("Error downloading release:", error);
	}
}
