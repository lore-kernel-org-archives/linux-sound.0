Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C232C1BF2B
	for <linux-sound@vger.kernel.org>; Mon, 15 Apr 2024 02:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713147979; cv=none; b=q2m4e475V/blhXKKgMA5n8WYAi4JsQaomg4PVnLaKIDjtCTGRvtaHIJyh4q6TTkJLGim6jZl+c3tkp4hqDOYDAMI66bbdTxtwZst00vj80O6GvPArfpDPLhi/UYRAcMKE1Wwd4LUGoYXa4swPy8eRdbber5LYP2oY+hvgy11PEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713147979; c=relaxed/simple;
	bh=ltADpnck3bDi91NCZf1pP+UOclfMZOpaCHEqGrEgbLQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FkCwGle4vouzTYl1Dip5GWRxTTIx0oBwFuX1zjKtUvZH+ae84IoZITHIefDNLswtoVZ2fUAJPZiSDR46PECraYXKzt9lUdeZrgSlGvi+3zO7FBn0rTRJkN0kbO7S55pxdr+uKsJzS7zO8nj62SdP/Bf7G6N53bZsu//y4NxlZnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=McJU8UO0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="McJU8UO0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52E28C4AF07;
	Mon, 15 Apr 2024 02:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713147979;
	bh=ltADpnck3bDi91NCZf1pP+UOclfMZOpaCHEqGrEgbLQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=McJU8UO0THWgb3FRbJuBmq5tPScRDR2tta6nH6uwCPh/7ISyagAGQ/Ww0cTpyg+Fb
	 JHPlOQ+pyzrZ7Oj3bYUbr4MVUfQtBvAWiMjfUcP7wvaWFD3lom8hpkLrCmYK6uNFF3
	 HsLsEPmw0FEsizeH3iRCZ6Xx3LhT+sY/0cZFTkIoHKDyHlWwp4n/Vu8h9WK4YoqbFR
	 ZSdSt2z44A7yOWZtA7AwZVkyJpKgzR/TmLoMg+nfE8TyPPNohU9Xlvjp1MUVx285yg
	 17m/C9GJcnJZNhtirZufUbqYzX4b77/R5PZPLYYcftSFsqNwRK9xvoJ3MKvSCQlmdH
	 uQjyEDOlfhHkw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de
In-Reply-To: <20240411220347.131267-1-pierre-louis.bossart@linux.intel.com>
References: <20240411220347.131267-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 00/12] ASoC: Intel: updates for 6.10 - part4
Message-Id: <171314797772.1649319.9287188570062396979.b4-ty@kernel.org>
Date: Mon, 15 Apr 2024 11:26:17 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev

On Thu, 11 Apr 2024 17:03:35 -0500, Pierre-Louis Bossart wrote:
> More cleanups from Brent, notably the removal of the redundant
> cml_rt1011_rt5682 machine driver, fixes for SoundWire platforms and
> changes to sof_rt5682 to allow for 96+ sampling rates.
> 
> For the rest of this kernel cycle, we are still working on SoundWire
> updates for MeteorLake (usual missing ACPI signature required for
> topology selection and jack detection information). We'll provide
> those patches as soon as they are reviewed/validated.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/12] ASoC: Intel: sof_sdw: add missing sof_sdw_rt_amp_init for Realtek multi-function codecs
        commit: 7fda0efaa5fe6e93bb79a3a540a4b881ef788f66
[02/12] ASoC: Intel: soc-acpi: add support for HP Omen14 SoundWire configuration
        commit: 0f8edb15fb6e436f0da7ab25ffcbcaab3def7e8c
[03/12] ASoC: Intel: sof_sdw: add JD2 quirk for HP Omen 14
        commit: 4fee07fbf47d2a5f1065d985459e5ce7bf7969f0
[04/12] ASoC: Intel: sof_sdw: add quirk for Dell SKU 0C0F
        commit: b10cb955c6c0b8dbd9a768166d71cc12680b7fdf
[05/12] ASoC: Intel: sof_sdw: remove FOUR_SPEAKER quirks
        commit: 744866d28fe6b1a651e63d03a57e06d66e3d460a
[06/12] ASoC: Intel: sof_da7219: mach cleanup for adl boards
        commit: 36a621070b4854670c43138bb8b19bdf8df77bbd
[07/12] ASoC: Intel: sof_da7219: mach cleanup for rpl boards
        commit: c3d1818f5ef5a9a930e468a799ccf1cade91e350
[08/12] ASoC: Intel: sof_da7219: add mtl_da7219_def for mtl boards
        commit: fe18a4be97d4064c9f3113f819780162cc586f16
[09/12] ASoC: Intel: sof_realtek_common: support 4xALC1011 amplifier
        commit: 551fb5593c2bd34e8711efe01dddf22d9c6200b2
[10/12] ASoC: Intel: sof_rt5682: support ALC1011 on cml boards
        commit: 6136d879f3c2240db636d614a1c39f17c6ceaf36
[11/12] ASoC: Intel: cml_rt1011_rt5682: delete driver
        commit: ca571e5a2e45b1a4113af2370fd1cf895f0b46d4
[12/12] ASoC: Intel: sof_rt5682: use RT5682S_PLL1 if needed
        commit: dcc2cd8000d11a046680a7476b0d96b0b956454a

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

