Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794136574;
	b=TrkYFCz005B0nPcN/G+EHTQ05ru7xIzrewoB5mwBUKRm1wH9Cb4qF1CIyCdxYaiwCZ8I
	 RYxGdMWnMnJ6WGDSBMV6cdysb3ZqpXIrwjBf0H6KsyJC7B4c9MB/m6ZyaDGLfq1XCiXNr
	 GD7vr2WxMkX5petT8ivLGw3TzyHR1TCSkVjuhXRNz3QRgOAmZ2ChkxIn2QrYvuQxX/M4v
	 Hfd6xQzr0QUVaon7AeZns7bz92mEkomgCP4XaKofHdO70OXLcsVyExFmBILcgeJbpPf+w
	 rdhoAbAtv9farEYyw+B/qci2dMbJOHoDoHarKMjDB/tdOSrZkBPIcSGiz8bjc2vGqxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794136574;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=SGoiz7jYAMLeaGc+Z2WEc9UD54Rh9YrVpIlrDK0l2/4=;
	b=t9QdtCqbd/2wN/wWFdcHrsY1VmeOLh8SB8h96QkYdrrN7QMoiGfc7mxpF6Rr8rOVw3pF
	 ADAaejScahcewVt6luWouUu3fd0ql85QK2gKrGZBL8WeEs7OuZDlFiC2URUPDnbceVGVl
	 TcqI6WnVRcyQXfI2Ef6MCJl5Ws2UFV3T4ByQMC39MgYFgjCUYM1onBIAnnovkrI8DJr3L
	 3OQSDe9X43fQgtn6NfLtQYKDJ/xU5qUCu7pFN0sztxHdkqs5LTmwUxFjC0Yhs3peuxnYl
	 mbko4y4tzHjNTl8S7zXFAGcdwfQy4PPlEnVyTHtJJT3YlAw97uNMkFMgjwhxIOgt5wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=osfOs1fC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C5A606A336;
	Sun,  8 Nov 2026 11:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=osfOs1fC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDDF71F0089F;
	Sun,  8 Nov 2026 11:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794136574;
	bh=SGoiz7jYAMLeaGc+Z2WEc9UD54Rh9YrVpIlrDK0l2/4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=osfOs1fCtsK/X/5ekOPP5JIRFmYyjBMpnU4ZuvYmEPYzJqpJJo+/fW8DisskYUt1b
	 0/h8jbwFAhoyq24Y5VaiDZxnBu+nLkSIv2j8UR+M024ZFxV+/jBt9n43nc75WZCZnp
	 g8D2Im9PP2VDu3HqaZuHGVRCwuh9XEa+upeGa/6lHwHnmFLpcBmpJBqMbVmQAvkX6R
	 TYimLjwzFhBvcHodwXequnBgyGfIfj9pwkgg4bJcAZHYqGVunCHEdCf7+Fmref1c+/
	 GBS+c6vqPmYLIHiLhM1n5+joaRa2AWBQtbwH+eSylTQo9ozIYE5O1QWeCmwjiLwLiZ
	 KH1I2qLMDou+g==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 337702BF9017;
	Sun, 08 Nov 2026 11:16:12 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org
In-Reply-To: <20261104024048.1508635-1-vulab@iscas.ac.cn>
References: <20261104024048.1508635-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: qcom: q6usb: put the AFE port after sending the
 USB parameters
Message-Id: <179406098873.3424803.10778363487543305936.b4-ty@b4>
Date: Sat, 07 Nov 2026 14:16:28 +0000
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
 h=from:subject:message-id; bh=oqfBET6Hh14aFj1ay71AJhxkP3CR1klcQUop2flDXt0=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+RP7JlLg7J26zrPDXAubL5rez8kKvO8ruTyrStJ5x7
 8b/gIWFHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZjILilGhqbbkWue//eQPN0X
 UBP+rJVtxrwvzdt/uZg2Njc/6u2f7M/wv/zn+40ft8fbfkiQbpS7ey7tzQKjeed232tm+6WVc3j
 qYxYA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 04 Nov 2026 02:40:48 +0000, Wentao Liang wrote:
> ASoC: qcom: q6usb: put the AFE port after sending the USB parameters

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: qcom: q6usb: put the AFE port after sending the USB parameters
      https://git.kernel.org/broonie/sound/c/57199400abbf

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

