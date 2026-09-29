Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0433C2BB0
	for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 06:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790662327; cv=none; b=YJf7CIa7YR3uTjIK1SY9Qf6STEs7AQ6Z8CgsY/g+sNE9xpCOUKJK2n7mYVaOuVWKtyyXkCuVP7G7+JT9T52Wuqn0NzeXI1dMsWcQAf5C86BxljR/791tbOGWPiWbNHN72SOKS7OQbdm8F7NDvr0biJHPcJMgbEdj46DwqANlOXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790662327; c=relaxed/simple;
	bh=KCSgSXh19X+hOXoATJgfVeEzUlNqDSgVlI1L4EZAYvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n1RvkfLWiyUwMT6eIlqNaeehjyLGGEKe6Oq0Gm2/Rudu7zuofs+geMAG56hrcSUOsWx2amNOgYCadLl5IkHkE38qINaDgyca16Ns3t7lJOS5BENhItz5neOoXWRTmOHIgnr6zx9cg+Oc1BXXJKimwnVtfNosvJTK6mAT7Z+MFqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HSUXyhUl; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HSUXyhUl"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a0f64df6a6so1158817a91.3
        for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 23:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790662326; x=1791267126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vj13ChAHd3bCWGU6cXQ2y/gw1Mtr1ISY+VXDwMotkXI=;
        b=HSUXyhUlyJ2YJu7W9MxUundWKz/Wqsln4GHxu/x1E7hdqRegfrPTG8wsbW/A+rlzuR
         dpPWLlH3wqd3HLQOuhpDPxeH/jqXsgpLiAPJPwLk9oDw7El503fByHCqQf0bw8PkgGpg
         8/SnnM/ODs7yfoWwCBqxM8bmHZ9/R6DG3pPo+EtpVi5viH1LkHgJZmCahEDXEmOlEgzP
         5wBcxk8fOplUYQrUaTqwgZLh3C5HOoBv2XW2qq7taCCEIyMtoutEL51stbeiyQs6Nzln
         Wm/lZhd1a+amULJtPTkCInAy9R+q4Nupevh5P2d97ijIHHVIX3hpsn5LzRBarJ54vnkL
         3MsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790662326; x=1791267126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vj13ChAHd3bCWGU6cXQ2y/gw1Mtr1ISY+VXDwMotkXI=;
        b=YxXa9sC/kK84tRvRZykd/PYIvNsSrM/oI3rkMEGq1Eg/WbInMu1+/TFMkqv22rNTcx
         JGdKIBakomnG2daqDzDnTc6yiHWkbM/T7c8D8cE0U/O7/JqIoAneCBUQsAjVkLaQZUtT
         uBqmDbUjy0eBia5qXOj8Gt6hOfuf+B7D24NFNewNO5G3UPKrfLL0OoWK1Bay2OdquBny
         +G9Gb2lHcdhzZioIfBBQnVL6bOQJfXyPvcY5LnrhjiC8Ce3YBs8lfK76qvvizXxBjCzT
         1riryJkorg2V3nqwdq1gmr7bP51ssyPD+yMT7bk9jx7Bbx2KyY0DMcsmQJZwDyhEmZ7Q
         y8QA==
X-Forwarded-Encrypted: i=1; AKwUvBxhkh/cH9h11liYg1IG34IAa4zEi1vKW4iooZquU3Oiyd8Tnl1Ok+wGYh5BtVasMQYQZm+dl0FUq0SrDg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7GojSYVs1XvGGJKWf2GFhejZgqZvUFKQWJKLNAYd8KnkH9UC9
	O3CoKoqSvSS+HkYVvisQIIItNvYX7XppR0kEM11BTpW5GNqe/k6oVYHd
X-Gm-Gg: AYBFou1y/eko8cjqL3on/nzDWT0+xi4ojZTt31hVIPTWWAds2MC6L4KEWWbtf04anqn
	uq3/pffNi3Gnoj1bh8KnWdKL1czRT7GXQxO9m4k20cVYkRm6vp5OIVbVYsjfcT2xHpH6vnQ4jzN
	kKG/6olFIPaqG2ee65u/zL4uB8VVTStgpS+D0Vxw1CjDt6lCF/HaqNhFcEn556Uuu152gABFHL5
	R+kd9UY0o5chOgxJgTqZgc6nQ90cRtAImaOk/Wv09H80BWBap6h8by70Q3tBwgHz/qGvVTGp1cp
	7q45fJ1V34ur6duum3FZ4kGoKUB2lqGjwKMFdypFKmZUilhj2RYhsB4vES6IZZZL57gWTEHzV0b
	ldrDWxCzE34+sUsusi6RAV6ndR30lHaF5loeah6+zO4wmDXooaO8nsB3l4QpAqFKZPuF2qkJrwT
	DNWQlzDNFrxXKOtMn04jMThKKcHRxQ4D+eVfDVxCWFnYv+Drb6+go+8IrRtzxB5r3MJMn0yefxS
	QKwTcGeWuc0UmPMmBCJ8A2udjIgQtKeJYofL2yq5Og/U8kniOUNsBVQk5K8mq9usnU2CuWK0EPC
	JbGlcC/6zw5mZQ==
