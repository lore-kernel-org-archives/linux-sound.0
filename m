Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794464277;
	b=gawSTCeA5su5HqicOmHc1TY+a8wzjtv1kEAFPcVsxiw+rd/0Eh98MoqQg4Q7IlcTr2I/
	 JWj1LMz3uu7Yuei2d5VHYpq/QLmCGOUpm02WJ7YQ/swdihPC3z4dgq1AfBnaGDRkY6/vx
	 c6XaizeHvU5IdrTck6GG/M2LpzxgfLIhqbp7aWsYddZFIpmIM86Q9jPk/WGsRz4KjMIQo
	 1jJz3EjYN9OV8jMdpjMVXyuqeHDehSKjITsLe0OlNZ5g0rnrAJZsHQbTZdY2K3iF8LADz
	 PpraOFCK2g+t8Z3K+mHegc07VFm/aoMhIUd2m0kbKkR/9iT4Vak0dQS0cYNpbcjaUwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794464277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=5qj1NEIyOjI8wxju1CxSSKB0R6wnAt9ym79/l5uuVfw=;
	b=h8RriPFJYwWG2M1hFSbU3daf3KGemJLm/gVj3fxIqRp6+6RFzfgPry93myD8Nln6QYiZ
	 VJjiyO4snyCMirbpf3pXD5Xp1o4keRJ0NBatNkTey6u18Onpd1f1s4vnGQJIhf2L1L7M1
	 jPddSThfC8igjsBPtum4AE2klWanYob0o/ijfyEzGTm6zt+xKBDzkBaxO8o8e4S52Vsum
	 e5ZT11nm0Y5uAdtJS3a64yMaJtUsp7vqTHcSslRxbf7D2nFmJoYgRSTvo18pCE16Qkiyl
	 YQhQhdYF7+UgAFtWo/Qjm/6dIMqkQNW5JINJnw6+lP0cFzyGx30Mb7FYakcppTGYcAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cO0veR64;
	arc=none smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7466606A31C
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 06:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7466606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cO0veR64
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5361e313e63so42352381cf.3
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 22:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464276; x=1795069076; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5qj1NEIyOjI8wxju1CxSSKB0R6wnAt9ym79/l5uuVfw=;
        b=cO0veR64wh3RXauNWjwKa7fzTr9/qqpVG/8VpH79HJ4cyBdP6wasdoLllhUjX36pvj
         d9PFF9/2usELAomvBGKLGvsYo0a0MYtm6PyIdvvTFllhPlbSGcb1eP12w4h6doX2KInc
         UTBMxBi18LjyWxtziPVlOdpRUmA60WzFkiUGIaOiMGd/iLm5NuxF9bGKoE5+Oos65SHI
         GmnJLhKauMhkI8KLusXNySgY/GFoKmGwbsyYoN8yO3Bjhc36zbXlaK0MXHlcxk1+p29n
         Dg5kBrn8g2Wt88+QWpmxrnKompWXFBwcEtdjovJq9IoI3tlwAsVRPUaOjw1jniPEjB7o
         czJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464276; x=1795069076;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5qj1NEIyOjI8wxju1CxSSKB0R6wnAt9ym79/l5uuVfw=;
        b=ir4ecVc+09s/oZF6Lh3AHUyMOLC58V8XITNtkwXZ1WSnKIjxKDLqPC1bai1fUPKmeB
         3GdqDcW7Y/rVeTN4BKWvRa5XJvypUayA6QspetSGKs3gxSbXnabsDL765CqmkCCdajDO
         j3/PT4IpamtEWFXh7KkQ4G9HzPo0behsxdZ8ckRDov0gGVWzjWMXpvOqoIKlhRQEHliD
         H9wz4PuXOenL6fCsw4Ps6ucmMqVyHavROS7TuI6nJY8++4rqZdvw8gZjcmD8gHvUfd1P
         EHYfma9v2ef0D0gHAyjcYzspcMlmiI7mGRAzEdG382oDqOEQLkIYTKjrUYXwQdtMMW0y
         bvFA==
