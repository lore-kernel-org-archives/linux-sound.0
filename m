Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AD0483BC0
	for <linux-sound@vger.kernel.org>; Mon,  7 Sep 2026 12:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782631; cv=none; b=MPsyXiswr8LdymvKMoeoNn0WFuP/7PV5ZhPiQ4U+KkweS8ZfGd3BAqGlVd7daqfAcHjNDPRUNEULuzPyqXVxBjHUsPAEXi6okYkxFseGCYKjxfYtLcWnmwDpOc+B6CnSapaGGwlIGuFly9uWBCDPyrkmtnfaf6LkC3DGvvCvfDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782631; c=relaxed/simple;
	bh=KhkOmwnapS3cd429q+vblKGN5LA3Ldi5GUgHfE+aNuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ACI8f/vFTU1IMpi+rofxuoOXoAYHsecpF8S1GI1vujx0YgU0aibp4T+tsuE6WnXZeicQijY2yxwhjFAWGq1+K0KjC1IrO4JlOzRAPhZOlMjUubun94TxK1bGAJIiNPS3cYxTAHk9Cazm7PHI4KhJmAi++WsFso/sXIfAB5WNlNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e24fuVsA; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e24fuVsA"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cc891373e0so36471725ad.2
        for <linux-sound@vger.kernel.org>; Mon, 07 Sep 2026 05:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788782629; x=1789387429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ea6lVpnhWbYQ3wI5UpSM25XcXKci0dt7/GlZ6PuirvE=;
        b=e24fuVsAqMfoPUuO44W+3zKWW35+o379AfNSREg8qlsOweEnUGK0T2PpKZA0PCS+G3
         k4vzbi0wjQD6mLEUMmT/ps83bvEB3Qo38qaUxZLR39ZtFqhvdRNhIORtkdZkTjWOY/EX
         JBQdrvI/TDDqE6geGBpLdo1euIr3PcCfKiAEgAUX1lQRinPSvqAXWZys9Sx0W04L4dA8
         y4Wm9b5k5WXJQWhVFkTIbLmFreeNDARx1IBx8LY9gCTMDsVcnQed8ovc39Jd+xq2VOR7
         /dl0PRDpOKmFIEozKQrPxXQFrGPpbku4iYvhZE/jUdErNn7TMHNCd4BF1eAaI1KikPt6
         hM0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782629; x=1789387429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ea6lVpnhWbYQ3wI5UpSM25XcXKci0dt7/GlZ6PuirvE=;
        b=goXk5PbDOjfJzkNKqkkKSMmVNClvg17R4/vgEuSBNcyATMSLrBDRYUwQ+P8enS6Kh1
         7F9MibF+3PdJFOcZ1Ra+xd0kSJveQvfV/iK30tyNg5SX4k5dbadwJB/4FwNVW6UEuXcT
         r1xXvcJKkkxor9EV5EiYAi8JzYS6GfXYr7enoQ6Oq0s3VnG/s42XepQcX+iTgQTbcCLB
         b09w7Zcsw7n6GXnYe/sO++vPuQKWg5svQfnbtdZB7rrr8E+d6+fmvXV1bJWUrAiVxpZR
         YvwWVrksKKXcZnOionjkfeO7aOCydfdjXEWmbx9dDqGYGmF0o8HCk+penwNZh5ZsK24Y
         EAvg==
X-Forwarded-Encrypted: i=1; AKwUvBzsPnHu3Wjtx80sNzfSIDKsyrXSzdp82bcm9IleZFpYoYSYbRfYSqZBWi2OwzoDlLeQmNDNTUhcOqoBZg==@vger.kernel.org
X-Gm-Message-State: AFuF++n4F+gVnx/mm6mrurk2O15V9r7+13MIkZLImDK80Ly6tbf/M6kd
	IEnDNlc7Sl28rEASs9Y91j6rAWQ94xZzjVe+rbpEHPmTVFW2Gb8gPwpv
X-Gm-Gg: AYBFou3r++ewp+nCZIXJBtkojrU1NHgKqUn/nntguVtugA9c2Q2QLtwYbyYZGAMNJr3
	sPil5TrAHVZIb9FN/XmFt50aJXlk0u1qwhpxcNevlLVDzZMJKzJnbdu176ifl6YzR9ufyfYusvV
	i0FV/PCkFvs/USTq1CdkphQ6M4zc6uI3M9DcBO7FZnsShtFfuWyeL2+SpGAIIuXGUnEEvBh3ZvR
	pLeoQmhJ8I9urVUsKqK90+YtsBkfi9SDYyDWKu0y4pFO0J0nWHBFwdfHjCCW3BnXOFqp2z653Uq
	PJoC1mkMtobTcMSzfKy4qI7OwHU6vKV+ImeQgjjNw3l05AqeW+BR0TtC7/GzgTPUTrekK21zaGf
	LB/Yi70UB5UGBOabITgBgtmApzzZQ/zAhIdaQ6o+gVOwoXLoVb8CjrtziYH08bxDjCEazREZucu
	1GJmn9272CC7hveP89162Em8e2lJcGZ366UqkLIS9d523MhA7MvyRi2W9jkZ7IQfxJON+QaiDHZ
	UkG0Y1YE90LbA9R3SkKNZhyxfCdHLSdGpz2ZXjgcnUaY3wyqfYgPL9p03vQaCXyusMpQKcciC8c
	Q/fSqwOIW7HUY/k=
X-Received: by 2002:a17:903:40c9:b0:2d6:f6ba:263d with SMTP id d9443c01a7336-2db124b451cmr310785685ad.7.1788782628815;
        Mon, 07 Sep 2026 05:03:48 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae85eesm43064815ad.82.2026.09.07.05.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:03:48 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Kees Cook <kees@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/7] ASoC: mediatek: mt8188: mt8188-afe-clk: Handle tuner clock enable errors
Date: Mon,  7 Sep 2026 19:03:05 +0700
Message-ID: <20260907120310.135693-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907120310.135693-1-phucduc.bui@gmail.com>
References: <20260907120310.135693-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clock enable errors are currently ignored when enabling the APLL
and tuner clocks.
Check the return values and roll back the APLL clock if the tuner
clock fails to enable.

Fixes: f6b026479b13 ("ASoC: mediatek: mt8188: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8188/mt8188-afe-clk.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
index 42878c8a6529..ecba13eda440 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
@@ -260,15 +260,28 @@ static int mt8188_afe_enable_tuner_clk(struct mtk_base_afe *afe,
 				       unsigned int id)
 {
 	struct mt8188_afe_private *afe_priv = afe->platform_priv;
+	int ret;
 
 	switch (id) {
 	case MT8188_AUD_PLL1:
-		mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_APLL]);
-		mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_APLL1_TUNER]);
+		ret = mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_APLL]);
+		if (ret)
+			return ret;
+		ret = mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_APLL1_TUNER]);
+		if (ret) {
+			mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_APLL]);
+			return ret;
+		}
 		break;
 	case MT8188_AUD_PLL2:
-		mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_APLL2]);
-		mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_APLL2_TUNER]);
+		ret = mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_APLL2]);
+		if (ret)
+			return ret;
+		ret = mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_APLL2_TUNER]);
+		if (ret) {
+			mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_APLL2]);
+			return ret;
+		}
 		break;
 	default:
 		return -EINVAL;
-- 
2.43.0

