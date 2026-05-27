Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B6F43E4B4;
	Wed, 27 May 2026 17:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779902467; cv=none; b=IRgH8J72vzyRPGOtUWV4PoVhct79FSJLvoLZOdXS0NtdzyuwGfeFY3DcoFPwPaD/bLod1kB9ra+xM8WHKYQQ0mrQ7el/eteOM344JoX4M8B1zO9XY8FRLEAdH3oNqtFxpmXRKgO2SX/+QIwQAHQPhzcqKupra9uriQ8htwKcLR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779902467; c=relaxed/simple;
	bh=AptR2TfNMyJEuvqUnO9wdbetw+zlmHZ5MXe3q1AP2s0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aYR0R2rWbNe8ILc1zqN8xp8o8IkneAgCjPI22mg1QvVyBHBMvL0MOZ1o5a3FQMmFHjAgwqa39IabeeGomp1gJ3o77+p4eOUe5VZ2Odh3sddl0JPfYHGA8wTHfNJWe6j+AAxQVYj2pIeS94hr3Ro0eaZ2tS+4/PDgCHU9FAjv92s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bNvDVz4k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bNvDVz4k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B75461F000E9;
	Wed, 27 May 2026 17:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779902466;
	bh=gGtx54a3XTzdXwkAQDlwrNCKEPvsNEOPWkD46OirlUs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=bNvDVz4k+NQlioQXgGv1oKQML57pdjekl344UI2brtbg4pMAuSFpHy5iRgYW7S7N0
	 xT74K/zDwT+Kbq/GFJaVPb0uYetPWEmbYccYco/qCqCuOOT7I3p3Vm3MwmLv7xV/wO
	 NpS+5gIKPt+ybshr0563cukSynVU1cqr070R228Rfu7Rxxuil1q3XRb0AnERTtOWMO
	 6SS2rAstMpvkWDLs0mCsoyvnsRc83QBnZ6feljyJLv1ro/FqNf1dmNp1CsmuYlwUln
	 w3+nJMzLjoYQsVB1wYgQSoUohK8lf2ELCWTFYedILX5YakiTda2UlcPa+ygoEb7qup
	 qDNsT1Aj/t0oA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, 
 Jaroslav Kysela <perex@perex.cz>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 notify@kernel.org
In-Reply-To: <20260527-asoc-simple-mux-enum-bounds-v1-1-3f805b9fc671@gmail.com>
References: <20260527-asoc-simple-mux-enum-bounds-v1-1-3f805b9fc671@gmail.com>
Subject: Re: [PATCH] ASoC: codecs: simple-mux: Fix enum control bounds
 check
Message-Id: <177988610222.868420.15175045940781571169.b4-ty@b4>
Date: Wed, 27 May 2026 13:48:22 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1131; i=broonie@kernel.org;
 h=from:subject:message-id; bh=AptR2TfNMyJEuvqUnO9wdbetw+zlmHZ5MXe3q1AP2s0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqFyf/iWsFolmMT91SZYqllXoV1syK8eiLLM6MN
 7hb6TuusleJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahcn/wAKCRAk1otyXVSH
 0GxpB/9dQ7ZUKj/clKcIwC9fBeRYLr6gqSsIQLw5ej9pcncwOJx0x9b3Iubp8umBWpgSmGe3g4J
 NI24RQKFpdgyKHUnN8KozyhRoB1DZCzMm6MuCKtB5hlvWZlLF/BcPLXS5PZEXo8FfSOKoIzo+DT
 +DCzeiKRfA/qnr+igArU3q9dmllmOevPJaD7BfQdFARgw5DtMLu6LlpkDDRZhjHp4VdPHLdDxhd
 wKRaNeCG+5loButk26kFa+UgNZ/VGqVi8s0QEvCh9gIdqL6NVDETsrax0sqnsj/y7Vqa5wRmEu6
 s5RmdFFBrjzYKHmnrf7P+1KeV2M5nMYrVnd1/kXDtbwfFuTL
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 27 May 2026 09:24:00 -0300, Cássio Gabriel wrote:
> ASoC: codecs: simple-mux: Fix enum control bounds check

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: codecs: simple-mux: Fix enum control bounds check
      https://git.kernel.org/broonie/sound/c/f63ad68e18d7

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

