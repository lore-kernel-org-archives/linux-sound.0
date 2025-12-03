Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB688302CA5;
	Wed,  3 Dec 2025 14:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764773650; cv=none; b=qYbX7ln+HwOY1fe+FOQozYrqW3Khts/X0rmXrb5u4Zd4j4bJy42LbAa6I6+fxFuzxwr4PxiAK8o9zCAPCM4TXBUd1JKbHoaQEpNPRdMi0pX+4flXCy2yagwLhcRnf2+zzbyhukjqPbEKOUyn1bagxxBMSUxteSKzL37iDWYnoqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764773650; c=relaxed/simple;
	bh=IlyOha3+/9Anp2osgPtT47q3caxXqLs0sw5e1xfjnWg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rSU2uSG82s7wLkSXiuMuWpLgY8J89RtcGkgyKgFXZp2uwCjf1W/eaoVBCKKoEeuwxjBqMVjguwzOsDmZ8UJPYoy6P0NPuuVbdy9ZdolZmI1/tacTE6dfS8xgSqo7EBGGYH1oYTLFAG9TJUzqDNbrw6f+PjAN32j64rpYogOHbFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=efqZ4Xm1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="efqZ4Xm1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9ECBC116B1;
	Wed,  3 Dec 2025 14:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764773650;
	bh=IlyOha3+/9Anp2osgPtT47q3caxXqLs0sw5e1xfjnWg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=efqZ4Xm1DvKsw0yVoIXszWs8VPJEUIrWDUIJZgoPQwMyEVYVuWZl+/0A1Lfkq1grr
	 3gfF6/CXfAGarBf3I5AizIj0uAwx0myb0ao4mX/afgtRipzZ5ms8J8DxkVkn0moniG
	 fRJWXwgSbXyCWCN8xdaNpWAQvljnURo3HAyi/gN24M+wX2WlQsZYa+oERaAHq1qs7N
	 4c+2Ko8r5S3TYmuaQ8pYJx2hCue4KQgS50caCmhxWdY0fpBi4R8N5cqXDjZhRpxjLj
	 Au5xwtJE3Zj5V/5Z1zYzdUS0S6Ly9VS/MwQbKZF/xRj+LfaoXN3Zwy+/rW6GejW9/D
	 r6Rs65rEW1Ofw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Haotian Zhang <vulab@iscas.ac.cn>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251202101642.492-1-vulab@iscas.ac.cn>
References: <20251202101642.492-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: bcm: bcm63xx-pcm-whistler: Check return value of
 of_dma_configure()
Message-Id: <176477364868.48347.7323460562222971120.b4-ty@kernel.org>
Date: Wed, 03 Dec 2025 14:54:08 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Tue, 02 Dec 2025 18:16:42 +0800, Haotian Zhang wrote:
> bcm63xx_soc_pcm_new() does not check the return value of
> of_dma_configure(), which may fail with -EPROBE_DEFER or
> other errors, allowing PCM setup to continue with incomplete
> DMA configuration.
> 
> Add error checking for of_dma_configure() and return on failure.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: bcm: bcm63xx-pcm-whistler: Check return value of of_dma_configure()
      commit: 0ebbd45c33d0049ebf5a22c1434567f0c420b333

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

