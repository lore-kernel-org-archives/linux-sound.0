Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A173C2B9BC
	for <linux-sound@vger.kernel.org>; Wed,  4 Jun 2025 11:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749036679; cv=none; b=ODEkn7xdl7gWC3jsrKSGh4h+MRzPMuSDaaPbUHEERSUtGFZT2IyMEQM8RYmSlWiQVG7LAZl3VQIgAuUhdBlRhfw8B0ipHdxJT4b//QotzldLE7PrmC9WUYKCDKRkkReIxwpcoJgruSI9xOMdLSqTwxHVyig+ahTPH1cykBjYjWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749036679; c=relaxed/simple;
	bh=ZX0ItmnNbojzBHBC/dcRzu7609Te3f708c0QQ3pKAfI=;
	h=Message-ID:From:To:Cc:Subject:Date; b=WxpdFHZmUBUZ2CqHn8btQJSbaa+EaptWI8wwb+lZLloYhI1Th2cpGXUX2CLGseXIzISKfE1Tx4NDm4FknzgfEVF5HQs/vTx4OVnc3rGD3tXLSSGqGMob9WqVKhYnidPpnsSc8eYUN51KFl7laKUj/2OoUmYgkJSr7RfDITSUc0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r9E3WoDp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r9E3WoDp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2424FC4CEE7;
	Wed,  4 Jun 2025 11:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749036679;
	bh=ZX0ItmnNbojzBHBC/dcRzu7609Te3f708c0QQ3pKAfI=;
	h=From:To:Cc:Subject:Date:From;
	b=r9E3WoDp2CmCGjuSRqydrA1olIUkEOXP1FHFYujZXfDuZjFd7MfQP18sPaM5dCieo
	 u5DnE1ew8CuxGHG2fKvW/SjZ6yJWlikphZmkh29HCk011ZDR9TSDW5m+BXrUgL2u8C
	 oVhGAWSFEuqgBUbCuzQoZLVzjVyYetpkzzJij+qXMc0o6zMISxkTWZ0zXTmyzD3CF7
	 8D5vR4u0fW5rd8Yuc5bdapqwElp+mU2oXAYt9rmogTo4xCivsbqaEbyZccLDOno9/l
	 mnATWBH7OwFoV4Qn8gAAblDCJWvl4bhjNcxmcWyHyYcSPPuqT+qXwUzTWzMQ3f+hEK
	 j5ZBB4Dg5QILg==
Message-ID: <b1d4ad0e144128a16f88faa924f41432.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.16-merge-window
Date: Wed, 04 Jun 2025 12:31:09 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit 43a38a0ff8c63ee156d997cd13063c63cd55d812:

  ASoC: codecs: add support for ES8375 (2025-05-23 16:52:28 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.16-merge-window

for you to fetch changes up to b7188a1c0d2d7b04f4558e10293651d49fcb2398:

  ASoC: Intel: avs: boards: Fix rt5663 front end name (2025-06-03 17:04:32 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.16

A bunch of fixes, including a big batch for the Intel AVS driver, and
one new device ID.  It's all device specific.

----------------------------------------------------------------
Amadeusz Sławiński (2):
      ASoC: Intel: avs: Fix paths in MODULE_FIRMWARE hints
      ASoC: Intel: avs: boards: Fix rt5663 front end name

Bram Vlerick (2):
      ASoC: tas571x: add separate tas5733 controls
      ASoC: tas571x: fix tas5733 num_controls

Cezary Rojewski (9):
      ASoC: codecs: hda: Fix RPM usage count underflow
      ASoC: Intel: avs: Fix deadlock when the failing IPC is SET_D0IX
      ASoC: Intel: avs: Fix PPLCxFMT calculation
      ASoC: Intel: avs: Fix possible null-ptr-deref when initing hw
      ASoC: Intel: avs: Verify kcalloc() status when setting constraints
      ASoC: Intel: avs: Verify content returned by parse_int_array()
      ASoC: Intel: avs: Include missing string.h
      ASoC: pcm: Do not open FEs with no BEs connected
      ASoC: Intel: avs: Simplify verification of parse_int_array() result

Jaroslav Kysela (2):
      firmware: cs_dsp: Fix OOB memory read access in KUnit test (wmfw info)
      firmware: cs_dsp: Fix OOB memory read access in KUnit test (ctl cache)

Krzysztof Kozlowski (3):
      ASoC: codecs: wcd9335: Fix missing free of regulator supplies
      ASoC: codecs: wcd937x: Drop unused buck_supply
      ASoC: codecs: wcd9375: Fix double free of regulator supplies

Mark Brown (2):
      ASoC: codecs: wcd93xx: Few regulator supplies fixes
      ASoC: Intel: avs: Set of functional fixes

Qasim Ijaz (1):
      ASoC: codecs: fix out-of-bounds access on invalid clock config

Shuming Fan (1):
      ASoC: rt1320: fix speaker noise when volume bar is 100%

Yuuki NAGAO (1):
      ASoC: ti: omap-hdmi: Re-add dai_link->platform to fix card init

meowmeowbeanz (1):
      ASoC: amd: yc: Add support for Lenovo Yoga 7 16ARP8

 drivers/firmware/cirrus/test/cs_dsp_mock_wmfw.c    |  3 +-
 .../cirrus/test/cs_dsp_test_control_cache.c        |  1 -
 sound/soc/amd/yc/acp6x-mach.c                      |  7 +++
 sound/soc/codecs/es8375.c                          |  1 +
 sound/soc/codecs/hda.c                             |  4 +-
 sound/soc/codecs/rt1320-sdw.c                      | 17 +++++-
 sound/soc/codecs/tas571x.c                         | 67 +++++++++++++++++++++-
 sound/soc/codecs/tas571x.h                         | 34 +++++++++++
 sound/soc/codecs/wcd9335.c                         | 25 +++-----
 sound/soc/codecs/wcd937x.c                         |  7 +--
 sound/soc/intel/avs/board_selection.c              |  2 +-
 sound/soc/intel/avs/boards/rt5663.c                |  2 +-
 sound/soc/intel/avs/core.c                         | 20 +++----
 sound/soc/intel/avs/debugfs.c                      | 12 ++--
 sound/soc/intel/avs/ipc.c                          |  4 +-
 sound/soc/intel/avs/loader.c                       |  1 +
 sound/soc/intel/avs/path.c                         |  2 +
 sound/soc/intel/avs/pcm.c                          | 13 ++---
 sound/soc/soc-pcm.c                                | 23 ++++----
 sound/soc/ti/omap-hdmi.c                           |  7 ++-
 20 files changed, 184 insertions(+), 68 deletions(-)
