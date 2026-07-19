Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9C3425863;
	Mon, 20 Jul 2026 13:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784553618; cv=none; b=WAhxdquXnehLGiYDgr0PPU7TJ/rWxH2WPQssPguVB2iD80yfEdrpU1bzwE7JKvQeDWaU/Uc6Nk03rCVm/zLQcYTFuhlUs0PYkKfuv+GenATrikrWCZB/U0EGg5esBbg6VBzZX2GOQff2wkdlv++oRmSxdOgFMY/x/A2NCyugaIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784553618; c=relaxed/simple;
	bh=VoXJfGpB/ta/YC1D6FKPsSCtqeizSV15Kd9VWuadT98=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RzMMMe9LDdDKrbXOCZ7ZGmPnJM8Uh8HfITsIPOitV/nprFGPr0ntNxE44VbHU6RCoh2aFvxqn/Wp6NmFZTWVgwLF5CIAfdyCtCnAyJkwt4L3WiiP8/sB1G3dtAcP/kuWXb2qP9/3JdrvW+jYgcL7PA1BAjFy5cMnxDXRDI1P+aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jplMdewH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jplMdewH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB4731F000E9;
	Mon, 20 Jul 2026 13:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784553616;
	bh=Zs08b7N7JXgAEMDwiHf505SxhscoZzfgeqelXaBrSH4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=jplMdewH9fT/Ln2t3TxSLb7JzgDFzasPQHhaw6fWsQhTpMYp0vfzmnLQ6OtNgm4LK
	 mLYdXxdePnn5DQbGYkLMLCNKcgZqhjQElaerdyUFQczJkPxpviqvGEtGMxkoOVbQsY
	 wFxj32W4c4mNyE7/Y1mNEdBPHNyfIESYyOzl5VmMzNYnZENtaV4URCiQAH1smx0k1C
	 Vh3CT376eO8Uw+emvi0r5REA9CH5qfOz9AU5g18rcI7Y8lwZeYd1HKogP0UplXRmfK
	 E7cssTHFj/0cGIH0UvwPNLJtKj4OouQIVI3QHTZKTlr90WMkaOwRBZgzAM0ECL1xfA
	 hKN9o/xBPe2Wg==
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>, Linmao Li <lilinmao@kylinos.cn>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260717012433.1432285-1-lilinmao@kylinos.cn>
References: <20260717012433.1432285-1-lilinmao@kylinos.cn>
Subject: Re: [PATCH v2] ASoC: meson: Keep link pointers valid on realloc
 failure
Message-Id: <178449187119.33801.9637758292671659213.b4-ty@b4>
Date: Sun, 19 Jul 2026 21:11:11 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1127; i=broonie@kernel.org;
 h=from:subject:message-id; bh=VoXJfGpB/ta/YC1D6FKPsSCtqeizSV15Kd9VWuadT98=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqXiCN+7Wvw9kJ0foW8kHNsOI8DGcv+eWNcAOIW
 SZLP1T1ERaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCal4gjQAKCRAk1otyXVSH
 0IwMB/0XbFAgMNm1ubDnf+qduGvECWpbopGlp7M+qJ6NRg3MwksJBDgM2oAD1ZxBHdGDKw8NVv4
 GpeK4kUApRRqSTyxJo96T1PAexwKwO6HaUhZrOULi3DXqiP7Jq6RgawejRHKGqHruXMye6Y9+tA
 O0oCsKVoOBApkw9GMJeXNpdkJLRMa3zrj+tBJwFLpY1ZeSGFS4z5FzHe8Rh6QZTNh0ufNPUADZe
 YWllLESrMwfFrhS4RkMk18etEclvFHVmDebnT1RCHneX00od3o1MCFPtAzhjNghroRnbaJNRxFV
 7h+BNIQW295dVF60FcCiTBqKvHa1nln2P0VGBRrmtPqMM4mz
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 17 Jul 2026 09:24:33 +0800, Linmao Li wrote:
> ASoC: meson: Keep link pointers valid on realloc failure

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: meson: Keep link pointers valid on realloc failure
      https://git.kernel.org/broonie/sound/c/2aaa41cf974f

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

