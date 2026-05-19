Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E24229B12
	for <linux-sound@vger.kernel.org>; Tue, 19 May 2026 01:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779152673; cv=none; b=Ihur2sNcgwHdZSmkwhDaKzwDidEz0235CZIBlQ3NGYgAuk1L2c56Ov2nMPvMO+kqC+hjP1Y/SZjDUelyapskTY0wAMkZ+8q30M4Td9G2EDX+Y+Wua1shu10slY5zP6YIMatDBuXvx4ieGZ0DM/V4VYPBdGNFAg3KBhEmaWyVt5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779152673; c=relaxed/simple;
	bh=I1lBZvuskjd9OZNrTxPW+xdzEXdgqIJibv5i+eVYhI0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PoB7llQR4tXBS9b5OODGNf42uhVC0QA060pY4SdA0PE02L7z+y7FQ4hKd2leX672rozZiSW7vvf/EJtM7m3M93CqgNbhRpAmerrLv4q03WhgRCYN4dLEZkhtkK/07Hmc/7e0j5BBkyPdi09vD2vWaXpCzrxEnLDNaAoE+yLLtz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ESgWBXer; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ESgWBXer"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3665b67ed66so1776803a91.1
        for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 18:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779152671; x=1779757471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oXHtsnBY1AjSAv+HlUFo/FYDsuTcP65qwKVLI9BrKvM=;
        b=ESgWBXeroS1x9UHTZMW4VKwShu8I12v5ynXnHpg3WLAkb+zRNLmW7HgGBsX7ieNbPt
         /ceLkJtT07xXDuQ5XprSHO2QRI7wNfAkpqyYZS4y2rCoXSOlzcbGu5+1M7dryXOp6uoa
         xZvyIFzGUiqOkgxaPwjWOFjArCZ8etICtHO+7U+xYUiRMN9FkVFpQvwdJGFQoPgAQbn2
         x1EF/Te3Pb5mz1TMcJfbNwUqyMRpZCeCQn3TDXk8+/POsEyLZeYW74gPeoF+90ccOF25
         NPcSPvi1oMNopnx+++p8OQY5WH6ABZZ/gjTURHBYeH8UgnTGP/WyDNFM9TM5A512PnTM
         vNPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779152671; x=1779757471;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oXHtsnBY1AjSAv+HlUFo/FYDsuTcP65qwKVLI9BrKvM=;
        b=AqZVq5rx2gL4KpDrTrECrmUQpiymwqwY5PUy+NacHeNlu1tgolMTOjgfAMNf8g9OBS
         CYOrBKy6DirDAjy+F1tiP2xr8mPoCIqOke8UC56Gl0uWYfLEEg841PPWCKGhswjQ6GAV
         yABsjaRFsTSj77zNjV7tw0mzS92RJZa6dtrE3BeUtha1zxXiss2b7SPN4aBKOkRiE5ys
         chLfsy+Oy9t5iUgKiGeCeckQrlL/Xv2+mTKxff66Sd4dUM75bux4DUgP+m0n2Jsoxv9g
         74x7QoOJz6GxRjfMBXVPNhdj3nHlYt/Q/eeOC0H85iekdlr7J7ho+elJLqjLCs6MDUQP
         G8tw==
X-Gm-Message-State: AOJu0YxVUZrvblfwuQ5GenkfkodGZ8si9X7cF4shZQfTTZzULj2kbZW8
	DWTITZzEWvVYxtHxJj5MB14GQzxTPvhT5AGJHmuoTeHPCJxDVB08t7FZsYhUjhOZ
