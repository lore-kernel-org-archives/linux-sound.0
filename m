Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B25222575
	for <linux-sound@vger.kernel.org>; Fri,  7 Feb 2025 14:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738936960; cv=none; b=SEUShqmSy37AX9kpX8huwmiiHEfhk3qz7/Yv8z+p1xT8/iCaKcuYcduJzt8b3P33YKvZ9lJ3IBti7tP4M6a8ylJ13EXE/uQmQjqZK/q3zxQACIbi9MY1Irokp4MXn6kYdZc9PjRlovNsS9IUIH36eJn1hzn/01LCLvDU99IR52M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738936960; c=relaxed/simple;
	bh=ilcZGOV+xzCR0PmmeEUjaKaKTUlm2Tskrv3SZg9xgYU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CLnrQgKMSokHEwDvgUCW3yEflO+z1DEY/UcBu837XgRtWok9OZj2E2xNQU8dbmZI2NkxVMPC3cgQNIrSBz7WCA33imIpRRL81k4XmzHzL+1vkQm7fS7NJTwo89W0LMbY2hPWvbrOwvZKT++NciXRKZBD97cTp1ibC/gUYpwQKW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tEK8OJnP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tEK8OJnP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C39A7C4CED1;
	Fri,  7 Feb 2025 14:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738936960;
	bh=ilcZGOV+xzCR0PmmeEUjaKaKTUlm2Tskrv3SZg9xgYU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tEK8OJnPnxkZAADDsLS8ON/rpntXP4VmTpjr5B65FDFfYHXx75QeyAdrTQS2O0gAX
	 Gv80aAUO/xPdyJuYV7szhkh6XsQQHP3bj6i/cRXyAOnnmS7aGR4yd/cuJ2JCs0d9Vy
	 4SsNQGL1nK68R+4m6MnbarKkMjnLiN5+KQu78FAm4fDPXWXhGhWY2cUtq+lNOKTHPT
	 pp2uGzZSRtKuq9j2igNwdKkZhkLX/s/bzggK41aGo87WUbir8AKB5bYsvCNA4swRE6
	 mYM2FBe+Km4MqSiA0mjMFx60HVzUjQzOMBHDYmkzNhEEGFWGW8qjPJ8FDljNBJzwTM
	 tP8JWjdv2ehCA==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <8734gvsg5i.wl-kuninori.morimoto.gx@renesas.com>
References: <8734gvsg5i.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/6] ASoC: and adn use snd_soc_ret()
Message-Id: <173893695952.35212.8390725626245630548.b4-ty@kernel.org>
Date: Fri, 07 Feb 2025 14:02:39 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Mon, 03 Feb 2025 06:20:42 +0000, Kuninori Morimoto wrote:
> Each ASoC framwark is using own snd_xxx_ret() function, but we can share
> these. This patch-set adds new snd_soc_ret() and use it.
> 
> Kuninori Morimoto (6):
>   ASoC: add common snd_soc_ret() and use it
>   ASoC: soc-pcm: use snd_soc_ret()
>   ASoC: simple-card: use snd_soc_ret()
>   ASoC: simple-card-utils: use snd_soc_ret()
>   ASoC: audio-graph-card: use snd_soc_ret()
>   ASoC: audio-graph-card2: use snd_soc_ret()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: add common snd_soc_ret() and use it
      commit: 943116ba2a6ab472e8ad2d1e57a3f10f13485cc2
[2/6] ASoC: soc-pcm: use snd_soc_ret()
      commit: be61cd4242e4a53f5cf989ee7573121d041444bc
[3/6] ASoC: simple-card: use snd_soc_ret()
      commit: a0ef5b4b101424b8a666ed56bf1717dafe2d37f5
[4/6] ASoC: simple-card-utils: use snd_soc_ret()
      commit: 2d7395b23dbf4c2d60be49b73e4c4705fc446662
[5/6] ASoC: audio-graph-card: use snd_soc_ret()
      commit: 74a0ca4c7f19f1b273d665b3b53f7ae8af879658
[6/6] ASoC: audio-graph-card2: use snd_soc_ret()
      commit: 8d83282e53185ec257a4ce08812e8fabee2c7212

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

