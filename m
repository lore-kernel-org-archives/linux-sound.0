Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794136572;
	b=hWJXo6SsqUiy9fZQ3NaOledwnAVhN+pUbAd9ZSaxQZ5pE9HVMwTClls54a7797S+Ex3Q
	 W17cpwb+H0SgjaJGh50UDj6knNS72MbL+gFvb5YPGk+EdD9035ByeAFKeLtvJaEduH3zx
	 4CrxcrQVCxib4LsTIkb1panpv/KKIwNy1/Eih4qzKfdjAI64BW99atsSgjdgS8XjI8BuE
	 pn08cACuayyO31TvTHnW5mrGhe40GUR1U19ZpOPuP93dSo6TdMe1TmfekzWOb10UnoOqI
	 goU1BKddcFEHyqKFXMSLy/SRRyVKZzgAggKtR5uXsSDZK2jJWcr6Yc8VG5bBSkVRGfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794136572;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=CByHSokQ0BH2OUiP5RhqvhPJyHH41uyaBbp6oMLUBOM=;
	b=JuvlTBhREP1ifjD0VuCXHcrkkxWC+rNO4iEYC1736cPIuWUYHuAOMCsAYVURA4OQ0VJ7
	 cT8l9e4GSI9Dd6bkA06yyYvBFknmmkXhgkiQvUdTTm8Ny0MaUOc9eq5dUcjFsFErvs9qi
	 n4/EeWU1JDZ6/VkU545+NJzLReixizqVUk0gvs0/FU1NlrnwUOzEG06py1C+9XX6WZdhS
	 NokqXnPHxZKYMyspQPugfleua+SP8f/LBdXlZgYpYm3iPK56NwxmOIJaA6D7mPJMU1tFN
	 1JLJ7xuS8WCGTjzdvQLXsF3OZqfMXzx8KoCMum6ifuy3RFaV1TYUwfBg+Jx3fk69myQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m1RG68dz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0E4606A326
	for <linux-sound@vger.kernel.org>; Sun,  8 Nov 2026 11:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m1RG68dz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 090F71F0089F;
	Sun,  8 Nov 2026 11:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794136572;
	bh=CByHSokQ0BH2OUiP5RhqvhPJyHH41uyaBbp6oMLUBOM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=m1RG68dzQJOBh/Lq0QTlaasR79xqYKTklWLo+dMyJOe5/4UTTpLVqzGgvaDTZAAEK
	 vVJhL0PiFJ6erLVaDf/fZ/td2ANJ/1EjJGOap1xKEV4PG/+qM4dvEkSmpAk8VmwNgT
	 fH9mwik1C0D2Gb51eeMteCsgRuif6Ph8F0Z8gaUMQLQF8qeVddD3Sk8SynbBkv1ce2
	 eQNkiehYPnoyxNwA8p8kiIOu9nF6OzKu9h03Lna1XQDoYfb9BJ7fDyu7fUdV0bcCLH
	 UdWKlO3VJVEuJOVt+I7iejvI+/QUk5jFlCAXsciqaQ2K02eeyjbwLYLrX1nD2gqp3x
	 nzplkiCCXevSQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 33B112BF8FF2;
	Sun, 08 Nov 2026 11:16:10 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261104024045.1508525-1-vulab@iscas.ac.cn>
References: <20261104024045.1508525-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: Intel: sof_cirrus_common: release the physical
 device reference
Message-Id: <179406071763.3424803.7143508630543436512.b4-ty@b4>
Date: Sat, 07 Nov 2026 14:11:57 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1156; i=broonie@kernel.org;
 h=from:subject:message-id; bh=BrkxsS/j6JItJn7f+bkAoHRQL21wyzHGrHsYUju9bHY=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+RP6q5X5eZLx8+WIWicfLj7o1M3tzei9VzFRjztzg1
 8PV6sXaUcrCIMbFICumyBKXxf2yvuT1Gr6DC9tg5rAygQxh4OIUgImIsDL8M5nMq2L2Of3ghWiL
 iXv6o1VLjwg9m1W9+PGMOgk7rWk7VzP8U+JZ+CrgYL4tq9NJoReT3846ojbTb8auPZd5e2csE+F
 7zgIA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 04 Nov 2026 02:40:45 +0000, Wentao Liang wrote:
> ASoC: Intel: sof_cirrus_common: release the physical device reference

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: Intel: sof_cirrus_common: release the physical device reference
      https://git.kernel.org/broonie/sound/c/afe7120e2731

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

