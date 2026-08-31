Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3295C49B1FB
	for <linux-sound@vger.kernel.org>; Tue,  1 Sep 2026 18:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788286770; cv=none; b=t6xW6u76a62vjcwePwbm4bxZvr/X6K47aHlJH56ZrbprSyQo3tGCk0dFtajyao5H3B+7UoixnUw8Ib8kk/Ux8AKrz3vsuV1QVsYX44lAzYOMnN3KlJWQNGqcUle8hqweprS9bUWytCEVUkmmcIXgRcoS1LV9Wi0hvfllGP83sSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788286770; c=relaxed/simple;
	bh=WSPF8t2q9F8yyW5zuno6yhiGaqCXmIZ7Ex5ur9GSf7M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ltspuzjpFzxDK5Z9nJVPRC5dILVTtg6RjePlafT1jck6i2lJvpCu72+zLsOlgYELXLPGkRYnowX93k2dpa2a/PDgvZr5/QP42TcEdD5V7SyTLqN47cRKyQ7nYMN6u3cxmB1Dj7E2EIdgV9oCZMmAp0gLn6XRlnv2T0SRGdRPARs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SHKKnZpF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SHKKnZpF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF3BB1F000E9;
	Tue,  1 Sep 2026 18:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788286769;
	bh=61RHbydTp+U1g7BLtR0NfkmlQBw0S/wGe9BNUoYJgZg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=SHKKnZpFJapeJnYlyVCIvcmDlI9+74Kho8yGpdhtwDz2y9C4XJKMPbNr9PJPfZoqq
	 zL/TrytSxr2aIrxU+vlayiJgL5HKzjDTlVDnGeuX/YX+iN0Pr41b2FXa4e4EhDFKB3
	 T+Iy5guSiJ4tNrNJM9/30FPRIXY/WXylcIvMF2OqSKSdtBHqoLj7r8yKrWAYaMECg0
	 MV2xMGeAzB75aybJrUgGHcnHetTrGpgAJQdkUzE9bHKkflZevRO7oHYZQFPAuxDdWx
	 BxuKhTJhVbhWtVO0yN/7G3BN3lcd8C/1Qo+rk3egn3OQFaQCgm+cYhpAcNtGvTBDSU
	 L26qc5Kf88/sQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, 
 Linus Walleij <linusw@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20260831-ab8500-codec-fixes-v1-0-f85024e717e3@kernel.org>
References: <20260831-ab8500-codec-fixes-v1-0-f85024e717e3@kernel.org>
Subject: Re: [PATCH 0/6] ASoC: ab8500: Fix codec reset, routing and DAI
 setup
Message-Id: <178821091053.439600.12827592029951309856.b4-ty@b4>
Date: Mon, 31 Aug 2026 22:15:10 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2051; i=broonie@kernel.org;
 h=from:subject:message-id; bh=WSPF8t2q9F8yyW5zuno6yhiGaqCXmIZ7Ex5ur9GSf7M=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqlxctP8y7TNJ7OT8HmwRDr1tcNo7k1xnU0ZkeN
 lmXytv8mDCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapcXLQAKCRAk1otyXVSH
 0B0xB/9LR+GEFqeHpJWDpljCcx97bmsE4ppk/Yl2aHo/XHKh13hKHK1g7R0duN36D6q8pOnLoEW
 cGwRlImk54r34lAtICc5S5TCo93NsxR6wHXeooui0dj9gT18hZ2IT8u+4R1QWLlySw9f6nyg//T
 50VdMQQhZpGwnHh7dDmAL585NbpZs33YlyO7LluWGhMgUPE8Hn5pJgllIVx7HD0CeEMp4h+4/kO
 wgFu2rwNXhBQYVbht+yRHHAqwTCqDU8X/HC4NhMF+MGZoDnUzUjjfwe2Za7OiOl8/rO9Kci8E0l
 +wqdyJb+rbKy6MZWjTyBEYRLMSaxmXsm4pCqhU+2qsnr6EV1
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 31 Aug 2026 22:29:05 +0200, Linus Walleij wrote:
> ASoC: ab8500: Fix codec reset, routing and DAI setup
> 
> Repair independent correctness problems in the AB8500 codec driver:
> reset sequencing, AB8505 digital microphone GPIO setup, the capture
> power graph, serial format setup, and TDM slot programming. Remove the
> sidetone apply control which became destructive when its coefficient
> controls were removed.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/6] ASoC: ab8500: Reset the audio block before configuring it
      https://git.kernel.org/broonie/sound/c/8e839bca7793
[2/6] ASoC: ab8500: Repair the DAPM capture graph
      https://git.kernel.org/broonie/sound/c/103fe1a37f04
[3/6] ASoC: ab8500: Correct digital interface format setup
      https://git.kernel.org/broonie/sound/c/f98785adf004
[4/6] ASoC: ab8500: Validate and program TDM slots correctly
      https://git.kernel.org/broonie/sound/c/85cef7e2004e
[5/6] ASoC: ab8500: Remove the nonfunctional sidetone apply control
      https://git.kernel.org/broonie/sound/c/ec75e653b70c
[6/6] ASoC: ab8500: Skip missing DMIC GPIOs on AB8505
      https://git.kernel.org/broonie/sound/c/711178754287

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

