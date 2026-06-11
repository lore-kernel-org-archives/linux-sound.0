Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35C53BD63C
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 18:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781201485; cv=none; b=RjUYUu/Os39MLjHRK0F+6lJvQNClZ90MeCUWuxFKjJ4ilkNGNXbrQZ4zDXmV6QGl7Fl8R0xQMlPGxFrw2PBYq/mKtnojbeg8Ev0zSpIkjgJz23WXPjvorzTNBj4yKpo7YfHsiNhj8deUW8QXmOEZ9aI4Q2VBl8YlvEoRQckVxMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781201485; c=relaxed/simple;
	bh=2mPdjtvsiUXJwnWeZr/bCd12CI23WbeabXizj60OHUw=;
	h=From:To:Cc:Subject:Date:Message-Id; b=FH8EuOiOB4C/qLTMOrSC5IHTAOUL74uFkKnEDdsou4oXIGJDAdzJbIRRt/1ZUUf/AJLi5ne4r9O8tCYi3q2sWEWG2UpSna8S0NOytD/YSQ12hdvySt3TEanyGVVLvs3ezQKB4FNB9fRvYCxGlrcTI6uyTevyyy2He6/C41WLH8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UJw+db5U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UJw+db5U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 966B91F000E9;
	Thu, 11 Jun 2026 18:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781201484;
	bh=0dmoQoa1X598o8W/0EXkMSQt4rutkNrxsgppAFzqAA8=;
	h=From:To:Cc:Subject:Date;
	b=UJw+db5UX2UecNGT5XmrffIzDleigE1n/tbXNxhEosaWg3VoJDqecjG9RUrSxINVZ
	 oNoJITfdWNy+9RkFV7RFYB3S3sQXtCpdGg4RQixBLZC45QHS2ZL1GJLHSJrDCQO9cc
	 B1srk3J756nw9DqzRIyTGUqttlxzOxPwWFwlnfA8rlRAi4iu9BHfL1FMNwSi7tFFRn
	 eGv9zP+NeIKaNg5e2GSmI2OgIrUZQmUCVcDtiLZLk3Roxi/A9yFuTOm9G9U/7stC0J
	 PtMCAz9bne9fU20hvwYikzZNZu27C1i/8I3AE/rTsyhQ0rW0qndr/rrirI2FuWi/l6
	 gwE6S7m5hGH3w==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 2822E1AC56C9; Thu, 11 Jun 2026 19:11:19 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v7.1-rc7
Date: Thu, 11 Jun 2026 19:11:12 +0100
Message-Id: <20260611181119.2822E1AC56C9@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit d2dcd85f9e09fe3566d4cdcd357856a42ac73f93:

  ASoC: amd: acp70: add standalone RT721 SoundWire machine (2026-06-04 11:35:06 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.1-rc7

for you to fetch changes up to e4c60a1d4b6ccc66aefb3789cd908d4f9482eefd:

  ASoC: SDCA: fix NULL pointer dereference in sdca_dev_unregister_functions (2026-06-11 15:55:23 +0100)

----------------------------------------------------------------
ASoC: Fixes for v7.1

A few more fixes for this release, some smaller driver specific ones
plus a final quirk.

----------------------------------------------------------------
Felix Gu (1):
      spi: rzv2h-rspi: Fix SPDR read access width for 16-bit RX

Kean Ren (1):
      ASoC: SDCA: fix NULL pointer dereference in sdca_dev_unregister_functions

Li Jun (1):
      ASoC: loongson: Fix invalid position error in ls_pcm_pointer

Richard Fitzgerald (1):
      ASoC: wm_adsp: Fix NULL dereference when removing firmware controls

Vijendar Mukunda (2):
      ASoC: SOF: amd: fix for ipc flags check
      ASoC: SOF: amd: set ipc flags to zero

Zhang Heng (1):
      ASoC: amd: yc: Add DMI quirk for ASUS EXPERTBOOK PM1403CDA

 drivers/spi/spi-rzv2h-rspi.c          |  3 ++-
 sound/soc/amd/yc/acp6x-mach.c         |  7 +++++++
 sound/soc/codecs/wm_adsp.c            |  3 +++
 sound/soc/loongson/loongson_dma.c     | 12 ++++++++++--
 sound/soc/sdca/sdca_function_device.c | 24 +++++++++++++++++++++---
 sound/soc/sof/amd/acp-ipc.c           |  4 ++--
 sound/soc/sof/amd/acp.c               | 28 ++++++++++++++++++++++++++++
 sound/soc/sof/amd/acp.h               |  2 ++
 8 files changed, 75 insertions(+), 8 deletions(-)
