Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775724;
	b=HQ5oIaiBl9MjY01J9+8ZcNCwvlVqeEZdaavs6TYSagNChmUsPJw4fNhC6GeKiUopYt8p
	 eUiGcBJ8EekB7Omv7rKvccsv2xV2YzQfTx0/IOSjlFow8eBIOVxzorUfpADdspqyOS+HW
	 AXODVQxcwNSmgWXU/VJRA3wSmjVVxDg7BDLBMAnFFOUmIZg9sYpSFIe5a/duEMHZ3Ha7l
	 VjcnPNwDLSGkb5VdvyEjhuLNu/40K7hxMARMgyhW5uBwVA9EW8HQPvXzpfHonKY3hBsOK
	 Lu7ATZqoqJaTZ9BiP22Ukf4Hmch/41BdwoJr1f0gs6kczIZfRijA0n4Gt/xxpQn4Z3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775724;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=wnI9ihy1uaf4niG1ZqSydZnJzwoOo0I3V3YdCw9Nd0Q=;
	b=yVr3S/slwl52XUf6w2uBTiVH0/jGzoVcXmqhsjAv1EZ+yGjbbrZEMYelms3L/xvK51bd
	 xx6iJbGEyN/adSHX2bb46mPeo+ntZ8z/Oyfw692lXj4QWN2Nd9GTfokCeX37pe4BcGRP6
	 tfBKzVDQyBM2sGyPKQVrHsuk37pbYRVUue6tCtwJKrbxuaweJTp1dxBQLyK/arioQ6TIT
	 YPwypTJb2GULKKQDYDGL0ee/stwRHq7GxI3+YH6tNio0CRnqr0IbERls64dXIYAmk0Pv2
	 QV5seen5+CE1Fw3MtiqUUOk4DJonj7fWSMwX5FQ9aY8CGrJdrqFvetr1vQWdgQ8G79g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hZKsVwiJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB5F606A31A
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hZKsVwiJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABB7E1F01825;
	Fri, 23 Oct 2026 17:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792775724;
	bh=wnI9ihy1uaf4niG1ZqSydZnJzwoOo0I3V3YdCw9Nd0Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=hZKsVwiJ+F3IV986+T80k4IsKSiQzB5oSqJUqjR615ikjd4MJ0FiEdXbi8oAEDVTd
	 Qxd2VDk5EuO1ojU/M5iMZeVt0QJcRTp2FulK6pVZMl+8DeRb/LDo5jaW7Lpr3mpMxp
	 n6hoJva4KzYRwEmnYGueujGP81g6y3liTAmTJO3o85zLdiYhSgXuPUeLehGxKt6WPb
	 /u0wsglNkFh6SPW8F/XstzjHH3CZkRoi0DakTnfr4Nff2pC8SKRBq0NY3YeHLQlqiP
	 Ox0qeyKqP5alhxzb2jyFXmomUL9zeTulEakjKlmPAs18IVAXpoZwhOIo1CaYlHiG4S
	 Kqap5coJPe2OQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com, 
 Meenali.Gupta@dell.com, Deep.Harsora@Dell.com
In-Reply-To: <20261021090929.2135891-1-shumingf@realtek.com>
References: <20261021090929.2135891-1-shumingf@realtek.com>
Subject: Re: [PATCH] ASoC: rt722: enable mono speaker on Dell SKU 0EBA
Message-Id: <179268746470.3909521.1245507525370279326.b4-ty@b4>
Date: Thu, 22 Oct 2026 17:44:24 +0100
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1124; i=broonie@kernel.org;
 h=from:subject:message-id; bh=cZif2Y7ZZ6t1ius8Now+tDgJ1icvKF0xkGe3HW5pI2Q=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJuTxM5dTQsL+XlvvL8/dMKwh+9/HPY1blbg/fr7olMP
 tsZ7goe7ShlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBEFh5k+J/oW1erf2ty8LEv
 RbX3LyrtWXVPabaZaa9WxKG0/cKz8nYz/DO95by8frvXnr4Tq70lVk76/sLs/dagiq/fTntGnr3
 VkMsCAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 21 Oct 2026 17:09:29 +0800, shumingf@realtek.com wrote:
> ASoC: rt722: enable mono speaker on Dell SKU 0EBA

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: rt722: enable mono speaker on Dell SKU 0EBA
      https://git.kernel.org/broonie/sound/c/ad45d5369c56

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

