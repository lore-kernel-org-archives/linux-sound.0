Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7421799F
	for <linux-sound@vger.kernel.org>; Thu,  5 Mar 2026 16:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772726945; cv=none; b=MH9wp2zt32vfUP82tzsyRq27y1KEIhcVof9xhkxnXR6ZahCKvvc89xfL+Iq3bEbhp4Dx2QWTL16DwO/K9/kc+t8PwX53VWYXlh1sISlHXWWfcvhcosfltPApr5gqnlZ0wxrdHdeYr3Z6OEkYa9gpZWwKnr/5ZXVR0Dh/GYHAO8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772726945; c=relaxed/simple;
	bh=n/jsFStn/BYXZr7Hl4JTiy1I1XD2nIItZjbkr2AYIH8=;
	h=Message-ID:From:To:Cc:Subject:Date; b=m487cpq+qX+lXtcykr/e5ALB3LR42mlnsibqFHLwe3ta6+kHE2SHDmRZ8A5Afo9nIPoDwDUmEuQhxG7+C6S3MAofTfe/oClCvcIy+5MEHbz0uHrooywDi4pmkD6LQ1lKgx/tP/T8PBp5/aWCdxxV6AsZ+DpSLoXOaQlgt0uhhMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FChNtr7D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FChNtr7D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA49CC116C6;
	Thu,  5 Mar 2026 16:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772726945;
	bh=n/jsFStn/BYXZr7Hl4JTiy1I1XD2nIItZjbkr2AYIH8=;
	h=From:To:Cc:Subject:Date:From;
	b=FChNtr7DO383inpFtYOnrh36E+HBDUw3nvlpXt6r+3hBvwMpskf/Z+uorxTK+LGFT
	 +AN3+oKeIfxUGgs0QHkx0SQbjBZiyFAEqUGPy5Sn/T7vT9Ozx3InEMwPEZrTv3vdc5
	 OxFLZ938YzIbACA4UHZXf0j/xPXBxjQFPSngxDCEIe10p+A3B98XvSrQwbuWT45Zd0
	 CTUr8N2FUcSldD684SwUoVKsXaoPUiyeEL6TDZugGpS2uaQUjct4X7qoWz2BQPtE94
	 AQKGumMOAkaFDgy+lT+3GvEF6+lFFF9jZMeyLob5YLKXFG7rRNIqzawJ761fH+cL+B
	 e1vaMTzsshUhg==
Message-ID: <7ad7ff6760638a45f9d77f53a870e817@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v7.0-rc2
Date: Thu, 05 Mar 2026 16:08:54 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit 11439c4635edd669ae435eec308f4ab8a0804808:

  Linux 7.0-rc2 (2026-03-01 15:39:31 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.0-rc2

for you to fetch changes up to 325291b20f8a6f14b9c82edbf5d12e4e71f6adaa:

  ASoC: amd: yc: Add DMI quirk for ASUS EXPERTBOOK PM1503CDA (2026-03-04 11:40:17 +0000)

----------------------------------------------------------------
ASoC: Fixes for v7.0

A moderately large pile of fixes, though none of them are  super major,
plus a few new quirks and device IDs.

----------------------------------------------------------------
Biju Das (1):
      ASoC: dt-bindings: renesas,rz-ssi: Document RZ/G3L SoC

Charles Keepax (1):
      ASoC: SDCA: Add allocation failure check for Entity name

Mark Brown (3):
      ASoC: fsl_easrc: Fix event generation in fsl_easrc_iec958_put_bits()
      ASoC: fsl_easrc: Fix event generation in fsl_easrc_iec958_set_reg()
      ASoC: fsl_easrc: Fix control writes

Oliver Freyermuth (1):
      ASoC: Intel: sof_sdw: Add quirk for Alienware Area 51 (2025) 0CCD SKU

Richard Fitzgerald (2):
      ASoC: cs35l56: Only patch ASP registers if the DAI is part of a DAIlink
      ASoC: cs35l56: Suppress pointless warning about number of GPIO pulls

Sheetal (1):
      ASoC: dt-bindings: tegra: Add compatible for Tegra238 sound card

Shuming Fan (1):
      ASoC: rt1321: fix DMIC ch2/3 mask issue

Simon Trimmer (1):
      ASoC: amd: acp: Add ACP6.3 match entries for Cirrus Logic parts

Zhang Heng (1):
      ASoC: amd: yc: Add DMI quirk for ASUS EXPERTBOOK PM1503CDA

 .../sound/nvidia,tegra-audio-graph-card.yaml       |   1 +
 .../devicetree/bindings/sound/renesas,rz-ssi.yaml  |   1 +
 include/sound/cs35l56.h                            |   1 +
 sound/soc/amd/acp/amd-acp63-acpi-match.c           | 413 +++++++++++++++++++++
 sound/soc/amd/yc/acp6x-mach.c                      |   7 +
 sound/soc/codecs/cs35l56-shared.c                  |  16 +-
 sound/soc/codecs/cs35l56.c                         |  12 +-
 sound/soc/codecs/rt1320-sdw.c                      |   5 +-
 sound/soc/fsl/fsl_easrc.c                          |  14 +-
 sound/soc/intel/boards/sof_sdw.c                   |   8 +
 sound/soc/sdca/sdca_functions.c                    |   5 +-
 11 files changed, 473 insertions(+), 10 deletions(-)
