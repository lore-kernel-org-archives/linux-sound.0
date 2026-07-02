Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2E935E1CC
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 18:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783018637; cv=none; b=UAYiS2h/UqGkugEcq1/QCsupdKtQtiQHMboIE4mROWIESCa5xrDBhskZgQX5YsVpoOGYLAQtywN21cWCV1yUjVm6fGq5M+qmxEqmOEoGS4Ed2cmEak4AWv1cRFpSUOP8iSbf8cCWv0im+h5PGlQL021ON+cHq5tiJq0fOPLVons=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783018637; c=relaxed/simple;
	bh=CLSuzdCc+04rTJajNgr/4YoXL0buOBV+ftEj0jyiyHE=;
	h=Message-ID:From:To:Cc:Subject:Date; b=FVaXtEcUJwSEIQeIu23IeJRnG5nKcQzLtgXk0F0kf8DeVax4Ig8oeZavSPoLath715wpXpY/g99UV9gvPBadvNUqDOLKUXmbuA9nxIjn5UdAt0cPyplhapjYkEMgTXRo9FoJO4jidQLFXo2ht8qNNcIrXgvTJDt1cVip+npPlZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nIcakNYS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nIcakNYS"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 564A21F000E9;
	Thu,  2 Jul 2026 18:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783018635;
	bh=dI9q2GiXTUCWlGPiMDSgFHntAYfnC4FC2hwVFyuyAJA=;
	h=From:To:Cc:Subject:Date;
	b=nIcakNYS9VrpIskmzOuMbsPvoqEcbI/h1YxPN7gq2Yb+QTok4BeZi4hCecUVZUSHj
	 zdipYe2JILoWCuNfbkKEGPzgzw//EYmmJgqP3zEjN5Royz04h0lPV0UTAk48OCEOeB
	 f6bO0D1HLSNK+QkLeTfEzvWbWhgTK5r0Z+uNzhBbBBK7Mi3zCH4kSdG84BboZaJdLE
	 fUIgZ9dMVK/cXCInU4tswxkc+h+IAlBx9HZtIa9zDxwZsL5ZAk0fRNcsBO0ejbk7pq
	 MMGIoyc14e564p2vuXenpk70P+alc2KiDbUrswBmNnTl6af/eWt1ta79yNiJt7xvGp
	 9YwjjqCtQeW7w==
Message-ID: <706f31e9c125d17fbca0a5ed648f4933@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v7.2-rc1
Date: Thu, 02 Jul 2026 19:57:06 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.2-rc1

for you to fetch changes up to 83245e7a436c04e511378af14dd81fd188b41541:

  ASoC: rsnd: src: Add missing scu_supply clock to suspend/resume (2026-07-02 18:56:38 +0100)

----------------------------------------------------------------
ASoC: Fixes for v7.2

A fairly standard set of driver specific fixes and quirks that have come
in since the merge window, plus a MAINTAINERS update.  The tas675x
READ_ONCE change is probably not actually fixing issues properly but we
need a whole new approach to concurrency there and it came along with
some good fixes.

----------------------------------------------------------------
Jetha Chan (1):
      ASoC: amd: yc: Add Alienware m15 R7 AMD to DMIC quirk table

John Madieu (2):
      ASoC: rsnd: adg: make rsnd_adg_clk_control() idempotent
      ASoC: rsnd: src: Add missing scu_supply clock to suspend/resume

Luca Weiss (1):
      ASoC: codecs: lpass-va-macro: Fix LPASS Codec Version for SC7280

Mark Brown (1):
      ASoC: codecs: tas675x: misc bugfixes and minor changes

Sen Wang (3):
      ASoC: codecs: tas675x: use READ_ONCE for params to be used concurrently
      ASoC: codecs: tas675x: Fix CHx temperature range register bit fields
      Documentation: sound: tas675x: Fix temperature range and impedance documentation

Vijendar Mukunda (1):
      MAINTAINERS: ASoC: SOF: add AMD reviewer for Sound Open Firmware

Yousef Alhouseen (1):
      ASoC: SOF: validate probe info element counts

 Documentation/sound/codecs/tas675x.rst | 11 ++++++-----
 MAINTAINERS                            |  1 +
 sound/soc/amd/yc/acp6x-mach.c          |  7 +++++++
 sound/soc/codecs/lpass-va-macro.c      |  7 ++++++-
 sound/soc/codecs/tas675x.c             | 14 +++++++-------
 sound/soc/renesas/rcar/adg.c           | 29 ++++++++++++++++++++++++++++-
 sound/soc/renesas/rcar/src.c           |  2 ++
 sound/soc/sof/sof-client-probes-ipc3.c | 23 +++++++++++++++++++----
 sound/soc/sof/sof-client-probes-ipc4.c | 11 ++++++++++-
 9 files changed, 86 insertions(+), 19 deletions(-)
