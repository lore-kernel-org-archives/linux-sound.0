Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86F82F850
	for <linux-sound@vger.kernel.org>; Thu, 19 Jun 2025 23:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750376239; cv=none; b=Axv5lWX3pmklmACMO83owGfyk9tYmE664kk8tvIiJgVv6TvdYEw79cTMKrh8syyLBhmgYvv54Wvj6ztiF6JNrvq5Nt5/EZhHfQysQdh0UeGNbMpMIwr+HGGklTXC8FEI366PaNh7KScieoK5KBt3belgUIc2/b1uu8FaGfDdyVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750376239; c=relaxed/simple;
	bh=mH12jWWluXRRwZD7QEzNZHCQHjLlIjgmw0TrxfS7y9A=;
	h=Message-ID:From:To:Cc:Subject:Date; b=hYp8r2e8NMD2LcAkJbS7wvJELnmVo/3g4U3/F4vIz2Amcgr7qy42OKF9y9DEZjRQiDtuWDaphY9Aogm6lDMNBvriiS4o7LZfCmK6ZHIB3kraz6WVq9jBBO9XZEgj0HmOyJVfAaAgkMKE7WGFqI3LpRvwEaCUSDF/Eg13kqvPtKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fII+UbVH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fII+UbVH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADB2DC4CEEA;
	Thu, 19 Jun 2025 23:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750376236;
	bh=mH12jWWluXRRwZD7QEzNZHCQHjLlIjgmw0TrxfS7y9A=;
	h=From:To:Cc:Subject:Date:From;
	b=fII+UbVHZtW0TzCFiR+Kj0iR36Ax3dhnc9BYh02cYhmH9RisqVCDxdZR7+KxlVlwK
	 ShWmx4LKjfpdXLMcxWaWLLeXnuC+pDUALSRwa56nJHd/UNmWgyX5kvQQ0ZPyBUzO/f
	 9AaCl3g6wUhkcwQ07ty9MQMmrFxvQSbH5spEzjEIW06F1SwmescAFf6amCRhc2W0G3
	 ODvU2PqCSc/iu5OJ3xhQo+1/bEDNpYR5An2wvEINsXfL+ymoGGTfT8u3DdXq/Uf1Nv
	 kppx+ty0dsnvts/iCM4hdhTBlMDmoif2HB7g8VHV7QSXoQTpnEph5jdMCtRdMPtrTL
	 pU1qNOzdSiFIg==
Message-ID: <fc4f65933b6ff395ce609f920dab47fc.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.16-rc2
Date: Fri, 20 Jun 2025 00:37:07 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.16-rc2

for you to fetch changes up to 16ea4666bbb7f5bd1130fa2d75631ccf8b62362e:

  ASoC: Intel: sof-function-topology-lib: Print out the unsupported dmic count (2025-06-19 15:44:42 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.16

A relatively large collection of fixes and updates that came in since
the merge window.  Of note are a couple of Cirrus ones which change the
firmware naming for some newly added devices, and a fix from Laurentiu
for issues booting firmwares on the DSPs on i.MX8 SoCs.

----------------------------------------------------------------
Gabriel Santese (1):
      ASoC: amd: yc: Add quirk for MSI Bravo 17 D7VF internal mic

Harshit Mogalapalli (1):
      ASoC: cs48l32: Fix a signedness bug in cs48l32_hw_params()

Huacai Chen (1):
      ASoC: loongson: Fix build warnings about export.h

Laurentiu Mihalcea (1):
      ASoC: SOF: imx8: add core shutdown operation for imx8/imx8x

Mark Brown (1):
      ASoC: cs35l56: Change firmware filenames for SoundWire

Peter Ujfalusi (1):
      ASoC: Intel: sof-function-topology-lib: Print out the unsupported dmic count

Raven Black (1):
      ASoC: amd: yc: update quirk data for HP Victus

Richard Fitzgerald (4):
      ASoC: cs35l56: Use SoundWire address as firmware name suffix for new silicon
      ASoC: cs35l56: Use SoundWire address as alternate firmware suffix on L56 B0
      ASoC: doc: cs35l56: Update to add new SoundWire firmware filename suffix
      ASoC: doc: cs35l56: Add CS35L63 to the list of supported devices

Sven Peter (1):
      ASoC: apple: mca: Drop default ARCH_APPLE in Kconfig

Thorsten Blum (1):
      ASoC: sdw_utils: Fix potential NULL pointer deref in is_sdca_endpoint_present()

Zhang Yi (1):
      ASoC: codecs: ES8326: Modify initialization configuration

 Documentation/sound/codecs/cs35l56.rst             | 24 ++++++--
 sound/soc/amd/yc/acp6x-mach.c                      | 14 +++++
 sound/soc/apple/Kconfig                            |  1 -
 sound/soc/codecs/cs35l56-sdw.c                     | 18 +++---
 sound/soc/codecs/cs35l56.c                         | 72 +++++++++++++++++++---
 sound/soc/codecs/cs35l56.h                         |  3 +
 sound/soc/codecs/cs48l32.c                         |  4 ++
 sound/soc/codecs/es8326.c                          |  3 +-
 sound/soc/codecs/wm_adsp.c                         | 27 +++++---
 sound/soc/codecs/wm_adsp.h                         |  2 +
 sound/soc/intel/common/sof-function-topology-lib.c |  3 +-
 sound/soc/loongson/loongson_i2s.c                  |  1 +
 sound/soc/sdw_utils/soc_sdw_utils.c                |  2 +
 sound/soc/sof/imx/imx8.c                           | 15 +++++
 14 files changed, 154 insertions(+), 35 deletions(-)
