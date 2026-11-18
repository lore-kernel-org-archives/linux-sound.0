Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096392;
	b=Qy9v8VO+BxPRRdQdfql1yQ4dd2YFP6pvaFiXp79g9U+4H4MLtoSZqwDAXKFw51diLkOU
	 HTjNDM+Td6ERpX2kydm3ExVq3m7EC3EDDV39RYSZUCsmk8wJy8hi7ZTdevKaEotZOdDZi
	 676JQiKEH0VNtA28i54lWzE3JPzKizaARDrvbIR7BqFSgKRUmIBi8Src3OLWYLnIIxp2n
	 RdbSTr4DBhNYdjEc+oec0akgZwpg9NukE7v3zo/7iI+AqeyDFrT8y62Dz3yhBVNajntCZ
	 Q3IbXQZVZ7mb92N07hN7+bkJAZTb9NUbpx8rrl0J+ARR+KznQEb54F+GsAj1GtcR/Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096392;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=mPThn7hmWxFFOkKLnM6RILYilZeG4F+al+8NhYqs7bc=;
	b=kJ0rYg0e1R8VCi87zuegBhxl3eqgyWYJ5VBZJGAp3VklHNqFzpdphpLRLfDWXtrGsAJr
	 I6NGHwapeVhDPqeyDJN7tDrAmaA02Z8S4XtO8kRl9NqXF2GcszQRvvUwTsLIfd+aoe6Z/
	 0KeC5SuBdgWCCN9P7sOgphNiv7NwHAbzGyhhfWIebaCL/GX7w3Rywy3nkx+PDHUNowpIm
	 PEzDxxuk15dKrsc2LRFEqw0kYX5dOHF708JiusprLlu+MmD+tZ7j1KfFO7f/BlRv2CeMP
	 +hyakp8DjG5qbdc1BSXgqLfHd+ByZEiGJDmI26wa6rgx0bWA8RGyXQqYyIei2UI3TOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IYq09nlD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFB6606A32F;
	Thu, 19 Nov 2026 13:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IYq09nlD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A71F51F000C6;
	Thu, 19 Nov 2026 13:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795096391;
	bh=mPThn7hmWxFFOkKLnM6RILYilZeG4F+al+8NhYqs7bc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=IYq09nlDw/S4RjUpNqJF6KkGRmXYo7CUAsJkzaP3keSHT15nm7ChlfA9OTyaJOvgt
	 cNAL+/2p7nX4MMLT4N2EdDYjfocOyV5a2tEyhvsUm32Q6jOcipUvJsbl8FmJaP3o6t
	 yTS2l1N07JitPxe06LuH4HBRJ7guCvmaqYE795I5XmfOxTSiLzpaDcjvLJhdeugiH/
	 jcv1PTmkXmmibUnkNAmg0jQiMExL/rHORH7r+P6yjYcYJyaJJl2qzDmRkH06uVgOyu
	 sXwWONtVvn6sAIQOw55m8a8siN2XULku53n3QID3tciwVcc0CCfl4bPFpdhdpJgtb4
	 ybzBqW5z3O09Q==
From: Mark Brown <broonie@kernel.org>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Andrei Simion <andrei.simion@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261111100616.31211-1-phucduc.bui@gmail.com>
References: <20261111100616.31211-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH v2 0/2] ASoC: atmel-i2s: Fix clock and slot width
 handling
Message-Id: <179501012503.349622.11739221636052053078.b4-ty@b4>
Date: Wed, 18 Nov 2026 13:55:25 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1458; i=broonie@kernel.org;
 h=from:subject:message-id; bh=J7RtMztD0VkcpU5WGmYpngD3kqOdRp9XomIjDn+CNtw=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+/Xd+9f7vZLXmrF6+opzXoZaylR4zGy4dncH/6YHzn
 E9zg736OkpZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjARlRcM/6POh++8Vnboo+nr
 f+8lRdilDZd+P/MmKP/6bIn3ifMarnIx/BVb/7V8/u3dRTZTw00cYlte+jmq9iq31ngo/V7A73p
 nHTsA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 11 Nov 2026 17:06:14 +0700, phucduc.bui@gmail.com wrote:
> ASoC: atmel-i2s: Fix clock and slot width handling
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series simplifies peripheral clock handling and fixes the
> I2SC_WS slot width configuration in the Atmel I2S driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/2] ASoC: atmel-i2s: Use devm_clk_get_enabled() for pclk
      https://git.kernel.org/broonie/sound/c/a19f318322c5
[2/2] ASoC: atmel-i2s: Fix I2SC_WS slot width configuration
      https://git.kernel.org/broonie/sound/c/f0903e6544fb

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

