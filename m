Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EAE45D911
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 12:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045092; cv=none; b=gL2+elPKxjOd+Y22cgLLF8FfDwj3YLm4ZQfizq5fhA+IMWF2AZQvK5SVnVDdEJlUYxzyjBIuu1+ZnK/femhNfIfh9/reQqE4LbDkBR2iH1Mu72LbhVNTy8GBSk8puniVDvVsTA0jVNrSBbHSnFEV/v9ArHdXc2rgJLsp/xqN7Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045092; c=relaxed/simple;
	bh=8R+M9WKTmBHOoibWGxqqRpuDlDmGb5sK/DQtxVHwCLs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HP6NsM++E26R7MSqRSImxqz/kZ4ub3tsP1nLsjs7zA5Vh6UPAJYLyTCYM4u8wb+hZN5KOcfFEZyBqxx+gFm1pqt3EzvnHP0dUWWzPFlRpKxar12GjGcqsOt2lVFwdJxKaPIQjU2psix0/sOLA1z3xQ3P/XtCMsxvtobjadtIWSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A5HltfKi; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A5HltfKi"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-ca7c1176317so5827181a12.1
        for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 05:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045090; x=1789649890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g3KOEHZTQKUIeB5kbh5OXuF9axs2TgY2RpwsVG2WXZc=;
        b=A5HltfKi8t5g56eeHdEmVbb2Ir6y8NFvDUzVTYN/JjIr1txmUsNBt2ISpxsZm7Iynx
         0M0FIce4+q/fxX6Yfd3T89R7jVafVfJu80aWi4P4aHeNAh7VpAGavHPkyhEP4tkv9Viu
         5fJF1yjNWvtMMIa507pYO66DN8YrlgvU3B2pOiat8QnVtDpyY/4NQsbBgR8C0TNVTtjk
         dR8ivJTINogvgV2jDUGkUlZsZprrsRsXjgFPeQkrol85FO+HkNBCGn21K4LQwcZ0Tcs1
         v+XnrywjpW/GMPiH8o5GkMYRhu3GULhxb88qgQLjQNWjqTM6+Lgln4oV19cuH+Sbtxck
         l3ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045090; x=1789649890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g3KOEHZTQKUIeB5kbh5OXuF9axs2TgY2RpwsVG2WXZc=;
        b=lGDyjEdJBsNT75zjMYdAgqkwQwEhAMEqc9O6mTIAuWeDe/JB23tRmDIOgBtCPuecEV
         4DKLWO+jpjskLj+3+1Q5ddoeK1MvysxMu8aVGyHXew5WkwpRPATh+1p3X9FykMuNIF/A
         7BQpUByRCWuB/KJa/A9KCeMm2DlXbgFfd0zdL6nnqcitwya7B4Kihoaj5Z3a6d6t1RWO
         rLjypKwoI+skEMfXTj+qATEOCUUh6csEbK/h0LTdz3AsOEo/H3elRl5GKdzQafrXKDgt
         GReqZ18sdm+5CFXafx4vZTRONNYIXLbiq6hM80iRcVCgsyeXOq+9IkVLCTJAoSFy2JP2
         yofQ==
X-Forwarded-Encrypted: i=1; AKwUvBx2zinRTU4tcm6E2877xfNgKxIoNqLSZP1mMXP6h1YhCzJxaZVypqzDXzRvDoSn8+2CNnzuT6lPmbMIPg==@vger.kernel.org
X-Gm-Message-State: AFuF++llS78NXoL7uVRNHblaATNUuFWPexRHYUXVw4ujZRyPfWXcV4zk
	oioCV9STSLE71Qczid5CYvHT7yuMYNh3MsQ+OzfPsTX6NiH00v8aTDsokxY9OQ==
X-Gm-Gg: AYBFou2IIlHllKw6cqrlPXIL7WNCyI3l0BxCv6qQCbkIUwZUOE9VtvlYCLov7RR2VTe
	13NvH3SGVDztoXI4+kSDTHJUHmrsfFIk6MBTMfWuu8sz45IWJH7sF/A02VvcVeQ4sJcsg/RKuEJ
	NhH9N9ejs8wewwLW/gY48PchoPDxrKPRIRqd5n/nLUcJjI/4euE/Hf/gyXM0SVbfM0xftqDRygw
	XAkX4CJaj6lu1DDY5419/RqrEHpNWrH0Yj6YQ2XRhUzv93mPXyjRTLbFliW6yjw6FO3Q5QBoAd3
	gNakM4zMFqbPmF9s4rJx4DbJOun9k/yRmlO+4vjH6ACPKN4v65xH5PlPVGSyVnZ3+TdMvn5b6Ma
	WxVPCNnqnbjaIFbK1PiULZotcmOGvjyzQX2PB9ZKz0YOE90XUW6HJCghIiuDlYW57n45uyRKzV6
	eZgHzB5HtSUHGWm10OMZf27bB/tT503bDoo86ffWxwgYSyDV0nKw9PgAV44NN0lGtBdrtoL3GAM
	HAONJwX84mDomzsy10Vj8Xd0wHqbx7eL/aOeGaHD6oNf/ZHklfwE7hOT20z7YVepVQRd79lB07n
	3YHhrQMqZ8bvrZs=
