Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795187750;
	b=zsrtNNB/7BGLdsV8ucCPTJgWd87jfqYDAWc5xyLGxMciE1yEXC3KXnTI4EFkdsZFRVxu
	 wbdCdsLXkWnfCYMYcdxuas147WvIQqd1fxC1HnQMZUuLg6gdtFchPQtbfbdrfDk0DLyNB
	 axpD+rjxujwQ+PIy+aEcxpSOhXxrsUi3AHOlTuDX7DNWhA470JqfndPUHcGQhsn9TrT/Z
	 NuMJXDw1EH1sT1Wi8gdfIO6vuEkSVhkY85A3lGOWHSsKve0ccdCjE9zeaX5EmAzUSG16U
	 Iwu+u26ymWDiNUTYEkBdr9Yxrt45yRYkT2Uk9PXMIWlVpZW1/XwmILLTAHAjo9bxSlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795187750;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ihZfSgxIvjEMkXvmyda1NP7Q3LgCpF1cCr/6VrpGnao=;
	b=l5T9g6sNJg7B+4hxBe4LWnMHSq9itIhSboPTRHahvS51OPiW+NOyAeiUP7AQlspDer8Y
	 5UdFHI89m8XotebISQ/GMlYAPGd6+Q9igviBspsWGfYvpyzVQMuNF39Du+hLcHMP/g4BS
	 21RmlikRQmMymmLugdMaoL1dlCFU2VsEgpxlvr/t00W+Al33RArgENEZ/jK6+rv5aHqWs
	 FYf8mTC6aM42/vLnEj9NJzkcPM2zRBia/rt5zEsIHISCqwukPVBOT5d4TTw3ObBaIJ1Q0
	 tsymS3rMaT35VHmtAtVJM5zjM2QMBt6EmUmC/tOMhtbkxiJJAC2BMFAkNmVn6hyOo7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V2SdLCLl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE791606A33B;
	Fri, 20 Nov 2026 15:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V2SdLCLl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61B771F000CA;
	Fri, 20 Nov 2026 15:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795187750;
	bh=ihZfSgxIvjEMkXvmyda1NP7Q3LgCpF1cCr/6VrpGnao=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=V2SdLCLl+PH46TsluxaAncAdCSR9/8rtkneR5aa2+XVpBg2n7i5eN61n5cLrPCib7
	 Y1zs7LkeLUtQHrxcc20V7hPvUP9By06ovOk3iQTAmN7J3oH6MYzGl0HY05tTzkI+B9
	 u/9dKgxi4O6o0Yh380pbhyF1vPo1Zrf5PGADjiauViB+YF/jzuMERHVtnTX/bql5Gi
	 +1nUjCdWbZN56Z9I6mR55wZQkOhJnTdRQAJiICTpxYaLwdTX7LO1u+nmJjGRI2+jMd
	 Ze3CRwcUqYqb0MS134tJx0N4UrdoQh6Eya2Ye/HI88d1y8sofiW9rEoG95Q2alL72z
	 BzPxn460AJnUw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Myeonghun Pak <mhun512@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ijae Kim <ae878000@gmail.com>, Cyril Chao <Cyril.Chao@mediatek.com>, 
 Darren Ye <darren.ye@mediatek.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>, 
 Trevor Wu <trevor.wu@mediatek.com>
In-Reply-To: <20261112011708-afe-v2-0-mhun512@gmail.com>
References: <20261112011708-afe-v2-0-mhun512@gmail.com>
Subject: Re: [PATCH v2 0/5] ASoC: mediatek: fix AFE IRQ registration and
 removal ordering
Message-Id: <179517904754.6016.16269615530838300307.b4-ty@b4>
Date: Fri, 20 Nov 2026 12:50:47 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2005; i=broonie@kernel.org;
 h=from:subject:message-id; bh=dSDkHmfmCeNxORnUsZPpEUBtYzLsL2QTxwlCUj1j5No=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIZUhRfLDdqKWWb3LEh1FVrp2l39H3BnQd6bWoPShsfn
 Lls+9Z1HaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZhIsScjwx+bYs4LHKEzxes+
 S92Pay44tVhO67TrulBDmRstCW8VnjL8r+p8UPu9RtY4RXbrMr6NlamTQhtecNl6Z6y6wp0qGfa
 HAQA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 12 Nov 2026 01:17:44 -0500, Myeonghun Pak wrote:
> ASoC: mediatek: fix AFE IRQ registration and removal ordering
> 
> This series fixes IRQ lifetime ordering in the MT8186, MT8188, MT8189,
> MT8195 and MT8196 AFE drivers.
> 
> Request each IRQ after regmap initialization so it is freed before
> the regmap. Where remove() shuts down the AFE, free the IRQ first.
> Also balance MT8186's IRQ wake setting.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/5] ASoC: mediatek: mt8186: Keep the AFE IRQ within its resource lifetime
      https://git.kernel.org/broonie/sound/c/420be55fe0e2
[2/5] ASoC: mediatek: mt8189: Keep the AFE IRQ within its resource lifetime
      https://git.kernel.org/broonie/sound/c/4f4067c2d110
[3/5] ASoC: mediatek: mt8196: Keep the AFE IRQ within its resource lifetime
      https://git.kernel.org/broonie/sound/c/eb9a5be4c2c1
[4/5] ASoC: mediatek: mt8195: Keep the AFE IRQ within its resource lifetime
      https://git.kernel.org/broonie/sound/c/eac2ac34a18d
[5/5] ASoC: mediatek: mt8188: Keep the AFE IRQ within its resource lifetime
      https://git.kernel.org/broonie/sound/c/94d0e251e7d7

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

