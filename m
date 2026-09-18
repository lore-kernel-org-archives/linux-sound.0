Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D1D51599F
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 13:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738852; cv=none; b=jBD86voG9U8i3qqMq9uSaoyqYJUQ9KF90x69p01h6sIh9LvvvipwWRUkdckUZzUTnX/eQbwVYMUw0LArkiQN9pBsY4YBM7/8co0oGKCG0FGQMe/uZGV7JJjAszCBlink5rgPTJgDeXrXhp4prw2KY6WbWrTcddOH18xch8UGHDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738852; c=relaxed/simple;
	bh=irQHW0C4GyDEHDwrxx67A3iFMFX666gydmDN+38lJvc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RzHB25/3u2JURyui1p+KoQdo0ja2Ua4jz9mWctj26uWuK4qXLm9ooTK1/sd/B9tl6pP7AScOlUlTKvmaSlJh3lm0T0PfzY3eQtH+d+ze4Qa1fyPYl0OJxxEk4nY5G93uFp6XZETsufNXjjuIwOmV0LrxsekZAN3biIwPPAjzF50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jar6CboQ; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jar6CboQ"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccd5cf03so743882a91.1
        for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 06:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738850; x=1790343650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=84KmttxwxJZo38Fsi4kV8h//UiHGZgZirQkHOuGC9Ho=;
        b=jar6CboQzXpkHfcMO37J0dtKTMakL/wbIWhqLOo0iah53Xzp6OrBT1bdcUiB1IakC+
         QLIn4CECdOrnTlhkm3l2ocnw9yrqh2eAZlGUPSK+JJELCAHIbh+n0RHuDU+vHUU+ILlN
         5Tsvew/LbYpLfZIpZDD38cYFoUx1ps4NbC/hpf8bN2yIQybZROm7PoVgUIs8T805D0SG
         VKeBw9zZZruDyq5Zi9Vhr5v5B6yPMA/rBFzuDWVuJIUV3uwD6vZf+iOPxgJ3uKEh5GRI
         apVbDbLdZYtsipI6zC/NL+XOeVrFLuYUProEneSHhOx/8BQkSkhhpFVELw/5e3TcGp06
         YcMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738850; x=1790343650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=84KmttxwxJZo38Fsi4kV8h//UiHGZgZirQkHOuGC9Ho=;
        b=QfP/HUsTol+nKZsFXIdQMHL4TDaRpov2P59s+jtxfEHsgTZYkvLFCurwoR6JYwASv/
         +4i9ef0aAEv2451FkArODw+sETNqpstvmRuqPGt5wl0lzKfoiBbpYBDDvlotDBJgHJvO
         mKsLhnX/HnKnjZwZMk+diaK9LjyMipjI8k70FWL+6SEFhThbpCCOjZo+dcYLzX+zJKgK
         lngfGsy2IN3ezhATOCkge9WoEmCoEpX+rVUYG22tUHGeM93KTPdLW0z5K9HS2MjuNK3m
         4geO9Q6Gq+WJ8v2Q4FQ/eMNcH1Yv2OwGl8vIU6TkXSomIu8fqOGcHUGyYXgIte9Kluo8
         7bEA==
X-Forwarded-Encrypted: i=1; AKwUvBy3L6vTR3EXKAFvZmDQzeVYMirIZlcChrW5BicB8V7rDKQdaMKtvrfO+BtOPtP526yT6vp++y32NCFWLg==@vger.kernel.org
X-Gm-Message-State: AFuF++ncdixzFwIH/9iLkrAFxSBG1LMfbl1wy4NtI10bx1ERbjlUnH3L
	glhpXAAksE/bP5tK39dcVDbj3hpcYIyniS02Gv50GNOlbKjTUFF3D0prOuitMA==
