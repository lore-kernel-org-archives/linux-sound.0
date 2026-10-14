Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718DE4F7983
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 11:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977350; cv=none; b=YrU6YO8BNROfgYMvsmuzvT6W+BkYgxBbW1zWkT8pYm7y2a5REfSGSBvz+o5GtWT7/Z+ZB/Axt1F6KQ6rkELryli7L88/BaOa+9F0E1m+RAsqykND/9jgpM0SCFZbHPimtxtbw/BxCvrdv8UQqLVvG/yQuVvL9YUWSLwU7pY5U/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977350; c=relaxed/simple;
	bh=jg0giRv6JVfianNWlTJu/+VIMoOTvPzRaWVz73ZGKoc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CafsKlLInTCnbMtNz6fjbys7Ex6u/srEuxSitdrksWwKDxVU6hG+UjsWYLlaRHyure8WU9+MwmM+kY0UZ3HziHbbVk4CrB1md96oReGbi7VrVplKqlyCbOnaGOLLSaB8yn0ciWE/SxJLbLKnoRCmZQ4NZTNVsIgZW8PqUMLUWeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FryWiUc2; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FryWiUc2"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc7e79c1eaaso1716173a12.2
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 04:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977347; x=1792582147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=odTbZLgwCb6DBPfwUfr7A5D1sZLLXU7jZEEh/Gyu020=;
        b=FryWiUc2g4jquID/xL9sTLFTy2m0VjV4c4xSOnWmk1QkqzQ2RdprAtVFdC+bXzYr9Z
         wP3LsTROK6s3S4aMZDE9aN6/UWPA4Xp8eyYW92KRRsLxiI5MYK8fujo/WHxagcmuz7xq
         yzj1g+212hDHpqk0ljLWssCQ8mhe1tL5HXBNo6tuhQTdYDmeBVQYw+Exg3ZEpnjLhhp9
         dDtRNscYLbN0UxagoxoQNn6cr4OSxA7ZeXeAC6lUBshr26uIiTFpvXRVDoAuH/9KQIYH
         YWfl6FLOpTYzyZWTb0ZXedKMwHeJBTv28d89E2FJrDh0VmCYEnLT31HZoDu1jZgbd4Ti
         PooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977347; x=1792582147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=odTbZLgwCb6DBPfwUfr7A5D1sZLLXU7jZEEh/Gyu020=;
        b=oFwfHZ1OyfC2r10Ihzj1KFl4sIkEuNri5V38AzkmiRsSpAHBB+Ih3ffAHIvW97QUGg
         svwlVSqByudql1Gl6ySzQDM1/KHVQOx5sIDydjhwzMYg+iFOrX64kdd0Z58op0WMPBhu
         6iYP8Zxjw8H2kULXg9Gkn37kbQoEa0OYk80kIpybYqi7CqIu1xTrL0pmZpo9X4KIUBb+
         M0+sRQgHpntlW5X4OCgtScfVMsITzDJVfay9R85kkKkziJHhlV4Rk1Z20YLRAiNsIcu2
         /wZyiPAiX49wJFp+LdC5QlFB0PgAJ7Rc7Kt9qCBS9Y12K98kF3SKXd2q0bWgeQh0XFg5
         L4yw==
X-Forwarded-Encrypted: i=1; AKwUvBwLUV8jSt5duM8j6VSJdsUqIeavJoeLcMu6v3fr4e5FgLq/6ptbBHtXg/WJcKHFKdgiPhLkn7/4xpwwug==@vger.kernel.org
X-Gm-Message-State: AFq9FYK5T8hiPRGYgMgddNgfyRv6tgfDzptjdZvD1KVrvnA557Vn00Ih
	xxa9BrTBNrB/wpqdUroRPrjlzkp71FUiyB4Zkrp21OEAyfqUyh37v49Z
X-Gm-Gg: AYBFou2XOGlK5We36qxfRTteGfkKPy+Ey1ExFn9mz5HGKtaRfhLIgOts1VE/5jSMoc1
	7qoABqeTBzOWQv4fuIj4kZwwm6P/+ycyL72Cj70S/K5R/hTAsVprilL/Acx6CJoqXZTYJhgD1KB
	8SPicEklYM54WFqiuNUiOQQ1U7UMTMU0P0FzyoprGL8sQjR6de8miZp4o42oPoQv/onFYWIGnW7
	JliHbvWlXvc1saF/lD6muOEMdlUOe+33CanI8MOqv5MP4Rc89C1dlgbINHcVFnGvc1ym3ctXhMs
	UeFD+FiNlOSEaMfkyTQMKU4km52kG0bmjcSfaZLIVMMZ6tO8Pc2v9H6/dYWmFnTbmc4sBaWH7V5
	cZcBebP96iD6+rfeIDW0CV0pVmvbyaW7XcdNsnS0A3y/YOOTQZTDlAHzljL0pOSdNjJXufu0rYL
	y/kXELPLntN/JzspwmOetFn3RhCNkAVf2nmSKNaPyaCdqRw5vJ/V4Yn93zPL+z+Jt17JVmarZtS
	spGhQh5PY4Wg+c43/z39joUbxYn4HEKWwihmIZZWO3a7zMIYv+CEgnplqjtS2eFWqLZMsVXqT5i
	kpENejYDSJbRsw==
X-Received: by 2002:a17:90b:5343:b0:3a4:e934:e85c with SMTP id 98e67ed59e1d1-3ab3accfc54mr13243703a91.41.1791977346715;
        Wed, 14 Oct 2026 04:29:06 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:29:06 -0700 (PDT)
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
Subject: [PATCH v3 09/16] ASoC: mediatek: mt8195: Fix runtime resume error handling
Date: Wed, 14 Oct 2026 18:27:44 +0700
Message-ID: <20261014112752.683032-10-phucduc.bui@gmail.com>
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

Check and propagate errors when enabling the register access and main
clocks during runtime resume.

If regcache_sync() or main clock enable fails, restore regmap cache-only
mode and disable the register access clocks before returning the error.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 23 +++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 4216c47a56c9..19047887ee21 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -2965,18 +2965,31 @@ static int mt8195_afe_runtime_resume(struct device *dev)
 {
 	struct mtk_base_afe *afe = dev_get_drvdata(dev);
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	int ret;
 
-	mt8195_afe_enable_reg_rw_clk(afe);
+	ret = mt8195_afe_enable_reg_rw_clk(afe);
+	if (ret)
+		return ret;
 
 	if (!afe->regmap || afe_priv->pm_runtime_bypass_reg_ctl)
-		goto skip_regmap;
+		return 0;
 
 	regcache_cache_only(afe->regmap, false);
-	regcache_sync(afe->regmap);
+	ret = regcache_sync(afe->regmap);
+	if (ret)
+		goto err_restore_cache;
+
+	ret = mt8195_afe_enable_main_clock(afe);
+	if (ret)
+		goto err_restore_cache;
 
-	mt8195_afe_enable_main_clock(afe);
-skip_regmap:
 	return 0;
+
+err_restore_cache:
+	regcache_cache_only(afe->regmap, true);
+	mt8195_afe_disable_reg_rw_clk(afe);
+
+	return ret;
 }
 
 static int init_memif_priv_data(struct mtk_base_afe *afe)
-- 
2.43.0

