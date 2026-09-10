Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F7D48E0CB
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 12:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045115; cv=none; b=cAoP+zR1Ijkpjw5t7E++lanw/YwdRlwZcpoe0UbNMZVTbJOC7pCx2Ec29by6GBxtKFB1qeQP1zlUBHiC2P/Bs+BEpcQSkwH4IeIaQJEWr4DLV2uDpRCg03ZbmIfqYsqmbA9cc7zT1DkWqtBQEjDAW60NW3tRi3B085/CsGgHaOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045115; c=relaxed/simple;
	bh=yM4L3d5xAxA3ZdEO3lRnqdCQHhz1gw6fuQgVMe41j5I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EEYx5DGFxh22dpBcgf0tivYM0jODtCgnSdT+ImI21XEdT1CRtSZQyfkkFdeR7HnYixlKxaJ0Uv1nuZKTUeR2iP7WIT4qz/JfyxlyH89c1wQGahzYXRgLiJg6332bFELu5tuIpUZxT4Q2Dr/05FfX0lzqsbYKAyQhI/ExtbiAbUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=skQAj1+4; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="skQAj1+4"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4ae61629fso626759a12.2
        for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 05:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045113; x=1789649913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X0f+3hmpde177tradfD9iqffBrSGUNX0UYvHhWMmKXM=;
        b=skQAj1+4eJCaWdBS4pZ/idL7FrFydoXhJKy8mgLTV1REAiLYGCN821dfRHngaWgAiz
         yF9GVXEv/yTMsMG5EBCC7zb4h/yURwTvrq4CeBPV9doYYSdY6FULvUgHEzZoIsNBylwL
         dub7fSmlYlgyNqE07mxsxujxAR4rvku6xCykfkdfKyOBqCKPIF2mGTOQxLMh03L6J3EL
         E6X3zH3F1b8aZHw/zfms/tsQ4SECk2fGREBZdidZT/ZH0TMMC7dXoqw+L07f6EI/1sLN
         U29zBeB2wzkjwz8+tHeFBzNXcL/GzCoinWWfNPezSrZN00oTCRVBzetJ/yUJO34qvP8I
         3SWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045113; x=1789649913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X0f+3hmpde177tradfD9iqffBrSGUNX0UYvHhWMmKXM=;
        b=Wrqz1vKIv8/CbBQnwNl5QaH8wxguE7PK2pvIcbZAB/1TdB8TZo9DmHHkXSCLoNvim4
         y8rsl1OznuFj8GzGpSHJkWC/nTSSw7i3oWw2U5EzyyGITu2Mvv4SqFooaNHvFbbbj7AK
         VLZ66DXdvX86dqN+GXKKSLcBTG92DTSTI1wY2gFuCs8mQly6WQZ6JJubTJ+HvrKZkrIW
         dYsAlWwj0CI5+HALg1aS125XKihxW+pNpub0QTRBw8nimYknV/9oLgzRU/Xhu2HvSfqZ
         DhhGQUNIl9S0nBbAfQ+1hxBvOFstScGwYazpv3kj9MkgMmbmZ+0NJXhLtjpbmQPdaA+0
         ZJCw==
X-Forwarded-Encrypted: i=1; AKwUvBzLiZdxBFMD8HRZOmHBuMPuIdCUZuHeG355nmNuxiFWbDVAd+1C/hkUwNdxT5S0Zh2oGg5hZ+GJcdwGIQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mbFL5Jc4yb2wka89nObcwje/AezlKApeeDlgeIydQVqUAlSM68
	y3t9/99Ilxr0sYNDIOGaq4qUT/VbiW2L2Eit7Vfk0dLE6Oub17MkAKTR
