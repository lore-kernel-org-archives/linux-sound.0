Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC43129CE6
	for <linux-sound@vger.kernel.org>; Thu, 22 May 2025 16:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747929733; cv=none; b=YB93LPUYXjrZZ7Hd5gy4X8RMIGIjBGJeIsZuvWr1qxoDw8l3lUigLuCcUtL9zt/JfscdvSsfvIKJsr4rr4HHU1VRisBgaN7fso25Kf8DpDEoaybHQmY2OrDekgNwQiuWd1mdIM5+s9HnY5WZlwiV9PRLOovK1gF7E/5zMQGto9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747929733; c=relaxed/simple;
	bh=Y9+/4hA1KOG/0ms2NlscRDUpnyMQ/GiYnDaDtBdsN/4=;
	h=Message-ID:From:To:Cc:Subject:Date; b=aWWifvO55U/hGt65kY+eflx+heYM9f+uyVPclyErZVH3+iTZet/jy7kV6nw3Pl5aJCztM9+a+t0YXgoxwMMwL5Qfx2Kzq+Qx8kua+KL0AJril2EsUi7RzlZtML0pv+tYhPJzvll3M5D5Hy1yy5hZE4R8m1xmVEvdxb5j9oTvVXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F/GvDF4V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F/GvDF4V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE4C7C4CEE4;
	Thu, 22 May 2025 16:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747929733;
	bh=Y9+/4hA1KOG/0ms2NlscRDUpnyMQ/GiYnDaDtBdsN/4=;
	h=From:To:Cc:Subject:Date:From;
	b=F/GvDF4VapwNQvZkNZ+hOJ9sFPhxZNuHSxj2cEgUY9VRHusUbOF+gFU+FzK1LMede
	 jrDwN29djGrBRRJVlXhsrYmslL83hOlJEFgf/f3CTZq7xSllipL4GvzGj0ChCRy68i
	 xrDXJfRKuspmkVaIPPZJFzN1sKWOsDyq49sce65HlHk0MUW/ZrI4hbo1VoVG9YnVH3
	 0tbvnbKd7y9JDF5cgjOY9V9dwkqOYMkMJJujepzNFNBPg9HoGKMQPOyuv8fxs+xy1V
	 nSe0CdLFz5Kgwh0+mAz+ZIRR4Wwn5+cRfrq+qEzOp44Vki/S8qQh9Gdnpq9xTVGp26
	 U+zfuHR7RlZ6g==
Message-ID: <1d61156353cae98c1cbad10afda827b9.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.15-rc6
Date: Thu, 22 May 2025 17:02:09 +0100
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
