Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD7A21C173
	for <linux-sound@vger.kernel.org>; Thu, 16 Oct 2025 17:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760634252; cv=none; b=I3x3E31O+TrxFT+EFYfUuZaMTsj/3hwG5uBLc4357KO5D4kSoKWmyyjYG9BlMgL9eEZGt5ng2M3XzxJ5i2ZHCZ+iY0UcxMHQKiI3z30+KGrb31JdYbHThboWQe1siq/4+u6UC0c/TPuLxFnnhzawadL10JkTmz87dB2AyiSKXQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760634252; c=relaxed/simple;
	bh=AZDRJ6u8NLAI0+WZkR6rDMpVycU/yadnAjlDLNNuHr0=;
	h=Message-ID:From:To:Cc:Subject:Date; b=kz21ZcxILEpYUQVHFtR1jnhCiZaCcOLoccF9zo/Z52oShVnVDowMbj+aRIPLOJN1QTP/YZxrqfDngdYf9R7zn/+M4LFxZnDtpUb4bu3szzZ7br+a8JRREyyDwKHwXj10Q3aC/sh76rQT6T/7pXQQThPjljEj3QNZAO4mUm+QGPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JZK6rCOq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JZK6rCOq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 782DDC4CEFB;
	Thu, 16 Oct 2025 17:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760634252;
	bh=AZDRJ6u8NLAI0+WZkR6rDMpVycU/yadnAjlDLNNuHr0=;
	h=From:To:Cc:Subject:Date:From;
	b=JZK6rCOqkDBatvaz7ceUxcTjWF18bxZdN8TAriuKNVbfg788rDuv1iOZvcwMPww7w
	 UnPCP7e32BSY9j7tAlbHDG4TD/nonc2cAZ3N63KvbA7i8e0FxsngOZUfthcD66PfUY
	 6v+BQsBzAHjM1g0yeARelxGR6hP6j8q5rg55OEKFs4VVrw4fMGHxVwHwfFg0axqkp2
	 yVOxLxPYr180NGnz8hWoaPAOO7y6q8zX1EXIwve1KF1Pb7nrFiWyJI99dYyPXu9uw+
	 BOlqrg0aEZpsrTlrz5bvNwJa54LB/gDCRsX/Gp+LuZkAlMpQ/Lucy5iua7jMTqYZQe
	 uRIdRODiFcAhA==
Message-ID: <e26bc312636de276f8c7e46cba269b7f@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.18-rc1
Date: Thu, 16 Oct 2025 18:04:02 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.18-rc1

for you to fetch changes up to f1a450f9e17d341f69f8fb19f6d13ef9f1aa508b:

  ASoC: nau8821: Fix IRQ handling and improve jack (2025-10-16 12:41:35 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.18

A moderately large collection of driver specific fixes, plus a few new
quirks and device IDs.  The NAU8821 changes are a little large but more
in mechanical ways than in ways that are complex.

----------------------------------------------------------------
Baojun Xu (2):
      ASoC: tas2781: Support more newly-released amplifiers tas58xx in the driver
      ASoC: tas2781: Update ti,tas2781.yaml for adding tas58xx

Christophe Leroy (1):
      ASoC: codecs: Fix gain setting ranges for Renesas IDT821034 codec

Cristian Ciocaltea (5):
      ASoC: nau8821: Cancel jdet_work before handling jack ejection
      ASoC: nau8821: Generalize helper to clear IRQ status
      ASoC: nau8821: Consistently clear interrupts before unmasking
      ASoC: nau8821: Add DMI quirk to bypass jack debounce circuit
      ASoC: nau8821: Avoid unnecessary blocking in IRQ handler

Frank Li (1):
      ASoC: dt-bindings: Add compatible string fsl,imx-audio-tlv320

Le Qi (2):
      ASoC: dt-bindings: qcom,sm8250: Add QCS615 sound card
      ASoC: qcom: sc8280xp: Add support for QCS615

Li Qiang (1):
      ASoC: amd/sdw_utils: avoid NULL deref when devm_kasprintf() fails

Mark Brown (2):
      ASoC: Add QCS615 sound card support
      ASoC: nau8821: Fix IRQ handling and improve jack

Sharique Mohammad (1):
      ASoC: max98090/91: fixed max98091 ALSA widget powering up/down

Shuming Fan (1):
      ASoC: sdw_utils: add rt1321 part id to codec_info_list

Srinivas Kandagatla (1):
      ASoC: codecs: wcd938x-sdw: remove redundant runtime pm calls

 .../devicetree/bindings/sound/fsl-asoc-card.yaml   |   1 +
 .../devicetree/bindings/sound/qcom,sm8250.yaml     |   1 +
 .../devicetree/bindings/sound/ti,tas2781.yaml      |  43 ++++++-
 include/sound/tas2781.h                            |   3 +
 sound/soc/amd/acp/acp-sdw-sof-mach.c               |   2 +-
 sound/soc/codecs/idt821034.c                       |  12 +-
 sound/soc/codecs/max98090.c                        |   6 +-
 sound/soc/codecs/nau8821.c                         | 129 +++++++++++++--------
 sound/soc/codecs/nau8821.h                         |   2 +-
 sound/soc/codecs/tas2781-i2c.c                     |  21 +++-
 sound/soc/codecs/wcd938x-sdw.c                     |  20 +---
 sound/soc/qcom/sc8280xp.c                          |   1 +
 sound/soc/sdw_utils/soc_sdw_utils.c                |  20 ++++
 13 files changed, 177 insertions(+), 84 deletions(-)
