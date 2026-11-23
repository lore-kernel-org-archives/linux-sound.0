Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795444717;
	b=hwfAeNiziUAjJmA5llirMPSZAgaZtPwDWUbhHdekRmmTeQvU4TMGs8hT5ZUSOX2yoVeo
	 j727QXZAqfkCbwzN6UIvUclEBm2AWN/ii+bpvDMERypbdD9ayyYLZ20LHiJIw29TRn37x
	 DzLJaz1kSoc6dGDDsajZuq4MsrJmfYPuTMQmc38ix5APbUA4iPROFTuz6ZLK8qJgYHWiW
	 f/olJJWNGXlxgfB2uFnl5G7MoPWfHHSwM4/eHXpFiV8VmIgtU+BsnmtIXaKiR4PNU0zZK
	 atgVF3gBjTwtlEwg2avzRGaVfNllBoJFuCwTiXuvxycCq+CLaJn697LxuOnYbO6Dv9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795444717;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=sg7tdXVTl6CBr93/kEJcagyPTR5mqpB+pSl9U13IANw=;
	b=YnsT0GXD5XGUyoynoccN8bHOzkUM+oxgICaqvUXI2Yl4QdvSjdkPpy/vKNv4eFBycGiy
	 8vRTx570ujVU40+d8KPdpQf4lh2/tKCddZtboGFSGKsH3LUrMw3OJebw224xMpSVimZtw
	 S7DyoSZM+/MBNaQuLZLPnL3K6Vv/XH1u/3OPhX76lc1ELBi9fypWDOyU3ndTlcqiHtA0i
	 yoSNpUSmLjJLwJ5b/JYq31ey/gC0oOqnT50nxRVewVQujRv5ZsU5M8+ooTJYOYXqou0vg
	 +gBHT/IRkIhBM8YMYLMvG0ukjBzQE32Yb5e/9OkmWsW6IAlPSQ+15DYrtXpheiC71sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QcnW+c9B;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CBD606A31A;
	Mon, 23 Nov 2026 14:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QcnW+c9B
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C447A1F000C0;
	Mon, 23 Nov 2026 14:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795444716;
	bh=sg7tdXVTl6CBr93/kEJcagyPTR5mqpB+pSl9U13IANw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=QcnW+c9BSbtwhDTvUNRVqGAbVeeg6J71gOqx9Vr9xBkxypM/qg3dKPC14X8fTW96p
	 5TLkXTUJq3Z6ULTI/LvLd2NaWFcmXCsHix9/NG1LgvdaUJHVzwAas2Njfif8gxn7+o
	 58EJRy7efQHSyidO3crIr3NL6qoesXoluYvHdDFTSxudyr6EpbzlC3NgUU5uLkMBMi
	 VSGNmTqVYPZ/R7s8no/G+4EsMQ47iX2tiWgpaVyqWPy6C/dBTnjBH8kkuLdnxC6rl5
	 st4pubhuIB2VHZiHzV8CG3SkCr9dnbgrbSSnwZHBW0ryDsCkb1OAtopHN4bZaYv3/U
	 Qay15zQx3N0fw==
From: Mark Brown <broonie@kernel.org>
To: Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: lgirdwood@gmail.com, zhangyi@everest-semi.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261119075906.50214-1-zhujun2@cmss.chinamobile.com>
References: <20261119075906.50214-1-zhujun2@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: es9356: Handle register cache sync failures on
 resume
Message-Id: <179544131326.25092.3924634854884572179.b4-ty@b4>
Date: Mon, 23 Nov 2026 13:41:53 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1131; i=broonie@kernel.org;
 h=from:subject:message-id; bh=gNT1t9oj4bQoyXInP0nEW3505DKyxa8VFd0iMahsAwA=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJZ/F+1785P5vqRGTt9/6rA6yEn7jcdO2z+UPO1toPEx
 9e/DVf/6ShlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBEYo0Y/sod17HbpfTB2GJF
 tlvMysAP/XOfTig/rsH0+kq3BPuNJVwM/9RL/wk3m84VuL1yLfOqaVsW+0p75Fz/ePnPqfX8mm7
 p6/kB
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 19 Nov 2026 15:59:06 +0800, Zhu Jun wrote:
> ASoC: es9356: Handle register cache sync failures on resume

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: es9356: Handle register cache sync failures on resume
      https://git.kernel.org/broonie/sound/c/04573b260599

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

