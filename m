Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BDA3E3C68
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 07:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370948; cv=none; b=aUCFwuqXI/sWuQd3lxE8GgMe81J3SBswQ1N7Dl0Jno4ATQqfNGdFu/bpxPAQ8Joi37GI6RfWJ6A5iVWnP4aUuLIPyotwdVHWIAxcIyfJUc95h9mGLygl35+HGPVhPe6FJjNNmWH8DaFH36opZdY1KrY/VHBEjuFwANwx7xaKQtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370948; c=relaxed/simple;
	bh=w3TSv8DyUDLvB/8NFHyYhUD593zzZ6iqidCdBEN1Ojc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HyZ8YrqYF5fWIHzJlxEBH/6ljVSfBEocQ86N0wFx9ImuzaKXFBtf+1K2gVAeTv4aNNJOdNCb6baj2wMM6pblqebH/WZO1YvkCRGyErPugJqoZEqyA8FnZVYsGs5dLfNNllImVWhRrIp5crBjALchHXyjWoAU6xTB+vpeKFC2wrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mzqKtzEo; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mzqKtzEo"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccdaea76so686779a91.0
        for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 00:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370947; x=1789975747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ogPK4CkcC4kib57hvAPxClAgqXSK/aMlcwvCEMuXLo=;
        b=mzqKtzEoeZi8QdM+bQHEUA81EcbSuCyh+30tsMhywznsscfIojwqYRTmT9BN776MVk
         AnZiJKlYZrShU4VARRaZOcS2T7cK6FizsEvrPmOPNb595vM6IrzdD8qe1TzFN0bWe5xM
         KEcddX2gRFmpmKZbPkbSkO7booTds7vjyAya15GN5W3KxDTptDsnsRR6C86Ffe1p+7e6
         JySWNZcqOl4864zGl651QhCkeNYf9ppzdf7INP1nIHiou+Os2RWltul8iE4LbNznNRDF
         Aqyd6gELZH0Ou5j25R23j6dz0k9rp4p7xSDT8Ata27Cf6zib9c8TYa84knnJactJETHv
         0+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370947; x=1789975747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5ogPK4CkcC4kib57hvAPxClAgqXSK/aMlcwvCEMuXLo=;
        b=UdBVxeCAGSkF62AhYj0EIfKVkvq1B6496VJ87VJ57PkmoDza0HnH1p6IKtECKNMAFK
         znutVZ8BnHBLT9Tr4vz1Yrq2l6w1JecrFKLi2sUyB9FTFRu2mxYNllpGAuhzrZX1TXdO
         lxvpAJn0HiVBCADXfzSsaK+9l7FOFoTQnf4YHN3mGSHHda2TqjkMniv+fz84osx4JvBj
         dj+PYzzUoU9KZyHBJJ+t/Lu84oetnCWNHVlq5lVnpnT7KZcgOZDs3hE+XpYjypqSdTnS
         d6weAp94zFKgq2uga3UhlYAv5q17jmSctyXL1Y7rZlvnxmJrgFjHGdNKIz3AzhDa2Mnt
         hh/w==
X-Forwarded-Encrypted: i=1; AKwUvBy6fb6eoEEP7uw3fv1C+f8k4IHmic2EoRxi6ym+eOAo157dQamxytG/8vabb8R+JcdCdrA7OSblUD0vNA==@vger.kernel.org
X-Gm-Message-State: AFuF++ngDldgt1wnYGuNOm9nMnKErk6c0A8FBX5k+Mtx6JXZ9ezq6/RE
	gz2b0ouM5/TygbJDBxENVP1Sc576HuQ+n+pw6D+cDvti8JS/uI+rhCXH
X-Gm-Gg: AYBFou2R0OfgBCDvTfhIRm//NpeObjJ3iYZ7Sf/4rbTYXhUt63P8wkCUYpS6b37Iiim
	YKOBGKaFtKZYThkzyg6JzavEnTxRi+uk2tUFFc2g8+SuRdkioNh8nTIcROwRwdxxjlkSObCD3we
	w+C+ODqldDdnYxxt6Zb7Q5InPi3ypN7x0gbPk00fNKwsSnSx9bXOgoCSAxBI0xd363ZaJnhENWy
	Jdp4rV7nS6bjp0qLjdWQZS7qJDFJ2HSY3GL08RojVkUJNRCOC/xXnzEQLIDuA+vQ77o/7/REy5Z
	3mILzV/ujdxY0or1lsselxHUVKvuYQHH0h9vNiGPTEeOZUvFzllBnjzEfdfM0yk8fCymaahrveM
	aOZhcqxb1dQiiPk9lEDO+ipQOeAj3BhpWIszkdUZyCCL3lmbp+gtiQC5rDK68A+irdMk1hZHLBA
	+OZo56uUDCIUv9Ge809lCaKaxfQcDNjQT7vAlOEfKrsNEG9iSz5iwGKCj8O3sMJGHwI0t3o+G9M
	fQQHeTAgBkT/vdCxsaJTQvh/w1wBU4Nzpk9q3td9S6YkivVl0hjC33QwxrPt32ThU2Uz5/ZtxWw
	MYfkaZkR5nEW+8+8
X-Received: by 2002:a17:90b:1a8d:b0:390:84db:888e with SMTP id 98e67ed59e1d1-39dec3d0ddbmr1584578a91.7.1789370946743;
        Mon, 14 Sep 2026 00:29:06 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d957131f9sm19598245a91.12.2026.09.14.00.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:29:06 -0700 (PDT)
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
Subject: [PATCH v2 02/13] ASoC: mediatek: mt8189: Propagate APLL enable errors
Date: Mon, 14 Sep 2026 14:28:31 +0700
Message-ID: <20260914072842.24420-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914072842.24420-1-phucduc.bui@gmail.com>
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

