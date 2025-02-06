Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574B3214203
	for <linux-sound@vger.kernel.org>; Thu,  6 Feb 2025 11:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738841546; cv=none; b=JNTnkR/k3m+pFMl6NlufpbLSUbuEVceUFSTkJibLm50TUQ2OfIpngCEvmzpSEORuJ4rX6da307CQ+61SVNijKSUTrvI4jyJRV3JUqaqC0upl8bjknB4QmHsnsleetp+tcoRIYDE2G1LU8xW88RFuW+A/ROfk/u0mB2pATF1ZgAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738841546; c=relaxed/simple;
	bh=RnKqrxImM9oJTuaZ/bFfdYLcCGE/L/Ff4k5RENtwKHw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GFkmEsAN08rrV2E29KOhKmxz98ChbwK1vQuyX2znUg7kAuv+MRWHlq3gQPk39lcref609MmqqOlu4Tl8yVP8EkPxVsC+8/CE9cNiDYDYIgWIGsypCzm7VJDd3slkt4nTpmp4ENcVLDksnIEXLOFs24YEmQlIkrBG+MQOAF2LYp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IeKLDrb1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IeKLDrb1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52FDFC4CEDD;
	Thu,  6 Feb 2025 11:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738841545;
	bh=RnKqrxImM9oJTuaZ/bFfdYLcCGE/L/Ff4k5RENtwKHw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IeKLDrb15eZiSivn99154RfivoPc5fYYoagp6tSuEMRcOyxLMXz6ZqMC39VK+QvSR
	 FoSO4915amnwqNoxtcK2bNWTtPp3QRrqhV/lqFqrtRTBhgBbNmPYj4uGf01gOwD24m
	 nLu8tb/cTOJtGSvPcp80eOoDbtG+32ILpnoFpTrYorEc0r+kzZnd3J6tvzJc1x3hup
	 ziijyTaG52kahHUTGtJ3K6K3TOnGBb3h4J/oen6zuB/1yUoyuMC3/pGD7TbAxWOpeS
	 1z2CJ3lt0oytGm1H+1xBoH5Csp8ur+RUApCM2K8n09TIUDqu4Ui1UYpqwG/WGgEBOm
	 bIPOJ3nPowPZw==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87ikpq2rui.wl-kuninori.morimoto.gx@renesas.com>
References: <87ikpq2rui.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: simple-card-utils.c: add missing dlc->of_node
Message-Id: <173884154505.25441.2445691013259733955.b4-ty@kernel.org>
Date: Thu, 06 Feb 2025 11:32:25 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Tue, 04 Feb 2025 05:37:09 +0000, Kuninori Morimoto wrote:
> commit 90de551c1bf ("ASoC: simple-card-utils.c: enable multi Component
> support") added muiti Component support, but was missing to add
> dlc->of_node. Because of it, Sound device list will indicates strange
> name if it was DPCM connection and driver supports dai->driver->dai_args,
> like below
> 
> 	> aplay -l
> 	card X: sndulcbmix [xxxx], device 0: fe.(null).rsnd-dai.0 (*) []
> 	...                                     ^^^^^^
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: simple-card-utils.c: add missing dlc->of_node
      commit: dabbd325b25edb5cdd99c94391817202dd54b651

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

