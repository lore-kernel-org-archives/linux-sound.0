Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675334;
	b=adnhETjFVPXm6deMv40GGBu9S1ZSjv3eeHE4uXj31PuDWG9DFRazPu24yuRAm7p/p+Ga
	 eGGqFhp+1sTJxnE4X9W+RdL93dY7OxHTGlLaosORIltwao3HJYT0UsSjr1c4BsJurlXDD
	 QuMwxJFJXF91xikFOi888F5Yky6iDDzGSVd3NSYlrp6jk0KF6CDZ6KOFTm3EoQChN9FiN
	 9xQrEQB7LxFZt/3J0OprQ+Rspwi7RDHeu3B+CvkyIJEBvw7kjcmjvGi3DQ9vLtEsypxoR
	 v6W3E176lkDDEZ+ZB5HVB707+W7aF2553oMn/b/QthMOmd/eCP15IWHgEownwyDbyEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675334;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=N6Cr8ekeEuzxXi9yR3NKFvgwEFkva6tKFYT3Yqs8QCU=;
	b=l0sHfxemeS3G1/z09jDwF5LOLbRpHpEZBZIDyJWXVtwIH6MGTHHpWqrWItRGM3ewd9s+
	 ND0A4VYrelCHwVXtC1cosgkfynUxmNPhINyMh61eytYuJ/dZz5CSUrPrnZUI+XtXGStRD
	 gkL9cakYnk3oPuMFkPYBaexmf+ro8+1es9WLhak1LOWdfr8BbgJE1A2K9sVq550qfpz1Z
	 8hnamLWcpJEc9HhNAq32sHy32BvrEtJH9lJg7kXr7rUbEpr9lMVHWI7DerUzd6x9su4KZ
	 HwnP4T5gaoYjQVufbcmNtrps9E0XzQpAuzOL3h7gEnd8PtEHccqPV1+hd3U6Z2RZAxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b6PTq5n0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A25606A319
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 13:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b6PTq5n0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DECB41F000C1;
	Thu, 22 Oct 2026 13:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792675333;
	bh=N6Cr8ekeEuzxXi9yR3NKFvgwEFkva6tKFYT3Yqs8QCU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=b6PTq5n0oLsKIm3VNUD5wTwpvc6D45JQHrGOtDDhtjf/eQjxUKTDIbDtmwHdqYIeS
	 zEMoHulRRV4EVb9Wbnxw6taVfWUAB8v32O6Qjtx5Hwxq11RsO7UmSruzkNc4vROtjp
	 5yzThVzPF6XTX9oZedAmsvkl1lUny46+k4C2POiWSayauaTssR/zbRaeATEPV7l8kW
	 NUTf2M+rhUVL1OU9TQ+hrp+/IffcKQ2KHUTE6Xn9LzC3U/DlV4IskqKaA/YhTg2+PL
	 cwDa1fE8wZZC6mdA/nHkidtUebixd6Crb/FXuUWkJJcBUWRiTqxWS2k/VRORDCnjOF
	 zUuQA9e3vP9wg==
From: Mark Brown <broonie@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Simon Shields <simon@lineageos.org>, 
 Artur Weber <aweber.kernel@gmail.com>, patches@opensource.cirrus.com, 
 linux-sound@vger.kernel.org
In-Reply-To: <20261021101750.3297770-1-m.szyprowski@samsung.com>
References: <20261021101750.3297770-1-m.szyprowski@samsung.com>
Subject: Re: [PATCH 0/4] ASoC: wm8994/midas_wm1811: fix codec clocking
 issues
Message-Id: <179259638789.3850049.10681911783494870241.b4-ty@b4>
Date: Wed, 21 Oct 2026 16:26:27 +0100
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1891; i=broonie@kernel.org;
 h=from:subject:message-id; bh=WLqobMVelfY6gAjV54dEY6TH5SzFHEU2ThR/63fSLbg=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJu8TFqLt36+rnkJc5kjgvvGGYaZDkrrWnc4ekvX7JDT
 ljdxD2ro5SFQYyLQVZMkSUui/tlfcnrNXwHF7bBzGFlAhnCwMUpABPZZsTwVzpiTkFqMvfbFRpf
 va4JRs6d8cpmr3Cx4rGKiQftFjvodDMy3JmdL+xoPUl25SGRC3IVXuyrLyyXv9bemH7G+FbPTaZ
 /PAA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 21 Oct 2026 12:17:41 +0200, Marek Szyprowski wrote:
> ASoC: wm8994/midas_wm1811: fix codec clocking issues
> 
> Hi All,
> 
> This patchset fixes a few issues in the WM8994/WM1811 codec clocking
> code, which show up on the Exynos4412 Trats2 board. On that board the
> codec AIF1 and SYSCLK run from MCLK2 (the 32768Hz clock provided by the
> PMIC) when idle, and from FLL1 (fed by MCLK1, a fixed 24MHz clock) when
> a stream is active.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/4] ASoC: wm8994: fix MCLK gating for AIF clocks sourced from MCLK2
      https://git.kernel.org/broonie/sound/c/872215109fc8
[2/4] ASoC: wm8994: don't lose the AIF clock ratio when staying at 32kHz SYSCLK
      https://git.kernel.org/broonie/sound/c/693574504051
[3/4] ASoC: wm8994: fix MCLK index used for setting MCLK rate
      https://git.kernel.org/broonie/sound/c/7916b55b1009
[4/4] ASoC: samsung: midas_wm1811: run FLL1 at the AIF1 configured rate when idle
      https://git.kernel.org/broonie/sound/c/d9c23ac1217a

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

