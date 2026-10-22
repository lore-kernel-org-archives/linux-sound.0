Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792681206;
	b=NcKv/3zRp7Mq6Bi8Vpf0J9ZiEbCsXUm9IZJ34pjK9E+IrvguIImYpKRcfOFAwrYsv6Dy
	 sexyHP1LLJSvxYmGEyRnGjiA9smfbLN5WWhYb2WhsMpiggrm1jPXevZudtJJj5Ijsb3gv
	 gXHF/q3yLOkqA52N6e20TN78YkRaVFpcQ7p9YlaIE6QxVIwZUpxgTVz7gzr6phoGDywIS
	 ZsUAKmP8ARqhvJgNoVTwQaCYkBlyG0ffLKQy6dI4tYsJ/YCHrpQZhsbPRPA5A5vdVO2Z3
	 PHHTNbtWJIBeLJWb7xsqw82A1AplQn4PtSVW3zWHFoHWY5kQ3YJFSbHMLKaS7+9qyoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792681206;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=8kisxm3zyn6i/8c9B1HpIn+SljAqG0QukFL30XKZ44U=;
	b=G4RAKvkGSokF6v/XbqTt7VZCfDg8S3vRxYpgePznRKhkkFYwCdfjcGbmpbV2k7p9y8IY
	 KOrTVww1iZDimK+nYim11Jl2Pn4iU+ktAYu8knFCybHonxOeJD6hFAF9QgYsfSIlhj1ru
	 grH6ZGsMTXnKB88ClX6ercloide/jXrAID2F4+xjXNb2aXnCt2YK/6k1cotmFOPLfaLWJ
	 T3/s2gXUewLzkIYutuOLj2IaZGNZwY4sbkYL5czbQVZpGghNupA/BSSxeUpmDSQlR44MR
	 8dUl+uZ7FxbI1TwOAL7ywj3qCD+UQRbF3mFXimKh9wCrdatgAjcCa+ePiegL3SHInLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PT+0qeye;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A0A606A319
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 15:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PT+0qeye
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F61E1F000C1;
	Thu, 22 Oct 2026 15:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792681205;
	bh=8kisxm3zyn6i/8c9B1HpIn+SljAqG0QukFL30XKZ44U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=PT+0qeyeYkf3FGLBCmWgimpgOSx2lZO1wrj4YFwf9RKqYuwbOdRguoCr/hnRLbaHK
	 AmFtDiF9Rp0LOgKq+Q7e+40EvflPClSzfLRRoSItu5LeR9gqeMxCDBOczQm0R6ic+V
	 PdSxXgK/hsOhub9Ac2Dv4/s4LiBJsMwMLDcRDfUarmQJU/TLBkea1cHYcTkFr3FNw/
	 2/Xz/auCP4P9j0nVlB3nl97kdkJVV9AdYzWSVGgCb0lGjQoiipECorW34+y/SUbXPW
	 DSy5QlWxvImpDDGVbeF8t351Cwk3PGOztqTXq/W0x7kpKLwdNL+T+QVRwadyY3Zvot
	 aaWLzVmRp6Fug==
From: Mark Brown <broonie@kernel.org>
To: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Artur Weber <aweber.kernel@gmail.com>
In-Reply-To: <20261022101531.775891-1-m.szyprowski@samsung.com>
References: <20261022101531.775891-1-m.szyprowski@samsung.com>
Subject: Re: [PATCH] ASoC: wm8994: follow AIF clock source changes in MCLK
 gating
Message-Id: <179267525358.3909521.16261038194752010042.b4-ty@b4>
Date: Thu, 22 Oct 2026 14:20:53 +0100
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1142; i=broonie@kernel.org;
 h=from:subject:message-id; bh=E3uWBVdcgedsAoo0iUlrBC/uWIBZETwGb/bUMXXsBDI=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJuqXx6uuSKumrMj9Dlz6vaTdnDE2d5HChZ/8WY8a1cm
 PWi6wWvO0pZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRv5cY/soZ6X5l6Sp/pxzV
 dOl5mvNlo7RyxTlvjt+7/1jGaHmT1ntGhhUHeF30Q279/Le7XekPl1Ojjse3Tw0JTtZrY/MTLhu
 c4QEA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 22 Oct 2026 12:15:28 +0200, Marek Szyprowski wrote:
> ASoC: wm8994: follow AIF clock source changes in MCLK gating

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: wm8994: follow AIF clock source changes in MCLK gating
      https://git.kernel.org/broonie/sound/c/8731e33a3b98

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

