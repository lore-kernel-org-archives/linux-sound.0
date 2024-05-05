Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E477B376E6
	for <linux-sound@vger.kernel.org>; Sun,  5 May 2024 15:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714921392; cv=none; b=OXQsFMdznV/PSMFvsYGMD1dSiW/AStAeJkNrGIWg64fhZdhLg1puNtDkGbP5Xe36HIola5K14KwWz48VdjsXMUy58rVP0F2Kua7x2ifsjwmGaiUkPuNKdKe6aQ2O7LwJZjuFFX/llZagWoWzB0xYdGOpXOPm1pdUPEuauBYFdbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714921392; c=relaxed/simple;
	bh=aaWY3YW5vu+MJcht4MahH1HYM7AOmCM1zQmPkE3E/e4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=m4h4h/cuHJSIp5uVx+bF0zCCJ9MHG6P3vPnO7he6rx2htIX/huay8OEBlqHdjhU9HwKc0fVMDrNw8alSUCC97oygsvKVkJgGK8QS+we0gEGkY3vvfdMISJwIC+SdbewNH1IeRnLSuOof5i/GKyFJhxCfwiuX7y2dKwO40DcL/LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hXV1rdkq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hXV1rdkq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 211F5C4AF18;
	Sun,  5 May 2024 15:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714921391;
	bh=aaWY3YW5vu+MJcht4MahH1HYM7AOmCM1zQmPkE3E/e4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hXV1rdkqcvLp5eXPht+hHK4VlrnCJ8FdhGidjEpAN1ScqPEo78I0m9yZZG2osyLKk
	 680AGkdmh1myU2LH2fSypQwN3HGbWEYX9bveI95VnEysVGgALkTkp7ZpQt8jWPIRFq
	 RbrNzj6L+A8ApYJlrU2iYC1qhaw50ZxhCaYJAfPmJeAl1LawoyJQ+/yLpum5NfVKZT
	 aVh7ctbo/EA30Nye/q2/8LvMusNVvgFo54LN/InnXz3DbxikDO1gkd8hsccUMaeyE9
	 kKv+kmg6R/dQ3BeFzWrqL2RUy6XgBjrlszNYuWFC7ESes1uZrJZXbg+MbrvWWLB+LI
	 F36WIg1sBVrbA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Andy Shevchenko <andy@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org, 
 linux-sound@vger.kernel.org, kernel@pengutronix.de
In-Reply-To: <20240502074722.1103986-2-u.kleine-koenig@pengutronix.de>
References: <20240502074722.1103986-2-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] ASoC: codecs: Drop explicit initialization of struct
 i2c_device_id::driver_data to 0
Message-Id: <171492138878.1933443.16726044818716946890.b4-ty@kernel.org>
Date: Mon, 06 May 2024 00:03:08 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14-dev

On Thu, 02 May 2024 09:47:20 +0200, Uwe Kleine-König wrote:
> These drivers don't use the driver_data member of struct i2c_device_id,
> so don't explicitly initialize this member.
> 
> This prepares putting driver_data in an anonymous union which requires
> either no initialization or named designators. But it's also a nice
> cleanup on its own.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: Drop explicit initialization of struct i2c_device_id::driver_data to 0
      commit: ba2a2c378ada0cd641a1887151ea8af532617c69

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

