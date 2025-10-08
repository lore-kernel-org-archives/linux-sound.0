Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1940819D082
	for <linux-sound@vger.kernel.org>; Wed,  8 Oct 2025 11:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759923315; cv=none; b=aQ0aj3mnENkfvKvtib0cI1ACHuLgPue6QpQV5j/U8u6wzMWuayagK0r4TB2jViARns615OLw95a2PnTtXEJ/VkBwBK4IhpsFGIiRSRpZYSfEzUvf9OL+/kVAYFkSqokBFxQMpp3waeFWKhqx77BY+PxRz7b+GKHK1/er3JTZp7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759923315; c=relaxed/simple;
	bh=aYvbF0OuuSst65KSj/m8VTqPnkH8HKo8SmdWAZ4aR1A=;
	h=Message-ID:From:To:Cc:Subject:Date; b=HX+jH+BXFzqBKvXVn66sLdnAerEpLkuju2geL/Q94IV3M6pPRujtd7reGrLLw6o1kqO1oxNGLnnRYpo3vykXO3wME2lb1k3oRX0nC1FmzHn79tl3YddMQSL3M3NRM/6W2eal6bbe00NJVJuFMwvChrmAV3xr/2jNOvzE9nkxOBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C019+Czm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C019+Czm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37767C4CEF4;
	Wed,  8 Oct 2025 11:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759923314;
	bh=aYvbF0OuuSst65KSj/m8VTqPnkH8HKo8SmdWAZ4aR1A=;
	h=From:To:Cc:Subject:Date:From;
	b=C019+CzmGPYGX9YeRUNP4DiqvnVhu2NsAfIRiTz6piUH6AbkXg9NZiCXP/thAxDDO
	 y3GGbyVASMJ62mXzdpx5mYmyl5qEHvnoNLfPtYu8FSKNgi+Xak2s+lytouK8WDmwKe
	 bapZ4TimjDqP/No7cY9nT8VyezfQjaBgYhKebOFx+Y2xvuO7nSlpTnU+4tOQjIx89h
	 K4Ys+fLl96wi8Ndaa3LqSA8IbRdZLbK5uxeLzAQkTkX3A374gswkCq70Nz7gPI6VDU
	 3wij8362DEh/IQcGyX6n05oaT7EJiKOxqx7RpE4OdR0mX4qPAJEGi2cY9GL1cdNzpb
	 YEFqQ8qeLP/KA==
Message-ID: <c03c248d42a17bc7d332b83ebb540541@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.18-merge-window
Date: Wed, 08 Oct 2025 12:35:05 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit f8b9c819ea20d1101656a91ced843d9e47ba0630:

  ASoc: tas2783A: Fix an error code in probe() (2025-09-26 12:43:33 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.18-merge-window

for you to fetch changes up to a27539810e1e61efcfdeb51777ed875dc61e9d49:

  ASoC: rt722: add settings for rt722VB (2025-10-07 13:19:44 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.18

A small pile of fixes, almost all for the Intel and SOF code surrounding
management of the host buffer.  We've also got one fix for Meson and new
device IDs and quirk supporting the RT722VB.

----------------------------------------------------------------
Kai Vehmanen (3):
      ASoC: SOF: ipc4-pcm: fix delay calculation when DSP resamples
      ASoC: SOF: ipc4-pcm: fix start offset calculation for chain DMA
      ASoC: SOF: ipc4-pcm: do not report invalid delay values

Mark Brown (1):
      ASoC: SOF: ipc4/Intel: Fix the host buffer

Peter Ujfalusi (5):
      ASoC: SOF: ipc4-topology: Correct the minimum host DMA buffer size
      ASoC: SOF: ipc4-topology: Account for different ChainDMA host buffer size
      ASoC: SOF: Intel: hda-pcm: Place the constraint on period time instead of buffer time
      ASoC: SOF: sof-audio: add dev_dbg_ratelimited wrapper
      ASoC: SOF: Intel: Read the LLP via the associated Link DMA channel

Ranjani Sridharan (1):
      ASoC: SOF: ipc3-topology: Fix multi-core and static pipelines tear down

Shuming Fan (1):
      ASoC: rt722: add settings for rt722VB

Valerio Setti (1):
      ASoC: meson: aiu-encoder-i2s: fix bit clock polarity

 sound/soc/codecs/rt722-sdca-sdw.c |   2 +-
 sound/soc/codecs/rt722-sdca.c     |  14 +++++
 sound/soc/codecs/rt722-sdca.h     |   6 +++
 sound/soc/meson/aiu-encoder-i2s.c |   9 ++--
 sound/soc/sof/intel/hda-pcm.c     |  29 ++++++++---
 sound/soc/sof/intel/hda-stream.c  |  29 ++++++++++-
 sound/soc/sof/ipc3-topology.c     |  10 ++--
 sound/soc/sof/ipc4-pcm.c          | 104 +++++++++++++++++++++++++++++---------
 sound/soc/sof/ipc4-topology.c     |  10 ++--
 sound/soc/sof/ipc4-topology.h     |   9 +++-
 sound/soc/sof/sof-audio.h         |   5 ++
 11 files changed, 179 insertions(+), 48 deletions(-)
