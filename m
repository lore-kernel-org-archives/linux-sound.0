Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2035F28B7C9
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 08:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752134964; cv=none; b=o3Xbqfba+EUjA0HZEfzWH7ezDfD93+1MDnw0rc5r1tENzOegSMUKQ+TrQiPmk9S0FRI51rBXODA6IC1wKbRF1DO4wfk0bkw9T8jH/ZLj3LddG3HybtQkz1fK3vHgHlWHHwltneQnv1+O82PwZi7M1cyDdwj+UUxvpKfpFfU5naQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752134964; c=relaxed/simple;
	bh=7Ns27rSAsHSLotF8jdlMtToKFxKiTueUB35ioPC9hiA=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=D/raJG6k0/Y88qmnDamZHpBkGLyg+AWuM46/E+PjpPSYWlFDmpLemTPCidRq3pxCraP8c+kHopE9eVYN9qUIFiC/DRG90GeeN6trwnLQEy4cyasVPzE2v9gSPV5MhBrD5L6ZzhCW+Zxg4gMjho/LbJr/mvjmHr4HB0l742F7SSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p1PZR+wo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p1PZR+wo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26FBBC4CEE3;
	Thu, 10 Jul 2025 08:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752134963;
	bh=7Ns27rSAsHSLotF8jdlMtToKFxKiTueUB35ioPC9hiA=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=p1PZR+woCf8BH3R66gDgHzHIFfpiT5no7wyeLGrdvkxjirF8HhpMf+a5esK66HqIM
	 Vwis/AXaAjim4TeAxEQ7QhaLCEARS14hYHMYBZGFZLhmqyS6dXVc7bPT1s6Eg7wR/0
	 7IQ4rT/HbHJCKvq5nXViOnXvK/xieNV87inMV0meyoBA6BYKn3EuwRUffMu8b1jEpz
	 WUcgQrqtjAIBJ+a64cER7sPBarMu0hJJZF1iI46+K8I1Xm1J5cJoEYefC6coS54CLx
	 7o1W9UVnaAfu+TO5zWuJEsEF6eh2dAr2Hq4gGpDT+dqjHCbRi7/b1WZlqMfD5+uAlX
	 OaDoo4NHykYSA==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
 Oder Chiou <oder_chiou@realtek.com>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87sej7mmbo.wl-kuninori.morimoto.gx@renesas.com>
References: <87sej7mmbo.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/2] ASoC: don't set dapm->bias_level directly
Message-Id: <175213496155.702408.11519434898385946511.b4-ty@kernel.org>
Date: Thu, 10 Jul 2025 09:09:21 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-07fe9

On Tue, 08 Jul 2025 02:46:19 +0000, Kuninori Morimoto wrote:
> We have many set_bias_level functions, thus dapm->bias_level should be
> handled by owner function, not by its callback functions.
> This is Step1 patch-set.
> 
> Kuninori Morimoto (2):
>   ASoC: rt700: don't set dapm->bias_level
>   ASoC: rt715: don't set dapm->bias_level
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: rt700: don't set dapm->bias_level
      commit: a3c3e84fc495dd983374f041e145e13df3525a15
[2/2] ASoC: rt715: don't set dapm->bias_level
      commit: 67bdd67aedcec8c63e3158c3c82991fbde0c4d22

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

