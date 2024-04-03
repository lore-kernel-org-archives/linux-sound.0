Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15691386A8
	for <linux-sound@vger.kernel.org>; Wed,  3 Apr 2024 12:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712145973; cv=none; b=ATRBZfJIpT/PaB4Z3BGXEuuU6qdagdNVKWB1q5Le0sA+W9ngpA4LySV5/sbvbixz/1q6nVT7NgNsekCtmKRtyZoI7RuMiEzASZwBPT4XWCJDh301qBnn5pG5adXMgMH9Q7PxNI6u6PX8vwZVUL/UcoFLPBokecCkAprOu5i7dhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712145973; c=relaxed/simple;
	bh=rdpu1fv+YDNO5DeUj4K9w41evcL2oZyCQ49s+KEpRqE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KbpyA+HnG28xFox1Ydh6iLs/M5fgagUrc4PB8mcHUakfi/FE8ILCA1+U+m89+jzf+sKbYVLCRt594irw9u2eU6xkR/+7nzK5YckOB6yNHXjIwOKu8Uq6Bw66JUSuiKaj7wCLYRJcOP9BTB5iCpVYHkrq00Iu30DO15/OC+tqxYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=azZm6Uv0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="azZm6Uv0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D94EC433F1;
	Wed,  3 Apr 2024 12:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712145973;
	bh=rdpu1fv+YDNO5DeUj4K9w41evcL2oZyCQ49s+KEpRqE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=azZm6Uv0mlW4ar7arnzKIHwMwtIbZOnVdp1NvEA03p9/EaJzlYrflnTW/kaEE5BWx
	 H9U3+G4ONMBRmCxSjXxpBqBOGF7Di8QV3z9C5OhIK3UfdF7Qrii6dUvy+d3EB1+A99
	 4G6ZumJBZLu/r+UlG1PzB+ZGvwcE3LaumHcLguc3JitDl/7AE49fDCPZmqe1OPVmwm
	 NYMhNu1k81AsTvJr7EqUe52gP8Pvitmv+FxJ/34HYhrApynyZ5T0KYabegA2Wr0SxI
	 PFn43OVj7vmOBuD5766DCHNlE9xpKWEQcqBSiu4Q+Qhd3YTcX2GrO3PJXt8zJxbnym
	 y/L+5D1hFEXSw==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <20240403093145.3375857-1-amadeuszx.slawinski@linux.intel.com>
References: <20240403093145.3375857-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH 00/10] Use const where applicable
Message-Id: <171214597120.799854.18095797972355599249.b4-ty@kernel.org>
Date: Wed, 03 Apr 2024 13:06:11 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14-dev

On Wed, 03 Apr 2024 11:31:35 +0200, Amadeusz Sławiński wrote:
> Use devm_kstrdup_const in few places to possibly save a bit of memory.
> Mark some of the structs as const, as they are not modified and used as
> is.
> 
> Amadeusz Sławiński (10):
>   ASoC: Intel: avs: hdaudio: Use devm_kstrdup_const
>   ASoC: Intel: avs: Use devm_kstrdup_const
>   ASoC: Intel: avs: hdaudio: Constify probing_link
>   ASoC: Intel: avs: es8336: Constify card_headset_pins
>   ASoC: Intel: avs: nau8825: Constify card_headset_pins
>   ASoC: Intel: avs: rt274: Constify card_headset_pins
>   ASoC: Intel: avs: rt286: Constify card_headset_pins
>   ASoC: Intel: avs: rt298: Constify card_headset_pins
>   ASoC: Intel: avs: rt5663: Constify card_headset_pins
>   ASoC: Intel: avs: rt5682: Constify card_headset_pins
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/10] ASoC: Intel: avs: hdaudio: Use devm_kstrdup_const
        commit: 27aa58180473f81990f35238dc8aec40d34c778d
[02/10] ASoC: Intel: avs: Use devm_kstrdup_const
        commit: 68a71af3aee2b776a0030e1393864c9501997cbb
[03/10] ASoC: Intel: avs: hdaudio: Constify probing_link
        commit: a3c95efc432ddd18882cfab420cbea14937fb950
[04/10] ASoC: Intel: avs: es8336: Constify card_headset_pins
        commit: 2dbe7c809841e645a6b9d6d51801d3c594739d93
[05/10] ASoC: Intel: avs: nau8825: Constify card_headset_pins
        commit: bf400f16a03788ccdb1de1d9bfe9458082f24ef7
[06/10] ASoC: Intel: avs: rt274: Constify card_headset_pins
        commit: 130c953a75cc62dd5c73c295bae14197dce46b85
[07/10] ASoC: Intel: avs: rt286: Constify card_headset_pins
        commit: 682bedc8b0bae52fc5fc95cb3dba6e3d590da653
[08/10] ASoC: Intel: avs: rt298: Constify card_headset_pins
        commit: 33a886eee711298e799f1f52432e2f5e234cd015
[09/10] ASoC: Intel: avs: rt5663: Constify card_headset_pins
        commit: a055674868fa9d36f290dba906a76dd45801a37e
[10/10] ASoC: Intel: avs: rt5682: Constify card_headset_pins
        commit: 5faf65b5d1e36ec0a1eb3ba8ba2a8b7a779575ce

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

