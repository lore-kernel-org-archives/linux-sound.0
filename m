Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A53B1547C9
	for <linux-sound@vger.kernel.org>; Wed,  3 Sep 2025 18:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756925636; cv=none; b=XkDiKCuCTdcAE5CK11R50bHkcIeYKIyNrX2/fvLyNFLvaDIOtEouM7yqxuX6qCalWiSq/Uj5YJo5uQviHVitbv3vbqJDjEkmCoPH0CCLoFFDFyge406w1+91vkQTdj6n37ZxXyd6x1XvN7/M9Fo5uGUNRYPS7UCHTXIVSi8z4Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756925636; c=relaxed/simple;
	bh=vs64RF+6F6ne/6AP4IAEO+U4FbTMlCPl8c/LanHm3aQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bYI235WMQb8XGVmGxD2RjLm2cV3ksBoVcc4kVUVAfat/R679Ciiv1uP95ver7WZuywkmcKwnq5esr67poQP3ekbFAuU6/oYTbJ3OIg4jPHu2x++VnukoQblxR6qI6my6GayEencxqmp1bIi3FylpZhtRkEx6ty4ZS4XdaR2spg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JmSvADBE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JmSvADBE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 854F8C4CEE7;
	Wed,  3 Sep 2025 18:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756925635;
	bh=vs64RF+6F6ne/6AP4IAEO+U4FbTMlCPl8c/LanHm3aQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JmSvADBE4uGq3VP96UEQDf7TNm3ovJOiwJGl7zbloKISDg0WyykYgDOTespQUgzHO
	 PDQB1TO9vEp7T4niv5OC5tjW+5Lqcpl4IM7j25VCBVoKzwRHxl7jwuzFUOWRTbokcy
	 3wf9KFQLPiP4/QTUig2S1gD5onMoYi8hfQQWpOnkJFz0t2E0lj0j2rdosHcQY86ciM
	 BCEA19TEryUT1+DVfwvnFr99k/f/tMC2Y0m2nHochrlfUoHDw/8Fz/6enIA0QUPPdD
	 OAV6MQWSKofF11NjtNX6PEDG6enzZldjdEK/726EdLWkwCEDrIKNvqTYGGYUSCdrcX
	 JvWBKmT6vGgpA==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amadeuszx.slawinski@linux.intel.com, 
 nathan@kernel.org, linux-sound@vger.kernel.org
In-Reply-To: <20250902094853.1231842-1-cezary.rojewski@intel.com>
References: <20250902094853.1231842-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH 00/17] ASoC: Intel: avs: Adjust platform names
Message-Id: <175692563428.261331.198460088590618381.b4-ty@kernel.org>
Date: Wed, 03 Sep 2025 19:53:54 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-dfb17

On Tue, 02 Sep 2025 11:48:36 +0200, Cezary Rojewski wrote:
> This series is a direct follow up to the recent
> machine-board-registration changes [1]. Initially, a number of smaller
> patchsets were part of a bigger block of changes. My attempt to split
> them up to make the review easier was unfortunately not successful [2].
> 
> The goal of this series is the same one as with [1] - allow for multiple
> cards of the same type without workarounds or code duplications.
> With the machine-board names being unique - thanks to
> PLATFORM_DEVID_AUTO - platform component names shall be adjusted too so
> that no misbindings happen.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/17] ASoC: Intel: avs: hda: Adjust platform name
        commit: 0e3448f069646a72698b6f4933baf43daf92a9c0
[02/17] ASoC: Intel: avs: da7219: Adjust platform name
        commit: 7fa2ebe9b7f4a865030e6ea9be33635b4c1b9224
[03/17] ASoC: Intel: avs: dmic: Refactor dai_link creation
        commit: 765ee69f5e237c33795a0b51417f68ce59fd31a1
[04/17] ASoC: Intel: avs: es8336: Adjust platform name
        commit: cd405e6a949723c4b35c44e8b60e7139aa6e3743
[05/17] ASoC: Intel: avs: i2stest: Adjust platform name
        commit: d4b60caaef0cb8d23528ef17991bf9abae1ccff7
[06/17] ASoC: Intel: avs: max98357a: Adjust platform name
        commit: 314d8f574ae0c8f23f3225e0c75388ef8c565295
[07/17] ASoC: Intel: avs: max98373: Adjust platform name
        commit: ed23ac9b300b809616dcfc63765aa5a33af38041
[08/17] ASoC: Intel: avs: max98927: Adjust platform name
        commit: 31fc544ad8db01e58d671a5c4ec77b211bde3523
[09/17] ASoC: Intel: avs: nau8825: Adjust platform name
        commit: ba3684328208129d1d72ec50c417bc8a9213d4c5
[10/17] ASoC: Intel: avs: probe: Refactor dai_link creation
        commit: a46b3da24cdce85b7fca6f012f68b3857494ade6
[11/17] ASoC: Intel: avs: rt274: Adjust platform name
        commit: 1a78108293dfe421255ee0abd69ef73e5c68539a
[12/17] ASoC: Intel: avs: rt286: Adjust platform name
        commit: 210233c24d248e69b5309d651ab4b1021c6631e7
[13/17] ASoC: Intel: avs: rt298: Adjust platform name
        commit: fffac55850d20c81f386938b4fa29e13cdf66b99
[14/17] ASoC: Intel: avs: rt5514: Adjust platform name
        commit: 69fe78271da6d7a8d43edd1797c245d22449256c
[15/17] ASoC: Intel: avs: rt5663: Adjust platform name
        commit: b0e52296aa83bdbed0130ff89948bbb0ef1ee024
[16/17] ASoC: Intel: avs: rt5682: Adjust platform name
        commit: 6c402acec635969f2a48ff642b84f2eac0054175
[17/17] ASoC: Intel: avs: ssm4567: Adjust platform name
        commit: ce57b718006a069226b5e5d3afe7969acd59154e

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

