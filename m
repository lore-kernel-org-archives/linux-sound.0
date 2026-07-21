Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21EA34EEFD
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 13:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727269; cv=none; b=nAYdmyXjD1sD/6ChLbC8jOkmElX9HC1qdzPRi+l0VBeYVDmdfgIt3CGSFrKdTExWzzEvd0mwOEIBjNAivNp1aSHYbiWpxxBN/TQ0GbgCALC+ilkCu7FRpJIN6YorWtR0qgK0LSrcAFLPUskQG+DuEbOlhiu4gMPu/tx4fs4tiIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727269; c=relaxed/simple;
	bh=D9+/Td8Wm7af9ygq2eIXcVzX3ufnwVZvoGMz68HYenI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qD+j3kERQ2PD6ebXDwbhq67ATz0Pyg66awpy4PsGXIAw8hvgg6H/jbLCrg3uWUcapaM81KAwAdXvKeTfuS+Q/lqQ/d7KZpuzer+MuSuNmUrU9JfnSwDgeDp4fk9EI11fbRZ3Ys9/2tHp8PA2SP3l490WaieOnHTQyNtKyl9sMnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Og/WWq0J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Og/WWq0J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E72D1F000E9;
	Wed, 22 Jul 2026 13:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784727266;
	bh=jmChifo/Gjz7A2amPSNMWNpWBYkzl0p0o+oaQshPTd4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Og/WWq0JkRxmGCMk1czJjwIUBIyaV7DSP2g9GSu4PPv5jW2uoUEhkpH9/HDy+fpT1
	 u3X+rzAxAzXUQVebdfsYB0xJBVK/zJnMHEAusYO3ZEtpqz+vltHolQpRVvgvgbybdq
	 ujnczKmeDOTfb6GpRRi5jzNkBEFkH8qSFh7c42Il/dW2tuMUnml4rs1EhatMZqLrra
	 n5jO+Fi+M8xjPrV3AIY2WJqkH8t05IJBUo74LbYeB9Az+xzpAuXTkWcY16z6iXbdVV
	 aIPXE1A2r9ut0EaphZsmdNkK6zeHmefsz7zk/jzvUOvIWfsL8Bx3+Zf2v9bxWTZTcf
	 o1Pk2fGrBqLMw==
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Darren Ye <darren.ye@mediatek.com>, Jaroslav Kysela <perex@perex.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org
In-Reply-To: <8733xdjfdq.wl-kuninori.morimoto.gx@renesas.com>
References: <8733xdjfdq.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/4] ASoC: mediatek: preparation for Card capsuling
Message-Id: <178466142199.260430.443154717706779036.b4-ty@b4>
Date: Tue, 21 Jul 2026 20:17:01 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1794; i=broonie@kernel.org;
 h=from:subject:message-id; bh=D9+/Td8Wm7af9ygq2eIXcVzX3ufnwVZvoGMz68HYenI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqYMbfaOVThgOx+6ES/VyfJQ5iIHUoKVIxq/bTJ
 Fm8T4tDJWaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCamDG3wAKCRAk1otyXVSH
 0AboB/4zC+6rh+8Py9zo8qDAHu1a32ouy1OBRAzdmGIxje4WQhtCxZDCojWuQ6ELClyaE20cJZ4
 Y8pc+Y86IO5vm7eg1bpIf/9nx0Gx580YuQybFUPO6dqMrcg6XwQlqYM21uTb6CG4Mbo0PnUFr8d
 PN9W8OyIrcIe49sxVyOX6+x1owXaTcI2Z3+muAzfMBg7N15CNXxNqDOmaGSZT8fncQPHspKYXg6
 zCvbatu9M4plpp32ePLfSz0ZD2Y1BEOf3CGPbrC31of/RWHKTSrznpP8obJUbs2XFMRU8TzV6WV
 bzwtZ21YUSn9hvcIg1sdgpisB3m1Tpl4s6gUCNS1a2N2ZpAq
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 21 Jul 2026 01:33:21 +0000, Kuninori Morimoto wrote:
> ASoC: mediatek: preparation for Card capsuling
> 
> Hi Mediatek developers
> 
> I will post Card capsuling patch.
> To makes its review easy, tidyup mediatek drivers to reduce
> un-related diff as preparation.
> No functional change, but is preparation for cleanup driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/4] ASoC: mediatek: mt8192-mt6359-rt1015-rt5682: use *dev in mt8192_mt6359_card_set_be_link()
      https://git.kernel.org/broonie/sound/c/315a717c716e
[2/4] ASoC: mediatek: common/mtk-dsp-sof-common: use for_each_card_prelinks()
      https://git.kernel.org/broonie/sound/c/8fd27d490a87
[3/4] ASoC: mediatek: mt8196-nau8825: remove unnecessary declaration
      https://git.kernel.org/broonie/sound/c/a5db24234405
[4/4] ASoC: mediatek: mt8365-mt6357: remove useless assignment
      https://git.kernel.org/broonie/sound/c/7a8073fe03bb

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

