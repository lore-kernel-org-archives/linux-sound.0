Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A90409280
	for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 06:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790662366; cv=none; b=pwxm/rNhw1de/JOBEa4exaBPAr6hqo/UyxCEuM+mjSlpeIE8IZ65W4tLvpwq/ymSuTe6kkDHLK1MIXQcl8K91A408mQ5KSJBhBVZx4awZ2azb8JogPSM+lshkFhrJR2D+d7NtlRvWjplUIDesnSSzEKHY2txnuNMBLO2NVUu6qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790662366; c=relaxed/simple;
	bh=ZmEU5EahOMV7kuRmbSaLsRIhMqxYvik8hg0QSwyhru4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JD1vr4bSA024P+EVVw7M7alT/CMMuDXyTYePB8RNKLFaIjOLRRIeEAT2uOBMwWBMaBghG6o13l1w+ARQIa4Kd6uzY2RpAQRgtn+E4GqF21Ze9P5J3dsT0zdKKZ1Y3nIvfK9Pc4HZRCkq8dirMdnZkYTaOKTtKpLrjKANWkv3mBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k5k2ncRP; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k5k2ncRP"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a494638445so513366a91.1
        for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 23:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790662364; x=1791267164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3W1Z4z2ziqkLTLfdGWsmv+b1vbrImgZWrkJME4neunc=;
        b=k5k2ncRPRbsJdAD5t/bEJiL5HVX6M3UNt8Kb5zXGXqT5eZsHHEKHil7RmaEvhIU7VH
         nkFeLRi6A3k/XG8s78l4jg/0UWC7YQMQMog7ALYxj2rPgPXzfM2x570pjV7/zM9XcoHY
         cVKbvWuV4aAb0lKzjsarjPz3Qb42FB1AA1849GaJrOwPMy6tcVD+DrMaxr7X/CJXGU2q
         4jOqFWfuEOOthHTf/XpUsIoWdxT+iPt+Hjx3PWot1MIeXly8AAn9CX1S65YQQj0eEuKv
         Ei8c8+eZixETRVyeo4SE1YwaEzpJtCFXQmrc2AjgtAF4VN9ynKO0tG98s3uH6Vh10kdi
         bJNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790662364; x=1791267164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3W1Z4z2ziqkLTLfdGWsmv+b1vbrImgZWrkJME4neunc=;
        b=ibCNURGg7wNnAssWIyLrdRdQWmIN7JfwS6Awzr/JMnIb4CzKBmNyO86bbht4pH1TCM
         gjgPDjmTX9GmKwA4sYqci9TKSNWmG7LSc1vIPZMmAajHuT9tC4hd9mQgZa+Caydd2jtx
         vZkUSpeVav8hGkyTKJVZhkEuG7xa25bts/KhIIVs650Dw4e18DVFZsWQl3hlnUYqNmfm
         a8GQEd1Bxkw5XTzJ12Nh+8S2yd8uV7IW+zdNJVSeKcpiHVtK5EOzDd3UD3/k2dXz5JCS
         DmDAvooxVFF1i4TCVZ48i4HPKY+MrIPsD/LshfJ92vHwvR0yKHUqwCKCQzFSuTHSgTAi
         HMlg==
X-Forwarded-Encrypted: i=1; AKwUvByS0utRX/+NN9xthihFGBQj3zBMmjyowh2PyJbAtK6BMUDDtv9KJu0jh2lA/n6BWbu1OpdpeXQ2GnGlLw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKweO/G/tVa9sT11Qaz+dJ9p6tV5OiddvRaGbJj3DMWDpY8cpFw
	AmDviNJQf6hzT0Dt2xyo33DLPGFVZ829BojCTK99eg3Freyfzt0KnJvL
