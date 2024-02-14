Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5095466A
	for <linux-sound@vger.kernel.org>; Wed, 14 Feb 2024 13:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707916924; cv=none; b=RDtd/tmEbopXT+NbXUBoedlMV6wgVSzJUSb8ybZe/ELwOBX9y7T+ktU456QW1AOLFTzUOTOZVBTFPOHw8n0iBwphLCxgnaEANJowM3Xd2iS6Cyo+SiHCvmLWfKdwEELIizdVArRVCfO3u1AsVlxs5k2JejbmlZHwQHtgRKLs1Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707916924; c=relaxed/simple;
	bh=8RSK/p334Ojht1v0fGXrHUeA6zKEoTe1KoAcUpjquH8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZBngQS8g7V1OIdsT6MusMGEoOHzqQHbF6rfoUdnYiswRVz74y2t9mgUzDbhyBzbCHOwxUZygvtbWUTIwuqqKqneNuZw6PsJi5HFTmgG8sTim5xOc86Qnika6O1X080HJb2WYgSjOWUGskKd4S5V+sUQH4Cy5YuikSr2E7KFwDd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZCflwQFL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZCflwQFL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8BFEC433F1;
	Wed, 14 Feb 2024 13:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707916924;
	bh=8RSK/p334Ojht1v0fGXrHUeA6zKEoTe1KoAcUpjquH8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZCflwQFLYq3NT9OsNP4IgbkZ0TLWXFcxESJ9arQkO4jE2JKBDhW94RxCua4aSQ/7W
	 LgiCi4QHg+HF8UnIgjTbrf4B+ySUoQt2w36pIyAG92tz15jfPomCeFUUyJ+Oikunx9
	 ccN780HzqmIlpLQMbZEbO7dWEmyXtnfWpoPbnMacuPqpyJ4kxMWuyhZMo/qW+1++fc
	 l0D/SDR7aPnx4KlGaWk5xkGfNirr6Y5Vm7fdQ+2E/8rAnKxBwUiURKg+McowMB4PiZ
	 KX+aE+bFq4vLkJ+0FUNosLq6Y2uJEWE1Zz7ddCLbFdu9V9jHvUDNXMSEaAV9rw5o0u
	 wwlPFHAA/7Axg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.intel.com, 
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com, 
 yung-chuan.liao@linux.intel.com
In-Reply-To: <20240213101247.28887-1-peter.ujfalusi@linux.intel.com>
References: <20240213101247.28887-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 00/15] ASoC: SOF: Extend ChainDMA and DSPless mode to
 LNL+ SDW
Message-Id: <170791692254.143237.14439234788313859156.b4-ty@kernel.org>
Date: Wed, 14 Feb 2024 13:22:02 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c

On Tue, 13 Feb 2024 12:12:32 +0200, Peter Ujfalusi wrote:
> For both ChainDMA and DSPless mode the requirement is that the link must
> be serviced by HD-DMA.
> On pre Lunar Lake platforms this was only valid for HDAudio links but with
> Lunar Lake all link types now serviced by HD-DMA.
> 
> This allows us to enable ChainDMA and DSPless mode for SoundWire links as
> well.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/15] ASoC: SOF: ipc4-topology: change chain_dma handling in dai_config
        commit: 3858464de57b77db51f83e3831950cf18a6aff28
[02/15] ASoC: SOF: ops: add new 'is_chain_dma_supported' callback
        commit: ba91d0919a78d344d19b02a3899d0921b2f903d1
[03/15] ASoC: SOF: Intel: hda: add 'is_chain_dma_supported' callback
        commit: d69f9ecbe1ecfa97b9c8ab7b6332bd73ba2ff4d8
[04/15] ASoC: SOF: Intel: hda-dai-ops: enable chain_dma for ALH
        commit: a5b7767723e739c700f5c56841790a85bd7f13ae
[05/15] ASoC: SOF: ipc4: store number of playback/capture streams
        commit: 426476344f01096c7dae6c5413cc8a8d9bbdea29
[06/15] ASoC: SOF: ipc4-pcm: fix dma_id for CHAIN_DMA capture
        commit: 8722d245a73ff32491bff390136367ec223e2906
[07/15] ASoC: SOF: ipc4-topology: allow chain_dma for all supported DAIs
        commit: df82dbb5fb28a762113fc6d98985d36ef7785e32
[08/15] ASoC: SOF: Intel: hda-dai: remove dspless special case
        commit: daa09d0615ce9c781777802874cffa4380f883c3
[09/15] ASoC: SOF: topology: dynamically allocate and store DAI widget->private
        commit: 743eb6c68d3534e01e73d316ddcaa7334c0e29d3
[10/15] ASoC: SOF: Intel: start SoundWire links earlier for LNL+ devices
        commit: 67bde2e8c0e4702911dd614d80127e098521a83c
[11/15] ASoC: SOF: topology: Parse DAI type token for dspless mode
        commit: f9618ff105a0f6f5a6beed3edc557ea6a7d26df6
[12/15] ASoC: SOF: Intel: hda-dai-ops: use dai_type
        commit: 797b92591a236ac370257c1e742f6fd394993db5
[13/15] ASoC: SOF: Intel: hda-dai-ops: add SoundWire dspless mode
        commit: 0c3d57365a03ec920cc90614527ac11ad5a6f323
[14/15] ASoC: SOF: Intel: lnl: Do not use LNL specific wrappers in DSPless mode
        commit: 0afce89ff88a85b09201cd23ec272527faf6a480
[15/15] ASoC: SOF: Intel: hda-dai: add support for dspless mode beyond HDAudio
        commit: 2065610b5ddd5b58eed1dc3b3c3db27a26ebd4b6

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

