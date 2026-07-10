Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870BB3783C0
	for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 05:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783659771; cv=none; b=aXz2/cDT1jPMBNS8otQ5HUoIjt8JMImsa5w8jxF65CX6HIVs7Fp0xqmTc9jm1xhVSWkI8zYg0Q7ayN/B6jWvCFhTsQ840qK9YEorKOJXRp6OpPx0ZWMwKl7sJrVj5mlyQdj5UxON9H8joOzFMEpvzRfL3XmjipndpL/bPrj7/fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783659771; c=relaxed/simple;
	bh=bBq3/syN7TJ3bwHiSJzar76LqfWy2MrbF09Mxs14XPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TLZ1J63oMHmEu7QfNc5jN6f18UEwhcMlerE/BCmUH+r6lMYOc8fPDTZLYm2sjzVNiQ4njmldU9nOGm1J+VafgDKcUJXJu+3HPIbm29fp81keGeFNx4cKcws/a2kE5jitRx/x7jjxhEx6FUXQ0vjAeQpV+2H78zM1lg+G0afNIWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JlRGHtFa; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JlRGHtFa"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-382a3fe0d28so633819a91.0
        for <linux-sound@vger.kernel.org>; Thu, 09 Jul 2026 22:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783659770; x=1784264570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ycIvlxwe0x12FPCgy021uD9ce3/L5Ep6ZuVevp5ozGk=;
        b=JlRGHtFaI+edGyWZA1PRSwXX4VVlpf9ztX1FkXIrb7MMDtIw9vwIyI7MFjMEO7FfpL
         LD7UkDpgBFqElv/4nAU7AFmzz34DWc3TfX+jFP7iOVXWeq6UFYusTFOxyCq1LiLQIM3c
         Q7ekbxVF7/2qVAEUFpC1Dy7AklNQIc518fLL4INDUCilKtnFxuimI4yBgCUf32jciR98
         iIJSk9O2955MSbYB9C8j6MPWsBbBxamggYIHiIB0VdtUAbgNfc1B+gMrc+7DBM558hjd
         WsF2BpQ8Vrjb/W8MJExjkSHgmhJFyEGDknRZfvXA/Exc3pb3sA0VQ2O/Ij/DLdi0uXDG
         MXRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783659770; x=1784264570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ycIvlxwe0x12FPCgy021uD9ce3/L5Ep6ZuVevp5ozGk=;
        b=kKdelkGWSs7/8eaFU6ClB2sjFILX6NUFv5DG8e7kp2XOV8qUK+4m9vWH6+fW8Ou7lD
         WrWgXKpT6cnEYoTFFJ8Qu84MYWe0/GMXPs1G8XU7cB0FjmZYa+wPV3D2GNBdjkyPrYoA
         /wCJ0tqDxSnsOlCzbhfox07GHmhIJqM9/Bca40DuUdKgCGuTJtLBxhxkOq5G6oWtBSNw
         wOyYOcOaDO/7ML5O1i0/tbz/3J5wc240XNUUL3D38NHjRBhvMRc6tAzc6asrII5v1AZp
         IcWKlOzoy/czfSxBBiQz1BM7948phh1Y5Miz0iTb4F4j55FBDRq2xWkgRHmAW221Z7iH
         7L4Q==
X-Gm-Message-State: AOJu0YxTtM3hY1n6Tfzfm2qg98l+U9gjEPOhNHSYhky19C/lpC0TqqUY
	+2Y5pCXGDamUMa7Di/lIDlBSyti7pVmkjm9dplELUFMWhSQqxucpBuDf
