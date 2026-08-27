Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA71A472521
	for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 13:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787836999; cv=none; b=cQPv2CIQySGURZSDh7Degx+hIhI+DTKStY7++8wuRVRtznoocMNygE/jedrLdhUJMEIy2uRxn3ithS1T1IbRHwVqSAFJU97waOXZZeh8B2vk/LRdKmJTWnpUblrjcROrRmLcQPejB+t2SLQa+HqagukDv7wNWRdRC+NN0rVj8SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787836999; c=relaxed/simple;
	bh=I6FlKsaIiTQxYA5IAPr48r8AXyk9ZIVzBV8TSggdKro=;
	h=Message-ID:From:To:Cc:Subject:Date; b=SsqaXFfhDtchr/eemXQPZdXJPHfk9svXHJ+K22IgKGyt+wsODdvTlNNhWR8YIY8IVR4uLR1irYOYrZ31xQ0OQ0KWi6PDEXDn1qhrMOP6It5LVCsNKc7sOyDtxlSwxHX9jATs16aLP1O7DPnY2YTh09mtmkhI204OSrSRlZfq2hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MpNOmiBz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MpNOmiBz"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id EB5C91F000E9;
	Thu, 27 Aug 2026 13:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787836990;
	bh=j42Ftv0SC1OUWcgy6ui//FzXdBesogup0aH3DH/2bCY=;
	h=From:To:Cc:Subject:Date;
	b=MpNOmiBzxqc84TwO+mbGZDhk2Lh/xag3yHA6eWyv1aBRfb5nSRMXldEQYkM9TN8Nb
	 XIixHlk87VfQ+le635mHaQzUMYuoYQyqgnJ3akQy280rpMSk/AGIU+9KYm9KwIRJ/5
	 2kA8nIW+9QyNS9oo0yubCBRYc1MWHZOfTnq9A1YJRM3x3dDPJQ9YoehqCBHfQ/K7CE
	 0Zp86u4TGFxseb6i/088O7O0eU6Yv1+SUByrg6mqNmaD6Cja6HyxFoMsI9l0P5BNj9
	 ehOzCRyN/YaxD942bFKV5aGXuMNZiVslxu8zl8wpqMEYahSJMrW3c+NId0uCfZHgzH
	 uTIAysrSiM/Wg==
