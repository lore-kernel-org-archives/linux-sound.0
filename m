Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD693D904F;
	Wed, 25 Feb 2026 19:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772046417; cv=none; b=sJsRoDPss81aWXEAsot57TD/xZcuac37AV/sf+Y1CWnuwnHXy1d6vuoLcsPdzh67lY/dcKgVF9YfXnuPlUbjSpQzGF6IiMnS03k6TJgMAWH37YO1i3TWZ8HpmIsmD/iemUpwmoancHUBOSacVlxlq/ppQbuQFP0AWD0xAGVeE7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772046417; c=relaxed/simple;
	bh=msDGJt11R7pzkgyElkJq8JOnM1hRaWIvCs+4Qvb05Rc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ViVff4NJPUwTdz7mWTanA9m6pwnnUNIZjUiJ7MfG4Js3W2GBoG0RrPLpX6Hd4MpIwaszj8iXmRFwXO3+fInUSboOyTLJe/baW6aNvl+IY+9TDzfpI11iS69oJSwRO94/Y/E6+RX+PTceBq8GDQzCra7EB/UqvH6Yf8qwI1HrnPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R5Of7Rtu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R5Of7Rtu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A0D6C19421;
	Wed, 25 Feb 2026 19:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772046417;
	bh=msDGJt11R7pzkgyElkJq8JOnM1hRaWIvCs+4Qvb05Rc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=R5Of7RtuWYFoqO6P1UgomikjL9MElesCcfQJcrQbwVRgKlQBY7pMdh5Ns9TMCn/VE
	 n+b5wSyjwHt1XBTIhaDRc5DbuvNnTRHyR25ybLRsyOAUGCN5Esv68+veCJSVDb0Xr4
	 pcNNfcpPHDFVg8eKIGZP+St2FVoJz11UxHn62BeUnb/4sVLXtc8kGBPXyS2MbrCeqA
	 OxJ0SR0v8bIWw8vKV1+ed/u6Xm7ECTxHsBTSYGiNJDsyJ3KFV2k7Xp4mekkIJZ4497
	 kwfKHeZH+WctaGIUUZO+84MSGkCcMh50i+tllcOBNJ3tDGrABvWfMAMhBAM2hjgbFh
	 gi7kB6Vy6Vk3g==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Marek Vasut <marex@nabladev.com>
Cc: Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
 Kevin Lu <kevin-lu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Takashi Iwai <tiwai@suse.com>, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260220202332.241035-1-marex@nabladev.com>
References: <20260220202332.241035-1-marex@nabladev.com>
Subject: Re: [PATCH] ASoC: tas2552: Allow audio enable GPIO to sleep
Message-Id: <177204641517.168100.14910312125326255613.b4-ty@kernel.org>
Date: Wed, 25 Feb 2026 19:06:55 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Fri, 20 Feb 2026 21:22:19 +0100, Marek Vasut wrote:
> The audio enable GPIO is not toggled in any critical section where it
> could not sleep, allow the audio enable GPIO to sleep. This allows the
> driver to operate the audio enable GPIO connected to I2C GPIO expander.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tas2552: Allow audio enable GPIO to sleep
      commit: 5ebc20921b7fff9feb44de465448e17a382c9965

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

