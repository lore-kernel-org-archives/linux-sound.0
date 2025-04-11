Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B42026AD9
	for <linux-sound@vger.kernel.org>; Fri, 11 Apr 2025 11:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744372393; cv=none; b=tGyXiSvDOFe6K1mB/e0JsCuD0ZTpLsLaUVs56nyIAkdNMkoRUXFR/rODGEgWxbgfX7u8z8onQhx+/jQDt2F5gAuF/JNyUf4Y5DycWv3ZeCpwRll5IOxyO9ZRv+1ejV1jCF9NyBSUr/Q+sTdVKNnjssvBCoAksqco9HmCcIIDyp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744372393; c=relaxed/simple;
	bh=6ABG1ZFmbBEXp5NO6ilg/AqZBi8gpFC8O1zgkDOQYJk=;
	h=Message-ID:From:To:Cc:Subject:Date; b=lsqDUoLdLWGm8i1wUYurxE4tmsYgvECY38QefMXAX/EBSW1fyqeQvP88JIfMCx/U4PG/4kdnbT8dozJzBLNK3mV7fG1bGO4JthQSVZerFrbpdyKmN4PpN9i/liHBoOcsOlOUZ01YB/LmBG4NpZwbuee6fjQw6B2aFEp4rT7nEjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sCVmRcQA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sCVmRcQA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97435C4CEE2;
	Fri, 11 Apr 2025 11:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744372393;
	bh=6ABG1ZFmbBEXp5NO6ilg/AqZBi8gpFC8O1zgkDOQYJk=;
	h=From:To:Cc:Subject:Date:From;
	b=sCVmRcQASDHO7DFYUwml4/+IF3uDLXKLfapYijqpiIRg4/zCas3TzJTzcrbhQOSiS
	 F/3sLLKn/vR9fg0BAv5WAF/1WhJErBSWtzjnGaKnyYmKngZUSdmMnUaW3bu6rKH5i4
	 AY7G0s/Fw1/rKFmD/nGtTIpSlrwFYM1K7oAICmnoLYzRRc79Tz6HUoElLzkWeHQJ9x
	 TE3Glmjm26/NAxSrQiToZPeH/K9KEsm/PcnPrElvqjfnW5qWbc80RjAQc5hxPsQYBE
	 zpDCgS/kE2rFWQhwN3HZ0Cw168MoXdaqrpjGbTU7KZWrU1Lg+eNHDkGE+u8HiUaRz+
	 2KxWzPC37+2uw==
Message-ID: <4188eaa8e7f745f659ea1adbc4cf3375.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.15-rc1
Date: Fri, 11 Apr 2025 12:53:04 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.15-rc1

for you to fetch changes up to e6c4618422a25cb266bf752040eb509865caeb0e:

  MAINTAINERS: update my email address (2025-04-11 06:17:24 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.15

A set of small fixes, quirks and device ID additions that came in since
-rc1, none of them super stand out.  There's also a change to Srini's
email address in MAINTAINERS.

----------------------------------------------------------------
Amadeusz Sławiński (1):
      ASoC: Intel: avs: Constrain path based on BE capabilities

Brady Norander (1):
      ASoC: dwc: always enable/disable i2s irqs

Charles Keepax (1):
      ASoC: cs42l43: Reset clamp override on jack removal

Evgeny Pimenov (1):
      ASoC: qcom: Fix sc7280 lpass potential buffer overflow

Henry Martin (1):
      ASoC: Intel: avs: Fix null-ptr-deref in avs_component_probe()

Herve Codina (1):
      ASoC: fsl: fsl_qmc_audio: Reset audio data pointers on TRIGGER_START event

Kuninori Morimoto (1):
      ASoC: hdmi-codec: use RTD ID instead of DAI ID for ELD entry

Mark Brown (2):
      ASoC: codecs: lpass-wsa: fix VI capture setup.
      MAINTAINERS: update my email address

Peter Ujfalusi (1):
      ASoC: Intel: sof_sdw: Add quirk for Asus Zenbook S16

Richard Fitzgerald (1):
      firmware: cs_dsp: test_bin_error: Fix uninitialized data used as fw version

Shengjiu Wang (1):
      ASoC: fsl_asrc_dma: get codec or cpu dai from backend

Srinivas Kandagatla (4):
      ASoC: codecs:lpass-wsa-macro: Fix vi feedback rate
      ASoC: codecs:lpass-wsa-macro: Fix logic of enabling vi channels
      MAINTAINERS: use kernel.org alias
      mailmap: Add entry for Srinivas Kandagatla

Weidong Wang (1):
      ASoC: codecs: Add of_match_table for aw888081 driver

 .mailmap                                           |   2 +
 MAINTAINERS                                        |   8 +-
 .../firmware/cirrus/test/cs_dsp_mock_mem_maps.c    |  30 ------
 drivers/firmware/cirrus/test/cs_dsp_test_bin.c     |   2 +-
 .../firmware/cirrus/test/cs_dsp_test_bin_error.c   |   2 +-
 include/linux/firmware/cirrus/cs_dsp_test_utils.h  |   1 -
 sound/soc/codecs/aw88081.c                         |  10 ++
 sound/soc/codecs/cs42l43-jack.c                    |   3 +
 sound/soc/codecs/hdmi-codec.c                      |  22 +++-
 sound/soc/codecs/lpass-wsa-macro.c                 | 117 +++++++++++++++------
 sound/soc/dwc/dwc-i2s.c                            |  13 ++-
 sound/soc/fsl/fsl_asrc_dma.c                       |  15 ++-
 sound/soc/fsl/fsl_qmc_audio.c                      |   3 +
 sound/soc/intel/avs/path.c                         |  72 +++++++++++++
 sound/soc/intel/avs/path.h                         |   5 +
 sound/soc/intel/avs/pcm.c                          |  52 ++++++++-
 sound/soc/intel/boards/sof_sdw.c                   |   1 +
 sound/soc/qcom/lpass.h                             |   3 +-
 18 files changed, 277 insertions(+), 84 deletions(-)
