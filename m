Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E89238D38
	for <linux-sound@vger.kernel.org>; Wed,  2 Apr 2025 11:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743595191; cv=none; b=SUOcwgyL2nn+VmkrLLJZp1PryUQqj072GIjqft0FAXDM5q+bcAm/wKpaXGO7TR3ehNIoZPaYlWWvmxYYXnVg1x0xqx1bgE0aQiK8BQrxclGWU+iHokEA1Jaa/vjd86OUVT5/sN5ky8CBPXhUBk3CmqofVuruBG8Y2B73CAAYJmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743595191; c=relaxed/simple;
	bh=v2+xbhBFEQkillvuHFmwHN+5rpOg2yvJAvJeDxIa1UU=;
	h=Message-ID:From:To:Cc:Subject:Date; b=WuVJNaSsVbrisp0PZI+bnN7wF7IpkT/P1zp7HYbi4cYQou7FQzsOPkjQMgq21Lw9o6jl6X9y5P3TBipJQmSyb9O9j3z3g7WHmFXkhq9p33UjuLVOaHuwRBSDw2gmVOfL3i+XDQSb7AUWtp9Yd70Ov1w66Boe4UpfV7VhfzfOWDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vDO9jC+K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vDO9jC+K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DF13C4CEE9;
	Wed,  2 Apr 2025 11:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743595191;
	bh=v2+xbhBFEQkillvuHFmwHN+5rpOg2yvJAvJeDxIa1UU=;
	h=From:To:Cc:Subject:Date:From;
	b=vDO9jC+K7ygyzU/WsxXURAAxnrBJlrMlGgJXlkp4uqQ/dI+HmNyVFkbmr0Jo5L+zv
	 5wOB/VS55t5Vy8Mge/bo7iL63/21ztZfi56rLNdh4DfdnK1gUm6O2KA2AVeCfA9Q/L
	 NUPsZ5aAF2N4+3GuBgBgG+QU0A1Hknjau0gtegZzlmViyY0XlYDmdx1bFG37vFD1Eg
	 U8lNhNtEoAmrgsVX+mjtZVooSbG2LwSpL04urpAF92t8jrGuu5b07sn5jnABW9OAG+
	 m10OGjd5sHtUDYsvYlAY/e9+6h34jW1uou88tNTSRjuEsXZu7Hive1IpKclKgcQnx0
	 7qOOyUAcXQCjw==
Message-ID: <fb75f883b177ba9e2505680fb1c45b9d.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.15-merge-window
Date: Wed, 02 Apr 2025 12:59:36 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit 9ef52d529bb75071e03cf85078f724d69c4abe89:

  ASoC: SDCA: Correct handling of selected mode DisCo property (2025-03-21 15:45:25 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.15-merge-window

for you to fetch changes up to 93d34608fd162f725172e780b1c60cc93a920719:

  ASoC: imx-card: Add NULL check in imx_card_probe() (2025-04-01 17:01:10 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.15

A relatively large set of fixes that came in since the release, mostly
for Qualcomm platforms.  The biggest block of fixes is the set from
Srini which fixes various quality and glitching issues on AudioReach
systems.

----------------------------------------------------------------
Alexey Klimov (1):
      ASoC: qdsp6: q6asm-dai: fix q6asm_dai_compr_set_params error path

Christophe JAILLET (1):
      ASoC: codecs: rt5665: Fix some error handling paths in rt5665_probe()

Dan Carpenter (1):
      ASoC: sma1307: Fix error handling in sma1307_setting_loaded()

Henry Martin (1):
      ASoC: imx-card: Add NULL check in imx_card_probe()

Krzysztof Kozlowski (2):
      ASoC: codecs: wsa883x: Correct VI sense channel mask
      ASoC: codecs: wsa884x: Correct VI sense channel mask

Mark Brown (2):
      ASoC: codecs: wsa88xx: Correct VI sense channel mask
      ASoC: q6apm: fix under runs and fragment sizes

Peter Ujfalusi (1):
      ASoC: SOF: hda/ptl: Move mic privacy change notification sending to a work

Richard Fitzgerald (1):
      firmware: cs_dsp: Ensure cs_dsp_load[_coeff]() returns 0 on success

Srinivas Kandagatla (5):
      ASoC: q6apm-dai: schedule all available frames to avoid dsp under-runs
      ASoC: q6apm: add q6apm_get_hw_pointer helper
      ASoC: qdsp6: q6apm-dai: set 10 ms period and buffer alignment.
      ASoC: qdsp6: q6apm-dai: fix capture pipeline overruns.
      ASoC: q6apm-dai: make use of q6apm_get_hw_pointer

 drivers/firmware/cirrus/cs_dsp.c |  2 ++
 sound/soc/codecs/rt5665.c        | 24 +++-------------
 sound/soc/codecs/sma1307.c       | 11 ++------
 sound/soc/codecs/wsa883x.c       |  2 +-
 sound/soc/codecs/wsa884x.c       |  2 +-
 sound/soc/fsl/imx-card.c         |  4 +++
 sound/soc/qcom/qdsp6/q6apm-dai.c | 60 +++++++++++++++++++++-------------------
 sound/soc/qcom/qdsp6/q6apm.c     | 18 +++++++++++-
 sound/soc/qcom/qdsp6/q6apm.h     |  3 ++
 sound/soc/qcom/qdsp6/q6asm-dai.c | 19 +++++++++----
 sound/soc/sof/intel/hda-dsp.c    |  8 ++++++
 sound/soc/sof/intel/hda.c        |  4 +++
 sound/soc/sof/intel/hda.h        |  8 ++++++
 sound/soc/sof/intel/ptl.c        | 33 +++++++++++++++++++---
 14 files changed, 128 insertions(+), 70 deletions(-)
