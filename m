Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4950383CC7;
	Thu, 23 Jan 2025 03:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737603588; cv=none; b=KsXyfeqZSiIghAXA7486JFL8/jYHq/Oi+qNOOfXWNGBWEmT/7J3WjHFa/2MwtjFvSvY2eFntDjzeZDn9UX/IF14mkIMD1fQvrA+h3TRyunXIRyFxq6cWE7tULhjJ9h+1ygFrlDp2sGVkzETfxQEC5p7slBhe7WPibuHmR1xwzXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737603588; c=relaxed/simple;
	bh=WNSe71WRDx1H95X78mZD1PIUjIm+A4Q68fJN48hKEHw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AkxFa9Ap01zDdGPXKPQXQiR1CyrN8NdM7nRyo4ok6duFFvuWiH7SgGvcBxVqqG0U9DtuZiF2A9DHrWXwJ3ZPDbM3pUZOWjw/wiFsSEDzeIMirJYRO6kQZ7tFVgi1t8qqnNvcQoDqJm4bc3BKB8X2wezK+d268oIBAdOCE4s8U74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fjp0xqNk; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fjp0xqNk"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-216281bc30fso9122975ad.0;
        Wed, 22 Jan 2025 19:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737603586; x=1738208386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qSxXDdsfwg3DX3fuyumlFfSd8QwOG6ELskTKuWZqeBc=;
        b=fjp0xqNkdRlCkKOEn5hBpgK3cfBw0HnEusdcVpB8C8eWoRPvgql4qrrb6TEdnDPgoq
         N61aShdcINsP38qlrqYSB8oRJAE5ffcB9T75Ol09uxG1bBx7N3sJqaKWsO6IyE/erJWS
         z7NmDBFQEXcKWhRB8yPC9YiHzR9Y61iTl2eMM4gztahvUyFZGuexqMJIbiucmgxqcdYp
         XQEIv/nfP1dhAxHS7YqRRr/s92tJ7oihBaEw4rKr2M2dfQdnpc7i55ntp5pBoYQXZb7m
         BvJJ1XnhwpqoVPV6aEM9/YGvkiGsh6tZh96vNfwtSC8vnSMttBvZi892hfrc4hwrsz0S
         IA+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737603586; x=1738208386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qSxXDdsfwg3DX3fuyumlFfSd8QwOG6ELskTKuWZqeBc=;
        b=P1R2bvx0xf0pEUgL2xzrOi6k5wB/6o5A2eoaEVkJDgAjRNc6QtxUlbxjd7J1iO5hP3
         5gCLeUZgCfv1kM/3cGgHdpPcGBLRW0n2/sF+qqQlvq0XqfdzfIaeFMCGjjA96PRIx2BL
         5bb0GWmrSWTYG7Djw4CyDxJIL9tGs2jAcGSltzR2midUllLE+GJHUS5D2k5fShbor44d
         UyYmByo21nuudeszjzR949ko4c1cT42wmGFv89igm8jGwA8QUsEz5MXB1WYGDR3k4Vf5
         F9L18GOxsHEvA1v4PVeNrJ8UQ6L6GyCAyh0/kLz+XomjXmEuWrXToKtK/UF0DFadP9T5
         iTlg==
X-Forwarded-Encrypted: i=1; AJvYcCXyWrCRixZU+H5knf92cKrzblzjH5raLDyPD9k4cxW7pwFhk5yugopaiiedS9L9xmsul4GQlsKz7tIS7GU=@vger.kernel.org
X-Gm-Message-State: AOJu0YygSLD4/0MKh2bznnJvANRAS2k+INeP+rAsBSLCHqOt1OgvoNOm
	EXP33XQ9uzU19i+QfUpaWuh0di0YNlEYMaLEcXogvWY4VO7KZS4Lp/AH/d+f
