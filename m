Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C6D280312
	for <linux-sound@vger.kernel.org>; Wed, 20 Aug 2025 23:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755732368; cv=none; b=TuvjN3AepmKVJi8GKsdtKSM6cuDowLQrLfHjY9TR6ONsDwzFLxitlwZ5rr4U3rBomr3GE9g9lnHKwkTurVgmauESYDw+WSzA1oNLUIydzRlj2KCgZrNcJBxAlSvGeRifEZ4qB7n7SjnsirwwD+2NhnFCs3hrNm4XlVqzML+cwnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755732368; c=relaxed/simple;
	bh=8I4ftgLEbGLAsbQ4rJdlUw9RZIk2vsRaxRC8gVRcUBI=;
	h=Message-ID:From:To:Cc:Subject:Date; b=tAnocr06Qgoo/BawEDqzOnHqSj9/tbMt2KSn+rmJbsnCCboLtbAHinBJm5cXxa8GA4tldwxpzkAd/1bfo/MliffpC2xsLWRUzuWJb1Lw43IiXu5g9uz+pckY5GJnXLJJRQHF7u4krBOEiG6di+bx6mClzNomNLRs1Elgp9F6jgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ol3KDShL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ol3KDShL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FB2CC4CEE7;
	Wed, 20 Aug 2025 23:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755732368;
	bh=8I4ftgLEbGLAsbQ4rJdlUw9RZIk2vsRaxRC8gVRcUBI=;
	h=From:To:Cc:Subject:Date:From;
	b=ol3KDShLyM5dgHcPQXvonlDJkV920x10p257fYnrd8UpHg45fIgO2nTogOzLv5CzO
	 6z4TXejX//PI4SzjLn+0yzuA1aey3wtIHCs21Nr3crHrfO34oNEM58WXC2ygsklssO
	 KGGJFENwkDUCylP4ThQR7s0DaZQh23CYasWvaHNiTmKh3ClBmiAEhb39IBGQzzyM/I
	 mEzKeoV6VamZghB8SM0osepoVzGikejnNM1e1dyCFsP6cWqMqrkHlF8PXwD8lKHquI
	 ezyiAWXsxdrVeNIiBntoyaje14/tl0uM94IdXaCudIiloh9M7JrlJmThapIjIG64n4
	 tE7Xwe+Ty9cUw==
Message-ID: <c76f8af82172ef5d00fce6f17a50eae6@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.17-rc2
Date: Thu, 21 Aug 2025 00:25:59 +0100
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
