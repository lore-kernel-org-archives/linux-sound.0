Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A3232E143
	for <linux-sound@vger.kernel.org>; Wed,  1 Apr 2026 17:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775064254; cv=none; b=FfGr66/5AdscMG5PHyxCN5HrXvH2kEsz17uMtPaDQgkwkym3f15hb1b1H3SXxyI3D22IVE10MOg85c0iAWMlbUanoQwjIeEn189/Q64NoJXDvCY9OGxjUXInatYAalUKnJxelyxGQrqXdsPNg7JZDQ8nTA/6cZTe7NW9WxPaoBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775064254; c=relaxed/simple;
	bh=Q0jJ6V1m2qdr8A0gWUuXA1k19WwiAibMZ8fDfAGBVoA=;
	h=Message-ID:From:To:Cc:Subject:Date; b=LDBfJBjazEa1PeRphjgQU2uwl8N/m0RRZoAd/Td1zkneIzdBjVs6GFHtcgUMh0/19gZEJno76pjdTLiSB/44Nfixs86+FlwBJ4M0vQklMaG7eE+aCqbzSxyTLqUxsoyX+ZSbdxCuLVLqS33yprc27ma2/fDPbvzx60OdizwVfvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MZhGIpxa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MZhGIpxa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D03BC4CEF7;
	Wed,  1 Apr 2026 17:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775064254;
	bh=Q0jJ6V1m2qdr8A0gWUuXA1k19WwiAibMZ8fDfAGBVoA=;
	h=From:To:Cc:Subject:Date:From;
	b=MZhGIpxaFOOv65Q/3jwjxGMzdovNClX/giJqdPkv4PpPsfqgxqGBRCX7wIaFQc3b1
	 ie3f3jQZPcLbh2hMLUnaz3dBbzCptWWRk2dn6Efp9l01aaPF3SzqhIfwhXpPFw/Rfy
	 xDF0GfYNUxwdVgvkYPOvjClnKikNSDq7Ww3kl+6Ka9RD0AA9PsWc+HI/FLkCAcHvtP
	 z0ASXwflJjtMmVKqysRwhPKbMl9+da3C9GTIcAPscaVrKG+Elp9Kxc8TTJeUEzEAFp
	 jc5aY4AgfyCGdBWgbOrAf3cicmHGLDgKcjtOOlXAGjm2P1F7Bg5Fmu9PejWTW5ee6z
	 5Cl9avKg8s/zg==
Message-ID: <c736ee7c35c9676f3c71335e74d1d157@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v7.0-rc6
Date: Wed, 01 Apr 2026 18:24:06 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit 7aaa8047eafd0bd628065b15757d9b48c5f9c07d:

  Linux 7.0-rc6 (2026-03-29 15:40:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.0-rc6

for you to fetch changes up to e74c38ef6f170179c0029b5744d6a14dfd543108:

  ASoC: amd: ps: Fix missing leading zeros in subsystem_device SSID log (2026-04-01 13:08:47 +0100)

----------------------------------------------------------------
ASoC: Fixes for v7.0

Another smallish batch of fixes and quirks, these days it's AMD that is
getting all the DMI entries added.  We've got one core fix for a missing
list initialisation with auxiliary devices, otherwise it's all fairly
small things.

----------------------------------------------------------------
Gilson Marquato Júnior (1):
      ASoC: amd: yc: Add DMI entry for HP Laptop 15-fc0xxx

Jihed Chaibi (1):
      ASoC: ep93xx: Fix unchecked clk_prepare_enable() and add rollback on failure

Julian Braha (1):
      ASoC: Intel: boards: fix unmet dependency on PINCTRL

Kuninori Morimoto (1):
      ASoC: soc-core: call missing INIT_LIST_HEAD() for card_aux_list

Sachin Mokashi (1):
      ASoC: Intel: ehl_rt5660: Use the correct rtd->dev device in hw_params

Simon Trimmer (1):
      ASoC: amd: ps: Fix missing leading zeros in subsystem_device SSID log

Zhang Heng (1):
      ASoC: amd: yc: Add DMI quirk for ASUS Vivobook Pro 16X OLED M7601RM

 sound/soc/amd/ps/pci-ps.c           |  2 +-
 sound/soc/amd/yc/acp6x-mach.c       | 14 ++++++++++++++
 sound/soc/cirrus/ep93xx-i2s.c       | 34 ++++++++++++++++++++++++----------
 sound/soc/intel/boards/Kconfig      |  2 --
 sound/soc/intel/boards/ehl_rt5660.c |  2 +-
 sound/soc/soc-core.c                |  1 +
 6 files changed, 41 insertions(+), 14 deletions(-)
