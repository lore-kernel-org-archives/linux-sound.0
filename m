Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795536200;
	b=U907y3ro6eOg+J5ayPf3y5heBhSQoyWUT9T6GAn3Z+VgZ9MV8WWzEv+X8rwgzP9Aulxj
	 ue7kcl59KrOhCDj0DEzzaBsF96v2AVAKJ741sPFTgle1tNBV8Yp1aJtdG6SXV343zUNmq
	 Rlo+0FiX12p1BNSVU8vXwhKvx5KfG2GDs5xPN2A+JBENh8qylZ6zJKSEUHzWdqjNe+sk2
	 jeAVF8S4Oeed9SuHwyXm8qxCjEkRw0bonR66xQliECsxyNUBDRQNGjowTrTHjue3sjHcu
	 jniFMcrz7UBZtfGZkmhMVy40//NO7Pf4uoh0+DONevxrvPc1Vn0KRsS9xNTvc7dUEWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795536200;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=oTbmL8FYXTYtuhTiuYxcxch/wLmgGc0ohN95QqdcIns=;
	b=QGgyqxrBMOz2o8l/XvzGPI0zDAH16cVL3GbjWSIhuyiYx7WyodgX0AP6xfS8STqfm7pH
	 +Pc22MPVLItbtLjo6M59qs3sEvitSHu5zQozGf/G9AUnNrd7Df6M/ZqhAroJdo8eAVWmo
	 9Wr6y1UUvu1LH8L0m1+cSukbevC3XmPZ+CnqYgbSIWJqXDY+Lo0WamtkklpfRkJ5TMxo+
	 0brS3AwpXBTW7MXoCfjNZwiKbD/FfPtdnxgvSrUx9N8admB6dw36FGCZrYuUxBDR4ENXC
	 CQ6nyEQTvJL2t2KKF9pnBrSfrm2WuwgKPrh6bdX/IbZtGOCMKn+yaXwUIfDovwS8A7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cJpjGeGL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C887C606A31E;
	Tue, 24 Nov 2026 16:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cJpjGeGL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 892591F000C0;
	Tue, 24 Nov 2026 16:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795536200;
	bh=oTbmL8FYXTYtuhTiuYxcxch/wLmgGc0ohN95QqdcIns=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=cJpjGeGLV77U1aNLLmu+070UG4jz6qG4FHRDb4/a7fzgrwpeStNySirSiOxhfgoHH
	 1LpmM6Y+ByGZQK7aajzFDtIwxa4aXEtHgLYAp05u/RDtKNinyR1iNZIqTEp4P8s02U
	 nIlj4JUv3thOW8mI4HcNHyrlN8TgaKD/gHJXN8iSBJo9ab8yJTMlKArwWyw/z3upyI
	 Xe9KexJPF1vhsPd4W9Ia2lMkcmLT2cNeAsi3/Tgji/Mmz0HF6Q+pV9MEeOlPiUqSug
	 cTLQsLeESMpotSDHA7j9wa73ciVS54dXRJOOzfillhllnjChNsX2NPjUqnx4D4ygW3
	 ckuNzXJfLSarQ==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Markus Paltian <paltian@gmx.de>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261123213153.51026-1-paltian@gmx.de>
References: <20261123213153.51026-1-paltian@gmx.de>
Subject: Re: [PATCH] ASoC: amd: acp: Add Lenovo IdeaPad Slim 5 16AKP10 to
 ACP70 override table
Message-Id: <179552896993.264265.11749304103019280715.b4-ty@b4>
Date: Tue, 24 Nov 2026 14:02:49 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1166; i=broonie@kernel.org;
 h=from:subject:message-id; bh=eE6rxp9HFrprQ2dv0kV5tSxZKft2pX2N3HA2SvNqU3c=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJZt7pknxKI8bLfsrU64OzdwKY3xksYhZ2avglL6mjkJ
 Z69LZPQUcrCIMbFICumyBKXxf2yvuT1Gr6DC9tg5rAygQxh4OIUgIkkdDH8zwsNDfnhvGmh9amU
 g6f8Llesvuy0KOeP2ZYUrYKXmqekDzL8M7uid3ThDrHFM0oO2V/e8V/Iqj9jc/y2mjb+sgPvF/R
 PYAQA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 23 Nov 2026 22:31:53 +0100, Markus Paltian wrote:
> ASoC: amd: acp: Add Lenovo IdeaPad Slim 5 16AKP10 to ACP70 override table

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: amd: acp: Add Lenovo IdeaPad Slim 5 16AKP10 to ACP70 override table
      https://git.kernel.org/broonie/sound/c/655e2421d693

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

