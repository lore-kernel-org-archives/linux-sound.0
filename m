Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602CE3358C0
	for <linux-sound@vger.kernel.org>; Thu, 26 Feb 2026 12:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772108023; cv=none; b=SVstK1R6x18owrcMMg89eOtq2zi+JrIHQ+QfEjtety6V7w6IJu/DQD+HCYHT1K0yclagxnK57ll0UE4iaE9e0PI+9hqb5yG4RB46uTrHH/G/HnlJWCZquDqwYSPaH0CWt9ZUu5YrkZsWmeHKqOhnuggJ/11ILn8j9LJnv68XRG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772108023; c=relaxed/simple;
	bh=7BAdmPyOKJ1QEM3M9r0UGakTNfKtugYYuFz2Cro/YVs=;
	h=Message-ID:From:To:Cc:Subject:Date; b=Zg4cZf7fxevqhLbhwjKZZDOlUbvnaw2sIJl8QPI+2kvWN/gplBPzwcLH0mmtldpgxZa1OzfM1COOFPwYuMgmwf9U5oNiWf0J6l0NxFtUQQQ7H4E8A7QBqi5hNYU0f1P3uMlvIX9QHhcdtvvqB7GKpynq9kUSZwCkbEXh0zVkXJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i93GaD4x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i93GaD4x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD15CC116C6;
	Thu, 26 Feb 2026 12:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772108023;
	bh=7BAdmPyOKJ1QEM3M9r0UGakTNfKtugYYuFz2Cro/YVs=;
	h=From:To:Cc:Subject:Date:From;
	b=i93GaD4x5JDXwPzqxpRulW598AKfONVUkIVk5TtsfABMJnWqjHSHF7iWRneVhNOUu
	 cE4kWZwKgqMisCRFWUdD8nR2WIB5VsL8ValIFPRcZ9bqt9udnRJTGbqU2LBkuki0w2
	 cC6FrZs5N51WgpWl1vhEBQajkSErE+jzZUnO4jPpz8xID8QZ11eodE2rW43I8kG8xe
	 zV2FhevD0YfRUfhh7P2/+rVP5u3dxiX4jmq0Z0pR1Gw56YNSzBCzfRLTCDhn2qF/mO
	 znOVoPGzyId1LCJPGsN8/3iEYiDWM9sVu14X7FiUn5meVZay7+Yw4rtOv/+47v9lnu
	 DTU0mO+TKMrug==
Message-ID: <de64faa8c22aa935fb62b898f33f7f58@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v7.0-rc1
Date: Thu, 26 Feb 2026 12:13:35 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.0-rc1

for you to fetch changes up to 32fc4168fa56f6301d858c778a3d712774e9657e:

  ASoC: amd: yc: Add ASUS EXPERTBOOK BM1503CDA to quirk table (2026-02-23 14:52:11 +0000)

----------------------------------------------------------------
ASoC: Fixes for v7.0

One quirk and a fix for handling of exotic peripherals on cs42l43.

----------------------------------------------------------------
Azamat Almazbek uulu (1):
      ASoC: amd: yc: Add ASUS EXPERTBOOK BM1503CDA to quirk table

Charles Keepax (1):
      ASoC: cs42l43: Report insert for exotic peripherals

 sound/soc/amd/yc/acp6x-mach.c   | 7 +++++++
 sound/soc/codecs/cs42l43-jack.c | 1 +
 2 files changed, 8 insertions(+)
