Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024131F936
	for <linux-sound@vger.kernel.org>; Thu, 21 May 2026 23:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779405741; cv=none; b=hfGpfy0QjhshuR4Fmot301lK/8go1Jz9FiJ7G9RQPIgq6tk1sI1g0Zo93HLFTcQdJiOV7bE4tCwf52dyX+MTUVci0bmoIzYKRENmQCx2LSgE0y3F/rW0KwkHS+xDTWWcZKnvEN8ShP+I69wCLLuUcxTfndPbnxufxO8WbogGp/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779405741; c=relaxed/simple;
	bh=YqwSO/MQDWyaoQkaHdID6NQLU0sTUDpnPtqk3XxXZfc=;
	h=Message-ID:From:To:Cc:Subject:Date; b=q0EfR0lB0REc7SfiJmIsS/7nGoY6ytP+Lsyft6o1+kCND8XjrHDjAQq1igIWIKYX+5ITl1cCXrP/9ot1iN7l+Qp45DoLHScZA2pCBb6hBXHTfCSaNJLUGlERdfoDB0jCLYF4Zmq2JHmcxLRa19DCqCVNSMaxJRDlWAo778kS1QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bk4dCSb8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bk4dCSb8"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 3A5531F000E9;
	Thu, 21 May 2026 23:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779405739;
	bh=v3hcNsL54Fo5jmpIUL+/cFjwHOgQS2YcPjVL3GyRvXI=;
	h=From:To:Cc:Subject:Date;
	b=bk4dCSb8l0r3/9UX7qeFo7+XtbotiG0CwWCnk0eadOmcm1wlJfCtZrtwMwjrhQzGY
	 49u43ni3wYOtDSjAzK/DbtmLJTRhB2EGne5dRGZ+rBOtARHUZfCB2u/6eAN6kt6OIv
	 w3ZfihVl6qxdhl7OVo43N5gvX0+dbb3WF3NjoR0hQCZvwzcsnrjhCaX4Sbui1901lF
	 tRSGXRoRu9QM/+nDa7V2fW9IESMaysP4OfR5Zsx318lCQlEi5eZKA3If7kWi0iGsfV
	 ntweIGoIOzVx2vdMWHJc2fQGFg/buRlyuQD69xabRilctcdL2irzQ0MNmjnR60RzC8
	 OKVOm/qO2dXQw==
