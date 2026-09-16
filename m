Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2B0489883
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 21:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789593882; cv=none; b=Q6JhVId/YKsvy+haD0kR0oU/sNbwbe1nYbOYo9cn4O+VYIwKI2msnUtba5gFf5tnEvCuPyxrjCZ9IP4R4VfiiCJUJKumsqyrN5f4dMRiEBNOp6g6m9pU43EZKUmJQD8BhvLON1joMM86L4rdeZDr6HplRGTJCsc+8zAMXIf5kN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789593882; c=relaxed/simple;
	bh=htx96s3nLyB/IdXMC0KeubgVBF4kIhKYXv4UDVVgVTk=;
	h=Message-ID:From:To:Cc:Subject:Date; b=TRfD+BTkebZrPEBsqsTNBtuiuIqtZJ9yPulWnHAn7gcFZLyfAVaT3A5NdpKhkDud0pSaQmDY7VYeDW+/TBSMINkc7C3H7Pfd14DGNUJyHT7aV6NNgfJxM0DGaxBUTi3XnwFVfGfqLFLlbq7mbEOCXOH2yHBYIyPKpw1h6QU/iEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z8j8AbUe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z8j8AbUe"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 697351F00893;
	Wed, 16 Sep 2026 21:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789593854;
	bh=X/uf3IfOCUVuisGWX1+AT50pztZc6s9aO5SNjGWGG3c=;
	h=From:To:Cc:Subject:Date;
	b=Z8j8AbUeKAmXSFXGOCCl/jGOvhM62uq+cdT5e/jboBAb3OxH7zRhMmtNSpp7OsZCG
	 I2i0yVB93y9GEwhRGVWc7FanovXwzasYYy5m/yLc+fwgjNU9wUV7WFe1xYif1Oow8S
	 yUhQfk2xiu1+U8Qx+qH1Ajgu+BixIR7zlgdJwE35xNk4gJC1HpI4HPLELCb+5nyGtn
	 JzzqmXt+M/rZFendQYNB52zVAiCrtTGhx3zc6PluUQtwlfRvcJOBOMt4qJnyLXLkWp
	 sKx6OHjpYlzAPOMuRTmiRlo4IglK7O3Kle392MsMg2UIZP+Eyq1fx38yztQEOulsKo
	 t0B1kjKOsBDlg==
Message-ID: <3413f10580c07752cd34ce5a1557e8c3@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v7.3-rc3
Date: Wed, 16 Sep 2026 22:23:52 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit fd73f4a6659897191fa0d40695fe370925dd3780:

  Linux 7.3-rc3 (2026-09-13 14:38:02 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.3-rc3

for you to fetch changes up to 940e8fe8535d22ce67dd2fb9588e6c55a31d7d03:

  ASoC: adau1977: small fixes to make the driver more usable (2026-09-16 20:09:57 +0100)

----------------------------------------------------------------
ASoC: Fixes for v7.3

A relatively large pile of fixes here, a lot of driver specific stuff
that's broadly unremarkable plus a few core fixes from Richard that fix
issues where SoundWire systems with multiple CODECs on the same link
would configure the CODECs to use the same bus slots leading to broken
audio.

----------------------------------------------------------------
Ai Chao (1):
      ASoC: Intel: sof_es8336: Add a quirk for Huawei Matebook B3-420

Alvin Šipraga (3):
      ASoC: adau1977: make the Kconfig symbols user selectable
      ASoC: adau1977-spi: drop __maybe_unused and of_match_ptr()
      ASoC: adau1977-i2c: add OF match table for I2C

HyeongJun An (1):
      ASoC: hdmi-codec: Report a change when the channel status moves

Jack Yu (1):
      ASoC: rt712-sdca: reconfigure PLL2 to fix calibration time-out

Jiangshan Yi (1):
      ASoC: codecs: rt712-sdca-dmic: fix uninitialized stream_config->type

Mark Brown (3):
      ASoC: Fix missing channel fixup for codec end of ch_map
      ASoC: amd: acp: SoundWire machine driver fixes
      ASoC: adau1977: small fixes to make the driver more usable

Oder Chiou (1):
      ASoC: rt721: Reset codec to fix abnormal sound

Richard Fitzgerald (7):
      ASoC: wm_adsp: Firmware search progress log should not look like an error
      ASoC: Rename snd_soc_dai_link_ch_map.ch_mask to cpu_ch_mask
      ASoC: Add codec_ch_mask to snd_soc_dai_link_ch_map
      ASoC: soc-pcm: Apply snd_soc_dai_link_ch_map.codec_ch_mask to codec params
      ASoC: sdw_utils: Set snd_soc_dai_link_ch_map.codec_ch_mask for capture
      ASoC: sdw_utils: cs_amp: Delete bogus and incorrect capture channel fixup
      ASoC: cs-amp-lib: Prevent NULL pointer if efi variable is zero length

Sasha Levin (1):
      ASoC: ux500: Parenthesize MSP_{RX,TX}_CLKPOL_BIT() arguments

Vijendar Mukunda (4):
      ASoC: amd: acp: bounds-check SoundWire link ID in machine drivers
      ASoC: amd: acp: refactor codec config count in SOF SoundWire machine driver
      ASoC: amd: acp: fix ffs() operator precedence for SoundWire link ID
      ASoC: amd: acp: fix card name length warning in SOF SoundWire machine driver

 include/sound/soc.h                     |  3 +-
 include/sound/soc_sdw_utils.h           |  2 -
 sound/soc/amd/acp/acp-sdw-legacy-mach.c | 14 +++++-
 sound/soc/amd/acp/acp-sdw-sof-mach.c    | 23 ++++++---
 sound/soc/codecs/Kconfig                |  4 +-
 sound/soc/codecs/adau1977-i2c.c         |  9 ++++
 sound/soc/codecs/adau1977-spi.c         | 12 ++---
 sound/soc/codecs/cs-amp-lib.c           |  2 +
 sound/soc/codecs/hdmi-codec.c           |  6 ++-
 sound/soc/codecs/rt712-sdca-dmic.c      | 14 ++----
 sound/soc/codecs/rt712-sdca-sdw.c       |  8 +++
 sound/soc/codecs/rt712-sdca.c           | 86 +++++++++++++++++++++++++++++++--
 sound/soc/codecs/rt712-sdca.h           | 18 +++++++
 sound/soc/codecs/rt721-sdca-sdw.c       |  3 ++
 sound/soc/codecs/rt721-sdca.c           | 17 +++++++
 sound/soc/codecs/wm_adsp.c              |  5 +-
 sound/soc/intel/boards/sof_es8336.c     |  9 ++++
 sound/soc/sdw_utils/soc_sdw_cs_amp.c    | 46 ------------------
 sound/soc/sdw_utils/soc_sdw_utils.c     | 24 +++++----
 sound/soc/soc-pcm.c                     | 18 +++++--
 sound/soc/ux500/ux500_msp_i2s.h         |  4 +-
 21 files changed, 231 insertions(+), 96 deletions(-)
