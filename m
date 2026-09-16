Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EC73BD643
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 05:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789534889; cv=none; b=PYRzbxV6wgZe4SoYuLTnW+yBi27leKq3hH1G7NPu0rxQTviVJv1g4wlar1BkbOcHBRhkqIdjBglMvtS/q1ZnFCgxnEcqo95oFKMAjPDYB5QMYqZRVqTsdKtOMetiHZ+8Ddo7UmQp9Q0LYxbWRVJKrpeZo51BsKs5qCcz2MVWO9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789534889; c=relaxed/simple;
	bh=xKR92clgBSMOu24lioWfDgbWesVkWCGN0SMJs27HPlI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T5mnp/Uh9DAwkwiBQY+XHyUr4dv6h2bpxbyVeAY6ZJCOLufpulfhtg96dob3Ky/s1cxPFDS8HZUYdEdqB4mMhpaGSFZC12i6Tnh7T9YvrQl/8qy9/Yj5vUS8P75AK1Sje6IsEZY8Du5+/Anx7Cg5OhhysHyeyuW0nslO19Nzmr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nfS/SX8n; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nfS/SX8n"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c0776592e3so317133b6e.1
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 22:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789534886; x=1790139686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D9B0Lnz9uNh2cM8wk4dYkQqiHmEJincpWAn3l27K96A=;
        b=nfS/SX8nxJqYuO/aCKiXSZTXbwWD7qAulqcfsRwbsJ2hq0tuJEwsf0ro6T3/l56jL7
         Y3ZxHoL9ajAxwdLxMVaoWwZLHz+lN3AhPKXmlMhjPIXJfmDaxNsEZlfd26j5+DuxSWFb
         D7iao+4GWOlGal+H16OmzykUEuFLuobx20DK+CvCvbPYwnSktd7h97600mLVe4GnJSEc
         jpM4VmpPKGagJMFpXtLsuWCjnKNNOBrxsLbofczPrwMeuLwn0dB6P1R795FAw8RBzOai
         ZahjKtg+TYK9NvtfRrUo0a7xy1kLBGyiqxIX2NKACphhw9/SBxQSQbCNcD1oiQAQFJ+3
         nV8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789534886; x=1790139686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D9B0Lnz9uNh2cM8wk4dYkQqiHmEJincpWAn3l27K96A=;
        b=0HJO5fbbD9y4uWfNjtwYTfKD3kzABZqdUwlWJTiSvKgl8SH+jp9ti4ldVW5pVu9raX
         pB4Mn8QxXzWgZU87Cck+tI0YW7QQ0eALcYykPqIbNkgrF/+85GNrsMUmf9Vg/OIlITJV
         fxDkbxajWGoLyyW3Nca6uITNIYs9/wMekFPS71TgXtGPfVhfdX+HZkApYuED1zz34gLp
         FYhhhOgcSHPpdy8jPIIM7/uwRAlPogFV7gFPMnALp2jHhiPzSKsLrtqm7TbSKPbbMYjw
         krzSs6EjmrviykgLxi3EqCivrPV8LtVXBwqE05eGiVJPqvHHOp95L6dP2r9AVEfkflIL
         Z94g==
X-Forwarded-Encrypted: i=1; AKwUvBwRbPc8d4lQOr0VD76J6OsewAesSO2OpQciNjaoBiROhIswI4eJfhyBI2UF1ZRUU3MEZtAUceiAAlMsFg==@vger.kernel.org
X-Gm-Message-State: AFuF++mSpXKy3cpQW48+2vX6LoyMQmvkON8ksIxOXiQmlyDMPyO9NGXb
	NWkGqPDN+bqNYc8ylZ5mZXr8VS4TjfSxu5PyU4u7TxZTz4cOGr5DVFPS
X-Gm-Gg: AYBFou0244+BN4Uc8c3xOVlOlVP03m/KAY8l+bJ5mU4f8gs1FFdaCaHx5qUDVy7f9rI
	FsXuHdGz2JtYeitcGycuPGRGdvQ0KE4/an3LpLvcPXFPG6knGpd5ZHA5wFzRyGP1Pvm+Ll4MhC2
	NdY+cgNe4CxxYPBLBgFcF3s8veqmQH4M16h6CpwsFD8I7ps0hSi0JcQu8hceYdbGyi9yILbgTjg
	sKpBWI5E4+tQpzqKO2WccADcgcDmxUrDVGrGKvIGfhkv1eTezkGlvO5+GE/wLEgT9+1XTKnHPf1
	bNrWWZ6PdQjakWN5dNzAPKWgmXyTbSinQqrR6FiklQMJprQWaiiPCZr7nzEE6agPlvsZ0flERPG
	SYog4Zun+NLepsJN433otPOnVO5B4RdJTRojKK6LbJe5NRaV5plPuNa9m6IWUdot6B5kerLTqJV
	OBGUVk70Ct50UgkIyntlQS9eMoCr3Ustyd04B9r4OsQHPhTC1XBRhNaPc7lgeSkSaXrJ5F/Bh9q
	XlYsNaEz9B/Be/XNio+YUcPNmEcBjrK3SFiY/8F1ejkgQibdC/w2Ek0ZrsnR3xoQmgnUNtoimu5
	Y3kol6RCkbaVw1I=
X-Received: by 2002:a05:6808:23ca:b0:4c3:e608:ade7 with SMTP id 5614622812f47-4ca49dd720fmr1842524b6e.11.1789534885682;
        Tue, 15 Sep 2026 22:01:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb1776sm850589a12.27.2026.09.15.22.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:01:25 -0700 (PDT)
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
Subject: [PATCH v3 09/12] ASoC: mediatek: mt8189: Propagate MCLK errors
Date: Wed, 16 Sep 2026 12:00:16 +0700
Message-ID: <20260916050020.14575-10-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916050020.14575-1-phucduc.bui@gmail.com>
References: <20260916050020.14575-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

mtk_mclk_en_event() currently ignores errors returned by the MCK
enable and disable functions.

Propagate these errors.

Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Add Angelo's Reviewed-by tag.
 - Do not pre-initialize ret; set ret = 0 in the default case.

 sound/soc/mediatek/mt8189/mt8189-dai-i2s.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
index 4826ee250d70..8cd5ddf62d46 100644
--- a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
+++ b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
@@ -519,6 +519,7 @@ static int mtk_mclk_en_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mtk_afe_i2s_priv *i2s_priv;
+	int ret;
 
 	dev_dbg(cmpnt->dev, "%s(), name %s, event 0x%x\n",
 		__func__, w->name, event);
@@ -529,17 +530,18 @@ static int mtk_mclk_en_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8189_mck_enable(afe, i2s_priv->mclk_id, i2s_priv->mclk_rate);
+		ret = mt8189_mck_enable(afe, i2s_priv->mclk_id, i2s_priv->mclk_rate);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		i2s_priv->mclk_rate = 0;
-		mt8189_mck_disable(afe, i2s_priv->mclk_id);
+		ret = mt8189_mck_disable(afe, i2s_priv->mclk_id);
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

