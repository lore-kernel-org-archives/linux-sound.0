Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8607C16DEB0
	for <linux-sound@vger.kernel.org>; Wed, 26 Nov 2025 20:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764190022; cv=none; b=Q3JwZAlnro78j+NlGlO8cSRslReI8MnFQjW8VvUbQriqqKOZdsJG6ZsGZ/tRvNVaM47oO+isXwZxub2hdwGHsM2X4kNIj++hl8Kxgs0MsG7nMrzmvSaSGKFe0O4/TmOyxXOiw9c6eQ5BxepXcRebXawDPmKGDrM+mgcXKg6pFyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764190022; c=relaxed/simple;
	bh=1f9WtfLoQREKfGQ1yA8+WZXm/5js8sppxuI3TY+9a7I=;
	h=Message-ID:From:To:Cc:Subject:Date; b=lrpS1fYVyj0MyPi0PsIk697kqD7gtHo//KRd56ZvSBrOrQoawjgcWqq0AFVLeGCy7RbIYs0DS0+5diGPVW9gAX/IdelkhqGqS3IoyKrgCNvjeXPgEOrrc5NLOubG52js1EFhZEpPBTDG4oph//1YMqpJ1xKSl2qzvA6/eQ9bVI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rjLj+DeH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rjLj+DeH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5CF6C4CEF7;
	Wed, 26 Nov 2025 20:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764190022;
	bh=1f9WtfLoQREKfGQ1yA8+WZXm/5js8sppxuI3TY+9a7I=;
	h=From:To:Cc:Subject:Date:From;
	b=rjLj+DeHBrv+h8pEKt2VnNYIE7nI2LQDQfiwfX99M//K/Sa4RV6JyhO7PrUHSCS0l
	 8D5obaKX4qJcOUrmxjrxN7VrU3tNhIALPK0exNc+CD6v520OKsD3TOrnIgXni801CB
	 gUX2/9CDRR353AycSpi8xt7q9yMoEslZgJvPz9q43PNKWFIOMfRm98Xew2Nokx/UYs
	 w6xSBWlPPScayLUkuOTDhx5eVaEF8wRxswToiabXrRuiVSsBAdDeByJR4Ro+nBPVzN
	 AOcJDZrNii1jbn3HjJwhQq46riYj9PyvmTYt0q0sVAvJgfjB5zdWzgxGxSyvZY/ouu
	 t3zoZ5Mj+EGKw==
Message-ID: <25d5b5826b2e8d821caf7a37dea59186@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.18-rc7
Date: Wed, 26 Nov 2025 20:46:45 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit 6a23ae0a96a600d1d12557add110e0bb6e32730c:

  Linux 6.18-rc6 (2025-11-16 14:25:38 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.18-rc7

for you to fetch changes up to 73b97d46dde64fa184d47865d4a532d818c3a007:

  ASoC: fsl_xcvr: clear the channel status control memory (2025-11-26 13:24:19 +0000)

----------------------------------------------------------------
ASoC: Fixes for v6.18

A small pile of driver specific fixes that came in during the past few
weeks, none of them especially major.

----------------------------------------------------------------
Baojun Xu (1):
      ASoC: tas2781: Correct the wrong chip ID for reset variable check

Biju Das (2):
      ASoC: renesas: rz-ssi: Fix channel swap issue in full duplex mode
      ASoC: renesas: rz-ssi: Fix rz_ssi_priv::hw_params_cache::sample_width

Ma Ke (2):
      ASoC: codecs: wcd937x: Fix error handling in wcd937x codec driver
      ASoC: codecs: Fix error handling in pm4125 audio codec driver

Shenghao Ding (1):
      ASoC: tas2781: correct the wrong period

Shengjiu Wang (1):
      ASoC: fsl_xcvr: clear the channel status control memory

Srinivas Kandagatla (1):
      ASoC: codecs: wcd934x: add explicit soundwire depenency

 sound/soc/codecs/Kconfig              |  1 +
 sound/soc/codecs/pm4125.c             | 21 ++++++++++--
 sound/soc/codecs/tas2781-comlib-i2c.c |  2 +-
 sound/soc/codecs/tas2781-i2c.c        |  2 +-
 sound/soc/codecs/wcd937x.c            | 43 ++++++++++++++++++-----
 sound/soc/fsl/fsl_xcvr.c              |  2 +-
 sound/soc/renesas/rz-ssi.c            | 64 +++++++++++++++++++++++++----------
 7 files changed, 103 insertions(+), 32 deletions(-)
