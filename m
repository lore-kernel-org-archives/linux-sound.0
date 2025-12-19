Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739DC33D6C4
	for <linux-sound@vger.kernel.org>; Fri, 19 Dec 2025 15:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766157931; cv=none; b=Nm8WAIgCjW6JBqETB6JUNRTQY3F1ifYRQnLs213ZngQHH2Uwvo2wnasuzbF0ecV2ROhwwzdxU6OItJADnOKFnz0UFBBZRqN4i1bqBzzJQel7od4nEDLui5IonTrwF19c1U2fUVsjIDaL8INke1zD03p7sxvAtFinPmiQAyNeo/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766157931; c=relaxed/simple;
	bh=j1GOTP4uW+ablI4hgNqOr9maHcvcticbqrr0oiC53Lk=;
	h=Message-ID:From:To:Cc:Subject:Date; b=KhLNICRXKZRgNu+vJSlINO4/eQYaAxxUXRWhP4P360DHT28gxuT4OofjmzgYg4e/MnkGDbnvt/1N7El/KRB3YBVd8FL3e0m+E/BWeM7TySZ0EwSv/K2GSeD5HaDTCFFwQaPABDk5xNPslDo5gBlkK3Ujg/VK5E55vh+8r7ITAfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nyX7FEpw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nyX7FEpw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9743EC113D0;
	Fri, 19 Dec 2025 15:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766157931;
	bh=j1GOTP4uW+ablI4hgNqOr9maHcvcticbqrr0oiC53Lk=;
	h=From:To:Cc:Subject:Date:From;
	b=nyX7FEpwkg7JE399N61Ilfq3PAB+7QFOoeShUwdERSdxBhVb15FaMW9sB3gSZFIJY
	 iJt9GuMPHKPLfgA09dHvDHpKzWJ9rZ7wePL2NpiuIPbbOlck8EnUcWMob4k4Afqu/p
	 zEfAKXSGNncb/EH8X1c31cvi/ri/19aNwKQIxSFypXkWfwOl47hIIyWck9C5YEGQVo
	 DPtbiIIqGOb9D7tf7gwNO0gyoLvU9RaVcHcwnLM1I17aW5Um5hS6IhejbwQnKb7N8e
	 vFyMMoBigZI/KPDgwlaa7iZWoJdc6TwTKM5gaUQF4fBCDYfkaUQ64IIr/+hN50e2aL
	 jJAmRZ3DpTEdQ==
Message-ID: <00e012c86db2f59544afb66176c25978@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.19-rc1
Date: Fri, 19 Dec 2025 15:25:22 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.19-rc1

for you to fetch changes up to 56d953a8d0da5e53c2594edde23465ec49385b1c:

  ASoC: Intel: mtl-match: Add 6-amp matches for CS35L56 (2025-12-19 13:25:16 +0000)

----------------------------------------------------------------
ASoC: Fixes for v6.19

We've been quite busy with fixes since the merge window, though not in
any particularly exciting ways - the standout thing is the fix for _SX
controls which were broken by a change to how we do clamping, otherwise
it's all fairly run of the mill fixes and quirks.

----------------------------------------------------------------
Alexander Stein (4):
      ASoC: fsl_easrc: fix duplicate debugfs directory error
      ASoC: fsl_asrc_dma: fix duplicate debugfs directory error
      ASoC: fsl_sai: Add missing registers to cache default
      ASoC: fsl_xcvr: provide regmap names

Andrew Elantsev (1):
      ASoC: amd: yc: Add quirk for Honor MagicBook X16 2025

Bard Liao (2):
      ASoC: sdw_utils: subtract the endpoint that is not present
      ASoC: SOF: ipc4-topology: set playback channel mask

Chancel Liu (2):
      ASoC: fsl_sai: Constrain sample rates from audio PLLs only in master mode
      ASoC: fsl-asoc-card: Use of_property_present() for non-boolean properties

Mark Brown (4):
      ASoC: Intel: common / SOF: Use function topologies for
      ASoC: SOF: ipc4-topology: fixes for 'exotic' format
      ASoC: fsl_easrc: Fix duplicate debufs entries
      ASoC: Intel: mtl-match: Add 6-amp matches for CS35L56

Peter Ujfalusi (6):
      ASoC: SOF: ipc4-topology: Prefer 32-bit DMIC blobs for 8-bit formats as well
      ASoC: SOF: ipc4-topology: Convert FLOAT to S32 during blob selection
      ASoC: SOF: topology: Add context when sink or source widget is missing
      ASoC: SOF: Intel: pci-mtl: Change the topology path to intel/sof-ipc4-tplg
      ASoC: soc-acpi / SOF: Add best_effort flag to get_function_tplg_files op
      ASoC: Intel: soc-acpi-intel-nvl-match: Drop rt722 l3 from the match table

Robert Oscilowski (1):
      ASoC: qcom: sdm845: set quaternary MI2S codec DAI to I2S format

Shengjiu Wang (1):
      ASoC: ak4458: remove the reset operation in probe and remove

Shuming Fan (1):
      ASoC: rt1320: update VC blind write settings

Stefan Binding (3):
      ASoC: Intel: soc-acpi-intel-mtl-match: Add 6 amp CS35L56 with feedback
      ASoC: Intel: soc-acpi-intel-mtl-match: Add 6 amp CS35L63 with feedback
      ASoC: ops: fix snd_soc_get_volsw for sx controls

sheetal (1):
      ASoC: tegra: Fix uninitialized flat cache warning in tegra210_ahub

 include/sound/soc-acpi.h                           |   5 +-
 sound/soc/amd/yc/acp6x-mach.c                      |   7 ++
 sound/soc/codecs/ak4458.c                          |   4 -
 sound/soc/codecs/rt1320-sdw.c                      |  16 ++--
 sound/soc/fsl/fsl-asoc-card.c                      |   8 +-
 sound/soc/fsl/fsl_asrc_dma.c                       |   3 +
 sound/soc/fsl/fsl_easrc.c                          |   3 +
 sound/soc/fsl/fsl_sai.c                            |  13 ++-
 sound/soc/fsl/fsl_xcvr.c                           |   3 +
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c  | 104 +++++++++++++++++++++
 sound/soc/intel/common/soc-acpi-intel-nvl-match.c  |  49 ----------
 sound/soc/intel/common/sof-function-topology-lib.c |   5 +-
 sound/soc/intel/common/sof-function-topology-lib.h |   2 +-
 sound/soc/qcom/sdm845.c                            |   2 +
 sound/soc/sdw_utils/soc_sdw_utils.c                |   8 +-
 sound/soc/soc-ops.c                                |  32 ++++---
 sound/soc/sof/intel/pci-mtl.c                      |   6 +-
 sound/soc/sof/ipc4-topology.c                      |  49 ++++++----
 sound/soc/sof/topology.c                           |  26 +++++-
 sound/soc/tegra/tegra210_ahub.c                    |   6 +-
 20 files changed, 238 insertions(+), 113 deletions(-)
