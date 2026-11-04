Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793841838;
	b=dPAweSeOjHc/ARNtWcDSTQwjotZya1OlxUIrT7levUMbtgrcxmXrf3oD6n5DxP79GqPc
	 Ypw8rg1e6daqB0HrgvybvNT4Xy5Cu6tb8FoYnsPOaaslD4lIxKRt/9yM/rw5pdzVcsoiw
	 /xA2hRmbAr/axUpaIPKOtCLNzWtEkXX+FSXWCUl6/DiooHQiK4+UafLhAciRgi+VkZ/qF
	 xR7vZ5NmJRsOnflu3CxOhuTtoL3BZC56bOq+2aemIs5V+g3Czpf/o1edSQ+NkXn3N6oDt
	 4taLfHKGgKtQn4xVoW8CiXKSBccLRWhc8IJBC1KRYCl21AqJBG5ZxFK8CMEnTl719ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793841838;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=B03EpnY+z56E8b+5oaNyqCn3HsGGwzQ5W5zhM7R00iE=;
	b=wTh2S6DjqQBIbHZK/oI8f22KXu6XHeVKmKGYjGs8i0DqC1xCRWhdeGrVUXRmiLPK5ayl
	 pThpElcNh8s1/4cVtUM9b5IIXZXfwlkjfhQG84x/ZfDTJ2amNIpLmMb2z1mi4MH8scIcl
	 t8/PXZM1JaUqbWjQFMD0EGP9HswLaZRFJNnAKSxBcRGwAOvT5gWn9+IAHI841TASbUpQ8
	 /AIJ+cHDgPWEq+3vTuRWek5xdjQS1FeZdS9OQr7Ikyl2OrGcCccGIeBcsaF/84FinsScu
	 I2/3tQsJ4CcUz5igQRRgc5s9IoVpKINqEvpXsU2DV4ION3LJJ1XdF4ngR1J6MUaqsDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ifp7tFkP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9D6606A32C
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 01:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ifp7tFkP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF7441F00919;
	Thu,  5 Nov 2026 01:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793841838;
	bh=B03EpnY+z56E8b+5oaNyqCn3HsGGwzQ5W5zhM7R00iE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ifp7tFkPzUEcu2oJRmN/o3qMEE/h0ed3wGTmD3IHXiGm5TCwDGZY2OSctVfCeTmAr
	 ogmn8LhZw7FRCT3EPNNJvOkHxIdMOeC6i2fSZOEtdHI4Fv0pZ/EM8I3E4swZOUrQvB
	 rghlQ1tsgnCpIJ1URvBnbk6bWcl2PnHC2Mg4+Awfe0DmwIcOlE5czJnsVsLBfPNppZ
	 ghkb3NdiI1TyxBBh6Kl+Rg/X6lcvpYja711UZOCgtkDJdGb0bS6QTyW08RlLLjOvDz
	 OYBYOSBTvo2VRLKDGwKcCiVyV78kEqPaPNEo62q4+5LEnW5+R0tkz5WphIJz00BT2w
	 GibyLRh8AucFg==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 8FC92272CB32;
	Thu, 05 Nov 2026 01:23:55 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261104024055.1508771-1-vulab@iscas.ac.cn>
References: <20261104024055.1508771-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: audio-graph-card2: fix device node leaks in
 graph_count_c2c()
Message-Id: <179383158964.2456854.14440938297573440809.b4-ty@b4>
Date: Wed, 04 Nov 2026 22:33:09 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1152; i=broonie@kernel.org;
 h=from:subject:message-id; bh=B+VP4+Why3bCVQBSzH0nJ5ZT91/1hCh9sYoruXGhpVc=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJe31r9NWCDvsKi27pKBv+Ll6y0uDP1PYsC7wcBoasTl
 s1ZcaN+d0cpC4MYF4OsmCJLXBb3y/qS12v4Di5sg5nDygQyhIGLUwAmIszB8Fdw92vJWfvk91/b
 IH+/z3HTjuK0Hbc1VP7dFT5SJGu6aY4ww18xHt0rTplBkaY7mha3ypdMmWqyQy/xywXt5aEifjp
 6ckwA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 04 Nov 2026 02:40:55 +0000, Wentao Liang wrote:
> ASoC: audio-graph-card2: fix device node leaks in graph_count_c2c()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: audio-graph-card2: fix device node leaks in graph_count_c2c()
      https://git.kernel.org/broonie/sound/c/740fb77b3838

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

