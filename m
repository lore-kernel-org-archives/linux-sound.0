Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9E228313D
	for <linux-sound@vger.kernel.org>; Thu, 26 Mar 2026 13:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774531973; cv=none; b=Pyy86q8qQKczdHGq97NLSjVGSZzImoU0JzwadQO60a1jo8NFgTUv2U1xo14esCMhTeDUB2cXY6gm/hUz4zE/Zl7guW65PhxLe2n6G4Mti716AgT7t049zJ1vlA+amORgL3yZ6xfSJbfp/fIlP95z1OPAgVtjdhBV2JKt3+swkoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774531973; c=relaxed/simple;
	bh=K3Pd2wZkhD65L8VyfD4iqOk4NHmtEZ5e2hdzs3gqMyU=;
	h=Message-ID:From:To:Cc:Subject:Date; b=jrthCJW2v8/mFWMf3gHQXLmrHlsm8fo5JklaeGC/nIlVhnng8m6Uk0oC7G6vSjDEqBXU/IG26dhVPX8yONNyc0i8+3bvNjJIs4PulkApUEhgIp4fefGDMEJtHXvLS1/kYSBXggv51HQiD/C2XSxyqR5DJ2jV9pekAmDELBOsBFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=njD/iAdD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="njD/iAdD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01FBBC116C6;
	Thu, 26 Mar 2026 13:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774531973;
	bh=K3Pd2wZkhD65L8VyfD4iqOk4NHmtEZ5e2hdzs3gqMyU=;
	h=From:To:Cc:Subject:Date:From;
	b=njD/iAdDKjHxlIowGSVbwhXpO+anmgu62ZawZyKTj3CSwnXuIpgXu5M7S3Y5i0faR
	 xQi6CkLg6lsXo9rUldpns7xHuRpJDJ/wYvVgPGuyQhVYJ7Guu5c6VrK8hG0Q0/Z2dZ
	 7PYfpx0IsgxksHvGNojKGpplJzGs01eVNFcGYra5DYOdb+mgHTv/CJQnHgo2ZIxDou
	 Xyp2r4zveCBfRnMro7nUiVMROi2cYGcH6EcUpj7bEU0VWLg4Pmb6+skXB0bS3HfDDm
	 fOU3gflUsXcx4CmOuCPFXzfvoeId/uC236Ss5JLVYwfN5lFaGglCuX0HSoDagR4hkm
	 5aepVD1XsDK7A==
Message-ID: <35eee6c4ded9dcae303afc38a82c36a1@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v7.0-rc5
Date: Thu, 26 Mar 2026 13:32:46 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit c369299895a591d96745d6492d4888259b004a9e:

  Linux 7.0-rc5 (2026-03-22 14:42:17 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.0-rc5

for you to fetch changes up to d40a198e2b7821197c5c77b89d0130cc90f400f5:

  ASoC: SOF: ipc4-topology: Allow bytes controls without initial payload (2026-03-26 11:16:03 +0000)

----------------------------------------------------------------
ASoC: Fixes for v7.0

This is two week's worth of fixes and quirks so it's a bit larger than
you might expect, there's nothing too exciting individually and nothing
in core code.

----------------------------------------------------------------
Baojun Xu (1):
      ASoC: tas2781: Add null check for calibration data

Cezary Rojewski (1):
      ASoC: Intel: catpt: Fix the device initialization

Cássio Gabriel (1):
      ASoC: SOF: topology: reject invalid vendor array size in token parser

Guangshuo Li (1):
      ASoC: sma1307: fix double free of devm_kzalloc() memory

Hasun Park (3):
      ASoC: amd: acp: add DMI override for ACP70 flag
      ASoC: amd: acp: add PX13 SoundWire machine link for rt721+tas2783x2
      ASoC: amd: acp: add ASUS HN7306EA quirk for legacy SDW machine

Jihed Chaibi (3):
      ASoC: dt-bindings: stm32: Fix incorrect compatible string in stm32h7-sai match
      ASoC: adau1372: Fix unchecked clk_prepare_enable() return value
      ASoC: adau1372: Fix clock leak on PLL lock failure

Mark Brown (2):
      ASoC: fix usage of playback_only and capture_only
      ASoC: adau1372: Fix error handling in adau1372_set_power()

Peter Ujfalusi (1):
      ASoC: SOF: ipc4-topology: Allow bytes controls without initial payload

Sebastian Reichel (1):
      ASoC: dt-bindings: rockchip: Add compatible for RK3576 SPDIF

Shengjiu Wang (2):
      ASoC: simple-card-utils: Check value of is_playback_only and is_capture_only
      ASoC: fsl: imx-card: initialize playback_only and capture_only

Shuming Fan (2):
      ASoC: SDCA: remove the max count of initialization table
      ASoC: SDCA: fix finding wrong entity

Srinivas Kandagatla (1):
      ASoC: codecs: wcd934x: fix typo in dt parsing

Vee Satayamas (1):
      ASoC: amd: yc: Add DMI quirk for ASUS EXPERTBOOK BM1403CDA

Zhang Heng (1):
      ASoC: amd: yc: Add DMI quirk for Thin A15 B7VF

 .../devicetree/bindings/sound/rockchip-spdif.yaml  |  1 +
 .../devicetree/bindings/sound/st,stm32-sai.yaml    |  2 +-
 include/sound/sdca_function.h                      |  5 --
 sound/soc/amd/acp-config.c                         | 15 +++++-
 sound/soc/amd/acp/acp-sdw-legacy-mach.c            |  8 +++
 sound/soc/amd/acp/amd-acp70-acpi-match.c           | 61 ++++++++++++++++++++++
 sound/soc/amd/yc/acp6x-mach.c                      | 14 +++++
 sound/soc/codecs/adau1372.c                        | 34 ++++++++----
 sound/soc/codecs/sma1307.c                         |  6 ++-
 sound/soc/codecs/tas2781-fmwlib.c                  |  3 ++
 sound/soc/codecs/wcd934x.c                         |  2 +-
 sound/soc/fsl/imx-card.c                           |  2 +
 sound/soc/generic/simple-card-utils.c              |  4 +-
 sound/soc/intel/catpt/device.c                     | 10 +++-
 sound/soc/intel/catpt/dsp.c                        |  3 --
 sound/soc/sdca/sdca_functions.c                    | 14 +++--
 sound/soc/sof/ipc4-topology.c                      |  2 +-
 sound/soc/sof/topology.c                           |  2 +-
 18 files changed, 156 insertions(+), 32 deletions(-)
