Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB781DFE8
	for <linux-sound@vger.kernel.org>; Fri, 16 May 2025 11:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747395081; cv=none; b=ZbhnE6OmNlW1ud2m9WFofOUMoSxCEwf+1V5NmnksLN11hSjajmQAUiAqghs8agPMGazcBiqTypTbnyU+L1W398rsyMyj4ZUUO2lyCljtVENuOU2NZBsH2mI7fQD71CunfafYG+sbepEioFrm19i4hqsAFqZ88gHv7PzkYtY/QI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747395081; c=relaxed/simple;
	bh=Y9+/4hA1KOG/0ms2NlscRDUpnyMQ/GiYnDaDtBdsN/4=;
	h=Message-ID:From:To:Cc:Subject:Date; b=iP8X8fzayxAcjLUfYYOkoKv+SPOvQ15ziBs1gc3sPV29BDaRiLteBlMlWBK7iJd693VZGkKk+Uc17pOg8ztkoF28RNDeHZ+V87wDqbplCg4B/NyCXgH7b6RTnb1iWpPx+us/IqSqjZlLDli2WHyuch750R33KlOy/TQcQqNqPkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LIUjCRh0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LIUjCRh0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 056EFC4CEE4;
	Fri, 16 May 2025 11:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747395081;
	bh=Y9+/4hA1KOG/0ms2NlscRDUpnyMQ/GiYnDaDtBdsN/4=;
	h=From:To:Cc:Subject:Date:From;
	b=LIUjCRh0dKOLdPPK8bRcz62ib1CUJFVAIbaCaA4Msa5lrCVWV1eY11KlJc3rs/kVM
	 Ejka68klevScX+KG5MInI/M9/XJhsfOrCGc1iBw+DR0Zz6kO5sn2yqNkM5D1OMloJ5
	 wE5HATqKqvHYZKAAPYG/oaF9u6if3+qvHDFr5k/vo38CdThQ52pY2g1dvXQSdHKZlC
	 PGpQioT7re5H0TkXEUDeevr5VXol++igZiqQQL1og+Pvp+ZtUSeJ2Jwd+ZYRIFvgR5
	 aO3KouznDjuLl0M7X5w2q73I9IIVY9Zehe01JpwAG6W3/BctHQ7ctp36pYJhmdFFzI
	 l4okN8nigJdEQ==
Message-ID: <cd5ce2c2c94d383d4347692c0366dddd.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.15-rc6
Date: Fri, 16 May 2025 13:31:12 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit 92a09c47464d040866cf2b4cd052bc60555185fb:

  Linux 6.15-rc5 (2025-05-04 13:55:04 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.15-rc6

for you to fetch changes up to 7dd7f39fce0022b386ef1ea5ffef92ecc7dfc6af:

  ASoC: SOF: Intel: hda: Fix UAF when reloading module (2025-05-14 16:34:48 +0200)

----------------------------------------------------------------
ASoC: Fixes for v6.15

A collection of driver specific fixes that built up over the past few
weeks, plus one core patch which fixes handling of topology files where
some DAI names are substrings of others.

----------------------------------------------------------------
Arnd Bergmann (1):
      ASoC: mediatek: mt8188-mt6359: select CONFIG_SND_SOC_MT6359_ACCDET

Kai Vehmanen (1):
      ASoc: SOF: topology: connect DAI to a single DAI link

Nícolas F. R. A. Prado (1):
      ASoC: mediatek: mt8188-mt6359: Depend on MT6359_ACCDET set or disabled

Peter Ujfalusi (3):
      ASoC: SOF: ipc4-control: Use SOF_CTRL_CMD_BINARY as numid for bytes_ext
      ASoC: SOF: ipc4-pcm: Delay reporting is only supported for playback direction
      ASoC: SOF: Intel: hda-bus: Use PIO mode on ACE2+ platforms

Tavian Barnes (1):
      ASoC: SOF: Intel: hda: Fix UAF when reloading module

 sound/soc/mediatek/Kconfig    |  1 +
 sound/soc/sof/intel/hda-bus.c |  2 +-
 sound/soc/sof/intel/hda.c     | 16 +++++++++++++++-
 sound/soc/sof/ipc4-control.c  | 11 ++++++++++-
 sound/soc/sof/ipc4-pcm.c      |  3 ++-
 sound/soc/sof/topology.c      | 18 ++++++++++++++----
 6 files changed, 43 insertions(+), 8 deletions(-)
