Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0AB1854
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 12:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740573926; cv=none; b=YwQA9j/bXTs46v2HG+PnvUWtJ9RvfTGvHmJ0zGeBFvPSJkA2iNED7JpZlakjL+uGPsVMfggVN4cO0Zbs9nM36oFhwjgxRabQELHem36TIBKGb7CZNaxxL2XbiRZ+lLzAUtUBAWy76sh/Vqzn5Q6MnCiWHgNzcMknZhR90+UkLyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740573926; c=relaxed/simple;
	bh=v7ZauxEkKjGbV+nPAeMypKY9bPiXqp1EoZS0H+Hp8cY=;
	h=Message-ID:From:To:Cc:Subject:Date; b=eeRitSmOB/yr1KkJgnPrFvOeu6ckWGVMNebNZEa/2GDraWiXn52HEzs5h2o/K/sJdIzqAXeW/dYOlsuMbR6QnX5iRbthfRzOkCSVWvfiUFVznEmLzMDoQx2yqD+cXNNfJqhRzmvmKWPwXT+Uj74MOkN0cbHHw9SEH9ebHctH4QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mQ49ICta; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mQ49ICta"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09D29C4CED6;
	Wed, 26 Feb 2025 12:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740573925;
	bh=v7ZauxEkKjGbV+nPAeMypKY9bPiXqp1EoZS0H+Hp8cY=;
	h=From:To:Cc:Subject:Date:From;
	b=mQ49ICtaw8ts2wvVhA+8cOZpZ023Gz7IDReEYIMoH7pf+l/BF/75IbHZXsuMM4kYp
	 uH0X0ISsMLgWQqNsNYDvA1SfyPty3gSSM7OWHZSVmA+jZaQ+rT77HdVWYlUIhS2tD2
	 +6OkCD0zMTT81VENPfKhosmD4SnS3yKsZa4DCIHeCswL+ebopVukWr4LPpS720gKlc
	 iipgNXqQSYNto0hFUXYn6BzuSrdBYxlyz74hxnBVPr442RfZ85L+B7BLsslD64ef3p
	 afOaezCxQydv/nooSeqVszXP4356zoKXjeAjaIacRDjylEJJl+ADbqwuhYpyhGrPXB
	 H8a/oIr3u9pkw==
Message-ID: <7ff673840a72f27faae049d16ea12029.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.14-rc4
Date: Wed, 26 Feb 2025 12:45:14 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit 571b69f2f9b1ec7cf7d0e9b79e52115a87a869c4:

  ASoC: imx-audmix: remove cpu_mclk which is from cpu dai device (2025-02-13 11:34:32 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.14-rc4

for you to fetch changes up to 9da0ed4a85027063441fa1c73967cafc38f0677c:

  ASoC: Intel: don't check number of sdw links when set (2025-02-25 17:47:04 +0000)

----------------------------------------------------------------
ASoC: Fixes for v6.14

More driver specific fixes, the firmware change is part of fixing the
race conditions in the Cirrus driver.

----------------------------------------------------------------
Bard Liao (2):
      ASoC: SOF: Intel: don't check number of sdw links when set dmic_fixup
      ASoC: Intel: sof_sdw: warn both sdw and pch dmic are used

Chancel Liu (1):
      ASoC: fsl: Rename stream name of SAI DAI driver

Hector Martin (3):
      ASoC: tas2770: Fix volume scale
      ASoC: tas2764: Fix power control mask
      ASoC: tas2764: Set the SDOUT polarity correctly

Mark Brown (1):
      ASoC: Intel: don't check number of sdw links when set

Nicolas Frattaroli (2):
      ASoC: es8328: fix route from DAC to output
      ASoC: dapm-graph: set fill colour of turned on nodes

Richard Fitzgerald (2):
      firmware: cs_dsp: Remove async regmap writes
      ASoC: cs35l56: Prevent races when soft-resetting using SPI control

 drivers/firmware/cirrus/cs_dsp.c  | 24 +++---------
 include/sound/cs35l56.h           | 31 +++++++++++++++
 sound/pci/hda/cs35l56_hda_spi.c   |  3 ++
 sound/soc/codecs/cs35l56-shared.c | 80 +++++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/cs35l56-spi.c    |  3 ++
 sound/soc/codecs/es8328.c         | 15 ++------
 sound/soc/codecs/tas2764.c        | 10 ++++-
 sound/soc/codecs/tas2764.h        |  8 +++-
 sound/soc/codecs/tas2770.c        |  2 +-
 sound/soc/fsl/fsl_sai.c           |  6 +--
 sound/soc/fsl/imx-audmix.c        |  4 +-
 sound/soc/intel/boards/sof_sdw.c  |  7 ++++
 sound/soc/sof/intel/hda.c         | 18 +--------
 tools/sound/dapm-graph            |  2 +-
 14 files changed, 159 insertions(+), 54 deletions(-)
