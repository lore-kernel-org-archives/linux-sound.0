Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F363F3277
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 11:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786016978; cv=none; b=SEZ6jvXkNOXGhXJrKScicqBMnxsa++QHVL9+L4J2QbU9W9deAsZV/b6KAUdHLb4Ol90wEvJ75GfBlajtyZZKwodFkYIOg4Y2PUpse2HrSkXHYdtMwNrNY9Up2FLdTq/RUNneOreMN45c6VhpOEEh2RsvsJzfDkEegxoNz56Dz/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786016978; c=relaxed/simple;
	bh=/XkgsjRjoYk1np3ff3dGW03R0+MiJS/WNX3DIVVg75Q=;
	h=Message-ID:From:To:Cc:Subject:Date; b=av1daEWSf+bHL7s5L4h1QG70xMS23GpsKD5na9+uD5W4zLpWvf6ydbZxwjoGLYZAFQ05GCkRFzTg4whkIbnY5ElDN8HV7sD/DE4kS6za8R2d/yvye1arkztdGlzTsR0/J7SjyUSAh7PMxtFGVnx9AHw1IUO+S/HK9ApXV+I7TO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NYFv9uAp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NYFv9uAp"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 63C801F000E9;
	Thu,  6 Aug 2026 11:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786016973;
	bh=M1QM8PzIzcPMjE7kwflyMtKkaeSv4taEsNGbvr2voZ4=;
	h=From:To:Cc:Subject:Date;
	b=NYFv9uApCGS9XiuunnAD/hul+OrnVbuL2tIKzDSpNCV5X5nyTx1/woS/BJUfk2tCl
	 egx1Ev8o49BZK6HNsZwN+6oPbLEbB2dpxwWfg3MlMc9Cjn4wI7YkgzFR3MiJUt8AbZ
	 v3/y+/9vaJOtRQAp+nYyKtMzt6CDUTk9RC7caGnuKgUIJB8NgPSbkTSFwJzzfZhXd1
	 TUADO3jyzzclH89Xl99U0MijG4DRXIs0Pud6bIdjUPVmY0Jx1GkCEHm7ijYq2/URcs
	 BWvkFEmZ50+qhQbievNPFlqu7LUe8L/pMk8AwPn1Xif1th1i/b3QBEkGFjlD2l2JMg
	 E+2zqjLZR+AGQ==
Message-ID: <2f848fd70985d9c1bbee65eb39a99b4f@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v7.2-rc6
Date: Thu, 06 Aug 2026 12:49:27 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit 075b74841bd0065a3bda3440873c747938e69b68:

  Linux 7.2-rc6 (2026-08-02 16:24:24 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.2-rc6

for you to fetch changes up to 33c5aaf693d3fb78f6b8a9658939b72b7638243d:

  ASoC: cs35l41/cs35l45/cs4265: sort the reg_defaults tables (2026-08-05 13:34:37 +0100)

----------------------------------------------------------------
ASoC: Fixes for v7.2

A moderately large set of fixes, but mostly unremarkable:

 - A series of robustness fixes for the SOF code that came from testing.
 - Fixes for user visible issues with some of the Qualcomm controls.
 - Fixes to the register default tables in Cirrus drivers which ensure
   correcy syncing on resume.  This is a wider problem which will be
   fixed with a regmap core change but I'd already applied these, the
   rest of the fixes will come in the merge window.
 - Making the existing RT645 driver user selectable so it can be used
   with more machines.
 - Quite a few new AMD laptop quirks.
 - A MAINTAINERS update for SpacemiT.

----------------------------------------------------------------
Bard Liao (2):
      ASoC: SOF: topology: Use acpi mach from the machine driver
      ASoC/soundwire: Intel: reset the PCMSyCM registers in hda_sdw_bpt_close

Dawid Wróbel (2):
      ASoC: codecs: lpass-tx-macro: Fix enum kcontrol accesses
      ASoC: codecs: lpass-wsa-macro: Fix enum kcontrol accesses

Mark Brown (2):
      ASoC: codecs: lpass-{tx,wsa}-macro: fix enum kcontrol accesses
      ASoC: cs35l41/cs35l45/cs4265: sort the reg_defaults tables

Peter Ujfalusi (6):
      ASoC: SOF: ipc4-topology: Refresh copier IPC payload before widget setup
      ASoC: SOF: sof-audio: Fix error path in sof_widget_setup_unlocked()
      ASoC: SOF: ipc4-pcm: Continue the pipeline trigger in case of IPC timeout
      ASoC: cs35l41: sort the register default table
      ASoC: cs35l45: sort the register default table
      ASoC: cs4265: sort the register default table

Rudi Heitbaum (1):
      ASoC: rt5645: Make the Kconfig symbol user selectable

Troy Mitchell (1):
      MAINTAINERS: add SpacemiT K1/K3 I2S entry

Zhang Heng (3):
      ASoC: amd: yc: Add DMI quirk for HP Victus Laptop 16-e1xxx
      ASoC: amd: yc: Add DMI quirk for Xiaomi RedmiBook 16 2025
      ASoC: amd: yc: Add DMI quirk for MSI Raider A18 HX A7VHG

 MAINTAINERS                                        |  6 ++++
 drivers/soundwire/intel_ace2x.c                    |  4 ++-
 include/sound/hda-sdw-bpt.h                        |  5 ++--
 sound/soc/amd/yc/acp6x-mach.c                      | 22 ++++++++++++++-
 sound/soc/codecs/Kconfig                           |  2 +-
 sound/soc/codecs/cs35l41-lib.c                     |  2 +-
 sound/soc/codecs/cs35l45-tables.c                  | 32 ++++++++++-----------
 sound/soc/codecs/cs4265.c                          |  4 +--
 sound/soc/codecs/lpass-tx-macro.c                  |  4 +--
 sound/soc/codecs/lpass-wsa-macro.c                 |  8 +++---
 sound/soc/intel/common/sof-function-topology-lib.c |  7 ++++-
 sound/soc/sof/intel/hda-sdw-bpt.c                  | 31 ++++++++++++++++++--
 sound/soc/sof/ipc4-pcm.c                           | 25 ++++++++++++----
 sound/soc/sof/ipc4-topology.c                      | 33 ++++++++++++++++++++++
 sound/soc/sof/sof-audio.c                          |  9 +++---
 15 files changed, 149 insertions(+), 45 deletions(-)