X-Gm-Gg: AYBFou2zGvkarrxy/RaAK15SC+KShbVZobLYreYURHzRmwwwI6YthQ+k7oGplU36INK
	TWVlPQLGnB7kQ7TWzz4aL+NMlZuAQLSzRvqk/kywMDFZWEmEN9EqGEkYPWox4SHWTqWnceV7xL3
	7XdBU8dtaL/ckJR8ptzpOYdajOFuGu08sRqeiyQcgA6ZB6p4CnXVudxVUeIobkbQSnnbDQYzHR7
	Xk2jDQ38P6sfLchWPigP3edGdu54v1gfgz2LiOzCLcpgTxvdTW9IM2fx1Vf2sgBaLsVjV/JnXTj
	UffIB25dFD5I5s5UpIn6/slzGc/G+XqYmKRS9EOODDqC0XxajxrbYcv8Iipkrot6MF85ULRqbL8
	SPsFGSWXTyjnNg2GKyPtJpEoxQsDrtDw/5fshirK31c7TB5gHAOPUIs5jQjfQoc414hAes1lOX8
	AqrD7+yFPyogm2mkBulqOK3scbD7SxEITjTkcQQ+wilEwYu2f5WaATPNINXWyhwfPEgm14IuvJY
	7brHqkK9GOPOiemHeQHlUtztYbgsZn1FfPVCOKBgE/ahCs7S29v+YMP8AgUzJsHmope5xd1pthd
	B7ow9decFK+6NAbk5o/AsC5j
X-Received: by 2002:a17:90b:17c1:b0:398:e86b:ce14 with SMTP id 98e67ed59e1d1-39e54e3f526mr5588018a91.20.1789738849715;
        Fri, 18 Sep 2026 06:40:49 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:40:49 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 14/15] ASoC: mediatek: mt8192: Propagate errors in I2S DAI DAPM event handlers
Date: Fri, 18 Sep 2026 20:39:10 +0700
Message-ID: <20260918133912.133799-15-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918133912.133799-1-phucduc.bui@gmail.com>
References: <20260918133912.133799-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Currently, DAPM event handlers in mt8192-dai-i2s.c ignore return values
from mt8192_afe_gpio_request(), mt8192_apll1_enable(),
mt8192_apll2_enable(), and mt8192_mck_enable(). If GPIO configuration or
clock setup fails during DAPM events, the error is silently ignored.

Fix this by checking and propagating error codes properly in all I2S DAI
DAPM event handlers.

Fixes: 2c37b4ed730b ("ASoC: mediatek: mt8192: support i2s in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-dai-i2s.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c b/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c
index 1632fc94776d..5608b534af0d 100644
--- a/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c
+++ b/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c
@@ -586,6 +586,7 @@ static int mtk_i2s_en_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mtk_afe_i2s_priv *i2s_priv;
+	int ret;
 
 	i2s_priv = get_i2s_priv_by_name(afe, w->name);
 
@@ -599,16 +600,17 @@ static int mtk_i2s_en_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8192_afe_gpio_request(afe->dev, true, i2s_priv->id, 0);
+		ret = mt8192_afe_gpio_request(afe->dev, true, i2s_priv->id, 0);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
-		mt8192_afe_gpio_request(afe->dev, false, i2s_priv->id, 0);
+		ret = mt8192_afe_gpio_request(afe->dev, false, i2s_priv->id, 0);
 		break;
 	default:
+		ret = 0;
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int mtk_apll_event(struct snd_soc_dapm_widget *w,
@@ -617,6 +619,7 @@ static int mtk_apll_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	int ret;
 
 	dev_dbg(cmpnt->dev, "%s(), name %s, event 0x%x\n",
 		__func__, w->name, event);
@@ -624,9 +627,11 @@ static int mtk_apll_event(struct snd_soc_dapm_widget *w,
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		if (snd_soc_dapm_widget_name_cmp(w, APLL1_W_NAME) == 0)
-			mt8192_apll1_enable(afe);
+			ret = mt8192_apll1_enable(afe);
 		else
-			mt8192_apll2_enable(afe);
+			ret = mt8192_apll2_enable(afe);
+		if (ret)
+			return ret;
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		if (snd_soc_dapm_widget_name_cmp(w, APLL1_W_NAME) == 0)
@@ -704,6 +709,7 @@ static int mtk_mclk_en_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mtk_afe_i2s_priv *i2s_priv;
+	int ret;
 
 	dev_dbg(cmpnt->dev, "%s(), name %s, event 0x%x\n",
 		__func__, w->name, event);
@@ -716,7 +722,9 @@ static int mtk_mclk_en_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8192_mck_enable(afe, i2s_priv->mclk_id, i2s_priv->mclk_rate);
+		ret = mt8192_mck_enable(afe, i2s_priv->mclk_id, i2s_priv->mclk_rate);
+		if (ret)
+			return ret;
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		i2s_priv->mclk_rate = 0;
-- 
2.43.0

