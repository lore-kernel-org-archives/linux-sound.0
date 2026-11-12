Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794510540;
	b=ArFWKpYEEYKvyJgsefo7vWwFUJb0mHyRCe1wODC23xx9QuoK83nar9yhdjnjA9uFYFv8
	 +2COPgHzxCQk233fWl+deoJBAl1VTJBNuPv9r+zvNtCr7fDeKykC69MyLZCHCHz+vkEcF
	 tw/7uO+xPffSm9QFpkRPwHOVE8uSC1Kk8TI9Jt2t7ogeMRAXPzgtG+Wy0AsIh1HpgFWfs
	 KykZpaluajU/0bkiRms695Abaw0ax6M8zl+8T24fEkntLppgHbSftG+fP7kAyBSAAPXo0
	 KHkmp8rnXZPfru/EpLjQErPxtyMsZnLvn/XxLpZzHvSuFRTDgH8ZCZYT8x67WJNesXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794510540;
	h=Received:DKIM-Signature:Message-ID:From:To:Cc:Subject:Date;
	bh=OdHo3ZQZyH6EvKNdKuQnqRIC5yza3zZ8YxwraOkB5uU=;
	b=2YPlFgYyI4Rs+BGF+pwz9aKXuwukm6K2E8BpYWOqlwD1beRgD++p22tlvYumCHYiFGFN
	 ULlBdymL8q3gSGVFNIpT8Cr5KJlAJUFshT1KCs66jkCQPQnHwev24qYpxk5W1lSuIzU+8
	 PvFCJLnEWyki/yXGz7XehpBNKA7rmnOuJuV6PCkUomhyYYR7cBE+dCHoe9BkgB2LlrAv/
	 lXUXSni19kRR3eiM65tOMQprEbtZWC8i6qF2wQJylf/ecgedqop4rPuhicXNRovxgaImS
	 kxrQkWHJWw1qagn5YQsn7S9YPBKn2mclxWVwVXJ+q+UNhQEtLdIrYwiFPbYZMKGUmRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S+vozPh8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 06F07606A31C
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 19:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S+vozPh8
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 5A5D71F000C4;
	Thu, 12 Nov 2026 19:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794510539;
	bh=OdHo3ZQZyH6EvKNdKuQnqRIC5yza3zZ8YxwraOkB5uU=;
	h=From:To:Cc:Subject:Date;
	b=S+vozPh8rnZZGzK80/IXRzJIbrfWdwjFpw3e99/mdcwO1muloZzJqnzBpXcIOI+Kq
	 3Ue7vBf9GrJNU1I552QMFtm5N+ZSg3Bea7WPHzFW90NXsclV1jEvJJoW7IwnHuA93B
	 0cutuUKaZ+BJaty7bxShdcIbiiPZ/78Nv4/EbXjo/z6cqxx8ysQgT9eWS7a2faze65
	 Xk+NA0AyyDjVFs3QrAZRrjKTb34pn/r0mm9VRcxN33BcUciI45xwxvsHJeQn8jphA9
	 vHXxIfQu7uKTSh+tJ3F32MFhiBxddQxz+PaL/FQdgu6dHhDaOLsMtVGl7gQIeCS+Sh
	 omM+WLUDnCV6A==
Message-ID: <da3d9a0821be2c6200c0af618dda6256@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v7.4-rc2
Date: Thu, 12 Nov 2026 18:55:28 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

