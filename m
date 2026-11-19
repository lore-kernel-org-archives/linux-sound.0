Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795128129;
	b=AJFvPlIrrl3EfI46F6K1JnINawS2CAhPwVF7rFslA42IohNNmxz7TJRheB0Rm1KWwfBF
	 FCn0EbqyfsaKyKEqTZlX/cCVUlE4LwizhuioanOx/gt6zOcQBOkP0zT71GC1ix2a9EoM5
	 /RRekuddSG7GpU3FM+4sVHqUqHMiaSOHO+SZbuXvilm87og6q1xpj+SWkmuC7PTcfQQmA
	 OY4P2B4qaGa0KuyVPqfp7JTAOq4gtUFpD2Se/4WcP90flPThh81gs/lWqxPET+00eZJvY
	 C87p0+asEqUbqljZQ67hQUuzx3FJEmp9hpgKw5p6o/V2wJ25QvLQNMa+ZH6WkU2VwCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795128129;
	h=Received:DKIM-Signature:Message-ID:From:To:Cc:Subject:Date;
	bh=/O1B1xDAZlirZkNxJzaQl6uJoZo21AYtgyaaiGTPBGg=;
	b=bR1x6I4z1A+2nLGoQ4lrYkcfrbHd7Cf5qrvcyyLEvZK2Il9sAcUQ0NOCz+/myK/Arjbj
	 lOWLayVJkcx9rpc/1I6UCF40IG4H3ROnFz0HbGgkva1xXnU6+keXfe+G4UROa8m74Sxek
	 o9SnK9Dn5erzsyHyaRBXG4+YZ9oauiF1j3/0RzwnN0hIIEQO9YL7gnqBqrrZTXBqeJNIr
	 BCxDh2CdrxSTnV4XD4y0GwCSfp5+4eFYv4Q+u3U4NwERI2ZLtWD5knmPud8c5oFAuyPVD
	 BRRsfiApFX3niQR7TK4KicbPCChrjBo4xJRv/+mTqUZ52MA2zSwRjbWltzGx4bZWivQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a2Q5aYHO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 0C053606A320
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 22:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a2Q5aYHO
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 7156D1F000C6;
	Thu, 19 Nov 2026 22:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795128128;
	bh=/O1B1xDAZlirZkNxJzaQl6uJoZo21AYtgyaaiGTPBGg=;
	h=From:To:Cc:Subject:Date;
	b=a2Q5aYHOboRXFZPmuS9Le00ETRVWXOc3ky1KX6BJRs8oHHFUH7Bj1HFacIEHwPEAV
	 6uITPrLxlRqDhdTaUayWNDgzSH/fuWUriE1cxqOWhkQ1lUa5OBY6lknSgaxSvawTzH
	 WHnbq/jL0coapV1SwZIqn+htGm0Ub2M0MgN/H+Z9WGhrnXUg+wgS3cISTPu/n+qnSq
	 WPUhDnmcltf1B+5iQDIa8nFylJWHjIqXMAyNIA4hNHUgUlwCrlVxzWRj0mJYKmB5Ly
	 eWehnhXyCRrr9iiCoRBYAC+q4/FJ0dM0kzZu/IN2fXZP/91sjBjdKOXxQEQ/ynT+b8
	 xOPubtGoHxepA==
Message-ID: <1d2dffbb27f822112be2ca68c0bcf7d8@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v7.4-rc3
Date: Thu, 19 Nov 2026 22:41:25 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

