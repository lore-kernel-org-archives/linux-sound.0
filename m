Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587993B2D0F
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 11:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785412171; cv=none; b=cSQ0pz3BmRGG9lsfoDacFzf37yoO/bRL5/6l1+NipsFpKNFG821xvtN4FkHKWMbFG2AuIurkxzdn+etH4BR4wUQXfYrfD65JMY4iWKU5vDN30OSxYGoUapwQdyR8nsS6dhF8JMRTGJAlfj/hdSvyWutfJTBLQe5TnWf8XARjcTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785412171; c=relaxed/simple;
	bh=tQgEFoWEDwU1tBV8GE9KKNQIF7LuO7LuSoo9qD8l3jE=;
	h=Message-ID:From:To:Cc:Subject:Date; b=Vjo+UYGbaCD6Yn3c5V9LNTpkN/dZ+vIMnj0kQkr9kkcI2OCLRu/CYPP2dfzJvVjMSYWEBUsxED/0wzjQs3bx+H5nU4m9lfuIZB5oyh1DVzbBNZW8tYs3eGwfHswrT4veVKi7N0Hepg1Xkyl4/bubPeBPMx4aynDsv241/f3uBb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VozFUVJt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VozFUVJt"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id CED831F000E9;
	Thu, 30 Jul 2026 11:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785412167;
	bh=6rJUZ55UWvdhuzi08N6I9RHhNArh51Ca6xpsNqxxw+0=;
	h=From:To:Cc:Subject:Date;
	b=VozFUVJtmqmyq+LXzx9VarPhPJVkhJc2kf1LDx2lPrntuCGZGzw93WW4HZD69tXrm
	 a7uVsi2LahNOecnZfHbERVN6WUTrqbFR/E8dwUYKPwdJfV0TTgw+QhMirM5OPN1I49
	 VYK76ZJKB/DluEXizBfaCJEL40oenHPD5hh+cFYyJOU+NQ25sSw6kQJ+3VGisIcWZn
	 KD8xyeyUrJASWgxKERHEDB6BQmeByNzENGZEdXsuNGFKIv0NEYvnnGEe6Me5EP0LzR
	 iFtpEqKoIbd3mCxe8d4WJoC5k/wqThAtl+ToDihd2Bnq97KIw3e+v0Bv8LJvNIh+Hg
	 l0YWkpuNU23xA==
