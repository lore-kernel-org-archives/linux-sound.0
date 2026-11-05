Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793894009;
	b=wAZuIEn19c6AlSNE9Je126BLcMeSO/OxsCDHEljN/6YqPP12BIKtLW8NkaVaHxJ+YUBw
	 Za5bDnFArGqQ2igVU2w6eir/GIMS0h0fMiTngK5BEC0uKjPeUKfFLWevHxwBrpLeYTfsA
	 5380hMxqtU6T/ESozSEOkqWl6vQAi1RXJ/jleEM20ebn6/Yopi7nPCcOqoYnxQWRLxQ90
	 wIqT/+jwIJJIgw2/KjvmYKOyQT2ThjVgjqE0BMOHmjOUhuD1aYawWdQGPs9MrQ03bfGTb
	 szGF+ZKeP0WpehH6UkM5O6aRZvbiNY3c05s7tTvb18XTMBLZPePRokT5FKHCHLQV5HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793894009;
	h=Received:DKIM-Signature:Message-ID:From:To:Cc:Subject:Date;
	bh=ZoXeME1VoJH8MPp5+b02OOL2nkMX1GuPgK/D2jxmQn8=;
	b=IbHSkJgo0+f0ifkzDWpa9bY/cEtyZFX6LoY5WxBbZZNEUPjeqpewQievFSxL89hblbhG
	 fvYV6OamgCUtHcvYzb7uNmKTCWzhzQQzNZHdXn93dRw8B2bxsbpOtrVJnG4vBccrvVIgC
	 FZXysZONK7BNp+z/RmiSixoRRa3arVoflHNY570vZUL4CNWClMXhVQJ2ncd1hBvrQntkY
	 nmznK8nW/cIZ+s8+8W8brauc+0prtLb+DwI+Xd9VDkjooRXe62jdipvDuGJo/4FovFVHd
	 UFdsKbDKvdJSq7VmRK/EnEabbPPB9X3QpXe51EL+dZv/y+54eCJt01KvWIfYwpN8euQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jZ2hw4BH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id E8365606A331
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 15:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jZ2hw4BH
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 022391F000C1;
	Thu,  5 Nov 2026 15:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793894008;
	bh=ZoXeME1VoJH8MPp5+b02OOL2nkMX1GuPgK/D2jxmQn8=;
	h=From:To:Cc:Subject:Date;
	b=jZ2hw4BHuu4W566IV++MEfapfw08YJLcgtHHct5XGi70Z0YK2v9MSww/V7TQX/Oig
	 m6QGXFvpEW6Tb87JBxl+vBbTN1J5mSKl+U/PAcADKJ/HKgxXTh8T0PNHrz9JssLO1W
	 z0bORlln0bvJA9yRZRt1hi3/VUhGTITkgTXdacEWrI4Psq1xGBacGZz2gtBYf2MPOO
	 S/yZ0vcLd0AfVikW5xyT6UcJpPhFHods0cbafnOizI9E3tOSH6xeyyNn6w7PNCbQMp
	 emSE5eO9gWW9cmRsTyZTimwx4Z73Xj9fG60M+MsRUznE6yyumFG6Va595ooxiOxqLh
	 QaFKGLPOzmYIQ==
Message-ID: <e5aded615cb3e714bfe90050876a9f98@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v7.4-rc1
Date: Thu, 05 Nov 2026 15:52:47 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.4-rc1

for you to fetch changes up to cf09d02dc0c49593fdd9e0ec2f17251cba39a94e:

  ASoC: amd: yc: drop duplicated DMI quirk entries (2026-11-05 00:25:11 +0000)

----------------------------------------------------------------
ASoC: Fixes for v7.4

More fixes that have come in since -rc1, a lot of this is quirks but
there's some bug fixes as well.  The bug fixes should mostly be those
that seem to be affecting actual users rather than just being pure
static analysis work.  I also took some fixes for missing Kconfig
dependencies which won't have any runtime impact.

----------------------------------------------------------------
Baojun Xu (1):
      ASoC: amd: acp: Add support for more projects on ACP7.0

Gianluca Balboni (1):
      ASoC: amd: yc: Add DMI quirk for HP OmniBook 3 Laptop 16-by0xxx

James Calligeros (2):
      ASoC: tas2770: Configure transmit clock edge when setting DAI format
      ASoC: tas2770: Fix error detection in tas2770_set_dai_tdm_idle

Jerome Brunet (1):
      ASoC: meson: axg-fifo: request the irq with the clock enabled

Jude Gyimah (5):
      ASoC: rockchip_i2s: select REGMAP_MMIO
      ASoC: rockchip_i2s_tdm: select REGMAP_MMIO
      ASoC: rockchip_pdm: select REGMAP_MMIO
      ASoC: rockchip_sai: select REGMAP_MMIO
      ASoC: rockchip_spdif: select REGMAP_MMIO

Lee Jones (1):
      ASoC: SOF: Intel: hda-sdw-bpt: Stop active DMA before closing BPT streams

Mark Brown (1):
      ASoC: rockchip: fix missing REGMAP_MMIO dependencies

Mohit Sharma (1):
      ASoC: qcom: q6apm: Guard callbacks until probe data is ready

Qianghua Wang (2):
      ASoC: Intel: soc-acpi: use dummy topology for SN624x
      ASoC: codecs: sn624x-sdca: limit DMIC capture to 2 channels

Richard Fitzgerald (2):
      firmware: cs_dsp: Fix memory leak on cs_dsp_power_up() error path
      ASoC: wm_adsp: Prevent negative string length in wm_adsp_control_add()

Rodnei Cilto (1):
      ASoC: amd: yc: Add DMI quirk for Lenovo V15 AMN G6

Stefano Radaelli (1):
      ASoC: wm8904: Enable FLL when switching an active SYSCLK to FLL

Tang Bin (1):
      ASoC: codecs: lpass-rx-macro: fix PM ref leak in swclk_gate_enable

Wei Lixiang (1):
      ASoC: amd: yc: drop duplicated DMI quirk entries

Zhang Yi (1):
      ASoC: codecs: ES8389: Fix the issue of hpf_freq keep increasing

 drivers/firmware/cirrus/cs_dsp.c                  |  6 ++++
 sound/soc/amd/acp-config.c                        | 35 +++++++++++++++++++++++
 sound/soc/amd/yc/acp6x-mach.c                     | 35 ++++++++++++++---------
 sound/soc/codecs/es8389.c                         | 17 +++++------
 sound/soc/codecs/lpass-rx-macro.c                 |  2 +-
 sound/soc/codecs/sn624x-sdca-sdw.c                |  2 +-
 sound/soc/codecs/tas2770.c                        | 23 ++++++++++-----
 sound/soc/codecs/tas2770.h                        |  4 ++-
 sound/soc/codecs/wm8904.c                         | 14 +++++++++
 sound/soc/codecs/wm_adsp.c                        | 10 +++++++
 sound/soc/intel/common/soc-acpi-intel-arl-match.c |  4 +--
 sound/soc/intel/common/soc-acpi-intel-lnl-match.c |  4 +--
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c |  4 +--
 sound/soc/intel/common/soc-acpi-intel-ptl-match.c |  6 ++--
 sound/soc/meson/axg-fifo.c                        | 28 +++++++++---------
 sound/soc/qcom/qdsp6/q6apm.c                      |  6 ++--
 sound/soc/qcom/qdsp6/q6prm.c                      |  3 ++
 sound/soc/rockchip/Kconfig                        |  5 ++++
 sound/soc/sof/intel/hda-sdw-bpt.c                 |  6 ++++
 19 files changed, 155 insertions(+), 59 deletions(-)