The following changes since commit 7475ea8b58616b33c04afb976cf0fbaad9dd63fb:

  Linux 7.4-rc2 (2026-11-08 16:22:20 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.4-rc2

for you to fetch changes up to 58d51fa6ff1d21e79c3c340bfb3155dfa3025ca3:

  ASoC: max98090: keep the MIC boost across mic input power-up (2026-11-11 18:05:03 +0000)

----------------------------------------------------------------
ASoC: Fixes for v7.4

Another week, another pile of driver specific fixes and quirks.  We do
have one major fix which addresses a bug introduced by confusion with
the counted_by interfaces that was causing major disruption for a number
of platforms.

----------------------------------------------------------------
Baoli Zhang (1):
      ASoC: SOF: ipc4-topology: Fix pin format leak in process widget setup

Emanuele Ghidoli (1):
      ASoC: soc-core: reset rtd->num_components after allocation

HyeongJun An (1):
      ASoC: Intel: sof_sdw: Add quirk for Dell Latitude 9420

Jaehoon Kim (2):
      ASoC: amd: acp: Add ACP70 ACPI flag override for LG gram 16Z95U
      ASoC: amd: acp70: Add rt713 + rt1320 SoundWire machine for LG gram 16Z95U

Janne Grunau (1):
      ASoC: apple: mca: Fix clock selection for clock consumer FEs

LiangCheng Wang (1):
      ASoC: max98090: keep the MIC boost across mic input power-up

Mario Limonciello (1):
      ASoC: SOF: amd: Load alternatively signed firmware with an "_l" suffix

Mark Brown (3):
      ASoC: fix the x1e80100 card after an ADSP restart
      ASoC: amd: acp: Support Huawei MateBook D 14 (NBM-WXX9)
      ASoC: amd: SoundWire audio for LG gram 16Z95U (rt713 + rt1320), speaker still silent

Michael McAllister (1):
      ASoC: qcom: q6asm: Reset PCM positions when preparing a stream

Olivier Louvignes (1):
      ASoC: cs43130: Power the playback path down when the stream closes

Samuel Leyva (2):
      ASoC: amd: acp: Add DMI quirk for Huawei MateBook D 14 (NBM-WXX9)
      ASoC: amd: acp: es83xx: Enable speaker amplifier after the codec output

Tyler Baker (2):
      ASoC: soc-core: copy the DAI link names into the card
      ASoC: qcom: x1e80100: recreate the headset jack on card rebind

Viacheslav-Illia Detsyk (1):
      ASoC: amd: yc: Add DMI quirk for Acer Nitro AN16-41

Vijendar Mukunda (2):
      ASoC: amd: ps: guard adata->sdw dereferences with NULL check in IRQ handler
      ASoC: SOF: amd: guard adata->sdw dereferences with NULL check in IRQ handler

Zachary Huang (1):
      ASoC: es9356: fix the capture gain dB scale

Zhang Heng (3):
      ASoC: amd: yc: Fall back to DMI quirk table when _WOV returns 0
      ASoC: amd: yc: Add DMI quirk for ASUS TUF Gaming A16 FA607NUQ
      ASoC: amd: acp: Add Lenovo Legion 5 15AGP11 to ACP70 override table

 sound/soc/amd/acp-config.c                    | 28 +++++++++
 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c | 24 +++++---
 sound/soc/amd/acp/amd-acp70-acpi-match.c      | 83 +++++++++++++++++++++++++++
 sound/soc/amd/ps/pci-ps.c                     | 32 +++++++----
 sound/soc/amd/yc/acp6x-mach.c                 | 16 +++++-
 sound/soc/apple/mca.c                         | 10 +++-
 sound/soc/codecs/cs43130.c                    |  2 -
 sound/soc/codecs/es9356.c                     |  4 +-
 sound/soc/codecs/max98090.c                   | 22 +++----
 sound/soc/intel/boards/sof_sdw.c              | 10 ++++
 sound/soc/qcom/qdsp6/q6asm-dai.c              |  3 +
 sound/soc/qcom/qdsp6/q6asm.c                  |  2 +
 sound/soc/qcom/x1e80100.c                     | 18 ++++++
 sound/soc/soc-core.c                          | 22 +++++++
 sound/soc/sof/amd/acp.c                       | 61 +++++++++++++++-----
 sound/soc/sof/amd/acp.h                       |  2 +
 sound/soc/sof/ipc4-topology.c                 |  2 +-
 17 files changed, 290 insertions(+), 51 deletions(-)
