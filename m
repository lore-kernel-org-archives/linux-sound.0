Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D07863B9
	for <linux-sound@vger.kernel.org>; Thu, 18 Sep 2025 00:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758156875; cv=none; b=bsPvYELMZZETHDhNHDBvyl6MXQFcODhJ2Q4M+dUQwEhs+A0png++yo+1TlNwf8i7vsvIzVSuulATh/RmjGIV2VtaTDnXD8YEVUrHujLrOTQjVnn9QHx01lne9vhG0os4g8WqHCVEXbU0mYji7l3Xyr3J7nrBz7qQ+OnnJL+Q3u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758156875; c=relaxed/simple;
	bh=OTou4Mm/3uuGdZ5sRisBc/+W2SVZO8tT7hB8idEcGUY=;
	h=Message-ID:From:To:Cc:Subject:Date; b=ZicZoBu7/kM2zD84Or4GDBtZZSyWcVuqot8EJB3WfdItXNeTbuAsLgCSK5c4H5dW1VPeaaHvTeSlTPh5sWrJlsTinTwJaO513B4zLyHgA7xoezN3CA3slqN6JRQuVPd6Fy7lLaW7xpUVfaCMq9p9KrZuNzcSlLfM6gJ7is5IEKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nHK7YiIg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nHK7YiIg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48C85C4CEE7;
	Thu, 18 Sep 2025 00:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758156874;
	bh=OTou4Mm/3uuGdZ5sRisBc/+W2SVZO8tT7hB8idEcGUY=;
	h=From:To:Cc:Subject:Date:From;
	b=nHK7YiIgnaNdW1snB07bgl0PA6DvGtHXpvsINk/LVPKJjh62Avoz/LRSH5c39ofbK
	 xBS4guaE7bwdwIFHGOIhg6fSIrCEauxLDUTSYiY8RK3IH8zjbtMloW87ck5hqihZoA
	 pC9rN6U7iBeB/AcDzPnezSuY3c0X91qLqxHb3iKFZin2mEhHHFsPNeO/cPVa63jmDo
	 ofaztFtSJvPdo18Gtyf/2anaQkKGB0HKNxncVft3H+pGXfdVEASOni/FfF7i855ajd
	 A6/J1ANbOPuU0wdwoNkQrGmS5etpE3VO1mKyhufFbMAZk6sNf6jVz2jTaiOCLmm/ax
	 /nvXTWRajH0rQ==
Message-ID: <05d115d1cda935ba007c2835614cb320@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.17-rc6
Date: Thu, 18 Sep 2025 01:54:27 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit 76eeb9b8de9880ca38696b2fb56ac45ac0a25c6c:

  Linux 6.17-rc5 (2025-09-07 14:22:57 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.17-rc6

for you to fetch changes up to 1dd28fd86c3fa4e395031dd6f2ba920242107010:

  ASoC: rt5682s: Adjust SAR ADC button mode to fix noise issue (2025-09-17 12:38:59 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.17

A pile of fixes that accumilated over the past few -rcs, this is all
driver specifics including a small pile of quirks for new systems.

----------------------------------------------------------------
Amadeusz Sławiński (1):
      ASoC: Intel: catpt: Expose correct bit depth to userspace

Balamurugan C (1):
      ASoC: Intel: PTL: Add entry for HDMI-In capture support to non-I2S codec boards.

Charles Keepax (6):
      ASoC: wm8940: Correct PLL rate rounding
      ASoC: wm8940: Correct typo in control name
      ASoC: wm8974: Correct PLL rate rounding
      ASoC: SDCA: Fix return value in sdca_regmap_mbq_size()
      ASoC: SDCA: Fix return value in detected_mode_handler()
      ASoC: SDCA: Reorder members of hide struct to remove holes

Colin Ian King (1):
      ASoC: SOF: Intel: hda-stream: Fix incorrect variable used in error message

Dan Carpenter (1):
      ASoC: codec: sma1307: Fix memory corruption in sma1307_setting_loaded()

Daniel Baluta (1):
      ASoC: SOF: imx: Fix devm_ioremap_resource check

Jack Yu (1):
      ASoC: rt5682s: Adjust SAR ADC button mode to fix noise issue

Krzysztof Kozlowski (3):
      ASoC: qcom: q6apm-lpass-dais: Fix NULL pointer dereference if source graph failed
      ASoC: codecs: lpass-rx-macro: Fix playback quality distortion
      ASoC: codecs: lpass-wsa-macro: Fix speaker quality distortion

Mac Chiang (1):
      ASoC: Intel: sof_sdw: use PRODUCT_FAMILY for Fatcat series

Maciej Strozek (1):
      ASoC: SDCA: Add quirk for incorrect function types for 3 systems

Mark Brown (3):
      Minor bug fixes for some older Wolfson devices
      More minor SDCA bug fixes
      Fix lpaif_type and DAI configuration for I2S

Mohammad Rafi Shaik (4):
      ASoC: qcom: audioreach: Fix lpaif_type configuration for the I2S interface
      ASoC: qcom: q6apm-lpass-dais: Fix missing set_fmt DAI op for I2S
      ASoC: qcom: sc8280xp: Enable DAI format configuration for MI2S interfaces
      ASoC: qcom: sc8280xp: Fix sound card driver name match data for QCS8275

Shuming Fan (1):
      ASoC: rt712: avoid skipping the blind write

Syed Saba Kareem (1):
      ASoC: amd: amd_sdw: Add quirks for some new Dell laptops

Venkata Prasad Potturu (2):
      ASoC: amd: acp: Adjust pdm gain value
      ASoC: amd: acp: Fix incorrect retrival of acp_chip_info

 include/sound/sdca.h                              |  1 +
 include/sound/sdca_function.h                     | 21 ++++++++++++---------
 sound/soc/amd/acp/acp-i2s.c                       | 11 +++++------
 sound/soc/amd/acp/acp-sdw-legacy-mach.c           | 16 ++++++++++++++++
 sound/soc/amd/acp/amd.h                           |  2 +-
 sound/soc/codecs/lpass-rx-macro.c                 | 22 +++++++++++++++-------
 sound/soc/codecs/lpass-wsa-macro.c                | 22 +++++++++++++++-------
 sound/soc/codecs/rt5682s.c                        | 17 +++++++++--------
 sound/soc/codecs/rt712-sdca.c                     |  6 ++----
 sound/soc/codecs/sma1307.c                        |  7 ++++---
 sound/soc/codecs/wm8940.c                         |  9 +++++++--
 sound/soc/codecs/wm8974.c                         |  8 ++++++--
 sound/soc/intel/boards/sof_sdw.c                  |  2 +-
 sound/soc/intel/boards/sof_ssp_amp.c              |  6 ++++++
 sound/soc/intel/catpt/pcm.c                       | 23 +++++++++++++++++------
 sound/soc/intel/common/soc-acpi-intel-ptl-match.c |  6 ++++++
 sound/soc/qcom/qdsp6/audioreach.c                 |  1 +
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c           |  7 +++++--
 sound/soc/qcom/sc8280xp.c                         |  6 +++++-
 sound/soc/sdca/sdca_device.c                      | 20 ++++++++++++++++++++
 sound/soc/sdca/sdca_functions.c                   | 13 ++++++++-----
 sound/soc/sdca/sdca_interrupts.c                  |  2 +-
 sound/soc/sdca/sdca_regmap.c                      |  2 +-
 sound/soc/sof/imx/imx-common.c                    |  4 ++--
 sound/soc/sof/intel/hda-stream.c                  |  2 +-
 25 files changed, 167 insertions(+), 69 deletions(-)
