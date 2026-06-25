Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3618C23E25B
	for <linux-sound@vger.kernel.org>; Thu, 25 Jun 2026 17:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782406889; cv=none; b=Q7deAz1PMT7l8OZJXmLbRnFD5AykMG8GGE4DX5TJfqC84nZ1Cth1K09UDYPxpZLMhIGxeXWVNmfl5DdoRPL2nMaA7dfotxp1NxVYzML5xTqGAHabA2tKr7S9s/qG9clHE7qYkGnO9V8Y6k8WObXkDY6OX5M2DXM2kA7DrqtiLVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782406889; c=relaxed/simple;
	bh=V3t0lYJfVLfi6ASNtlsskXfQdiP7sp/9Kyfp7JhIjdQ=;
	h=Message-ID:From:To:Cc:Subject:Date; b=FgfBMZt1TfFE3OZSP+CTNXyQIP9K7D4KzDyXobzfwij/VF+HfPyZopkla4lppajPOUklEnNiJLXXA8dGAJPHcDVF5exi1TKxZuSeuwMmQW1griKvhaq5rpKjuPPOo/7BsJ+j4mFX1Sc54ClAz5RyDWfw+rgvR7Aqg7r0Xfi5hfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T5yhb5Sb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T5yhb5Sb"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 62F4D1F000E9;
	Thu, 25 Jun 2026 17:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782406887;
	bh=TqWxG8nR5Xf9Ymfer2/6ARrr2Ipm/881jg9J2i1RkYU=;
	h=From:To:Cc:Subject:Date;
	b=T5yhb5SbbKVeXsiFBrrenpKIIyO9l0wfy+eRVKbJ+9BExVD0jM6JZW1Q3fhNNyH49
	 LFW8il9EmAd91IQGW9CWt8cpeSCzdFhE7ZdtLcGi+AW4kXXHgRsXPEr6vymkZ2J2l+
	 M3akEl1GcCKEUsiD7VFzJs7sLIC2Md98RP/Q0QmlDz5mO/qHnO0nDndRUoe6d4jO0S
	 6xzmFpv60bxGnCTlB2wgc7br5G9dKBl2ZP6OMq5GfNaEs+tnXMrre/gMFzKute8nyw
	 wm6+nLnr1KXL+1mzBNtz3BcItQZCk1QdqJe5fDnUlPtEs8RMvNeMeK5k0VpsI/2nMt
	 uskTbAApxxvKQ==
