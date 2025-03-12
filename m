Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6391EEA5F
	for <linux-sound@vger.kernel.org>; Wed, 12 Mar 2025 23:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741820602; cv=none; b=BQzqzevM3Jq6Mm4sH6yq+A3B7QI7AmdQAPefIkdeyKpPB2t7+lnQHBcPo4lWdi9U8tL5/Kx1dVATFPhT3tk50H+7M2RP5vb8c1J5x+7EkUyoi3oF7WhACcH5h9dEB2BL2i0sJslC6T3o+K31Rg2fV0XJR74sFIGOwfarogFzyeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741820602; c=relaxed/simple;
	bh=EI4Rzzkx3AcWML79PLKH00Y+nulelBJZhZlR/huDM9o=;
	h=Message-ID:From:To:Cc:Subject:Date; b=rFBLmz2DFEOBuB0mjN5hy8RAikDsudkpf/jYL44CJrLVhx0J7lnoqJ4UGU6z1e7NFMXsqmUQ0exEjeJkijJjeChJU87OEtyyP1x/GoC+hTRbCV4xRP7xXJbUgBu61H4oYfgRa6g0oDfwl0dagoIwSwAyaMpnTzWQHHF4kn4oRuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=apeOkDf7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="apeOkDf7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF983C4CEDD;
	Wed, 12 Mar 2025 23:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741820601;
	bh=EI4Rzzkx3AcWML79PLKH00Y+nulelBJZhZlR/huDM9o=;
	h=From:To:Cc:Subject:Date:From;
	b=apeOkDf7UXl992r/qMgqD1d3Xy/QZFMBQy26mwfezSn6trW1R1R97SIMtYvWCEOW8
	 GFPeX+JU/iWDpnsa/29aT+MWjwBwikdFQIwOyFeSHP3ka72rRhRqv6IlvgG00kEfe1
	 5WzDB+spuGlE7WC/E48r9JlRyH6AtuQopphHb4ZZrrfAvRy7gyBa/RH5DDoztqqWzf
	 KQqH9qFmha6M96mjYQfdRnWgZvnYoVYUdSiUNpsKwF0o0/ZpITVdkRlmBWgczuZSIm
	 3597GeWT38CDBjrBeMtdmwbUyeIorXhrZ0AEa1iQ4lOAaUa5VXf32gI8q9Zfex/YNc
	 SaIcYMysr22aQ==
Message-ID: <4a8fded6716eb0c56b8d3ce2c862df33.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.14-rc6
Date: Wed, 12 Mar 2025 23:03:17 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit 7eb172143d5508b4da468ed59ee857c6e5e01da6:

  Linux 6.14-rc5 (2025-03-02 11:48:20 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.14-rc6

for you to fetch changes up to 658fb7fe8e7f4014ea17a4da0e0c1d9bc319fa35:

  ASoC: cs42l43: convert to SYSTEM_SLEEP_PM_OPS (2025-03-12 16:12:24 +0000)

----------------------------------------------------------------
ASoC: Fixes for v6.14

The bulk of this is driver specific fixes, mostly unremarkable.  There's
also one core fix from Charles, fixing up confusion around the limiting
of maximum control values.

----------------------------------------------------------------
Alexey Klimov (1):
      ASoC: codecs: wsa884x: report temps to hwmon in millidegree of Celsius

Arnd Bergmann (1):
      ASoC: cs42l43: convert to SYSTEM_SLEEP_PM_OPS

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
