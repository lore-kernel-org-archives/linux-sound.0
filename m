Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E055B38B7D4
	for <linux-sound@vger.kernel.org>; Wed, 29 Apr 2026 05:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777441357; cv=none; b=oq5fRBFJk5QJi2tifbwBMk/6lWx7NwOmAFEQjagmlrzKB/1il/yZXl0luhGdMFxvbX/8CtlyeUzvPqZLEOStGim0u4+CTsAFzj2M0gxugQIBmP3HeW+LgMCIKlvjd/Q7Y4RRpHyApV7wO1ASV3mJwjNk2wtm10sP1QP2pQqMHhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777441357; c=relaxed/simple;
	bh=iy+pKVRIEhGd/OGXEiMAk1gH/Bc+GjNZpgxmXTv4kt0=;
	h=From:To:Cc:Subject:Date:Message-Id; b=edjUdSQ7R3qybGvtFbn+4yZ+S1XBvR8OervBE8wD/QmhJnnF7pG3F+515dZXilM1OIG8FYe0Al5KmNVD2Pvr/4Pg3XOIbwsxiizhVYVA0eCqd2W3cTQQxE+uS/KY0EdkzBFeDL47h9/mrvc0697NGjp4kpCHxDba9ScGVu9Y4Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q+5I21zZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q+5I21zZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6413CC19425;
	Wed, 29 Apr 2026 05:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777441357;
	bh=iy+pKVRIEhGd/OGXEiMAk1gH/Bc+GjNZpgxmXTv4kt0=;
	h=From:To:Cc:Subject:Date:From;
	b=Q+5I21zZnlwfr68+545EGi/hOsK1NgRuZI+fBjcAtJXsY4E30SZRY4DtFOM750MDY
	 1fpCRIpZuwuKUliBs2ieQ8DwOpFYFy90Ba+NVWF8ue18mGOYW/il6XiT2mkLTAz3Xg
	 uH6vF7bhPTVSVerCf8AYxV7KwEqSvY3slg68weCTkPT2oBh3mGLmPBz1JyrMqk5EJV
	 N1Txe8IBX02KLV8Vkq0UxnwRexlS8sFWkMG8Lvw/rWUcbBzEsngzx+4o89flTiAIE2
	 ly/0taduPDMurWK6mTJr2sJwOUgemOD6w1EWxHUeULIF27g4OxZHrqS5CYQA7ktieB
	 MdDvLlk3Ayo1g==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id CBC321AC5855; Wed, 29 Apr 2026 06:42:34 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v7.1-rc1
Date: Wed, 29 Apr 2026 14:42:28 +0900
Message-Id: <20260429054234.CBC321AC5855@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.1-rc1

for you to fetch changes up to 03dcb5b68a96b51157ec2d17042fa2f0106828ae:

  ASoC: spacemit: adjust FIFO trigger threshold to half FIFO size (2026-04-29 11:41:32 +0900)

----------------------------------------------------------------
ASoC: Fixes for v7.1

We've had quite a lot of fixes come in this past week, all driver stuff
rather than any broad systematic issue.  All quite routine stuff.

----------------------------------------------------------------
Ajay Kumar Nandam (1):
      ASoC: codecs: wcd937x: fix AUX PA sequencing and mixer controls

Bard Liao (1):
      ASoC: SOF: Intel: add an empty adr_link

Christian A. Ehrhardt (1):
      ASoC: codecs: ab8500: Fix casting of private data

Cássio Gabriel (1):
      ASoC: Intel: bytcr_wm5102: Fix MCLK leak on platform_clock_control error

Guilherme G. Piccoli (1):
      ASoC: amd: acp: Add DMI quirk for Valve Steam Deck OLED

James Calligeros (2):
      ASoC: tas2764: Mark die temp register as volatile
      ASoC: tas2770: Fix order of operations for temperature calculation

Li Jian (1):
      ASoC: ES8389: convert to devm_clk_get_optional() to get clock

Richard Fitzgerald (1):
      ASoC: cs35l56: Fix illegal writes to OTP_MEM registers

Sasha Levin (1):
      ASoC: tegra: Remove stale snd-soc-tegra-utils composite module definition

Troy Mitchell (2):
      ASoC: spacemit: move hw constraints from hw_params to startup
      ASoC: spacemit: adjust FIFO trigger threshold to half FIFO size

wangdicheng (1):
      ASoC: aw88395: Fix kernel panic caused by invalid GPIO error pointer

 sound/soc/amd/acp/acp-legacy-mach.c   |  2 +-
 sound/soc/amd/acp/acp-mach-common.c   | 22 +++++++++++++---
 sound/soc/amd/acp/acp-mach.h          |  4 +++
 sound/soc/amd/acp/acp-sof-mach.c      |  2 +-
 sound/soc/codecs/ab8500-codec.c       |  6 ++---
 sound/soc/codecs/aw88395/aw88395.c    |  9 +++----
 sound/soc/codecs/cs35l56-shared.c     |  7 +++--
 sound/soc/codecs/es8389.c             |  2 +-
 sound/soc/codecs/tas2764.c            |  1 +
 sound/soc/codecs/tas2770.c            |  4 +--
 sound/soc/codecs/wcd937x.c            | 26 ++++++++++++++++++-
 sound/soc/intel/boards/bytcr_wm5102.c |  1 +
 sound/soc/sof/intel/hda.c             |  3 ++-
 sound/soc/spacemit/k1_i2s.c           | 49 ++++++++++++++++++++++++-----------
 sound/soc/tegra/Makefile              |  1 -
 15 files changed, 101 insertions(+), 38 deletions(-)
