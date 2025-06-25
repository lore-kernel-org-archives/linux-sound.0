Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937DE285C9E
	for <linux-sound@vger.kernel.org>; Wed, 25 Jun 2025 18:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877584; cv=none; b=IyjqZAPxU7zj5p+uzs5QJi8FhWWKbL/po3itqymJ73klVBTrZ/402IG4jz6nqbx+/K5XbTVYKtwAg5g+/9dEXy+LwqW8Wv05wlBrw7mNu5gIRjGY4B9Lz5iVrQ4z/HqIW9GCSpPXNRNqviUzsHfT12Pey2ewNcFnjlReMiuA7cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877584; c=relaxed/simple;
	bh=KFrLZUtDQLEnS5G5xbCuFRRThYnBBnc2nrs2fs7NnCI=;
	h=Message-ID:From:To:Cc:Subject:Date; b=af7i7Cpwv9IY45aZfIkrZ553JHXa4x3OiX79gRtbpgbStuV7oB6lBf0R5+1Qn9ulAUdIDFxvWXGqd5K4pPT41pzngRN/EFqzuB+mSEpoYhJ8MDllvQ+JSRYIDRxblfK1PXJMJnSpPowia0eP1STprgJMLtw6BxCIvpP+UqlkSZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wv2NFFRm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wv2NFFRm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6345C4CEEA;
	Wed, 25 Jun 2025 18:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750877584;
	bh=KFrLZUtDQLEnS5G5xbCuFRRThYnBBnc2nrs2fs7NnCI=;
	h=From:To:Cc:Subject:Date:From;
	b=Wv2NFFRmX6ihNpe6I/reHvMwAOFciBLqPYQHgIqqzmUbCoOe1sp5diY8lKnnPpJV2
	 87tEmJksco1Zy53/MLiZtWgPo+PqXsFl1k7ea1XfQFgpNyLOVk+s1IGLOoooIPNp70
	 ZrbAVqfsun+QML5knTDdw+KJ7nNZh9oRiT9O6Bo8tiaIMb0DpG86ailczAU7d2CFRJ
	 jjgTkScE8aYy5lnKpqhDt7D4vEAwtsJsa9V4Q8qLJICOwqgqtaghNPabc90nQING7H
	 5ah4cE88AgCBvrUL/ISR3D5En+dzMZa8eKbNUa/jFOhtAqHE6924ENS82ojKRrE1Ro
	 m1C97HGH9rP8Q==
Message-ID: <053302a805a2cc9f35f96bcf6e29c640.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.16-rc3
Date: Wed, 25 Jun 2025 19:52:55 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit 86731a2a651e58953fc949573895f2fa6d456841:

  Linux 6.16-rc3 (2025-06-22 13:30:08 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.16-rc3

for you to fetch changes up to 6c038b58a2dc5a008c7e7a1297f5aaa4deaaaa7e:

  ASoC: SOF: Intel: hda: Use devm_kstrdup() to avoid memleak. (2025-06-24 16:39:42 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.16

A small collection of fixes, the main one being a fix for resume from
hibernation on AMD systems, plus a few new quirk entries for AMD
systems.

----------------------------------------------------------------
Jack Yu (1):
      ASoC: rt721-sdca: fix boost gain calculation error

Luca Weiss (1):
      ASoC: qcom: sm8250: Fix possibly undefined reference

Oliver Schramm (1):
      ASoC: amd: yc: Add DMI quirk for Lenovo IdeaPad Slim 5 15

Tamura Dai (1):
      ASoC: SOF: Intel: hda: Use devm_kstrdup() to avoid memleak.

Vijendar Mukunda (1):
      ASoC: amd: ps: fix for soundwire failures during hibernation exit sequence

Yuzuru10 (1):
      ASoC: amd: yc: add quirk for Acer Nitro ANV15-41 internal mic

 sound/soc/amd/ps/acp63.h      |  4 ++++
 sound/soc/amd/ps/ps-common.c  | 18 ++++++++++++++++++
 sound/soc/amd/yc/acp6x-mach.c | 14 ++++++++++++++
 sound/soc/codecs/rt721-sdca.c | 23 +++++++++++++++++++----
 sound/soc/qcom/Kconfig        |  1 +
 sound/soc/sof/intel/hda.c     |  6 +++---
 6 files changed, 59 insertions(+), 7 deletions(-)
