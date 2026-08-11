Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7615137F323
	for <linux-sound@vger.kernel.org>; Tue, 11 Aug 2026 18:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786474217; cv=none; b=BTGXxAMU5tmQ4NASsYwrlspqw1Jth5cezhOE/X/RjtBxMykkJ7xi0cf0cHvTwyPI1gLs3mLU1spKqiGYNdlVoF921QYY087OyiBVzVGdEz5HDxOi/DpEtkaDd3Tub6kXAU+TtS7md2kTt97aBk6BxH/x1cH6KCzn2fCWPX6jy9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786474217; c=relaxed/simple;
	bh=sei4l7FniJwlRya5iVYa9jYOU4h8J8q8A+2rt4I7kQE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b0RgBNyk5gctVadfICs3XpTroCPfPh1Lw2No8fhpAPGJC7/XN6qGH6/YJHtTEoD83owSwuVbfYde2LA1FvF615N92bkDEL8slblOV09UdEO5ODMPxnBa+nv0F8+GIa+eEDujG5qTQf8+yzt0Pms5X+80hv1DK09tRqivUTO2ZBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sWFWordb; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sWFWordb"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ce98cb8165so3028725ad.1
        for <linux-sound@vger.kernel.org>; Tue, 11 Aug 2026 11:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786474216; x=1787079016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NgsQJ4VjYv+Gww+JX6UCqUNvdvt9jcjvaOzC6yXUAwM=;
        b=sWFWordbTf6GMP9g/1hd/FAxx2ZYUQHV8WtK/vAT0piFordnmPuEp52i/t9H6791ga
         VF/AN01Yg9R0p1n9btizYlWkjjxp0JtRHnxM8Wfi/e5AFlI1CPVeCG7ZJbKCQsRgRppp
         YlLDDLTJFLp68c64SrzpyjOwj4RBhXaqoZHUnQVDpbOQmUhBNuhWLLAX+jxFcvpDtaWd
         wYbo5ubXZaEkHgXhA45A98vXwQgDuVnTX4zMvZoZ3PwhBqALfOHJmd3dNbLRObTXJC6v
         WjsnXaJKTuWV4J+PZ4LevNKotzQFwM9Bnn3hxRgm5KKMWUrbxtc9eHOta0wJyBjjVXha
         epaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786474216; x=1787079016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NgsQJ4VjYv+Gww+JX6UCqUNvdvt9jcjvaOzC6yXUAwM=;
        b=AdOHr2q/orpIWiuQApkZ6Q8uoM7KvyrqPbjfG69hLHqINU+HOHjqjC1FAB2itw0cCk
         pxZc4F4pKCxPaT1io9zuMbnjFm1dgOUu5S4oVN0B0cJvGD/Z5pYHQSKyvR8hQp33Rml1
         /RL+cMGbg25AZHma7OF2LtzN5CDZ0z3H04Bh7bfX+SmcN076zsUN7EVSw8SB1Kb0N2IF
         G0bdk5NwzTMg4gVVPbJyGh0qBkY3I9i/bkzeH5dsEoZDsvdFXjjrPMPnEeke08nO5qQQ
         ZFQI3wRJ5zJN1Zn0aNLg921qnmuUxVMyV8m4Ro57QpHksq8x6Yau0fa9iJ0jQ6JAUQdk
         r87Q==
X-Gm-Message-State: AOJu0YzfPQ2XdNwY24pubFqYdQgPDwzCCNq3sC9I+eH8svOjuWY3AyM5
	JF5ZLc9RNh6htVYTfDAVwg7VHi80SbYm39XzC09GRNxrhDlIYPWL8LNeHxTf3Q==
X-Gm-Gg: AR+sD13XM1JFY7GZkBSFCP71wjYKNg2aOmcPVdUzHdEYBGP9DhqadCzgvpOH3C2TzfL
	GwSQX8uuRuouh9DiVb7hexcY/QLUEZD8m0O6D/MyHbZyakenvhAP1EJYmxPP+PdjhHdFmCuETxK
	9e41yml6M/o41Tu2rGYnJmel3a6M+UUODxrzI0FaegEbSu4qHMoyvOFsFMxwYGPKTHh+fN1gf3s
	/HbxyJHrEpPPVIH+Y8EJ8J0W2XjVip1A5RU7dLgFD9iS0rRFTqrQX+bfaG1dPapKL60PbahTOvP
	Nkl0i7XTXJq0NRbrBaJblpYWt+IoBRKFcsu8FLHHRo8VQpcjQepuKYFzJiSC0OkvD8FQUzrSWKW
	I60cwmJQQdiDPNGZ6mfWZVeLs6FOX0nRukWP8+VXHENVfYmqhXjgDvrmH8NswRmoSGsdsbdUshx
	h3aRe1kQpINDbX02u9f4wX0gwcYzBSjm2brxIW2hkGti0E1UKgpr+C8f330lRXMjuPELeNf6wsU
	dUvX8blU+1sh1YMxafI4kjtAm6HTK/xOo7+wX9mPJnW5bajW/784KBmTwKd5sop3ZvtRBSDWP+q
	F40lQnKQ50PfGwa+BmUQSuq41FPAz4gIFOUrqw==
