Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EF82F2905
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 11:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770203912; cv=none; b=ZJatpVwB1eN/aitOrVenVFci10x0WrvVTsP+A2StdJGjge79Azn6WSNVjUI4bYO9szWlPM1gzjXs4M32KrpVyba+t7wy3kBpq3/sV0KOjNQ1TJUW/2E2QTUb5LSuvLfSEnW2R7qlQiSu+Ju+NB8VLj+Yp1Cirw9zn225Oe69AGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770203912; c=relaxed/simple;
	bh=TvwEW9XvFBI9l4AfjYoZ5b74DWtJzdzf00F60VLFksQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rAFlNLa9vnGPiWXIw1bt77M76NJOLeb8s+IwQ9kN77JXkA3qml9Rz4B0zM+Uyga9sMTsvxt6gSikMqZKPSun6KgejMB2xI1+BXPj/JwuM9AiP0KYyr6ks1y19mXPe49ifH5Em766CSlYwiFYBJw9zT4JUOeWWV4wJmKY6/IvzLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KAZQmrV8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KAZQmrV8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3C35C16AAE;
	Wed,  4 Feb 2026 11:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770203912;
	bh=TvwEW9XvFBI9l4AfjYoZ5b74DWtJzdzf00F60VLFksQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KAZQmrV8J+8dU+VieoMG/l/jeYWcIYnjFLicy5xTbaXn2GBbWSzIrfaH6njGutol2
	 qVoN5LY2IaQrl5uZ4m0LZG5xG4DMy0gn49idLLmo+/WDNtEDAAiHohsyL7SevJYMIb
	 +PFzndeFtnK6SWKaVV58kqzErSXU49vKL/k+a89LeD4I5LcnnYYSmJT/lUqqZUe0gU
	 wbD/7hiIqAsT+JIk6IcEHbEGY/0KdPqhJcN1360Nj3Q4EvuHBjy7T3+Dq8lpFtLbWa
	 msqH+MnLzgRF6At884EaJE3h4iopMb7dUCYyvx6ImGXZksZgxAbApfLgKgGnBPwZIQ
	 Syoq2FEIsI94w==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com, peter.ujfalusi@linux.intel.com
In-Reply-To: <20260203100027.3741754-1-yung-chuan.liao@linux.intel.com>
References: <20260203100027.3741754-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: soc-acpi-intel-ptl-match: drop rt721
 related match tables
Message-Id: <177020391073.33145.17727695735820182938.b4-ty@kernel.org>
Date: Wed, 04 Feb 2026 11:18:30 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Tue, 03 Feb 2026 18:00:27 +0800, Bard Liao wrote:
> Use functional topologies to support all RT721-related topology and
> amplifier combinations,
> e.g. sof-ptl-rt721.tplg, sof-ptl-rt721-l3-rt1320-l3.tplg.
> 
> If these entries are not removed, they will all use the sof-ptl-rt721.tplg.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: soc-acpi-intel-ptl-match: drop rt721 related match tables
      commit: 754b3dade5ddbfd849e6ca9864cef45ce34cd7f6

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