X-Gm-Gg: AYBFou3ntLn9M3DRF3Cy2d4shOaM1luVWFewS7X+sioKfdJqGh5INhAPvKfcVRLF+oO
	yyPv5pIXDsfbgioGCtF0HdZugN9yh3CUzI+NVu+j2mZFYKzEl0vnlKJDfwxOZgIqaDn0QloADLt
	dbND629IUFTxaMDxtGp7+URAYNEtYv4AVrYihpRH1JtyR7kkQNvFRNFsTX15meWvPk0iNRPVo1/
	ZSyKjL8fzYjr2mX3OUl77bOzSpcPTy8gvAUm25kO/YdmlA5lI/VZ+8u5ObYdnaYLObuASy4N8Le
	xZqgvX141kgFHL0VY8/mFLJk98lH/px+9pLz8JU2X+CVXaHacd8vDR/CO10O8z8yE97wBc7Q3m6
	bi4y8/ntgcQefYXQzL9peTx+RvxRICj7qo5TsftXxfndAPW0tSfhkwHNh+NFY7RiyLQuNOEPju+
	zwfo7ewVoL+TmZPBA71zVp3Xba18Jddu1x6pjGjZ6/ID/khX7wIAyjR8B6M107BcMT9pxAgKR+J
	G1p1T6phLSuiPTLvBg2obH2P7GRa5sNQ4HawWv7C9oeigC+5aEL01x7DEE4X3AGnfsq6G8ECzEK
	G+cb0XXFjqXx/wRPRHi/BraM
X-Received: by 2002:a17:90b:3908:b0:3a0:c20b:2fdf with SMTP id 98e67ed59e1d1-3a0c20b3132mr7441393a91.17.1790662363889;
        Mon, 28 Sep 2026 23:12:43 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498726d63sm3280965a91.17.2026.09.28.23.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:12:43 -0700 (PDT)
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
Subject: [PATCH 10/10] ASoC: mediatek: mt8196: propagate TDM clock errors
Date: Tue, 29 Sep 2026 13:11:21 +0700
Message-ID: <20260929061121.124001-11-phucduc.bui@gmail.com>
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

Propagate errors from BCK and MCK clock operations in the DAPM event
callbacks instead of always returning success.

Fixes: ede4d841111a ("ASoC: mediatek: mt8196: support TDM in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8196/mt8196-dai-tdm.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-dai-tdm.c b/sound/soc/mediatek/mt8196/mt8196-dai-tdm.c
index b7aeee939d88..44bd08f5c1fb 100644
--- a/sound/soc/mediatek/mt8196/mt8196-dai-tdm.c
+++ b/sound/soc/mediatek/mt8196/mt8196-dai-tdm.c
@@ -256,22 +256,24 @@ static int mtk_tdm_bck_en_event(struct snd_soc_dapm_widget *w,
 	struct mt8196_afe_private *afe_priv = afe->platform_priv;
 	int dai_id = get_tdm_id_by_name(w->name);
 	struct mtk_afe_tdm_priv *tdm_priv = afe_priv->dai_priv[dai_id];
+	int ret;
 
 	dev_dbg(cmpnt->dev, "name %s, event 0x%x, dai_id %d\n",
 		w->name, event, dai_id);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8196_mck_enable(afe, tdm_priv->bck_id, tdm_priv->bck_rate);
+		ret = mt8196_mck_enable(afe, tdm_priv->bck_id, tdm_priv->bck_rate);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
-		mt8196_mck_disable(afe, tdm_priv->bck_id);
+		ret = mt8196_mck_disable(afe, tdm_priv->bck_id);
 		break;
 	default:
+		ret = 0;
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int mtk_tdm_mck_en_event(struct snd_soc_dapm_widget *w,
@@ -283,23 +285,25 @@ static int mtk_tdm_mck_en_event(struct snd_soc_dapm_widget *w,
 	struct mt8196_afe_private *afe_priv = afe->platform_priv;
 	int dai_id = get_tdm_id_by_name(w->name);
 	struct mtk_afe_tdm_priv *tdm_priv = afe_priv->dai_priv[dai_id];
+	int ret;
 
 	dev_dbg(cmpnt->dev, "name %s, event 0x%x, dai_id %d\n",
 		w->name, event, dai_id);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8196_mck_enable(afe, tdm_priv->mclk_id, tdm_priv->mclk_rate);
+		ret = mt8196_mck_enable(afe, tdm_priv->mclk_id, tdm_priv->mclk_rate);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		tdm_priv->mclk_rate = 0;
-		mt8196_mck_disable(afe, tdm_priv->mclk_id);
+		ret = mt8196_mck_disable(afe, tdm_priv->mclk_id);
 		break;
 	default:
+		ret = 0;
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static const struct snd_soc_dapm_widget mtk_dai_tdm_widgets[] = {
-- 
2.43.0

