Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795747353;
	b=FTHtPMD5eWXQGIRMy8iHxy5fEVSF9vKrBRcw2XCx9wNXbZ7ATZcep4REQ1xKNoCCDxQx
	 95G2w14GieR7hDTthcEQuaqBlCQP1bduJmdZcVQ3nMkVJ4nxBdH3hUQcRtkOkkCusKy/a
	 s1yd2jCZH+/5FFk2oRjA7wv2+krZ8bt8TmxWeAfTtlrY1xT/yVC0/tCib5w5pZHuAD/jp
	 ky5ewInyXmfNahIyUawr2sBk6Tao230i2uMFFeVIkF5wUYndpor4s3jB3qzf9o0jdNoJk
	 F7Jb5/Up9GtrKyjIiYqd0dRMUWnPaARl9Lrn6ViLptb/wAfe9xKl6d/WQTcpB+ukZpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795747353;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id;
	bh=aWTgNdp3DLlsNb1upmQBOTRJ28t0xb8oDxlhzbKg2gE=;
	b=kXj3P6+8ErJpR7QI4eau9sE9uweCQUBhkK0HJiGqHp3c7n/h9qtv7kqCQm4IfqMz53g4
	 sd19L6RkRay1pqMb6eAjFefOobGSxP3fJUojYpJvR87HelbnNTOObJoq9yhIHt4xAVdQ2
	 fH07vBLtht8lNHsUV3nuEy880Qkivw8M+rbR4D6GkuJnyl0ikAgjOa7dJmxds1IrVgZqN
	 cIGMy9iYKMhNfkfW56bQh2hnSl2ZbWMzWeTvrMOKiUIlfMOdBx+pGUFxkSsIhKoPV1XbE
	 boBqCPVxhggzm/LIPvW7buJUudsa9I0Nviz0hHw65XDCees2KPlDv4Uf8hNTLwDYy7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lWijItAh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CDF606A31C
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 02:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lWijItAh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B75F1F00893;
	Fri, 27 Nov 2026 02:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795747352;
	bh=aWTgNdp3DLlsNb1upmQBOTRJ28t0xb8oDxlhzbKg2gE=;
	h=From:To:Cc:Subject:Date;
	b=lWijItAheEVPG3uQm1B+qfyFQc70q4D3XpyuwhO4KKhchiDYjYZKabIUg7sl/kSov
	 d6QlPMvhYp14x2X35fF6zf9Qg1L25SUUwjtlT4rXpp0j2dTSJxcRHjA/HtDMXqSINs
	 KYwdhbswvgnT6TEOHBBf6OoUnzDC2b+GKAvMkdXsoj17jeAAXv90vFW7Z50LbG+NEh
	 j/74uY8fUebfB/ggenKQba9EkRn1GZHo+d0lkxnmHxy4hs1FCHrGb1EDlNhsc7AdDr
	 j4oD0bBuY8vDAYzCmV8b4FgYG7xQqVXj5GbJq59yFDTeUU9myPgoArhD1hwlpNbR9t
	 ZqqtTPw1jmg8g==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 91DB03470DDE; Fri, 27 Nov 2026 02:42:36 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v7.4-rc4
Date: Fri, 27 Nov 2026 02:41:45 +0000
Message-Id: <20261127024236.91DB03470DDE@traversing.sirena.org.uk>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

The following changes since commit f66297be665c067d2e96da9ce1c5767b587e17b7:

  ASoC: tas2781: Avoid possible zero-division (2026-11-19 17:34:26 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.4-rc4

for you to fetch changes up to b4378764a58960a016a42506992eac86d4d4eaf9:

  ASoC: amd: yc: Add DMI quirk for HP 255R G10 (board 8D22) (2026-11-26 14:59:44 +0000)

----------------------------------------------------------------
ASoC: Fixes for v7.4

A fairly big but mostly routine pile of driver specific fixes and quirks
for v7.4.  The new Tegra support is the biggest thing here, it's all
data required by the newly added device, there's no real code in there
so while it was on the edge of getting applied for v7.5 it seemed fine
here.

----------------------------------------------------------------
Alen Tišljar (1):
      ASoC: amd: yc: Add DMI quirk for HP 255R G10 (board 8D22)

Anupama Kunkulagunta (2):
      ASoC: dt-bindings: tegra: Add Tegra268 ADMAIF support
      ASoC: tegra: ADMAIF: Add Tegra268 support

Arnav Kapoor (1):
      ASoC: SOF: control: reject out-of-range enum values

JaeHoon Kim (1):
      ASoC: amd: acp: Add ACP70 ACPI flag override for LG gram 15Z95U

James X. Nelson (1):
      ASoC: amd: yc: Enable DMIC on MSI Crosshair A18 HX A8WGKG

Marco Giunta (2):
      ASoC: aw88166: fix backup restoring the RE value instead of saving it
      ASoC: aw88399: fix register used to disable I2S TX

Mark Brown (3):
      ASoC: codecs: ES8326: issue about pop and Configuration
      ASoC: tegra: Add Tegra268 ADMAIF support
      ASoC: fsl_asrc/fsl_easrc: fix memory safety issues

Markus Paltian (1):
      ASoC: amd: acp: Add Lenovo IdeaPad Slim 5 16AKP10 to ACP70 override table

Mikolaj Kucharski (1):
      ASoC: amd: yc: Add DMI quirk for Xiaomi REDMI Book 14 2025 (AMD)

Stefan Ghetu (5):
      ASoC: fsl_asrc_m2m: fix out-of-bounds write when draining the output FIFO
      ASoC: fsl_asrc: fix pair ownership on repeated or failed hw_params
      ASoC: fsl_asrc_dma: release DMA channels on repeated hw_params
      ASoC: fsl_easrc: fix context ownership on repeated hw_params
      ASoC: fsl_asrc_m2m: allow only one task at a time per stream

Zhang Yi (4):
      ASoC: codecs: ES8326: Modify Clock Configuration
      ASoC: codecs: ES8326: issue about capture pop
      ASoC: codecs: ES8326: Modify the Initialization Configuration
      ASoC: codecs: ES8326: Adjust the delay during calibration

 .../bindings/sound/nvidia,tegra210-admaif.yaml     | 22 ++++++++
 sound/soc/amd/acp-config.c                         | 14 +++++
 sound/soc/amd/yc/acp6x-mach.c                      | 22 ++++++++
 sound/soc/codecs/aw88166.c                         |  2 +-
 sound/soc/codecs/aw88399-lib.c                     |  2 +-
 sound/soc/codecs/es8326.c                          |  8 ++-
 sound/soc/fsl/fsl_asrc.c                           | 22 ++++++++
 sound/soc/fsl/fsl_asrc_dma.c                       | 27 ++++++---
 sound/soc/fsl/fsl_asrc_m2m.c                       | 30 ++++++----
 sound/soc/fsl/fsl_easrc.c                          | 10 ++++
 sound/soc/sof/control.c                            |  5 ++
 sound/soc/tegra/tegra210_admaif.c                  | 66 ++++++++++++++++++++++
 sound/soc/tegra/tegra210_admaif.h                  | 18 ++++++
 13 files changed, 223 insertions(+), 25 deletions(-)
