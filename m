Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5746B3093C0
	for <linux-sound@vger.kernel.org>; Fri, 23 Jan 2026 15:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769182121; cv=none; b=C+yULSwlKEJt9I++LVFxbLCRIHSFDKJzgwlrn65VSl+eXazqDCcIgtjFrDi21r9+ugLB8eidwtCymv068AWv7dCYuZh2Npb0hFE2tuBDp57RvIA3BaUDiSWuQurN/Luw9avq9UXbWyynw1eJBf41QpfEwiOefGkOUi7Njp0rDCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769182121; c=relaxed/simple;
	bh=BayB0MguW184IY84l6LMF+tWtb0nOZuVaKaxIz/F6f0=;
	h=Message-ID:From:To:Cc:Subject:Date; b=cDVsT2xzBKzql9v0NxJ0yYtFmnUvnqL0ln1EPEnDjEw5ffYsmTmXQHLomoMTJ3ekMP4Zpp/IeCKLI1a+MH8A6A/Y+M2bT66yoh2HvgEd6498QGXIITsShmIExjW85lV4y51jBXQmU39KQ8uz1VvfSqvxJ4AbKDB2xke2cOqCpWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cVli+AST; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cVli+AST"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BA3FC4CEF1;
	Fri, 23 Jan 2026 15:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769182121;
	bh=BayB0MguW184IY84l6LMF+tWtb0nOZuVaKaxIz/F6f0=;
	h=From:To:Cc:Subject:Date:From;
	b=cVli+ASTKl+AlZcO3HdbcovtpqWt4/FcjMWvHw6aldySU7Qa95ULJGKa5KU/AoA8L
	 VseoMQkWdd92af/OI3tO5TtdX6wlW3RvDeExtGSc1uVtH3b/TthxztiMutxgG/zHbO
	 X4XuTvs3Cb0GSs5rv1Nt4L7g01jR98aLALiOJoQeyR+9Iqxveg8X0vB4OM8dxQ4vDV
	 KjsuQJ4ZOyMRvrZK0bIYwjavoF1CtxARv0gxTXfNKtqJ+l3QQe325WvYKm1o95QmAy
	 cQjoqdlWm1fV2BNDfDzIUV7hR3PsDUrVgNyOJa5UaNDJ13a6hKXXRgLjx171D7rVre
	 wlVwtXeyZDUzA==
Message-ID: <b9a26fcf7ebc08d3deb132f538a592cb@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.19-rc6
Date: Fri, 23 Jan 2026 15:28:30 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7:

  Linux 6.19-rc6 (2026-01-18 15:42:45 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.19-rc6

for you to fetch changes up to 018b211b1d321a52ed8d8de74ce83ce52a2e1224:

  ASoC: amd: yc: Add ASUS ExpertBook PM1503CDA to quirks list (2026-01-20 12:56:03 +0000)

----------------------------------------------------------------
ASoC: Fixes for v6.19

A couple of device IDs and a couple of small fixes, nothing hugely
remarkable.

----------------------------------------------------------------
Anatolii Shirykalov (1):
      ASoC: amd: yc: Add ASUS ExpertBook PM1503CDA to quirks list

Fabio Estevam (1):
      ASoC: fsl: imx-card: Do not force slot width to sample width

Ricardo Rivera-Matos (1):
      ASoC: cs35l45: Corrects ASP_TX5 DAPM widget channel

Shengjiu Wang (1):
      ASoC: dt-bindings: fsl,sai: Add support for i.MX952 platform

 Documentation/devicetree/bindings/sound/fsl,sai.yaml | 1 +
 sound/soc/amd/yc/acp6x-mach.c                        | 7 +++++++
 sound/soc/codecs/cs35l45.c                           | 2 +-
 sound/soc/fsl/imx-card.c                             | 1 -
 4 files changed, 9 insertions(+), 2 deletions(-)
