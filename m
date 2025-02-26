Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927A42153C8
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 12:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740573911; cv=none; b=PN1pfUrKZ03FwrV5yNDs3urMeFzDDfzG38EQsjZOdCf72PiO/oVQMD+GW/eLyApwzZ1Mjb911uX8Eb2Sus3MgEVA34ZvXzK5WyLHeY+HEDB23qEBTmHFxDYilfuZVBZ46pSJGBUHGndAtodxri778CFpxP0xU0LsX5f7TxGZv40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740573911; c=relaxed/simple;
	bh=Yyy18qKjq6WWcNNrHiZjhxMlZg0K62qDA8PvIO8C9tE=;
	h=Message-ID:From:To:Cc:Subject:Date; b=BMPlqMtTuvpMdQm+fr7Gra4lUWwcC01EVh3XrprBvFAXD1zdKk1wMoESUKdpmR3zLJkZA1NW+bAqY8JR+OCLqsSuPqY4AY1ZttjjlSg+vYNiWxTwRbG5xyKY0INgH7Ig1DtHZuJclVnGWq6C+Nn5BN1kS/8/1nNjdQRlqluI8xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PYei3yz2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PYei3yz2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77D85C4CED6;
	Wed, 26 Feb 2025 12:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740573911;
	bh=Yyy18qKjq6WWcNNrHiZjhxMlZg0K62qDA8PvIO8C9tE=;
	h=From:To:Cc:Subject:Date:From;
	b=PYei3yz2DGSgUdD1SKv6jWcG5NlnujPEQP2s2bXyuuipQpsvTDejMa7/pxlKTIoPH
	 wM10AXJkfn4HEsi2m4+fM3j65QCLJOfy3HUnngFTC0NC8+dJqXCf4kHRb90rAz6UhK
	 sBn3GDpzRABY6onNDigibzUbDgr5aPzDSHqPVGEqq7iIcKBo8X7I22jNmabXv76IlE
	 qEaGykuDthqLbuXlQ58YgmpUXme3virpkzfWAcl+GlgxJ0CKwcT/Fr2L0e42bUWf/x
	 eooJE7yHAaF3aQV1W+Jl4pbk6EXg9SSQ5PJExrs915cXaumUMOpw1kdgDMtyz2o0X6
	 sx6DJCfXeRG3A==
Message-ID: <493624e8678463b8204354f06fd00e02.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.14-rc3
Date: Wed, 26 Feb 2025 12:45:06 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit 571b69f2f9b1ec7cf7d0e9b79e52115a87a869c4:

  ASoC: imx-audmix: remove cpu_mclk which is from cpu dai device (2025-02-13 11:34:32 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.14-rc3

for you to fetch changes up to f5468beeab1b1adfc63c2717b1f29ef3f49a5fab:

  ASoC: tas2764: Set the SDOUT polarity correctly (2025-02-18 20:08:43 +0000)

----------------------------------------------------------------
ASoC: Fixes for v6.14

A few fixes I and James Calligero picked out of the Asahi tree.

----------------------------------------------------------------
Hector Martin (3):
      ASoC: tas2770: Fix volume scale
      ASoC: tas2764: Fix power control mask
      ASoC: tas2764: Set the SDOUT polarity correctly

 sound/soc/codecs/tas2764.c | 10 +++++++++-
 sound/soc/codecs/tas2764.h |  8 +++++++-
 sound/soc/codecs/tas2770.c |  2 +-
 3 files changed, 17 insertions(+), 3 deletions(-)
