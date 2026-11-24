Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620152;
	b=spuzC60RC4SqpbdQSJUfiukmfZo3fk62Vzw94hVGwNAP48kMCGepkMDKAy1+umNWx98Y
	 9SsGDaaP/v0tuUVIMFRDAe8g8NXgYlJK920yyM7jcl0lvVmqsEEPkMimElpJqMEatcTth
	 k5V6kswivPlqPxZSHkDSOko8trigeXkgVnfg0e0yfliEaPic453nlbL0RY69NTlacdC2k
	 Eaqg7Qtwf8ou085QdE0kseiBKw98gZGOrB1B7nRXoarg9DVcsCWLvrDCYtA9bFM1sObBS
	 hbFiCgO9qFiIMmkBL8ArJkCa0g58uj1tRfPq79sAHw4BSB5O05/0oPQawiNPcF1W92Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620152;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=s0Sjb1DgacCXHrpE8DixpKmLTLzsenxzTbzFw1kwskM=;
	b=hfjblB0VYP3ZVIPyjaOfdaxdZsseZJWK2XL7S/p60qEsKJz+YSJhJPxmCnJUtkSn6I3p
	 WbXmqeVAXtvDISWdiI4+ditFS5g4zAlJXSkJFVFmmtBohEVVmOjrjDqVA9cE9UHGAyxJc
	 29URjcBdXuIsEd6fkANqkaV/2AjZlLagMAdhhWM1T3I0LyuD9Bhqjtp3rVZfZg/KrRDNU
	 xhbBMK64RPKhNfSdJRhC+L5uUjou8BHy9GLrJepVbZVu9Nbagoks2H6BboAiH5tViK9zu
	 SubW7Z8tYfMBj9ObJJKUbUAr2Ns+0pTQzGgd5JZdrmCVxvc0loeRuiTRjhG15mhzsAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="W5RseR/Q";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92B8606A327;
	Wed, 25 Nov 2026 15:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W5RseR/Q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE62A1F000CF;
	Wed, 25 Nov 2026 15:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795620151;
	bh=s0Sjb1DgacCXHrpE8DixpKmLTLzsenxzTbzFw1kwskM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=W5RseR/QkC7iZ18SXo4XPZT82eZfO7qCEQXJHhAxT941VXW20T+6sUOimetiXHQTg
	 5jnFy4zt6+w8tegyzIFHP8SGxzzdDze+acpjVTYtRBUnyiQbhLMb1J/XfsOd2cpaK1
	 raWvPNK0FHVwPisfM99cUamOCRG4FcVC7I5Dic+rcqPCDc5x9JO6SM3jZnVtV4oExL
	 IfNwuTDBTGYmttKJ11VmtPZ+G8eFDDy6ARScfgR8ZJun2t4+8ZBa/bcyiXtDp4LQya
	 2lekjrFyo2Yp169SIM4ayZ/XsC65W6GP7NgzGV2JQnJIzp64iitWb36a2hlCA1wKJW
	 AjEHetdIxiHXg==
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Kees Cook <kees+treewide@kernel.org>, 
 Jihed Chaibi <jihed.chaibi.dev@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261117042102.12442-1-phucduc.bui@gmail.com>
References: <20261117042102.12442-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH 0/2] ASoC: cirrus: ep93xx-i2s: Clean up resource
 management
Message-Id: <179554463637.947306.4123953706641155831.b4-ty@b4>
Date: Tue, 24 Nov 2026 18:23:56 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1443; i=broonie@kernel.org;
 h=from:subject:message-id; bh=i65/khEverv/t4MZb/sMgT44sPx8dhG9HuSw8r/tozI=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLZ/po8//W5NJTD5b5B3A/P1gMlCk1Z9qllG+9IfIwSu
 Hx2FqNJRykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTACayq5uRYa13ZDD3p1Al411b
 /q8y7/gWrdnvx/Wp4IBHa4XOfwdZH4b/iUV/C+1Px0z5lS3WJe+03/CE9Ky0C1P2aF5h26V4M+E
 jLwA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 17 Nov 2026 11:21:00 +0700, phucduc.bui@gmail.com wrote:
> ASoC: cirrus: ep93xx-i2s: Clean up resource management
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series simplifies IRQ error checking and clock resource
> management in the ep93xx-i2s driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/2] ASoC: cirrus: ep93xx-i2s: Simplify platform_get_irq() error check
      https://git.kernel.org/broonie/sound/c/0262f255ad9e
[2/2] ASoC: cirrus: ep93xx-i2s: Use devm_clk_get()
      https://git.kernel.org/broonie/sound/c/59852db7b402

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

