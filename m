Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F021E2F99A3
	for <linux-sound@vger.kernel.org>; Wed, 13 Aug 2025 19:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755114409; cv=none; b=mTjzIWLuKweSjiTyq1ydAG0CK179P8C9R9nc5B38HWZ4FRqabx0Sw+XwX28bkP4fDtal0tUbPPqjezgUVRo5P2u2DmwnE+UotPYnu+YFUY7CmUT0Vu23QT46hIGCYf+hvANUNmaY7cYLtNVO4rx9ZTHSXF+r9Y64F4Y9Zb4gq7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755114409; c=relaxed/simple;
	bh=/8GBopGctd7ROLW5s7uQq/RaW7OuHdELmXU9Ltqdl7g=;
	h=Message-ID:From:To:Cc:Subject:Date; b=uZRPWlHKQDHj3DT/LYaoGqiY5UVKrgPM9lTBWuUe6N1UQCGjgUBjSaXhAMP7fCVZL0oGy7nHifTh3X1kL9ZW/Ekkv/DsL3gU5OtiwaA7wtUV4GQBa2BELm4nLt/4WR0vjE0x/4puxoVB9C75jRFv4p0566R0SWBw0/D1+fsmRhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WgnSZTwS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WgnSZTwS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23972C4CEEB;
	Wed, 13 Aug 2025 19:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755114408;
	bh=/8GBopGctd7ROLW5s7uQq/RaW7OuHdELmXU9Ltqdl7g=;
	h=From:To:Cc:Subject:Date:From;
	b=WgnSZTwSETUEu/h7nicYifJetu9VnL3pDmPI1LWzi2WgPSGWYiln6DVClUsPldILk
	 Hh+t4G5Nc1S5jRlxHBvq4YKcLif0DBwyYpOWQfCnGxloN0wgTnljb0ZEWJPeVT/vQw
	 2IaYdEEM8a9yYDSNtyabIzphzWNE8lVw2bGIdDsOFQCnzeqHEVXR+hDfU4/ucDvpgw
	 GoelD1XJlkG0ntXxR1UnRP8z+VP5SpAVDBcVYh5UbMRnwJmbcXgiWAR61oIrpzVmGS
	 SreBNvnJNMCzmfWVhTlGZi2kSTj8PzHGy/RNfXyLiE9avQuQ8dgpoYl/Q2ofd94p3p
	 iciw5r6Ruyjyw==
Message-ID: <c50400ae698f3d9f5d0a46ad05fbd0fa.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.17-rc1
Date: Wed, 13 Aug 2025 20:46:40 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.17-rc1

for you to fetch changes up to 47ed64db8c17eb16541098add865178fb7e68744:

  ASoC: tas2781: Normalize the volume kcontrol name (2025-08-13 15:52:53 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.17

A reasonably small collection of fixes that came in since the merge
window, mostly small and driver specific plus a cleanup of the menu
reorganisation to address some user confusion with the way the generic
drivers had been handled.

----------------------------------------------------------------
Alexey Klimov (1):
      ASoC: codecs: tx-macro: correct tx_macro_component_drv name

Baojun Xu (1):
      ASoC: tas2781: Normalize the volume kcontrol name

Colin Ian King (2):
      ASoC: codec: sma1307: replace spelling mistake with new error message
      ASoC: tas2781: Fix spelling mistake "dismatch" -> "mismatch"

Kuninori Morimoto (1):
      ASoC: generic: tidyup standardized ASoC menu for generic

Sergio Perez Gonzalez (1):
      ASoC: stm: stm32_i2s: Fix calc_clk_div() error handling in determine_rate()

Shengjiu Wang (1):
      ASoC: fsl_sai: replace regmap_write with regmap_update_bits

Shuming Fan (2):
      ASoC: rt721: fix FU33 Boost Volume control not working
      ASoC: rt1320: fix random cycle mute issue

Thorsten Blum (1):
      ASoC: codecs: Call strscpy() with correct size argument

 sound/soc/Kconfig                  |  4 +++-
 sound/soc/codecs/aw87390.c         |  8 +++-----
 sound/soc/codecs/aw88081.c         |  5 ++---
 sound/soc/codecs/aw88166.c         |  8 +++-----
 sound/soc/codecs/aw88261.c         |  8 +++-----
 sound/soc/codecs/aw88395/aw88395.c |  8 +++-----
 sound/soc/codecs/aw88399.c         |  8 +++-----
 sound/soc/codecs/lpass-tx-macro.c  |  2 +-
 sound/soc/codecs/rt1320-sdw.c      |  3 ++-
 sound/soc/codecs/rt721-sdca.c      |  2 ++
 sound/soc/codecs/rt721-sdca.h      |  4 ++++
 sound/soc/codecs/sma1307.c         |  2 +-
 sound/soc/codecs/tas2781-i2c.c     |  6 +++---
 sound/soc/fsl/fsl_sai.c            | 20 ++++++++++----------
 sound/soc/stm/stm32_i2s.c          |  7 ++-----
 15 files changed, 45 insertions(+), 50 deletions(-)
