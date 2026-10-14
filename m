Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADDB4F798D
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 11:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977307; cv=none; b=kjiHsWtZa+y3flM0qPvCTP2mkDfAv8cNXYde7AoQwA6dRZ5ezvwIha19U7e3Hjsnf64Opj4dk6QqOnFJhZETKPNdyseceZCYpqvBbxXQdhAQ3/ouxUQSz6NmBWVd27jhH+vARdMka3sRraKuTZas9/m5u4+6gTdUtieFzIwoynE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977307; c=relaxed/simple;
	bh=kDfxq05EWUlkZUDmKSun7LC01T/X4qiMqm8esg+ujUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SaLhezRVNX/9vxMVydKaXwEsYafNxVg1ULz0W8orlaT6JJOYMNijF0D9b2LJ9zJAyEkTpJtnStiGRtAvpg6c8WgcM2YjCumXQYHXeFEyV0E13GtSkXyPk8NeF1Cl8Pp2akaltcmGyyi6ufeS/OOZewX+odnK3N0tovTTt2fr8Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fz7FEROq; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fz7FEROq"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ab3260b35dso2513451a91.1
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 04:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977305; x=1792582105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CExJJFNeVdJxJ2CT2z02fSyns9MbGRw3UzVN3YUCwRQ=;
        b=Fz7FEROqZtMVWVLfmzqzdRIxRmM9ZuCh0R13d0Fhfx+rQ4HX43QHlJDOOn9Chad8W8
         Dn6JLldNs+moX6eF5F7SG++HXJZC3ntg2uCVGtpAbrykk4gZN8f9027Cz/fWoU3vgWT6
         AjRqOSXMy316VEdwonLKgZHg8RlhExD6EXQg+WlkbEhdpef2iOOzyEMzROxJ3Zxylx8Y
         0o+JPihIkUOtU3yrTZ/rXiXg38tUgmsLfb2LILTeNnKXMWzEvRcVizk6zG37x6S+RhMC
         euGJ8wJ5snW7cvnlchG9Ee7/erHLu2j/L4Sfrj3fOpMg0dWxpkiRaO5wJUiUnoAAvr0K
         n5Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977305; x=1792582105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CExJJFNeVdJxJ2CT2z02fSyns9MbGRw3UzVN3YUCwRQ=;
        b=ZfZIot1cDEOPMcfSsQNaYCsIiFpesMmp81MtM+/YlZqXYD3jT0s6UmA8hEJajEzInF
         KlbB1N64B6Yf635u8o+OPkM/D0R84TMZ9F/Kqpcf0g5iesZrU2oUzvHqKIlRjtln89fm
         hYb4MUcG+HVOHa8sAi1FP5PJUxoCM/e2AxSqEkvj+AHSbHJfhFdg7j9EzTYOjJix9OKt
         5USz+uZ1ac1jGr2VH4Jscw7Hzh/yzZV6JugO3rYJZNyYeFVGJa/XqD22ljmZzyBlf0Yp
         779trQyFLhsbVL/ca0LgrcwaP5QMDkUQm/PZnNC58rIjQCCj+AAT6fBcYn3TAKzfSFIw
         +0IA==
X-Forwarded-Encrypted: i=1; AKwUvBxza5I2Tdcp6+hwhLxnFU0dHS/Lwx8S1nCtJA4YliQXYBAVU7D6QLE9tilroixOuR9FkyZPf7aQC5Uzhg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIbP/1T9iPOiaDTpKQB+gtYR3gd76Rnxm6nVqP25T5cXdiEqvQ9
	flHSl9MdNQvFCOvUf6aS0DLA3pnQITWFKRRBLY35HVRIOpTqnK9JdipU
X-Gm-Gg: AYBFou1A3XdirxbhNy6KzlV1tGcYbEUjcSCI0otTIVcpWvOHRfyKekjtfwaNMXOxCiW
	WLVFR89JI9Ygp9yTmjjh0k5k5bWGd2HShaK/YOd3ZScsGKqroYObmotKgQ7F/Wj300+15cLu/zj
	ED7ZOhlUBBNaTRChdqDv+bi5d1xeRNXzl7qZnOPXLdlKhky+epEWmExGkdS/zXy7NTshzFNxuwr
	4G9Zk7V9ZAQ71EMsYHg+T2rmHRTUf4/YrRONoQyM5TLpMfSRLe8+XuFLmXoRIAXOVXlo+e6ycZl
	ucEkWyT2TvE2hSOuZ3TzrDwC4IUfn8UZAx002ZWW55qVccnUJko/j8Que3ldxzYFztY5y//gW06
	3oiQkLTj8qHrqJf2+M0yMCS+GL5rYY4x2/PyQ/pAWNbjSpaIm/N4OMnHl1+5C4oaf1jcqfTJvK3
	u9TsKLFUZlBZ5GPe99vfnIRXlXrlmy7vTax/Ue1XUa87Zh5yN0D2djGlzpYjaxwOy7ls7n+UNWy
	kTsHnO3ZeDySZqiRrXgz216xXKx/zZRBWcLmDSGaFEWCy0fM7uZY7rEHP7KdPX1sXvYgXkHLfR1
	aVWQXLjJNo8nfFkmI3vCpS2m
X-Received: by 2002:a17:90b:5343:b0:39e:6c6a:6580 with SMTP id 98e67ed59e1d1-3ab3a9d3dfdmr12082597a91.67.1791977305154;
        Wed, 14 Oct 2026 04:28:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:28:24 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 02/16] ASoC: mediatek: mt8195: Use dev_err_probe() in mt8195_afe_init_clock()
Date: Wed, 14 Oct 2026 18:27:37 +0700
Message-ID: <20261014112752.683032-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014112752.683032-1-phucduc.bui@gmail.com>
References: <20261014112752.683032-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Use dev_err_probe() when obtaining clocks to avoid redundant error
messages, particularly for probe deferral.

Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index ec1ea5b988ff..12d8159338be 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -397,12 +397,9 @@ int mt8195_afe_init_clock(struct mtk_base_afe *afe)
 
 	for (i = 0; i < MT8195_CLK_NUM; i++) {
 		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clk[i])) {
-			dev_dbg(afe->dev, "%s(), devm_clk_get %s fail, ret %ld\n",
-				__func__, aud_clks[i],
-				PTR_ERR(afe_priv->clk[i]));
-			return PTR_ERR(afe_priv->clk[i]);
-		}
+		if (IS_ERR(afe_priv->clk[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 
 	/* initial tuner */
-- 
2.43.0

