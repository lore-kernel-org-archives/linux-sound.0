Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2F3346FB3;
	Tue, 27 Jan 2026 12:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769515743; cv=none; b=IkFkbnNVMCYJch1GrhM9L1KeNBWNA4MF5Nve5uKv5fr/QUCjgqt8CKaQJLtAwV/Z8HWD+Q/dY7YhYrIBwhoPjX8iFBXH6erSDL3BJgnrbA+7qjsTlCcIe+3tkqveTV/13f5o/Dr7recjlCHcYpWWjGM4ow80A7AtBUpPMgkiUmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769515743; c=relaxed/simple;
	bh=onoAXKcebPiK74hhYbHqN5FPyIXQ7YiuU/v8INz84mc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mjukaLCBm+JumnMfJESQ++3E7Ukw17kvjA7yiF9xWgAnscboadd69b8IWG2nl9SEOkcfh6vQcVfG/LnvRIGw5WzELChEZFmlRPBOdG1nUmpO577iF9NkXUjPTn6nxTqHSs6NeOtk4g/4IN9aFh9+Q74cl9Uwr8BGPcqlcoAxkPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K0dpBz7F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K0dpBz7F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EA71C16AAE;
	Tue, 27 Jan 2026 12:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769515743;
	bh=onoAXKcebPiK74hhYbHqN5FPyIXQ7YiuU/v8INz84mc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=K0dpBz7Fyk/c2KgKLR3UnsBpB4iuex1BLfRoAfpNjfMtTl1cdTINjmivp0tmEUZJK
	 igSh+V/Zahcz15KSPwr5OujNDVVlb6E9U/5twr+hwHjxtBdYtZ5FeZLRaqEVBdsxVQ
	 nyDZmflZkcTRKC8xuA5u7Ns447hel4twtlz7WWx4iJw4BqLDc5jFqWclHk+45Qfp3Z
	 QY4oLzUTr+8a2hPIHrBMVYRvF3gA54DLqxaJYSTDTPW3+IHksp9uKt6iy2QSiSkGY6
	 msbJvuUmz7HCRnzBULCXasCvNsEn/wdItDzBLkTplunL/XPdeBauO/AlOs+8nAw/nk
	 Vz9UP1afzGkiw==
From: Mark Brown <broonie@kernel.org>
To: Shuming Fan <shumingf@realtek.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Oder Chiou <oder_chiou@realtek.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20260124101824.3424793-1-andriy.shevchenko@linux.intel.com>
References: <20260124101824.3424793-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 1/1] ASoC: codecs: rt1320-sdw: Refactor to reduce
 stack frames
Message-Id: <176951574198.80702.5387546291463369922.b4-ty@kernel.org>
Date: Tue, 27 Jan 2026 12:09:01 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Sat, 24 Jan 2026 11:17:03 +0100, Andy Shevchenko wrote:
> Compiler is not happy about used stack frames in a couple of functions:
> 
> sound/soc/codecs/rt1320-sdw.c: In function 'rt1320_rae_load':
> sound/soc/codecs/rt1320-sdw.c:1570:1: error: the frame size of 1336 bytes is larger than 1280 bytes [-Werror=frame-larger-than=]
> sound/soc/codecs/rt1320-sdw.c: In function 'rt1320_dspfw_load_code':
> sound/soc/codecs/rt1320-sdw.c:1786:1: error: the frame size of 1520 bytes is larger than 1280 bytes [-Werror=frame-larger-than=]
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: rt1320-sdw: Refactor to reduce stack frames
      commit: 233ccfe911aa62c0f9211f2e3297d6a7f870b295

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

