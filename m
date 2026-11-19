Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795121838;
	b=SXqAiJUIuO5R3AFVg1VFf4+7+FFV6VWGQ1LvHCPDAW2A/yR6a5+KHpDDHznQ6CfdpaSC
	 FSy36dmCBkCtJOiXLsiWRCd4AZPKMANwqNj+nx71njbM0PiqaRJsTe5cehYTKbOErrM6n
	 PsompAky24jHAHNiBUStmUSa+ZNUEyGzMfR6O6HvbHLzpsBoUvTjBtwJyKYNjHvulZ5Vj
	 FTCk36hLVKW63Zp478pd9sThR1H/9a+ZL0A7J9oLqjv2jSUK2SnjR51kqon4TljGKzic1
	 M5YcBILVFYUredkuZ4qBGFNVJywqM6QnjXuDQc3zE7q4kpkBK3zxjzoj2MH/pWDzp4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795121838;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=no505zZL+Nq4dlmNvcflHS6PVdF0s1tyi8sZQ6F8q+E=;
	b=cIWA8lHPDB23jiqiT2vDrZTn6O+qE6ijnxEclI1OwUWXfawJnno29Of7OjktwZkRd4SP
	 XQfu4J02H+e6ccVFYRdTTjMsrdM2ULzwZGjMWZFUpee9o9qqLz7rzNDwGbyPRtQOnxiNe
	 KSIfR1NeyJ2/2K9NN2ImtEcjOuC63xC0icbdoyGx3USushQorlQ9oc3fmYaf7XmCr85dQ
	 L6XDApCCzMVclmroFj2MHUbg82ylj3sRLI8Lnb6JFeI8wNgKD0BpmWlU7xaoLtxNgNimb
	 aLSmYUe7laLLBIU3G+itPEZ5ZBRwX1hBAVmrr/vfqwNLxN41wjvH2Qu2EiQ4YstBTcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HSx0gXqt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2A2606A320
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 20:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HSx0gXqt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B90C21F000C4;
	Thu, 19 Nov 2026 20:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795121838;
	bh=no505zZL+Nq4dlmNvcflHS6PVdF0s1tyi8sZQ6F8q+E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=HSx0gXqtkt0j2tVkjfa0KFeIIa+WVEFtM4cAGFnQzGoui6p6XlHZozWvqcnUpsIP7
	 y+LnhS26IxcEo2sDBgGzpjMlfNEGrHuJvtlY9eiO5PmYQsNdOC0lk2kVLpvyH04Tmr
	 2Sokhimhgmi3NuGXHOKu3xIpVyPL4TH9cxO13cl359FoD0V7rZRzOvmZm8tNqhySo9
	 GUU+giNdEGYMfHUadybFPTl+g9r6tV8r0iVmrH8tzqZa0QxzR2GXCIhX+7e714v/dZ
	 ptjRWa1SpSzxVl4hu8ucQUq3Rq3RBUrJPBpDUjQmtVD7SpOImdVPLnZGkOK+dcFrXx
	 4K5Qnj26rJAzg==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Shenghao Ding <shenghao-ding@ti.com>, linux-sound@vger.kernel.org
In-Reply-To: <20261119131045.2152868-1-tiwai@suse.de>
References: <20261119131045.2152868-1-tiwai@suse.de>
Subject: Re: [PATCH] ASoC: tas2781: Avoid possible zero-division
Message-Id: <179510975368.116416.1562263176125244274.b4-ty@b4>
Date: Thu, 19 Nov 2026 17:35:53 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1104; i=broonie@kernel.org;
 h=from:subject:message-id; bh=mg66tJuBqMbMQI+I4wag5JUaYUOZUcuGjrHoPBOiRJ4=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+J602mLXe3PNZzWKvQ1MD62rmPb/71bdYQCG0VFKSI
 9Hy1J+qjlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAExkfz8jQ8dRp6elh0W8A205
 uNjY5x5jCTdWeeDZJ35s7axOJbuixwx/BU+uqeKqvyZy4/ZE5pw3Hc7tr7YoPXgjPvFj30IZxVu
 6zAA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 19 Nov 2026 14:10:44 +0100, Takashi Iwai wrote:
> ASoC: tas2781: Avoid possible zero-division

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: tas2781: Avoid possible zero-division
      https://git.kernel.org/broonie/sound/c/f66297be665c

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

