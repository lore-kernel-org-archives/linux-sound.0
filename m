Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC3D30EF68
	for <linux-sound@vger.kernel.org>; Mon, 17 Aug 2026 11:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786966387; cv=none; b=muYLg+N2HdFxsIUiLlcLTgwbuI01CHP0va8NXcI7eNaCxVgZ7D0pUFRHzfDx++qIsjr3jaq0ycYvO8X/wMaIrzUiFxTYofeqPx1OIPUtEQOqC4yNRF1f0lQofR+GXoY9n90SG/jUUCSuykcyVEctMcuZ5KZHa3GtxVEy61qLvqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786966387; c=relaxed/simple;
	bh=6q2VCmp59wx4RbEU5Nr2z8JZDX/7Mxvtm/ZWyugcxIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=awpMgwMKKEI3YcloFIkHX2TCL+ixrIGgvxNFtTNQm8dYZ52Gai9rQ7vcXUd64yFtY9R+/CheGCVqUP2EjJd7Gb/WjR1WCLCckfulxvAdo6yNF+yiAI8BMAMAiewRsTk0r+SvfAkhMok2CVPxrEw4SzZm5Jm6vdUQiIKiv14vajg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XXo84Mjl; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XXo84Mjl"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38e347638adso3944683a91.0
        for <linux-sound@vger.kernel.org>; Mon, 17 Aug 2026 04:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786966386; x=1787571186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/xNynUBdZ1hKic7P/IiQFiODLJooKh+/AvfbqzXkgn4=;
        b=XXo84Mjl1ZTKiaKqekNsvZftJe/J2piKhD/RI5Yt8kK05+WA7qD3OljVJ4U9pDQ5hq
         i2mndPQtCAukyIiS3vJbNvDZHPlUr43mleYTKpvD6erX62Migym5BQzcu+L/n+9123UJ
         uurF/pxsh2qfivCzfC+daD2Kc34Oih3h0GVBNaWEakbB1gXQHjmlWYL7WACycG204t4h
         sU/OQrb2AiPDifW3KIPpnRZKFO+bVEOsTFGfLt4LyzhsFSzFbOpU1a894ETzrf49YjZD
         BX8Bd68Yy8gOBLLEZCkW81dWttwq3SPTVmhvdfm4MKpQeVnt1tjGvxndrvFO9qFptaBl
         fC/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786966386; x=1787571186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/xNynUBdZ1hKic7P/IiQFiODLJooKh+/AvfbqzXkgn4=;
        b=Eb3fFqr4+22/7vsQ9KA++FSX+oZ1rTtAbIgzdd9ZxJkmlHwNRBB+tZj88NiUOJe3kD
         i1wXsVRkCIdqW5iDiOlwu7WAlMelGYn/WOWI/t0UlZYbhG84IkkYt3TGpgmi0GIhDWE1
         tluWHcG7M64AY67q35TgE2m7cuhvTzyuZEHM93nmByZCX6jFkzLmSu4R8OcanE7Cy/aZ
         3WgpGG6tHodDVpMzAUhyG0ORdDacUbRjiju1LtAL5OQkNJVgzs/lUemLHMH0JvOU8jIg
         ZRLBWPQB6JOPZ22Eq2TADW3izdwTB2n+hoyH9w0INSjH3ELDh12g67I1ud9vAXWX3d63
         ubGw==
X-Forwarded-Encrypted: i=1; AHgh+RqNyvhDFcja0vzN2cpbTO0NWJZthokQWVwktSYQfjSMw5Xn69KhuoH+D/KVPyFHjsFJVF0Zlwtetx05Xg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2MVuenCMTa8MSJ7QvRlcMcgX6jrRKuvafJcOEWlpFN777yy+M
	EwoUVzqk2TDGHoC8zjHdvPjWlQVai3x8D2pF473+6IPvXE3C8zeyqQ0A
