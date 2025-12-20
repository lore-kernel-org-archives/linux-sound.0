Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3E123EA99
	for <linux-sound@vger.kernel.org>; Sat, 20 Dec 2025 22:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766271481; cv=none; b=g8KYhg+T9aesMjOYamOXkCCDcVbm32IdQrQ6MsiLcy37RKevM4nM+bjg5V7KPvvYFOOWwSffzM0eu+E9OuK4MNF87LpfcxLQ3tXqLOYHsyUdxe3JuNygUF+FKZghx9EBUpXzUZxFjUl39v7IryPPri7n1U+B6/2Lhh/FefsflPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766271481; c=relaxed/simple;
	bh=j1GOTP4uW+ablI4hgNqOr9maHcvcticbqrr0oiC53Lk=;
	h=From:To:Cc:Subject:Date:Message-Id; b=SfHtRSVEDGJTNDi1gZBEPaSahfxoCO737HYgemTV0vx7sh/HddP2h9gdeCwyQYAoAVOVnJiXm7PFyHrR5szQ4QEBtsWSEkw3qyPb01cst72kL1fnAsuCQSPuPrWOHNLGocWP3HLEXOa7WP9+qh7kcKog4E+ygq7q0kaSzo2qZmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Do6HH5c0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Do6HH5c0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D761C4CEF5;
	Sat, 20 Dec 2025 22:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766271480;
	bh=j1GOTP4uW+ablI4hgNqOr9maHcvcticbqrr0oiC53Lk=;
	h=From:To:Cc:Subject:Date:From;
	b=Do6HH5c0QWYitZLtSX3srYlmB3d0h6ClRkgb6CjTRmAg0jbJmARjOeGcAqN7OtqLa
	 OJQV0IQhBynNdV9oF1EtskzIuC/umvXRfbO/btSk59AZHGaI/GjBm/xzoM1lOsQrlC
	 FMOvC6W0u6pedDn3uS82sk08ulxhViYc4RBsd9Q04CS5Rc1+HyllqEhH0hXbPGkmEq
	 GCmJdA1Qk+s5tVSpwo05EyDOsmUOIVSzLSQrVAU8xI9zClS4374zqv8aB60WDNhfx+
	 ny3uKrN9eWsoMSgJHyTyzXhSr4uCobki+XjsKoKSLxBx9QKa46NFkkdDWXGppPA8hn
	 YAxK1xWXLSReQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id D29B21AC56B2; Sun, 21 Dec 2025 07:57:55 +0900 (JST)
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.19-rc1
Date: Sat, 20 Dec 2025 22:57:55 +0000
Message-Id: <20251220225755.D29B21AC56B2@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.19-rc1

for you to fetch changes up to 56d953a8d0da5e53c2594edde23465ec49385b1c:

  ASoC: Intel: mtl-match: Add 6-amp matches for CS35L56 (2025-12-19 13:25:16 +0000)

----------------------------------------------------------------
ASoC: Fixes for v6.19

We've been quite busy with fixes since the merge window, though not in
any particularly exciting ways - the standout thing is the fix for _SX
controls which were broken by a change to how we do clamping, otherwise
it's all fairly run of the mill fixes and quirks.

----------------------------------------------------------------
Alexander Stein (4):
      ASoC: fsl_easrc: fix duplicate debugfs directory error
      ASoC: fsl_asrc_dma: fix duplicate debugfs directory error
      ASoC: fsl_sai: Add missing registers to cache default
      ASoC: fsl_xcvr: provide regmap names

Andrew Elantsev (1):
      ASoC: amd: yc: Add quirk for Honor MagicBook X16 2025

Bard Liao (2):
      ASoC: sdw_utils: subtract the endpoint that is not present
      ASoC: SOF: ipc4-topology: set playback channel mask

Chancel Liu (2):
      ASoC: fsl_sai: Constrain sample rates from audio PLLs only in master mode
      ASoC: fsl-asoc-card: Use of_property_present() for non-boolean properties

Mark Brown (4):
      ASoC: Intel: common / SOF: Use function topologies for
      ASoC: SOF: ipc4-topology: fixes for 'exotic' format
      ASoC: fsl_easrc: Fix duplicate debufs entries
      ASoC: Intel: mtl-match: Add 6-amp matches for CS35L56

Peter Ujfalusi (6):
      ASoC: SOF: ipc4-topology: Prefer 32-bit DMIC blobs for 8-bit formats as well
      ASoC: SOF: ipc4-topology: Convert FLOAT to S32 during blob selection
      ASoC: SOF: topology: Add context when sink or source widget is missing
      ASoC: SOF: Intel: pci-mtl: Change the topology path to intel/sof-ipc4-tplg
      ASoC: soc-acpi / SOF: Add best_effort flag to get_function_tplg_files op
      ASoC: Intel: soc-acpi-intel-nvl-match: Drop rt722 l3 from the match table

Robert Oscilowski (1):
      ASoC: qcom: sdm845: set quaternary MI2S codec DAI to I2S format

Shengjiu Wang (1):
      ASoC: ak4458: remove the reset operation in probe and remove

Shuming Fan (1):
      ASoC: rt1320: update VC blind write settings

Stefan Binding (3):
      ASoC: Intel: soc-acpi-intel-mtl-match: Add 6 amp CS35L56 with feedback
      ASoC: Intel: soc-acpi-intel-mtl-match: Add 6 amp CS35L63 with feedback
      ASoC: ops: fix snd_soc_get_volsw for sx controls

sheetal (1):
      ASoC: tegra: Fix uninitialized flat cache warning in tegra210_ahub

 include/sound/soc-acpi.h                           |   5 +-
 sound/soc/amd/yc/acp6x-mach.c                      |   7 ++
 sound/soc/codecs/ak4458.c                          |   4 -
 sound/soc/codecs/rt1320-sdw.c                      |  16 ++--
 sound/soc/fsl/fsl-asoc-card.c                      |   8 +-
 sound/soc/fsl/fsl_asrc_dma.c                       |   3 +
 sound/soc/fsl/fsl_easrc.c                          |   3 +
 sound/soc/fsl/fsl_sai.c                            |  13 ++-
 sound/soc/fsl/fsl_xcvr.c                           |   3 +
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c  | 104 +++++++++++++++++++++
 sound/soc/intel/common/soc-acpi-intel-nvl-match.c  |  49 ----------
 sound/soc/intel/common/sof-function-topology-lib.c |   5 +-
 sound/soc/intel/common/sof-function-topology-lib.h |   2 +-
 sound/soc/qcom/sdm845.c                            |   2 +
 sound/soc/sdw_utils/soc_sdw_utils.c                |   8 +-
 sound/soc/soc-ops.c                                |  32 ++++---
 sound/soc/sof/intel/pci-mtl.c                      |   6 +-
 sound/soc/sof/ipc4-topology.c                      |  49 ++++++----
 sound/soc/sof/topology.c                           |  26 +++++-
 sound/soc/tegra/tegra210_ahub.c                    |   6 +-
 20 files changed, 238 insertions(+), 113 deletions(-)
