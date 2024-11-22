Received: from cmccmta1.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0066713C3D6;
	Fri, 22 Nov 2024 05:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732254761; cv=none; b=j5ILUos+/3vXHpge/oqnOhwKYnTunkgbXR60TrtG8yQ50fdR4ZQ7LFKXGOW0gwC38GWlIW3Ta/YKAhaCkcNPdg+BWoKEbZG8CqDnBQThcDwuXn0wLoCaXoouNxS0BojG1E/nlKxWn+3eSfrbU77Eh5daUNFyabvm9TQRUJFTRiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732254761; c=relaxed/simple;
	bh=JkMMvhwlWANYEkhQn0GPQX8LNWu49vJYTg1Lc2+aSwQ=;
	h=From:To:Cc:Subject:Date:Message-Id; b=hkLWBxBHL3mR6zr1CLCS8aRADE/08QLWd+wX7Znzp6rK6S6tY5O2psT0mD5Vm/cX4K4DGi7C47JMfxMlMPTYNLC7tA9ULFHJe+gP+/YneqJleq4ghxdE87+XPmJfBBtB3JG6Rqgajms+jxiNwqssp8aN9p6yeDU94rd/mS5pstg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; arc=none smtp.client-ip=111.22.67.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee367401c1e1a2-339ca;
	Fri, 22 Nov 2024 13:52:32 +0800 (CST)
X-RM-TRANSID:2ee367401c1e1a2-339ca
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from ubuntu.localdomain (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee567401c1f003-2914e;
	Fri, 22 Nov 2024 13:52:32 +0800 (CST)
X-RM-TRANSID:2ee567401c1f003-2914e
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: perex@perex.cz
Cc: tiwai@suse.com,
	matthias.bgg@gmail.com,
	zhujun2@cmss.chinamobile.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] ASoC: mediatek: mt8188: Add error handling in mtk_dai_etdm_enable_mclk
Date: Thu, 21 Nov 2024 21:52:31 -0800
Message-Id: <20241122055231.3463-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

Introduce error handling in mtk_dai_etdm_enable_mclk to ensure that
the function returns immediately if mt8188_afe_set_clk_rate fails.

Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 sound/soc/mediatek/mt8188/mt8188-dai-etdm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c b/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c
index 69a091dad..bd325dc71 100644
--- a/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c
@@ -430,6 +430,8 @@ static int mtk_dai_etdm_enable_mclk(struct mtk_base_afe *afe, int dai_id)
 	/* set rate */
 	ret = mt8188_afe_set_clk_rate(afe, afe_priv->clk[clkdiv_id],
 				      etdm_data->mclk_freq);
+	if (ret)
+		return ret;
 
 	mt8188_afe_enable_clk(afe, afe_priv->clk[clkdiv_id]);
 
-- 
2.17.1