X-Forwarded-Encrypted: i=1; AL+hErElYQb9IwsTWDQ8vZ2l7E6hUWu5HSEEFU2jd59LrZC+8aS/YecTJr4nzN4C/Uwrf/XZ/YXhcxSTRCZzMA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9S+yWnjlmdDl2lB47MC7rYl3IkVG9afYTMxJxHihmPW6ZamRL7
	il/HO50TPT+yo8qgraY8L22mDMACQIxIaeMxqhlt5EZIoppHf0zvofg=
X-Gm-Gg: AYBFou2WuJRltwbtbMUh43epHMt1yOJ7mDmDLZLir00Cht3uupBH9x+loCMJnU/NHrb
	OtsO94JGezrT5nYmuLScXCjwwJ0BDOJK+mP8dLv+P+SNbA+McurdZmcq4sLJN+L6J0o5a1fqMQ7
	npc2jCL2afHZHV+UnPCzLITFvyvZ3C6Ee34uoTYt9MtBbEvcgMbUpGgrPyw6XzAg9ZDo6bC2JKm
	NJ6VTT2JBojEAXdtvcIcBXw/bHAr5F8D8j8HYeKptC9nzceFO34yGbQbzfVaIRf21+ARPBRyArl
	wVQbuayboKdPAws8h9Jpp9ij997txllnjrS8R/VY2N8/mcIttj3aCMSe296NthZ219cnO1QfOzF
	swdZrhkXC8NeJyoORq3W/o4/HTDRTcGEV6/y8FDJ5+DH0tVWIsyaRY97KB2wF/zvheJhD9V605E
	/xzauwRdcAKocgf0OSCVwM6YLbd7GeLE/RNOalc539gSZLuFpZDZLViruGETiFelJuwQi/FDuTq
	vVxkcc6roSx1EQMmBa8vyv2IQ5HW8jpQz8lSG/sjYwRuyC/Agfbgp8W2gVTCZpPOQhkthzq6E91
	6jJJ7Avy3prEVVrSdYM2GxL4vf4BUYlAKuNU9DqEuNiFRAXd1bGJWbULMxzj4k6Eo5d82uhKnwm
	8cF7hiJPmrZcMQ58eS+brlKXxBlzL98+Spw7//r9Pud+ugSgo9HvbCQUYMOTJxtsa0HcoJ/msJ5
	mj2s2d9+yi80yt2pzxcEG/ck5vZkUdkn2R
X-Received: by 2002:a05:620a:440d:b0:93f:5f83:2ca7 with SMTP id af79cd13be357-947affbcac7mr807733085a.52.1794464275757;
        Wed, 11 Nov 2026 22:17:55 -0800 (PST)
Received: from localhost.localdomain (h16.44.55.139.dynamic.ip.windstream.net. [139.55.44.16])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-947a5ac3f27sm513931985a.22.2026.11.11.22.17.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:17:54 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ijae Kim <ae878000@gmail.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: [PATCH v2 1/5] ASoC: mediatek: mt8186: Keep the AFE IRQ within its resource lifetime
Date: Thu, 12 Nov 2026 01:17:45 -0500
Message-ID: <20261112011708-afe-v2-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261112011708-afe-v2-0-mhun512@gmail.com>
References: <20261112011708-afe-v2-0-mhun512@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The AFE IRQ handler uses afe->regmap, but its managed IRQ is requested
before the audiosys reset and before the regmap is initialized. Apart
from allowing an interrupt left pending by the firmware or a previous
kernel to dereference a NULL regmap, the reverse devres order releases
the regmap before the IRQ on probe failure and removal. The IRQ wake
setting enabled at probe is also never undone.

Request the IRQ after the reset, the regmap and the handler's other
inputs have been initialized, and keep the existing runtime PM error
cleanup for a failed request. Balance the IRQ wake setting on the
remaining probe error paths and in a new remove callback, which also
releases the IRQ before devres tears down the component and the regmap.
Save the IRQ number in the private state for that.

Found by a static analysis tool under development.

