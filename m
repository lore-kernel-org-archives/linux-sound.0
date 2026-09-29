Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CB841A91B
	for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 06:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790662361; cv=none; b=K4r0O9UxZVlE7UW15gR2axvcVNm0Dvs1JIyZS1fohoUOmIs5yzlskAOuly/fZl3zRvMmzG+6S4C8NJjueKTMGLAQcoQFWhQJbb5XGU/XizT0QhbWpgzmUP3R91dcwTlcqOCQS0XeLdjcqdea4EmWN7dQiHqPz6q2iuSnq4obXHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790662361; c=relaxed/simple;
	bh=aSG/mO+jjXy45DeBDmnxfrUgXQ0xO63nqGm5LAkitdI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dVq1rxXE0lmRUpAtl7S/irj1nKMqh6336WvnoBojSL9RVl6KwVcC1Hx04/VEVOoVPQO0GIBzCZnnhFWSPuuTRAdZ4OfcHErO/1IfpOh6o8AGwcdNh4qq5RhtOCNohQKT+brBFWTXspGoztbVb1/wTviNxwkUR0uusRfkfWqFfsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p99eujxE; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p99eujxE"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccd66bb4so1661165a91.1
        for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 23:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790662359; x=1791267159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k60ENxxvKqkmqFX3C6HWvuRoh61RAwKi/dliyQ5+2AI=;
        b=p99eujxEUtjukjm+1wHMbyE7M/ObGIXDRWiXEBvkf6hhTxNC1MGsAj4wA+tApB7yW6
         7KjPGrnh0OKyVudCzIZ5oB1FyOOcrL5e9JPcfBlFmWJPqptoA9RoJov1oNmBSglsJqDC
         M5yC5UwUH/NMrcPZOwH02eCxO7tp375bnzfb8zKI974wzTJ6Ifh4jT3KPp7k7lTmz4vp
         TzCBjU2G+vAexqgjsgHTDiPQYpW39fSmX05pNFU+pcShliBb6dYY456w1r1HO6fm7QhI
         v5pgnarJy5kKJhSY1cBuB5/x5oyoKJqxteUt20UX3EXb1/Sgi43eJDgInfC5/bb8/OO9
         Rj6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790662359; x=1791267159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k60ENxxvKqkmqFX3C6HWvuRoh61RAwKi/dliyQ5+2AI=;
        b=pNNeyZHfcMpfXBlFIUwOya0LoaKZWKDVBqiY579N+2EJnl+pg+FOuQ4NpkbmQzOomn
         XPjGnvGCMO/vbUXy+alVZ5+h858YCXRYuUQ2Fh/VBboQ0bWAHiHX2ZVWeknWWdlq9UGD
         Z1ncftT73ScDtdA6d06Qc15XAAumisZcvVVV4Qzjv9+LVvVt2+LG1+CFYorZrenxROak
         Jel+c/sX6P+NJlNhJq8vGDObHt6bF6sOWlh/tr/vcdhkKIMHxsKu89loFLV1qNz98UB+
         JjNhIFUpiRwmoaMBp4HnXN4YdaHOY8Qu019yJrPicBPdY40pt3V4CGUsli3F0HWl+nBd
         W7/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxTsHJT4xhTd2OiI6+hN1fys+aLnneWbTAEgCk8bKzq7LiNts8v/5gzvUZn4M8J4/DTff29zMvnHQSAgA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIxg6efocv+xrzrMVxbMtSRi+LlH0elvj4HzgdRrOmyfr0sj8G5
	75J00wUjEWPr5QxZ8ow2aIPOR16/PBH/1MGD/MhI0aTYARrwqPz9wsi/
