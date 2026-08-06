Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6214B04B3
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 23:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786059498; cv=none; b=orTHbStFUhgnpPv09Ijc3geYQ0Y2LDKIIxDeBTuBorbGF4NI3BnYzIsOsddi2yX0lKDvA2O4xL7xesML5x+mhDx2a8PCHbZq809IGErxnZt+FtV9wnj9Rg98ILhWRUfKR8nVEKKGHErBo5iOYEE2R2UWzhxYgG4wrmkZ76H6ypg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786059498; c=relaxed/simple;
	bh=CkeARuSXF1tZzTFlBNnlyhGKb0BOX72GkpP8uBfRv04=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VigwIiyufQM4DvRVw3Nxfdqiyop1b/LKkqcm4cLKFa6KNxrxkGXUKkOzEcAzsoIoJOgNxN013m2XqYzdShdZDByWqOheZEUYn9HnnlK6XSSoNq66WRkoyShWweLTUgE6s4igapmShanpmqbNt4qqkCcqkVeE4m/4NFqIZlPjdFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C+6muN4J; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C+6muN4J"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d049069377so29968645ad.0
        for <linux-sound@vger.kernel.org>; Thu, 06 Aug 2026 16:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786059496; x=1786664296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hw1ZFxLKa2lyCMPhsVdiZhdCA+z9r+BreiBYhz8zEqE=;
        b=C+6muN4JESrL2LE2Ai8adm01dEB961ErxyPa6GB7Xu1xJSUwX3GM4hmee1sX5Njqd7
         mc+K84OTmNK5q4xAJEk2CNBrVEvXVfSGIu4arghyIgDlxVJUdBUSHilvnWikZsUoGb0v
         JZoPm1scUN/cWDtfwkn9b9dpLaSWcwti2z9nX8vk7QSEkExFF3HS0RtQ3yFjewHWQL1b
         uFLlEAhmqXZpxLEOcmRLN3P+mDk7I3UjWtRon6P1Xanct5Um9UlCZjTe46NbKGkTPCwV
         fe1sKXoC2MSVuAqlMU8VvRXhFY8VZpTDiDbC5J6E1BknSlkq1XKhK3I+n275KQ3cBSqy
         Etsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059496; x=1786664296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hw1ZFxLKa2lyCMPhsVdiZhdCA+z9r+BreiBYhz8zEqE=;
        b=UkVAGv/xnpDisVpuUW8lO1Kyw3tqSN2FFtdNrNyxTV5mmJC3MEWqjHr3K7raQYXmhY
         PD0J6d/l8514UqRk1O6QmYn0+2XFNSWTeYOG1BbRk7n8jF/2gl3NRd4JsDpOmmZwlHhE
         FsRS9nI9mwNFrbK00b59gIYagu9N3S2vjnYdai9VT+jfk0K7t748Os9QE0XGm1E/Th6y
         fMtZsRvcgiAEZ98nKVACkBYGXTntYq6qVGdc1P91O0obd+H5jJF5grGH1BCx9eusaNbt
         KR0pR7nxh5mAB+62yw6cTtMyk5257m3cxPR8s5+QDE0o4JTGy+rMh/zB47zjoop/dS72
         R6aQ==
X-Gm-Message-State: AOJu0YztJy9LEriWYFS+4ILf0v9bPNePmnJkMiRIDHGFoFXyODAGjPy9
	A0RixzzAMt4lNsFTkyLCyRAT/50YP7/69lLfObPbRCqTPTH+Mx8C+9yPPhb8JA==
X-Gm-Gg: AR+sD13FFBzFVW0z471e0CPH5hkDH9FJo546iEPJ7FXlG6TUYglL9o6Tkj8SnaaDN6C
	g5HOGpDR1N45EP/MaACLq3TbcEGVuTh8dKsGhZJ9R4r8Ec0GijUrgKLRVkCqhSabW3G3KJkftoX
	b1AHwxps0v79OPPzUEPd+aJr7DSAE5xoRd1/3XZS/uXeRRQ1h067r2v0a9I9zFCyPlp+gjbbwY7
	MsqXXGWX1pxP/wyLnwadQs9kCT4+iLleoqNx23H79wC4GmsFYGPyVP1lKT9kgnOdD6gqS5hVGvi
	lsn86izG0z4iXgRQoBN9Detz21m8M+jmgr1SpgML29H8ABYplZY7RTdhhjMujujwwBmehBto6SC
	vtjsUbq/6DZclP5xCL+g91pRQwPSGkZ46JMiSahP0r17u+CoZIDsOHNR07kPEtS8dytE6CSXuMj
	Ou2D/S1YS1erWfhzmAq8CJ9uNLkdhkwCHXkGEBoH3hHU0D8xzwnIne0NouDKgHHetS3CKPsbkKi
	fC+3v93x79xW4iCt0DtWP76+F9kx5zEHhJKB+vsDwYP/NtNTn1/aAIgbeZRoFFftjzYibFUIUrs
	13BEgA9DN2H+FPHPvOoyZnr0vcOKxeQuKI/jOXzBFrQyRUWK
X-Received: by 2002:a17:902:dac9:b0:2cc:777f:d67c with SMTP id d9443c01a7336-2d106da916bmr50227695ad.13.1786059496507;
        Thu, 06 Aug 2026 16:38:16 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d16c4e7e7dsm1022865ad.73.2026.08.06.16.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 16:38:15 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ZYNQ ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ASoC: xilinx: formatter_pcm: use devm_clk_get_enabled and simplify probe