Fixes: 097e874ad3fc ("ASoC: mediatek: mt8186: add platform driver")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---

 sound/soc/mediatek/mt8186/mt8186-afe-common.h |  1 +
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c    | 42 +++++++++++++------
 2 files changed, 31 insertions(+), 12 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-common.h b/sound/soc/mediatek/mt8186/mt8186-afe-common.h
index d59258520995..d03e59ca7d65 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-common.h
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-common.h
@@ -139,6 +139,7 @@ struct mtk_base_irq_data;
 struct clk;
 
 struct mt8186_afe_private {
+	int irq_id;
 	struct clk **clk;
 	struct clk_lookup **lookup;
 	struct regmap *topckgen;
diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
index 2f50f78a6f8c..134ff3947bff 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -2885,16 +2885,7 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 	irq_id = platform_get_irq(pdev, 0);
 	if (irq_id < 0)
 		return irq_id;
-
-	ret = devm_request_irq(dev, irq_id, mt8186_afe_irq_handler,
-			       IRQF_TRIGGER_NONE,
-			       "Afe_ISR_Handle", (void *)afe);
-	if (ret)
-		return ret;
-
-	ret = enable_irq_wake(irq_id);
-	if (ret < 0)
-		return dev_err_probe(dev, ret, "enable_irq_wake %d\n", irq_id);
+	afe_priv->irq_id = irq_id;
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
@@ -2947,6 +2938,18 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe->runtime_resume = mt8186_afe_runtime_resume;
 	afe->runtime_suspend = mt8186_afe_runtime_suspend;
 
+	ret = devm_request_irq(dev, irq_id, mt8186_afe_irq_handler,
+			       IRQF_TRIGGER_NONE,
+			       "Afe_ISR_Handle", afe);
+	if (ret)
+		goto err_pm_disable;
+
+	ret = enable_irq_wake(irq_id);
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "enable_irq_wake %d\n", irq_id);
+		goto err_free_irq;
+	}
+
 	/* register platform */
 	dev_dbg(dev, "%s(), devm_snd_soc_register_component\n", __func__);
 
@@ -2955,13 +2958,13 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 					      afe->dai_drivers,
 					      afe->num_dai_drivers);
 	if (ret)
-		goto err_pm_disable;
+		goto err_disable_irq_wake;
 
 	ret = pm_runtime_put_sync(dev);
 	if (ret) {
 		pm_runtime_get_noresume(dev);
 		dev_err(dev, "failed to suspend device: %d\n", ret);
-		goto err_pm_disable;
+		goto err_disable_irq_wake;
 	}
 	afe_priv->pm_runtime_bypass_reg_ctl = false;
 
@@ -2970,6 +2973,10 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	return 0;
 
+err_disable_irq_wake:
+	disable_irq_wake(irq_id);
+err_free_irq:
+	devm_free_irq(dev, irq_id, afe);
 err_pm_disable:
 	pm_runtime_put_noidle(dev);
 	pm_runtime_set_suspended(dev);
@@ -2977,6 +2984,16 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static void mt8186_afe_pcm_dev_remove(struct platform_device *pdev)
+{
+	struct mtk_base_afe *afe = platform_get_drvdata(pdev);
+	struct mt8186_afe_private *afe_priv = afe->platform_priv;
+	int irq_id = afe_priv->irq_id;
+
+	disable_irq_wake(irq_id);
+	devm_free_irq(&pdev->dev, irq_id, afe);
+}
+
 static const struct of_device_id mt8186_afe_pcm_dt_match[] = {
 	{ .compatible = "mediatek,mt8186-sound", },
 	{},
@@ -2995,6 +3012,7 @@ static struct platform_driver mt8186_afe_pcm_driver = {
 		   .pm = pm_ptr(&mt8186_afe_pm_ops),
 	},
 	.probe = mt8186_afe_pcm_dev_probe,
+	.remove = mt8186_afe_pcm_dev_remove,
 };
 
 module_platform_driver(mt8186_afe_pcm_driver);
-- 
2.43.0

