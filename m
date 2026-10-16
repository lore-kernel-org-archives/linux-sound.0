Received: from r3-129.sinamail.sina.com.cn (r3-129.sinamail.sina.com.cn [202.108.3.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9292E3822A5
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 11:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792149528; cv=none; b=CPjeQwK/5/FXYs5+EmZEVsYIB8RQe/RjkVE8wrdbUMaj/aG2mfQa/dtzQTmAGspeGrf/HyjkHPxIiPnTWGkH6qzaMmEkiTzEHC4xXbQ/HYAEPZilawdim5DlU5znKfpwbyle48WWqoR6hRLJeWQZZ/xjblKZPYRndJMI0S6a0Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792149528; c=relaxed/simple;
	bh=52DGD/emTOl9jlW+BzbrnyxtL0zyIpT5i3pDgjHZ/S0=;
	h=From:To:Cc:Subject:Date:Message-Id; b=o7/xiedR8hYiCVtVb/bB6JraZs4lvx8JatH8r6riT8l/2/FhEZvrCPYiC92J20s7Xzp8wyACGmgv//9hcH3EpABqbzZtQaUxzpY9brkUqLdZmuhQem8/fopKwcrYSjpAcLlKDhw/uJ24cyLaJjFZ3jDdFnWVrvHBQWr+1dhdZms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.36) with ESMTP
	id 6AD2048D000072B3; Fri, 16 Oct 2026 19:03:41 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 4B59AC8FDC98474B9591F8B17911468D
X-SMAIL-UIID: 4B59AC8FDC98474B9591F8B17911468D-20261016-190341
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH] ASoC: codecs: ES8326: Fix the issue about pop
Date: Fri, 16 Oct 2026 19:03:39 +0800
Message-Id: <20261016110339.17028-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

50 ms is not enough for CSM_STA to reach the correct state,
resulting in a pop noise during calibration.
Testing revealed that the value needs to be changed to 200 ms.

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8326.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index d522d254a..74f276abb 100644
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -1146,7 +1146,7 @@ static int es8326_calibrate(struct snd_soc_component *component)
 		regmap_write(es8326->regmap, ES8326_HP_OFFSET_CAL, ES8326_HP_OFF);
 		regmap_read(es8326->regmap, ES8326_CSM_MUTE_STA, &reg);
 		if ((reg & 0xf0) != 0x40)
-			msleep(50);
+			msleep(200);
 
 		regmap_write(es8326->regmap, ES8326_HP_CAL, 0xd4);
 		msleep(200);
-- 
2.17.1

