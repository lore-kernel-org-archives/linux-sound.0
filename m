Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795711225;
	b=frP1j2rabLFGVUYASpUFJadi63nFBAuJ0cxD2I62gvY0Hqs4rRP84osfudex5Z0PfCzF
	 DDvwWcZFbf9LFhp0cfQhCkNFQtqugcuOAJtvbrCOSaVLAlCkH5/xbzZGfxVql+7mFD4RU
	 JJQJnBx8tfG5Xa9ijbsmYqsRqeZx0rohTOlYpugS3n7BqmOOUgZ8mHc2uSC5xLGebV1Y9
	 Bwcuwy6+yD+00NpZ+VZclKYZbLSQhHqRbiHIerTVxNIX/XsjAdLBEfin2UDIfwJoYtZ5v
	 h/wi1FpZ5wQAeuYZvxev5wdHmRzBNEWzwcTdvJbOv8zt8nniYIUs2+aSI1tZ64BSWHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711225;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=9VkLvgIRZ68OJ/WXBBOGnWxuaTZtPsMPLbexEcJ6x+Y=;
	b=HCQzgMZwupQz4EL3t3oHzUdNQ9fT9QP58sCkpqaIXbs5pvMEAN+klJ85awUa5IVgf5Y1
	 s4bwdxwWpzqs7NSlM3V9ZsmIJKbTAZklOrJXj9qi/wlj+w+7olU8v/gNb1yXOlWSkVcIV
	 xsd3ffs2NfX21gADu/EGj0xMp26CF9pPVJyRxxJONnOFT95B6gxKTNb9oiCUE2mqzi2S6
	 3A/mLLRUoywKGt776hBOrIha4XK53lyTAIvtWO2pSp5WBQJ4vlhtqvn80jTF51aNJsIXn
	 yIO89s4JduMPRvbE9q4Mfi/voLIWGxu3prp6ccO3rQKx1hC4uwRbmUwNVpasoBpDmyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A29Bi3kz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FF1606A31C;
	Thu, 26 Nov 2026 16:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A29Bi3kz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7600D1F000C6;
	Thu, 26 Nov 2026 16:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795711224;
	bh=9VkLvgIRZ68OJ/WXBBOGnWxuaTZtPsMPLbexEcJ6x+Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=A29Bi3kz/30CE1dNFXHf4kLa/Dpn/G8daYCIjDvAR+RGqGbLoPF6+sxCmEtkL2NFv
	 i08s99/+ecunIy0vTFW3eNDGVnEJ5UxxXGGmWsUd/TeJ4MSqVGXc/7sThKZaRPvqJe
	 3MMzRYL1yd0jooOvqw4HpieSAE+QedDg6CqaQPG8z+zFphRLLWzqFmYu9BzilV8lgg
	 ienBWfVlAZezbvg1h6mLEUkqtcw567rM0ju+i8yEgObjbwLZG2pnehIgi4d40Fxibj
	 5AuHqG3FIgF74HtPC1S2ItDXsaYbj9kYc2F4+o0smYSZ0AGFNKHpIiPR77oHMTERVK
	 Z2ZwbS7EVFlfg==
From: Mark Brown <broonie@kernel.org>
To: Marco Giunta <marco_giunta@outlook.it>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <SN6PR19MB23038B66A212CA32A4B6B3CCFC472@SN6PR19MB2303.namprd19.prod.outlook.com>
References: <SN6PR19MB23038B66A212CA32A4B6B3CCFC472@SN6PR19MB2303.namprd19.prod.outlook.com>
Subject: Re: [PATCH] ASoC: aw88399: fix register used to disable I2S TX
Message-Id: <179570289314.142532.6108383649171354943.b4-ty@b4>
Date: Thu, 26 Nov 2026 14:21:33 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1118; i=broonie@kernel.org;
 h=from:subject:message-id; bh=SB5/cfXUGdvfXqKupjXdFaOohRU8JpGABUi1HnhLQ4s=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI5Er4unRnntSBCzyFt2etbiWoLPx6Yn/3jw1tvscZL6
 7lPP81/3lHKwiDGxSArpsgSl8X9sr7k9Rq+gwvbYOawMoEMYeDiFICJWE1lZHjH2aMjVhFYvZHX
 Nv6e9FuWgM/JWRUOUz5uf3vjY53UutcM/4vN9tqv0Zkq5KMxb7m+5we3n8Z777LXrqrXuSO4l/n
 ODh4A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 21 Nov 2026 08:05:10 +0100, Marco Giunta wrote:
> ASoC: aw88399: fix register used to disable I2S TX

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: aw88399: fix register used to disable I2S TX
      https://git.kernel.org/broonie/sound/c/1e5a677a5c53

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

