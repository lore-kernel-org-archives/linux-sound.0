Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6684746D7
	for <linux-sound@vger.kernel.org>; Thu, 13 Aug 2026 12:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786623409; cv=none; b=rEbGzBfTDPiKvj1Nx69H2TdD0NkHnBKOK1kC3BUalZDISYApa1/zkoEDSsIw0TtEDMLDW/S2ncDIBdoO57RLfGFzyg+iEeQpX47J7uyex7pEKjQ4nHm6w1BeY+FtxWKwa0V64kaaons270UltC6R5rq9aCysvWd9/TCBqSQIMmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786623409; c=relaxed/simple;
	bh=k5zvfZsC+Cij2kUSiqT9eUQe/23ZE1Xn25VyZSDp3+I=;
	h=Message-ID:From:To:Cc:Subject:Date; b=DkTMuyHSerAYwH6+Hc8x8lJbpEv79aEMxU8dAMdcgVAEKzubT8d8RKxCE3/uFhx/MzFF3IQluYC3HAnJE04f5jy6a4AnYQrgC8SXGrXgHzaT8WY9IpiSLkN+kA01sRfHIV2prKcSx7iDsklc8zHdG9mrsfTOyMnkMpHKanOHApA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZPSG0YuH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZPSG0YuH"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id DD2111F000E9;
	Thu, 13 Aug 2026 12:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786623407;
	bh=45kXvKtQQ5XTETNTNQNm84pGKH83GWFBXmxLHufnGKY=;
	h=From:To:Cc:Subject:Date;
	b=ZPSG0YuHCFUsfGp2KvKgoEPIAIRuced3Xf9x0+eq7qzZZDKaiMKEnlVgHhS0JB2lF
	 SQy9DBkqeNF/qzwEQHNJO2n6j1VPKBITq2HoZ+uE72+7xqzAFxirFyvDu0myTgp5yR
	 IvjYlB1jxjfR+4Be+IDl/gwxecV07vJF/o1y//PKJjCFWC9O02n1VjJH5TuMLnEcZm
	 98zmS+w1GD6DpRdQfq4v2F9zPfMP0pBRwmI66AqQyXrrEEQGpAyFTbXquPL4jrmDQ2
	 6zMcTG+/IW5dnw6eVae3Y70ejI2piIHLE0A2WVpcr3muYrpXiIK+rrWc2bfHpYA+by
	 reBH87fdD55/A==
Message-ID: <317e8543ff401f09ccc2e93c8cd70e71@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v7.2-rc7
Date: Thu, 13 Aug 2026 13:16:39 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit db2ddb87143519e20a95aa36c60b36107b736a58:

  Linux 7.2-rc7 (2026-08-09 14:54:50 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.2-rc7

for you to fetch changes up to 079e27f52b929b554b90514b081ea40b3d632a25:

  ASoC: Intel: NVL: Add entry for HDMI-In capture support to non-I2S codec boards. (2026-08-11 17:14:15 +0100)

----------------------------------------------------------------
ASoC: Fixes for v7.2

This set of fixes is bulked out quite a bit by the inclusion of a lot of
quirks for various x86 platforms, though there are a few driver specific
fixes in here too.  Nothing here is terribly critical, we should be fine
waiting for the merge window if it's too much.

----------------------------------------------------------------
Balamurugan C (3):
      ASoC: Intel: soc-acpi: Add entry for HDMI_In capture support in NVL match table
      ASoC: Intel: sof_rt5682: Add HDMI-In capture with rt5682 support for NVL.
      ASoC: Intel: NVL: Add entry for HDMI-In capture support to non-I2S codec boards.

Lin Xianglin (1):
      ASoC: amd: yc: Add DMI quirk for HyperX OMEN Gaming Laptop 16-ap1xxx

Mark Brown (1):
      ASoC: Intel: Add HDMI-In capture match table for NVL

Niranjan H Y (1):
      ASoC: tac5xx2-sdw: select REGMAP_SOUNDWIRE_MBQ

Rosen Penev (1):
      ASoC: xilinx: formatter_pcm: pass aud_drv_data to irq handlers

Rudi Heitbaum (1):
      ASoC: rt5645: Perform the initial jack detect at probe

Sergey Lebedev (1):
      ASoC: rt1320: run the initialisation preset on the first hardware init

Shenghao Ding (1):
      ASoC: tas2781: fix clang build error for goto bypassing cleanup variable

 sound/soc/amd/yc/acp6x-mach.c                     |  7 +++++++
 sound/soc/codecs/Kconfig                          |  1 +
 sound/soc/codecs/rt1320-sdw.c                     |  2 +-
 sound/soc/codecs/rt5645.c                         |  4 ++++
 sound/soc/codecs/tas2781-i2c.c                    | 18 ++++++++--------
 sound/soc/intel/boards/sof_es8336.c               | 10 +++++++++
 sound/soc/intel/boards/sof_rt5682.c               |  7 +++++++
 sound/soc/intel/boards/sof_ssp_amp.c              |  6 ++++++
 sound/soc/intel/common/soc-acpi-intel-nvl-match.c | 25 +++++++++++++++++++++++
 sound/soc/xilinx/xlnx_formatter_pcm.c             | 10 ++++-----
 10 files changed, 74 insertions(+), 16 deletions(-)
