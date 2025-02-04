Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F00214802
	for <linux-sound@vger.kernel.org>; Tue,  4 Feb 2025 15:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738683532; cv=none; b=YSL+6zrWkcRGMv3g1eCAiFSZmnzHFPQn7+ZyJJTsEuYdY3ayLnU2QqJ7RdJb6P7vizOPxXsMJJPOlQgXfSitFmyWEnnTlt1frNf8HPIbs159ypbwqCQIkGjNw0gCWEjzi818+HnaBRxeH80Zpk0gbw6SZV5iBE6VpaZrvjMafuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738683532; c=relaxed/simple;
	bh=37Vx9rZ9DRsL50EwMu5uWWBBuIIGpGPjjzrd380ntMg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l59IZDYx1U7V/YrhgtnN16LMWJVLmqaYj9Mfo71dTJf53kBowNNuqnOI2E8Z3U83k48PazD8XqWMSt3ocOrYCUTpGCMoomCFJ4yh4TZotaeTgr0Fbpq00WxjMrQLcBgNI6lSXAEN3NI9dhcuEea73RksPVOKMOBBCM2lnNMc6B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=uaTfxH0E; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uaTfxH0E"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738683517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9P7/wKz7LVAPwtYVbSKf70e789kM9BvyeB6cnxCHqgw=;
	b=uaTfxH0EoY8gZDNZu0+ATwtuZXuYWyK92npFC74jGNgWcNSAnqlP/1/C0vZSmcnO3qDWzS
	JjlesU2Dhf4Eir7+qSHye9860H3WIHA7RuRpvaAem4m/O3WdA3O7C9JziOGBXCDCWEZkdg
	/skAsoEpKBBLXHLjkG9jCSCcsj6JT/o=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] ASoC: SOF: mediatek: Use str_on_off() helper function
Date: Tue,  4 Feb 2025 16:38:04 +0100
Message-ID: <20250204153806.3587-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Remove hard-coded strings by using the str_on_off() helper function.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 sound/soc/sof/mediatek/mt8195/mt8195-clk.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/mediatek/mt8195/mt8195-clk.c b/sound/soc/sof/mediatek/mt8195/mt8195-clk.c
index 7cffcad00f9b..2c2c4cd323fc 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195-clk.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195-clk.c
@@ -8,6 +8,7 @@
 
 #include <linux/clk.h>
 #include <linux/io.h>
+#include <linux/string_choices.h>
 #include "mt8195.h"
 #include "mt8195-clk.h"
 #include "../adsp_helper.h"
@@ -114,7 +115,7 @@ static int adsp_default_clk_init(struct snd_sof_dev *sdev, bool enable)
 	struct adsp_priv *priv = sdev->pdata->hw_pdata;
 	int ret;
 
-	dev_dbg(dev, "%s: %s\n", __func__, enable ? "on" : "off");
+	dev_dbg(dev, "%s: %s\n", __func__, str_on_off(enable));
 
 	if (enable) {
 		ret = clk_set_parent(priv->clk[CLK_TOP_ADSP],
-- 
2.48.1

