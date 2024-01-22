Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A513EA88
	for <linux-sound@vger.kernel.org>; Mon, 22 Jan 2024 21:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705960450; cv=none; b=DjjMNsqg8m6OBauEHFd1h4SSYWIACrruDZa2i7FKICFAA5wVH73eMlxgHZzQIIfZ6eD51KmV0F4slb/70T6VrTh64KJzVvh3Egu+I2DYr4K8YXfrUc8rUmN3H9DC77n3Hnx0pq7GF+cpJ2Yhwb1BiRO8FGxcVH4+SpKr2FLCLUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705960450; c=relaxed/simple;
	bh=EeDjJlLHY6iFwJ0hkXfNBUcyQNF3sYQV0gkXYFzIUKc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eosC9ou0m2t7BMExOQ720+8DltB0ewVh+oZgN4xXDQwRo/MHZr2abmnLutWXS4rliYIJoEEgpct9YZA4fSjEQjzveOalckwhQUFWAe+GozuJSbJUaE2rBAFC09YFtWpj+J3QXQ0wiUWmPdaaD7WUb00sJxrwRv/ST+PNcDIDu2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qRGmZsG0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qRGmZsG0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7988C43390;
	Mon, 22 Jan 2024 21:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705960449;
	bh=EeDjJlLHY6iFwJ0hkXfNBUcyQNF3sYQV0gkXYFzIUKc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qRGmZsG0n0pbfTQwQgnz+TuBnM66swIVaH9h0QJShmFy6RXhQ3MCiJEqcFiTghpN6
	 8IcbTwBtX7aC0i64PwbrEYEyO2n+56CjGtSmPjoG7+AGL+lrmlqDMZBzhknrdkvrgD
	 YHofstpgXpfYwO+a5m22RQdeVErn2nkceiKmqzTPaIsc6m0SJ0O0dRbD6Y7cQ1llN6
	 d/NvJu7O4cAMl9gdUn1Wn6OoMsZQQ2wKZvAshAUlFEeEIshN2O82WzybfYWDGZDGAA
	 0XqAoc7JEy+1Q2v3TsZaNUJjvBEV1WIhqWpvozyq5NYHTsTwN2mTyBmLKCb0ZsLyg1
	 nqNHLFSwhv3jg==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Uwe_Kleine-K=C3=83=C2=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Jarkko Nikula <jarkko.nikula@bitmer.com>, Jaroslav Kysela <perex@perex.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <871qaoy9q7.wl-kuninori.morimoto.gx@renesas.com>
References: <871qaoy9q7.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 0/3] ASoC: use devm_snd_soc_register_card()
Message-Id: <170596044638.161959.8281079331696349966.b4-ty@kernel.org>
Date: Mon, 22 Jan 2024 21:54:06 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066

On Thu, 11 Jan 2024 00:50:09 +0000, Kuninori Morimoto wrote:
> These are v2 to use devm_snd_soc_register_card() on ASoC.
> 
> v1 -> v2
> 	- focus only simple case.
> 
> Kuninori Morimoto (3):
>   ASoC: ti: use devm_snd_soc_register_card()
>   ASoC: fsl: use devm_snd_soc_register_card()
>   ASoC: atmel: use devm_snd_soc_register_card()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: ti: use devm_snd_soc_register_card()
      commit: 98e9645a35993f8cfe99e36c9ba3e6a8c1783d78
[2/3] ASoC: fsl: use devm_snd_soc_register_card()
      commit: a4005007161c9df8fa4f44a776c624f68ec34a69
[3/3] ASoC: atmel: use devm_snd_soc_register_card()
      commit: 00352af2504a90381ec733237c3ef444032d5f1f

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

