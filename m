Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E8A2222AA
	for <linux-sound@vger.kernel.org>; Wed, 23 Jul 2025 17:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753291222; cv=none; b=rFni62Ol6BWTXU3vlB2t4omJpFU1okCulie26zFYsfUVCYpCClenfsBDpMyPMEwcHKFX07fsJdL7oRKRyr2fLriWRyWNYN5OQNXPPuWzfPnFOYhZ7pEz8rzeQSoJVLa1dGfKWbMFmDHH1Wh0KZVcowlzIV7eaXUBNx2QGNcwlGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753291222; c=relaxed/simple;
	bh=UI/81IiG3CPmX3FTZGJmco5ZdU4RhdKMOvL3QjjyAQI=;
	h=Message-ID:From:To:Cc:Subject:Date; b=AvWc4JFV+Z63bNEF6JbnbYFOYCSUn2Jfts2AZfl1vk5URjBToEWqoApfumm849m7kKyK604C2buw/JdG1HcNmbyqO3IYkPDvHtS6NtsWRz++Or0fb1ESOH2ephNoTj+Kg8GWq+lJAAplGFC3Ip2seO36ShIFCLameFzBtKp4OkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fpUCirDY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fpUCirDY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D08EC4CEF4;
	Wed, 23 Jul 2025 17:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753291222;
	bh=UI/81IiG3CPmX3FTZGJmco5ZdU4RhdKMOvL3QjjyAQI=;
	h=From:To:Cc:Subject:Date:From;
	b=fpUCirDYplzPUr9ji7rEGtTobMpbIavX8NfSLfKrNfh/+hTDpApb9oJz23bYtJ0be
	 cQCew3KqhlXspziOzTJSr4odGL6aQCXs2jZ/PW8tc5389N9FzV5YttOuYeUG+am/EV
	 nQwxaJ5By1B4fEhspgEwt0vEao/ujE7q3uryP7iKQNB9+xAdLVnfA5o9flq2K6GLzx
	 /mITVBRIA8NRL7yGY9tM4HE1sju0w30z3I1RWlxVV9KSGrxFmkHD5wFtWYeqpUXspb
	 IMrgjCFXkEFaPA/n3Kx8BFLUFFe62T25/ITUL4D/ADNaNubJc7YsD+0frXSSLcznIy
	 xipr300KPlY3Q==
Message-ID: <bcb82e4ad25ee3af0e561906a507efa3.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.16-rc7
Date: Wed, 23 Jul 2025 18:20:13 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit 7bab1bd9fdf15b9fa7e6a4b0151deab93df3c80d:

  ASoC: amd: yc: Add DMI quirk for HP Laptop 17 cp-2033dx (2025-07-16 11:50:33 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.16-rc7

for you to fetch changes up to 696e123aa36bf0bc72bda98df96dd8f379a6e854:

  ASoC: mediatek: common: fix device and OF node leak (2025-07-23 13:03:57 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.16

A few device specific fixes, none especially remarkable though all
useful.

----------------------------------------------------------------
Derek Fang (1):
      ASoC: rt5650: Eliminate the high frequency glitch

Guoqing Jiang (1):
      ASoC: mediatek: mt8365-dai-i2s: pass correct size to mt8365_dai_set_priv

Johan Hovold (1):
      ASoC: mediatek: common: fix device and OF node leak

Ranjani Sridharan (1):
      ASoC: SOF: Intel: PTL: Add the sdw_process_wakeen op

Shuming Fan (1):
      ASoC: SDCA: correct the calculation of the maximum init table size

 sound/soc/codecs/rt5645.c                        | 1 +
 sound/soc/mediatek/common/mtk-soundcard-driver.c | 4 ++++
 sound/soc/mediatek/mt8365/mt8365-dai-i2s.c       | 3 +--
 sound/soc/sdca/sdca_functions.c                  | 2 +-
 sound/soc/sof/intel/ptl.c                        | 1 +
 5 files changed, 8 insertions(+), 3 deletions(-)
