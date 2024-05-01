Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D5C12F382
	for <linux-sound@vger.kernel.org>; Wed,  1 May 2024 13:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714571000; cv=none; b=SOJBy2dFTijzaSwHR6eNpksD+0nydrRK+IxRKtZULHu2Z/Bm4jcEeQ/dIONJ1yfhO60mOaZ6k1llbr582BBNx3MXp9mzYmU6fL5/DhEStAxYWiXtP+1p+3Dh11xV11D7rRK79Hz/JWy94qkGY3X93IV556iwY9PEPdJc8+tVKyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714571000; c=relaxed/simple;
	bh=DdmaAL72NIA/h0L7GanbdzpHoFrQQ/7SR3lk+7msWSI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OLH5L2iU3sG/hz8eBgoFaEIZZFFTdvw0GCTXDi5OBeHI4VkMKWbIQUXNYJDWZNLhKjgH9IjBIeLAEIUN/lAucBNUDT8EyzE16FlgPPCtCbNQCL21+n+QA3hSWkjIe5z5zNkyvxUGWYKxFKp3+Fcxg2WCRgmFP8pHbm7MrHz2ebE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MQLpGkhG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MQLpGkhG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5670CC113CC;
	Wed,  1 May 2024 13:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714571000;
	bh=DdmaAL72NIA/h0L7GanbdzpHoFrQQ/7SR3lk+7msWSI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MQLpGkhG1JuRdCgLR33W/+2gEZwsIYqoQcLs4ea0fFWBCk0c4T5gNZELBlbfgfKfc
	 8+c9fD7pGC5CPgzxitM14pkoK42DPYQcUkIp4vD4Z2v6tjTbR6HfKaIfETh7XDtB0x
	 2YCW62xTvJxMcTqYWjqmob3LY8ATjA51ZVSIfCOkpKkw6yk4lpryu+Ud2TTkxTQ4ZT
	 xXXUIVPpFcbu702XdCSIZHn7zMcQUGwzeNSaG+eUtUiv3K/wE13dAieeSd+XMbP+UM
	 xhK/pELuTyDIPo7s8vvTRjjRExPiVXfPCIliBc7Wx37XEsAdQ1EX6C8ZmpwN6vu066
	 UJXJQD0zLOfGw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de
In-Reply-To: <20240426152123.36284-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152123.36284-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 00/12] ASoC: Intel: updates for 6.10 - part5
Message-Id: <171457099874.1888704.2352818866469804657.b4-ty@kernel.org>
Date: Wed, 01 May 2024 22:43:18 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev

On Fri, 26 Apr 2024 10:21:11 -0500, Pierre-Louis Bossart wrote:
> This patchset corrects a couple of mistakes corrected, improves
> snd_soc_card allocation.  The new functionality is mostly for
> SoundWire platforms, with new SKUs for Dell and Acer, and support for
> the Cirrus Logic bridge/sidecar amplifier topology.
> 
> Bard Liao (1):
>   ASoC: Intel: sof_sdw: add a space before cfg-amp in components
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/12] ASoC: Intel: skl_hda_dsp_generic: Allocate snd_soc_card dynamically
        commit: 33e59e50ee7610473c85030edca73ad3df60b5c1
[02/12] ASoC: Intel: skl_hda_dsp_generic: Use devm_kasprintf for the components string
        commit: 69d0f88b9aebb5749ab0dbaead7414d718994380
[03/12] ASoC: Intel: soc-acpi: mtl: add Dell SKU 0C64 and 0CC6
        commit: 02e6f7cb487f18e1171ae6d12ad1066fbd25176d
[04/12] ASoC: Intel: soc-acpi: mtl: add support for Acer Swift Go 14
        commit: 64bfd26d982ec29123c65949229fa12c15f7df8f
[05/12] ASoC: Intel: soc-acpi-intel-lnl-match: adds RT714 and RT1318 support
        commit: 6d339113df3ab510ce075a18ccb10a20cb325d4e
[06/12] ASoC: Intel: sof_sdw: Allocate snd_soc_card dynamically
        commit: 38068d91cf3948ffa220d45f738505cc9f6e13d0
[07/12] ASoC: Intel: sof-sdw: don't set card long_name
        commit: 2086b55fd6ddcaa92e473ba7017f6a986870337e
[08/12] ASoC: Intel: sof_sdw: add a space before cfg-amp in components
        commit: 6be269d274353d2604bf49b92f703610cb4734e9
[09/12] ASoC: Intel: sof-sdw: really remove FOUR_SPEAKER quirk
        commit: 0bab4cfd7c1560095e29919e2ebe01783b9096dc
[10/12] ASoC: Intel: sof_sdw: Delay update of the codec_conf array
        commit: 628cc5d0c4bd6a3f70c793968f8e2546afc8c3a3
[11/12] ASoC: Intel: sof_sdw: Add callbacks to register sidecar devices
        commit: da5244180281a18c4c7859674fec308514aaf629
[12/12] ASoC: intel: sof_sdw: Add support for cs42l43-cs35l56 sidecar amps
        commit: b831b4dca48dbe0f1f7705b44460dd9ca7f2f940

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

