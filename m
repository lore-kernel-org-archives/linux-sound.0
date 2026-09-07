Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0E9490BE2
	for <linux-sound@vger.kernel.org>; Mon,  7 Sep 2026 12:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782649; cv=none; b=fCGXJoMlRYqKUafoQBj34zUglt7lLWCDvLevmu9Nc/fqxnm6S5GhGCelYGXqhMuLtsredEZMB56L01ynv/Xw4jX6bAu1pnFZsQv4D5MzolVgL9nWnONwrV+VCAgHXTAuR3PusDz/THLG5/IAQQ6kmnAX7j9m/oqInnwDGxOJTz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782649; c=relaxed/simple;
	bh=TqPVcF7GwxKjnWyJPoshHMjqv4vykpXB/ptaLXKh0f4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D6KrTWqqHU35BNjjt6bfQyiBM0w3/aCs/xMd0nz+CC54Pm6CbAzdqgTdWR/WkwjZL4akN6VvF8fwG6MrWX+GkGvsN1s+YhJewrShsFkJsh4qXwN38pHuMze2xUkUF7YKWuM3X/96/s3cgfdCtxkUawzwY5R+s62bIwWedssptFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Im5J2ctx; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Im5J2ctx"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d5335cf904so33456405ad.2
        for <linux-sound@vger.kernel.org>; Mon, 07 Sep 2026 05:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788782648; x=1789387448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hypdJ1T8+wnBdNrqYZPIpZvq2yuPSL7MjBj6zT473gM=;
        b=Im5J2ctxCUkFNlLsReqwgiGdKUVraylEsSWPk+WYDjHkTaCBWtGwyK/x+bGOpkj/UL
         79r5eBQtOroofQoxjZQ11iP01uX61FtfVMduPRa7bLE5xtZi3hqH9sG/bl8rVjDyqQzQ
         OhKWZvELw25PcvB6aPKt83ILq9JLdwdLTtag0agLv9gDK8qQCJePcF8qUaukBTqtttDl
         2ggH98DpHOEwFDqolidVSiJj7aIQuYzxuUtmbtNHyZbIhls8LodmEV24u5N1wtDsszb2
         y4b/Z5Z9KmC+0HEJpm4AL4QTWF0QSaL1XtGAzdQ+kiW9c1UW8kg3qfn8U9Mjzfdn/3BX
         pUSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782648; x=1789387448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hypdJ1T8+wnBdNrqYZPIpZvq2yuPSL7MjBj6zT473gM=;
        b=Ioh1ufCpPHqhpcagfJVGY88z8LwHjsIpsDlHG3WSuICGWsfJ8iLTzrQvbcVInDyGcw
         4IJwagRbkjr2cBYCqdvHxmibtoGg9kzmu1aIKi7+5k9UjjfCmo7PTjPbXCaHybjF/s97
         d7DPho09WCq2nliWJjc65E91W+/FkL0vD1lkMIQrk2HsjBYbd2Up76j/TXZdVc2DaiAK
         Whl9X4WFiuXm+3NswR+QdBilFW/6ZDGBMIuxfTkf0kzLxdu+YurkgPB8n0ctn6Txcey5
         D5Zi25HjItvePSVB4/DHiZizB4cVft7G4dyjTtF11QcwNv+NuzbcVzVALBYoaxWFQHWI
         0EKQ==
X-Forwarded-Encrypted: i=1; AKwUvBwOg5P4enx8VovQftqcfUo0mBcsYTyEv8q7b540QrMtHsioqoXC2rmREkA1EUBDEk3azuqJn0Z0veZQ0Q==@vger.kernel.org
X-Gm-Message-State: AFuF++l5/5ExLdK+Rh7fynUT1GYgj09e7vjWVOKO40C6tlCGOLc1uAWQ
	M9wPqXCaS4Y6Lm74epOj1wFOl/WMbCl/RR3SNzQAm96k5DS+jb1Rp8H8
