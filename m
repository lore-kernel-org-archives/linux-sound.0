Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95FD32B12C
	for <linux-sound@vger.kernel.org>; Sun, 23 Aug 2026 05:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787461216; cv=none; b=RZqTnKcfbK+uXlePnx9rZ7V7dJebsgklE1N6cUQIwsbq1UIKHXnCwViuGSHeEx0SCTkT3lEv1E0xgOYCKKsY9iEzofkibsENhDW4i1k6D1hjkVh2JRVts1BhqC7ScuYO16OeMZeMdFxIVL9W/v406VckOfs5gR377jgi3mBFliU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787461216; c=relaxed/simple;
	bh=3twbRfnqX/9P5GZJs6Qn0AGe+X2EOr8qTXEIjGv0jLc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u+HOgy16TkWAIoI6ovpnIbTmWMbkV6NeTK3EUUKetP+1HxFxUexPcEFCgyg6IcrGC5vyBsY7bihheTTpntgQL95xG3qyv2lUnZJ8itDVm5p+aHPqqasEKNHnVQ3upuooPoB9BM9BJ8pKY3F9wT49hWwgVMBJWgDtlm8RfecPr4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GbqWm1y+; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GbqWm1y+"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso3365724a91.1
        for <linux-sound@vger.kernel.org>; Sat, 22 Aug 2026 22:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787461214; x=1788066014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LHlqmGMbfsxtCYIUcQEVll9m/OkCwVr2FmGex2YgLq0=;
        b=GbqWm1y+vMy0uQXkIVOyGw2fVjWiJ+Ey4FPGUju7VRtheRaxtA5+5ILQFrhAZnnuwL
         SDw12Ksx1StxS9+48jRzhwnr2c61CTJvAs9w9ELJ4m/Wd7YMIcNS7y/j0AmGa9nkvl37
         kUffPAPG9lIBUTZS+Ox9N+5xdmwCXvHMRzjFdo4E+0QNyk2CKi49ZgQyq3oys5osD2bg
         3XjgOkeZHayrnd7QkbttOP2i55ZzOeJSk+Q/y0/WYwWXhO91ffwYf+wmI/1A8QlCf4HC
         cNvHovoAe9fdUB/wwjl7VT2I0JGRfsWL4b6KxYmll6n6Yd/Y/J/pKSPIqHiHmA3N4sT1
         5eZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787461214; x=1788066014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LHlqmGMbfsxtCYIUcQEVll9m/OkCwVr2FmGex2YgLq0=;
        b=RishrkLm3Num4n4B8Z9nr15qNk5ikSgIuMtFt/yAxP5414sGRB0bqNaTI/bsyalbvT
         mjtpr3xv03HxsOstJpUHiwa0U5fSkCBE/buLofVAKqq+24iIFwyjbPeU3WcsZDsnonT8
         F/hA913xXD8aM9lTSjLAwiBjCl7rE0EIG/LvZKceGTVprH2Uw//Gca9isQr+SBvlmYJz
         cC5v616fVkK0CodYHOCd5BsvqgENBPbMnPfdOF+A8nPzzYgbJ0cKm/VdxPg3DEJKtlwN
         hu4hDcBPm88K3UTz2CRD9m+WMLWi0rL7ddk4AjkByw4g9wdJ/atsOXVd9sqyvy997yZd
         TPrw==
X-Gm-Message-State: AFuF++kCADoCaQspBuudCrVnGBAReakFwb0bozcKAlLEAPUflsv74Eff
	6Al8efwQI1PxxWOMoV1vcb7xcEsWlfTaGT8JRnFtGMYYOiM21EpTwraghR+hyA==
