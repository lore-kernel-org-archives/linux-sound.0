Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDBA42FCAB
	for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 16:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784220121; cv=none; b=liKGhH5xheWBxZqbtI/xt103HPBNQMksGcTBmprrUwIFbMc7NasaTqafPVbGBflh8iR1DwqGfQdbxVHiZ+Owvv76WgnhbbC0gZXpEVj5DEaPUsoM4l8wiiCo18CQTW0LNkALGsEMuayVAeu3pYcjxqlL3EqxZkp4Sy3eEnLfrPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784220121; c=relaxed/simple;
	bh=DTkIEjiUfEkgYl0201yqKBtIgnvikvvVFHNI1YOQl4g=;
	h=Message-ID:From:To:Cc:Subject:Date; b=IgTs/aBrKPnrcGNNFkz5Krmh8BdUIbJ7LKyiWTkxhJ2qg3cYU6QPzyxI2TNWIZCd2bIyj54wQZe5GeDHAl9us/dm0zlb3Za734S5k+5HJ09vehGO4jslHEGCMVFM+GeFuhqAaM8RLaOJ2yh1+M0QsXeGA2ZccQpbTiBwETUavcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M5tUEWdA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M5tUEWdA"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id E0BA21F000E9;
	Thu, 16 Jul 2026 16:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784220113;
	bh=N/Ox/WPTfaE27r3f+TqEgWZcyo1ANjmeNtVC+0pBTF4=;
	h=From:To:Cc:Subject:Date;
	b=M5tUEWdASPEaeETvfpjV69Nt4ZhFa0oljGSzdxvAyVcOZ4VNInDpnBUEbu24uKmDY
	 EsAuwsfDpi/FU8pEMk0ufA6GVHB8SMTgtJ3cxXZmXCdVZ2WdWbuBFkNw4j240hCrg0
	 9pSiPgTXCKogO6r7sVtFJOqUjZxap6UISJtrqM5ZKM8ZKRL5cKWUBmPgBf7tOD2c41
	 //8IhKlpFF1ozCRtxIQFUSvtBReSnD1Nc8Fogax8sfGiqpDe9pXPgOiN4PBwkINZVn
	 FuTeQl1vepjGaaKGLIURuO3FaPOsw0yVHG+Gbgi3D3qnCNpeW1Bv1XMN/8zfyY8j3X
	 xcsXvzRusGElQ==
Message-ID: <e11aad798859896a3f0388f99de32bc0@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v7.2-rc3
Date: Thu, 16 Jul 2026 17:41:39 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit 3238c634725afbb2a137fdda762208510828f71d:

  ASoC: tas2562: fix deprecated 'shut-down' GPIO always cleared after lookup (2026-07-09 00:33:20 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.2-rc3

for you to fetch changes up to efd80de2de9d06ddf0eee55ca11b04e39bfc7cd8:

  ASoC: Intel: sof_sdw: Add quirks for new Dell laptops (2026-07-16 17:18:08 +0100)

----------------------------------------------------------------
ASoC: Fixes for v7.2

A fairly standard collection of device specific fixes and quirks,
nothing particularly remarkable.

----------------------------------------------------------------
Antonio Ignacio Campos Ruiz (1):
      ASoC: amd: yc: Add DMI quirk for MSI Vector A16 HX A8WIG

Chancel Liu (2):
      ASoC: fsl_sai: Fix spurious BCLK on resume by clearing BYP
      ASoC: fsl: imx-card: Skip sysclk reset for active DAIs in shutdown

Charles Keepax (1):
      ASoC: Intel: sof_sdw: Add quirks for new Dell laptops

Chen-Yu Tsai (1):
      ASoC: sun4i-codec: Set quirks.playback_only for H616 codec

Mark Brown (2):
      ASoC: fs210x: Make cache write through again during resume
      ASoC: cs35l56: Fixes for deadlock/hang during component_probe()

Pengpeng Hou (1):
      ASoC: tas2781: bound firmware description string parsing

Richard Fitzgerald (2):
      ASoC: cs35l56: Fix potential probe() deadlock
      ASoC: cs35l56: Use complete_all() to signal init_completion

Shengjiu Wang (1):
      ASoC: bt-sco: fix duplicate DAPM widget names for wideband DAI

Syed Saba Kareem (1):
      ASoC: amd: acp: add ACP70 DMI override for new ASUS TUF platforms

 sound/soc/amd/acp-config.c        | 12 ++++++++
 sound/soc/amd/yc/acp6x-mach.c     |  7 +++++
 sound/soc/codecs/bt-sco.c         | 10 +++++--
 sound/soc/codecs/cs35l56-i2c.c    |  4 +--
 sound/soc/codecs/cs35l56-spi.c    |  4 +--
 sound/soc/codecs/cs35l56.c        | 17 ++++++++++-
 sound/soc/codecs/fs210x.c         |  1 +
 sound/soc/codecs/tas2781-fmwlib.c | 63 +++++++++++++++++++++++++++++++++++----
 sound/soc/fsl/fsl_sai.c           | 29 +++++++++++++++---
 sound/soc/fsl/imx-card.c          | 12 +++++---
 sound/soc/intel/boards/sof_sdw.c  |  2 ++
 sound/soc/sunxi/sun4i-codec.c     |  1 +
 12 files changed, 139 insertions(+), 23 deletions(-)
