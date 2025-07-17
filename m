Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A195C145348
	for <linux-sound@vger.kernel.org>; Thu, 17 Jul 2025 12:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752755574; cv=none; b=Iea8Reia5XpzD0XykTPP+TVhFu6cqbkklru3r8gKjZuCtUghUkg9+49TFbs9ePgyLgMZamLtJ3MhRfcHk+kLSbBHsdgBKmbr7qRr0fml7/S3ce74qkSXPelu+z2AwI7mv8yvPzNHSosca9QoQtiF5aWWRz1m1ea2DlZ5/NB4B74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752755574; c=relaxed/simple;
	bh=mdSrV0SjOqyBrOqulbqj38t3aeIUQAuXgVXm8NXV6a8=;
	h=Message-ID:From:To:Cc:Subject:Date; b=DdBBVnzhoSUV8IoYJz5Qdv0NondfpVRyA913DpseZBbTvmqqZUqVD0xZzjxJbi34P7bdL6EmxJUpVDENxKplIygrF2oaTSpG7Zgv+S1JA6GRNfn6IFJYHtYInwXkkYHFqGDZO0+6Yake24ozucCBoil4IhWn59dEc0ZUd9oBsj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i48JQ7h1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i48JQ7h1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B90B5C4CEE3;
	Thu, 17 Jul 2025 12:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752755574;
	bh=mdSrV0SjOqyBrOqulbqj38t3aeIUQAuXgVXm8NXV6a8=;
	h=From:To:Cc:Subject:Date:From;
	b=i48JQ7h1nsn41RHcEIeh0DLPKxekseEq3m9kf9OQsN3iwepjtLKGGaCCjMkRRkChR
	 3DlmZ5PHy/eMf+zPZQ12a/bMDq09ve95Ore3NXVrfjt2pRVJXMKSp4H9iJ/RKbmxgA
	 X1NyZbLKMCdvWauTd7CCIbXpWEzHh17bHpBTZ1rVppnfjuMtRjQ9SFU+aLjU7HQ7Cj
	 GwEr6XfhTaNJaDH0rgDed2pOBAlyigD8hiP0Yl1+duFUCWLnFwQr+vf+idTVxqL5RZ
	 gwdY5hHt11hC19VIvF1b3J8vJRFclU0oMXt8piZptUSr5ExtmX1iLLVLP6cagRrhTW
	 9+pOyG7bWqgsw==
Message-ID: <1d784c862857c2d2f3870c0e140863da.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.16-rc6
Date: Thu, 17 Jul 2025 13:32:44 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit 3b3312f28ee2d9c386602f8521e419cfc69f4823:

  ASoC: cs35l56: probe() should fail if the device ID is not recognized (2025-07-03 12:22:27 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.16-rc6

for you to fetch changes up to 7bab1bd9fdf15b9fa7e6a4b0151deab93df3c80d:

  ASoC: amd: yc: Add DMI quirk for HP Laptop 17 cp-2033dx (2025-07-16 11:50:33 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.16

A relatively large set of changes, but most of them are quirk
information for various x86 systems.  There is one more substantial fix
for a NULL pointer dereference when removing the AVS driver, plus one
for Kconfig dependencies.

----------------------------------------------------------------
Adam Queler (1):
      ASoC: amd: yc: Add DMI entries to support HP 15-fb1xxx

Alexandru Andries (1):
      ASoC: amd: yc: add DMI quirk for ASUS M6501RM

Amadeusz Sławiński (1):
      ASoC: Intel: avs: Fix NULL ptr deref on rmmod

Arnd Bergmann (1):
      ASoC: Intel: fix SND_SOC_SOF dependencies

Bard Liao (1):
      ASoC: Intel: soc-acpi: add support for HP Omen14 ARL

Lane Odenbach (1):
      ASoC: amd: yc: Add DMI quirk for HP Laptop 17 cp-2033dx

Oder Chiou (1):
      ASoC: rt5660: Fix the dmic data source from GPIO2

 sound/soc/amd/yc/acp6x-mach.c                     | 21 ++++++++++++++++
 sound/soc/codecs/rt5660.c                         |  7 ++++--
 sound/soc/intel/avs/pcm.c                         |  4 +++-
 sound/soc/intel/boards/Kconfig                    |  2 +-
 sound/soc/intel/common/soc-acpi-intel-arl-match.c | 29 +++++++++++++++++++++++
 5 files changed, 59 insertions(+), 4 deletions(-)
