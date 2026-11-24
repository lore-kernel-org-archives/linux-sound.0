Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795531291;
	b=kQ+WqEgVSH84hxtm5J2ofZ7Jvv5kOJHx3Tp/l/UFEhSFS1RZzK3HL9mrhfMGP3IZkRI6
	 MadLlvIZl2wyhE7Ecs+ZCDj0a37ECgsOckCPMIs/ucZTJYVw/2WCUpfVEq24ee5MQCW+p
	 TucezmdeSLuT6jzKmWlhrEZ6ARhxucHX0vou4R4ucMsopuWkAgxf/XT6QQA5FlMk7WIuu
	 1ARNxcFt/UpdBB5pelyq2BTc7McljIxOwuBFFhzauQHsruuAJKSy6H0NacRxF4+Kji4Yb
	 4bIhfz1roltj3pWaZ368MzhTi/HsB2ygAnzTE3fHv7CjePL5UGdiVyLM8PvpJT9uazA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795531291;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=XRXSBSB8rO6RQ7GFhBEjxN2rOtYb7HbmTeR052+QGzE=;
	b=OIrCBhI/33Ie0vhDKtxZoNk9KYVepc2UZY+NE5CdJnDUqjtpWQpUmO3iAKwWfCv7rE1A
	 KunrHKxd3LW1b5FNaq1qG+Jb/WlP8T9LlEmMWZykchvlw1a0HE4VkRawinNZ869aRjnXL
	 A7twz3hgpB83stvBxJ+x2+/M2X2r9MS0J/0roiYjbRELaCDdIPdJQrizk/+7dallHsnAh
	 LsWqU3HcjM7PtMRR2N6BtxokJXjVA/aQpw9OnVZMb840liabVvRdJBmsyWkPHVDKyrtFU
	 wJ7KDK6R/eQQcgcRV/3MHIlOMa7ZVEzQBMrgwHik0VhZvsfSmfS7roSxZJ+uJvzTSlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MU80bMba;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22313606A321;
	Tue, 24 Nov 2026 14:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MU80bMba
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D20BD1F000D8;
	Tue, 24 Nov 2026 14:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795531290;
	bh=XRXSBSB8rO6RQ7GFhBEjxN2rOtYb7HbmTeR052+QGzE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=MU80bMbatHsTiDL3M02nm5xGBzIyW8o9U/oE87s7xVomzY3yl2ytSFWurC7pxyDCB
	 E/4wgzRppHc/KPuiQA90C+PJh3PR438jOOW+KIXz5m/NCFZzdlZqt31zFF8cuExh8Z
	 EvuJYzy00HWkws0gKGCqK/9ZwDjBdNtNDeV+xR2kNP6tm9v72/8gA6txkvH3PlUHCo
	 vtY0g8HJFehVjGoDqnXMJkawWGhDcQJrbQGq+1+UFq0itLw9nClksGlT1EPE1tCheW
	 3ccavoFJQ7JttSMUbP8AwDFoxqV2AVC6rUMyFlTv4RQAWWwMIyDUdm6Y03DLNmKKfq
	 Xaot3PEjtUNsw==
From: Mark Brown <broonie@kernel.org>
To: Vijendar.Mukunda@amd.com, "James X. Nelson" <james@wetheinter.net>
Cc: venkataprasad.potturu@amd.com, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261122034611.26008-1-James@WeTheInter.net>
References: <20261122034611.26008-1-James@WeTheInter.net>
Subject: Re: [PATCH] ASoC: amd: yc: Enable DMIC on MSI Crosshair A18 HX
 A8WGKG
Message-Id: <179552756971.264265.5191868853419633704.b4-ty@b4>
Date: Tue, 24 Nov 2026 13:39:29 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135; i=broonie@kernel.org;
 h=from:subject:message-id; bh=EHL40PSlL26aK4NM0uKfRMIgwRQN7vz5yGBCoX+tsyM=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJZF4m5B8WdvVd6Kf8ds8rDhvTSqa+93Z8ssxZo4l7Bp
 yBvFfylo5SFQYyLQVZMkSUui/tlfcnrNXwHF7bBzGFlAhnCwMUpABO5zcbIMPXT2rcv7Ivsd86o
 fNxy6MW/rbHmU7aqLbAr1TXPbSkraGT4K3zUY+Na3d+88muDH12WfJhyZsKOWzO6GAt5elSv75X
 n5gYA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 21 Nov 2026 21:46:11 -0600, James X. Nelson wrote:
> ASoC: amd: yc: Enable DMIC on MSI Crosshair A18 HX A8WGKG

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: amd: yc: Enable DMIC on MSI Crosshair A18 HX A8WGKG
      https://git.kernel.org/broonie/sound/c/1c1cd016da78

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