X-Received: by 2002:a17:90b:268f:b0:398:c3a3:dbd0 with SMTP id 98e67ed59e1d1-39b2612eb96mr63642021a91.8.1789045090094;
        Thu, 10 Sep 2026 05:58:10 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:58:09 -0700 (PDT)
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
Subject: [PATCH 02/13] ASoC: mediatek: mt8189: Propagate APLL enable errors
Date: Thu, 10 Sep 2026 19:57:31 +0700
Message-ID: <20260910125742.150902-3-phucduc.bui@gmail.com>
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

mt8189_apll1_enable() and mt8189_apll2_enable() currently ignore
errors from regmap_update_bits() and do not clean up resources when
clock enable operations fail.

Propagate these errors and roll back the clocks and tuner state on
errors.

Fixes: dc637ffeed6c ("ASoC: mediatek: mt8189: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 78 ++++++++++++++++------
 1 file changed, 56 insertions(+), 22 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index 63e03a40dbbe..a901be97e75f 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -454,30 +454,47 @@ int mt8189_apll1_enable(struct mtk_base_afe *afe)
 
 	ret = mt8189_afe_enable_top_cg(afe, MT8189_CG_APLL1_CK);
 	if (ret)
-		return ret;
+		goto err_apll1_ck;
 
 	ret = mt8189_afe_enable_top_cg(afe, MT8189_PDN_APLL_TUNER1);
 	if (ret)
-		return ret;
+		goto err_apll_tuner1;
 
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
+		goto err_tuner;
 
 	/* apll1 freq tuner enable */
-	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
-			   FREQ_TUNER_EN_MASK_SFT,
-			   0x1 << FREQ_TUNER_EN_SFT);
+	ret = regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
+				 FREQ_TUNER_EN_MASK_SFT,
+				 0x1 << FREQ_TUNER_EN_SFT);
+	if (ret)
+		goto err_tuner;
 
 	/* audio apll1 on */
 	ret = mt8189_afe_enable_top_cg(afe, MT8189_AUDIO_APLL1_EN_ON);
 	if (ret)
-		return ret;
+		goto err_apll1_en_on;
 
 	return 0;
+
+err_apll1_en_on:
+	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
+			   FREQ_TUNER_EN_MASK_SFT,
+			   0x0);
+err_tuner:
+	mt8189_afe_disable_top_cg(afe, MT8189_PDN_APLL_TUNER1);
+err_apll_tuner1:
+	mt8189_afe_disable_top_cg(afe, MT8189_CG_APLL1_CK);
+err_apll1_ck:
+	apll1_mux_setting(afe, false);
+
+	return ret;
 }
 
 void mt8189_apll1_disable(struct mtk_base_afe *afe)
@@ -506,30 +523,47 @@ int mt8189_apll2_enable(struct mtk_base_afe *afe)
 
 	ret = mt8189_afe_enable_top_cg(afe, MT8189_CG_APLL2_CK);
 	if (ret)
-		return ret;
+		goto err_apll2_ck;
 
 	ret = mt8189_afe_enable_top_cg(afe, MT8189_PDN_APLL_TUNER2);
 	if (ret)
-		return ret;
+		goto err_apll_tuner2;
 
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
+		goto err_tuner;
 
 	/* apll2 freq tuner enable */
-	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
-			   FREQ_TUNER_EN_MASK_SFT,
-			   0x1 << FREQ_TUNER_EN_SFT);
+	ret = regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
+				 FREQ_TUNER_EN_MASK_SFT,
+				 0x1 << FREQ_TUNER_EN_SFT);
+	if (ret)
+		goto err_tuner;
 
 	/* audio apll2 on */
 	ret = mt8189_afe_enable_top_cg(afe, MT8189_AUDIO_APLL2_EN_ON);
 	if (ret)
-		return ret;
+		goto err_apll2_en_on;
 
 	return 0;
+
+err_apll2_en_on:
+	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
+			   FREQ_TUNER_EN_MASK_SFT,
+			   0x0);
+err_tuner:
+	mt8189_afe_disable_top_cg(afe, MT8189_PDN_APLL_TUNER2);
+err_apll_tuner2:
+	mt8189_afe_disable_top_cg(afe, MT8189_CG_APLL2_CK);
+err_apll2_ck:
+	apll2_mux_setting(afe, false);
+
+	return ret;
 }
 
 void mt8189_apll2_disable(struct mtk_base_afe *afe)
-- 
2.43.0