Message-ID: <8d888870bec370f9abaad606055cdb75@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v7.2-merge-window
Date: Thu, 25 Jun 2026 18:01:19 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit 4346d91cfa47b0d9303533edde8acd33e4b9ca40:

  ASoC: dt-bindings: Fix RT5677 "realtek,gpio-config" type (2026-06-14 01:03:38 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.2-merge-window

for you to fetch changes up to cf6f56990ea21172e085f0588e5bbf2089ce8f58:

  ASoC: fsl_asrc_dma: fix eDMA maxburst misalignment with channel count (2026-06-25 14:56:27 +0100)

----------------------------------------------------------------
ASoC: Fixes for v7.2

We've got a good collection of device specific fix here, plus a couple
of stand out things:

 - Richard fixed some special cases with the new device_link creation
   by more gracefully handling any errors during creation.
 - Charles did some light refactoring of the SoundWire interfaces to
   fix some persistent randconfig issues that people kept running into.

----------------------------------------------------------------
Ahmad Fatoum (1):
      ASoC: cs530x: Fix expected MCLK rates for CS5302/4/8

Alvin Šipraga (1):
      ASoC: audio-graph-card2: Drop warning for manually selected DAI formats

Baojun Xu (1):
      ASoC: tas2781: Update default register address to TAS2563

Bartosz Juraszewski (1):
      ASoC: tas2783: Update loaded firmware names to linux-firmware 20260519

Charles Keepax (5):
      soundwire: Move wait for initialisation helper to header
      ASoC: es9356: Add back local call to sdw_show_ping_status()
      ASoC: max98373: Add back local call to sdw_show_ping_status()
      ASoC: ti: Add back local call to sdw_show_ping_status()
      ASoC: realtek: Add back local call to sdw_show_ping_status()

Christian Hewitt (1):
      ASoC: codecs: pcm512x: only print info once on no sclk

HyeongJun An (1):
      ASoC: SDCA: Validate written enum value in ge_put_enum_double()

Mark Brown (1):
      ASoC: Fix SoundWire randconfig issues

Nicolas Frattaroli (1):
      ASoC: rockchip: Drop problematic guard() changes

Oder Chiou (1):
      ASoC: rt5575: Use __le32 for SPI burst write address

Richard Fitzgerald (1):
      ASoC: soc-core: Don't fail if device_link could not be created

Sen Wang (1):
      ASoC: tlv320aic3x: restrict CLKDIV bypass Q values in dual-rate mode

Shengjiu Wang (1):
      ASoC: fsl_asrc_dma: fix eDMA maxburst misalignment with channel count

Shuming Fan (1):
      ASoC: rt5650: enhance spk protection function

Srinivas Kandagatla (1):
      ASoC: qcom: q6apm: fix NULL pointer dereference in graph_callback

Uwe Kleine-König (The Capable Hub) (1):
      ASoC: rockchip: rockchip_sai: #include <linux/platform_device.h> explicitly

 drivers/soundwire/bus.c               |  28 ----
 include/linux/soundwire/sdw.h         |  38 +++--
 include/sound/soc-component.h         |   4 +
 include/sound/tas2781.h               |   4 +-
 sound/soc/codecs/cs530x.c             |  29 +++-
 sound/soc/codecs/cs530x.h             |   6 -
 sound/soc/codecs/es9356.c             |   4 +-
 sound/soc/codecs/max98373-sdw.c       |   4 +-
 sound/soc/codecs/pcm512x.c            |   2 +-
 sound/soc/codecs/rt1017-sdca-sdw.c    |   4 +-
 sound/soc/codecs/rt1308-sdw.c         |   4 +-
 sound/soc/codecs/rt1316-sdw.c         |   4 +-
 sound/soc/codecs/rt5575-spi.c         |   2 +-
 sound/soc/codecs/rt5645.c             |   6 +-
 sound/soc/codecs/rt5645.h             |   1 +
 sound/soc/codecs/rt5682-sdw.c         |   4 +-
 sound/soc/codecs/rt700-sdw.c          |   4 +-
 sound/soc/codecs/rt711-sdca-sdw.c     |   4 +-
 sound/soc/codecs/rt712-sdca-dmic.c    |   4 +-
 sound/soc/codecs/rt712-sdca-sdw.c     |   4 +-
 sound/soc/codecs/rt715-sdca-sdw.c     |   4 +-
 sound/soc/codecs/rt715-sdw.c          |   4 +-
 sound/soc/codecs/rt721-sdca-sdw.c     |   4 +-
 sound/soc/codecs/rt722-sdca-sdw.c     |   4 +-
 sound/soc/codecs/tac5xx2-sdw.c        |   4 +-
 sound/soc/codecs/tas2783-sdw.c        |  77 ++++++----
 sound/soc/codecs/tlv320aic3x.c        |  25 +++-
 sound/soc/fsl/fsl_asrc_dma.c          |  20 +++
 sound/soc/generic/audio-graph-card2.c |  12 --
 sound/soc/qcom/qdsp6/q6apm.c          |   8 ++
 sound/soc/rockchip/rockchip_sai.c     | 263 +++++++++++++++++-----------------
 sound/soc/sdca/sdca_asoc.c            |   3 +
 sound/soc/soc-core.c                  |  35 ++---
 33 files changed, 362 insertions(+), 261 deletions(-)
