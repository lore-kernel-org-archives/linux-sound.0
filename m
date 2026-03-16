Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404DE241139;
	Mon, 16 Mar 2026 01:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773625109; cv=none; b=h59QlEqRMiLFgv7vyaqP6wHeI3LaA66hCR+oeJMngR5vUZoNfhZmd6JEdxKoPIWyCMQF5Ws/cUmhIKS97mrR/uXUjLLlKGvOToUyg3YvhV3DQKG4kWhXpntRuvrgqdlD9n39Epf3SoJgiVpaHeMc7EbQuE2J3rjO50eSlx9s+uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773625109; c=relaxed/simple;
	bh=E3UZvUtsN8AuKQEBgiGE2vZgsKy6sMSpgQiRPkVmWvA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=udDDF5Sl6RWndyN3XYGXW7l2HSLB2PcxkJWXTzIawCD3rGw4ZNtQ3DIrBKstpRzLqEEcHynkI7yWF/SCQHXNzqQvHKzpBm9GEeTwjpgQ9JQ+O/LqVEGFGIvQCEk+5SbVLRYqxa+hhv/I2hynMTumPZUX1XjmYrjTHtp5Oo14c/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=artJmjC2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="artJmjC2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A37DC19425;
	Mon, 16 Mar 2026 01:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773625108;
	bh=E3UZvUtsN8AuKQEBgiGE2vZgsKy6sMSpgQiRPkVmWvA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=artJmjC2ZToyTkOTaxToZnwbmk5+jP6Ybmtl+E2NAGEJKoTSFlJMQNsn3W1OvUoEF
	 EKeFVeCVhp2aAnzzv9XS1yd3seyI2H2+b64nQ1QG87+/k88CPvpjWWzcR+Q0Vt2fhU
	 9LB3E4XDPVGW+NzmguwgYjNLxsj9GlwiBF3LVEootWmar1jlkwPRSeOFyC8wULRBMw
	 ycCuaI4RlVS1WRzZmMJzGjR2Nv6Syo6v0aASGbk3egxzslklzHZMUDMXo4KwcF1PZ1
	 a2WOhdo7iYi5oKtNJkdY6Sr56uNvVqThIzokkg1tYJU9FoJfZjjA2SRMcC1QsB01uP
	 43ZwxdeuTwBrg==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, hasunpark@gmail.com
Cc: Vijendar.Mukunda@amd.com, venkataprasad.potturu@amd.com, 
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260308151654.29059-1-hasunpark@gmail.com>
References: <20260308151654.29059-1-hasunpark@gmail.com>
Subject: Re: (subset) [PATCH 0/3] ASoC: amd: acp: PX13 ACP70 config and
 machine quirks
Message-Id: <177362009337.162791.6622780298534018366.b4-ty@kernel.org>
Date: Mon, 16 Mar 2026 00:14:53 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-5154a
X-Developer-Signature: v=1; a=openpgp-sha256; l=1420; i=broonie@kernel.org;
 h=from:subject:message-id; bh=E3UZvUtsN8AuKQEBgiGE2vZgsKy6sMSpgQiRPkVmWvA=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhszt8UKB0x7mO6qZd9XaVcl1ca0r2e/eYWPv+LGlV69G+
 2i0q2QnozELAyMXg6yYIsvaZxmr0sMlts5/NP8VzCBWJpApDFycAjARJnv2n4x99/WnO/rP29Ow
 cw7Dwpqenk1bA+RZ4lu+W88r6H3bfM973vYzPyW8tLIvqsVOibgnUOH8VuXWUTY7+1vatT3Hn2a
 wLauZW1xbIHtQmimlSEqo+2OdpHLR0tiLelq5zJksl6Q5eq/c3r+GYXPu3OJHPDVrVWJU3So4D2
 S6mds9frThcpXLQ9n6FTGcXbUanR8XqFU4r5GaIcr0UKfNKE5te8yK7vZFl3MuPq8OkQhxbZk+N
 91ilsa0w6p3W2Z9KRD69d/+lklukV4O65a1YdkHQyZyGdwz5d/cdEHl7GOra+/Omwg6Tj27WEBV
 d/bP7IWPrYN6Lbc9urDfPrtmneiljYtyZF/8ULR59DMaAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 09 Mar 2026 00:16:51 +0900, hasunpark@gmail.com wrote:
> ASoC: amd: acp: PX13 ACP70 config and machine quirks
> 
> From: Hasun Park <hasunpark@gmail.com>
> 
> Hi,
> 
> This series adds ACP70 platform quirks for ASUS ProArt PX13
> (HN7306EA/HN7306EAC).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.0

Thanks!

[1/3] ASoC: amd: acp: add DMI override for ACP70 flag
      https://git.kernel.org/broonie/sound/c/d0426510a9e1
[2/3] ASoC: amd: acp: add PX13 SoundWire machine link for rt721+tas2783x2
      https://git.kernel.org/broonie/sound/c/399b6fd37a10

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

