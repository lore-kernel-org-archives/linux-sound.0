Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795129580;
	b=X9q+NxRlkcCEJ6Hnpl4yZZ8lCKq/J8v5iOLVMpW1zStSU+riYlcpogSpn4EuX7acD9M0
	 eCDnwExvuFBdysWQkIWAbpyuavv75HMM4U/xhHpkYUT1aopAzRo9FOqu+aOOUB8+WUQO8
	 98VVxh3fBm6o5ecroecXqJKF3wf8wpswCIqJMVLPx9QrRIhuySjn3hXmxsp4CaYDkjUCH
	 fz2+jjmH2DOUs0BQWdqUN1CLHivsNb1sfWQFmXUcv44aTY3Zt/x2RrrmsPYTbqMGLmYf5
	 h+oNKsyOxOtPUlnVcHtazyAuALeOwkYENuw6XL0KmDdavfP9rbZOu6EVVGo9MwA1wfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795129580;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=YZfqBlRO1zaRmf0WxInELtJ7dtRVSVlyfnc3joty7bs=;
	b=xEAdMWL4floe6mGmMdu8EU7K4qzWWPEiNRiivOE06t4VyxFTs78BslockAeDTxJUEpr1
	 QnPC2sU7Zyy8biYdiZyVjfKroPizxX92R/Y4PDrnpg9muMwB4V11u2VME83IFrK1uf6ZW
	 9FvH57HTnFnsnqBe97MYkzff4Jq/zaObrBDruEeXztxp+NdOwlgPxOlyflY2FmTI+Sv6n
	 Uk9Po5VDPOGwfe3IL5y5a+Al8vZsnqiSE3SiC+aEQEjjq6wopZq6Lq0QpjJQqYHfkHwsQ
	 wFyorHxra3gPch3+dC/oG0QHJ+KkzQ3nh39DDtJ27vKC5exYUj29N7HQLi51sJCYLzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=katGgyNI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A103606A336
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 23:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=katGgyNI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B93A1F000D1;
	Thu, 19 Nov 2026 23:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795129579;
	bh=YZfqBlRO1zaRmf0WxInELtJ7dtRVSVlyfnc3joty7bs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=katGgyNInW9r/gh+BBZ/oajdC5SBCJAaR0cp4RBJEtKTfMmbMT78mPGoyd3Vh+/0J
	 IKdEU+MhJ1N5QrEQFrTeDW/rNwkyL/smoe2U4uEe/ifiPbdmcWdIvIbjE88fbhTdw3
	 mhjnqwX8pKktO+ehoPK2QmUEdXmvdP2230csZ1GgWO7B7JFSy2WP18clsXoClNaDTO
	 5GkdRXJIAiT2oDNhvNrJ+K0f89EUP7I92+TQYLYxpaNoLApW1RabdXKD7ItGIKNJ19
	 Alvcfw3+MA+wGqz7RguyFXxikNf08dAQ9ZAHBAVqN3Izi+jIWDdp+KLP+FmvSifIua
	 ulob7BmQrKXBw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Zhang Yi <zhangyi@everest-semi.com>
Cc: tiwai@suse.com
In-Reply-To: <20261119112647.6728-1-zhangyi@everest-semi.com>
References: <20261119112647.6728-1-zhangyi@everest-semi.com>
Subject: Re: [PATCH 0/4] ASoC: codecs: ES8326: issue about pop and
 Configuration
Message-Id: <179511021913.116416.5542166973790534976.b4-ty@b4>
Date: Thu, 19 Nov 2026 17:43:39 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1919; i=broonie@kernel.org;
 h=from:subject:message-id; bh=K9wP53BzBQTS0h2k/ifl4fvrHyC2FY/tWMwpLj5UKak=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+N7ycViybuXKJzcrogOL1C33vWdlrqaX+KFyh6L4nI
 S+5bW17RykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTACZi2cDI0KL0J/qnb4Ki3P2q
 nkblzxO6PbhKQpIe/7g4+aZjp//kcIb/+bnx/jO/Vsz6IZf6k7N7U4x39l32CP57MuVRn7pfqR5
 mBwA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 19 Nov 2026 19:26:43 +0800, Zhang Yi wrote:
> ASoC: codecs: ES8326: issue about pop and Configuration
> 
> To resolve the pop noise, several delay settings were modified.
> To improve the codec's performance, the initialization and clock configurations were adjusted.
> 
> Zhang Yi (4):
>   ASoC: codecs: ES8326: Modify Clock Configuration
>   ASoC: codecs: ES8326: issue about capture pop
>   ASoC: codecs: ES8326: Modify the Initialization Configuration
>   ASoC: codecs: ES8326: Adjust the delay during calibration
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/4] ASoC: codecs: ES8326: Modify Clock Configuration
      https://git.kernel.org/broonie/sound/c/89eba6af02ac
[2/4] ASoC: codecs: ES8326: issue about capture pop
      https://git.kernel.org/broonie/sound/c/5541b1384d4c
[3/4] ASoC: codecs: ES8326: Modify the Initialization Configuration
      https://git.kernel.org/broonie/sound/c/9b59871080d8
[4/4] ASoC: codecs: ES8326: Adjust the delay during calibration
      https://git.kernel.org/broonie/sound/c/fd1cdd8a0699

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

