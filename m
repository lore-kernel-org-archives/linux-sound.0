Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794137261;
	b=BpSuveeAGMP2cQX2bQQIJ9RIr3CO6jHRNBZJz0Uopus8ZJLFZnDGWRLCk7oVehwdwwi5
	 vywYcybL7ZUiyOZ3kmB6t+D9sHpbzdskgdrZ8JWOxXMhXCgsn3YhkQOqMAmE/xr6Lmfak
	 z04rZyV/GIw8SESUeyEOk67ykDxlGvRaeS2DYYOUVFEUSP2vhhJR2LhAM77Smayc+Qr+d
	 vYcSsLLagHFp7VHg5UjhlPS2IzQ15/6nyiVK+yBUFe1giBnkeK8YToB0VvIyjZKf208+d
	 Y492vHWyTTCHp5OssCcwIZ2N+68cBXyMNt3ugvZiAGISd0xqysTG9cH5IGUc3oeIGXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794137261;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=F/fYRrxzJ0MMAethI+PGx3RstYI42wsPbaxQVtjrhxM=;
	b=bt/9/PMNxB03lP4vk4aQR8a0Ddkx20Lw88mjx2dh8GuCSlmO2RcnEtEY1t8n1X9iKL+o
	 sWbYzXrDgu9ej5QmOI9mGpR78beRCmpiD3azMjVe17JF/JAdCbVg4YIsOVw7whtc9UZhk
	 LhAqo7Qx1uaVtDvgw6yA+KhrET6QZFM7ubtShRrwxQCJdsQWlgEEpuCCQx+XHWwuZqktn
	 r+irH2jg/Kt0t6go3WUAjCB4i+ECVbT8Wacx4/pqS42MrxMrnuM5+4er8/j+93qd8qLsg
	 0+qQYGy4c/Sw0lAYJbWcuujtKmC85o89/uFyPJ4wnmhbo0WYntj7D67CtnPExq9e2gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TxryZMn9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D441C606A322
	for <linux-sound@vger.kernel.org>; Sun,  8 Nov 2026 11:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TxryZMn9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A7031F008A1;
	Sun,  8 Nov 2026 11:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794137260;
	bh=F/fYRrxzJ0MMAethI+PGx3RstYI42wsPbaxQVtjrhxM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TxryZMn9BwM1M8tckR25+aSVhb6GNO8sDJJKC741frDTNd3emKvWOovMf0/84JW+j
	 Nebj/8jNcV5GSxEF6BHxbKLDwVQR/dnpAkpX9b4c1LsGI5jcSyH0WxYqXSPFmVCLv3
	 t/9+NRZjNm4qU+C8YLcjYVEwe8Jo5esAuueS8jBAX/MvG5RufYva6q0X4Q4/10/kV8
	 3puGG9bai+CtaGjPUYP08EuytRftxLQWQdsSkikZ0Er3+9c7jZM8WKfXiZt4+zxY53
	 wEFKTyTRGQQXKAye6K/cyKmB9d524HMx2bNoOSXLtcjP3M44oU3PYJscXTGBlf3uaM
	 51pa13mYxua3g==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 824422BF9286;
	Sun, 08 Nov 2026 11:27:38 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261104024055.1508788-1-vulab@iscas.ac.cn>
References: <20261104024055.1508788-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: sti: fix the player clock reference leak
Message-Id: <179406649796.3424803.5162189053755467444.b4-ty@b4>
Date: Sat, 07 Nov 2026 15:48:17 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1110; i=broonie@kernel.org;
 h=from:subject:message-id; bh=6JxMzpDtFfx0v8j21+nNJi80MMWlzq7P89RSpPJRWSw=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+xKxiT2R/czB3wrH61S/Xr7v/bB3rqQ+f7QRSPhQyV
 4fUzI/u6ChlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBN7mVkeF6xZM7ml0tK3W9o
 feCPmzyh5sxMxcRbvNduNdz9VLmgRpyR4U+m/9aGznbJW3GdW/YuXvLygjaHycPdVbd4bx6e5jQ
 rmQsA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 04 Nov 2026 02:40:55 +0000, Wentao Liang wrote:
> ASoC: sti: fix the player clock reference leak

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: sti: fix the player clock reference leak
      https://git.kernel.org/broonie/sound/c/304f08895e44

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

