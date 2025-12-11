Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6B61DFFD
	for <linux-sound@vger.kernel.org>; Thu, 11 Dec 2025 00:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765414130; cv=none; b=Oqdy9h2ngy6lwL/4B8qAI+DFpaK3Bj/ljXCIjw2wHexGssopC0+iQ76cQR09Y+pwXuQuSK2CcO1CECp65GiVcWqlUubAufyd7x/K5nkDu62CQlsiYmgQhQ0+0e7TTCax0MH4lv7Lk5MJGTmJpimrSrFelfgkZNQs8y2g6eQ7cVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765414130; c=relaxed/simple;
	bh=ugYzIIND/LcIOVmEMPIMFDr53DhGYIWESwbexiw2vIY=;
	h=From:To:Cc:Subject:Date:Message-Id; b=lMiVaBbCqVN0eibSKGdrun2Ufa63YxNtLoPDqIb7Chg3XSxTs49Aq16eWgJuex/nTIPjgZvJwuPBzgLOcqoNJq0MfnAuOZW+pPBjB1fY3hTydkxOFIThDnRTx+xp5WNaG+hoRJ9I5PgB66L+ynlMcCqzGcCH9LZ706RYhtuCjME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UQeYRf6n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UQeYRf6n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4FAAC4CEF1;
	Thu, 11 Dec 2025 00:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765414129;
	bh=ugYzIIND/LcIOVmEMPIMFDr53DhGYIWESwbexiw2vIY=;
	h=From:To:Cc:Subject:Date:From;
	b=UQeYRf6nMfdNfoY9qa+qNYjSPErFlkrtdsanbnxGUPj5IzJRKTBYconp7FFoa/zXL
	 RyoV5ahEfAMk6kFIBE2VSG9oewfJoxlV9oTDrBxnH4uD7IbsQIL7e37EB7P1SB+/PA
	 k/FgZy1nj4VPGUrH7JfLrppnh5L9gc/+4JJrvpU6w0GPR1/M0zf5mtm0eMpbIVr3BR
	 T2qENNRKjz3/eDLJ9N6ITecE8BNKJsRZoeIU4u+J3vlJMwAlqmxCWBxP+Uf41GotFy
	 +6cfxtWlKKzrd127lRq/nKw9SZBetPwLReWxlYalM+wKfz5nY7/qKzqb6buLWTCwCH
	 5qD0U23WUXEAw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 5B15D1ACB974; Thu, 11 Dec 2025 00:48:47 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.19-merge-window
Date: Thu, 11 Dec 2025 09:48:41 +0900
Message-Id: <20251211004847.5B15D1ACB974@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit c5fae31f60a91dbe884ef2789fb3440bb4cddf05:

  ASoC: fsl_micfil: Set default quality and channel (2025-11-29 00:59:00 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.19-merge-window

for you to fetch changes up to f34836a8ddf9216ff919927cddb705022bf30aab:

  ASoC: amd: acp: update tdm channels for specific DAI (2025-12-10 09:17:53 +0900)

----------------------------------------------------------------
ASoC: Fixes for v6.19

A small pile of fixes that came in during the merge window, it's all
fairly standard device specific stuff.

----------------------------------------------------------------
Eric Biggers (1):
      ASoC: cros_ec_codec: Remove unnecessary selection of CRYPTO

Eric Naim (1):
      ASoC: cs35l41: Always return 0 when a subsystem ID is found

Haotian Zhang (1):
      ASoC: bcm: bcm63xx-pcm-whistler: Check return value of of_dma_configure()

Hemalatha Pinnamreddy (2):
      ASoC: amd: acp: Audio is not resuming after s0ix
      ASoC: amd: acp: update tdm channels for specific DAI

Johan Hovold (4):
      ASoC: codecs: wcd937x: fix OF node leaks on probe failure
      ASoC: codecs: wcd938x: fix OF node leaks on probe failure
      ASoC: codecs: wcd939x: fix OF node leaks on probe failure
      ASoc: qcom: q6afe: fix bad guard conversion

Krzysztof Kozlowski (2):
      ASoC: codecs: nau8325: Silence uninitialized variables warnings
      ASoC: rockchip: Fix Wvoid-pointer-to-enum-cast warning (again)

Mark Brown (2):
      ASoC: ak4458 & ak5558: disable regulator if error
      ASoC: codecs: wcd93xx: fix OF node leaks on probe

Richard Fitzgerald (2):
      ASoC: cs-amp-lib: Revert use of __free(kfree) back to normal C cleanup
      ASoC: cs35l56: Fix incorrect select SND_SOC_CS35L56_CAL_SYSFS_COMMON

Shengjiu Wang (3):
      ASoC: dt-bindings: cirrus,cs42xx8: Reference common DAI properties
      ASoC: ak4458: Disable regulator when error happens
      ASoC: ak5558: Disable regulator when error happens

 .../devicetree/bindings/sound/cirrus,cs42xx8.yaml  |  5 +++-
 sound/soc/amd/acp/acp-i2s.c                        |  2 ++
 sound/soc/amd/acp/acp-legacy-common.c              | 30 +++++++++++++++++-----
 sound/soc/bcm/bcm63xx-pcm-whistler.c               |  4 ++-
 sound/soc/codecs/Kconfig                           |  3 +--
 sound/soc/codecs/ak4458.c                          | 10 +++++++-
 sound/soc/codecs/ak5558.c                          | 10 +++++++-
 sound/soc/codecs/cs-amp-lib.c                      | 29 ++++++++++++---------
 sound/soc/codecs/cs35l41.c                         |  7 ++---
 sound/soc/codecs/nau8325.c                         |  4 +--
 sound/soc/codecs/wcd937x.c                         |  4 +--
 sound/soc/codecs/wcd938x.c                         |  3 +--
 sound/soc/codecs/wcd939x.c                         |  3 +--
 sound/soc/qcom/qdsp6/q6afe.c                       |  4 +--
 sound/soc/rockchip/rockchip_pdm.c                  |  2 +-
 15 files changed, 82 insertions(+), 38 deletions(-)
