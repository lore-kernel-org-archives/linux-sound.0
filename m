Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E022FF164
	for <linux-sound@vger.kernel.org>; Thu,  4 Jun 2026 14:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780585174; cv=none; b=NHDFk/nzCPPr3aA+2UD+bRjyXTn4k0YWkHRV6XTido7gBTYSQ+RWq/Ji/PUX4Wi6clhu4AZy0WtnwLheftePI114ou3C23+tL1T4gsJtJ+4W9J2jKY1YXx+jc9WXCdsWa0ev/S+I4ckWYEOYAe0LDC7q9z1G7ZMKmB8xuZ8G0bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780585174; c=relaxed/simple;
	bh=MsTAYqGRduV0qR/MF5eO+Yf4JcSL9qKrxiNRcZxXqEU=;
	h=Message-ID:From:To:Cc:Subject:Date; b=BaY0rOW1R8Q02rbdfPeq0ftSD0JJyq/BIV063d1Ljq/Rq89klI461TrANRqvaX42ziGdAFtpYHhCWO8rN4I5P5sXu7b6j+w3UiJM1aiN3i5LHF7siiUcCANLOCtG+QttMSuDc0ns8fRRoOJ3hcSc0dxNoncXEKsNGCLHDGj8Ueg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RelonrKG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RelonrKG"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id C1F1B1F00893;
	Thu,  4 Jun 2026 14:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780585172;
	bh=PhrhDHP1FdjIu6eaq4hR73jfDA0sRMs89f3GPR4e9s8=;
	h=From:To:Cc:Subject:Date;
	b=RelonrKG5PKXuxHWzpviGWPpJf0Dx3i5EooZ7YnZapcNydSeKGguwsMz3A3Iu1dtK
	 B/GZX42GDjK+pQ5O8qshQY4vskgYSJAk9VqSvWvk7ondc9WUpl7dxTN7ifLj9+lUBZ
	 6tTRR7jC+ALkLxtxw1PHZgejEJjYgqvPHm+Ams9qg3lq8UDFPsheTb2BHYUiwu4WFh
	 aG5nSre3/7E9PP+VSSKNQqiFCl1EAfWqC7AWbAahmJeCl7RkkGSi7tZTmu7oEYXdlg
	 NR0yzBBfcRuYJc7bjAVXmxj+0eAoCKfZj4ixgOMXh5cI7+8NopkqejYjjdnJhOUEs+
	 TxvaeHMhHO6Pg==
Message-ID: <b99a86ce19505d0016af56bcfe4ad81f@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v7.1-rc6
Date: Thu, 04 Jun 2026 15:59:17 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit e43ffb69e0438cddd72aaa30898b4dc446f664f8:

  Linux 7.1-rc6 (2026-05-31 15:14:24 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.1-rc6

for you to fetch changes up to d2dcd85f9e09fe3566d4cdcd357856a42ac73f93:

  ASoC: amd: acp70: add standalone RT721 SoundWire machine (2026-06-04 11:35:06 +0100)

----------------------------------------------------------------
ASoC: Fixes for v7.1

There's only one actual fix here, for the TDM configuration on the
Freescale SAI controller, everytihng else is DMI quirks for AMD systems.
One of those is relatively large as it adds a bunch of different structs
but it's all data.

----------------------------------------------------------------
Aleksander Pshenitsyn (1):
      ASoC: amd: acp70: add standalone RT721 SoundWire machine

Chancel Liu (1):
      ASoC: fsl_sai: Fix 32 slots TDM broken by integer shift UB in xMR write

David Glushkov (1):
      ASoC: amd: yc: Add MSI Raider A18 HX A9WJG to quirk table

Jackie Dong (1):
      ASoC: amd: acp: Add DMI quirk for Lenovo Yoga Pro 7 15ASH11

João Miguel (1):
      ASoC: amd: yc: Enable internal mic on MSI Bravo 17 C7VF

 sound/soc/amd/acp-config.c               |  7 +++++
 sound/soc/amd/acp/amd-acp70-acpi-match.c | 44 ++++++++++++++++++++++++++++++++
 sound/soc/amd/yc/acp6x-mach.c            | 14 ++++++++++
 sound/soc/fsl/fsl_sai.c                  |  2 +-
 4 files changed, 66 insertions(+), 1 deletion(-)