X-Gm-Gg: Acq92OEF8IxlK5kEkYP54nqow2LjtGfNMdslicAbeGlpM/d1iI+wh5jr2ACqbD28/tR
	r80O3rjgZKQbcCV1VD9esdh06qF23PMS2nfOVsAqDNQ+wT3hoRfYbPpzsST4EMBBwh4XchAoM1z
	TL92UYSuGAnBIY872vjA7howNDAnmo3AUAU/j+yE14cIRAU2hMuODKwRUeZWiBfijdGwbZXysbc
	ULqW7xBwQwLGlem+iv+7VYZwkklYpoUNfIxrUKuwZgozmt45Ji5VTxze7mzjYtht5mQcWDtsTBW
	zmw4TvytlOidSogMujRZZ+a5BQbPrptKaP4sutD27aNVtBDO6hFHu22yE5r8kh2s6+8kaQJxKpx
	eApfoZ5eo30zIZHOw/fGGhvl3R1We2zZBztXIDLMd44dnk8Ixb1aUyL0J7EcOLAuQKohhJJwTt3
	iUTB0k0dgQIF+iMgOcSX/NCZKc/HqR+wqZHsWNrbBXAjXP41Q9SJxNyHKjYEdvLYVX8FyYwLXVy
	IvrhSAN50jDQfx+mOSWSdazGvo//Hl+pPKQh6T1lUk1Qg==
X-Received: by 2002:a17:90b:4a:b0:35d:a0b7:9608 with SMTP id 98e67ed59e1d1-369519feb17mr16805439a91.7.1779152671266;
        Mon, 18 May 2026 18:04:31 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951278e7fsm12177196a91.8.2026.05.18.18.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 18:04:30 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH] ASoC: mediatek: mt2701: allocate i2s_path with priv
Date: Mon, 18 May 2026 18:04:13 -0700
Message-ID: <20260519010413.629214-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a flexible array member to combine allocations.

Clean up surrounding code and allocate based on afe_priv and not
platform_priv which is a void pointer. struct_size needs a properly
typed pointer to work.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/soc/mediatek/mt2701/mt2701-afe-common.h |  2 +-
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c    | 21 ++++++++-----------
 2 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-common.h b/sound/soc/mediatek/mt2701/mt2701-afe-common.h
index 8b6f3a200048..c9477bc24ee9 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-common.h
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-common.h
@@ -89,7 +89,6 @@ struct mt2701_soc_variants {
 };
 
 struct mt2701_afe_private {
-	struct mt2701_i2s_path *i2s_path;
 	struct clk *base_ck[MT2701_BASE_CLK_NUM];
 	struct clk *mrgif_ck;
 	struct clk *hadds2pll_ck;
@@ -99,6 +98,7 @@ struct mt2701_afe_private {
 	bool mrg_enable[MTK_STREAM_NUM];
 
 	const struct mt2701_soc_variants *soc;
+	struct mt2701_i2s_path i2s_path[];
 };
 
 #endif
diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
index bb459faa6e05..d56b498e8c0c 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
@@ -1593,6 +1593,7 @@ static int mt2701_afe_runtime_resume(struct device *dev)
 
 static int mt2701_afe_pcm_dev_probe(struct platform_device *pdev)
 {
+	const struct mt2701_soc_variants *soc;
 	struct mtk_base_afe *afe;
 	struct mt2701_afe_private *afe_priv;
 	struct device *dev;
@@ -1602,23 +1603,19 @@ static int mt2701_afe_pcm_dev_probe(struct platform_device *pdev)
 	if (!afe)
 		return -ENOMEM;
 
-	afe->platform_priv = devm_kzalloc(&pdev->dev, sizeof(*afe_priv),
-					  GFP_KERNEL);
-	if (!afe->platform_priv)
+	soc = of_device_get_match_data(&pdev->dev);
+	afe_priv = devm_kzalloc(&pdev->dev,
+			struct_size(afe_priv, i2s_path, soc->i2s_num),
+			GFP_KERNEL);
+	if (!afe_priv)
 		return -ENOMEM;
 
-	afe_priv = afe->platform_priv;
-	afe_priv->soc = of_device_get_match_data(&pdev->dev);
+	afe_priv->soc = soc;
+
+	afe->platform_priv = afe_priv;
 	afe->dev = &pdev->dev;
 	dev = afe->dev;
 
-	afe_priv->i2s_path = devm_kcalloc(dev,
-					  afe_priv->soc->i2s_num,
-					  sizeof(struct mt2701_i2s_path),
-					  GFP_KERNEL);
-	if (!afe_priv->i2s_path)
-		return -ENOMEM;
-
 	irq_id = platform_get_irq_byname(pdev, "asys");
 	if (irq_id < 0)
 		return irq_id;
-- 
2.54.0

