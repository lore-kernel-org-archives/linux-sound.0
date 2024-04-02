Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D964255C3B
	for <linux-sound@vger.kernel.org>; Tue,  2 Apr 2024 23:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712100573; cv=none; b=NqrSJ/FpnmnGrJeG4MVcy2ROul0lfrurzAo1Ci919lMwSY91exkfX1kAe1U3UiqkYk/QFKMFu204Jwbn8xjLuV+c974PYA+ZCRX/SHFcpCvTpzK8rdyH7MmU+G1pGKYoLXF6UctgI/xGTngg1x76qug+HSWZt8P0qm73uFG3x6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712100573; c=relaxed/simple;
	bh=fHHVyV+bZAUQT3GvBwOvXa5zySpAFlP6d8xchU5/x8c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BB691rOrx7MC6heQP2ZDAa9mb7Gb4REKwjK6Ik5R0eWfyYDdgT9JemHRlH2Cv10ZcbEGD6UnsnXivWtCUfcw+Qzouv00ZDgEa4kGmEDCPMC9xPlCCRDyHgd+477unPXkfTtLSo19W0ApgK0PiMmKMetpmxJ6zBhy86Xe5nLcmIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dYOEt0Vx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dYOEt0Vx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E565C433C7;
	Tue,  2 Apr 2024 23:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712100573;
	bh=fHHVyV+bZAUQT3GvBwOvXa5zySpAFlP6d8xchU5/x8c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dYOEt0Vx0+PrpNFi/hpusufYxBHBocKt+JjZkAx4qfcO6TKX2OZqMW+kLjQZTcBr/
	 It9Pqt1tP+E76ogh8ZeinJvChfoOXcTH0l2lwSWOLwvy8fZCPLUOAEu6aocy343JMB
	 z38IIHnMuS4y45iTsDgTTHh52Sb590mkT0uDB5fjSCGiMS/5ReqjoiwKF5usWPTafD
	 z0a2LQndTvFJX++Cb6J/UGnryykMUdzZwMecWrFEg194fZOacllTFRtdT+d+a/Vc5b
	 02rofXV0Wn0/IlYz8njGMamfP0hJe2ucmsuRarZqFej9GrtVW7Vx+snXtRxKY/Crev
	 dVKmzdbGhEKMQ==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de
In-Reply-To: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
References: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 00/17] ASoC: SOF: Intel: improve SoundWire support for
 LunarLake
Message-Id: <171210057231.279166.12794569542139526516.b4-ty@kernel.org>
Date: Wed, 03 Apr 2024 00:29:32 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev

On Tue, 02 Apr 2024 10:18:11 -0500, Pierre-Louis Bossart wrote:
> This patchset contains important updates for SoundWire support.
> 
> We initially implemented support for multiple amplifiers on different
> links using a single HDaudio DMA transfer. To align with the other OS,
> the 'aggregation' is now supported by the firmware. This change in
> directions has kernel impacts, since we now have multiple HDaudio DMAs
> to program and start, but since there are no platforms released so far
> there's no end-user impact.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/17] ASoC: SOF: Intel: hda-dai: fix channel map configuration for aggregated dailink
        commit: 831045513c8a2ef14c3cf39b33d1ccedf588c4a8
[02/17] Revert "ASoC: SOF: Intel: hda-dai-ops: reset device count for SoundWire DAIs"
        commit: 24b1f93df400e1ab1731e7bcb320e693a6a73792
[03/17] Revert "ASoC: SOF: Intel: hda-dai-ops: only allocate/release streams for first CPU DAI"
        commit: 1d0fb3d0c30749779cdd88be98761b17ebfe5590
[04/17] ASoC: SOF: make dma_config_tlv be an array
        commit: e9c6b118de1afc1d32a4eb3bc9f3d114d4fe0f1a
[05/17] ASoC: SOF: Intel: hda-dai: set lowest N bits in ch_mask
        commit: 8fa10a243600ca8bd92fdc871100deb308fca5f1
[06/17] ASoC: SOF: Intel: hda-dai: set dma_stream_channel_map device
        commit: 17386cb1b48b0d85f69b21ae13d5408d67180e30
[07/17] ASoC: SOF: Intel: hda-dai: add helpers to set dai config
        commit: 58f32cb7011a8a15b18f35e4c0ee044aa98e365b
[08/17] ASoC: SOF: Intel: set the DMA TLV device as dai_index
        commit: 219271481e8965e80ee425cdc2db85230a333a97
[09/17] ASoC: SOF: Intel: hda: extend signature of sdw_hda_dai_hw_params()
        commit: 8bc3b56cac748f6ef6a4b96c906007a546e7fb5a
[10/17] ASoC: SOF: IPC4: extend dai_data with node_id
        commit: a936456d4bce27edc1a18dab270c657e9c07590c
[11/17] ASoC: SOF: Intel: hda: move helper to static inline
        commit: 2ac9e09ba0e874deeba13c3259dc18f22b622311
[12/17] ASoC: SOF: Intel: hda: Clear Soundwire node ID during BE DAI hw_free
        commit: bfe9225455c032c9dd5637047760cf59562e599f
[13/17] ASoC: SOF: sof-audio: revisit sof_pcm_stream_free() error handling and logs
        commit: a6f2b279d22894e81b23464620d03da6429d9ab5
[14/17] ASoC: SOF: pcm: simplify sof_pcm_hw_free() with helper
        commit: bb83ae04d9158276d17640f50c2a1e049100acb6
[15/17] ASoC: SOF: pcm: add pending_stop state variable
        commit: dbc78bce74f5f9057ba02bdc8d1549d24c573900
[16/17] ASoC: SOF: pcm: reset all PCM sources in case of xruns
        commit: ebd3b3014eebdd490f2c509d79e719fbcc680963
[17/17] ASoC: SOF: ipc4-topology: Save the ALH DAI index during hw_params
        commit: f0caa4fc244ca739ce6d12168aa588c412c81190

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