Message-ID: <036cc4fbb2a3c0ffc45ac4373f6f5c9e@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v7.2-rc5
Date: Thu, 30 Jul 2026 12:49:18 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit f5098b6bae761e346ebcd9da7f95622c04733cff:

  Linux 7.2-rc5 (2026-07-26 14:45:48 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.2-rc5

for you to fetch changes up to d0ecbedd6a70f2fe768d46de740265dc8a4424e3:

  ASoC: rt722: reset codec to fix abnormal sound (2026-07-29 23:27:37 +0100)

----------------------------------------------------------------
ASoC: Fixes for v7.2

This is a relatively large set of updates, the biggest batch of things
is Charles' fixes for the SDCA code which have been through a number of
iterations on the list and deal with a bunch of issues that have been
seen as we get more real world usage of SDCA.  We also have the usual
device specific fix and quirk traffic that we tend to see, there's a
small pile of fixes for the tas2562 driver since I saw some bugs while
reviewing fixes sent by Haidar Lee but it's nothing too remarkable.

----------------------------------------------------------------
Balamurugan C (1):
      ASoC: Intel: soc-acpi: Add entry for sof_rt5682 in NVL match table.

Charles Keepax (11):
      ASoC: SDCA: Correct pointer passed to devm_acpi_table_put
      ASoC: SDCA: Always free firmware in FDL path
      ASoC: SDCA: Make UMP message size check more robust
      ASoC: SDCA: Ensure that Control Range is large enough for header
      ASoC: SDCA: Rename sdca_irq_allocate() to include devm
      ASoC: SDCA: Add sdca_irq_cleanup_late()
      ASoC: SDCA: Remove devm from primary IRQ cleanup
      ASoC: SDCA: Populate IRQ data earlier
      ASoC: Add a component fixup_controls callback
      ASoC: SDCA: Switch to fixup_controls callback for IRQ registration
      ASoC: SDCA: Move kcontrol search out of IRQ

Fabio Estevam (1):
      ASoC: dt-bindings: realtek,rt5640: Make interrupts optional

Haidar Lee (2):
      ASoC: tas2562: fix DVC coefficient write order
      ASoC: tas2562: fix broken entries in the volume lookup table

Jackie Dong (1):
      ASoC: amd: acp: Add DMI quirk for Lenovo Legion 7 15ASH11

Jorn Baayen (1):
      ASoC: amd: yc: Add DMI quirk for Acer Aspire AG14-22P

Mark Brown (8):
      ASoC: tas2562: fix Digital Volume Control
      ASoC: tas2562: Validate values for volume writes
      ASoC: tas2562: Fix event generation for volume control
      ASoC: tas2562: Fix default digital volume
      ASoC: tas2562: Volume setting fixes
      ASoC: fsl: fix m2m_init error path cleanup in fsl_asrc and fsl_easrc
      ASoC: Series of SDCA bug fixes
      ASoC: Fix races on creation of SDCA jack detection

Shengjiu Wang (2):
      ASoC: fsl_asrc: fix m2m_init error path to use goto instead of bare return
      ASoC: fsl_easrc: fix m2m_init error path to use goto instead of bare return

Shuming Fan (1):
      ASoC: rt722: reset codec to fix abnormal sound

Surendra Singh Chouhan (1):
      ASoC: sophgo: return 1 on volume change in cv1800b_adc_volume_set()

Uday Khare (2):
      ASoC: max98095: fix missing IS_ERR() before PTR_ERR() on mclk lookup
      ASoC: max98090: fix missing IS_ERR() before PTR_ERR() on mclk lookup

Zhang Heng (1):
      ASoC: amd: yc: Add DMI quirk for ASUS EXPERTBOOK PM1403CDA

wangdicheng (1):
      ASoC: tas2781: Use correct calibration data for SINEGAIN2 register

郑鸿源 (1):
      ASoC: amd: yc: Add MSI Crosshair A16 HX D7WFKG to quirk table

 .../devicetree/bindings/sound/realtek,rt5640.yaml  |   1 -
 include/sound/sdca_fdl.h                           |   2 +
 include/sound/sdca_interrupts.h                    |  14 +-
 include/sound/sdca_jack.h                          |   3 +
 include/sound/soc-component.h                      |   2 +
 sound/soc/amd/acp-config.c                         |   7 +
 sound/soc/amd/yc/acp6x-mach.c                      |  22 +++
 sound/soc/codecs/max98090.c                        |   5 +-
 sound/soc/codecs/max98095.c                        |   5 +-
 sound/soc/codecs/rt722-sdca-sdw.c                  |   4 +
 sound/soc/codecs/rt722-sdca.c                      |  14 ++
 sound/soc/codecs/tas2562.c                         |  46 ++++--
 sound/soc/codecs/tas2781-i2c.c                     |   4 +-
 sound/soc/fsl/fsl_asrc.c                           |   2 +-
 sound/soc/fsl/fsl_easrc.c                          |   2 +-
 sound/soc/intel/common/soc-acpi-intel-nvl-match.c  |  13 ++
 sound/soc/sdca/sdca_class.c                        |   4 +-
 sound/soc/sdca/sdca_class_function.c               |   6 +-
 sound/soc/sdca/sdca_device.c                       |   2 +-
 sound/soc/sdca/sdca_fdl.c                          |  18 ++-
 sound/soc/sdca/sdca_functions.c                    |   2 +
 sound/soc/sdca/sdca_interrupts.c                   | 174 ++++++++++++---------
 sound/soc/sdca/sdca_jack.c                         |  88 ++++++-----
 sound/soc/sdca/sdca_ump.c                          |   4 +-
 sound/soc/soc-component.c                          |  10 ++
 sound/soc/soc-core.c                               |   5 +
 sound/soc/sophgo/cv1800b-sound-adc.c               |  10 +-
 27 files changed, 319 insertions(+), 150 deletions(-)
