Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606973;
	b=fHgHPvmhcBuUni8qO3eeGncOM4nRKI2awGZbwqNaxY5D/wbE4Zt6kJWrQQnZh+dk6PGS
	 isp6xbM48PG/dll88iGNuSlzsKq7IiPiFOgdjwL4KvmzBqg4eo8Epb9qslZkZoX1spOic
	 rBThHySNq++nFBNErnI0INBBzZNY6WC+3BMnaZRhReNg584KK6h9pfHYm/IsxDYCSPYJS
	 JleAinYOMUWFK/4fXrEApqQVrIoLny2UZ6gKgyu8e9I9s/Y9uB4kJpzwe7iFD187lNFbm
	 lEEWErt8wFAujMA+1k6U247isRmfOl1zxmmksKSKJBphm5toXQ+eOqs2JQ88EskXyIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606973;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=tiprS5cIJzW8z+rEFsqlTLcXVn/hRP8av4Yv91uvqlI=;
	b=5XrPUxMjX52niEmZoo6NWv8jhc/iKTZnhIhf893wFLQsbIdYQ083y0mdU/MCbApe9yAR
	 OpOHRdrZ8Eh4lV7IYMMisXZ3mfwKOqV2q/RB3GalDy6y2lWTv/xHOH9DCD0vPlVYdzkmC
	 daGqalwhQTHDo4XCwH5wF6kkVskEfmVnH9Di0I7ArUOdUUJhMaSAKkOb6YUuwiOh2qezR
	 bHHL8yS/BNqBA73eZmKhjSm99EbZWhKdFa/1yUHJO9+pIl7LKFbsRn7dyWI+9q439vi9F
	 J0L0X5Mx359lFsc0noV+G6WWRxUReUjbpwb4mNxrhCQStc/BehTlnon+BG0Xde3Dp4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l7NMwbqi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A48606A31E
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 11:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l7NMwbqi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2E101F000C4;
	Wed, 25 Nov 2026 11:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795606973;
	bh=tiprS5cIJzW8z+rEFsqlTLcXVn/hRP8av4Yv91uvqlI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=l7NMwbqiq8sY7/oPAQiD+OFtd0Coc30AiW8io6kP09LjwENLPSkh882B3I6eFCBP+
	 a4ygx7iGfC/qUDcTtq16Ebqu72KJ3Ftkp4VyhEN3It64PssYTeuWtwsjl1gd0cEFIF
	 6CbK1MXqHGaTmBaMHzyCGBK2k4QU7iS3dK7wR5jMdHTeLgvLXH1y4ER1rlvm5cdsK6
	 O67KRYUmfFhYyW6XDM5vOQlTiGwQzm2VAKYgBXesdY+0tk7RTy1ji+d8heB7KksKsA
	 9bM5WI41A4r8k6ExjP97nxUTGeImDDOtPIVlpHKSvqmnwlc6JkNGg72f/7ULBrkpqA
	 DIfcl2n/twaqQ==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: tiwai@suse.de, 13916275206@139.com, perex@perex.cz, lgirdwood@gmail.com, 
 linux-sound@vger.kernel.org, baojun.xu@ti.com, k-lu@ti.com
In-Reply-To: <20261124142634.1383-1-shenghao-ding@ti.com>
References: <20261124142634.1383-1-shenghao-ding@ti.com>
Subject: Re: [PATCH v1] ASoC: tas2781: Refactor TAS2573 calibration status
 read
Message-Id: <179553840013.264265.6926777730666030674.b4-ty@b4>
Date: Tue, 24 Nov 2026 16:40:00 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1129; i=broonie@kernel.org;
 h=from:subject:message-id; bh=2jIGmgsiq4wWKUnMFk61yQo2Kpm9U13ydfKMxdPNjs8=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLZTu760/ysg3PXgzVs9bxGrlVarBd/LvGfNEFNK1hsg
 bNLVM3xjlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAEyE4wXDf+/bgW2HFl47/LK0
 4uj2Y9tnh3AzP5extddfP69r86/WZmWGP3yamRv8PP7N0eaXCHWpqO7skJTeeGWv6G+71ts/Q+4
 p8gIA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 24 Nov 2026 22:26:34 +0800, Shenghao Ding wrote:
> ASoC: tas2781: Refactor TAS2573 calibration status read

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: tas2781: Refactor TAS2573 calibration status read
      https://git.kernel.org/broonie/sound/c/ac8059e45250

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

