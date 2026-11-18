Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096064;
	b=R0JYT3Zvf1E4dXIgt62wAAAXS4LXlP4Sfyf7qnad00ai2g/8kElwWA4xhpgWrdlSOzpE
	 eqq80ktSAls5I/dGajUgKzeSuJp4DNvH9NLQvTpI/nwC7yEDKnJvTPGIR1e+u4IksPKdb
	 7SHiFrmvLMHnWo+Q2m+NMP0LbV5+kFgjw4tsIMMhJa1/u/VQuAAIBfzc0luHf3EYJnKI5
	 xA+TTDGjO9ShielI7AbOHuQapnipY4da516vYW+cJdOk+Wys2jEms7URxdTFLLeucX2FS
	 10Kx6BstXwFFO8RdQW2NyAnh+MNzPn8I1FWCtIHF0Ip608EvNzWj8X+Gp1nS/V+ghJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096064;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=KuaSAeiK1uYc9mpnxRzjNwjlesbXX8iHWkaUCVjsGak=;
	b=Id/OH0fa+B7AQbv/fwWyvfcGkpixy8tf9mmfUF1xn8+df2Bm1fIGBLhW6rZfW5oCLpzp
	 4EcuX4BRM7wp5ifdhBxhJekyQGGEVwcQbjCY2wFKfVRX7wuIG93tczLOMt9LWxCh3w/Xd
	 Jkqcd7c7HsRFAVmix3/7eoQW3dYdsWqLNavAF89g43T7gF6UcsC8lKMzm8i7ftnDcB/0s
	 SndMEEKbPclnYVLNzo1Bls9s+ya7wuot7js9vibVr4r3L8Ts5FFhy10CtxDiTq2NZ5e8r
	 W4hop5yE7Kw15+9xY2wPsblbrZtNbbKuNRHUMvKlNCe5BqIn9DkDNEOxFhQeCgBmzGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fxiNL9Lp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F852606A33E;
	Thu, 19 Nov 2026 13:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fxiNL9Lp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 777121F000CE;
	Thu, 19 Nov 2026 13:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795096064;
	bh=KuaSAeiK1uYc9mpnxRzjNwjlesbXX8iHWkaUCVjsGak=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fxiNL9LpJJ6gDgpGY/AkTrXCh7kosYEAygK/24M5EmuNJmXLYWba99HJTbEK8ynZN
	 i9ZifhVphYs9mEBgR0++c+OgXf3lUxE951dOUq3SARzHbO0CMDtopRZpeFbqPwgUr/
	 k7Omqwag/IQERKZ6zD8SnRW8cUqbqibT6DQ64Ovs1GmpKaVJ6kjLozjWvVvfTMqR30
	 AOccgxrC88YkndN8pvBlxNQbLfbTm0Xe0z3zi1KLmZ0tHCH4CUdL0yV9182WrW9yab
	 SCOJIqOXjRdQFlK2j7kGzbGxGDD+fbI5JFtGo+7I6pMRQFcQDn+jT8EDG/g8CbIfBV
	 awmVfxzr6Lnzw==
From: Mark Brown <broonie@kernel.org>
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Tim Surber <me@timsurber.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Heiko Stuebner <heiko@sntech.de>, linux-sound@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261111215125.3560398-1-me@timsurber.de>
References: <20261111215125.3560398-1-me@timsurber.de>
Subject: Re: [PATCH] ASoC: rockchip: i2s-tdm: Don't reset a pending clear
 in consumer mode
Message-Id: <179502607252.810609.158294566774714648.b4-ty@b4>
Date: Wed, 18 Nov 2026 18:21:12 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1154; i=broonie@kernel.org;
 h=from:subject:message-id; bh=fimSRl/EIz2UKRbOsZbukLYqOThFn2yXzoZlHkw7lcM=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+/f2TeLZgDku6vnoq28pPRh9qbq64+fhW6fbm/yJnb
 /32mfu6vKOUhUGMi0FWTJElLov7ZX3J6zV8Bxe2wcxhZQIZwsDFKQAT+cDByPD+qcfT6IMb3GqZ
 7i86rcnrbZrqqLBYa+NRsR2//4UtWHyd4Z/umpmsXDJ1vveVtqQGCb7h/+qmlerAdFA12qJ1m79
 BDDMA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 11 Nov 2026 22:51:20 +0100, Tim Surber wrote:
> ASoC: rockchip: i2s-tdm: Don't reset a pending clear in consumer mode

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: rockchip: i2s-tdm: Don't reset a pending clear in consumer mode
      https://git.kernel.org/broonie/sound/c/6a4f9e7cf13e

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

