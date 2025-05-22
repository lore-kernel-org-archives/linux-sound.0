Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC342356C9
	for <linux-sound@vger.kernel.org>; Thu, 22 May 2025 08:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747903530; cv=none; b=u6CwVNZbEQqoYIxcOo0u++bSvPKq9aOidaWUSvyhweTzv7tVbBf6RJ0veS5IGRsVmFQht2Q6qjmbgLcj4QTRBfiMOIf2jqNVqCAHg0Mfv/C4jBHmAjifS4mnxQ0j0uIwYtEA3sOQDoeZF7jYIjshVYfgDHVLyq5ZDltNy7VpOV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747903530; c=relaxed/simple;
	bh=fjAuH7HquUu3rM+nJV7PlodVPRQKRk3EwmYOAAAtNnw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hF9m8/75mJgy6PaVwf3im+RtHoBFhb7CnLKhiZPtC2eXOdL5Qrmpa+A4HJBIFPlUg9r/S1pUt/ZYMZ6m03tphfvy/YIKjI2wM+SfitkkLiztsanI2fWLIT978N8aMUnF2po7eE25rrn8p3hd98MWSVveTzsUXd3pffEfroOOWR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HnZowAx5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HnZowAx5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EF1EC4CEED;
	Thu, 22 May 2025 08:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747903529;
	bh=fjAuH7HquUu3rM+nJV7PlodVPRQKRk3EwmYOAAAtNnw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HnZowAx52zkhmrDp+Ov88vpLWVm8Uef00Znz6jKdl+SwFKTSY9IwoTNToO7msAlpz
	 kz0XozyyCHqavCUcrSdPS8YUUcirlU+SIq9hMMYQ0tnNABWldMmIVjvdTeN95QUBPZ
	 NbndNB0L/YR92W4lbjGPxjBcelxlXtwi3OCmNB5S0ARt8gKKuMyUMhDunnwR89nSlg
	 KyVGg/uF/LRHcqJVmteOLebxg5IZXsmUqAx2PaMdEaVPjtIcVISaT28fzpgGTW8S8V
	 tl3LMXZHaIpaaHO8MdwlyYS37K8/7TsjWtX8O16f+jVv4R/k3cdeoOBkp9brLNjycm
	 5WZFYKBWPbhOg==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev, 
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20250516131011.221310-1-ckeepax@opensource.cirrus.com>
References: <20250516131011.221310-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v6 0/7] Add DAPM/ASoC helpers to create SDCA drivers
Message-Id: <174790352786.11863.7427900599008667887.b4-ty@kernel.org>
Date: Thu, 22 May 2025 09:45:27 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Fri, 16 May 2025 14:10:04 +0100, Charles Keepax wrote:
> Add helper functions to add DAPM widgets, routes, ALSA controls,
> and DAI drivers, these will be used to create SDCA function device
> drivers.
> 
> This series should provide most of the core functionality needed to
> get a device registered and have a working DAPM graph within the
> device. There are some features that still need additional work, these
> are marked with FIXMEs in the code. The two main things are SDCA
> Clock Muxes (not used in our devices and needs some ASoC core work),
> and better support for more complex SDCA volume control definitions
> (our parts have fairly simple volumes, and SDCA has a large amount of
> flexibility in how the volume control is specified).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: SDCA: Fix minor typo
      commit: 52b97d43b7c52da481758931a111a091da5e4802
[2/7] ASoC: SDCA: Remove regmap module macros
      commit: 96bd04e738f8154b1d798842e89a4fa8b85d2636
[3/7] ASoC: SDCA: Move allocation of PDE delays array
      commit: 3849c958eeeb8e340112b983068c5547babc7274
[4/7] ASoC: dapm: Add component level pin switches
      commit: 737379e5062e26c59fe069a8bdad2ee363d52686
[5/7] ASoC: SDCA: Create DAPM widgets and routes from DisCo
      commit: 2c8b3a8e6aa877583e5dc2f669a8adc896a771d4
[6/7] ASoC: SDCA: Create ALSA controls from DisCo
      commit: c3ca24e3fcb656c6afe702b69e6e9efcc3ff1128
[7/7] ASoC: SDCA: Create DAI drivers from DisCo
      commit: 108f878d435437f649da32dea9f0d4f684eba3ba

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