X-Gm-Gg: AR+sD10iMYF1CZQ84AWPk/CO3UZWDV+M2GD10ZwY3lROKQYbC1/DR1HTHhLYsv1DPbb
	dseueoDSbVGbLjoAmYRIAGW9UcYLOdnL07Tb1WRSIv0POzJnbbOEuACiRohPT1e369po3qO6oro
	c1RxFV5GxzLbsjaQWG75+Y2GaTGuPOWALqHpRkvRCL7n8dRnJReAt0UOTYGV2P9WP0X+PalfU8o
	ODfRSUpqTSriUwHUmwfTZMDj08zqiJh0DO3FoNnC93NdYgGr8RsZb/9jVTq3xFkXC/lgwB7v2p6
	2LJOCdAlCy8YQC13P+Z3bw9RFnKr2XWw+rBK7f4VYSNi9gN1HESYec/r8EnkWcY8fMk+jFkkFG+
	LWA7LCTclY0+VneUap8/e13Sbs4m8wzXvvX3csHxGrYFgt8dESdRp4Wv/gZqIlQHSZiwcA4QG7G
	JCxz92VUkP33p6AhiNyvhmCQrVzcAQEtIGxKbe41/0htpk302/rLVSkF9TJtOUK0MHhZXOMIWdA
	H36ltnkhLpwSX6DHuI1ajt7i7ka+PUV7iuWFaaz3Kgy6VAz/6wS5WDqgIh6vloj85tzOaGf9rHb
	RU1AYhxMglfBxpg=
X-Received: by 2002:a17:90b:17c5:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-3933b874ad6mr23181975a91.10.1786966385953;
        Mon, 17 Aug 2026 04:33:05 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d3b3b91sm2071705a91.13.2026.08.17.04.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 04:33:05 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/3] ASoC: mt6797: fix wrong unwind order and error code in enable_clock
Date: Mon, 17 Aug 2026 18:32:47 +0700
Message-ID: <20260817113249.69252-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The error paths in mt6797_afe_enable_clock() use incorrect goto labels,
causing clocks that failed to enable to be disabled during cleanup.

Fix the goto labels to only unwind clocks that were successfully
enabled, and return the actual error code.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt6797/mt6797-afe-clk.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/sound/soc/mediatek/mt6797/mt6797-afe-clk.c b/sound/soc/mediatek/mt6797/mt6797-afe-clk.c
index 6f3e6acfcfab..0ac04d73b777 100644
--- a/sound/soc/mediatek/mt6797/mt6797-afe-clk.c
+++ b/sound/soc/mediatek/mt6797/mt6797-afe-clk.c
@@ -63,21 +63,21 @@ int mt6797_afe_enable_clock(struct mtk_base_afe *afe)
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_INFRA_SYS_AUD], ret);
-		goto CLK_INFRA_SYS_AUDIO_ERR;
+		return ret;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_INFRA_SYS_AUD_26M]);
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_INFRA_SYS_AUD_26M], ret);
-		goto CLK_INFRA_SYS_AUD_26M_ERR;
+		goto CLK_INFRA_SYS_AUDIO_ERR;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_TOP_MUX_AUD]);
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_TOP_MUX_AUD], ret);
-		goto CLK_MUX_AUDIO_ERR;
+		goto CLK_INFRA_SYS_AUD_26M_ERR;
 	}
 
 	ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD],
@@ -93,13 +93,11 @@ int mt6797_afe_enable_clock(struct mtk_base_afe *afe)
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_TOP_MUX_AUD_BUS], ret);
-		goto CLK_MUX_AUDIO_INTBUS_ERR;
+		goto CLK_MUX_AUDIO_ERR;
 	}
 
-	return ret;
+	return 0;
 
-CLK_MUX_AUDIO_INTBUS_ERR:
-	clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_BUS]);
 CLK_MUX_AUDIO_ERR:
 	clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD]);
 CLK_INFRA_SYS_AUD_26M_ERR:
@@ -107,7 +105,7 @@ int mt6797_afe_enable_clock(struct mtk_base_afe *afe)
 CLK_INFRA_SYS_AUDIO_ERR:
 	clk_disable_unprepare(afe_priv->clk[CLK_INFRA_SYS_AUD]);
 
-	return 0;
+	return ret;
 }
 
 int mt6797_afe_disable_clock(struct mtk_base_afe *afe)
-- 
2.43.0

