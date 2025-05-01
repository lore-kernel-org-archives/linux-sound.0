Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE1126AA83
	for <linux-sound@vger.kernel.org>; Thu,  1 May 2025 06:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746081887; cv=none; b=NriF5Qcp1TxiI6aWY42dj9g2WFfs3ZM7pImSuohSEMwXAO1gmUin3qxYawoPN8q7MV7t+9gmNJpY714zMI6bSXGAVnB6F8+B4961QFzPwa2KRAHIbNf5Ke6bmTR8BZc7h7CUzeDqpf/IjAAPTLf5z0GvVYd6PmbHdfOR/K8bzd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746081887; c=relaxed/simple;
	bh=FwuuH2YL5+o+HLp5Qc8KkE+mG5RQFrP51QAElnK7X+Y=;
	h=Message-ID:From:To:Cc:Subject:Date; b=EJyLyr/dV8+ep8d1SKUQfaenawpWJOa6iKSQq/Bdy6c8saeEJ4eCdJdSt4AWSg1fvdWmpRVjr6ng/FyQ0w19v47hvHE0SBKHOU/hNQOqA4eKE1BfgkCiDhfLSVrrUvH5XiIeHggJFrNb0TR1A9BMJzyzwdlh75WKt5M+YvJGFVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pUbBH5TX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pUbBH5TX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CE59C4CEE3;
	Thu,  1 May 2025 06:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746081885;
	bh=FwuuH2YL5+o+HLp5Qc8KkE+mG5RQFrP51QAElnK7X+Y=;
	h=From:To:Cc:Subject:Date:From;
	b=pUbBH5TX7YK2c50axQwylCltW/TcPJ4EEcDFpimgBxqpjxU3CKnJsI4Dk9SJ3n7Xl
	 GyfNt0b+XGRi5IKImzWtDwMoKxsHWbMUPBYl6tcw3x/JGjYF4v5NS5VfNbMWN8NeyE
	 cVviNvakxcEKCPBMVh46EIfhKgU86tK8ZcQOLHv4Dwqj7ND3wIpUEC83FW6Gy/0n+P
	 aJKQ0nh7TUhBu90+4gHFmAlkv8RE3aWZPPieTkkLH7oBTdND+WMmMqQSiOnAHCQl9S
	 j5yG2cmLDRYwbXCaTH77+YR9BRK0Xl6BUDLbHYLzwlG85ltxNICDmfjG75sNQieo1O
	 svnZxG8qVnhsw==