X-Gm-Gg: AR+sD10qtO5O5pGS8EJKwqxsQWQ2QygH+/WhNEqgTfUj9rgK9xn6XlEkxtY/96lYOiw
	o6L9NnCpulggyDbvqujMAFzbF3TdK7TaJNwySLIJMfz81o2eBvrV71j1NnUlkebJujwx9Q9rpoR
	q1XW921DElI0z+WS68F9jR54BKqzGJxw/7wJz7PcttRgeVZy+75vTfasN1HeQ6Zanjs2DmwmXxT
	fNcJNj3EvSd1wGWyspDWfJNd4j3sLnf2tabb1D9XXxN3h1hYNFiZEuRq0ChQlBcxnglQg3EgWdz
	zjMptBQzLYWqPOLIoCNOnXnHPfVkuxti3+6qC+Wv/DGT2XLPUiNVwU0L9qdTRPDsYLgHqKHAvm4
	BWhTRMONVln7d8suYId+r2p/ylWM25XWs1nIQO0dos7tNMWMR0hAjK3p6moE5sBQgiaATreHEmc
	taAR/WtHuKz2UwHrPtMnB3FuEO7g18J5uxvXKsz9ugLFcP2wICfRRsn3KJ7Taal3cCzvT4y5GgA
	XNvuYhtEYE4pA3UF3wt6OpB/74VvAouoShISEyI15WBCx/kt/BZ+0H4WdvoYTVEQi9jUG5geIfy
	tMzu+ph4P8B3o5+oVWDRGy7UPI5YNDOxlVzTPw==
X-Received: by 2002:a17:90b:3c84:b0:390:b41a:b92b with SMTP id 98e67ed59e1d1-395c3542369mr34039656a91.4.1787461214151;
        Sat, 22 Aug 2026 22:00:14 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c9128498sm2813642a91.2.2026.08.22.22.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 22:00:13 -0700 (PDT)
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
Subject: [PATCHv4] ASoC: xilinx: formatter_pcm: use more devm in probe
Date: Sat, 22 Aug 2026 22:00:12 -0700
Message-ID: <20260823050012.17067-1-rosenp@gmail.com>
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
Reviewed-by: Michal Simek <michal.simek@amd.com>
Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
---
 v4: use dev_err_probe
 v3: rebase.
 v2: add signed-off-by. Further clean up some stuff.
 sound/soc/xilinx/xlnx_formatter_pcm.c | 79 ++++++++-------------------
 1 file changed, 22 insertions(+), 57 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
index 95312b4ddc5b..3c321c19f829 100644
--- a/sound/soc/xilinx/xlnx_formatter_pcm.c
+++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
@@ -81,7 +81,6 @@ struct xlnx_pcm_drv_data {
 	int mm2s_irq;
 	struct snd_pcm_substream *play_stream;
 	struct snd_pcm_substream *capture_stream;
-	struct clk *axi_clk;
 	unsigned int sysclk;
 };
 
@@ -595,100 +594,68 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
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
 		aud_drv_data->mm2s_presence = true;
 		ret = xlnx_formatter_pcm_reset(aud_drv_data->mmio +
 					       XLNX_MM2S_OFFSET);
-		if (ret) {
-			dev_err(dev, "audio formatter reset failed\n");
-			goto clk_err;
-		}
+		if (ret)
+			return dev_err_probe(dev, ret, "audio formatter reset failed\n");
 		xlnx_formatter_disable_irqs(aud_drv_data->mmio +
 					    XLNX_MM2S_OFFSET,
 					    SNDRV_PCM_STREAM_PLAYBACK);
 
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
 		ret = xlnx_formatter_pcm_reset(aud_drv_data->mmio +
 					       XLNX_S2MM_OFFSET);
-		if (ret) {
-			dev_err(dev, "audio formatter reset failed\n");
-			goto clk_err;
-		}
+		if (ret)
+			return dev_err_probe(dev, "audio formatter reset failed\n");
 		xlnx_formatter_disable_irqs(aud_drv_data->mmio +
 					    XLNX_S2MM_OFFSET,
 					    SNDRV_PCM_STREAM_CAPTURE);
 
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
-					      NULL, 0);
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
+	return devm_snd_soc_register_component(dev, &xlnx_asoc_component, NULL, 0);
 }
 
 static void xlnx_formatter_pcm_remove(struct platform_device *pdev)
@@ -705,8 +672,6 @@ static void xlnx_formatter_pcm_remove(struct platform_device *pdev)
 
 	if (ret)
 		dev_err(&pdev->dev, "audio formatter reset failed\n");
-
-	clk_disable_unprepare(adata->axi_clk);
 }
 
 static const struct of_device_id xlnx_formatter_pcm_of_match[] = {
-- 
2.55.0

