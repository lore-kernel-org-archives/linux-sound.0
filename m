Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB06E16F271
	for <linux-sound@vger.kernel.org>; Thu,  9 May 2024 15:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715269131; cv=none; b=X2lmIb/5LEXRT8ECVai3/9DgeTZW4VvUUz1qjwUolpJbRnCPKZdOUbBwc++umS3BBTHiWsiKJ0a9AuZgEFwMnIrvKdp4LW0pZ9Wj1OezLylJ9qN9DKUIo5bpBZMUbS13WUWOouRFzthIbC+P6FHeoxrmhdiwx5cnvRWyooc4Y8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715269131; c=relaxed/simple;
	bh=ib59gs671eIFxci9JAATv1CA+bBC9vQ8M3fGi1+SZV4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dCWmXBxqnBbMT1CxaVhY5RH4K7Hw6GrEkK+m9+64hI20QCGxSRigelk2mvCPQCN5i7dn2YTBVsFe4aTfuIabbBeZa2Yh1p5RiAWNoEzv4fGvcD5VxzCvX8zLkVk1VLRZRIQVNv+z4u9UQw+5um0F1K011IBfgTof8W+HciTqW7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=duMt6uKi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="duMt6uKi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD725C116B1;
	Thu,  9 May 2024 15:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715269131;
	bh=ib59gs671eIFxci9JAATv1CA+bBC9vQ8M3fGi1+SZV4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=duMt6uKiA+A9Ku+w0XzEQWVZiLCLf5w80y9R+qjWZYKx145HiKFUaZQZEJ/JwqW61
	 9/DsxCIvSYs7tg8I3NvdrxX165nlByUekTgvpRvxM4N1QozamRZ7eHgrQpwL11RXEJ
	 oVKC+lEBN0dY1QDnyOGcge7nrESxy3Vt3igW7d2hfL34eNUitoUgOL+sFiSmRImR2K
	 nDeTsUwfj4sQPhOI6zK7O/nY2rAL4BNXISBsyh2r6glAHmvxdq7H6CHAql4qEhBtT+
	 j61+xQB02KjW3FvkftvD7Er2ZRzz7bBryS3o76lfab4acBjBtClxFuKnqHQhCw8qUI
	 W8CtYmDz31YNQ==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20240508091909.27062-1-tiwai@suse.de>
References: <20240508091909.27062-1-tiwai@suse.de>
Subject: Re: [PATCH 0/7] ASoC: Add missing module descriptions
Message-Id: <171526913079.2035009.13561896359568027660.b4-ty@kernel.org>
Date: Thu, 09 May 2024 17:38:50 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev

On Wed, 08 May 2024 11:18:59 +0200, Takashi Iwai wrote:
> here is a trivial patch series to add the missing module descriptions
> to ASoC drivers, as make W=1 starts complaining the lack of
> MODULE_DESCRIPTION() since recently.
> 
> The whole sound/soc/sof/* are untouched as there are too many files
> involved, and I left SOF people to address them.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: ab8500: Add missing module description
      commit: 1dec672e8686b824aa8742cf9cc00748289de95b
[2/7] ASoC: sigmadsp: Add missing module description
      commit: 1a7dc1cf9e46d2e4c732679775c3a06fba9d94a8
[3/7] ASoC: qcom: Add missing module descriptions
      commit: 6d21f0a2be88d34e53fcbf66fb8e298787837c01
[4/7] ASoC: dmaengine: Add missing module description
      commit: 2c846d7cc4ee3382aed6dfd322fcaaf309eb2c9a
[5/7] ASoC: topology-test: Add missing module description
      commit: ea762d10b92a423b6e4980241a7bfa809c7cffd1
[6/7] ASoC: ux500: Add missing module description
      commit: e85d8aeef23376ef10569c555819d301f3364f28
[7/7] ASoC: xilinx: Add missing module descriptions
      commit: 3423ad19ea912694a15ebbc48cbc8e1fcd8439da

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