Message-ID: <330b62a00eb5358e06742f419308fa7e@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v7.1-rc4
Date: Fri, 22 May 2026 00:22:11 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit 5200f5f493f79f14bbdc349e402a40dfb32f23c8:

  Linux 7.1-rc4 (2026-05-17 13:59:58 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.1-rc4

for you to fetch changes up to 09e8f9a9aa19aa8c1b0cc7a0ebc68f6ecf86a660:

  ASoC: codecs: pcm512x: fix null-ptr dereference in pcm512x_overclock_xxx_put() (2026-05-21 19:28:24 +0100)

----------------------------------------------------------------
ASoC: Fixes for v7.1

A bigger batch of fixes than usual due to -next not happeing last week,
this is mostly stuff for laptops - a lot of quirks and small fixes,
mainly for x86 and SoundWire.  Nothing too big or exciting individually,
just two week's worth.

----------------------------------------------------------------
Alexander A. Klimov (1):
      ASoC: codecs: fs210x: fix possible buffer overflow

Andy Shevchenko (1):
      ASoC: cs35l56: Drop malformed default N from Kconfig

Balamurugan C (1):
      ASoC: Intel: soc-acpi: Add entry for sof_es8336 in NVL match table.

Charles Keepax (2):
      ASoC: soc-acpi-intel-ptl-match: Make Chrome matches conditional
      ASoC: Intel: soc-acpi-intel-ptl-match: Remove unnecessary cs42l43 match

Cássio Gabriel (2):
      ASoC: sdw_utils: Check speaker component string allocation
      ASoC: amd: acp-sdw-legacy: check CPU DAI name before logging

Gary C Wang (1):
      ASoC: soc-acpi-intel-arl-match: add rt712_l0_rt1320_l3 support

Ingyu Jang (1):
      ASoC: ti: omap-dmic: Fix IS_ERR() vs NULL check bug in omap_dmic_select_fclk()

Jairaj Arava (1):
      ASoC: Intel: sof_sdw: Add support for nvlrvp in NVL platform

Jang Pyohwan (1):
      ASoC: Intel: soc-acpi: add LG Gram 16Z90U RT713 + single RT1320 quirk

Jasper Smet (1):
      ASoC: amd: acp: Add DMI quirk for ASUS Zenbook S16 UM5606GA

Jeongjun Park (1):
      ASoC: codecs: pcm512x: fix null-ptr dereference in pcm512x_overclock_xxx_put()

Krishnamoorthi M (1):
      spi: amd: Set correct bus number in ACPI probe path

Mac Chiang (3):
      ASoC: Intel: soc-acpi-intel-arl-match: Reorder ACPI machine tables
      ASoC: sdw_utils: Add quirk to ignore RT712 CODEC_MIC
      ASoC: sdw_utils: Add quirk to ignore RT721 CODEC_MIC

Mario Limonciello (1):
      ASoC: SOF: amd: Fix error code handling in psp_send_cmd()

Mark Brown (3):
      ASoC: soc-acpi-intel-arl-match: add rt712_l0_rt1320_l3 support
      ASoC: sdw_utils: make RT712/RT721 CODEC_MIC be optional
      ASoC: cs-amp-lib: Some bug and typo fixes

Peter Ujfalusi (2):
      MAINTAINERS: ASoC/ti: Remove myself and add Sen Wang as maintainer
      MAINTAINERS: ASoC: Intel/SOF: Remove Ranjani Sridharan as maintainer

Richard Fitzgerald (5):
      ASoC: cs35l56: Check for successful runtime-resume in cs35l56_dsp_work()
      ASoC: cs35l56: Fix flushing of IRQ work in cs35l56_sdw_remove()
      ASoC: cs-amp-lib: Fix wrong sizeof() in _cs_amp_set_efi_calibration_data()
      ASoC: cs-amp-lib: Fix missing dput() after debugfs_lookup()
      ASoC: cs-amp-lib: Fix typo in error message: write -> read

Rob Herring (Arm) (1):
      ASoC; dt-bindings: mediatek,mt8173-rt5650-rt5514: Fix mediatek,audio-codec constraints

Robertus Diawan Chris (1):
      ASoC: soc-utils: Add missing va_end in snd_soc_ret()

Shengjiu Wang (1):
      ASoC: fsl_sai: Eliminate possible interrupt storm during probe

Simon Trimmer (1):
      ASoC: cs35l56: Log SoundWire status updates only on changes

Srinivas Kandagatla (1):
      ASoC: qcom: q6apm-dai: Allocate an extra page for PCM buffers

 .../sound/mediatek,mt8173-rt5650-rt5514.yaml       |   2 +
 MAINTAINERS                                        |  11 +-
 drivers/spi/spi-amd.c                              |   2 +-
 sound/soc/amd/acp-config.c                         |   7 ++
 sound/soc/amd/acp/acp-sdw-legacy-mach.c            |   2 +-
 sound/soc/codecs/Kconfig                           |   3 -
 sound/soc/codecs/cs-amp-lib.c                      |  17 ++-
 sound/soc/codecs/cs35l56-sdw.c                     |   8 +-
 sound/soc/codecs/cs35l56.c                         |  13 +-
 sound/soc/codecs/fs210x.c                          |   2 +-
 sound/soc/codecs/pcm512x.c                         |   6 +-
 sound/soc/fsl/fsl_sai.c                            |  43 +++++--
 sound/soc/intel/boards/sof_sdw.c                   |   8 ++
 sound/soc/intel/common/soc-acpi-intel-arl-match.c  |  71 ++++++++---
 sound/soc/intel/common/soc-acpi-intel-nvl-match.c  |  13 ++
 sound/soc/intel/common/soc-acpi-intel-ptl-match.c  | 134 +++------------------
 .../soc/intel/common/soc-acpi-intel-sdca-quirks.c  |  16 +++
 .../soc/intel/common/soc-acpi-intel-sdca-quirks.h  |   1 +
 sound/soc/qcom/qdsp6/q6apm-dai.c                   |   7 +-
 sound/soc/sdw_utils/soc_sdw_utils.c                |  14 ++-
 sound/soc/soc-utils.c                              |   1 +
 sound/soc/sof/amd/acp.c                            |   2 +-
 sound/soc/ti/omap-dmic.c                           |   2 +-
 23 files changed, 209 insertions(+), 176 deletions(-)
