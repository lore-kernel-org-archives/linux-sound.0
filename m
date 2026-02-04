Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8375D2DCC01
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 15:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770220488; cv=none; b=J50zYblBcsH0+lZ0/ealc3tEMCO6HCyW7upt4dU2ODBRwYyxdI5c69GLvHD7KfG+RWzFiep2sFsPn9jLJPY1HfEnUJvhYaVyitzKWA/+XvG4jmQM2jcIvcw/oYnbT56yCO6tRsi8HIzA3zOZIVLZNIhZ/LJh++9fzAhLPRWU0Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770220488; c=relaxed/simple;
	bh=So8f09uiERLzR6ixQPfobOYDIM23ryTKhrMDrPH4f7U=;
	h=Message-ID:From:To:Cc:Subject:Date; b=VRPJjgt4shjbrKDZxsgYcth6usj+6Sy10dP+QALUiHgUCXILzYfERyImmvaMoWUyyjpr+ekpcROO7uTrk+aVb7s6ZmWHgWWJ8YI+/9MJbizdxtiwOb1hgcvCFzJudP64xwjNCPyQWOgTWhoPlm5c18gdDGMW2FoKLvz6nH6JqjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XtAkRAAd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XtAkRAAd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5BBBC4CEF7;
	Wed,  4 Feb 2026 15:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770220488;
	bh=So8f09uiERLzR6ixQPfobOYDIM23ryTKhrMDrPH4f7U=;
	h=From:To:Cc:Subject:Date:From;
	b=XtAkRAAd9GHYC3OAToMnZNTjoiVT2bl+SHj0zqPq38QIq5pg5NQfp29DOpSzRQ87J
	 zz5J2H2Xc1zX40k3smrtVC1uVvCztOUTVxD6Nzs6ktMifC0FkgF1f+ebY4D73y4tjE
	 v/wW8aisj/kdkaNUJTSTS2p5covEIHCoD3E0w1bkQDG6pslxEapQgnCirrXoc1SjkS
	 rsLCLh/pC97qMZKbOEMDEYPoasaxW+8OO3Oddrv16htlSL3tj1TqpEFUwzFXjkzrGQ
	 wIV0MPGVM6XhfbvPpfeXuN9jldJWU/1w5a98KMiPK7Ju315f1d6ZxYc8My4tFvdKCZ
	 iGjTvKjd80/zQ==
Message-ID: <dea287404ba003dd74f4976e9141e0b0@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.19-rc8
Date: Wed, 04 Feb 2026 15:54:36 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit 213c4e51267fd825cd21a08a055450cac7e0b7fb:

  ASoC: Intel: sof_es8336: fix headphone GPIO logic inversion (2026-01-27 12:45:47 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.19-rc8

for you to fetch changes up to f514248727606b9087bc38a284ff686e0093abf1:

  ASoC: fsl_xcvr: fix missing lock in fsl_xcvr_mode_put() (2026-02-04 11:29:58 +0000)

----------------------------------------------------------------
ASoC: Fixes for v6.19

A bunch more small fixes here, plus some more of the constant stream of
quirks.   The most notable change here is Richard's change to the cs_dsp
code for the KUnit tests which is relatively large, mostly due to
boilerplate.  The tests were triggering large numbers of error messages
as part of verifying that problems with input data are appropriately
detected which in turn caused runtime issues for the framework due to
the performance impact of pushing the logging out, while the logging is
valuable in normal operation it's basically useless while doing tests
designed to trigger it so rate limiting is an appropriate fix.

----------------------------------------------------------------
Bard Liao (1):
      ASoC: SOF: Intel: use hdev->info.link_mask directly

Charles Keepax (1):
      ASoC: cs42l43: Correct handling of 3-pole jack load detection

Chris Bainbridge (1):
      ASoC: amd: fix memory leak in acp3x pdm dma ops

Dirk Su (1):
      ASoC: amd: yc: Add quirk for HP 200 G2a 16

Frank Li (1):
      ASoC: dt-bindings: ti,tlv320aic3x: Add compatible string ti,tlv320aic23

Maciej Strozek (1):
      ASoC: sof_sdw: Add a quirk for Lenovo laptop using sidecar amps with cs42l43

Richard Fitzgerald (1):
      firmware: cs_dsp: rate-limit log messages in KUnit builds

Shuming Fan (1):
      ASoC: rt1320: fix intermittent no-sound issue

Tagir Garaev (1):
      ASoC: Intel: sof_es8336: Add DMI quirk for Huawei BOD-WXX9

Ziyi Guo (1):
      ASoC: fsl_xcvr: fix missing lock in fsl_xcvr_mode_put()

 .../devicetree/bindings/sound/ti,tlv320aic3x.yaml  |  1 +
 drivers/firmware/cirrus/cs_dsp.c                   | 37 ++++++++++++++++++++++
 drivers/firmware/cirrus/cs_dsp.h                   | 18 +++++++++++
 drivers/firmware/cirrus/test/cs_dsp_test_bin.c     | 22 ++++++++++++-
 .../firmware/cirrus/test/cs_dsp_test_bin_error.c   | 24 ++++++++++----
 drivers/firmware/cirrus/test/cs_dsp_test_wmfw.c    | 26 ++++++++++++++-
 .../firmware/cirrus/test/cs_dsp_test_wmfw_error.c  | 24 ++++++++++----
 drivers/firmware/cirrus/test/cs_dsp_tests.c        |  1 +
 sound/soc/amd/renoir/acp3x-pdm-dma.c               |  2 ++
 sound/soc/amd/yc/acp6x-mach.c                      |  7 ++++
 sound/soc/codecs/cs42l43-jack.c                    | 37 ++++++++++++++++++----
 sound/soc/codecs/rt1320-sdw.c                      |  2 ++
 sound/soc/fsl/fsl_xcvr.c                           |  3 ++
 sound/soc/intel/boards/sof_es8336.c                |  9 ++++++
 sound/soc/intel/boards/sof_sdw.c                   |  1 +
 sound/soc/sof/intel/hda.c                          |  5 ++-
 16 files changed, 196 insertions(+), 23 deletions(-)
 create mode 100644 drivers/firmware/cirrus/cs_dsp.h
