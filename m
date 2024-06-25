Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6E11448D9
	for <linux-sound@vger.kernel.org>; Tue, 25 Jun 2024 18:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719339140; cv=none; b=opkyGEUgpuWHxN1pgEHLxkaRnHCBGswfSJ7FX489QgexnXSLTSW8/klm1mO1PQV4M3dn0Q+IjwBg5/5kZFZay3X4AdMGCBYHz7Q6O7Zdel6E8XBAQjF5jpvYab+4ePdoMMwEa23e4Gd1nTMN4QOkPhvMLdJG2YalV07Hp8CQehw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719339140; c=relaxed/simple;
	bh=TWGNtahYAoMWqUSJ23OCag26AT838sr09jwWwmGXRH0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SPiNwOZd/Wq/lNvYAoZ/OoQeuzPER01Sx7dG9/CxNQ8FEvw/y3tc5j6AhpRLx1DG9glZ2LyItAdM+upzYrs+I8NCuT5hUt5QmNZLGqO6QlxR2Apoento7igA6wIEV4YaekqHOFMBPjVk1VvFHafryowRHTJ3NPGhMvs6vHs1vMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W9XH+Hza; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W9XH+Hza"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 809C7C32781;
	Tue, 25 Jun 2024 18:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719339139;
	bh=TWGNtahYAoMWqUSJ23OCag26AT838sr09jwWwmGXRH0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=W9XH+HzaSfzkv7T+o/zL56JA4mJeQ+WXcWaOplEWV7DXc7XViwJYXoJoojxnP74mG
	 Bl+cuvSIJAr5z0cnjku5NnkrfHML2tz+5eZl4RsRCpezIDJ0r0mwuPlKWSbhOkSx8g
	 NwkZuwDTV9kP+KAiGAU4/2M67nxQLZSfnOGy59R+a9OUP1u0M/wvgYVeTatIBFv2UB
	 LlYG6tpyxVYkeJAFV31edjiwo8Xi64jMHOo5NZiWuEyyixLXgsnYOjkAE1UdDBBa0l
	 OLgD3kTYqEpoXXriy7+77LaOKvcHwk2pnsJyUJyd6pWVTzmbQI0dDMTg2lrF1TeDtA
	 XL2DI1nTlmfIA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Oder Chiou <oder_chiou@realtek.com>, linux-sound@vger.kernel.org
In-Reply-To: <20240624131728.1244053-2-u.kleine-koenig@baylibre.com>
References: <20240624131728.1244053-2-u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH] ASoC: codecs: Drop explicit initialization of struct
 i2c_device_id::driver_data to 0
Message-Id: <171933913823.1078071.14226460367405763719.b4-ty@kernel.org>
Date: Tue, 25 Jun 2024 19:12:18 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14-dev-d4707

On Mon, 24 Jun 2024 15:17:27 +0200, Uwe Kleine-König wrote:
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
      commit: 6f9faf1410fe151350ece4a93df30b9e06deec92

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

