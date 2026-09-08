Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6A051FCDA
	for <linux-sound@vger.kernel.org>; Tue,  8 Sep 2026 09:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788858306; cv=none; b=gv1fbOeXVorI8yqWRM+q83QGBw2tGf8dUU3/F8mdib1nAL/mZeP8GD6TwKr56TaCWFUOEocwUAB4wmhp8vWWrBM8Z0Ge/wU++tbFJOKqxPqaz6h9Cr4Mln7zbDYNp/6huT1+C/Q8TtAk6eER6GhHp5pl+lE5ND1BwMBKDA6cKIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788858306; c=relaxed/simple;
	bh=ovG3KD9SWw2WSAD+Z+FkwTd4OAPzI25cyyOlO4Nkoro=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P9J3vw7aNZ53Ou/KAhJ73aLv2IXRKQT4QttGpaoaiI5fzS0+/Sy/nN+By3of32QUXleYBvXV/w0MqGK9iI/nqg2oTB0dtRceTO40msn81gVNpL8W3ZXX/XJm3draB3KHvSyVqjY/vZEZi8JuranUcqGvr+ZNi/5zFnsIvXHMxGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kCGEdsoa; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kCGEdsoa"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-482dd6ee390so5018234f8f.3
        for <linux-sound@vger.kernel.org>; Tue, 08 Sep 2026 02:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788858301; x=1789463101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=U4zFNvqb3TCUq9G6zwsXaSter1qm2jsnjI9BXrVsaKk=;
        b=kCGEdsoaW5lzBo5X8NdlroTvWDvWNEZHjAdd83ElO6lW8HQahPfSxR95R6xmn4D4oT
         TqfR+5ZcP1VD4rW+dU5mXTxMsrKy0+SCq+Kr527iOWKgpqXPHqCvcm6NlWIA3r3Ida8v
         bmofGJO1ECNR2LQu505oZiOX5th4Dd2Wplo57wRREnPzpYb900zVCr+GKwUWkP/fejxo
         xZm+khMLGCaloEC48yEgy8l5FZO5zYZZRcsraKhoz+0ryKM8uNbnOqgWdOcQ0LG1EMug
         AgMG29EWhqhX11rfHDljcHAGxHhwQOfZ3MmymL0BGm5IGk5OL7Knwxlmbl3/Z+bT2tjh
         w2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858301; x=1789463101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=U4zFNvqb3TCUq9G6zwsXaSter1qm2jsnjI9BXrVsaKk=;
        b=Nrv75wGsi4yG/eTcJJpObZcC7NYAJ2casXgkyPij3H4g6Qw3uvmBrONZxUSwNuT2uq
         tabLLMUd+0RbTifGUn+9pawe9RHA8kpM8YLyYH0tj2AbQUn7INcW7E2Mz55AYoYvVC11
         Gp6Ki2BNFaahH6o8deqo6DX74DZZauSM4ANOlhNCidNaqt4AeWbfuA1ErC7FgvLQmgKn
         QwafIOF3bra44g9Prbi0jscxXqjzsD0RY9tLJg+KU+FQCUpqnKf9eVZhd7A+QtPuFFTJ
         8TJsNsvLoiDr03KImmT/M4OuN0I63z0MrLOuuGEy1xmeFeaav0a5cEr/YAibyHn7T4+V
         dpEA==
X-Forwarded-Encrypted: i=1; AKwUvBzqTITdjpEBydCIokDkiSTokHSgtoAwV+B6RvFQnEodPoRxPXw5zxRKmunyzsk6psyR1EszG/zoZrWBfQ==@vger.kernel.org
X-Gm-Message-State: AFuF++ndNHI1X4ORILxoyAjc00rAAYQiOwG3oHu7TBLiocNteS32d5IT
	JYWQFuP4kzIbIh0W4zT+UAuKYCBXQUjj+Y/2sMXgMF6Kbv4Ya/lIi2Bs
X-Gm-Gg: AYBFou3+Jfaj5HHYCDYpa3ut3VOezhFwB99Mr0aYkxxLqyZaVpn8AxBpaHrU+B5ISFe
	P9bGkfN2awq51EkbyASCE41FmM5M+aqnqR3SQ3WvZMgMiDP47ImT5syQHlNMCzhtPbIDGVJVOvY
	Nh6+7dQocj5qp3AhThHTJZzd0qPDxJEB6sGRglU09algQguMTMQxjoUKkw4J0NOLIEco1p4h1LR
	xKD0vVB5v11vTmr+9KY0/Z2U5CDHULIdMns2dY+NE7KLR+dTB+RM2GSQJ0eeHgyY7e3YfGH6aT6
	w7nyvDtsHexj9PZgLPoPJZRn6Ufm+13PTBzjOemgrCbBvDJ/V1yVaMrSDTgCxBw/rJZ7KvhoNMd
	k5/XfLJhrdiV5bkrR1suKb3s02FVb0Rg8enFBMB7lSPhzNw+b3FOr1IhFcEiV93HQureifyKjoX
	Eksg4w/Fg2dMKLaH/kjV9RW32tO0m67KMVeuLaO4haA/6SN9Vvtl9wQIRCv+cWeP8C9vEVH0P4u
	lAGrcmKQd2tMXvENHtfC6MtLgneGTLYL6LledC5WqxozQufVrYn
X-Received: by 2002:a05:6000:26d3:b0:484:4146:1422 with SMTP id ffacd0b85a97d-485870934f4mr28074029f8f.21.1788858301380;
        Tue, 08 Sep 2026 02:05:01 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-485881353e8sm34767945f8f.1.2026.09.08.02.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:05:00 -0700 (PDT)
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
	Rosen Penev <rosenp@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	bui duc phuc <phucduc.bui@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v6 3/5] ASoC: mediatek: common: permit to provide dedicated regmap for irq
Date: Tue,  8 Sep 2026 11:04:45 +0200
Message-ID: <20260908090448.3332-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908090448.3332-1-ansuelsmth@gmail.com>
References: <20260908090448.3332-1-ansuelsmth@gmail.com>
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

