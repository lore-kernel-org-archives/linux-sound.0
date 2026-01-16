Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7632C242D89;
	Fri, 16 Jan 2026 13:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768569753; cv=none; b=q0Q6VYBrkpylnCzaTf2aC5vJBiCG9aj3zs+t9wxQCJ6azExFKkBbwofRM+NIzvDQ/4d48fKvAZtfPp75uV9+PuST06h1Qd6I/pur0KA+N1Ab6j+HQ2WB3oD0Ihxju8XyaswJaVr2ZiqTHM7pwrdekuPx74hOwk6ltejN8lVvkWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768569753; c=relaxed/simple;
	bh=xrhESGLzVw7M+IN9/iC9C30M/sM7UwDU0NeFyrRVAoU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cGT+ARqOrguAod843BgnrRET/8h76RBRctAj4hVBaPhG0eIAdB3wMz81mQ+DFEovHd+ZfV9MOAObFJSBoD7+j4OfaNC53VYDoQQKyWwgMnjbFzWDEJ/gpxu1W9fSqdSJsjZlKgpzE1/+Jk9YNo8FGntY1iYeNQ3mp3zDJ54cROM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gMzII/38; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gMzII/38"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0B35C16AAE;
	Fri, 16 Jan 2026 13:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768569753;
	bh=xrhESGLzVw7M+IN9/iC9C30M/sM7UwDU0NeFyrRVAoU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gMzII/38GG2Ick/IcwHwcRHtIRzYtueTjPb7OYP8bnUhGePk0BKr+0FIfcoiwyZEj
	 sQ8MRmAT23xS4wyIUZEKD4hyqxR8Ih/MEl9fB2intIfjjhQSrZ/xCLZ3IelnfuE1lR
	 5gbf27WKbfJs1hVGyRvj2RGEpD5vGvZmCtKhwEoEDYjn/AunbTuCgT0MzqoKdiTLwC
	 FaRh+nNHHIsn8pvaNiCPnUIyt/RgbU0pDS7AtRoNbbuS+IPOvZ/SbJFuV4OF2wI0EV
	 2ONz1WPu4doA6htKkhhFzdxQHBf9AGnPND2wmUIvz2LNIZnXh+FFiKMPvzedDw4Lre
	 QM3YIEoyoXM6A==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Hsieh Hung-En <hungen3108@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260115161359.41979-1-hungen3108@gmail.com>
References: <20260115161359.41979-1-hungen3108@gmail.com>
Subject: Re: [PATCH] ASoC: es8328: Propagate error codes from regmap
 updates
Message-Id: <176856975159.65310.2733962757462297163.b4-ty@kernel.org>
Date: Fri, 16 Jan 2026 13:22:31 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Fri, 16 Jan 2026 00:13:59 +0800, Hsieh Hung-En wrote:
> In es8328_hw_params(), the return value of
> snd_soc_component_update_bits() was ignored. This could lead to silent
> failures where the hardware is left in an inconsistent state if a
> regmap write fails.
> 
> Check the return value of regmap updates and propagate any errors back
> to the ALSA core. Return 0 on success to match the DAI ops convention.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: es8328: Propagate error codes from regmap updates
      commit: 4711b292b440a8404833df0e0ba96dad86600a84

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

