Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795522448;
	b=Ouf2cyrg0+3mJOkaOs3k20hoPEOIFTDt1bLy1PMaBKAvBx2UtfFJMBYON0KrfOFfF0qq
	 k+Zw81oUAdCTVEk/XKhwuXtsNTm5Ue6V+/l9RXmBst+gmy01+l8c/G9KbdnlqXEsUBjDD
	 75RduAglC2HzJ8uCfH54o9oX9A0CJOKv9hwhCVP7fByxUTZNC9NCR3L8JS+bzjygeVFRe
	 RBNtGnO0ML5fuskDd+hjZCHEF5Ho0eYBJl+K8SABFIfi13PZCt3AWjk66O9yVdr49a+dy
	 X6JrdZ4TJGVsbLSKslLYaRkwUsAZpwhgpR/TMXAmgof9Gzup98K2BMwxUWw5OQv1FJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795522448;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=8IQP6+LjELPqxZ68IqsA0UX7HOkypEPSY/Xrk/5T/nw=;
	b=cgYajSC2Ypaz7CbeYnUMfrG0g1VzqRNWnHXKuh0N756eWMBQZIotIB7x3Jlm2ZiKTQVE
	 wTTEUXcCBPno08UMOOkn7sg+E/2GKokdUtF0+q8QGuZAaPfTLnOBy/VyHi2nrQupMS7mr
	 DthcZtnI5YSjlvDGXZRRubWfP89H14+qfjy7W00H54AYR8Xgu3256qoix0Bc0MEPpzQjj
	 p/a1U1gKKFVHsnPj1HnK0OmCSjI8Q3+uIGYx8qTbAbPc8qGr8eWNVEu7JavedxLgdOjBf
	 qfitF5VgNnp2rUYbUcAHZOLZr+5ujYLZpvw3JzW+tvCSI6Fa60qIPIdALj1nfzJG6Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f9WnWcZb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59217606A31E;
	Tue, 24 Nov 2026 12:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f9WnWcZb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5FDF1F000C0;
	Tue, 24 Nov 2026 12:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795522447;
	bh=8IQP6+LjELPqxZ68IqsA0UX7HOkypEPSY/Xrk/5T/nw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=f9WnWcZbBrsgVuT2da2zP3kNYit6klaRV5TI+XxfWFoSsIhQ1EBtkBZiBgEOar2lh
	 ZFYNRFZKSnkHJHKp8N2sU4EoxCfJSkKKSUS3GEzbYgUHBTLhEUgoSBwDFmmBJBeRG5
	 Dq16ZQnxyS/bpCu3tRojTUCHju0XhAHiQmFBEQ6z3gGX5gWMy4ujfnD9VAbKANLCCk
	 lUH9wLII+m+tDN04/j+bNc26yBrjajxiB43+gpL2ZEoGRFC0y/asicaB58r+nKt1pC
	 CDNpI/fQ9G3VJ7kFvFpF1wiSh+zJCDfQzpk74d6yHGBboXOZo+Zl8UDTH72fHZIb1H
	 Nk/x7W4Nkr2Bg==
From: Mark Brown <broonie@kernel.org>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Andrei Simion <andrei.simion@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261116042633.497423-1-phucduc.bui@gmail.com>
References: <20261116042633.497423-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH v2 0/2] ASoC: atmel-classd: Improve clock and probe
 handling
Message-Id: <179546158517.25092.4588094985508101442.b4-ty@b4>
Date: Mon, 23 Nov 2026 19:19:45 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1451; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ep+Dg/OTQrrUr8QHP2WNK+T2zk1oiHyVdSjj6q25MnA=;
 b=kA0DAAoWL+9zsLPQOIkByyZiAGsFf4uhXarYbXiGRbip4BWJMIqpXkDRQfpd54xbKFGQgBRxs
 Ih1BAAWCgAdFiEEXmoL6X9066wOwaGGL+9zsLPQOIkFAmsFf4sACgkQL+9zsLPQOIkWnAD/Vwzy
 y8n7QHpROhnHy2c8hLDwTST7uqDKK3jD7/Ie+MABAJGoKEX3xMh7l3q589T3XJXUsmCB2CRpi8Z
 AX4CRQJQK
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 16 Nov 2026 11:26:31 +0700, phucduc.bui@gmail.com wrote:
> ASoC: atmel-classd: Improve clock and probe handling
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series simplifies probe error handling and fixes the
> peripheral clock lifecycle management in the Atmel CLASSD driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/2] ASoC: atmel-classd: Simplify probe error handling
      https://git.kernel.org/broonie/sound/c/94531f24f5b4
[2/2] ASoC: atmel-classd: Enable pclk during probe
      https://git.kernel.org/broonie/sound/c/76f1c241d10c

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