X-Received: by 2002:a17:90b:548c:b0:39e:6c6a:656c with SMTP id 98e67ed59e1d1-3a0bb63224amr9430503a91.47.1790662325592;
        Mon, 28 Sep 2026 23:12:05 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498726d63sm3280965a91.17.2026.09.28.23.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:12:05 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Darren Ye <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 02/10] ASoC: mediatek: mt8196: fix APLL enable error handling
Date: Tue, 29 Sep 2026 13:11:13 +0700
Message-ID: <20260929061121.124001-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929061121.124001-1-phucduc.bui@gmail.com>
References: <20260929061121.124001-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Propagate errors from the APLL mux and clock enable operations instead of
ignoring them or returning success on failure.

Clean up previously enabled clocks and disable the APLL tuner when a
later clock operation fails, restoring the APLL mux state before
returning the error.

Fixes: 7384ecab34eb ("ASoC: mediatek: mt8196: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8196/mt8196-afe-clk.c | 47 ++++++++++++++++------
 1 file changed, 34 insertions(+), 13 deletions(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
index 91ae44024949..1dc4210e58c7 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
@@ -314,15 +314,17 @@ int mt8196_apll1_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll1_mux_setting(afe, true);
+	ret = apll1_mux_setting(afe, true);
+	if (ret)
+		return ret;
 
 	ret = mt8196_afe_enable_top_cg(afe, MT8196_CG_APLL1_CK);
 	if (ret)
-		goto err_clk_apll1;
+		goto err_disable_mux;
 
 	ret = mt8196_afe_enable_top_cg(afe, MT8196_PDN_APLL_TUNER1);
 	if (ret)
-		goto err_clk_apll1_tuner;
+		goto err_disable_apll1_ck;
 
 	/* sel 44.1kHz:1, apll_div:7, upper bound:3 */
 	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
@@ -336,14 +338,22 @@ int mt8196_apll1_enable(struct mtk_base_afe *afe)
 			   0x1 << FREQ_TUNER_EN_SFT);
 
 	/* audio apll1 on */
-	mt8196_afe_enable_top_cg(afe, MT8196_AUDIO_APLL1_EN_ON);
+	ret = mt8196_afe_enable_top_cg(afe, MT8196_AUDIO_APLL1_EN_ON);
+	if (ret)
+		goto err_disable_tuner;
 
 	return 0;
 
-err_clk_apll1_tuner:
+err_disable_tuner:
+	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
+			   FREQ_TUNER_EN_MASK_SFT,
+			   0x0);
 	mt8196_afe_disable_top_cg(afe, MT8196_PDN_APLL_TUNER1);
-err_clk_apll1:
+err_disable_apll1_ck:
 	mt8196_afe_disable_top_cg(afe, MT8196_CG_APLL1_CK);
+err_disable_mux:
+	apll1_mux_setting(afe, false);
+
 	return ret;
 }
 
@@ -367,15 +377,17 @@ int mt8196_apll2_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll2_mux_setting(afe, true);
+	ret = apll2_mux_setting(afe, true);
+	if (ret)
+		return ret;
 
 	ret = mt8196_afe_enable_top_cg(afe, MT8196_CG_APLL2_CK);
 	if (ret)
-		goto err_clk_apll2;
+		goto err_disable_mux;
 
 	ret = mt8196_afe_enable_top_cg(afe, MT8196_PDN_APLL_TUNER2);
 	if (ret)
-		goto err_clk_apll2_tuner;
+		goto err_disable_apll2_ck;
 
 	/* sel 48kHz: 2, apll_div: 7, upper bound: 3*/
 	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
@@ -389,14 +401,23 @@ int mt8196_apll2_enable(struct mtk_base_afe *afe)
 			   0x1 << FREQ_TUNER_EN_SFT);
 
 	/* audio apll2 on */
-	mt8196_afe_enable_top_cg(afe, MT8196_AUDIO_APLL2_EN_ON);
+	ret = mt8196_afe_enable_top_cg(afe, MT8196_AUDIO_APLL2_EN_ON);
+	if (ret)
+		goto err_disable_tuner2;
+
 	return 0;
 
-err_clk_apll2_tuner:
+err_disable_tuner2:
+	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
+			   FREQ_TUNER_EN_MASK_SFT,
+			   0x0);
 	mt8196_afe_disable_top_cg(afe, MT8196_PDN_APLL_TUNER2);
-err_clk_apll2:
+err_disable_apll2_ck:
 	mt8196_afe_disable_top_cg(afe, MT8196_CG_APLL2_CK);
-	return 0;
+err_disable_mux:
+	apll2_mux_setting(afe, false);
+
+	return ret;
 }
 
 void mt8196_apll2_disable(struct mtk_base_afe *afe)
-- 
2.43.0