mt8189_apll1_enable() and mt8189_apll2_enable() currently ignore
errors from regmap_update_bits() and do not clean up resources when
clock enable operations fail.

Propagate these errors and roll back the clocks and tuner state on
errors.

Fixes: dc637ffeed6c ("ASoC: mediatek: mt8189: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Update the names of the goto labels.

 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 78 ++++++++++++++++------
 1 file changed, 56 insertions(+), 22 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index 63e03a40dbbe..aaf4f7921363 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -454,30 +454,47 @@ int mt8189_apll1_enable(struct mtk_base_afe *afe)
 
 	ret = mt8189_afe_enable_top_cg(afe, MT8189_CG_APLL1_CK);
 	if (ret)
-		return ret;
+		goto err_clear_mux_setting;
 
 	ret = mt8189_afe_enable_top_cg(afe, MT8189_PDN_APLL_TUNER1);
 	if (ret)
-		return ret;
+		goto err_disable_apll1_ck;
 
 	/* sel 44.1kHz:1, apll_div:7, upper bound:3 */
-	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
-			   XTAL_EN_128FS_SEL_MASK_SFT | APLL_DIV_MASK_SFT |
-			   UPPER_BOUND_MASK_SFT,
-			   (0x1 << XTAL_EN_128FS_SEL_SFT) | (7 << APLL_DIV_SFT) |
-			   (3 << UPPER_BOUND_SFT));
+	ret = regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
+				 XTAL_EN_128FS_SEL_MASK_SFT | APLL_DIV_MASK_SFT |
+				 UPPER_BOUND_MASK_SFT,
+				 (0x1 << XTAL_EN_128FS_SEL_SFT) | (7 << APLL_DIV_SFT) |
+				 (3 << UPPER_BOUND_SFT));
+	if (ret)
+		goto err_disable_apll_tuner1;
 
 	/* apll1 freq tuner enable */
-	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
-			   FREQ_TUNER_EN_MASK_SFT,
-			   0x1 << FREQ_TUNER_EN_SFT);
+	ret = regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
+				 FREQ_TUNER_EN_MASK_SFT,
+				 0x1 << FREQ_TUNER_EN_SFT);
+	if (ret)
+		goto err_disable_apll_tuner1;
 
 	/* audio apll1 on */
 	ret = mt8189_afe_enable_top_cg(afe, MT8189_AUDIO_APLL1_EN_ON);
 	if (ret)
-		return ret;
+		goto err_clear_freq_tuner_en;
 
 	return 0;
+
+err_clear_freq_tuner_en:
+	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
+			   FREQ_TUNER_EN_MASK_SFT,
+			   0x0);
+err_disable_apll_tuner1:
+	mt8189_afe_disable_top_cg(afe, MT8189_PDN_APLL_TUNER1);
+err_disable_apll1_ck:
+	mt8189_afe_disable_top_cg(afe, MT8189_CG_APLL1_CK);
+err_clear_mux_setting:
+	apll1_mux_setting(afe, false);
+
+	return ret;
 }
 
 void mt8189_apll1_disable(struct mtk_base_afe *afe)
@@ -506,30 +523,47 @@ int mt8189_apll2_enable(struct mtk_base_afe *afe)
 
 	ret = mt8189_afe_enable_top_cg(afe, MT8189_CG_APLL2_CK);
 	if (ret)
-		return ret;
+		goto err_clear_mux_setting;
 
 	ret = mt8189_afe_enable_top_cg(afe, MT8189_PDN_APLL_TUNER2);
 	if (ret)
-		return ret;
+		goto err_disable_apll2_ck;
 
 	/* sel 48kHz: 2, apll_div: 7, upper bound: 3*/
-	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
-			   XTAL_EN_128FS_SEL_MASK_SFT | APLL_DIV_MASK_SFT |
-			   UPPER_BOUND_MASK_SFT,
-			   (0x2 << XTAL_EN_128FS_SEL_SFT) | (7 << APLL_DIV_SFT) |
-			   (3 << UPPER_BOUND_SFT));
+	ret = regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
+				 XTAL_EN_128FS_SEL_MASK_SFT | APLL_DIV_MASK_SFT |
+				 UPPER_BOUND_MASK_SFT,
+				 (0x2 << XTAL_EN_128FS_SEL_SFT) | (7 << APLL_DIV_SFT) |
+				 (3 << UPPER_BOUND_SFT));
+	if (ret)
+		goto err_disable_apll_tuner2;
 
 	/* apll2 freq tuner enable */
-	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
-			   FREQ_TUNER_EN_MASK_SFT,
-			   0x1 << FREQ_TUNER_EN_SFT);
+	ret = regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
+				 FREQ_TUNER_EN_MASK_SFT,
+				 0x1 << FREQ_TUNER_EN_SFT);
+	if (ret)
+		goto err_disable_apll_tuner2;
 
 	/* audio apll2 on */
 	ret = mt8189_afe_enable_top_cg(afe, MT8189_AUDIO_APLL2_EN_ON);
 	if (ret)
-		return ret;
+		goto err_clear_freq_tuner_en;
 
 	return 0;
+
+err_clear_freq_tuner_en:
+	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
+			   FREQ_TUNER_EN_MASK_SFT,
+			   0x0);
+err_disable_apll_tuner2:
+	mt8189_afe_disable_top_cg(afe, MT8189_PDN_APLL_TUNER2);
+err_disable_apll2_ck:
+	mt8189_afe_disable_top_cg(afe, MT8189_CG_APLL2_CK);
+err_clear_mux_setting:
+	apll2_mux_setting(afe, false);
+
+	return ret;
 }
 
 void mt8189_apll2_disable(struct mtk_base_afe *afe)
-- 
2.43.0

