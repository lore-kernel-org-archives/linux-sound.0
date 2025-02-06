Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7D4227B8B
	for <linux-sound@vger.kernel.org>; Thu,  6 Feb 2025 11:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738841547; cv=none; b=lR7KE71B48GtUG+2cr+Hkp1rKpelEZk8E9wfxecysBYTDTD4qxeRQEO2a2AFeQL1PHcnlY4dhxTI34QpWgaNG+vCaOueIs8qCRWZHFlRZloBn2v449SOa7kMgT5x+1VnYIsSGpQG0kBV+f1Sloi2KIvBNlYWjKGksLLJrJ8EvyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738841547; c=relaxed/simple;
	bh=zfNBQCYvJem1DS8A1K2SYJn+UOYX/hEd9jHhv7egQ1w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=G1FRxJOySD/hL2alzVf6a2TG9sddH0ABu/Dup5duOXc6ef443dS9hON7guTU8P4duiJL2wtPBXc6kxnEcrq60qzkpthcMaHqGlFhPphaUJcXdBZjX4C2L3ZHF9RgMRsu3b8SbVLbjyjo4zTrkIGG1A2HhonWrPR8WOdj/krD5tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KfqAkqOg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KfqAkqOg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EE74C4CEE2;
	Thu,  6 Feb 2025 11:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738841546;
	bh=zfNBQCYvJem1DS8A1K2SYJn+UOYX/hEd9jHhv7egQ1w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KfqAkqOg5ElM61eMgsduGbgAX5gvd7fPVHXi1rohp0272lGdczrAss0if/FfzRM0d
	 ggFIjSew7PCILmAIoEMWyZvCfO6WCug6LCNS0zvjE4sChmVzIFxEFpYIEC3JiV+WR9
	 21JeCj32t+OQ77qOUnGldqolYveABw7qOoAZbyqqLt2vwcfK0v8JKimdxoJud5F8X6
	 P8uzD8C1GEIAnaGxo8H1zc9ptu1iLJ615vPG8aT+0JeL5GtGOxn+Zz9o2A68sV1a8K
	 N9p54pKehUhQeW6E5InHGHM88JzIwmXjWnrtSJTvcM4jrSZEk3/0wGjbiCgkCUDEjg
	 C4B0HOWViJ/IQ==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org, Daniel Baluta <daniel.baluta@nxp.com>
In-Reply-To: <87ikpp2rtb.wl-kuninori.morimoto.gx@renesas.com>
References: <87ikpp2rtb.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2] ASoC: simple-card-utils.c: add missing dlc->of_node
Message-Id: <173884154598.25441.5213727519810726197.b4-ty@kernel.org>
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

On Tue, 04 Feb 2025 23:50:08 +0000, Kuninori Morimoto wrote:
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

