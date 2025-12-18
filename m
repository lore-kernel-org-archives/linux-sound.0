Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB0E339860
	for <linux-sound@vger.kernel.org>; Thu, 18 Dec 2025 08:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766046071; cv=none; b=r+yk+BSiUYU+s8oxQy3hGYpVK6rGf/3ngsvF1DVVUgPB44sHKOLCNIW8Wv/6h+lotNrG4kVzUInbEsNJW9KHCg6hH4FeGVKEy4zlYmW0jTgG1YFXIwvEAgO8AdfYBpZoymzWgIYTf4haJ3jBgRPeouDKUzsX1huQw1GVmGPiB1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766046071; c=relaxed/simple;
	bh=p9NXeTfjJ+L71GCYsrXIefqc0vqv1mQogRCm7XVKb0g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oXsrDmwj7nfRrDb8vqwD0tIgpv33ZPp32vjxxVIvCvlPLb7oN3JKOSzHpD42u+s8WFROeiqDPmJD36ATQc3bUT4ZUW7iZ14SSknglY3rUepJPvPBQAMpoOt9TMIxgaBjDXJUVEeBfu3UfTus++le5Wi65V+XysMyI4XtG9+NJxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dD3FFTGa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dD3FFTGa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DD22C16AAE;
	Thu, 18 Dec 2025 08:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766046070;
	bh=p9NXeTfjJ+L71GCYsrXIefqc0vqv1mQogRCm7XVKb0g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dD3FFTGaJ8vxmGD9qO/4NZ1PQbfDu4mbzOmGNEB2RAam3xMpgXhhQMZ2gM4qH/Z6W
	 603jUUO08lMgUjZJ2+sRX//dPosP/NV9GMdEYyk+jRquqLZ6WVWxQt+pgNZwiWYRLG
	 5Mk+CBb2G9lhFRnOkJokma+Wq8r7OTwJQGuWWV2ctEUY0xLODlPuXp5s8qzQVI3WJk
	 TIOGVXDdrX+r5cLwlnKv5ZrP53JQUGQ6hpFEN4ZMHAgnBg+XPQw/qwv5B3W1cEFPKd
	 5mSHznMxXxD+ser1EikZsV8g/jxDPw9Yk+zABIol4rEjbP+dZE5q3wPPA5e2fmo0al
	 tSEKSht0IcWHg==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
In-Reply-To: <87h5trrljz.wl-kuninori.morimoto.gx@renesas.com>
References: <87h5trrljz.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: codecs: tas2780: tidyup format check in
 tas2780_set_fmt()
Message-Id: <176604606918.48417.952602330124408763.b4-ty@kernel.org>
Date: Thu, 18 Dec 2025 08:21:09 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Tue, 16 Dec 2025 06:24:32 +0000, Kuninori Morimoto wrote:
> Current code is using messy code to check format. Let's cleanup
> it by using switch().
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: tas2780: tidyup format check in tas2780_set_fmt()
      commit: f764645cb85a8b8f58067289cdfed28f6c1cdf49

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

