Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EB337DABE
	for <linux-sound@vger.kernel.org>; Sun,  5 Jul 2026 11:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783252351; cv=none; b=GPpAM35EMq5qkxjm9LbLNS0Od/OHpFJ6vl6BhxZCf/arIjRsfp2rdcRV/Nl62U/yfOObNQT2Jybpz/hchdqDZ9rFSQMXQne0dkHDXI2GSlcl6dqJXwb0L5YNv9tv1n3IfI/zyUUzGW0H0v7sla51Bl9z5gSb2EENvRLo4cmbNcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783252351; c=relaxed/simple;
	bh=CLSuzdCc+04rTJajNgr/4YoXL0buOBV+ftEj0jyiyHE=;
	h=From:To:Cc:Subject:Date:Message-Id; b=lms+fA/yUs4ujN/zk2b87N4aXtAXYWU+0kJZsBkhGUA+LZufjp21abgG6BTQVtUxlRE7DGEP8CNrPX6Ge0Z4BW+VUTGP7xL0wzioDQCSgpFlBi7CPD8MYWCb2asGHvanUxXQuvyJZEeSIi/+DuVtDQNy09k08/8LlvLaxrXCrX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YE91ZbSN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YE91ZbSN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F6661F000E9;
	Sun,  5 Jul 2026 11:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783252348;
	bh=dI9q2GiXTUCWlGPiMDSgFHntAYfnC4FC2hwVFyuyAJA=;
	h=From:To:Cc:Subject:Date;
	b=YE91ZbSNOI6MVXfhW9LCEV5FSP0/1DqGx201eZnCv4zFndlWiQht4XfiVZ1aEg528
	 hoUdsH8f0VvCZdwYAzMaiBVMpQQbdcF0xC7q4bStC8iZ2MN9YCk1JSO1gYTPhvNeXj
	 kueMPVV1ct945lLRanOSfi9lJ6XyIXGXR+7BaLePBN+9tXwVNofvySc2XULjHl9d2B
	 m2kOp9aGXGDMEtexSVatLdPh2ZcrwNdHK0ppXUcyy3EYRxI0OsJ3rA9OwS16/9cg/p
	 9ynYc7O1VKhthkfJIdDtmk3VE43xwYq8vGsR+DOoGP8wLj/1gvMcXe+Q580mCEmnYm
	 YVUUsIUXwnKFQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 1C9801AC5AC6; Sun, 05 Jul 2026 12:52:20 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v7.2-rc1
Date: Sun, 05 Jul 2026 12:52:19 +0100
Message-Id: <20260705115220.1C9801AC5AC6@finisterre.sirena.org.uk>
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