The following changes since commit aebb7274476403040d582c61478df8f4a7bf9cd3:

  Linux 7.4-rc3 (2026-11-15 14:30:11 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.4-rc3

for you to fetch changes up to f66297be665c067d2e96da9ce1c5767b587e17b7:

  ASoC: tas2781: Avoid possible zero-division (2026-11-19 17:34:26 +0000)

----------------------------------------------------------------
ASoC: Fixes for v7.4

Quite a lot of fixes here together with a few quriks for new devices,
mostly not particularly remarkable.  The Cirrus changes are relatively
large but reasonably so, there's a bunch of data table updates and a
couple of new functions needed and they come with clear reasonining.

----------------------------------------------------------------
Adolfo Morales Tena (1):
      ASoC: amd: yc: Add DMI quirk for GIGABYTE EAGLE 9MJ

Chen Yuxi (1):
      ASoC: wm8962: Fix broken headset button caused by wrong guard constant

Gaurav Suman (1):
      ASoC: codecs: wcd934x: keep MCLK enabled so init writes reach the codec

Julius Bairaktaris (2):
      ASoC: qcom: q6apm-dai: reject compress rings larger than the DMA buffer
      ASoC: qcom: q6asm-dai: reject compress rings larger than the DMA buffer

Karl Asseily (1):
      ASoC: es9039q2m: Enable the DAC clock at component probe

Louis-Alexis Eyraud (1):
      ASoC: mediatek: mt8195: Fix ETDM3_OUT DAI startup error

Marc Herrero (2):
      ASoC: qcom: audioreach: use a 32-bit container for S24_LE PCM
      ASoC: qcom: audioreach: only disconnect the route a mixer control owns

Mark Brown (4):
      ASoC: cs35l56: Series to stop writing ASP registers the driver doesn't own
      ASoC: qcom: audioreach: fix S24_LE playback and route mixer disconnects
      ASoC: qcom: qdsp6: bound the compress ring by the DMA buffer
      ASoC: meson: gx-formatter: change stream lock from mutex to spinlock

Nicholas E. Andrade (1):
      ASoC: amd: acp: fix PDM ring buffer address on ACP7.x resume

Qianghua Wang (1):
      ASoC: sn624x: add support for the SN6245 part ID

Richard Fitzgerald (2):
      ASoC: cs35l56: Only write ASP1TXn registers when widget is powered-up
      ASoC: cs35l56: Fix unwanted writes to ASP config registers

Takashi Iwai (1):
      ASoC: tas2781: Avoid possible zero-division

Tim Surber (1):
      ASoC: rockchip: i2s-tdm: Don't reset a pending clear in consumer mode

Valerio Setti (3):
      ASoC: meson: aiu-fifo: prevent sleeping when spinlock is held
      ASoC: meson: gx-formatter: change stream lock from mutex to spinlock
      ASoC: meson: gx-formatter: add lockdep_assert_held check

suso (1):
      ASoC: amd: acp: Add ACP70 ACPI flag override for LG gram 16U55U

yzddMr6 (1):
      ASoC: qcom: q6dsp-lpass-clocks: Set driver data before registering clocks

 include/sound/cs35l56.h                           |   2 +-
 sound/soc/amd/acp-config.c                        |   7 ++
 sound/soc/amd/acp/acp-legacy-common.c             |   5 +-
 sound/soc/amd/yc/acp6x-mach.c                     |   7 ++
 sound/soc/codecs/cs35l56-shared.c                 |  38 +-----
 sound/soc/codecs/cs35l56.c                        | 147 +++++++++++++++++-----
 sound/soc/codecs/cs35l56.h                        |   1 +
 sound/soc/codecs/es9039q2m.c                      |  12 ++
 sound/soc/codecs/sn624x-sdca-sdw.c                |   2 +
 sound/soc/codecs/tas2781-fmwlib.c                 |   2 +-
 sound/soc/codecs/wcd934x.c                        |   6 +
 sound/soc/codecs/wm8962.c                         |   2 +-
 sound/soc/intel/common/soc-acpi-intel-arl-match.c |  18 ++-
 sound/soc/intel/common/soc-acpi-intel-lnl-match.c |  18 ++-
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c |  18 ++-
 sound/soc/intel/common/soc-acpi-intel-ptl-match.c |   9 ++
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c       |  30 ++++-
 sound/soc/meson/aiu-fifo-i2s.c                    |  15 ++-
 sound/soc/meson/aiu-fifo-spdif.c                  |  14 ++-
 sound/soc/meson/aiu-fifo.c                        |   3 +-
 sound/soc/meson/gx-formatter.c                    |  26 ++--
 sound/soc/meson/gx-formatter.h                    |   4 +
 sound/soc/meson/gx-interface.h                    |   3 +-
 sound/soc/qcom/qdsp6/audioreach.c                 |  10 +-
 sound/soc/qcom/qdsp6/q6apm-dai.c                  |   3 +
 sound/soc/qcom/qdsp6/q6asm-dai.c                  |   3 +
 sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c         |  14 +--
 sound/soc/qcom/qdsp6/topology.c                   |   4 +-
 sound/soc/rockchip/rockchip_i2s_tdm.c             |  47 +++++++
 sound/soc/sdw_utils/soc_sdw_utils.c               |  56 ++++++++-
 30 files changed, 413 insertions(+), 113 deletions(-)
