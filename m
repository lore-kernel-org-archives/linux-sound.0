Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B775E3F8890;
	Mon, 27 Jul 2026 22:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785192895; cv=none; b=FncNeWgcekksaPuON/LLE+D6c4xLgOfAxsQ8+6bL2z7bF4uZs8HEFP3O7kGh4qnvPjTPc31x0vrs5W30Cong9toTuYWEVFIi6GKzK6Wkn3WT3L+W7Cr5f73YQTBoIOX4oRoSfTUwJr96KRjOwKJJkY8+bLJHvj+lUqvwH5/UJrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785192895; c=relaxed/simple;
	bh=0ZaariFhG5UiUA3Px60jTgv4jyQvve3LMfWhQoF6bRI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tJScnEWu8bk1bOD/iMbSJ8/4HOYI817Jar6TH3qVjy5F7SERfjgyIXgueuQjjjfmPL/oK9+xBtmiNNT8O/Q7GzbuqRNN+lPM5MEmCp2iO0+6cJZdVc1fMsinXdFAbwjp3v8a32EcOczL4ebKwqhpxaucPXWBuxt4FPsBldZ1udY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P1pr6X4j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P1pr6X4j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 294351F00A3E;
	Mon, 27 Jul 2026 22:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785192894;
	bh=QvmlR4yrRphBy2a4cu6eJhYmwofTOR3dLsZQxlOnxHI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=P1pr6X4jSp1wKerqiT3G/RwEzjgeU9V6Z4QuItI8Br+8BGvx/St3wh20BThYsSddg
	 Z7XmCbNx+5ShqEx953wbMIc63kJISAGQdjvfhOziA6LlMPYY47tLfz3SPcytqYTfnX
	 wgmu0Jf8rgePpR9RYftGgq/kHk9UuyMRWsk+48PHn1CQq7TFIz4mb+vhXnlu5vPVci
	 fKouqgmzkJWJjDiei1nuh0mJBc2u8b+IrYM8Ud4PiSaeMVXmGvzn/KnzEj3e9h6Q5+
	 OjEoJ8S5FKhlfS+Nl5LEJ4PrTjxTTCYZWOyvxDmt9YhRnRzxal8Lar7htw3Q27Fq4f
	 WmqA4wieNntcA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Valerio Setti <vsetti@baylibre.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260710-aiu-improve-quirk-check-v1-0-2fdd1b6f8896@baylibre.com>
References: <20260710-aiu-improve-quirk-check-v1-0-2fdd1b6f8896@baylibre.com>
Subject: Re: [PATCH 0/3] ASoC: meson: aiu-encoder-i2s: improve hw
 constraints checks
Message-Id: <178515985128.50339.4524271642463560372.b4-ty@b4>
Date: Mon, 27 Jul 2026 14:44:11 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1710; i=broonie@kernel.org;
 h=from:subject:message-id; bh=0ZaariFhG5UiUA3Px60jTgv4jyQvve3LMfWhQoF6bRI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqZ+G7YjqyWy4kV7+m9qdpgjf9j/0fCzs64zs8C
 LGGU3SGxvKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCamfhuwAKCRAk1otyXVSH
 0M7zB/4ihyufK0ZOlxPMAmyPpyKoSb8kn1mSXwxb4fALF0mzLsi6j1oxhu5l4Qdh9pMxHHV03yo
 bkpQ/FtRutVY7ni09OdVJHSy9c3x96TPB/8EIi8iomoRP+vDnIrnfvqKI/mrHFEAGS7VDKPnxk8
 gCp91Up1TxgWqACT/IyvbEa9DgQ2PLNUfvbpFgx0q5yHuO253AarDTHOmneoJCFrFdaP9JygjKw
 ZGYpx62R/kJ8hLPJjRf/78lOaTlzpATh6Ci1KbclB5SKRTbMsYXiv6JvRHdXeJDh93EjSe3Bn+B
 8VuhsK9S81LFpSznBZOCdN4UlMdA4d71Jh7wz5PDzXBewOG9
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 10 Jul 2026 23:09:48 +0200, Valerio Setti wrote:
> ASoC: meson: aiu-encoder-i2s: improve hw constraints checks
> 
> This is a follow-up to the recently merged series reshaping the AIU
> driver following the same design as AXG [1]. During the review,
> Jerome pointed out that failing in hw_params() when two streams have
> incompatible requirements is too late from userspace's point of view [2].
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/3] ASoC: meson: aiu-encoder-i2s: fix bs quirk incompatibility check
      https://git.kernel.org/broonie/sound/c/6b44ad3ec83b
[2/3] ASoC: meson: aiu-encoder-i2s: reflect bs quirk in hw constraints
      https://git.kernel.org/broonie/sound/c/df3c987ab3d7
[3/3] ASoC: meson: aiu-encoder-i2s: use the core symmetric_rate handling
      https://git.kernel.org/broonie/sound/c/e82159384a50

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

