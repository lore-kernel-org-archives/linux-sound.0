Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EB0273804
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 09:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756458584; cv=none; b=Ohhh5joI/LgD78xSJ2BOu/tKPe8tZ7su+GMkxHFsl8A3pJtxr8+aDuY7kXDDD9G4wACMA2rbmQenjINwhRex76kZcCQsLS0xMop96WllB9gZucIWOACOQf2IHe9HuEFRndWT2PGu1jcG+Id69iz3NsxRy8m/WL8cg/cMZPSsmbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756458584; c=relaxed/simple;
	bh=gp0NkXAwsaMNEVMt9E7wsKeDRKCegVjSnZ5p9RsWRWc=;
	h=Message-ID:From:To:Cc:Subject:Date; b=it8cEKamD/aTCUiQWcEJFGSXHJhPfSv+V0w9Ql5SidFkhW6EW7kjewlQXgQH0GH/esIfkeoeEL/Y4Xw8se0iul5YPRuQR6lEYbyP4oo5/XUhNNmTORhti1DEWZ1bkxdeLS4RTs7zJ+JYvxhw4XfM+S2rw4Ho7BWuAm/TzoildlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ftCtH7MH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ftCtH7MH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAC4DC4CEF0;
	Fri, 29 Aug 2025 09:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756458583;
	bh=gp0NkXAwsaMNEVMt9E7wsKeDRKCegVjSnZ5p9RsWRWc=;
	h=From:To:Cc:Subject:Date:From;
	b=ftCtH7MHq2jfFxHFtxnzWKrOjDwMCfRFzPFsfwgGoBF0JhaC8q2h41L/VD45tFEag
	 hhIfFYnqUEgzHKvV8hxtxyN83SFFORxElC4PJGa1YAIfXMhaSBpbMTEwysXlP50W39
	 eJm5SmgBwtqrbQeN7W0U5bogdShcvIaM8c3bzVToaI7ENj466o+0rEPJaT/8yvwvNt
	 mJt7k/FItQcMEVmSCX/BkRszV0hlj1gbY50d3uSh090DfaarFXTqt0XUIcfzjwK6eT
	 YaVAsXL5Mn36Z4kIe/31kucGRx7a/3uqdeFLdsuNB0igJl06cZUa//tn1uRim/CCbe
	 4Z7DqwQ7CxhVw==
Message-ID: <b8dbfe9e97c69e8307375219e714c823@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.17-rc3
Date: Fri, 29 Aug 2025 11:09:33 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit 1b237f190eb3d36f52dffe07a40b5eb210280e00:

  Linux 6.17-rc3 (2025-08-24 12:04:12 -0400)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.17-rc3

for you to fetch changes up to 3e7fd1febc3156d3d98fba229399a13b12d69707:

  ASoC: SOF: Intel: WCL: Add the sdw_process_wakeen op (2025-08-28 21:15:49 +0200)

----------------------------------------------------------------
ASoC: Fixes for v6.17

The main fixes here are for some of the cleanups done in the core in
this release, we had broken component lookup in the case with a single
bus and DMA controller.  Otherwise it's driver specific changes, the
shortlogs for the Intel WCL and rsnd drivers look like minor cleanups
but are actually bugfixes (adding an op needed for correct functionality
and reverting an inappropriate helper usage).

----------------------------------------------------------------
Ajye Huang (1):
      ASoC: SOF: Intel: WCL: Add the sdw_process_wakeen op

Cryolitia PukNgae (1):
      ASoC: codecs: idt821034: fix wrong log in idt821034_chip_direction_output()

Kuninori Morimoto (3):
      ASoC: soc-core: care NULL dirver name on snd_soc_lookup_component_nolocked()
      ASoC: soc-core: tidyup snd_soc_lookup_component_nolocked()
      ASoC: rsnd: tidyup direction name on rsnd_dai_connect()

Mark Brown (1):
      ASoC: fixup snd_soc_lookup_component_nolocked()

 sound/soc/codecs/idt821034.c  |  2 +-
 sound/soc/renesas/rcar/core.c |  2 +-
 sound/soc/soc-core.c          | 25 +++++++++++++++----------
 sound/soc/sof/intel/ptl.c     |  1 +
 4 files changed, 18 insertions(+), 12 deletions(-)
