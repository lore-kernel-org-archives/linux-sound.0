Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8513034252D
	for <linux-sound@vger.kernel.org>; Wed,  6 May 2026 14:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778076355; cv=none; b=tuKmqW6JmYyG5/pwqtqKwPX39+f+Qm8qt0Ek2rKpoXVnQjyb6bqjMG8OcMMYSFpNpTZujVG0ESV2WuFnvByvPg0UG2S/bTpuvR+IUpoxIxBy3Cdl5J/6AAsq9BS+1Wqhy7zjWnRNWlIRequ1fyTwGKiR3xo9R/8YVRNtvErqsks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778076355; c=relaxed/simple;
	bh=R6F38CqNLNqRG+cFUfxfGsJMsiKTyn6CCJXNGR/rlqU=;
	h=From:To:Cc:Subject:Date:Message-Id; b=VveJ/bL4e6vCebI0c3hFO9Ukj4GAohfZ0p/uUoYwLG4k2ya9yqxNhqJVKbMPqIbdU61BJirWimUbmGYXaVwqBclnGATwGwyGqGC2s9+OVV4gr0pweroLwbh6IVzA6ZwvWrO7DmbDyqOzOccY2g2RAYZsgs5QFFKErMbNe73ou18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yp5DMqta; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yp5DMqta"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16D47C2BCB0;
	Wed,  6 May 2026 14:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778076355;
	bh=R6F38CqNLNqRG+cFUfxfGsJMsiKTyn6CCJXNGR/rlqU=;
	h=From:To:Cc:Subject:Date:From;
	b=Yp5DMqtasUqJfz2zl4rM261fZEkwBuxaOAV/HyfLBNeOSNTV9YRvsRu4lo0yVmRs9
	 zWfxUcdk1V1TzYiZx3ejWYoIJymWb7E059FsO7SoWcLVOMoufdShzSERaOX4NglVuI
	 5QRibM9EczbQhQlP15Kjm5LR7nB7TizqUXeB26BQTT8W18Rkfh8V5W8tvMjiuk01ax
	 wiiQ3sQMwAknARS5Spok5S1vnOAlC10npoVnlvTF9gjJ9IhA53KujVFKEjDnBGEyLD
	 YXi48ZKGHZQrLJDCHmiVEyNdVslYOzxAS6tILTANQrHmG7FpVSnjl/3oRuFpPj9pgr
	 nakUPMqjP+xBg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 603EF1AC587E; Wed, 06 May 2026 15:05:52 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v7.1-rc2
Date: Wed, 06 May 2026 23:05:47 +0900
Message-Id: <20260506140552.603EF1AC587E@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit 7fd2df204f342fc17d1a0bfcd474b24232fb0f32:

  Linux 7.1-rc2 (2026-05-03 14:21:25 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.1-rc2

for you to fetch changes up to 5776bcdf4dccac8edc1160482792b512da5c08b4:

  ASoC: cs35l56: Fixes for driver cleanup (2026-05-06 21:22:53 +0900)

----------------------------------------------------------------
ASoC: Fixes for v7.1

Another batch of fixes, plus a couple of quirks (mostly AMD ones, as has
been the case recently).  All driver changes, including fixes for the
KUnit tests for the Cirrus drivers that could cause memory corruption.

----------------------------------------------------------------
Bob Song (1):
      ASoC: amd: yc: Add DMI quirk for MSI Bravo 15 C7VE

Cássio Gabriel (1):
      ASoC: fsl_xcvr: Fix event generation for cached controls

Derek Fang (1):
      ASoC: sdw_utils: avoid the SDCA companion function not supported failure

James Calligeros (2):
      ASoC: tas2764: Deal with bogus initial temperature register value
      ASoC: tas2770: Deal with bogus initial temperature value

Mark Brown (2):
      ASoC: wm_adsp_fw_find_test: Fix a couple of bugs
      ASoC: cs35l56: Fixes for driver cleanup

Richard Fitzgerald (6):
      ASoC: cs35l56: Fix hibernate write in runtime resume error path
      ASoC: cs35l56: Fix out-of-bounds in dev_err() in cs35l56_read_onchip_spkid()
      ASoC: wm_adsp_fw_find_test: Redirect wm_adsp_release_firmware_files()
      ASoC: wm_adsp_fw_find_test: Clear searched_fw_files in find-by-index test
      ASoC: cs35l56: Don't use devres to unregister component
      ASoC: cs35l56: Destroy workqueue in probe error path

Tommaso Soncin (1):
      ASoC: amd: yc: Add HP OMEN Gaming Laptop 16-ap0xxx product line in quirk table

Troy Mitchell (1):
      ASoC: spacemit: fix RX DMA params not set when TX is running

Uwe Kleine-König (The Capable Hub) (1):
      ASoC: codecs: ab8500: Remove suspicious code

 sound/soc/amd/yc/acp6x-mach.c           |  21 +++
 sound/soc/codecs/ab8500-codec.c         | 304 +-------------------------------
 sound/soc/codecs/cs35l56-shared.c       |  11 +-
 sound/soc/codecs/cs35l56.c              |  11 +-
 sound/soc/codecs/tas2764.c              |  35 +++-
 sound/soc/codecs/tas2770.c              |  23 ++-
 sound/soc/codecs/wm_adsp_fw_find_test.c |  57 ++++--
 sound/soc/fsl/fsl_xcvr.c                |  17 +-
 sound/soc/sdw_utils/soc_sdw_utils.c     |   1 +
 sound/soc/spacemit/k1_i2s.c             |   7 +-
 10 files changed, 151 insertions(+), 336 deletions(-)
