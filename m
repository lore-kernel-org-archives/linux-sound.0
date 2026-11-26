Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795712400;
	b=f5OjaRQpMriM5tZVqT6R2lilL6Gwp9eeiUo6TmxVw+S/Ow0NThOY5PEgk438wAbxqYHu
	 dR2EW4R0wYE2Nnpha+Ns4FCwyTbX+CpCpty9ydBv7jWN/7NThFXxxGk4AKHuQT36rE+Ez
	 VXkRpL6mjJEGDM1Ttd0JoIwAbneCyH71OTsws8AI5pgLpxSHDzCoILvZvgekd5FKA97Kr
	 Z+VbAFXVz/KYmNefwhxTYS+k4nqLBYdEiUmjtgnrA/9eVQ2pvVg5R39f6RvhEmhNRJgts
	 GNEfJ5uYHB0I1QD2Xk3kY6UkybC0MZcfapy14mz69xHpRUGDIXJWy2UIpowXtgSP5vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795712400;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ArVPK6BKpDUZcAFpoyGnP6MOmVeqaCHP2/9qAGR6yYA=;
	b=rEnCoPAUH+wPzp+QUaMV2tRXsnUVVBFx7l4mSlQqlvpzukQnVQhy7plIHedvHSOEniKF
	 RYfvRJqx4VYl5RN2XA9HfQtcABNvaJoqlFukQa5HXncbXek6wlwqkjeDUNt5proAtBR9z
	 P/oukSZhTNqPUYZezXg21Nie9Km1Pwwt+4gppoCkRnBU0GkE6qj8KpsQpgid11SwpJThO
	 YvTwy9qRMdH5+FVzw9c+3yJCB4J3Huiqk8WDGTu4f8vX1BBx0gTJ0Gk/fLXEZgUS8wNIh
	 GDzxFMw3/fHokfuUFvIq+J2NP3sp8+QGa1ztao+t2iNhUZaHgaA3x/aYulHDMnN7z3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="NKLG/c1Q";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60B4606A32A;
	Thu, 26 Nov 2026 17:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NKLG/c1Q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FC851F000C4;
	Thu, 26 Nov 2026 16:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795712400;
	bh=ArVPK6BKpDUZcAFpoyGnP6MOmVeqaCHP2/9qAGR6yYA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=NKLG/c1QN2Scs8+qoJdavof3eQ+1oZRCah7zQ3XxaYeMJPt2fWZEu9ujrFrasfcoO
	 yqOFr/1Zlj3DnmOX+2bMPR6l3Yk9k7QGTpSx6qHhlDxMg9gFo9M/gOrkJQ+FUTgOKD
	 wjr3wPpgmyqAV6ZhXyQbJNX5WufHndIFPy60jsKkshTIXofIoHsZ6UzXqE5+kpqDTc
	 eTm2Bgrzt7X4RSMsoRgShl7TUwTVV9el5c8Gh8TPQBzLck4o0L7tU2tnr8xQu2vyst
	 ILSoLNhp5ipidg+TRNTpt446Em4N9gLcd4V/Lxqndnmhpt3wWHN5Hbt+2MBRQH43+O
	 wesAUBG/qzP2g==
From: Mark Brown <broonie@kernel.org>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Andrei Simion <andrei.simion@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261119103413.31729-1-phucduc.bui@gmail.com>
References: <20261119103413.31729-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH 0/4] ASoC: atmel: mchp-spdifrx: Improve driver cleanup
 and error handling
Message-Id: <179570252647.142532.8118528768282595011.b4-ty@b4>
Date: Thu, 26 Nov 2026 14:15:26 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1786; i=broonie@kernel.org;
 h=from:subject:message-id; bh=jAqLfns8tJYxcs2fnPmiZAEiggeYiEvvhYnmI0s4E8g=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI5UnsKpxwW/n9Fs0hhQYq2HWO9RI3TW0cRL379WlbJF
 7d8Js7sKGVhEONikBVTZInL4n5ZX/J6Dd/BhW0wc1iZQIYwcHEKwET61RkZ9nrX8Ifc+jFvRYrN
 S55P87XTwpab8EWu03xje/RCoVv2SYb/SXYZts8y13itVv/rr5pwePPT9HY7vx9BHQfvNa7dsUS
 AAQA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 19 Nov 2026 17:34:09 +0700, phucduc.bui@gmail.com wrote:
> ASoC: atmel: mchp-spdifrx: Improve driver cleanup and error handling
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series improves probe error handling and runtime PM cleanup,
> adjusts IRQ registration order, and fixes error propagation in the
> ulock get callback.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/4] ASoC: atmel: mchp-spdifrx: Improve probe error handling
      https://git.kernel.org/broonie/sound/c/3c762dbdc06d
[2/4] ASoC: atmel: mchp-spdifrx: Use devm helpers for runtime PM
      https://git.kernel.org/broonie/sound/c/0918434ce540
[3/4] ASoC: atmel: mchp-spdifrx: Move IRQ request after runtime PM setup
      https://git.kernel.org/broonie/sound/c/e3414e02d7fe
[4/4] ASoC: atmel: mchp-spdifrx: Propagate runtime PM errors in ulock get
      https://git.kernel.org/broonie/sound/c/648e08bdb51c

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

