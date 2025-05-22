Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAE428DB74
	for <linux-sound@vger.kernel.org>; Thu, 22 May 2025 16:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747929743; cv=none; b=jFEXsO1piS6by/EuBPNPH2XxGMmjmUiRBxmQcyZFrM9pEdTMmWBCePcGWHzldnXQjzCUmFIIE5IciDauL+fkh+O92AZJF+0AuLBtJMDCXcpvAycTVTHi1I6amnLbCmCYFkJJ3HP/+hWYDFspUPSkgeTai8E9oEKXLV4NnvdE2Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747929743; c=relaxed/simple;
	bh=ObGY+IZswRp+VneDFthrG3+EP4qaLpl1wNQEg6px+Iw=;
	h=Message-ID:From:To:Cc:Subject:Date; b=YQB7I4Uv9APCojJEmBKbxWc5+Eopin+u2GA5vA25d2rB4Kd8DbNJFHJG0Fzh88MdYbvXUWTVCLKRrfS3SQcDzvdW4hyPKJfwwha9x5FbenFDA0Zyknb8Jt++5BuQvT4UphjjcPw0kdze006pjhFflvIEGDjz19QUf4eKC51rLWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V5ZNwQwT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V5ZNwQwT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96A40C4CEE4;
	Thu, 22 May 2025 16:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747929743;
	bh=ObGY+IZswRp+VneDFthrG3+EP4qaLpl1wNQEg6px+Iw=;
	h=From:To:Cc:Subject:Date:From;
	b=V5ZNwQwTBQsA/QjNzaFZxnzYwNahLcrgM/Bp2rtAUsY5CC/6jkPAbmasuT+kMb/tO
	 PJrf1kzEPvHZe+mfvfyFFi1CHcnJQYaJ6xm4HSnVvulodAufjjv/kgXJDk56K7+r0r
	 1iugsv4zTNFqMCEGqIp81voRJhVjBr/bQxsefoHz4GmVSXehyaaK4OpgMBroFNyoy9
	 MjJt+Au39zajH/TlEKQGKNa1OxNyUtCrpKbZVgAbYU4MVCspBkCEAOLqR2g6VpOqt6
	 2yIf9ZdxVwWZh0/2cPFg8SjT7WDFFGB8cN8zZcs+v2bgQ581Yv+KiIZaLxbl520zP0
	 fYHDnz3R9dE5g==
Message-ID: <2929fef2a55f1eb5ac9befdebe65c18c.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.15-rc7
Date: Thu, 22 May 2025 17:02:15 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit 92a09c47464d040866cf2b4cd052bc60555185fb:

  Linux 6.15-rc5 (2025-05-04 13:55:04 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.15-rc7

for you to fetch changes up to 688abe2860fd9c644705b9e11cb9649eb891b879:

  ASoC: qcom: sdm845: Add error handling in sdm845_slim_snd_hw_params() (2025-05-20 10:24:59 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.15

A couple more small fixes for v6.15, both of which could also easily
wait until the merge window.

----------------------------------------------------------------
Arnd Bergmann (1):
      ASoC: mediatek: mt8188-mt6359: select CONFIG_SND_SOC_MT6359_ACCDET

Kai Vehmanen (1):
      ASoc: SOF: topology: connect DAI to a single DAI link

Martin Povišer (1):
      ASoC: apple: mca: Constrain channels according to TDM mask

Nícolas F. R. A. Prado (1):
      ASoC: mediatek: mt8188-mt6359: Depend on MT6359_ACCDET set or disabled

Peter Ujfalusi (3):
      ASoC: SOF: ipc4-control: Use SOF_CTRL_CMD_BINARY as numid for bytes_ext
      ASoC: SOF: ipc4-pcm: Delay reporting is only supported for playback direction
      ASoC: SOF: Intel: hda-bus: Use PIO mode on ACE2+ platforms

Tavian Barnes (1):
      ASoC: SOF: Intel: hda: Fix UAF when reloading module

Wentao Liang (1):
      ASoC: qcom: sdm845: Add error handling in sdm845_slim_snd_hw_params()

 sound/soc/apple/mca.c         | 23 +++++++++++++++++++++++
 sound/soc/mediatek/Kconfig    |  1 +
 sound/soc/qcom/sdm845.c       |  4 ++++
 sound/soc/sof/intel/hda-bus.c |  2 +-
 sound/soc/sof/intel/hda.c     | 16 +++++++++++++++-
 sound/soc/sof/ipc4-control.c  | 11 ++++++++++-
 sound/soc/sof/ipc4-pcm.c      |  3 ++-
 sound/soc/sof/topology.c      | 18 ++++++++++++++----
 8 files changed, 70 insertions(+), 8 deletions(-)