Date: Thu,  6 Aug 2026 16:38:12 -0700
Message-ID: <20260806233812.31851-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use devm_clk_get_enabled() to let the clock be enabled automatically
and cleaned up on unbind, dropping the manual clk_prepare_enable() and
clk_disable_unprepare() calls in probe and remove.

Simplify the probe error paths by returning directly instead of
jumping to clk_err, and use devm_snd_soc_register_component() return
value directly.

Assisted-by: opencode:deepseek-v4-flash-free
---
 sound/soc/xilinx/xlnx_formatter_pcm.c | 47 ++++++++-------------------
 1 file changed, 13 insertions(+), 34 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
index b50306b0fc06..948bc604738a 100644
--- a/sound/soc/xilinx/xlnx_formatter_pcm.c
+++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
@@ -593,24 +593,17 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
 	if (!aud_drv_data)
 		return -ENOMEM;
 
-	aud_drv_data->axi_clk = devm_clk_get(dev, "s_axi_lite_aclk");
+	aud_drv_data->axi_clk = devm_clk_get_enabled(dev, "s_axi_lite_aclk");
 	if (IS_ERR(aud_drv_data->axi_clk)) {
 		ret = PTR_ERR(aud_drv_data->axi_clk);
 		dev_err(dev, "failed to get s_axi_lite_aclk(%d)\n", ret);
 		return ret;
 	}
-	ret = clk_prepare_enable(aud_drv_data->axi_clk);
-	if (ret) {
-		dev_err(dev,
-			"failed to enable s_axi_lite_aclk(%d)\n", ret);
-		return ret;
-	}
 
 	aud_drv_data->mmio = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(aud_drv_data->mmio)) {
 		dev_err(dev, "audio formatter ioremap failed\n");
-		ret = PTR_ERR(aud_drv_data->mmio);
-		goto clk_err;
+		return PTR_ERR(aud_drv_data->mmio);
 	}
 
 	val = readl(aud_drv_data->mmio + XLNX_AUD_CORE_CONFIG);
@@ -620,7 +613,7 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
 					       XLNX_MM2S_OFFSET);
 		if (ret) {
 			dev_err(dev, "audio formatter reset failed\n");
-			goto clk_err;
+			return ret;
 		}
 		xlnx_formatter_disable_irqs(aud_drv_data->mmio +
 					    XLNX_MM2S_OFFSET,
@@ -628,16 +621,15 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
 
 		aud_drv_data->mm2s_irq = platform_get_irq_byname(pdev,
 								 "irq_mm2s");
-		if (aud_drv_data->mm2s_irq < 0) {
-			ret = aud_drv_data->mm2s_irq;
-			goto clk_err;
-		}
+		if (aud_drv_data->mm2s_irq < 0)
+			return aud_drv_data->mm2s_irq;
+
 		ret = devm_request_irq(dev, aud_drv_data->mm2s_irq,
 				       xlnx_mm2s_irq_handler, 0,
 				       "xlnx_formatter_pcm_mm2s_irq", aud_drv_data);
 		if (ret) {
 			dev_err(dev, "xlnx audio mm2s irq request failed\n");
-			goto clk_err;
+			return ret;
 		}
 	}
 	if (val & AUD_CFG_S2MM_MASK) {
@@ -646,7 +638,7 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
 					       XLNX_S2MM_OFFSET);
 		if (ret) {
 			dev_err(dev, "audio formatter reset failed\n");
-			goto clk_err;
+			return ret;
 		}
 		xlnx_formatter_disable_irqs(aud_drv_data->mmio +
 					    XLNX_S2MM_OFFSET,
@@ -654,34 +646,23 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
 
 		aud_drv_data->s2mm_irq = platform_get_irq_byname(pdev,
 								 "irq_s2mm");
-		if (aud_drv_data->s2mm_irq < 0) {
-			ret = aud_drv_data->s2mm_irq;
-			goto clk_err;
-		}
+		if (aud_drv_data->s2mm_irq < 0)
+			return aud_drv_data->s2mm_irq;
+
 		ret = devm_request_irq(dev, aud_drv_data->s2mm_irq,
 				       xlnx_s2mm_irq_handler, 0,
 				       "xlnx_formatter_pcm_s2mm_irq",
 				       aud_drv_data);
 		if (ret) {
 			dev_err(dev, "xlnx audio s2mm irq request failed\n");
-			goto clk_err;
+			return ret;
 		}
 	}
 
 	dev_set_drvdata(dev, aud_drv_data);
 
-	ret = devm_snd_soc_register_component(dev, &xlnx_asoc_component,
+	return devm_snd_soc_register_component(dev, &xlnx_asoc_component,
 					      NULL, 0);
-	if (ret) {
-		dev_err(dev, "pcm platform device register failed\n");
-		goto clk_err;
-	}
-
-	return 0;
-
-clk_err:
-	clk_disable_unprepare(aud_drv_data->axi_clk);
-	return ret;
 }
 
 static void xlnx_formatter_pcm_remove(struct platform_device *pdev)
@@ -698,8 +679,6 @@ static void xlnx_formatter_pcm_remove(struct platform_device *pdev)
 
 	if (ret)
 		dev_err(&pdev->dev, "audio formatter reset failed\n");
-
-	clk_disable_unprepare(adata->axi_clk);
 }
 
 static const struct of_device_id xlnx_formatter_pcm_of_match[] = {
-- 
2.55.0