X-Received: by 2002:a17:903:1988:b0:2cf:af20:4254 with SMTP id d9443c01a7336-2d32da51aeamr29355045ad.10.1786474215582;
        Tue, 11 Aug 2026 11:50:15 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315ef05fesm11600835ad.3.2026.08.11.11.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 11:50:14 -0700 (PDT)
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
Subject: [PATCHv2] ASoC: xilinx: formatter_pcm: use more devm in probe
Date: Tue, 11 Aug 2026 11:50:13 -0700
Message-ID: <20260811185013.26960-1-rosenp@gmail.com>
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
clk_disable_unprepare() calls in probe and remove. As a result, move the
clk struct member into probe, which is the only place it's used.

Simplify the probe error paths by returning directly instead of
jumping to clk_err, and use devm_snd_soc_register_component() return
value directly. Also remove error message from ioremap as it throws one
itself. Same with devm_request_irq().

Assisted-by: opencode:deepseek-v4-flash-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: add signed-off-by. Further clean up some stuff.
 sound/soc/xilinx/xlnx_formatter_pcm.c | 70 ++++++++-------------------
 1 file changed, 20 insertions(+), 50 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
index 3d6f1e4046d8..eb878c75e293 100644
--- a/sound/soc/xilinx/xlnx_formatter_pcm.c
+++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
@@ -82,7 +82,6 @@ struct xlnx_pcm_drv_data {
 	int mm2s_irq;
 	struct snd_pcm_substream *play_stream;
 	struct snd_pcm_substream *capture_stream;
-	struct clk *axi_clk;
 	unsigned int sysclk;
 };
 
@@ -596,30 +595,19 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
 	u32 val;
 	struct xlnx_pcm_drv_data *aud_drv_data;
 	struct device *dev = &pdev->dev;
+	struct clk *axi_clk;
+
+	axi_clk = devm_clk_get_enabled(dev, "s_axi_lite_aclk");
+	if (IS_ERR(axi_clk))
+		return dev_err_probe(dev, PTR_ERR(axi_clk), "failed to get s_axi_lite_aclk");
 
 	aud_drv_data = devm_kzalloc(dev, sizeof(*aud_drv_data), GFP_KERNEL);
 	if (!aud_drv_data)
 		return -ENOMEM;
 
-	aud_drv_data->axi_clk = devm_clk_get(dev, "s_axi_lite_aclk");
-	if (IS_ERR(aud_drv_data->axi_clk)) {
-		ret = PTR_ERR(aud_drv_data->axi_clk);
-		dev_err(dev, "failed to get s_axi_lite_aclk(%d)\n", ret);
-		return ret;
-	}
-	ret = clk_prepare_enable(aud_drv_data->axi_clk);
-	if (ret) {
-		dev_err(dev,
-			"failed to enable s_axi_lite_aclk(%d)\n", ret);
-		return ret;
-	}
-
 	aud_drv_data->mmio = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(aud_drv_data->mmio)) {
-		dev_err(dev, "audio formatter ioremap failed\n");
-		ret = PTR_ERR(aud_drv_data->mmio);
-		goto clk_err;
-	}
+	if (IS_ERR(aud_drv_data->mmio))
+		return PTR_ERR(aud_drv_data->mmio);
 
 	val = readl(aud_drv_data->mmio + XLNX_AUD_CORE_CONFIG);
 	if (val & AUD_CFG_MM2S_MASK) {
@@ -628,7 +616,7 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
 					       XLNX_MM2S_OFFSET);
 		if (ret) {
 			dev_err(dev, "audio formatter reset failed\n");
-			goto clk_err;
+			return ret;
 		}
 		xlnx_formatter_disable_irqs(aud_drv_data->mmio +
 					    XLNX_MM2S_OFFSET,
@@ -636,17 +624,14 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
 
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
-		if (ret) {
-			dev_err(dev, "xlnx audio mm2s irq request failed\n");
-			goto clk_err;
-		}
+		if (ret)
+			return ret;
 	}
 	if (val & AUD_CFG_S2MM_MASK) {
 		aud_drv_data->s2mm_presence = true;
@@ -654,7 +639,7 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
 					       XLNX_S2MM_OFFSET);
 		if (ret) {
 			dev_err(dev, "audio formatter reset failed\n");
-			goto clk_err;
+			return ret;
 		}
 		xlnx_formatter_disable_irqs(aud_drv_data->mmio +
 					    XLNX_S2MM_OFFSET,
@@ -662,34 +647,21 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
 
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
-		if (ret) {
-			dev_err(dev, "xlnx audio s2mm irq request failed\n");
-			goto clk_err;
-		}
+		if (ret)
+			return ret;
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
@@ -706,8 +678,6 @@ static void xlnx_formatter_pcm_remove(struct platform_device *pdev)
 
 	if (ret)
 		dev_err(&pdev->dev, "audio formatter reset failed\n");
-
-	clk_disable_unprepare(adata->axi_clk);
 }
 
 static const struct of_device_id xlnx_formatter_pcm_of_match[] = {
-- 
2.55.0

