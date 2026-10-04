Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E804A0F06
	for <linux-sound@vger.kernel.org>; Mon,  5 Oct 2026 14:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791209812; cv=none; b=DPWxq2JQj1r6JRqOVXrV9glFvOxGr9AQutT5lnv2NTQLz4zftaqcbShvdNaDNL9Aerw7s9jvXTWsuXZfaRXsEJbI1wJo99IIhuCJ1HWNfwibzg7vsu/4/kQWd5WFBh+FGjitJOkJQTxDBFnWk0pIRnn9qmoVjj8GJLPEIIf+j/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791209812; c=relaxed/simple;
	bh=tLjn9DBu8Gk0/0oZj95gaufwxU+XZHbhUxXWqSE3nWk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MxbWIuUbkuYcGn6wY0vqhtBJJ2A8+EU94UozZY/hW7SFuGGTyut7UTidaugca8d4/XHbcg7U69ZI0wTStN4RRSMdu6/9DaG8d738GrA+V+Ak+koUcDVr+AZsYIz1cnyTyesUavoynY4lvgCESo7X1oWm1/6rbVNXmVtOWFsunwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EpfZvpVS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EpfZvpVS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE5D81F00893;
	Mon,  5 Oct 2026 14:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791209803;
	bh=p72do1z1tYNSDe/rLdaSTeURy4tDH2fRuK5BGIDk+tA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=EpfZvpVS2PLbWMxy53Kfv2VszJKeSZUMcKUA14yQJFM7zegtV72RTAd18WpR1S97e
	 +EpK4YNQfQPxtOY+Ogs/SLRQvueTpOUeAhSa9T0Gpsx/5u9PVEdqOvEN+Y+SBlfOtN
	 nkZPivvw3iIEGoBKwsf0yeJpYRY+UVMszPm1pngWRokRzAfQ5KcReswhUclVqp8sdq
	 LKNisqh3e5dACXY8KwXaS58D4SynQ8VY2VyBGaHBtdF9yy5OGQH5Uttg8rLw5Qehw+
	 7Gn6bgWY8QxQFawpNQz5OA1t4uxQc+WNGgF3ez/4Hb3GBOnrcLMe/urty/69J/DH11
	 m0iTcFYGxwzGA==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
 Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87se2sel1q.wl-kuninori.morimoto.gx@renesas.com>
References: <87se2sel1q.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: codecs: twl4030: tidyup twl4030_soc_probe()
Message-Id: <179114635202.150114.6009256693094170221.b4-ty@b4>
Date: Sun, 04 Oct 2026 22:39:12 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1121; i=broonie@kernel.org;
 h=from:subject:message-id; bh=tLjn9DBu8Gk0/0oZj95gaufwxU+XZHbhUxXWqSE3nWk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqw7FF0uzmxPctawbIebfloTmH73f/YBa7sS+ha
 gCnuHlotryJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCasOxRQAKCRAk1otyXVSH
 0BuQB/9R4yDBDbeMOzxC5k944j111kOHjBAnJwMqdPS+MtQELJAC7e2Z/WlU/tedT0s4p57Ytob
 9paX8kAd2FwqwtTMnwP/0xXF2Pz+lfNgUvfQ1341NjFXbUi23IjfeVU1ygvtrHoRioZ17eYz2My
 Pk4ZX/9N3I0oxj+7Y/fkzodY3wuD4v5mBPh+eoFoi5VRZQ0TjXojhzHxsCKx+dwrRR4sREw1MYf
 dwtLV+xb4wbvwrYc9tziOJeiyVziiYc33MdgsIbIIV5TSGasEGG39o1f/1DBxP39jBdmmYDnrDu
 MfqpxZo/mEpZJMlWTiqKRCarybxysxHrg/gqPyCbkRe94KBc
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 29 Sep 2026 04:30:41 +0000, Kuninori Morimoto wrote:
> ASoC: codecs: twl4030: tidyup twl4030_soc_probe()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: codecs: twl4030: tidyup twl4030_soc_probe()
      https://git.kernel.org/broonie/sound/c/80ffb82a72d8

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

