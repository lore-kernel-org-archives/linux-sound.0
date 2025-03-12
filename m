Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73651245013
	for <linux-sound@vger.kernel.org>; Wed, 12 Mar 2025 14:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741788509; cv=none; b=TQUWniil7xrT4YkMr9+zoSYYwYPeP6KOha1Tu66hpleWsmDUQwycp1Bpnpc5AILMI2ir2gT4CWpD1oj0M9EPW8bk0s+jqB16Jackehl72ZXA2V/vKn4POvBu27u9PUsrWb09d2UaTUhwipqaw2Tn3tYeEx5iQEmchxkd1FDyVwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741788509; c=relaxed/simple;
	bh=kEsDpTKxQ3UQq71PcqQdVH0yUmbushia9MrK7Fmz9qc=;
	h=Message-ID:From:To:Cc:Subject:Date; b=fwLXmYWdoHmRksGNqKeTR7qHnIUOTmg9lbkyX3HPH9j/+9qgNafBLeRrUhj2VHxYAge4MoT+CjSDZ+p4u6uepPp2UWsJxOdP17+Ag4MXe1JPpPZ0xKZNqdnm1CSaEpCdsGaecaZe7FBmriKxE8IeVEPwTp+gtlwNQFECIPgTiuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IvhUo4o7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IvhUo4o7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88E7BC4CEDD;
	Wed, 12 Mar 2025 14:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741788508;
	bh=kEsDpTKxQ3UQq71PcqQdVH0yUmbushia9MrK7Fmz9qc=;
	h=From:To:Cc:Subject:Date:From;
	b=IvhUo4o7ewlByC9FOamurULHAZd14wHAYKX0UlBdxxMvgGP9G+UID1Fznh6mjf7/Q
	 R2emWbaTOVSOcblDwwwZW/Z1GknBo3ESVFQmKAZRalmH8nA84koa+HpAriLSnAGfjx
	 dfcxPtuuiF3pMTBK9lY7nzaaNIe3dueNAgfyvr8kBdqooeVwlJWp9jm9CaK7dHu5/V
	 ZN0jFMej6oSkoi/6AmG2E7BsS7Sjazckf5lX7MrW/jLeo9rBJ1wY1omSyeb0iLpoRY
	 ORLeYgkMIZ+tfEpP6gFM2rIPddlqQeLl5PsOwmzDWvWfU4L52689iUuLIWq4jPxpYX
	 wDcLOqhTmwSkQ==
Message-ID: <3e8be5877ad35b6bc8fb2d148378ea90.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.14-rc6
Date: Wed, 12 Mar 2025 14:08:20 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit 7eb172143d5508b4da468ed59ee857c6e5e01da6:

  Linux 6.14-rc5 (2025-03-02 11:48:20 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.14-rc6

for you to fetch changes up to ed92bc5264c4357d4fca292c769ea9967cd3d3b6:

  ASoC: codecs: wm0010: Fix error handling path in wm0010_spi_probe() (2025-03-11 13:51:52 +0000)

----------------------------------------------------------------
ASoC: Fixes for v6.14

The bulk of this is driver specific fixes, mostly unremarkable.  There's
also one core fix from Charles, fixing up confusion around the limiting
of maximum control values.

----------------------------------------------------------------
Alexey Klimov (1):
      ASoC: codecs: wsa884x: report temps to hwmon in millidegree of Celsius

Bard Liao (2):
      ASoC: rt1320: set wake_capable = 0 explicitly
      ASoC: rt722-sdca: add missing readable registers

Charles Keepax (2):
      ASoC: ops: Consistently treat platform_max as control value
      ASoC: cs42l43: Fix maximum ADC Volume

Christophe JAILLET (1):
      ASoC: codecs: wm0010: Fix error handling path in wm0010_spi_probe()

Maciej Strozek (1):
      ASoC: cs42l43: Add jack delay debounce after suspend

Peter Ujfalusi (1):
      ASoC: Intel: sof_sdw: Fix unlikely uninitialized variable use in create_sdw_dailinks()

Thomas Mizrahi (1):
      ASoC: amd: yc: Support mic on another Lenovo ThinkPad E16 Gen 2 model

Thorsten Blum (1):
      ASoC: tegra: Fix ADX S24_LE audio format

 include/sound/soc.h               |  5 ++++-
 sound/soc/amd/yc/acp6x-mach.c     |  7 +++++++
 sound/soc/codecs/cs42l43-jack.c   | 13 ++++++++++---
 sound/soc/codecs/cs42l43.c        | 17 +++++++++++++++--
 sound/soc/codecs/cs42l43.h        |  3 +++
 sound/soc/codecs/rt1320-sdw.c     |  3 +++
 sound/soc/codecs/rt722-sdca-sdw.c |  4 ++++
 sound/soc/codecs/wm0010.c         | 13 +++++++++++--
 sound/soc/codecs/wsa884x.c        |  4 ++--
 sound/soc/intel/boards/sof_sdw.c  |  2 +-
 sound/soc/soc-ops.c               | 15 +++++++--------
 sound/soc/tegra/tegra210_adx.c    |  4 ++--
 12 files changed, 69 insertions(+), 21 deletions(-)
