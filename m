Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4AA47F46
	for <linux-sound@vger.kernel.org>; Wed, 28 Aug 2024 17:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724866583; cv=none; b=TAy5PjktODogE3aCZ9kRDbMzOhEFNtRFSj1bOBtL42fgAKzc6LWaOIEtWA32Ozqbh4AWkqXo/OPMw6AOhw/64MImWEkWSMdwlCdsYec3L94tCAaY3Q+RaIgcncL4vJyKaTOnIlymYp9eu+NggUMJvoWXUk0dd0tB+uslpVuPi2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724866583; c=relaxed/simple;
	bh=Ipfd1MvAJqgFMf2pYYTe8CSQDsZ7Q06QhFMYtJy3JP4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jLLWILhKpPWpYJasURFw4qfTcX3vpUTY1yTzytWE97e+kViBMWq50wNfEvEu1n4bzfUHb1JBtUUyiaFhar9Ol96CiE9vB/HxscXprapuR7TX3R97SgCqM+eMbwzq+AdN0U+ZL3Gdp4OMFnfyLQxm9D1K99HzRCcWjCJ03eUVbXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aQjYMt2R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aQjYMt2R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC0F9C4CEC0;
	Wed, 28 Aug 2024 17:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724866582;
	bh=Ipfd1MvAJqgFMf2pYYTe8CSQDsZ7Q06QhFMYtJy3JP4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=aQjYMt2RV+301uRWwFPXqgxK33MrRo723noY5EFMtxUDhDrEmjgf5SbfNZ5wJQXgT
	 WAL06En1fe9QXyj3V6pLdMorrH+NLRg/dVfw3yiGhvsNp9nJVFKb9soxpgdXKsUp1J
	 Ho9W3OHnT6Ag24I9qUyCeTn0unHvnhaUqlsFt4+uDmF28AY5sdleCNGrUxT9t9wJTb
	 RgSyax/4y3cGmBRbBXLEvb8TobCOFFrfjRLDFDp/YUT2yOqhkyXImiuIjZhC9K6W8r
	 0qCOUUloVrS9MELOuG82iscTj8aF0yzjOnTsIi6CN1/WLdEKrRxVVjwKbK/2Rxq3rF
	 Os5vHW/A04WoA==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de
In-Reply-To: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
References: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 00/18] ASoC: Intel: boards: updates for 6.11
Message-Id: <172486658149.355291.13919555062040611045.b4-ty@kernel.org>
Date: Wed, 28 Aug 2024 18:36:21 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811

On Mon, 27 May 2024 14:35:34 -0500, Pierre-Louis Bossart wrote:
> More simplifications from Brent Lu for Chromebooks, Bard Liao for
> SoundWire, and support for new Dell SKUs w/ Cirrus Logic codecs added
> by Charles Keepax.
> 
> Bard Liao (7):
>   ASoC: Intel: sof_sdw_cs42l42: use dai parameter
>   ASoC: Intel: sof_sdw_rt711: use dai parameter
>   ASoC: Intel: sof_sdw_rt5682: use dai parameter
>   ASoC: Intel: sof_sdw_rt700: use dai parameter
>   ASoC: Intel: sof_sdw_rt_dmic: use from dai parameter
>   ASoC: Intel: sof_sdw_rt_sdca_jack_common: use dai parameter
>   ASoC: Intel: sof_sdw: remove get_codec_dai_by_name
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/18] ASoC: Intel: sof_sdw_cs42l42: use dai parameter
        (no commit info)
[02/18] ASoC: Intel: sof_sdw_rt711: use dai parameter
        (no commit info)
[03/18] ASoC: Intel: sof_sdw_rt5682: use dai parameter
        (no commit info)
[04/18] ASoC: Intel: sof_sdw_rt700: use dai parameter
        (no commit info)
[05/18] ASoC: Intel: sof_sdw_rt_dmic: use from dai parameter
        (no commit info)
[06/18] ASoC: Intel: sof_sdw_rt_sdca_jack_common: use dai parameter
        (no commit info)
[07/18] ASoC: Intel: sof_sdw: remove get_codec_dai_by_name
        (no commit info)
[08/18] ASoC: Intel: sof_sdw: Add missing controls for cs42l43/cs35l56
        (no commit info)
[09/18] ASoC: Intel: soc-acpi: Add match entries for some cs42l43 laptops
        (no commit info)
[10/18] ASoC: Intel: sof_sdw: Add quirks for some new Dell laptops
        (no commit info)
[11/18] ASoC: Intel: sof_sdw: Add quirks from some new Dell laptops
        commit: 9307694f340e518cac0e007f39dd9ff0736e6144
[12/18] ASoC: SOF: sof-audio: rename dai clock setting query function
        (no commit info)
[13/18] ASoC: SOF: sof-audio: add sof_dai_get_tdm_slots function
        (no commit info)
[14/18] ASoC: SOF: ipc3-topology: support tdm slot number query
        (no commit info)
[15/18] ASoC: SOF: ipc4-topology: support tdm slot number query
        (no commit info)
[16/18] ASoC: Intel: maxim-common: rewrite max_98373_hw_params function
        (no commit info)
[17/18] ASoC: Intel: sof_da7219: remove local max98373 ops
        (no commit info)
[18/18] ASoC: Intel: sof_da7219: disable max98373 speaker pins in late_probe
        (no commit info)

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