Message-ID: <b334f5b2d0e7c0c73107f54bfee509b1@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v7.3-merge-window
Date: Thu, 27 Aug 2026 14:22:59 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit 0c7aeb0f5eceb95b5887bd8e83fef865e5a49a13:

  ASoC: tas2783-sdw: do not treat read-only Controls as writable (2026-08-14 16:20:47 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.3-merge-window

for you to fetch changes up to 15596a87fcc6fa07a162858e5fd00ba31752096b:

  ASoC: amd: acp-config: change quirks to cover all ASUS FA401EA variants (2026-08-27 00:15:37 +0100)

----------------------------------------------------------------
ASoC: Fixes for v7.3

A fairly big batch of fixes that came in during the merge window.
There's a lot of quirks for x86 systems and a bunch of driver specific
fixes, the most critical being the fixes for Tegra's register
definitions.  It turned out that they had been relying on the regmap
default handling bugs that were fixed in v7.2 and so audio was fairly
badly broken, unfortunately the issue wasn't noticed in time for
release.

----------------------------------------------------------------
Andrey Golovko (2):
      ASoC: sdw_utils: prepare the stream again when resuming
      ASoC: tas2783-sdw: power the Function up before preparing the port

Binbin Zhou (1):
      ASoC: loongson: Fix naming of machine event and DAPM widgets

Christopher Tolang (1):
      ASoC: amd: yc: Add DMI entry for MSI Thin A15 B7UC

HyeongJun An (1):
      ASoC: dapm: Fix off-by-one check on the second enum channel

Jack Yu (2):
      ASoC: sdw_utils: fix double put_device() on aggregated amps
      ASoC: rt712-sdca: Pull high JD2 to prevent from entering TV mode

Jon Hunter (4):
      ASoC: tegra: Fix the I2S enable default value
      ASoC: tegra: Fix the MIXER enable default value
      ASoC: tegra: Sort ADMAIF register defaults
      ASoC: tegra: Sort MBDRC register defaults

Julian Braha (1):
      ASoC: fix unmet dependencies on PPC_BESTCOMM and SND_SOC_AC97_BUS

Kuninori Morimoto (1):
      ASoC: codec: max98926: fixup invert setup mask

Mark Brown (3):
      ASoC: qcom: Fix AudioReach TDM review findings
      ASoC: tas2783: prepare the port again on the resume path
      ASoC: tegra: Fixes for issues exposed in Linux v7.2

Mehmet Aysel (2):
      ASoC: amd: acp-config: Add HVY-WXX9/M1060 DMI quirk
      ASoC: amd: acp3x-es83xx: Add HVY-WXX9/M1060 DMI quirk

Niranjan H Y (3):
      ASoC: sdw_utils: Set component_name for tac5xx2 codec family
      ASoC: tac5xx2-sdw: Rename gain and volume macros
      ASoC: tac5xx2-sdw: update default regmap registers

Prasad Kumpatla (4):
      ASoC: dt-bindings: qcom,q6dsp-lpass-ports: Rename QAIF clock IDs
      ASoC: qcom: qdsp6: Zero-initialize AudioReach module config
      ASoC: qcom: common: Distinguish missing and invalid TDM slot configuration
      ASoC: qcom: sc8280xp: Fix TDM hw_params error handling

Sehat Mahde (1):
      ASoC: amd: acp-config: force SoundWire probe on HP OmniBook X Flip 16

Shengyu Qu (1):
      ASoC: amd: acp-config: change quirks to cover all ASUS FA401EA variants

Shuming Fan (1):
      ASoC: rt766: add RT766/RT767 VA1 device IDs

Zhang Heng (1):
      ASoC: amd: yc: Add DMI entry for Alienware m18 R1 AMD

bui duc phuc (1):
      ASoC: soc-generic-dmaengine: Fix DMA channel request warning

 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h |  56 +++---
 sound/soc/amd/acp-config.c                         |  23 ++-
 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c      |   8 +
 sound/soc/amd/yc/acp6x-mach.c                      |  14 ++
 sound/soc/codecs/max98926.c                        |   2 +-
 sound/soc/codecs/rt712-sdca.c                      |   1 +
 sound/soc/codecs/rt712-sdca.h                      |   1 +
 sound/soc/codecs/rt766-sdca-sdw.c                  |   2 +
 sound/soc/codecs/tac5xx2-sdw.c                     | 118 ++++++------
 sound/soc/codecs/tac5xx2.h                         |   5 +-
 sound/soc/codecs/tas2783-sdw.c                     |  20 ++
 sound/soc/fsl/Kconfig                              |   4 +-
 sound/soc/fsl/efika-audio-fabric.c                 |   2 -
 sound/soc/fsl/pcm030-audio-fabric.c                |   2 -
 sound/soc/loongson/loongson_card.c                 |  14 +-
 sound/soc/qcom/common.c                            |   6 +-
 sound/soc/qcom/qdsp6/q6apm-dai.c                   |   4 +-
 sound/soc/qcom/qdsp6/q6prm-clocks.c                |  56 +++---
 sound/soc/qcom/qdsp6/q6prm.h                       |  56 +++---
 sound/soc/qcom/sc8280xp.c                          |  21 ++-
 sound/soc/sdw_utils/soc_sdw_rt_amp.c               |   2 +
 sound/soc/sdw_utils/soc_sdw_utils.c                |  28 ++-
 sound/soc/soc-dapm.c                               |   2 +-
 sound/soc/soc-generic-dmaengine-pcm.c              |  20 +-
 sound/soc/tegra/tegra210_admaif.c                  | 208 ++++++++++++++-------
 sound/soc/tegra/tegra210_i2s.c                     |  20 +-
 sound/soc/tegra/tegra210_i2s.h                     |   1 +
 sound/soc/tegra/tegra210_mbdrc.c                   |  42 ++---
 sound/soc/tegra/tegra210_mixer.c                   |  10 +-
 29 files changed, 461 insertions(+), 287 deletions(-)
