Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794500844;
	b=KEma4ggxgBGvCrK0DLJdVCx8FT/vQIHqnfT4kmfVlBNzdtKzAz4XKFONI9kQTLjL/ccP
	 DKLUgWXKyq8IjAUKeIF60n3OiWUNMI+D27UMRJ5irg+sc+wG648ghdZLOPkbQdM7Fuahc
	 uf9lbbyvvvHypK5IlIYfP6DZsNlZqDZnKdUUntohMZp2g6HxBDSLTilwM8MKaVCLd+eLj
	 YMkx6LNv3BqAERD0teh409UbFp5Lak4PRLEHf2bRuHEHJJs5zbfS69Gqwymb/QHR5ATi7
	 EJlHgjmw1Dle+X+fX7nOzvahr7GyvXrkT4RQVDS+I9+lzYEPQKDc3UJ62kEfXZmdZfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794500844;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=1o33SyUmKjRRYyYa9Y0SKcJBjNIH35zQHJeTKCYP8D8=;
	b=nKyYph0P/NPK7tleCyG9D3If/qNsE5C2ukaFBOdkauRY9MjT1htC6oJkIkMb542sh17f
	 jt+xOO+aDC3c+r7di5usuvsBS0TbkCTLbsJjR6pqLIbrMe2tFyW3r13ctNfYLu6BunsV3
	 qZ4wKztAt18WxDUHwG8A6k31+pGAPfURkypuLG478wdRFxT+EASbrxYIBZua8zfSp2cuY
	 UId0mFt4T1pjm5U+Q/Qaf5S43AS5TSeUKpbUdHbrcrPUJlQEQBEP8clPY4WEq4d7qk5kx
	 Z+QZyHwFOagiQIN3hzLf06HaWIaMvVtz1AAI7Tp7OWu2tNxpMWQB/RJjywHl/FDtnow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DO6iuE2F;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8FB606A323
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 16:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DO6iuE2F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DC921F000C4;
	Thu, 12 Nov 2026 16:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794500843;
	bh=1o33SyUmKjRRYyYa9Y0SKcJBjNIH35zQHJeTKCYP8D8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=DO6iuE2FEbDOl1VNGxc2A/pEX1D3BKA+WaxKi292O+AsgDRbIaOjr61kO1J/2cNzd
	 EUKJEF56oE/NoAK5+Gb8Bq+5E5085zQhmYCtHda2HSthfMQsh3el9BOEUoIbW9HGSy
	 RgH7icprxA1gp5Hj4S19oNJkkSQ0QsAK1+dzU2R16W5stZ/UcqAe7RsJkXguvbBlOq
	 FcrnPxJQ7SiNyTI9PNVa+UwsvVKyPnCYrE0kZxZvYi4wpbqp+7Co06EdAvukYDRfen
	 AF/rk6NvRYEN5fyiwqoUoJ+NY/a6erxtFtvR9t1uuGvj3aLU3XEdgpRMpSi2qC9Nee
	 EF2nESERTeKKQ==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: tiwai@suse.de, 13916275206@139.com, perex@perex.cz, lgirdwood@gmail.com, 
 linux-sound@vger.kernel.org, baojun.xu@ti.com, k-lu@ti.com
In-Reply-To: <20261111015247.139-1-shenghao-ding@ti.com>
References: <20261111015247.139-1-shenghao-ding@ti.com>
Subject: Re: [PATCH v1] ASoC: tas2781: add TAS2573 register definitions
 header
Message-Id: <179442175525.484483.219302524305749165.b4-ty@b4>
Date: Wed, 11 Nov 2026 18:29:15 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1127; i=broonie@kernel.org;
 h=from:subject:message-id; bh=dWPq1sXKPjZrsSkZg7Ad/HJVeNDSb96XyuxgCBEkaH0=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLK+vnhxOMNerKvIdA7rZe0+xqPS5qyX9lsor3PYndm4R
 UcvjKWso5SFQYyLQVZMkSUui/tlfcnrNXwHF7bBzGFlAhnCwMUpABNhkmL4H5jl8F9r3ZvZMhNj
 /nndCTZ8LnROSTVtl92kmEVvV+/5f52R4fhU28+Kmnz39rZZLT1bO78zXIDHUaN+7aJ/sZLx113
 28AMA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 11 Nov 2026 09:52:47 +0800, Shenghao Ding wrote:
> ASoC: tas2781: add TAS2573 register definitions header

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: tas2781: add TAS2573 register definitions header
      https://git.kernel.org/broonie/sound/c/ce50ca8992db

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

