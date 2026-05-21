Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186113CE48E;
	Fri, 22 May 2026 10:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445333; cv=none; b=p4aiYQ+N0xNPvYpAL4QG2o/TYpjPbZjGdG6WL4fj7a5BkOGyI0nzQUF3Onvr01jmyF+cqZ+/6GRA9uDblX1ZYoM4I3lQwGdOSUMRscwguYlJfLtF9C2+qM+pXMx26Ss26mwMc3E/ivap0cAvP1OqmCaG5Z1FNU555t+55rbtARo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445333; c=relaxed/simple;
	bh=ebbjq7a6Me00P6HJYA9wBoYwNTnmF9z6Nwz/Is0tWGg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=r0VGvfBggScWVBuUb2vZfK66rETXrKYD+i4uaTcCJjL4zbvTf72iju5mnz3URF0yRxNV4jEECEFOlKz2RaLgA8X0ZFkbr2Rx8gxcE7/73rte67xNOCWa1CnHaoTrk+PLv2G0MlhBrj8AQpvbOcMmw+O20dB2gE+2y2zNFpkQFUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I1QqadFR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I1QqadFR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F4141F000E9;
	Fri, 22 May 2026 10:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445331;
	bh=9Hs/lgWDFKj1AQ6Sx0xmJaBWVngeOt8sYXNKLfOmygA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=I1QqadFRJvu3SoQ8DTXwajbf7bu6/zBCeT02a1FGYR65Ny52gIB2g/vwxXnDlPFI7
	 5qYMainQ6gFE/AsGETVodi7f6HYPFn6EUFzqkF6qHmBZAUXfUl0L0LRdbdNDvK41gO
	 l+283jNvNJaJOnYVVdJfjC5Z6lhvn+nKyfJLeiJKY1erw/F3J9N2oeWD8CIh48QTwK
	 7uuBoFfwbGVFFMTvwkKX5G0rlaSr4fDXNkhG5TR9qnOSBbmFFNau/slGWByx0bIfR1
	 9xdeiG9EdA8m1o7SzVWK/GjSruN1TovrppXqr4Rq9+N7DgxaP93AgnUb/hoZV+8mHF
	 ogFz8O1y8Yd6g==
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Valerio Setti <vsetti@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260515-reshape-aiu-as-axg-v1-0-53b457784ff3@baylibre.com>
References: <20260515-reshape-aiu-as-axg-v1-0-53b457784ff3@baylibre.com>
Subject: Re: [PATCH 0/4] ASoC: meson: aiu: align I2S design to the AXG one
Message-Id: <177936336749.58022.15311643425508742115.b4-ty@b4>
Date: Thu, 21 May 2026 12:36:07 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1797; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ebbjq7a6Me00P6HJYA9wBoYwNTnmF9z6Nwz/Is0tWGg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqEC5QDdh25F8efTMW8DSO5nr2kjOL88DYkanVW
 nA4ayETn2qJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahAuUAAKCRAk1otyXVSH
 0C8xB/9sCgUlqx0uf9DMyJzHr/V511MqhHwb0rKH3r5PjP4QFs0hvDlCTfu19cBKtcGGG55MjtT
 DfoxiIPr6e30pcpPF5ifHFRuspYEank2tlJqSJyaRGzV9YFZqriUw7FJVyOt6Ksbo3kX9KcKRx9
 e6u7z+3NbgKQWQjDI3g/hbD1rkMUgqMgZAqvemXwvYmzWqtv9RefwDr23uumysJKeQBsftj1L1k
 B6++YWFCITy3HeZYeFIxkNsow9v9U+OMJqIUudoNh9pX+5RifhMn0HDQzGMjA23OUUS0+21h6Yv
 85OezqwcqgpTJNEF3/lUHXAGx3gomW3I3ZEwri6rFlM9oM+D
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 15 May 2026 17:10:36 +0200, Valerio Setti wrote:
> ASoC: meson: aiu: align I2S design to the AXG one
> 
> This is the first follow-up patch series based on RFC [1]. The goal here
> is simply to reshape Amlogic GX's AIU implementation for I2S to follow
> the same design as in AXG's TDM. Keeping the same design allows for
> unifying the two platform implementations in the future.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/4] ASoC: meson: gx: add gx-formatter and gx-interface
      https://git.kernel.org/broonie/sound/c/4efe33e7a2f0
[2/4] ASoC: meson: aiu-encoder-i2s: use gx_iface and gx_stream structures
      https://git.kernel.org/broonie/sound/c/3383866c1b77
[3/4] ASoC: meson: aiu: introduce I2S output formatter
      https://git.kernel.org/broonie/sound/c/df6057a25c52
[4/4] ASoC: meson: aiu: use aiu-formatter-i2s to format I2S output data
      https://git.kernel.org/broonie/sound/c/ca3543cf247b

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

