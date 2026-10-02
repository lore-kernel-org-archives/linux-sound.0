Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4203AFD18
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 12:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790944547; cv=none; b=SHyn/dxyhDoNmrzwlGl7sEdNm/FVXbPGvgt4FtYzIuBlGjR7Xt8ff+w0kR3h6GqJ7B8lVgAloJjwYlI1ym0ZkZL7BC3VMpnOOE/Tjss9Ml1QNlfKUOniHNduQaJZVBOo/SJAfhvs62fpRsjZ0yhaw8UdjbEZQgj+CBzwj9rYAuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790944547; c=relaxed/simple;
	bh=cKlpFm+ZRop2reJaXu0njUKTkQbR7hNkQvVg6oiGwRA=;
	h=Message-ID:From:To:Cc:Subject:Date; b=e+m2X4xezD4svwpTGCLZlZDLzVuH0f053xyMXqTAerA4rK+CALWppmn0Ofu5WRVxQ30+5WZIotvi9KqoFNKDydYcNr2V1IsksVdGv+nRQ9kEXOjZevV2pcV5Sy6kl91xh+qyjprwD/rttXTI9noBPy8TTDLLbNbEm+hikSU0Pjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JA6fyseZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JA6fyseZ"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id BF3C61F00893;
	Fri,  2 Oct 2026 12:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790944546;
	bh=iq7OODU+HlVaqh5q9K4r3eGlByYqRCkLrjDga6KBjYg=;
	h=From:To:Cc:Subject:Date;
	b=JA6fyseZHhTDbXuqnw0qbbmR/qWoGWl+80KednVGkzDC5mk/kO7sFQveCHdhbmlLY
	 zxa8qsEdCrvpmFb2WJ8aM+2ECNLRQIhW7SNe8hthuz/TAu6TknDNNZbMOatpmsNJJU
	 tww53fgozh4QpVJdveNocq3xl0sYz8wn6kDQ5cSXJ/6mI3NL4JTG6MNu09328bC/Un
	 C0bA5LpS780Xd0CO8Ll0yni0nq1vsQRmhRZtrclF976SpIAK2tQyvSr9GzSIBZog5i
	 WC0PoWOTX3ZsOYmTwSGgKanRto7QqMR3bbE/vLWzY3sMyEsWdPu5B5YvZME8nqmQkG
	 ZE/VHe4jlGeww==
Message-ID: <ac1f5abe5b1f49157574990efcd4eaf2@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v7.3-rc5
Date: Fri, 02 Oct 2026 13:35:32 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit 93f51579e7df248780214094418f205253383cc5:

  Linux 7.3-rc4 (2026-09-20 13:48:15 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.3-rc5

for you to fetch changes up to cad16d850e3759dd82cd869f739b56e9844a1fee:

  spi: cs42l43: Workaround for wrong speaker ID on Dell XPS 13 DX13260 (2026-10-01 16:38:05 +0100)

----------------------------------------------------------------
ASoC: Fixes for v7.3

A bigger collection of fixes than usual due to your vacation but nothing
hugely remarkable here, just fairly standard quirks and driver specific
bugfixes.

----------------------------------------------------------------
Arnd Bergmann (1):
      ASoC: rt766: fix HID dependency for SND_SOC_SDCA_HID

Cezary Rojewski (2):
      ASoC: codecs: rt286: Revert delay value for jack setup
      ASoC: codecs: rt274: Fix format setting for 44100 rate

Charles Keepax (1):
      ASoC: Intel: Add quirk to block match table for Lenovo Yoga Slim 7

Daniel Ortiz (1):
      ASoC: amd: yc: Add DMI quirk for Lenovo V15 G6 ARP

HyeongJun An (1):
      ASoC: wm8903: Move the DRC QR threshold to the register that holds it

Jasper Firth (1):
      ASoC: Intel: bytcr_rt5651: Add quirk for Chuwi Hi8 with generic DMI strings

Jiangshan Yi (2):
      ASoC: codecs: max98363: fix uninitialized stream_config->type
      ASoC: codecs: rt1017-sdca-sdw: fix uninitialized stream_config->type

Liviu Nicoara (1):
      ASoC: codecs: lpass-wsa-macro: rewrite the interpolator volume after enabling clocks

Maciej Strozek (2):
      ASoC: SDCA: Set suspended flag after resuming within system suspend
      ASoC: SDCA: Add better pm_runtime error handling in func probe

Mark Brown (1):
      ASoC: SDCA: Power management fixes for the class function driver

Richard Fitzgerald (1):
      spi: cs42l43: Workaround for wrong speaker ID on Dell XPS 13 DX13260

Seiji Adachi (1):
      ASoC: amd: yc: Add Lenovo ThinkPad E16 Gen 2 (21JN) to quirks

Sheetal (1):
      ASoC: tegra: Fix ASRC Stream6 input threshold control

Syed Saba Kareem (1):
      ASoC: amd: acp: enable TAS2783 and add RT712-VB SoundWire machine

Zhang Heng (2):
      ASoC: amd: acp: Add DMI quirk for Lenovo Yoga Pro 7 14ASP9
      ASoC: amd: acp-config: Add ACP70 DMI quirk for ASUS UM5406GA

Zimeng Li (1):
      ASoC: qcom: lpass-cpu: use DAI table index for playback constraints

 drivers/spi/spi-cs42l43.c                          | 97 ++++++++++++++++++++++
 sound/soc/amd/acp-config.c                         | 14 ++++
 sound/soc/amd/acp/Kconfig                          |  1 +
 sound/soc/amd/acp/amd-acp70-acpi-match.c           | 20 +++++
 sound/soc/amd/yc/acp6x-mach.c                      | 14 ++++
 sound/soc/codecs/Kconfig                           |  4 +-
 sound/soc/codecs/lpass-wsa-macro.c                 |  3 +
 sound/soc/codecs/max98363.c                        |  2 +-
 sound/soc/codecs/rt1017-sdca-sdw.c                 | 27 ++----
 sound/soc/codecs/rt274.c                           |  4 +-
 sound/soc/codecs/rt286.c                           |  2 +-
 sound/soc/codecs/wm8903.c                          |  2 +-
 sound/soc/intel/boards/bytcr_rt5651.c              | 17 ++++
 sound/soc/intel/common/soc-acpi-intel-lnl-match.c  |  1 +
 .../soc/intel/common/soc-acpi-intel-sdca-quirks.c  | 16 ++++
 .../soc/intel/common/soc-acpi-intel-sdca-quirks.h  |  1 +
 sound/soc/qcom/lpass-cpu.c                         |  4 +-
 sound/soc/sdca/sdca_class_function.c               | 19 +++--
 sound/soc/tegra/tegra186_asrc.c                    |  2 +-
 19 files changed, 215 insertions(+), 35 deletions(-)
