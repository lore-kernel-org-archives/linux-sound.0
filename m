Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0512A1FBBD2;
	Mon, 13 Jan 2025 16:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736787429; cv=none; b=Nq8UURhWwGu+DqBgTcU+hJ8ELbPkyx1ZeKCfbh08LaaI8lgFy/65zNoOGFddkWyHUiaiiEuSV4blzHMaSNOrGp3nu+RQ/4CblgNjVkXWsK4XAaghXSQ0a6ItgzVnt/USqbb0NDgzt3eTNqQ6nqun7Cmggw6tnscsxZfsapeMLOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736787429; c=relaxed/simple;
	bh=6zHHYWKunh1M6enMUeVEE9Y9YBnnSAPsE4K1pjRUkcI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VeYtJkwInJ4WYmTGvBlAOeA5HBCD7bi3UmM4EZbokrX/BmJAvJXygbs9ohQ+xtl58ppOScdCRYH0QgJU0y/zH4OizcQ2vEtpwclu9Bdh1jqSDYG1wekTcZ90/jDg6UilvrriK8w8IsifST0fzJ2j9DEFx4GjI03NDrcvN0+d/OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d5HScDVV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d5HScDVV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79B3AC4CED6;
	Mon, 13 Jan 2025 16:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736787428;
	bh=6zHHYWKunh1M6enMUeVEE9Y9YBnnSAPsE4K1pjRUkcI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=d5HScDVVKb+DwfnbCcV97/QF65GOYRX+jx4ie0+HUelITeYsvWlQ9cBkTCr24oE/a
	 iXauNEme1/v3qzVJDsUBM6DPgb35WmlHzAaXH2RXu3OybMl8r3oQ9gxgIcTpCVd7+3
	 8mSoMjL4yxD1Aa6QV85Al6v9YbOtTJOVwyJhDebb785CaDcVuhKxJnIIwlbQPj49NE
	 GzZMjFNxDJPkXxErwlt76ewBfR661vtAWXQMLR8DbdAKyGs0X5ys9Qq4dSXeSCQE27
	 eb64ETmhE8zLC5QZ+mwsYDlDSK5+Vct0ACPc+NkG2j/yb0c2/5jugtRMKBgBQ5uWfF
	 MP3cVr0H4NbLg==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, 
 Maxim Kochetkov <fido_max@inbox.ru>
Cc: andy.shevchenko@gmail.com, u.kleine-koenig@pengutronix.de, 
 tiwai@suse.com, perex@perex.cz, lgirdwood@gmail.com, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20241219042227.7075-1-fido_max@inbox.ru>
References: <20241219042227.7075-1-fido_max@inbox.ru>
Subject: Re: [PATCH v2 1/1] ASoC: codecs: nau8824: fix max volume for
 Speaker output
Message-Id: <173678742609.75237.6112979080454530319.b4-ty@kernel.org>
Date: Mon, 13 Jan 2025 16:57:06 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Thu, 19 Dec 2024 07:22:27 +0300, Maxim Kochetkov wrote:
> There is no audio output if Speaker volume is set above 25.
> According to datasheet Rev 2.5 maximum allowed value for the
> Speaker output is 0b11001 (25)
> 
> 0x6D CLASSD_GAIN_1/ 0x6E CLASSD_GAIN_2:
> 
> Left/Right Channel Class-D Driver Gain For DAC Left/Right
> Input
> (Step size is 1dB.)
> 00000 = Mute (DEFAULT)
> 00001 = 0dB
> 00002 = 1dB
> ...
> 11000 = 23dB
> 11001 = 24dB
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: nau8824: fix max volume for Speaker output
      commit: d5a4d7f10fcdcae952f7d5c603c61795c0abb7a7

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

