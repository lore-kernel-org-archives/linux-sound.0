Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2282343D62
	for <linux-sound@vger.kernel.org>; Thu, 21 Aug 2025 19:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755804045; cv=none; b=a/A7VKAkthOLoahpEL/tuDyMsNnjw6METyBLs/Pzpmvr0RDYZ75Kegb0tLxxlxcTwjgiWjMJKd/Y2URsgATH8PQtbewh6I8n+IDg/nwcI4aNPa7aqLwhjYEC7Mx8W6eORJ7INDGlEW70ST+4CLyuRL6SkAhaI4YQzWOIoDuz8z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755804045; c=relaxed/simple;
	bh=8I4ftgLEbGLAsbQ4rJdlUw9RZIk2vsRaxRC8gVRcUBI=;
	h=Message-ID:From:To:Cc:Subject:Date; b=KgB/ri8V2Qs1iE2+d/1dBzy3WpibQRSgXUXWtyUKJxGwXTgGW+9h0Qk+IUVPOnkX6fUK5Ys7zkcLL0XB9UFqSwKS6iWhFwnXbBusQeQXYb0uQcYFLkcbF2vNbOi/YPA5KNd/g8KsS9LQ5lQcJf8mLFtUyL79thJnhwqxtGTpTPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uhrg0USy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uhrg0USy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE834C4CEF4;
	Thu, 21 Aug 2025 19:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755804044;
	bh=8I4ftgLEbGLAsbQ4rJdlUw9RZIk2vsRaxRC8gVRcUBI=;
	h=From:To:Cc:Subject:Date:From;
	b=Uhrg0USyFdZZBmejLEYHEB7vB2EJyUIjulIZYTJhYYb4kV02u0aWgst6Olx/c2ubH
	 saaf1tVgdcRR+wnx1Dj7K6nSQOqM/GW6UjK/FkjDWFI/cA0KUB+ex8yAB+Es+rB/Ex
	 ZPlpAL8q7Q2gB1Yu1NN/hA+JKjIraPdx1vxAcL0ueTHmY6UXBNzEcQlzC2yVt+hIBQ
	 377EQXccaW0CZ5CckTgt3p8wDrAnVs2KHs9ZoRfdrWIM/T/9faFZXO6xhlA56PY32T
	 0o4H0/GDHoj1Ez5/2o5dx6N+5GunaWlhfbYOkLVLmlsDLbJZQX9W0l0Su06Le7VdUb
	 PpztHXmbb315g==
Message-ID: <66897958e77c5e8fe5cdbbad27fcc725.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.17-rc2
Date: Thu, 21 Aug 2025 20:20:41 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9:

  Linux 6.17-rc2 (2025-08-17 15:22:10 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.17-rc2

for you to fetch changes up to 7c15e4cabfa96ed3cd717a2ed7a9961268ab21f7:

  ASoC: cs35l56: Fixes for CS35L63 for production (2025-08-20 19:56:20 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.17

A few fixes that came in during the past week, there's some updates for
the CS35L56 which adjust the driver for production silicon and a fix for
buggy resume of the ES9389.

----------------------------------------------------------------
Mark Brown (1):
      ASoC: cs35l56: Fixes for CS35L63 for production

Richard Fitzgerald (1):
      ASoC: cs35l56: Handle new algorithms IDs for CS35L63

Stefan Binding (2):
      ASoC: cs35l56: Update Firmware Addresses for CS35L63 for production silicon
      ASoC: cs35l56: Remove SoundWire Clock Divider workaround for CS35L63

Zhang Yi (1):
      ASoC: codecs: ES9389: Modify the standby configuration

 include/sound/cs35l56.h           |  5 +--
 sound/soc/codecs/cs35l56-sdw.c    | 69 ---------------------------------------
 sound/soc/codecs/cs35l56-shared.c | 29 ++++++++++++++--
 sound/soc/codecs/cs35l56.c        |  2 +-
 sound/soc/codecs/cs35l56.h        |  3 --
 sound/soc/codecs/es8389.c         |  2 +-
 6 files changed, 31 insertions(+), 79 deletions(-)
