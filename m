Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625FC35F60F
	for <linux-sound@vger.kernel.org>; Wed,  8 Apr 2026 22:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775686767; cv=none; b=KeKC/NjSZVpgnLiHZZZopRDhL497QwNHRzvmKF7fsttCtArhEc/Z9EowPv25J013xVn03zEbN/Q+VIcMrH3wNQzbAab2uiQqS2U0BS8lRmCo5kOpg5sUfAP60gcKV4g6+WgAQ58kLWlkgeLW0M18KUchSJJ3xuS/GbmBtzxM/xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775686767; c=relaxed/simple;
	bh=1tOYVE+w3uMQ+EqlDxAz1buO2eF+iMKzJJkAk8cPpM8=;
	h=From:To:Cc:Subject:Date:Message-Id; b=eHq97iJomZFn6nB8DYFBhVoo4cs0Uw+Ny08TEY7BSWXOfmxxo+wsBw8b7tCQSGf5l2oZrIJDGrUF2ZljQSX90JXmop2v6fKU4XuLXg8iGI34IGyxWTXq7wXRzydUr/PfwHoRrs0RMiOTEFaaKXdyoXKHhs0fN2nNclZu+s+aI7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FsUiYRAQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FsUiYRAQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C5C3C19421;
	Wed,  8 Apr 2026 22:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775686767;
	bh=1tOYVE+w3uMQ+EqlDxAz1buO2eF+iMKzJJkAk8cPpM8=;
	h=From:To:Cc:Subject:Date:From;
	b=FsUiYRAQd8GbSG1xn1ZSzrdPVfNN6FaBvEgY7v1grai3J1qEG4z9L0jUkzS/KdjbE
	 XlVZRUq6Nt2a8kw81KEI4Tot4e4J3gdWT/0UgnkP7PyeGzaEfhZaZz6+f9yoZLmzV8
	 MDkipJRAWY7AtzGGkzdFzKrQpVfv/51DFA6F0b1B4bRckBgNaOGno7OAeXtlhc13s/
	 AYLqDNnRzGnw3X7v6M0tik8dOl5F2VFGRoXshieCa9ca/lZBWWWHrnwXureR6IMmQO
	 qYZ17iCwqTA1++zf6i/d/1TZt9fameqbnupaXiScafOCo2ePBEO2ujTYakasHK9Bq7
	 jNC4gThGy1kIA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 6194F1AC52C7; Wed, 08 Apr 2026 23:19:22 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v7.0-rc7
Date: Wed, 08 Apr 2026 23:19:17 +0100
Message-Id: <20260408221922.6194F1AC52C7@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit 591cd656a1bf5ea94a222af5ef2ee76df029c1d2:

  Linux 7.0-rc7 (2026-04-05 15:26:23 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.0-rc7

for you to fetch changes up to 6b6f7263d626886a96fce6352f94dfab7a24c339:

  ASoC: amd: acp: update DMI quirk and add ACP DMIC for Lenovo platforms (2026-04-08 17:04:47 +0100)

----------------------------------------------------------------
ASoC: Fixes for v7.0

A somewhat larger set of fixes than I'd like unfortunatey, not from any
one place but rather spread out over different drivers.  We've got a
bunch more fixes for the SDCA interrupt support, several relatively
minor SOF fixes, a few more driver specific fixes and a couple more AMD
quirks.

----------------------------------------------------------------
Cezary Rojewski (1):
      ASoC: Intel: avs: Fix memory leak in avs_register_i2s_test_boards()

Charles Keepax (1):
      ASoC: SDCA: Fix errors in IRQ cleanup

Kai Vehmanen (1):
      ASoC: SOF: Intel: hda: modify period size constraints for ACE4

Maciej Strozek (4):
      ASoC: SOF: Intel: Fix endpoint index if endpoints are missing
      ASoC: SOF: Intel: fix iteration in is_endpoint_present()
      ASoC: SDCA: Fix overwritten var within for loop
      ASoC: SDCA: mask Function_Status value

Marek Vasut (1):
      ASoC: dt-bindings: ti,tas2552: Add sound-dai-cells

Mark Brown (1):
      ASoC: SOF: Intel: Fixes for find_acpi_adr_device() when some endpoints are missing

Mark Pearson (1):
      ASoC: amd: acp: add Lenovo P16s G5 AMD quirk for legacy SDW machine

Neo Chang (1):
      ASoC: nau8325: Add software reset during probe

Richard Fitzgerald (1):
      ASoC: SDCA: Unregister IRQ handlers on module remove

Syed Saba Kareem (1):
      ASoC: amd: acp: update DMI quirk and add ACP DMIC for Lenovo platforms

Tomasz Merta (1):
      ASoC: stm32_sai: fix incorrect BCLK polarity for DSP_A/B, LEFT_J

 .../devicetree/bindings/sound/ti,tas2552.yaml      | 13 +++-
 include/sound/sdca_interrupts.h                    |  5 ++
 sound/soc/amd/acp/acp-sdw-legacy-mach.c            | 24 +++++--
 sound/soc/codecs/nau8325.c                         |  9 ++-
 sound/soc/intel/avs/board_selection.c              |  9 ++-
 sound/soc/sdca/sdca_class_function.c               | 17 +++++
 sound/soc/sdca/sdca_interrupts.c                   | 82 +++++++++++++++++++---
 sound/soc/sof/intel/hda-pcm.c                      | 14 +++-
 sound/soc/sof/intel/hda.c                          | 10 ++-
 sound/soc/stm/stm32_sai_sub.c                      |  3 +
 10 files changed, 159 insertions(+), 27 deletions(-)