X-Gm-Gg: ASbGncstVe3lvNf9pOkKAp18tz4gfTyYy1t5fl72tBa9HTMvVWCByT86B6x5WGh608v
	L4HqymOQLMbg3XxlikCRhYXdOBLF9JR12F9m6vdrUh9k0tfNPAY3Tm0sjMrq9K2xxUM1cUdcTPW
	sKTjvvvGD/a8CuT/Q0YYlw+eHUGPyZmUykLIfOhezihvzgDpKVW7++IUzuXcPajYFzamwQtMFix
	adUZXKdUPWEobYISxX6I1yA1XrnxNTl27Eghe5l0Hvdd0B0mcx6xQNg6J/Yy+Of2/h+Wlr5nHjS
	H0SFEmY=
X-Google-Smtp-Source: AGHT+IGzs7YaH7xUosb4T5Rx0p0nbj50M156Feh1ls5DtnjZHpBSdP8NFsUgf0BM4Ptz2SGD8j7L7Q==
X-Received: by 2002:a17:902:c943:b0:215:a18f:88a8 with SMTP id d9443c01a7336-21c357afde0mr355657805ad.51.1737603586210;
        Wed, 22 Jan 2025 19:39:46 -0800 (PST)
Received: from kiloview.. ([113.240.218.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d402e53sm103920635ad.233.2025.01.22.19.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 19:39:45 -0800 (PST)
From: Luoxi Li <lee.lockhey@gmail.com>
To: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: broonie@kernel.org,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	Luoxi Li <lee.lockhey@gmail.com>
Subject: [PATCH] sound: soc: use to_platform_device() instead of container_of()
Date: Thu, 23 Jan 2025 11:39:37 +0800
Message-Id: <20250123033937.3587880-1-lee.lockhey@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the to_platform_device() macro where possible.

Signed-off-by: Luoxi Li <lee.lockhey@gmail.com>
---
 sound/soc/codecs/rt5514.c              | 3 +--
 sound/soc/sof/imx/imx8.c               | 3 +--
 sound/soc/sof/imx/imx8m.c              | 3 +--
 sound/soc/sof/imx/imx8ulp.c            | 3 +--
 sound/soc/sof/intel/bdw.c              | 3 +--
 sound/soc/sof/intel/byt.c              | 3 +--
 sound/soc/sof/mediatek/mt8186/mt8186.c | 2 +-
 sound/soc/sof/mediatek/mt8195/mt8195.c | 6 +++---
 8 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/rt5514.c b/sound/soc/codecs/rt5514.c
index 2b3c0f9e178c..9cb74962161a 100644
--- a/sound/soc/codecs/rt5514.c
+++ b/sound/soc/codecs/rt5514.c
@@ -1091,8 +1091,7 @@ static int rt5514_set_bias_level(struct snd_soc_component *component,
 static int rt5514_probe(struct snd_soc_component *component)
 {
 	struct rt5514_priv *rt5514 = snd_soc_component_get_drvdata(component);
-	struct platform_device *pdev = container_of(component->dev,
-						   struct platform_device, dev);
+	struct platform_device *pdev = to_platform_device(component->dev);
 
 	rt5514->mclk = devm_clk_get_optional(component->dev, "mclk");
 	if (IS_ERR(rt5514->mclk))
diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 0b85b29d1067..3f6080e6b8a1 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -175,8 +175,7 @@ static int imx8_run(struct snd_sof_dev *sdev)
 
 static int imx8_probe(struct snd_sof_dev *sdev)
 {
-	struct platform_device *pdev =
-		container_of(sdev->dev, struct platform_device, dev);
+	struct platform_device *pdev = to_platform_device(sdev->dev);
 	struct device_node *np = pdev->dev.of_node;
 	struct device_node *res_node;
 	struct resource *mmio;
diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
index ff42743efa79..fa0f5258e33c 100644
--- a/sound/soc/sof/imx/imx8m.c
+++ b/sound/soc/sof/imx/imx8m.c
@@ -144,8 +144,7 @@ static int imx8m_reset(struct snd_sof_dev *sdev)
 
 static int imx8m_probe(struct snd_sof_dev *sdev)
 {
-	struct platform_device *pdev =
-		container_of(sdev->dev, struct platform_device, dev);
+	struct platform_device *pdev = to_platform_device(sdev->dev);
 	struct device_node *np = pdev->dev.of_node;
 	struct device_node *res_node;
 	struct resource *mmio;
diff --git a/sound/soc/sof/imx/imx8ulp.c b/sound/soc/sof/imx/imx8ulp.c
index 6965791ab6ef..0704da27e69d 100644
--- a/sound/soc/sof/imx/imx8ulp.c
+++ b/sound/soc/sof/imx/imx8ulp.c
@@ -155,8 +155,7 @@ static int imx8ulp_reset(struct snd_sof_dev *sdev)
 
 static int imx8ulp_probe(struct snd_sof_dev *sdev)
 {
-	struct platform_device *pdev =
-		container_of(sdev->dev, struct platform_device, dev);
+	struct platform_device *pdev = to_platform_device(sdev->dev);
 	struct device_node *np = pdev->dev.of_node;
 	struct device_node *res_node;
 	struct resource *mmio;
diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index c4d92f3508b6..2bb77f6d87aa 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -410,8 +410,7 @@ static int bdw_probe(struct snd_sof_dev *sdev)
 {
 	struct snd_sof_pdata *pdata = sdev->pdata;
 	const struct sof_dev_desc *desc = pdata->desc;
-	struct platform_device *pdev =
-		container_of(sdev->dev, struct platform_device, dev);
+	struct platform_device *pdev = to_platform_device(sdev->dev);
 	const struct sof_intel_dsp_desc *chip;
 	struct resource *mmio;
 	u32 base, size;
diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index 536d4c89d2f0..cae7dc0036c6 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -109,8 +109,7 @@ static int byt_acpi_probe(struct snd_sof_dev *sdev)
 {
 	struct snd_sof_pdata *pdata = sdev->pdata;
 	const struct sof_dev_desc *desc = pdata->desc;
-	struct platform_device *pdev =
-		container_of(sdev->dev, struct platform_device, dev);
+	struct platform_device *pdev = to_platform_device(sdev->dev);
 	const struct sof_intel_dsp_desc *chip;
 	struct resource *mmio;
 	u32 base, size;
diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index 9955dfa520ae..31437fdd4e92 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -238,7 +238,7 @@ static int mt8186_run(struct snd_sof_dev *sdev)
 
 static int mt8186_dsp_probe(struct snd_sof_dev *sdev)
 {
-	struct platform_device *pdev = container_of(sdev->dev, struct platform_device, dev);
+	struct platform_device *pdev = to_platform_device(sdev->dev);
 	struct adsp_priv *priv;
 	int ret;
 
diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index 6032b566c679..371563d7ce79 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -228,7 +228,7 @@ static int mt8195_run(struct snd_sof_dev *sdev)
 
 static int mt8195_dsp_probe(struct snd_sof_dev *sdev)
 {
-	struct platform_device *pdev = container_of(sdev->dev, struct platform_device, dev);
+	struct platform_device *pdev = to_platform_device(sdev->dev);
 	struct adsp_priv *priv;
 	int ret;
 
@@ -341,7 +341,7 @@ static int mt8195_dsp_shutdown(struct snd_sof_dev *sdev)
 
 static void mt8195_dsp_remove(struct snd_sof_dev *sdev)
 {
-	struct platform_device *pdev = container_of(sdev->dev, struct platform_device, dev);
+	struct platform_device *pdev = to_platform_device(sdev->dev);
 	struct adsp_priv *priv = sdev->pdata->hw_pdata;
 
 	platform_device_unregister(priv->ipc_dev);
@@ -351,7 +351,7 @@ static void mt8195_dsp_remove(struct snd_sof_dev *sdev)
 
 static int mt8195_dsp_suspend(struct snd_sof_dev *sdev, u32 target_state)
 {
-	struct platform_device *pdev = container_of(sdev->dev, struct platform_device, dev);
+	struct platform_device *pdev = to_platform_device(sdev->dev);
 	int ret;
 	u32 reset_sw, dbg_pc;
 
-- 
2.34.1

