Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E110D42C504
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 20:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786133393; cv=none; b=Ge4tdjOgiuHKFAVI507NDGv+j9iOGqQfNrVNcdlmUYX7cVHxiec3y0kwl/IoHGi/MUPAZQkjZIg4skpFt5FAsi2eTruAEPM2XmZoUfehu4qpmKOFRArIJ88QVusvyILo8k+eclfi1+CnVq18GEJRAsFy/vd8UIxv/GnZkjBCDuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786133393; c=relaxed/simple;
	bh=ovG3KD9SWw2WSAD+Z+FkwTd4OAPzI25cyyOlO4Nkoro=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ORMyALlFnky++dWgJuBgRS7Tup1us9RUbfIsfcyuJq2/7/FEueaTy4SsVhJw32fgdOWUj2HsFx6iyPIBUk31N93+UYn7c64wgwSHkVArWsR8ilcre3btw2H/lb98toiJcpHHS61CPkhMdxd3pucR2EgigMeSQi70u2Ec6EbwmzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yr3l5LI8; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yr3l5LI8"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so37858165e9.2
        for <linux-sound@vger.kernel.org>; Fri, 07 Aug 2026 13:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786133390; x=1786738190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=U4zFNvqb3TCUq9G6zwsXaSter1qm2jsnjI9BXrVsaKk=;
        b=Yr3l5LI8aFxoy6Vagxn/4Gdmot976y4ilI7f4wSzh3WrJoV+U6Bb9epuUMS8/1pcXV
         GSLTEb2NE6gZ5wOtLCd4xYG1ovDdVDet2xZavjfSb4lyWitB6EyMiLsppXlneSMOO6K/
         QWSjoiUTliEn15xU4+zlXQ12V9dN1UfS240ybzoJ5uXdDaGni4LBBeCKAucl1Q0NmTvB
         CDlhziO3HsNrrquatfWcEvB5ze1crXsdZNMhP8H7iOtDsNTkFZMXp/uGWUGfYBbGG2Zl
         1KdkEDXu1emQlDYAqIxzoGF49gTwUFaY9IdcQfQnNNTXuKgiMgqxBUlUsqiPK3fIh6ZD
         kg6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786133390; x=1786738190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=U4zFNvqb3TCUq9G6zwsXaSter1qm2jsnjI9BXrVsaKk=;
        b=PbWXOKm0cGIIMgX2TXYeS8Xe7eqyZ4EabESUnP0NiTRvdJ4iy2wMIFS9QkSIr6iWBC
         9/GovMx3kD9xU4WgqC8zvq+kQVKJlfhrCET5En8DpeenmxtLfsWLDRVLrMIhoksNB8+b
         QIDBkDbOcrp1xyb73mM7QxBDDWr3UmyOuiweKz/hnlJmDuAXDpJusFqLxqMLUWAbwbpI
         fBH88+p0A6Z9tiQkz8I5kIieEt6um+6q+jdnizlURhJQvHTNqHyc/9IO+JRc+17Fp8YG
         h04FNin+GWMu1ct2lsA5n2r0RGYaNzg5Z7jlRaz+/pCq9OfAQJImMpLSa8rf3RxAI5tg
         SmdA==
X-Forwarded-Encrypted: i=1; AHgh+RoqcSl2GeS1AP/3921pBhidLFxgoX+/zfibQpniTzV5p9SYArWsIfVFFtOKER4U1xNuRjLaUyXRfcDSJg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywygv2q3QCNuwjBTeqUc8LiirzUTrjLbvI+IeSiUxGpVcN78Xui
	zvt+tNYsI53gJGhQ2H2hKD6GuAHKnKa67f3kUQaLNbbgpwdlLtajeYCH
X-Gm-Gg: AR+sD127DHkbDc0Krx3v+xq+6tMaQy9jptbLWxxhln+Tcb0vW93awuTPwh8ypym13Vo
	S1GN5XjdFp7OaCJK2nVgjQLxPBuYsi6C9B+K+wj+h6Z3EsCIojCvVv9nXqjCFlm7ffi0yt/6S3I
	mab8DW5X2JcY1INB17EexydsXEyI9gy/fqFt2AWpAZVMgTl/N2+6IY9BX+/2OwGYiqhVzG08zJr
	dfU7t+SHkrwkCSa+bQGBhQ1A+ISiuOn3R01G2V0p67+pKvNDuzbQjThALNWEVohwkVV+vCPlahC
	5/MExGO1T7KZ/Iy9BgNv1BCU3+/gHUNVEG2+baVEcaRw4oKvXJki6CiBu5qwxBlsqR31CyVDECz
	T5fxGIN+rrbW/5r3grHPCHwRNFc4WTuE+8o/y+8unxyKPKz8+Z3SVB950+gsTTFvFGmwUmRrfwL
	TVrcBrD8u5B98WCC/l2/qwjULAc82igCX4W9BlhLoKUmxqmfPcdGsTV73vuFtVNwMx6KFGy/1HP
	6l70qGY38KbBN/dQi4Nu1PS66Com6pZnOerviHLWzC97LHYSx6QPQqL1kwi/yUQUA==
