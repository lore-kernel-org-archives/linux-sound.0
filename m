Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A560227FB1B
	for <linux-sound@vger.kernel.org>; Wed,  6 Aug 2025 17:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754500490; cv=none; b=PfWfr7FSxGRVI4kXyOalODFal4R/XDfLRPbOULD0at+hT8zCd/XnNsMNoS/cTlre6Yki5fV/g3QUulkvdAIGOIB132FPqsR8bdn7iW+mug3I57zyMRucWOKLMtpo2IzfBHxB5KsYPac/WBPXOAbJK3Bpjii9u+03+7TW3RggeMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754500490; c=relaxed/simple;
	bh=72AVAJ87rVtXseew9hAgk98phf0ztd1QJ80ILDYTB4Q=;
	h=Message-ID:From:To:Cc:Subject:Date; b=ues5AXmQiDZvQULL/k1eVICudnM+nUiCx6G9zOuksku133cG7wNL3wWsKSPwCzvZm8nISh65u+DmDl2P3WDf2QlXTncg5kWHymdJcfAkWqfLxGhZXcuPCnZMWtc5WxQ0OEk+qL2thpUKCQshuRHNJoonUoUwy7ab9lGd7sZgG0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AE5iPxkS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AE5iPxkS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E36C1C4CEE7;
	Wed,  6 Aug 2025 17:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754500490;
	bh=72AVAJ87rVtXseew9hAgk98phf0ztd1QJ80ILDYTB4Q=;
	h=From:To:Cc:Subject:Date:From;
	b=AE5iPxkSwCPkPGCYLseEkh5RJxNxyCZAi6wt+xx6hyF1wiGFUK/4meiOCBeRzV3Yh
	 oYzQevZcR8KwT7rOtU2PzigMsZnr9oFaa8cHv8NSRj+B4r36qmw1rdNDIykOt4v4E0
	 L8yDEyxAvNTCnMufgXat9vjGs/cWAT1AFSRrrM2xhnqypYlGuXindiXk/W31owl0ri
	 CIUWui+cgtfw5l8Ij0mCHxl/d8Uhjr69Zfxe2XF305IJZ8fxNk+Psm30v6TUm8JgX5
	 SCrsOCWY/sZdyQyufktVRMZpAqhRhgb/o+9jkk+UCZiYcnoq93ssk/OornPwUBVOkm
	 zunjuiiRIj+jA==
Message-ID: <97abce5e5d42120dc07961f73b548c7d.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.17-merge-window
Date: Wed, 06 Aug 2025 18:14:43 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit e95122a32e777309412e30dc638dbc88b9036811:

  ASoC: codecs: Add acpi_match_table for aw88399 driver (2025-07-25 13:44:29 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.17-merge-window

for you to fetch changes up to 614d416dd8aee2675fb591c598308a901a660db8:

  ASoC: SOF: Intel: hda-sdw-bpt: fix SND_SOF_SOF_HDA_SDW_BPT dependencies (2025-08-06 12:02:32 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.17

This is a relatively small set of fixes and device quirks that came in
during the merge window, the AMD changes adding support for ACP 7.2
systems are all just adding IDs for the devices rather than any
substantial code - the actual code is the same as for prior versions of
the platform.

----------------------------------------------------------------
Arnd Bergmann (1):
      ASoC: SOF: Intel: hda-sdw-bpt: fix SND_SOF_SOF_HDA_SDW_BPT dependencies

Baojun Xu (1):
      ASoC: tas2781: Fix the wrong step for TLV on tas2781

Cezary Rojewski (1):
      ASoC: Intel: avs: Fix uninitialized pointer error in probe()

Mark Brown (1):
      Add audio support for acp7.2 platform

Muhammad Usama Anjum (1):
      ASoC: SOF: amd: acp-loader: Use GFP_KERNEL for DMA allocations in resume context

Peter Jakubek (1):
      ASoC: Intel: sof_sdw: Add quirk for Alienware Area 51 (2025) 0CCC SKU

Shengjiu Wang (1):
      ASoC: wm8962: Clear master mode when enter runtime suspend

Venkata Prasad Potturu (4):
      ASoC: SOF: amd: Add sof audio support for acp7.2 platform
      ASoC: amd: ps: Add SoundWire pci and dma driver support for acp7.2 platform
      ASoC: amd: acp: Add SoundWire legacy machine driver support for acp7.2 platform
      ASoC: amd: acp: Add SoundWire SOF machine driver support for acp7.2 platform

 include/sound/tas2781-tlv.h             |  2 +-
 sound/soc/amd/acp/acp-sdw-legacy-mach.c |  3 +++
 sound/soc/amd/acp/acp-sdw-sof-mach.c    |  1 +
 sound/soc/amd/acp/soc_amd_sdw_common.h  |  2 ++
 sound/soc/amd/ps/acp63.h                |  1 +
 sound/soc/amd/ps/pci-ps.c               |  4 ++++
 sound/soc/amd/ps/ps-sdw-dma.c           |  5 +++++
 sound/soc/codecs/wm8962.c               | 11 +++++++++++
 sound/soc/intel/avs/core.c              |  3 ++-
 sound/soc/intel/boards/sof_sdw.c        |  8 ++++++++
 sound/soc/sof/amd/acp-loader.c          |  6 +++---
 sound/soc/sof/amd/acp.c                 |  8 ++++++++
 sound/soc/sof/amd/acp.h                 |  1 +
 sound/soc/sof/amd/pci-acp70.c           |  1 +
 sound/soc/sof/intel/Kconfig             |  3 ++-
 15 files changed, 53 insertions(+), 6 deletions(-)
