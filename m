Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8534CA28D
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 16:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785343060; cv=none; b=ZZPpjdpkLvq2AoQtBfX0kFJaE4FYPlLm2VGVbNswYq4JSkdA9zQt9nLkKIW9JTiWKyoviP/jAo4szYNkaD/B8DkLY1WvSnhVCxJc/JFh4zHnbRYPt94JPBWpwcUgPCw7w7pOfnbkUdq8U5HKFeq+QWhU2PPOpU+iRHGvsEch/YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785343060; c=relaxed/simple;
	bh=7G9RBrNZPnId9ZrdjikI/MDofqqUpHk8dwoyivZGaP0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=p4l2U0SZsPe9EIzX+1x4AZ4lHtGyQPLMA/e6DS10QXFhJJdimaroc0DSzgXTiWOynEmihIapXFckdkPWEYm08bH8pCGxPwXU1V/ExKGG2fqPbViWcyWdE7KJoOYYeInxFy2ZR+jfp+lN08cmAuSBKJJ5SrQ6Yj1enudFr9gm/R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nCuN/i+O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nCuN/i+O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 210331F000E9;
	Wed, 29 Jul 2026 16:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785343059;
	bh=nmFWpe5sw4kezasrGIZMd93oHFRy/Oz5dpOJTCIbjbs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=nCuN/i+OaEQIxuywtbn0N1onQrcI0DEJk6QvjQ5BqLHTf+utovCc+4TQZp/+s6uGc
	 zHwxIQVNaDpTt99zKccDwRQ7ayVcGKMKY0Cv0hpm+Yvvkf9YvlU7WlB9NCtplM6ZM6
	 dbTC7fXr6tES/CcUC1XGyqy4MEdQ0ayLTKsBVU06+8YDQ3ZFnYn9YzUC09nSfiwCJF
	 lPpuudBQk57g/HVLoZvbx6Pkcf3UlviQ69HeW/F1+bVYtBgbYlrIU0DNp2/Ihh0EMk
	 lnvPYOsFUG4LZsYYSTdga/vQu5TjCLUR0YWU2EuwF6vH2AHD7GBpjVEAEIGLw24t7+
	 9WFHJEwHU0tEA==
From: Mark Brown <broonie@kernel.org>
To: Jarkko Nikula <jarkko.nikula@bitmer.com>, 
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
 Sen Wang <sen@ti.com>, Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87ldb5i0do.wl-kuninori.morimoto.gx@renesas.com>
References: <87ldb5i0do.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/3] ASoC: ti: preparation for Card capsuling
Message-Id: <178533670225.172652.9359583296193828737.b4-ty@b4>
Date: Wed, 29 Jul 2026 15:51:42 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev

On Tue, 21 Jul 2026 01:42:43 +0000, Kuninori Morimoto wrote:
> ASoC: ti: preparation for Card capsuling
> 
> Hi TI developers
> 
> I will post Card capsuling patch.
> To makes its review easy, tidyup its drivers to reduce
> un-related diff as preparation.
> No functional change, but is preparation for cleanup driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/3] ASoC: ti: omap-hdmi: remove unused *card
      https://git.kernel.org/broonie/sound/c/9af2c1d4f847
[2/3] ASoC: ti: tidyup not to use *card on rx51_soc_probe()
      https://git.kernel.org/broonie/sound/c/4bd2afcdc837
[3/3] ASoC: ti: ams-delta: use &pdev->dev instead of card->dev
      https://git.kernel.org/broonie/sound/c/3596abbd7bb3

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

