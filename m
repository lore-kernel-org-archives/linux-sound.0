Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606969;
	b=lkfhM8zAxQUNYwUD+9bxp+YA+UJF0cV2PrR1uvVCw+TVBdWECFHv0xvv411v+PqfWh0M
	 ycua9pzKtzh29wR3Tw2qT243rPrXknE1/UzI27s3UCuvkc9Xh+KXY4wZh5clPe7KXTYOj
	 GkZMNURvE8GZHZR3Zcj2g2xIstQauurPTHqierF5MEqNoxqEPm0mX77R+z7lD3/vnC22L
	 F0v4aygM3hA/QCW54WxrO3zKZxOXJNnlMHwpNPy/e4uzf791RTeDxFkchlKDnhtaxu4kW
	 4E84kZFsGSdJBU1KyQziNdFc0vwlRR2lpXKWovTwGIhUIe/9rez+HKDE0WgQaHCrDSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606969;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=S5bV6rNlUtAz5pBmkT5bOjCaAjkySo0AUi3HDTyYZRs=;
	b=cnKef3+bhUZ/TPeuFmNsSNHIv4mhlsReNhrr0gBGgpOzlQZt9uCq6kvLvvBnlM4hQdsc
	 vOBxVlKo8Bu9jlMD3raG/lAmpkxAgNsnKXW1+ad9K07JIsqNIg1ZlHVQy51IpXvr5X8ak
	 jeoD5lyye90WwtCbZTkD+IqqNLE+T1XQDY9OWVjFWx3hz1IPGHorYCgyLH0TR9rEY/fnJ
	 DJlNY7yeX1jtkSO8Zs6nZYdx3fIqOyE+bxwfhLxBwun2lSHmGgylmDpwBGqfLbBCVfQ20
	 zBRy4Lw1WIw4fdTcDk2h6AIJaJjqHP8AX4XaMpFWf6zC0/Mb9DDobrUMaw3zrVfbZ1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RzyKTEgy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38519606A335;
	Wed, 25 Nov 2026 11:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RzyKTEgy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 572FB1F000CA;
	Wed, 25 Nov 2026 11:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795606968;
	bh=S5bV6rNlUtAz5pBmkT5bOjCaAjkySo0AUi3HDTyYZRs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=RzyKTEgyZaqvPg/H/ughgyMCXvevz/FS3Hc8X8wm9RthLQZzTM1VRYTc9Nje96mMv
	 ouf7n7ewS8g7AP+xTCfsXXA0+iVSlUvu5+ENN0JM24WaABHMDGu78jFgwb2+Nf8SHm
	 kqzMDN9Q9+bhCHe5eUhk7WUGvhifAVlmj8mU65Rh0n4t2D02W98dtSJtR1CQse/AGG
	 v3pXit/KTEtPaFKG01aML3G3oYEf405yzhn1kHcQjVSD//MW0ZISz4XbWjgaoH96su
	 0Xwd9NI0Wd3kH6itYIOpLQRBNxdwZEypBWDLd7OcI1mvRQSi1gzAOmLedgYfqKrZQO
	 vmtYsRtIHKolQ==
From: Mark Brown <broonie@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Yige Jiang <yigejiang86@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <confirmed-20261105-21-73b8787ecede@gmail.com>
References: <confirmed-20261105-21-73b8787ecede@gmail.com>
Subject: Re: [PATCH] ASoC: samsung: snow: Fix private data and node cleanup
 on remove
Message-Id: <179553938431.264265.5398629498861013755.b4-ty@b4>
Date: Tue, 24 Nov 2026 16:56:24 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1144; i=broonie@kernel.org;
 h=from:subject:message-id; bh=/5NEFdSU2DAqkiV05/ARjRB8qqbX50qEh8rKN3kSH0k=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLZTm4NE7jif2ypRUD+M7NDurEh7TwOk6bdcjaIbJo69
 +nxtwZ9HaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZiI7ltGhlfXd8lFd+273ehv
 Zf7hzLp3bLusixWEbspNEDWqlt5eZszIsE7S9FDU7R3xV+xc9bYGr89WLZQ8td/sntsUpWW9R7b
 5sQAA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 24 Nov 2026 17:56:26 +0800, Yige Jiang wrote:
> ASoC: samsung: snow: Fix private data and node cleanup on remove

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: samsung: snow: Fix private data and node cleanup on remove
      https://git.kernel.org/broonie/sound/c/2f218b200765

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

