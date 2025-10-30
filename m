Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B847723D7D4
	for <linux-sound@vger.kernel.org>; Thu, 30 Oct 2025 11:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761824002; cv=none; b=Aspvu6OVvNRM9pDVszaRtzYml/+D1TAx7FRW5Ezb4SSLJMp0Vy279P2AsKvcWsi89fBDWkbZh42FPom4zs3jsfASdlHtrwxNmsBt7oNgk3S7lNSC5IfynCbgthEx0lZbKlM7usNrvpu5sTY02GTRF9SXj+zCoZM+hzC6JLWUJG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761824002; c=relaxed/simple;
	bh=A2EXzEfFIDj3kCbeKHlD4mRCBPWGMPgbKkBT9SNZlXU=;
	h=Message-ID:From:To:Cc:Subject:Date; b=Fk17mOTtdnUU4KIamndccyP7su1qe4D8AGQAWPlGhvJPW2tQbE4VrwjgB86N1JhK7IopIYXDjDzq/yRRWDP6Wr8XAM676K8/i0i811je6/h8F8s+UQMJ2IFgm2COW5kTsOiJnPnVU1VU/iFBl/dv/wJ/jmJxXCoWoLCM566S3Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IrjkNu1g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IrjkNu1g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8177C4CEF1;
	Thu, 30 Oct 2025 11:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761824001;
	bh=A2EXzEfFIDj3kCbeKHlD4mRCBPWGMPgbKkBT9SNZlXU=;
	h=From:To:Cc:Subject:Date:From;
	b=IrjkNu1g1E6Bb/SUllOiU3zQbupn/vEwxoU4OCCjlNxaEdmeNNoTJfQQeNoTn67bk
	 rwjmjpFhIwhRpOOkpAWWsxiI/Dz5o77HErsJBUzrgg6ZNQTSYsOdAxNHp+M5ZQRmUP
	 lBoFKkGuBSv1Yf7g+Ma8Bq7KumJxGhwWlwhv3f3z+Zct7FXqJseZ3dLpguvvUMkT66
	 f63zl2BKGXAjAXRDnp112HE9uBQAbf73apfR1NxVhrAAEfI2iSKXP1ATkTE3N9tg/J
	 AN5C8BqNS+FYwTwAHRNE2BLJYsTVLKer5K5n2L7+QkQNRt6v7gDH9iohJH5zrknmrT
	 H8jM4NDEJYuLA==
Message-ID: <741e6973e073ce0ea4f6e17d7b1b080e@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.18-rc2
Date: Thu, 30 Oct 2025 11:33:11 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit 211ddde0823f1442e4ad052a2f30f050145ccada:

  Linux 6.18-rc2 (2025-10-19 15:19:16 -1000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.18-rc2

for you to fetch changes up to 5e5c8aa73d99f1daa9f2ec1474b7fc1a6952764b:

  ASoC: dt-bindings: pm4125-sdw: correct number of soundwire ports (2025-10-29 14:54:47 +0000)

----------------------------------------------------------------
ASoC: Fixes for v6.18

A bigger batch of fixes than I'd like, things built up due to holidays
and some last minute issues which caused me to hold off on sending a pul
request.  None of these are super remarkable, and there's a few new
device IDs in here too including a relatively big block of AMD devices.

The Cirrus Logic CS530x support subject line is actually a fix that was
on the start of that series and got pulled in here, I forgot to fix the
subject up when merging.

----------------------------------------------------------------
Bard Liao (1):
      ASoC: soc_sdw_utils: remove cs42l43 component_name

Cezary Rojewski (3):
      ASoC: Intel: avs: Unprepare a stream when XRUN occurs
      ASoC: Intel: avs: Disable periods-elapsed work when closing PCM
      ASoC: Intel: avs: Use snd_codec format when initializing probe

Claudiu Beznea (1):
      ASoC: renesas: rz-ssi: Use proper dma_buffer_pos after resume

Haotian Zhang (1):
      ASoC: mediatek: Fix double pm_runtime_disable in remove functions

Maarten Zanders (1):
      ASoC: fsl_sai: Fix sync error in consumer mode

Mark Brown (4):
      Add support for Cirrus Logic CS530x DAC and CODEC
      ASoC: Intel: avs: Set of streaming fixes
      ASoC: fsl: correct the bit order issue for DSD
      ASoC: Fix build for sdw_utils

Richard Fitzgerald (1):
      ASoC: cs-amp-lib-test: Fix missing include of kunit/test-bug.h

Sharique Mohammad (1):
      ASOC: max98090/91: fix for filter configuration: AHPF removed DMIC2_HPF added

Shengjiu Wang (2):
      ASoC: fsl_sai: fix bit order for DSD format
      ASoC: fsl_micfil: correct the endian format for DSD

Shuming Fan (2):
      ASoC: sdw_utils: add name_prefix for rt1321 part id
      ASoC: rt721: fix prepare clock stop failed

Simon Trimmer (3):
      ASoC: cs530x: Correct log message with expected variable
      ASoC: amd: acp: Add ACP7.0 match entries for cs35l56 and cs42l43
      ASoC: Intel: soc-acpi-intel-ptl-match: Remove cs42l43 match from sdw link3

Srinivas Kandagatla (2):
      ASoC: qdsp6: q6asm: do not sleep while atomic
      ASoC: dt-bindings: pm4125-sdw: correct number of soundwire ports

 .../devicetree/bindings/sound/qcom,pm4125-sdw.yaml |   4 +-
 sound/soc/amd/acp/amd-acp70-acpi-match.c           | 157 +++++++++++++++++++++
 sound/soc/codecs/cs-amp-lib-test.c                 |   1 +
 sound/soc/codecs/cs530x.c                          |   2 +-
 sound/soc/codecs/max98090.c                        |   6 +-
 sound/soc/codecs/rt721-sdca.c                      |   4 +
 sound/soc/codecs/rt721-sdca.h                      |   1 +
 sound/soc/fsl/fsl_micfil.c                         |   4 +-
 sound/soc/fsl/fsl_sai.c                            |  11 +-
 sound/soc/intel/avs/pcm.c                          |   3 +
 sound/soc/intel/avs/probes.c                       |  18 +--
 sound/soc/intel/common/soc-acpi-intel-ptl-match.c  |  52 -------
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c         |   1 -
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c         |   1 -
 sound/soc/qcom/qdsp6/q6asm.c                       |   2 +-
 sound/soc/renesas/rz-ssi.c                         |  25 ++--
 sound/soc/sdw_utils/soc_sdw_utils.c                |   1 -
 17 files changed, 203 insertions(+), 90 deletions(-)
