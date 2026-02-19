Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26919199920;
	Thu, 19 Feb 2026 15:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771515390; cv=none; b=WDXOXA4lMEm/OZnBAcgSrIlmsDbVe0jMi7KG2D8/nnlAuqvVC8nwGIUg4BqGHhsTTvqoA2MTUN2Q5joKLFpNjKUJb+hjSb+ww2XF+rwA332u5DiOUpqsezKGI7vVT6utNROC5NUn7Gnvl72pKF14eDI9l7sji+b+N2AMPzaFjjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771515390; c=relaxed/simple;
	bh=dnerQRAkWguoqhDbE6xYkx4ycJCWKMZ2dF+v2bxWQ8o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FMgQa+ksUwzYINGT4Xo6Q1AXe9SOuvbyXtcYMdtgIj2d4B42mh3HLJOzw40zrDPXmr1V2f6vVOsrhFcc78XBo3vN/yWH26CnUABi+qaRtNqvg74L5NlwnVpuaGeXazB2mo9iapadruAPP3obVsIChcpK/e8Q/gjUG6K3E6SUPKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kSSRDVrx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kSSRDVrx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A3F1C4CEF7;
	Thu, 19 Feb 2026 15:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771515390;
	bh=dnerQRAkWguoqhDbE6xYkx4ycJCWKMZ2dF+v2bxWQ8o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kSSRDVrx1HY5u5gxDKR1bty/30CCkC3qhwWpzo+55b9o1gmyqq4DNJFvqGBLxJ+cP
	 l9ah4CAIA4eQ7bLMap8fzdfdFqDfCXB5VzVu13nJWiE6sYvvGn/bKy3lV1KFgn0K3P
	 3H/6VNr0av9PHl+GokoPwX/mCBWPcMQSKkl6LOCRkH/4ZX9bpICXH+cd8GsUyVxndX
	 1Sw5NNX+o4PkaDq25lnTSh3g9OdsPFDiBipolic/gHGsxYBic7AU6jJhdDjUQ8oeNX
	 QHE7RoD/uhIfAY0iTvJP62xa2yCJVr/41JnOIsG5azjQhky2z4WXJURGGZousPXRAa
	 M87wcMnBoC3Mw==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>, 
 linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
In-Reply-To: <20260218201834.924358-1-detlev.casanova@collabora.com>
References: <20260218201834.924358-1-detlev.casanova@collabora.com>
Subject: Re: [PATCH] ASoC: rockchip: i2s-tdm: Use param rate if not
 provided by set_sysclk
Message-Id: <177151538730.130550.12673698490748954577.b4-ty@kernel.org>
Date: Thu, 19 Feb 2026 15:36:27 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Wed, 18 Feb 2026 15:18:34 -0500, Detlev Casanova wrote:
> Drivers will not always call set_sysclk() for all clocks, especially when
> default mclk-fs can be used.
> When that is the case, use the clock rate set in the params multiplied by the
> default mclk-fs.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rockchip: i2s-tdm: Use param rate if not provided by set_sysclk
      commit: 0783052534f547f8f201dd4554b1df9f1f8615b5

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