X-Gm-Gg: AYBFou384iooZkEeBJl1i0ObKRvPzCDK4O+YnkZP5XjZ0kyD192RZgHzv+OwFRCEe0u
	ey11hSwEqAECUmkMYm32q2aWWhiScYpJov3/pF8xwgUt3B2dp3uqGXLLDxr0nxcQ82zcJNL/09i
	JUiO4DeVw5U4FduQbCUtc/rQZa7mYKYVjCoN4zXX5EmG/8GN0ivoEj9RGhu1gy9ybxHoGZZY27l
	QZZofbnEB6Izxj4eSR93lKKAwTio2w/ayPViDqnDZDAy+JjOqJOhCKuaUKTBflPfp5PL0fCYQv2
	5XUTtBtWNaHN2FxFZgzibUoSz62vaQboz4NisjmNs9AOHSa2WD7OHPson6EgDb1QcGG++jdwdzh
	m88uXYj8OMB6NoIAL3JZ19JiTn7nyMjAkD4hgBfQ5jkgtKxOyK+zDTS7JLJysYjHPSOdYLtC5lQ
	wY6E/2Oz+T83ER+TVGNWQu/CehWipfH3ayXX577STH3nsLZke+PhezBPbA5Kr24ql/BnlLez1fI
	lVzR0N/7ypM2DwfIvyykWsQ6HJr09COrrgPcfNALt7VdhMAf9vHZ8ordfs6IIvg80x49yb6AQC6
	2SfZfA==
X-Received: by 2002:a17:903:3d0f:b0:2d7:3f6e:5cb9 with SMTP id d9443c01a7336-2db12637ca1mr316713255ad.8.1788782647486;
        Mon, 07 Sep 2026 05:04:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae85eesm43064815ad.82.2026.09.07.05.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:04:07 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Kees Cook <kees@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 6/7] ASoC: mediatek: mt8188: mt8188-afe-pcm: Drop redundant probe error messages
Date: Mon,  7 Sep 2026 19:03:09 +0700
Message-ID: <20260907120310.135693-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907120310.135693-1-phucduc.bui@gmail.com>
References: <20260907120310.135693-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Several probe error paths print error messages that are already
reported by the called functions.

Return the original error directly for devm_platform_ioremap_resource(),
mt8188_afe_init_clock(), platform_get_irq(), and devm_request_irq()
instead of wrapping the errors with dev_err_probe().

Also remove the redundant "err_platform" warning from the component
registration error path.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index f8cbe7bac36d..efad0af977f4 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -3232,8 +3232,7 @@ static int mt8188_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	afe->base_addr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(afe->base_addr))
-		return dev_err_probe(dev, PTR_ERR(afe->base_addr),
-				     "AFE base_addr not found\n");
+		return PTR_ERR(afe->base_addr);
 
 	infra_ao = syscon_regmap_lookup_by_phandle(dev->of_node,
 						   "mediatek,infracfg");
@@ -3269,7 +3268,7 @@ static int mt8188_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* initial audio related clock */
 	ret = mt8188_afe_init_clock(afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "init clock error");
+		return ret;
 
 	spin_lock_init(&afe_priv->afe_ctrl_lock);
 
@@ -3302,12 +3301,12 @@ static int mt8188_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* request irq */
 	irq_id = platform_get_irq(pdev, 0);
 	if (irq_id < 0)
-		return dev_err_probe(dev, irq_id, "no irq found");
+		return irq_id;
 
 	ret = devm_request_irq(dev, irq_id, mt8188_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "could not request_irq for asys-isr\n");
+		return ret;
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
@@ -3363,10 +3362,8 @@ static int mt8188_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* register component */
 	ret = devm_snd_soc_register_component(dev, &mtk_afe_pcm_platform,
 					      afe->dai_drivers, afe->num_dai_drivers);
-	if (ret) {
-		dev_warn(dev, "err_platform\n");
+	if (ret)
 		goto err_pm_put;
-	}
 
 	mt8188_afe_init_registers(afe);
 
-- 
2.43.0

