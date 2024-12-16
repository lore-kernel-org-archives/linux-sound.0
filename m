Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14E213D89D
	for <linux-sound@vger.kernel.org>; Mon, 16 Dec 2024 15:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734361952; cv=none; b=D4DS5kK3usnNpL0WRlslemZfc7yYdNrgrf0gSGC2WH6ZYteQg3APgzTJFX+Ou8u18j6mWNEu3WMij8q0Dz5GJEIaRzTw5OfBayS4bMgP/dvpQVPnU6tkeMMd6oMtcPZm8tKxNGxE+89PVa9vNRG2l1zSVvQ5dIIaRGY1lUlU4Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734361952; c=relaxed/simple;
	bh=S2tj6abjGoV8Mlmnawq1BhlSGTDo28XWvPVjnMDvqVU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UmkLTg5a+TUgtk4OwCPrMvCM1PBeLg7kK0Ppo2eMR9pSGmi1/k5vj6mlAPqf4o2cT/2kgkOGmXf8pNMfdNypdJUNsBvcukz10n1VuHQJy68VCvY4AoPwJcMrAFLc9qRg/90yqWWSeCICZ/MWklu1iEBqaccHpb0mOKgAeEvsnns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ybvid/MQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ybvid/MQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD77AC4CED7;
	Mon, 16 Dec 2024 15:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734361952;
	bh=S2tj6abjGoV8Mlmnawq1BhlSGTDo28XWvPVjnMDvqVU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ybvid/MQtLZzSxyOoYNUTFgjsdYe5a+SisFupfrTZMaicMG0TxSYNqFRLJkuBUxrQ
	 M65mSz/+Vtg5+7Jwfop1HfnnR0IPaLeeaSwFsJ9Mkcsl3GTXVRiQkF7wBc0cEN04YB
	 WffksWkXYUUFm3+8EeK4AlxJUF+WVxvKNns+AhOpKRFB+1bxVU8JJ3UucGGxIlpoHw
	 7e+gbbxiBjldDVVE2BDROiZ0rUG9UtRdE9+FYDCUSuOAiOTmPlkXXY8HzXHCnvhjqc
	 T3XzUH/NDda1G4a5Y58tgIdeIJ67oYxrcX4PEfGwn33aYsmVb2cRskQrpf8OC94s6N
	 RoCghr9iIo4fA==
From: Mark Brown <broonie@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87bjxg8jju.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjxg8jju.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2] ASoC: soc-pcm: don't use soc_pcm_ret() on .prepare
 callback
Message-Id: <173436195163.77772.5695960249940886583.b4-ty@kernel.org>
Date: Mon, 16 Dec 2024 15:12:31 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Fri, 13 Dec 2024 01:21:10 +0000, Kuninori Morimoto wrote:
> commit 1f5664351410 ("ASoC: lower "no backend DAIs enabled for ... Port"
> log severity") ignores -EINVAL error message on common soc_pcm_ret().
> It is used from many functions, ignoring -EINVAL is over-kill.
> 
> The reason why -EINVAL was ignored was it really should only be used
> upon invalid parameters coming from userspace and in that case we don't
> want to log an error since we do not want to give userspace a way to do
> a denial-of-service attack on the syslog / diskspace.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-pcm: don't use soc_pcm_ret() on .prepare callback
      commit: 301c26a018acb94dd537a4418cefa0f654500c6f

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