X-Received: by 2002:a05:600c:4f82:b0:499:518d:ebd6 with SMTP id 5b1f17b1804b1-49959e3c714mr148437735e9.17.1786133389992;
        Fri, 07 Aug 2026 13:09:49 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-19-255-168.retail.telecomitalia.it. [87.19.255.168])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995919df87sm124815635e9.6.2026.08.07.13.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 13:09:49 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Darren Ye <darren.ye@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Rosen Penev <rosenp@gmail.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v5 3/4] ASoC: mediatek: common: permit to provide dedicated regmap for irq
Date: Fri,  7 Aug 2026 22:09:33 +0200
Message-ID: <20260807200936.201827-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807200936.201827-1-ansuelsmth@gmail.com>
References: <20260807200936.201827-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some SoC might require dedicated regmap to configure some specific IRQ
register.

Add an extra entry in the base_afe_irq struct and use the specific
regmap if defined.

If not defined then the global AFE regmap is used instead.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 sound/soc/mediatek/common/mtk-afe-fe-dai.c | 14 +++++++++-----
 sound/soc/mediatek/common/mtk-base-afe.h   |  2 ++
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.c b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
index 2a20fa5dba49..948f606cbaf2 100644
--- a/sound/soc/mediatek/common/mtk-afe-fe-dai.c
+++ b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
@@ -204,11 +204,15 @@ int mtk_afe_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 	struct mtk_base_afe_irq *irqs = &afe->irqs[memif->irq_usage];
 	const struct mtk_base_irq_data *irq_data = irqs->irq_data;
 	unsigned int counter = runtime->period_size;
+	struct regmap *regmap = afe->regmap;
 	int fs;
 	int ret;
 
 	dev_dbg(afe->dev, "%s %s cmd=%d\n", __func__, memif->data->name, cmd);
 
+	if (irqs->regmap)
+		regmap = irqs->regmap;
+
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
@@ -220,7 +224,7 @@ int mtk_afe_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 		}
 
 		/* set irq counter */
-		mtk_regmap_update_bits(afe->regmap, irq_data->irq_cnt_reg,
+		mtk_regmap_update_bits(regmap, irq_data->irq_cnt_reg,
 				       irq_data->irq_cnt_maskbit, counter,
 				       irq_data->irq_cnt_shift);
 
@@ -230,12 +234,12 @@ int mtk_afe_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 		if (fs < 0)
 			return -EINVAL;
 
-		mtk_regmap_update_bits(afe->regmap, irq_data->irq_fs_reg,
+		mtk_regmap_update_bits(regmap, irq_data->irq_fs_reg,
 				       irq_data->irq_fs_maskbit, fs,
 				       irq_data->irq_fs_shift);
 
 		/* enable interrupt */
-		mtk_regmap_update_bits(afe->regmap, irq_data->irq_en_reg,
+		mtk_regmap_update_bits(regmap, irq_data->irq_en_reg,
 				       1, 1, irq_data->irq_en_shift);
 
 		return 0;
@@ -248,10 +252,10 @@ int mtk_afe_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 		}
 
 		/* disable interrupt */
-		mtk_regmap_update_bits(afe->regmap, irq_data->irq_en_reg,
+		mtk_regmap_update_bits(regmap, irq_data->irq_en_reg,
 				       1, 0, irq_data->irq_en_shift);
 		/* and clear pending IRQ */
-		mtk_regmap_write(afe->regmap, irq_data->irq_clr_reg,
+		mtk_regmap_write(regmap, irq_data->irq_clr_reg,
 				 1 << irq_data->irq_clr_shift);
 		return ret;
 	default:
diff --git a/sound/soc/mediatek/common/mtk-base-afe.h b/sound/soc/mediatek/common/mtk-base-afe.h
index a406f2e3e7a8..b5300c9ed415 100644
--- a/sound/soc/mediatek/common/mtk-base-afe.h
+++ b/sound/soc/mediatek/common/mtk-base-afe.h
@@ -153,6 +153,8 @@ struct mtk_base_afe_memif {
 struct mtk_base_afe_irq {
 	const struct mtk_base_irq_data *irq_data;
 	int irq_occupyed;
+
+	struct regmap *regmap;
 };
 
 struct mtk_base_afe_dai {
-- 
2.53.0

