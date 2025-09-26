Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC00A2F6593
	for <linux-sound@vger.kernel.org>; Fri, 26 Sep 2025 12:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758891005; cv=none; b=b3rC6tA5g9JCipPWkykNUolXAMT2oMloQ6T+n7oHdPzPsrJEgXGtXSkJm16dMTigzYRPNcu3lsAhs5cwePjEf0n7sEQgt3YIFOQGV/2PVFrhHOkvU3XquL3TB9LFvHfouJ1RqHgJQMkj05FD5ZftVw4yujrUK5P78I9bvB/E3O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758891005; c=relaxed/simple;
	bh=kA+0Ld9GdcXihQW88UHm3TJf5jvZMDqt/VfHJu9/tlg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aTcpIOre73mCjYYxEWlkxScO8vIL+vPX57hEig78xozHxgkmvM6luhIFBHYP5LYYSirXPufJTIcxDuwLaUxxNeBhC8v61wk1JN8cDRdBCj0YInXdj49uW+I2zmXCqoX+/NAWhPU7q/kw5rGBlYPdSsmzwoGs57l0iHSq0E76qpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SqA49oMZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SqA49oMZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 267FDC4CEF7;
	Fri, 26 Sep 2025 12:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758891005;
	bh=kA+0Ld9GdcXihQW88UHm3TJf5jvZMDqt/VfHJu9/tlg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SqA49oMZrl3gpt0L8I4xzQMijdfgEEBzUX5I4nRBj0sKaUAX1gVMAFe6nGlXvOpSh
	 jOJgVvlz4sKL4+ZOJfksWpDohfNWVVDh26KW1RBk3zAbDY4DTajdofK76vX9o1xt8q
	 Fm1AlOjR2OtZD7ng3Sw5gMbffpMecNlmwSvMXjXNWNfi4QAevTWSM78y3JlYqEFPEg
	 RKVraW+N435BBj0+mkbAK3JWcwSHLWtlLYgA7gngEwU5+csblp/zCm8AMUXIZo/Nne
	 pyZ1ubhp3WN7kdv1u8d+qeQauWQRdVbCeaaL9tJHjnWv9/YRXS3+doXRJeSuHjO9aJ
	 Xc/20TdAfZ1LQ==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frcbyuv4.wl-kuninori.morimoto.gx@renesas.com>
References: <87frcbyuv4.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/8] ASoC: renesas: msiof: tidyup to remove each errors
Message-Id: <175889100491.84679.16591281451509883333.b4-ty@kernel.org>
Date: Fri, 26 Sep 2025 13:50:04 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-56183

On Thu, 25 Sep 2025 05:16:48 +0000, Kuninori Morimoto wrote:
> Current Renesas MSIOF driver might get some errors. This patch-set try to
> reduce/remove them.
> 
> Kuninori Morimoto (8):
>   ASoC: renesas: msiof: add unique NOTE name
>   ASoC: renesas: msiof: use reset controller
>   ASoC: renesas: msiof: set SIFCTR register
>   ASoC: renesas: msiof: add .symmetric_xxx on snd_soc_dai_driver
>   ASoC: renesas: msiof: tidyup DMAC stop timing
>   ASoC: renesas: msiof: setup both (Playback/Capture) in the same time
>   ASoC: renesas: msiof: Add note for The possibility of R/L opposite Capture
>   ASoC: renesas: msiof: ignore 1st FSERR
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ASoC: renesas: msiof: add unique NOTE name
      commit: 030c59df83b448fc873d1caabb9ea077ae25268e
[2/8] ASoC: renesas: msiof: use reset controller
      commit: 25226abc1affd4bf4f6dd415d475b76e7a273fa8
[3/8] ASoC: renesas: msiof: set SIFCTR register
      commit: 130947b4681c515a5e5a7961244b502de2de85ca
[4/8] ASoC: renesas: msiof: add .symmetric_xxx on snd_soc_dai_driver
      commit: ab77fa5533e4d1dcfdd2711b9b1e166e4ed57dab
[5/8] ASoC: renesas: msiof: tidyup DMAC stop timing
      commit: 25aa058b5c83a3c455a2a288bb3295c0b234f093
[6/8] ASoC: renesas: msiof: setup both (Playback/Capture) in the same time
      commit: dc7473e6372ee36ff232af10c910ee3a8bad6447
[7/8] ASoC: renesas: msiof: Add note for The possibility of R/L opposite Capture
      commit: 8c363f61e5bcb92d5e88ca1b47be74be2683b212
[8/8] ASoC: renesas: msiof: ignore 1st FSERR
      commit: e26387e950ee4486b4ed5728b5d3c1430c33ba67

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

