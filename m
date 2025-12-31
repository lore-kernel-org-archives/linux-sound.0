Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD4F13AD1C
	for <linux-sound@vger.kernel.org>; Wed, 31 Dec 2025 12:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767185323; cv=none; b=kkZdYSio4HkLkQnoVeRkeeZBPwA+kK7P4N/H4y2EYFVXePu614pMfmHB2wuEGip3QFaiwFZkptrZJCeeB+iaxD6LVzImq/CSBSvgkzE/4g4aR5wDtbfJIKt6sorjmVqz0R+fJeYTpEbixmSc2GJqGLobm4QHAC6pRk5mRcTf9VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767185323; c=relaxed/simple;
	bh=92DGvW4v0/TjB7+EyS9EarMBsTnxxFlypJStYlGMhrs=;
	h=From:To:Cc:Subject:Date:Message-Id; b=C/kdJZk77ZPl2nLd9ySCug3u3OJVYTguO99wHLvH6uYq/DmWhdgXMYHwU3xDhyOTi1sjHNjXbJ0fsv0VUHIPNlfrfWRdVoYksQ+9CDbefaHdoqRRNVchuLfEKS9aDTzzvbT+nFF4o9qwxDTrrtxGi3T8Z/9/FJMRNOVrGDwe9e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BoK0pwTh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BoK0pwTh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BF1CC113D0;
	Wed, 31 Dec 2025 12:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767185322;
	bh=92DGvW4v0/TjB7+EyS9EarMBsTnxxFlypJStYlGMhrs=;
	h=From:To:Cc:Subject:Date:From;
	b=BoK0pwThWTbObIma0pFbpsFUXCxU5rlz/pALe2aGPL7P+lc4X/21kExVjtYUY1RhI
	 wU2WyvhQoUam+To0FX5Rk7kDTYvC58yMCy+DuittpqRqC8Pls0bi1jJ1eAydCai5jb
	 +82L9ouCC8ca2hwt6e5f+jnEEZhI+AWAtt3bCTZXSyn4uOKnJcZBbvKXillDLK0mCj
	 88dNqcrYkM+J8WMe3JkIIjn3AvHFTkgTV+J6G/0cBdP0wIN8KDQnJnX1MIqyeOENYH
	 lP3chqUX3mFWS8eEFYO4VOxy5KCIj9/2sI5L3q5LtOE65TL9D/a0dlQwEbDtBOvxd1
	 2sImLviwl8i7A==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id C972C1AC5681; Wed, 31 Dec 2025 21:48:37 +0900 (JST)
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.19-rc3
Date: Wed, 31 Dec 2025 12:48:31 +0000
Message-Id: <20251231124837.C972C1AC5681@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit 56d953a8d0da5e53c2594edde23465ec49385b1c:

  ASoC: Intel: mtl-match: Add 6-amp matches for CS35L56 (2025-12-19 13:25:16 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.19-rc3

for you to fetch changes up to 3572ad82201baeed840f1959787e0e1281e7f937:

  ASoC: drop bogus container_of() error handling (2025-12-22 22:13:03 +0000)

----------------------------------------------------------------
ASoC: Fixes for v6.19

A small collection of driver speciifc fixes, mostly relatively minor,
plus an adjustment to the topology file naming for Intel systems with
Bluetooth required for disambiguation.

----------------------------------------------------------------
Bard Liao (1):
      ASoC: SOF: Intel: add -bt tplg suffix if BT is present

Chen-Yu Tsai (1):
      ASoC: sun4i-spdif: Add missing kerneldoc fields for sun4i_spdif_quirks

Johan Hovold (4):
      ASoC: codecs: pm4125: drop bogus container_of() error handling
      ASoC: codecs: wcd937x: drop bogus container_of() error handling
      ASoC: soc_sdw_utils: drop bogus container_of() error handling
      ASoC: codecs: pm4125: clean up bind() device reference handling

Mac Chiang (1):
      ASoC: Intel: sof_sdw: shift SSP BT mask bits.

Mark Brown (1):
      ASoC: drop bogus container_of() error handling

 sound/soc/codecs/pm4125.c               | 17 ++---------------
 sound/soc/codecs/wcd937x.c              |  5 -----
 sound/soc/intel/boards/sof_sdw_common.h |  6 +++---
 sound/soc/sdw_utils/soc_sdw_utils.c     |  4 ----
 sound/soc/sof/intel/hda.c               | 14 +++++++++++++-
 sound/soc/sunxi/sun4i-spdif.c           |  2 ++
 6 files changed, 20 insertions(+), 28 deletions(-)
