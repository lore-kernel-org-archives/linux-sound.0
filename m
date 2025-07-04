Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FE828F94E
	for <linux-sound@vger.kernel.org>; Fri,  4 Jul 2025 15:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751641616; cv=none; b=b+MAa1weZiMPQ1Cie6KSKNAlmCf8wRc4BWkuf12G1CcZL4QQR3zTWmmfYdWEgI5ZrVtunXStN37DR0QpwFf05XTo9YROI0Z7XKZq/v1S2t94jh4tLsRrEgcZ/4jX26hePR98iVe6nHDENXIE3SklYwZ8jqrU6y4ad0k3AcyxZFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751641616; c=relaxed/simple;
	bh=mhV9A4sMdW94j1CEcO8lDT7nj2gYsRWWKgOpfJCh9CA=;
	h=Message-ID:From:To:Cc:Subject:Date; b=l6xq6RnVfEGTyjWUuKmlz+jEtP5E7ZJ/Qat2TkJXdfVz2V0lah8xAB3eAJh/WzALWJmnXquZ71j2Yq7XaxVr8iU5k+0L9fkIow2RQ/RrXMnY5dY77h7ivfh/kntiBclv4bJF/DaARfReLHJ5aZQ67gZAqjEnbh6AH8Sha+AF40M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n6NvlwgY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n6NvlwgY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90126C4CEE3;
	Fri,  4 Jul 2025 15:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751641615;
	bh=mhV9A4sMdW94j1CEcO8lDT7nj2gYsRWWKgOpfJCh9CA=;
	h=From:To:Cc:Subject:Date:From;
	b=n6NvlwgY2M8eF8LBoQHEf+4Kh4q4lxfGr2LYMvgiZS6Pzc2NOfoV5fqe+IRWtovoq
	 TJ62hGnVZ+2brBGOP8yMz5PeQw36+UHakDWSXb+0h0NsoD1muZmRK9EY0Q0DRCaDP2
	 MhqpH/cLRkUIGnLsh0Ah839UplsshuYpTgHuqE5DqPWpUgTJ47Qxl0w9iDQ0wqB77G
	 gl2Jbyqdo2lrs9MpS6vU1298fIChJmOrhCFVXPGFLCFZx7F39BtUYdyftn1DmmQ273
	 hYFXpTGvQjwTgqL3qYauNVOkOoWxniWYSFI1O+QjfDfug9iFdcpDGG2cL30RC8seAk
	 vgB5KetjRcTjw==
Message-ID: <899a3ae90cddad5bfe1de7f228960674.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.16-rc4
Date: Fri, 04 Jul 2025 16:06:42 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af:

  Linux 6.16-rc4 (2025-06-29 13:09:04 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.16-rc4

for you to fetch changes up to 3b3312f28ee2d9c386602f8521e419cfc69f4823:

  ASoC: cs35l56: probe() should fail if the device ID is not recognized (2025-07-03 12:22:27 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.16

An update for the MAINTAINERS file, plus a number of small driver
specific fixes and device quirks.

----------------------------------------------------------------
Arun Raghavan (1):
      ASoC: fsl_sai: Force a software reset when starting in consumer mode

Bard Liao (1):
      ASoC: Intel: SND_SOC_INTEL_SOF_BOARD_HELPERS select SND_SOC_ACPI_INTEL_MATCH

Charles Keepax (1):
      ASoC: Intel: soc-acpi: arl: Correct order of cs42l43 matches

Richard Fitzgerald (1):
      ASoC: cs35l56: probe() should fail if the device ID is not recognized

Shengjiu Wang (1):
      ASoC: fsl_asrc: use internal measured ratio for non-ideal ratio mode

Simon Trimmer (1):
      ASoC: Intel: sof_sdw: Add quirks for Lenovo P1 and P16

Srinivas Kandagatla (1):
      MAINTAINERS: update Qualcomm audio codec drivers list

 MAINTAINERS                                       | 16 +++++-----------
 sound/soc/codecs/cs35l56-shared.c                 |  2 +-
 sound/soc/fsl/fsl_asrc.c                          |  3 ++-
 sound/soc/fsl/fsl_sai.c                           | 14 ++++++++------
 sound/soc/intel/boards/Kconfig                    |  1 +
 sound/soc/intel/boards/sof_sdw.c                  |  3 +++
 sound/soc/intel/common/soc-acpi-intel-arl-match.c | 12 ++++++------
 7 files changed, 26 insertions(+), 25 deletions(-)
