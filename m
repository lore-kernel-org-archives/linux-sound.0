Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4D23EFFA6
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 13:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792069788; cv=none; b=rEpVyGh2Sxa2Lro2x1TiGGcd8Hiqfge0g9fbEdT0l8dEutm2jVuNFYXC7ZZwim/SRG/vAoWT3fQmwPvryfIwnkagePKYe14RP4NJOWKLdP13UxRUMlOw6Q8Acv1Z5/4r62VWQFsfCD1A4RwxwzD2lzNAS4pg8rpAJe3hAqMwnuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792069788; c=relaxed/simple;
	bh=MrtPWE17mUklQsmlqfg/AB1DRhsL+Q30/sRtq3RmHpQ=;
	h=Message-ID:From:To:Cc:Subject:Date; b=SlxSEYWQe4KXVG1airbKcWnaEtX/yPBWIP6lEu2LlaWxDXqapxD7R5VvF40IhVNXxhQ9YGhYBP9+tzqo8XJM1ZR0CFPDCYSLHhUNpqlEb7/EzuZu4XF0pIYqeHCZ/91fm+T1hpecUCe9IP5vT4aEmoGR13BnB8tOvxOPjFdaDHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H4T/q/S3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H4T/q/S3"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 1622D1F000C5;
	Thu, 15 Oct 2026 13:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792069786;
	bh=0JuBE2rFYJnZAWgNyg188EDNsyHskD0MUK++wTZThx8=;
	h=From:To:Cc:Subject:Date;
	b=H4T/q/S3JCHkaiEMEyXy923phwkkOTvNbQ7YB0mzMeinWynUGLaSh4m6nPmlG2e+F
	 gIJundYcUbBDaptMQKvxJxWHQ5O7AqRIAOUXPga+be0bywHHcjriPR9RiAQXT90FG0
	 Pm/Gjm/m026hokvGZkcc8PSduBiR4q4i+aK7RTcOi2LoCGov/x0jpA5YgPIRxuRhVG
	 uX51+ihizo3Ex0MIG5Du1IYVnxTF6cvi54AXhyxum8TcbW4B8y8pnIm2W+X2NDmeo3
	 rev/cRRD5TFxVX2Erw7Xbe/PfeQeukjkruRmvZ+aMWUEF+6yu7Cjanyv38CzeD7JLS
	 50K5XlP+9Xl2w==
Message-ID: <bdcee80ff1b48cbbcfacaa3eb404fbca@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v7.3-rc7
Date: Thu, 15 Oct 2026 14:09:26 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907:

  Linux 7.3-rc7 (2026-10-11 20:04:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.3-rc7

for you to fetch changes up to 2a31b5378c6db9c4a8d399e5d10d32cd4b732bef:

  ASoC: amd: yc: disable MSI on resume (2026-10-13 14:32:22 +0100)

----------------------------------------------------------------
ASoC: Fixes for v7.3

There's a relatively large block of fixes for errors in register field
definitions here, resulting from an audit done after review of a prior
series.  The fixes themselves are very small and can be directly checked
against the datasheets.  Other than that we've got some driver specific
fixes, the AMD fix is a little large but fixes a clear issue and won't
affect other systems.

----------------------------------------------------------------
Avi Weiss (1):
      ASoC: stm32: spdifrx: fix synchronization state check

HyeongJun An (6):
      ASoC: cs42l56: Put the Limiter Cushion control on the limiter register
      ASoC: cs42l52: Fix the NG Type Switch bit
      ASoC: pcm3168a: Fix the DAC zero flag polarity bit
      ASoC: max98371: Fix the Speaker DHT Min Volume bits
      ASoC: wm8978: Fix the 128x oversampling switch bits
      ASoC: nau8822: Fix the 128x oversampling switch bits

Mario Limonciello (1):
      ASoC: amd: yc: disable MSI on resume

Mark Brown (1):
      ASoC: Fix controls that write another control's bits

Peter Ujfalusi (2):
      ASoC: SOF: ipc4-topology: Fix shift-out-of-bounds for aggregated ALH capture
      ASoC: SOF: sof-client: Use event-handler mutex consistently

Sergey Tiraspolsky (1):
      ASoC: Intel: avs: Reset the stream unless it is already prepared

 sound/soc/amd/yc/pci-acp6x.c  | 38 ++++++++++++++++++++++++++++++++++++--
 sound/soc/codecs/cs42l52.c    |  2 +-
 sound/soc/codecs/cs42l56.c    |  2 +-
 sound/soc/codecs/max98371.c   |  2 +-
 sound/soc/codecs/nau8822.c    |  4 ++--
 sound/soc/codecs/pcm3168a.c   |  2 +-
 sound/soc/codecs/wm8978.c     |  4 ++--
 sound/soc/intel/avs/pcm.c     |  2 +-
 sound/soc/sof/ipc4-topology.c |  9 ++++++---
 sound/soc/sof/sof-client.c    |  6 +++---
 sound/soc/stm/stm32_spdifrx.c |  2 +-
 11 files changed, 55 insertions(+), 18 deletions(-)