X-Gm-Gg: AYBFou3kNl0oaQsf6648p0qGZ0HyEKNAFwQuFr4i9xqJOAVlH95/I3rWag2bUnXN1w+
	SgIDMQ1RckLDbygQYjKsQ5sv4rc8V6rm0wdniIMVv0V33qOTKI5JxnTzXT1XL1l44iu79VM93OR
	sVgTeXfD8djGKY+kcziebpmPv641dsSEQYozPKIYNSnuqPAkageagMfmT/IRWirVa1kQDW3VJKO
	m2PnQZFf+SPnTntXh4q/h/ENLQU4XaSPFKO1yH5fbhU0z+78LMNeX98pUM24y6LonL8dPHchGPA
	7z2z02Q864oHoW04g3n6OQIlMLaT1js3enqvEOFinqGU/CiGlC4qdTckW3HoxyOc6MT4BkqYY0l
	L8MsmXzfySkc0LwzncQ/HWm6FXpM/ZPgYYvo2HRLVb+F99lp6RxUEzWbSohHH/V+bNgxUDEbfWm
	zdgeDtN+XfzFdGJDxeprZfY2R6KL/23BOpf6U1gXI8Ih3Yd60RWbigy3qtFONfomnZPcGxLQzsQ
	EeSRcpIr7w/Fmd9aH/rWk1RYrxC1QBidChKUCpsfVI3HLGqnowZphGmMhLHxIHg1ZHEUeLDpNmD
	1yGFWo5LAUnQVKc=
X-Received: by 2002:a17:90b:3c4a:b0:39d:6f12:fd47 with SMTP id 98e67ed59e1d1-39d70bb2226mr11925208a91.20.1789045112679;
        Thu, 10 Sep 2026 05:58:32 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:58:32 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 07/13] ASoC: mediatek: mt8189: Propagate runtime resume errors
Date: Thu, 10 Sep 2026 19:57:36 +0700
Message-ID: <20260910125742.150902-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910125742.150902-1-phucduc.bui@gmail.com>
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

mt8189_afe_runtime_resume() currently ignores errors from regmap
operations and mt8189_afe_enable_main_clock().

Propagate these errors and clean up the state before returning the
error.

Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 36 +++++++++++++++++-----
 1 file changed, 29 insertions(+), 7 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
index 77cf2b604f6c..431320719b63 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
@@ -2328,24 +2328,46 @@ static int mt8189_afe_runtime_resume(struct device *dev)
 
 	if (!afe->regmap) {
 		dev_warn(afe->dev, "skip regmap\n");
-		return 0;
+		ret = -EINVAL;
+		goto err_reg_rw_clk;
 	}
 
 	regcache_cache_only(afe->regmap, false);
-	regcache_sync(afe->regmap);
+	ret = regcache_sync(afe->regmap);
+	if (ret)
+		goto err_regcache_sync;
 
 	/* set audio 26M request */
-	regmap_update_bits(afe->regmap, AFE_SPM_CONTROL_REQ, 0x1, 0x1);
-	regmap_update_bits(afe->regmap, AFE_CBIP_CFG0, 0x1, 0x1);
+	ret = regmap_update_bits(afe->regmap, AFE_SPM_CONTROL_REQ, 0x1, 0x1);
+	if (ret)
+		goto err_regcache_sync;
+
+	ret = regmap_update_bits(afe->regmap, AFE_CBIP_CFG0, 0x1, 0x1);
+	if (ret)
+		goto err_26m_req;
 
 	/* force cpu use 8_24 format when writing 32bit data */
-	regmap_update_bits(afe->regmap, AFE_MEMIF_CON0,
-			   CPU_HD_ALIGN_MASK_SFT, 0 << CPU_HD_ALIGN_SFT);
+	ret = regmap_update_bits(afe->regmap, AFE_MEMIF_CON0,
+				 CPU_HD_ALIGN_MASK_SFT, 0 << CPU_HD_ALIGN_SFT);
+	if (ret)
+		goto err_26m_req;
 
 	/* enable AFE */
-	mt8189_afe_enable_main_clock(afe);
+	ret = mt8189_afe_enable_main_clock(afe);
+	if (ret)
+		goto err_26m_req;
 
 	return 0;
+
+err_26m_req:
+	regmap_update_bits(afe->regmap,
+			   AFE_SPM_CONTROL_REQ, 0x1, 0x0);
+err_regcache_sync:
+	regcache_cache_only(afe->regmap, true);
+err_reg_rw_clk:
+	mt8189_afe_disable_reg_rw_clk(afe);
+
+	return ret;
 }
 
 static int mt8189_afe_component_probe(struct snd_soc_component *component)
-- 
2.43.0