Message-ID: <a6bd31a7255c121ca11bbdf066134f83.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.15-rc4
Date: Thu, 01 May 2025 15:44:37 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit b4432656b36e5cc1d50a1f2dc15357543add530e:

  Linux 6.15-rc4 (2025-04-27 15:19:23 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.15-rc4

for you to fetch changes up to 315c84567001aec7f7b74a0dbd4fce3e1c5cbd87:

  ASoC: intel/sdw_utils: Add volume limits to CS35L56 (2025-05-01 14:43:52 +0900)

----------------------------------------------------------------
ASoC: Fixes for v6.15

A moderately large batch of fixes for v6.15, many driver specific
including cleanups for the enabling of the Cirrus KUnit tests and a fix
for a nasty crash on resume on AMD systems.  We also have one core fix,
for an ordering issue between DAPM and DPCM which could leave things
incorrectly unpowered.

----------------------------------------------------------------
Alexander Stein (1):
      ASoC: simple-card-utils: Fix pointer check in graph_util_parse_link_direction

Arnd Bergmann (1):
      ASoC: Intel: catpt: avoid type mismatch in dev_dbg() format

Bard Liao (1):
      ASoC: soc-acpi-intel-ptl-match: add empty item to ptl_cs42l43_l3[]

Charles Keepax (1):
      ASoC: cs42l43: Disable headphone clamps during type detection

Chenyuan Yang (2):
      ASoC: imx-card: Adjust over allocation of memory in imx_card_parse_of()
      ASoC: Intel: sof_sdw: Add NULL check in asoc_sdw_rt_dmic_rtd_init()

Claudiu Beznea (1):
      ASoC: renesas: rz-ssi: Use NOIRQ_SYSTEM_SLEEP_PM_OPS()

Mark Brown (3):
      Fix up building KUnit tests for Cirrus Logic modules
      ASoC: stm32: sai: fix kernel rate configuration
      ASoC: intel/sdw_utils: Add volume limits to CS35L56

Nico Pache (1):
      firmware: cs_dsp: tests: Depend on FW_CS_DSP rather then enabling it

Olivier Moysan (2):
      ASoC: stm32: sai: skip useless iterations on kernel rate loop
      ASoC: stm32: sai: add a check on minimal kernel frequency

Richard Fitzgerald (3):
      kunit: configs: Add some Cirrus Logic modules to all_tests
      ASoC: cs-amp-lib-test: Don't select SND_SOC_CS_AMP_LIB
      ASoC: Add Cirrus and Wolfson headers to ASoC section of MAINTAINERS

Sheetal (1):
      ASoC: soc-pcm: Fix hw_params() and DAPM widget sequence

Stefan Binding (2):
      ASoC: intel/sdw_utils: Add volume limit to cs42l43 speakers
      ASoC: intel/sdw_utils: Add volume limit to cs35l56 speakers

Takashi Iwai (1):
      ASoC: Intel: bytcr_rt5640: Add DMI quirk for Acer Aspire SW3-013

Venkata Prasad Potturu (3):
      ASoC: amd: acp: Fix NULL pointer deref on acp resume path
      ASoC: amd: acp: Fix NULL pointer deref in acp_i2s_set_tdm_slot
      ASoC: amd: acp: Fix devm_snd_soc_register_card(acp-pdm-mach) failure

Vijendar Mukunda (1):
      ASoC: amd: ps: fix for irq handler return status

 MAINTAINERS                                       |  6 ++++++
 drivers/firmware/cirrus/Kconfig                   |  5 +----
 include/sound/soc_sdw_utils.h                     |  1 +
 sound/soc/amd/acp/acp-i2s.c                       |  2 +-
 sound/soc/amd/acp/acp-legacy-common.c             |  2 +-
 sound/soc/amd/acp/acp-rembrandt.c                 |  2 +-
 sound/soc/amd/acp/acp-renoir.c                    |  2 +-
 sound/soc/amd/acp/acp63.c                         |  2 +-
 sound/soc/amd/acp/acp70.c                         |  2 +-
 sound/soc/amd/ps/pci-ps.c                         |  5 +++--
 sound/soc/codecs/Kconfig                          |  5 ++---
 sound/soc/codecs/cs42l43-jack.c                   |  7 +++++++
 sound/soc/fsl/imx-card.c                          |  2 +-
 sound/soc/generic/simple-card-utils.c             |  4 ++--
 sound/soc/intel/boards/bytcr_rt5640.c             | 13 ++++++++++++
 sound/soc/intel/catpt/dsp.c                       |  2 +-
 sound/soc/intel/common/soc-acpi-intel-ptl-match.c |  3 ++-
 sound/soc/renesas/rz-ssi.c                        |  2 +-
 sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c      |  4 ++++
 sound/soc/sdw_utils/soc_sdw_cs42l43.c             | 10 ++++++++++
 sound/soc/sdw_utils/soc_sdw_cs_amp.c              | 24 +++++++++++++++++++++++
 sound/soc/sdw_utils/soc_sdw_rt_dmic.c             |  2 ++
 sound/soc/soc-pcm.c                               |  5 ++++-
 sound/soc/stm/stm32_sai_sub.c                     | 16 ++++++++++-----
 tools/testing/kunit/configs/all_tests.config      |  2 ++
 25 files changed, 103 insertions(+), 27 deletions(-)
