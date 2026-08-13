Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F063043DB;
	Thu, 13 Aug 2026 17:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786640901; cv=none; b=iD4ZD2O9x9no2z+0Vr+rv4/MPTCEEMPLInmC0u1gV3yaExMNHz4CjkQO/wThjd2tx3me19ezeZp+SXyiJRjvkarG7tNxWPuVnd03eJD/bx0j/V3/Zrs4RPzBuENgWLS01+G3PsiRD2ivFLNcjUjck2VdDeDSo/DuUk4RMwok1RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786640901; c=relaxed/simple;
	bh=URwkkWhSyZLSnUEzsunhkiOcJ+2ApBhbs6nxx71iRg4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IyZhY8LqN3IwIGJcUuK49cpDb18pa87rJPmaMUrXlkAojIUhMi+AuSnD8kEFyYDIzExy0QConia1jPwPQg1Q7/4yFVygj/yIx3l0Yey2J0ErKF1EdfPuqawB7CZw7Ej6QKkgxC3xMTfaDqXnfdHwel6vEmoAFGN/B3In6ukdBAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lKO4mVWK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lKO4mVWK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2F951F000E9;
	Thu, 13 Aug 2026 17:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786640900;
	bh=f7DAD2zZXWNg2HkwxBcjlBg+AYTe/jXHTqJJj5avZbQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=lKO4mVWKyB8Ivz2mi24upBjMU0iMatY3dGdaAGvpsM+0faGiz7uJGh3a8UBatCynD
	 IraLXb3soVF0Dbcf14GcYiTPEaInqZB2dfT+H94Y2f6zZ88az6um2NCzv0fFVg1i78
	 RIqyFEDoeBuaYeOVpR8yUHM1aRa0K18Oefo5j3pbzWVqbkIKX4FMxU9wFuOyA29rdK
	 6RQAEfMKer/jQIJLjPMQ0N2Grta+uztfaCe5o/1+t9TeivYfYOYd1Btdk8yjFDXJYB
	 qmU+EVu27iZy5Vj+oPmHgsxGdxtzJOJFSH54cqzp70j854lX1HyiGmsbN8oylLnUOm
	 VQqJ21dYJBLTg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Valerio Setti <vsetti@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>
In-Reply-To: <20260812-aiu-formatter-static-v1-1-67936d57ba05@baylibre.com>
References: <20260812-aiu-formatter-static-v1-1-67936d57ba05@baylibre.com>
Subject: Re: [PATCH] ASoC: meson: aiu: make aiu_formatter_i2s_drv static
Message-Id: <178662342504.110398.3190102623647989462.b4-ty@b4>
Date: Thu, 13 Aug 2026 13:17:05 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev

On Wed, 12 Aug 2026 22:50:34 +0200, Jerome Brunet wrote:
> ASoC: meson: aiu: make aiu_formatter_i2s_drv static

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: meson: aiu: make aiu_formatter_i2s_drv static
      https://git.kernel.org/broonie/sound/c/583e44f2828b

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

