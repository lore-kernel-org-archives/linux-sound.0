Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87467082F;
	Wed, 19 Nov 2025 02:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763520823; cv=none; b=OxDjsu3vorOTmjOZ5VWArLhpoJSk2DE5f9Wo5t5YYGTx9p0GgSpgW/PxhQTQDYbe1xFP4JeAARrYsiNqc+noToPA9zIu7VwBIcz/j+KGFgDfQbvPv6S5RTNuZD0L2Uf6ofCyGJuqg+7XbnyXgYCsaAzWIxo/KpBJpO9F4SPx3XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763520823; c=relaxed/simple;
	bh=NdiVUh5p7ZNlDtEZvNZ/+7ut2DM/ueH3ssjPZlFqdHI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=P8B4/3Hkr4LexwwXct1GKcmxMrN5KkC05JhIdnlvUb0BWxK+HTi3h9gwuxXVmcQRRTtJTboGPbRnml1U6xxvvS0gV4rTCihyxgfnj/QxmH9HwBCXmbYgvOtSGGGnBA6RsQm4tJ4t0BHZTx9ooGnO4ga02YwEkrs3u/6fWKl9KZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LsSsEj0T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LsSsEj0T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 677DAC2BCB6;
	Wed, 19 Nov 2025 02:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763520823;
	bh=NdiVUh5p7ZNlDtEZvNZ/+7ut2DM/ueH3ssjPZlFqdHI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LsSsEj0TnYRhVD0YYRFVhtF/ktiK6dd/ar2Cpen767gU9t/u9kRMUmBgy9lZj2eJ/
	 lQo5zaz/nMhdOpHI8BEoJR2x5hEyX2t13CPfSmQJs6TQPK/e4zVLlAngGBkWdB0+Hl
	 PdUWhlHrILrVqZyXvf3BXZFcQspkyMYtzggZNL8aNRjo+vAaLBp+Co0p/1zLTDvzTz
	 lhHiLpgWfjyrlvBemFMfkCSVw/CtJ2p4vKOBZ/T2/RetuGI+CfTsZahqi/DUY/GVuE
	 AVmgp/267CGfO9ieOUsCvot/EfzI7NowJVCvR6xH443SzfPiz30+gCGjz9TBnwcOAL
	 Ynmea8veJYGCA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Cyril Chao <Cyril.Chao@mediatek.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Cyril Chao <cyril.chao@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
In-Reply-To: <20251031073216.8662-1-Cyril.Chao@mediatek.com>
References: <20251031073216.8662-1-Cyril.Chao@mediatek.com>
Subject: Re: [PATCH v3 00/10] ASoC: mediatek: Add support for MT8189 SoC
Message-Id: <176352081915.1803701.6390255355558786166.b4-ty@kernel.org>
Date: Wed, 19 Nov 2025 02:53:39 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Fri, 31 Oct 2025 15:31:54 +0800, Cyril Chao wrote:
> Based on tag: next-20251031, linux-next/master
> 
> This series of patches adds support for Mediatek AFE of MT8189 SoC.
> Patches are based on broonie tree "for-next" branch.
> 
> Changes in v3:
>   - Added support for CS35L codec in the machine driver.
>   - Added I2SOUT0/I2SOUT1 MCLK configuration and enabled the clocks.
>   - Added dpcm_merged_format flag to the dai-link to ensure codec
>     format constraints are applied.
>   - Added support for ES8326 codec in the machine driver.
>   - Updated the dt-bindings description based on reviewer comments.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/10] ASoC: mediatek: mt8189: add common header
        commit: 81f8f29a48defd572ec34d2b9c84374fd05158cc
[02/10] ASoC: mediatek: mt8189: support audio clock control
        commit: dc637ffeed6c32c951520774897601ebd9ffc3d5
[03/10] ASoC: mediatek: mt8189: support ADDA in platform driver
        commit: e3acef6ef89ffbd6c80950d5fa0d024a8d11c1c4
[04/10] ASoC: mediatek: mt8189: support I2S in platform driver
        commit: 34e437097247f92fba6fac3d6e40e33af5f32e3d
[05/10] ASoC: mediatek: mt8189: support TDM in platform driver
        commit: 9f202872ba04d71c96908c56abcc6e3f4a629a40
[06/10] ASoC: mediatek: mt8189: support PCM in platform driver
        commit: 402ff043395fd9444810c723056fe741c77dbc21
[07/10] ASoC: dt-bindings: mediatek,mt8189-afe-pcm: add audio afe document
        commit: 22e9bd51e518e8fcad269c0c1f4bd84467db093e
[08/10] ASoC: mediatek: mt8189: add platform driver
        commit: 7eb1535855983f67b95c2ba777d686cc17188285
[09/10] ASoC: dt-bindings: mediatek,mt8189-nau8825: add mt8189-nau8825 document
        commit: 4980df101676f598ad515725a94424d244a5c5a3
[10/10] ASoC: mediatek: mt8189: add machine driver with nau8825
        commit: d218ea171430e49412804efb794942dd121a8032

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

