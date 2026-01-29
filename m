Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C58129ACD1
	for <linux-sound@vger.kernel.org>; Thu, 29 Jan 2026 12:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769688857; cv=none; b=V92TSIjCocmpRY8UPuIyQ2KNN42/UxFR7WIMZtJQZNdzDNp61kSNW5GlI6XLW6/54EwVZm6rBE0nM/KOqZ8DtnCQZSDHkX1NHrEhQqRbDoFphDlMOva5MtdHwSzeY4EVumojo12tOG2vndPYI8J9IHU6oeIxpbNdEwfAubIiyls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769688857; c=relaxed/simple;
	bh=X9kCLX2UpnAWAgAiU1NerAqlL64hG62IJO5QiyEVm5c=;
	h=Message-ID:From:To:Cc:Subject:Date; b=tPEfXlwmzf45GnsW77qSuiIZcMpmeSHxZ5s30ZCB/kpok+IDEKszRjMIrwo39rcp/9jUlAA6miDhIfXLIy1J0lbkCs7XhKgMCX06P0brmp06QuY+lisGX393rtFlIfmne70bmVtw9z+ms9auAN37YqHD/UHtFTDAp0ObBETOqYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hxBcAmdC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hxBcAmdC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7610DC4CEF7;
	Thu, 29 Jan 2026 12:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769688857;
	bh=X9kCLX2UpnAWAgAiU1NerAqlL64hG62IJO5QiyEVm5c=;
	h=From:To:Cc:Subject:Date:From;
	b=hxBcAmdC2mGwDE7BIrPr8ViusVEvi03SiE4O7gi7483GPyP0M5vlcsye7C6cQnqUU
	 1/lYNPb/9G6b4zAk3T2Ue9k2A/ZxrYr8LMNLNxqpA+HJrNrUaISCLMluHQO4ui4LTz
	 YEq40ha90uND9935vvror0fA/o65xk23GDxXxniYIQ1Md2fTBtg+Z+gsXkUgQmAcMB
	 hpcebwrRnLRQhhwEbTMmK6ZFcQsX+wt6SHbiA4Fj6yNiDrfY64biIemjDqJh6jUGR+
	 lxouW1W0ShIK6DgM7XQhPJqlmMSjgS4fp43X97gQePrgj6nFDgIQ4hGdMANUIX3MP2
	 vLiyDC8f0jG3A==
Message-ID: <0ae6fdf736731e11afa19b5e0a3d6001@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.19-rc7
Date: Thu, 29 Jan 2026 12:14:05 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7:

  Linux 6.19-rc6 (2026-01-18 15:42:45 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.19-rc7

for you to fetch changes up to 94e5baff3ee3cd1a5246c85b0744092eab1c5d42:

  ASoC: sof_sdw: Add a quirk for Lenovo laptop using sidecar amps with cs42l43 (2026-01-29 11:41:54 +0000)

----------------------------------------------------------------
ASoC: Fixes for v6.19

A couple of small fixes and a couple of quirks, nothing major

----------------------------------------------------------------
Anatolii Shirykalov (1):
      ASoC: amd: yc: Add ASUS ExpertBook PM1503CDA to quirks list

Bard Liao (1):
      ASoC: soc-acpi-intel-ptl-match: fix name_prefix of rt1320-2

Fabio Estevam (1):
      ASoC: fsl: imx-card: Do not force slot width to sample width

Maciej Strozek (1):
      ASoC: sof_sdw: Add a quirk for Lenovo laptop using sidecar amps with cs42l43

Ricardo Rivera-Matos (1):
      ASoC: cs35l45: Corrects ASP_TX5 DAPM widget channel

Shengjiu Wang (1):
      ASoC: dt-bindings: fsl,sai: Add support for i.MX952 platform

Tagir Garaev (1):
      ASoC: Intel: sof_es8336: fix headphone GPIO logic inversion

Zhang Heng (1):
      ASoC: amd: yc: Add DMI quirk for Acer TravelMate P216-41-TCO

 Documentation/devicetree/bindings/sound/fsl,sai.yaml |  1 +
 sound/soc/amd/yc/acp6x-mach.c                        | 15 +++++++++++++++
 sound/soc/codecs/cs35l45.c                           |  2 +-
 sound/soc/fsl/imx-card.c                             |  1 -
 sound/soc/intel/boards/sof_es8336.c                  |  2 +-
 sound/soc/intel/boards/sof_sdw.c                     |  1 +
 sound/soc/intel/common/soc-acpi-intel-ptl-match.c    |  2 +-
 7 files changed, 20 insertions(+), 4 deletions(-)
