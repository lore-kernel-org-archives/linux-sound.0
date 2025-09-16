Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BF72D6E4C
	for <linux-sound@vger.kernel.org>; Tue, 16 Sep 2025 12:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758024532; cv=none; b=VVHeTPxu5wHGV0eGUpaIqgvtTZ4hnF7ganSJ2ORJzZzKMpEn8LsJhQwJ4Ok7yjZSV11T4tNTYJS5o23vuKK8S+Ci+N6CTwtG94bsdwqht16Vn8GhhQUPCYXPC1hXN2GRSGa+tk2OAzHJ2OTXXiFnDCZfLrHDb/+AflHws6Ara/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758024532; c=relaxed/simple;
	bh=wnLcjX9VwYp34cQw8B65ABoV5u81R2dHcyiTdQEcMLc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XQni+raH8E6VJb6JgL0B7SIveReJOjxraN97mUXoBnogfu95eL7yS6jHIH5PTjO13Diu8Mf8O1GJmck9hEcmd28muRHKpg6t8N2mToGdAQzDRUZ+0NTkHQVT0eSOcfKzwrQyouiBgJjSrANw21XZIB2G5Jq4NA6dgK+2Jrq2vfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h5/HnxoD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h5/HnxoD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 413AEC4CEFA;
	Tue, 16 Sep 2025 12:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758024532;
	bh=wnLcjX9VwYp34cQw8B65ABoV5u81R2dHcyiTdQEcMLc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=h5/HnxoDUcXfQ4R14mvAe9sawhsdD3FiesRmTZOppwHV3U7FEPpcevsP39kFx5qyf
	 degI7iYs8lMIz1oY67739i1lwv+wqh2bAU++k8p7ywNbib0TiSLaJ0N4mxlTqXcz1z
	 nGOOL6LXVEfmogzpxBTrZUSZikqpb6W53BaHBoM0WRfKBPxst1WoESv2BRdKVSw3Nd
	 R2u+wLNyM2e4oWkESDeL0CIGR/WYCCv3k4BC1Y65peye90DkoGJkzpe0WKjF9SVQUY
	 /3McmivRdXKD0chbPzYIwG6NREYKAY2/F3Y86cEtAZq7uhLPuYMgm9MFJ5afdij1hV
	 RQywGmkZR2qBQ==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, bard.liao@intel.com
In-Reply-To: <20250915025456.1154200-1-yung-chuan.liao@linux.intel.com>
References: <20250915025456.1154200-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: sof_sdw: use PRODUCT_FAMILY for Fatcat
 series
Message-Id: <175802453100.111062.17100148347242364382.b4-ty@kernel.org>
Date: Tue, 16 Sep 2025 13:08:51 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-56183

On Mon, 15 Sep 2025 10:54:56 +0800, Bard Liao wrote:
> PRODUCT_NAME is machine-specific. Use PRODUCT_FAMILY to ensure
> the machine quirk is applied with consistent audio configurations
> across Fatcat series products.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: sof_sdw: use PRODUCT_FAMILY for Fatcat series
      commit: 73caf2bcf3f0a3843c091b78b0711e356f8a2ef9

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

