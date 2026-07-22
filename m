Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A454C6EF6
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 11:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784721183; cv=none; b=VN9PYI8o3igdUgMBy9sUC6OCtKEHQSBs1I/XIVC4ulxsl56LldJF7+DiDagCPMD3VDwCd204xpw2ZgqWcn81n5Zvev/OC6UUNuHpayxB1T6WOleHT/nxNtQF9gOazmjQvkK+obOTOn6hFmvLWPOAEwQThlKCq7DfuYR4LJ/T+hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784721183; c=relaxed/simple;
	bh=Wza4x1liPTjNtoeFDUssCODQy3WMhXwrP1yhFGSPa04=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lL6WJMltr+D+k/yQtZpDPDbv6mw+SCJ88p3+ixC6vhN1BXVK3Jm2bHdkSe01stB6KfXQ8PWJpGiUZSiQRHz/c5jRuEXUVNRkyOLMVRkeeMrdOOA7liU0fIwfV/dupOcbUqPME7DoH24fK7us9yujmAKbTsRpHJpJFdvmf+mG6ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jS6xTbeO; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jS6xTbeO"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cace91f112so130265055ad.0
        for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 04:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784721181; x=1785325981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IoeICiFY2vzSXM+Iy/1wkeuTFUAUTDrBzHwhQ/RHhYE=;
        b=jS6xTbeOkB//KsEbXbesW6FYoz9tUvSEU4Lhu+cX/1BT/Tq8MCE01sZBqybxkhzOiP
         bOjr+p7AeQmdjD/gyb1nirCBoz4vIFu4iwD50lGPKM7/K21YC2XLs0KDlkC+Yqp+BgcE
         wMuKw8N36CC4Zy00zMKXsIxZG5OsqYIgFSnOdGqkiInHUtuA9M4KJZ0VBbHATfADMjA/
         86qoqFhQwTttQaOaNNozb011HeRSFGjA0ckZVEpSbPkPfHcBBSs0IWT8l4COKjoBa9rB
         BgQk/175yDoj3vXxVjTnSl+8MMK3cC+DOJLW9OKPzUTXtYVue48JhLn8WsSaaQ1+VCic
         bXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784721181; x=1785325981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IoeICiFY2vzSXM+Iy/1wkeuTFUAUTDrBzHwhQ/RHhYE=;
        b=IBi4v4/sxjPzopswI9+uo8GMtPkps8Q6EFSdgzqpmRUO7u/dUobxqNwJCxJAxvVGQm
         ypJCrv0KmVbPewZqMpcubBteKYY5CtuQxQi/nYyTSC3dgSM47MH0tVLTBGhZTFeNuzg0
         ZD2h3NDg5kMeQefWybA1uXoBBr7wCWQQNPk/c/2scjM/+yoFOGczTVsXaOdhEL+9Xci4
         Xv0sGaGt2HEbNc5/wz3gDFKinvsCu4O3YZp4NlPfn9o4trtdjdfoRB2/PkNx8flvYk6M
         Ls71mlD0Aa/i791cmUsSbmdlyM0wa5B3DB3QTfncfAvJ5F6YTGq0OJ7onu+IsXkAVCEi
         H9qA==
X-Forwarded-Encrypted: i=1; AHgh+Ro0BXT73Q8AY24Y45YEfv19D+4fol86YTYbD7RL0cQ0aMZYdoYxWP1wGm44TDh2cEmSGZ6IYQBP4A0ODQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YycnW5bCYZl97n7XtZ8zJk2qKDcqkVyCje5Xs+6PWTztb8OqUCT
	TSW+OgTIhurYb6xTM00ZFbo3AIkX7HaEySR4BxSujIQ+BjNZaBNXkKqa
