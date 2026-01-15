Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFC83A0EBB
	for <linux-sound@vger.kernel.org>; Thu, 15 Jan 2026 13:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768483890; cv=none; b=N3XlviDPlili9cMVjZTkeCIoeQRx6LhVHaFAyyurDlTuLSrf2SziWqCuYEgidBTbollEQdWv3Sb7JV3jWbJHtFblzRiPo402BZHl500p425KaMH5vmhee+KShn9i9FL9OEVwI7Di8U0iYcAaWhn17YsIjvbDZdgBrFuXy8jrfjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768483890; c=relaxed/simple;
	bh=I3H1nL2bNj+kbOnV8n/EIezPSbG3sh9iRqJ+i7rFau8=;
	h=Message-ID:From:To:Cc:Subject:Date; b=T3OQUWat9cS75NZ2ty/wL3hhkM0mdiQZkcsGcoBy3o0OWN7HCUDg/ps969YEIQNYcUCszsEuX6H3dXm4zY5atbaSbK8bxPDhioC8WXQJxmOqEiv+5KnA2aP7pW3ImquN/2lipURLgk6Auq274yDIyp8q0LzBAettHH1rkcC9Lfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e/1dEPGE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e/1dEPGE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88E2DC116D0;
	Thu, 15 Jan 2026 13:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768483889;
	bh=I3H1nL2bNj+kbOnV8n/EIezPSbG3sh9iRqJ+i7rFau8=;
	h=From:To:Cc:Subject:Date:From;
	b=e/1dEPGEJ8tCfORXSsDYGoT69NYr6aMUJRtQwojKd8FRpy+4r61XcH01licruxQ5K
	 iqNKfWzZaZSzkMM7aJqTpu9jNhghulzsZUK7dvyB+3+mtjgCBqoUSKCHElY7tS2HfK
	 h4QUtbZEAGZa9LXJ0wlUbw3F8Sp3+QOZ2/9DLzL3AwNmVIRQPVRbiYSbe7vOu+lJGk
	 /BItQAf9aAtM0dy0UKRPHo2CEcbyztSMdAqf/Ds/A+iAS0de0lai75xWOqz0zWlX73
	 D66xhZgcai91FOF96tKRlR/MKvGhgMo65v9d2PqtRbpR0B+BhLimYK6oQ5lRf1PuCe
	 cjG3dxBa4jzNA==
Message-ID: <7e292ad75850560429f37325a0656aae@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.19-rc5
Date: Thu, 15 Jan 2026 13:31:21 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit 0f61b1860cc3f52aef9036d7235ed1f017632193:

  Linux 6.19-rc5 (2026-01-11 17:03:14 -1000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.19-rc5

for you to fetch changes up to be5a39e7994ec9f003c8569b670c794a4e5d1551:

  ASoC: rt5640: Fix duplicate clock properties in DT binding (2026-01-15 11:21:44 +0000)

----------------------------------------------------------------
ASoC: Fixes for v6.19

A moderately large collection of fixes since I missed a week, plus a few
new device IDs and quirks.  It's all fairly minor, including a bunch of
work on the device tree bindings fixes which have no runtime effect.

There's one SoundWire change here exporting a symbol which was required
for a fix to the ASoC SoundWire code.

----------------------------------------------------------------
Ben Dooks (1):
      ASoC: ops: fix pointer types to be big-endian

Cole Leavitt (1):
      ASoC: sdw_utils: cs42l43: Enable Headphone pin for LINEOUT jack type

Deep Harsora (1):
      ASoC: Intel: sof_sdw: Add new quirks for PTL on Dell with CS42L43

Dimitrios Katsaros (1):
      ASoC: tlv320adcx140: Propagate error codes during probe

Emil Svendsen (3):
      ASoC: tlv320adcx140: invert DRE_ENABLE
      ASoC: tlv320adcx140: fix null pointer
      ASoC: tlv320adcx140: fix word length

Johan Hovold (4):
      ASoC: codecs: wsa883x: fix unnecessary initialisation
      ASoC: codecs: wsa881x: fix unnecessary initialisation
      ASoC: codecs: wsa884x: fix codec initialisation
      ASoC: codecs: wsa883x: suppress variant printk

Jon Hunter (3):
      ASoC: dt-bindings: realtek,rt5640: Document mclk
      ASoC: dt-bindings: realtek,rt5640: Update jack-detect
      ASoC: dt-bindings: realtek,rt5640: Document port node

Kery Qi (1):
      ASoC: davinci-evm: Fix reference leak in davinci_evm_probe

Mark Brown (5):
      ASoC: codecs: wsa88xx: fix codec initialisation
      ASoC: dt-bindings: realtek,rt5640: Various fixes
      ASoC: Fix sdw_utils calling wrong codec init callbacks
      ASoC: tlv320adcx140: Merge fixes from Pengutronix
      ASoC: rt5640: Fix duplicate clock properties in DT binding

Radhi Bajahaw (1):
      ASoC: amd: yc: Fix microphone on ASUS M6500RE

Richard Fitzgerald (2):
      soundwire: Add missing EXPORT for sdw_slave_type
      ASoC: sdw_utils: Call init callbacks on the correct codec DAI

Rob Herring (Arm) (4):
      ASoC: dt-bindings: everest,es8316: Add interrupt support
      ASoC: dt-bindings: realtek,rt5640: Add missing properties/node
      ASoC: dt-bindings: realtek,rt5640: Allow 7 for realtek,jack-detect-source
      ASoC: dt-bindings: rockchip-spdif: Allow "port" node

Shengjiu Wang (1):
      ASoC: simple-card-utils: Check device node before overwrite direction

sheetal (1):
      ASoC: tegra: Revert fix for uninitialized flat cache warning in tegra210_ahub

 .../devicetree/bindings/sound/everest,es8316.yaml  |  4 ++
 .../devicetree/bindings/sound/realtek,rt5640.yaml  | 11 ++++++
 .../devicetree/bindings/sound/rockchip-spdif.yaml  |  3 ++
 drivers/soundwire/slave.c                          |  1 +
 sound/soc/amd/yc/acp6x-mach.c                      |  7 ++++
 sound/soc/codecs/tlv320adcx140.c                   | 13 ++++---
 sound/soc/codecs/wsa881x.c                         |  9 +++++
 sound/soc/codecs/wsa883x.c                         | 26 +++++++++----
 sound/soc/codecs/wsa884x.c                         |  3 +-
 sound/soc/generic/simple-card-utils.c              |  4 +-
 sound/soc/intel/boards/sof_sdw.c                   |  8 ++++
 sound/soc/sdw_utils/soc_sdw_cs42l43.c              |  2 +-
 sound/soc/sdw_utils/soc_sdw_utils.c                | 43 +++++++++++++++++++++-
 sound/soc/soc-ops.c                                |  4 +-
 sound/soc/tegra/tegra210_ahub.c                    |  6 +--
 sound/soc/ti/davinci-evm.c                         | 39 ++++++++++++++++----
 16 files changed, 150 insertions(+), 33 deletions(-)
