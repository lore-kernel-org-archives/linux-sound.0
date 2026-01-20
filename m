Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051373A7F6A
	for <linux-sound@vger.kernel.org>; Tue, 20 Jan 2026 20:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768940181; cv=none; b=T9MsvRhyZSXNlBX9zoOY8DqdKWMKmXAPuGBOrYw+lqnddAS5ZVJheJgMeifTEyhjR9eZ361iISGXVMWEnT9ZtWsf5u+yQzRAeRQZzsbscf8l1O97VNoW2juNJjIr48Er2KAmkToABkwgq6zlTTgqSMs2tJ3dou+c79kMQij69MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768940181; c=relaxed/simple;
	bh=fH2uzoOEbw4X+6AeS5PmDLjJHrsba5ZfoGaSQsf8YKk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IVoi9uGffPVLh8Y7EUJGFoz4r3vHwNbREKVvcJYmEo4OyMw0PkTcDjzkf/lQ1DTHks4/SXZDu7SbvA8NuC2VDtYFh+xDDQyOQRwUNQTaJ8LbwwqH8YcqTXtTGh2H84dsDHuviXKi55JrhOekxI54VrosNNh+qMAolSFGgzbRrK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uVvIHCDh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uVvIHCDh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B422C19421;
	Tue, 20 Jan 2026 20:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768940180;
	bh=fH2uzoOEbw4X+6AeS5PmDLjJHrsba5ZfoGaSQsf8YKk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uVvIHCDhqfscHIKwL3LO4Tr0p58QPFm58DlIbPQ1O7pfNosifW3IiXQtlyIbf3ywI
	 +qsGX/l/VhY+JTs2Rpvhed1bh0znKHgZr2MsGpQa6lSHN6d/YdEka5r/2jP0QX1yce
	 YMtNtmWj7EjtGl4gMXKUFLXhHFM1toU5rwItuzVtb/BjINs7y0sr/suTVNKGRS/Trj
	 VZR3YFFrgEK4AT0neAZ6wHK8LPsyiUwftn7NxHCPprIP2T/rINaYY/22vaOsu2tS1P
	 5YAW6o4CTDs/lpzDWKGX5jm9ogNFcXsjtF7nWFVNHO1j3CbEdmWoVcw3QJUYJplNrc
	 1dmhU9uBfIMIA==
From: Mark Brown <broonie@kernel.org>
To: Binbin Zhou <zhoubb.aaron@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Huacai Chen <chenhuacai@kernel.org>, 
 Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, linux-sound@vger.kernel.org
In-Reply-To: <cover.1768641428.git.zhoubinbin@loongson.cn>
References: <cover.1768641428.git.zhoubinbin@loongson.cn>
Subject: Re: [PATCH 0/4] ASoC: codec: es8323: Enable DAPM for ADC and
 ChipPower
Message-Id: <176894017884.787825.10409228711001907332.b4-ty@kernel.org>
Date: Tue, 20 Jan 2026 20:16:18 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Sat, 17 Jan 2026 17:18:33 +0800, Binbin Zhou wrote:
> This patchset replaces the original magic numbers with register bit
> field macro definitions in an attempt to improve code readability.
> 
> In addition, DAPM for capture ADC and chip power has been enabled.
> 
> Thanks.
> Binbin
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: codecs: es8323: Replace magic numbers with defined macros
      commit: 0cccfe65895d42fdc1f04aae7f85d8189ad80fdf
[2/4] ASoC: codecs: es8323: remove DAC enablement write from es8323_set_bias_level
      commit: 9dd2719a9ad3e18c3a5007466ca5922937bd4c5e
[3/4] ASoC: codecs: es8323: Enable proper DAPM widgets for capture ADC
      commit: 95814d4b8d478c76505188e45e81682206e41fe6
[4/4] ASoC: codecs: es8323: Enable proper DAPM widgets for chip power
      commit: 3c5ddd56aa93048314c64533c21e731a44b0f067

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