X-Gm-Gg: AR+sD131ktuknxF4Vk7cs1BGERuJgBCAaVFuIvzi0tNkasMJmDUcx+v6paoNzQbt18H
	HTsv2lG67qFMtBkd2Xv5xpr2SdTaonnqWCnsdwo1vL9si8CsRk5Dc1/MmGDEi6a/LJ/HQAd6dJm
	uga2O03LWQu2Rr36WeWBTKIb1SiGshkcJTptviKWrhTutZzMrxw/oxvqu14UFGzKt58vL41dV9t
	n397fDo5cFL2XWr68T9CIJPz31kp3gBX8KKdMty4CxOEWGA8PyWt4b/Mp7nj+ArPcGXk/I6kY9o
	GvQEouGsRpWpqTRdLY1m8+6rNwr4Ye5jz4oirRC71fUB41OLbGPrng1N0buu3uZlBB5NrY5kQjI
	GNEsdWMG8O+u0J2jaWSfsEtv3OKni01FSqHdEXL0bSocz8f4F3ICLS+cKmowVoPGj0OB84GY/ht
	NalMUvm+Ty3TyfvHx63lDliIlDFi7D+Xt3tPkjNOu/ZoO7zWY=
X-Received: by 2002:a17:902:e54b:b0:2c9:b48c:fdec with SMTP id d9443c01a7336-2cf348547d0mr253249555ad.12.1784721181533;
        Wed, 22 Jul 2026 04:53:01 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f2e6247sm13376205ad.54.2026.07.22.04.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 04:53:01 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 1/2] ASoC: rockchip: rockchip_sai: Fix unbalanced clock reference count when CONFIG_PM=n
Date: Wed, 22 Jul 2026 18:52:49 +0700
Message-ID: <20260722115250.62588-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

When CONFIG_PM is disabled, Runtime PM callbacks are stubbed out. Using
devm_clk_get_enabled() causes an unbalanced clk_disable_unprepare() upon
driver unbind, as devm cleanup attempts to disable the clock a second
time after manual disabling, triggering clock framework warnings.
Replace devm_clk_get_enabled() with devm_clk_get() and manually manage
hclk enablement around probe register accesses to keep clock reference
counts balanced regardless of CONFIG_PM.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Link v1: 
https://lore.kernel.org/all/20260622005613.21870-1-phucduc.bui@gmail.com/

Changes in v2:
 - Update the commit message.

 sound/soc/rockchip/rockchip_sai.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_sai.c b/sound/soc/rockchip/rockchip_sai.c
index 585e89f61f0d..9a80e120dbda 100644
--- a/sound/soc/rockchip/rockchip_sai.c
+++ b/sound/soc/rockchip/rockchip_sai.c
@@ -1443,20 +1443,30 @@ static int rockchip_sai_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(sai->mclk),
 				     "Failed to get mclk\n");
 
-	sai->hclk = devm_clk_get_enabled(&pdev->dev, "hclk");
+	sai->hclk = devm_clk_get(&pdev->dev, "hclk");
 	if (IS_ERR(sai->hclk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(sai->hclk),
 				     "Failed to get hclk\n");
 
+	ret = clk_prepare_enable(sai->hclk);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Failed to enable hclk\n");
+
 	regmap_read(sai->regmap, SAI_VERSION, &sai->version);
 
 	ret = rockchip_sai_init_dai(sai, res, &dai);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "Failed to initialize DAI\n");
+	if (ret) {
+		ret = dev_err_probe(&pdev->dev, ret, "Failed to initialize DAI\n");
+		goto err_disable_hclk;
+	}
 
 	ret = rockchip_sai_parse_paths(sai, node);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "Failed to parse paths\n");
+	if (ret) {
+		ret = dev_err_probe(&pdev->dev, ret, "Failed to parse paths\n");
+		goto err_disable_hclk;
+	}
+
+	clk_disable_unprepare(sai->hclk);
 
 	/*
 	 * From here on, all register accesses need to be wrapped in
@@ -1487,8 +1497,6 @@ static int rockchip_sai_probe(struct platform_device *pdev)
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_put(&pdev->dev);
 
-	clk_disable_unprepare(sai->hclk);
-
 	return 0;
 
 err_runtime_suspend:
@@ -1498,6 +1506,11 @@ static int rockchip_sai_probe(struct platform_device *pdev)
 		rockchip_sai_runtime_suspend(&pdev->dev);
 
 	return ret;
+
+err_disable_hclk:
+	clk_disable_unprepare(sai->hclk);
+
+	return ret;
 }
 
 static void rockchip_sai_remove(struct platform_device *pdev)
-- 
2.43.0