X-Gm-Gg: AYBFou1eb9OT7qjrdS3Ffw3xm9hg5WOEbUwZbuaWljqD1831eyk4cS59aRTOYT8o5Za
	KpK5+yQc1WLtENZC1VYKju2boQsljzALhfDtGfej8rDPlqOC0gtsNxk44155JyZNtYUvsv4Mfvt
	Xe5MZWcGKLZ5FGCl6dOIGUlP1wB6iy42UiaSU3IMKOuv1HzczJZyfSAug52vK+VCUyCAlP3Bfvy
	M9f6Kv/DtD6f2xi3dkERNaoC6GGhzr7b2e1sotRUIDp58orKS5PFQOMluf9RifHMII/5wOjM3rL
	HtxFB+V7c74dPQo8Q5aNltsS7obY4z55LmzdERoPFFggy346RPy3NhZ7Ke/emmdbgjzGmeOZt18
	wq9hGZ++8WKuBFTX+dRePJjwAioIm/UwxjsWlQXeoxn/WjVUAXqytcW//KMFdaQRFPrl2uSf3Jx
	NhGLxXQv8rhos7keFofjsNljaP+rH7biAQmj2ZjWbRhNVaUf/4fMqJUPpWPIFdzVC7Dy0xKHhfv
	FS7kwXkXMzUdc3//2+/8q0w2VMa22KY2ozcsUqfegZV1TagtugRjAyL9U5nXu+UhvyWDEB/yqBe
	mGA59+WeV9oBRw==
X-Received: by 2002:a17:90b:2b45:b0:3a0:8a03:2a2d with SMTP id 98e67ed59e1d1-3a098d35687mr13123807a91.29.1790662359209;
        Mon, 28 Sep 2026 23:12:39 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498726d63sm3280965a91.17.2026.09.28.23.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:12:38 -0700 (PDT)
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
Subject: [PATCH 09/10] ASoC: mediatek: mt8196: propagate I2S clock errors
Date: Tue, 29 Sep 2026 13:11:20 +0700
Message-ID: <20260929061121.124001-10-phucduc.bui@gmail.com>
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

Propagate errors from APLL and MCK clock operations in the DAPM event
callbacks instead of always returning success.

Fixes: 65a195132669 ("ASoC: mediatek: mt8196: support I2S in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8196/mt8196-dai-i2s.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-dai-i2s.c b/sound/soc/mediatek/mt8196/mt8196-dai-i2s.c
index ef5cde0ba829..adebf75629be 100644
--- a/sound/soc/mediatek/mt8196/mt8196-dai-i2s.c
+++ b/sound/soc/mediatek/mt8196/mt8196-dai-i2s.c
@@ -985,27 +985,30 @@ static int mtk_apll_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	int ret;
 
 	dev_dbg(cmpnt->dev, "name %s, event 0x%x\n", w->name, event);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		if (strcmp(w->name, APLL1_W_NAME) == 0)
-			mt8196_apll1_enable(afe);
+			ret = mt8196_apll1_enable(afe);
 		else
-			mt8196_apll2_enable(afe);
+			ret = mt8196_apll2_enable(afe);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		if (strcmp(w->name, APLL1_W_NAME) == 0)
 			mt8196_apll1_disable(afe);
 		else
 			mt8196_apll2_disable(afe);
+		ret = 0;
 		break;
 	default:
+		ret = 0;
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int mtk_mclk_en_event(struct snd_soc_dapm_widget *w,
@@ -1015,6 +1018,7 @@ static int mtk_mclk_en_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mtk_afe_i2s_priv *i2s_priv;
+	int ret;
 
 	dev_dbg(cmpnt->dev, "name %s, event 0x%x\n", w->name, event);
 
@@ -1025,17 +1029,18 @@ static int mtk_mclk_en_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8196_mck_enable(afe, i2s_priv->mclk_id, i2s_priv->mclk_rate);
+		ret = mt8196_mck_enable(afe, i2s_priv->mclk_id, i2s_priv->mclk_rate);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		i2s_priv->mclk_rate = 0;
-		mt8196_mck_disable(afe, i2s_priv->mclk_id);
+		ret = mt8196_mck_disable(afe, i2s_priv->mclk_id);
 		break;
 	default:
+		ret = 0;
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static const struct snd_soc_dapm_widget mtk_dai_i2s_widgets[] = {
-- 
2.43.0

