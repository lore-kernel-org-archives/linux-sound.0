Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462478;
	b=CAPifNeBBcvWf2UhBKBpDME+sRzZAuM0xI5VDDodbV5F0Bkmn1VC7YzuWxPRHTNY/WD4
	 QloWXZ+ORaY7rbErHqecrEmTBsfL9L0kUPNbVnZZdSaGNRvLGeSVy0E5ce5TyLtBACahE
	 x+S+z9lI/eadB2WwMLOdYvP3Y8twdhueURdasb+yaZthbB77GlxymeBN4ZEYVVlHwzpds
	 +J5qqim7zHDBEvWjijP2y9wYWe9+o4SQDBecYO/qUp4fiXSifJaywRRgjg3TOpdmr4+Q/
	 11G3f3P1Zw3e8sNsbew+csJRa5z3OFhW9qrUrykGi408VUVqaLDnuK671M8UyEjB4Kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462478;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=7U5/oPNA61To3l+OLw5KiVMFyR8yHy/dQ+YA2x5sy5M=;
	b=C8cQ84qopdG4Rp0MIZcxBnMDuUWF3D7hDle+u2M3e7Dv3YO+YXxq9VQzfQHmfDsDuKXG
	 kpr9k91w5DMIRFOGRmbnUEyFxUE8qJbt8WYB1oozXhGBqvcte7xtNaFYOCTcErIHDrUOT
	 tI2DK4jxXnTltDoMRXpPTJP67s/F4hoeBSgVFV4L9u2XEnGQVw4h6cZXQSgjEVtWQ/W6F
	 cIcGG1irbw7CDXKBLWSlOdxsc/ASp0VDdoZkzec2c3iUsz9Z4EwPk4Dcek/JBK2c8ZLfa
	 2NJV6BQ9fAg3F+UcT2fxNspzHdHv5febXMjJ1anfzCY1hXys/Qx9OjNDHX1Omtb3ZMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OpfWyFnk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF7B606A31A;
	Mon, 23 Nov 2026 19:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OpfWyFnk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 994B91F000C0;
	Mon, 23 Nov 2026 19:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795462477;
	bh=7U5/oPNA61To3l+OLw5KiVMFyR8yHy/dQ+YA2x5sy5M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=OpfWyFnk66JRHBn/s28v0EJ64r+VfYvnGpFjq0nNBUnoP7wXpbT+dJ/lceQFzK7rZ
	 7DjHluk9fDu02UJ4Ilu9zsrSCP0PW74hOjrLhNTDwT2ux4Nh6b6e8uNQ6TFJ5PkOrY
	 iyYOOT2TkemxO32Shk7P41JlMpGRMaP0MeiWi8zob2TwH/D8E746yXg77WwPopFBja
	 dL/QYdGCn6Rsw6xc2KSMZip5Yopq/4TgNlpWHYtkpVPA/3ZbayfdQaRsjHQ+TAknjy
	 H5S6FE4sqPZ/z0jBrayVOjyU4cGDGkbVdf/nLVT2yFSMfhz/AvcWhX7lOkjYTWBeef
	 4STfnA6gunXGg==
From: Mark Brown <broonie@kernel.org>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Andrei Simion <andrei.simion@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261116092407.514998-1-phucduc.bui@gmail.com>
References: <20261116092407.514998-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH 0/3] ASoC: atmel: mchp-i2s-mcc: Improve clock and IRQ
 handling
Message-Id: <179545596619.25092.12030050594894587664.b4-ty@b4>
Date: Mon, 23 Nov 2026 17:46:06 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1616; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Fjw3yoNVux7SR6d4Qoh2zf6Zz2xQTYeiFbXu/V8odWo=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJZpnomMRudrw36emKC9qQ1s9cXZ+ydsNoqVjB7Pvv3D
 VO6MzZN6ChlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBEtrxlZFipIzM7+PrstcsX
 b4jVOlvU9u+7tnLX87eZ7v0TeSZZy35k+Ke2TbHk6CHOtKoTszca6/q9euqSHfnpsO9NP5/sgAi
 Nu0wA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 16 Nov 2026 16:24:03 +0700, phucduc.bui@gmail.com wrote:
> ASoC: atmel: mchp-i2s-mcc: Improve clock and IRQ handling
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series simplifies clock management using devm APIs and ensures
> the peripheral clock is enabled before requesting the IRQ.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/3] ASoC: atmel: mchp-i2s-mcc: Use devm_clk_get_optional() for gclk
      https://git.kernel.org/broonie/sound/c/035a0a1562ef
[2/3] ASoC: atmel: mchp-i2s-mcc: Use devm_clk_get_enabled() for pclk
      https://git.kernel.org/broonie/sound/c/0cce417afa52
[3/3] ASoC: atmel: mchp-i2s-mcc: Request IRQ after enabling pclk
      https://git.kernel.org/broonie/sound/c/3376223461b3

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