X-Gm-Gg: AfdE7cmaKnT50RM+iQWI9lNj0md510OvoJfTT0jEAgfncbK/mpvMfgxMzyHL/EUhW4A
	fFFBglp1JCeVm7Xi/IdycNBvvAZFm565R5X76F//icaBUbHEO0mEjuOQOoGyiUZRgsNw7kc5E0z
	idqrfSyGo+PCY6GIRku9ij3TDRh6CdgOXTG87N8hgwCk+AeCPRrpNvs9WgMAf66kddWNSooKRXy
	OxKrASY2xKt5/+4XijsVI28EmrvmimaCPcq2lmBZqfo4RF7DbwdOFUnuLyQGYZYGxpfgfFxuyWM
	DEde74phcxEdSpYOzQ9yiBBqd1+na9FGEclpArL4IhOF5Ch0BfBpYnmWFpygSk8aaeLptjUOeMd
	wiolY6m/iumuOXdCDhhX54YeOwiSh1O3wLP1IzmY9GIySGiga2BaJ6ZkZTOa+Q28oQwn+s5Uyik
	s6BR0o1q9L/E8tqZJQLnxkKzB30A+HHiPexIbswCketY4VR08=
X-Received: by 2002:a17:90b:3c4a:b0:381:21ea:912b with SMTP id 98e67ed59e1d1-3893f693923mr9181403a91.1.1783659769825;
        Thu, 09 Jul 2026 22:02:49 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5516ad85sm2139647a91.2.2026.07.09.22.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:02:49 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@amd.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/2] ASoC: xilinx: xlnx_spdif: Use dev_err_probe() and drop redundant error handling
Date: Fri, 10 Jul 2026 12:02:23 +0700
Message-ID: <20260710050223.14266-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710050223.14266-1-phucduc.bui@gmail.com>
References: <20260710050223.14266-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Use dev_err_probe() for probe error handling where appropriate to
simplify the code and properly handle deferred probe.
Also remove redundant error messages when the called helper already
reports failures, returning the error directly to avoid duplicate
logging.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/xilinx/xlnx_spdif.c | 30 ++++++++++--------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_spdif.c b/sound/soc/xilinx/xlnx_spdif.c
index 017a64ab9f1e..8f4d238be890 100644
--- a/sound/soc/xilinx/xlnx_spdif.c
+++ b/sound/soc/xilinx/xlnx_spdif.c
@@ -249,21 +249,17 @@ static int xlnx_spdif_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	ctx->axi_clk = devm_clk_get_enabled(dev, "s_axi_aclk");
-	if (IS_ERR(ctx->axi_clk)) {
-		ret = PTR_ERR(ctx->axi_clk);
-		dev_err(dev, "failed to get s_axi_aclk(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(ctx->axi_clk))
+		return dev_err_probe(dev, PTR_ERR(ctx->axi_clk), "failed to get s_axi_aclk\n");
 
 	ctx->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(ctx->base))
 		return PTR_ERR(ctx->base);
 
 	ret = of_property_read_u32(node, "xlnx,spdif-mode", &ctx->mode);
-	if (ret < 0) {
-		dev_err(dev, "cannot get SPDIF mode\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "cannot get SPDIF mode\n");
+
 	if (ctx->mode) {
 		dai_drv = &xlnx_spdif_tx_dai;
 	} else {
@@ -274,29 +270,23 @@ static int xlnx_spdif_probe(struct platform_device *pdev)
 		ret = devm_request_irq(dev, ret,
 				       xlnx_spdifrx_irq_handler,
 				       0, "XLNX_SPDIF_RX", ctx);
-		if (ret) {
-			dev_err(dev, "spdif rx irq request failed\n");
-			return -ENODEV;
-		}
+		if (ret)
+			return ret;
 
 		init_waitqueue_head(&ctx->chsts_q);
 		dai_drv = &xlnx_spdif_rx_dai;
 	}
 
 	ret = of_property_read_u32(node, "xlnx,aud_clk_i", &ctx->aclk);
-	if (ret < 0) {
-		dev_err(dev, "cannot get aud_clk_i value\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "cannot get aud_clk_i value\n");
 
 	dev_set_drvdata(dev, ctx);
 
 	ret = devm_snd_soc_register_component(dev, &xlnx_spdif_component,
 					      dai_drv, 1);
-	if (ret) {
-		dev_err(dev, "SPDIF component registration failed\n");
+	if (ret)
 		return ret;
-	}
 
 	writel(XSPDIF_SOFT_RESET_VALUE, ctx->base + XSPDIF_SOFT_RESET_REG);
 	dev_info(dev, "%s DAI registered\n", dai_drv->name);
-- 
2.43.0

