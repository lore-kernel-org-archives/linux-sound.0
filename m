Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795175967;
	b=5TS6ghw0CtGtfADjc7aYeeSgzoWgnCC842Sl6mFoprksSHLa9aqHwdMqJSk/shs8+l4x
	 uXsqJ7aybht0fJO2SjjAOsDFSrZSMMmuJy1Ze+ve//M/muHht8OBf9VpYq/vZrgvaHVGv
	 OqmCeIVaqA+CVs6gLUON4uwmuB6KBxPDsc2qYU5kjhsaAD7WGKIG51JCXI8p0GloGKnbg
	 m1CazNnm3GBTPTaAzj/qC9oqsbmHW+kS61HRIim/ZwxTnAyZG0onxGlXcYPidRIAdIvVt
	 u2fRKSs0aQgXl5Z3g8HZnwQlU1x6oa9Z9u4lthHJw0dOc9WHy3RNXCBU58c65DkPD+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175967;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Zl7t7lboEbloIJd8RC5C7tK+W7frU5FjFtsG+nus5oQ=;
	b=EKM2fkySbXxgOYH0PxAp/DNWuLXZXiI+7Lyt/sNRaXnarybLHTnFrzCtV5KpxJxcqGVL
	 DgaoeQmJOLRXR3WbQtH3ltXgAuJr3jGqUXh1pDseaDLR5FMxhCANJIsR+yN+8r5/vv5SD
	 Z6IBpl1SGxrgjcpcnv410VPrgqoMRJM5MJdV8Q7DSXajn1rZDCNiOWmGx+HAb05IuGIlm
	 RvzxcZ7xlKdAd+ohCId+W2Rj6FW6PRg6jRIXEqPF4rtEMNwL1PVl56BiEVjBdvtt+DxDi
	 OYQpx0cJXsWexM0zNXNfcf4hLGJRc+pk0ATNWwtHq6Is3AMuKclN+P0gx+nwC/ws07A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UxVlEIuu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4B1606A320;
	Fri, 20 Nov 2026 11:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UxVlEIuu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96BFE1F000CA;
	Fri, 20 Nov 2026 11:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795175966;
	bh=Zl7t7lboEbloIJd8RC5C7tK+W7frU5FjFtsG+nus5oQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=UxVlEIuuoAJcnkkJUJPDVcOFwrOWksIH8ocQBmhEnGyOrvgW/9Iuxj/uZ8FN+xoRq
	 0l7xiSt4FzfKbBXc6jvSkiOQpan4OIMIA+ylosWOxFjnU5FnAMfD0CbYgYnQY+LK/b
	 WlnBOWZxghmzfxnL/Ee0bHaE7oFICt5jeyyV0Im8z1sKSz/CZdtvyJc+Y5RDPaAHPF
	 LZxaT7VfNZtlwEwJacLsYF6ePLfUsLgkPVIhcBtBUYRgNaFjvDZWf1LxVm7MJhFFXt
	 VNkj9ziU/PDu40egH0I3rWKdR4h4voz52OjFu9uZU6kou/GXZ4k9D7XQ8tH1x3gU8o
	 BsabpuYI5WrzQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Myeonghun Pak <mhun512@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ijae Kim <ae878000@gmail.com>
In-Reply-To: <179428456134.51374.1588994696516825613.mt2701-v2@gmail.com>
References: <179428456134.51374.1588994696516825613.mt2701-v2@gmail.com>
Subject: Re: [PATCH v2] ASoC: mediatek: mt2701: initialize IRQ dependencies
 before requesting it
Message-Id: <179509485455.116416.13262712760345484261.b4-ty@b4>
Date: Thu, 19 Nov 2026 13:27:34 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1163; i=broonie@kernel.org;
 h=from:subject:message-id; bh=+XN/1qvarpNKiz7da+Lam/9r+iuEq9PEpy/kgh2Ro/k=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIZzKQ2Jvo+UzRZ+ClSZK+7BZ+uhGCR2m7xypvWftELx
 VweZrl0lLIwiHExyIopssRlcb+sL3m9hu/gwjaYOaxMIEMYuDgFYCLJ1xj+mSu8zxDtd9p5jM1U
 kiXp1dFp5Txv1xhfusfB0/1Cad6PGob/sTb7bqSwZUT9NPf6z+p49khoc4Lgjbsr/FWrbG/yHNZ
 kBwA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 09 Nov 2026 23:23:21 -0500, Myeonghun Pak wrote:
> ASoC: mediatek: mt2701: initialize IRQ dependencies before requesting it

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: mediatek: mt2701: initialize IRQ dependencies before requesting it
      https://git.kernel.org/broonie/sound/c/5649b1d4835f

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

