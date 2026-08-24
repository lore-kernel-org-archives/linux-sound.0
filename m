Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BCD2609C5
	for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 20:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787603428; cv=none; b=GeMwkHXC39zUdn7mDS/Owbv/NhyheRJYmizNYseRTg1QITMZJq3vscSXqPZIK965qkfPpqwzBCI6wFM2YwqiqGqRwuLvjuStHwmIizI5Y48p8oHMW7QIq6vfHJVhoNIj7zSIoUVuQcZax9G/I81d4W1CX5RJPE0hjfixazr0n5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787603428; c=relaxed/simple;
	bh=l2RIiRMjDJg5EH4kuElj5V7SMQ9YGWN8uE65Syax86k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aUl7fLWyOfJBtyMzDki7j3pwa28G7p1KJvo/arFLMvr0+9UBwBJjBd2xRkm/7ChOIdGbZDTFnHD/wBfwgOjxaak+yuhb4z9CNaxnyB+MC0x7b26pDvKpSRZI/X9Ra936SEfusd3whDu0NHkgH/Xh8wsQg2AgA0DvndPYsfzNo9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GIBb5pxo; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GIBb5pxo"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84e04df8c46so5275762b3a.2
        for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 13:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787603426; x=1788208226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=61h2VgfdJWdqGSu+H9lxOdRkwIvPdz2MyXbWOLReTlM=;
        b=GIBb5pxoAOomvW/TlaSpGni0j+UQUnRhZ+Il8JmJglkSp5lrcF8uQrVcjlTh85EJX1
         T4QOqCMRmXyHrVuJr0ntFshvrRf9k/REfEiXxKopTYfpuygJnILHTP3Kj+qKQxIsOkH+
         sAzLryoWiMnON4JY4+kh9x/7VE44/A3vq0uNY3Kw++lK8sVifm8o17O/I8Ye0pMp8y0d
         8jIhqFMbyZ/nGPThZVWGpHygQAUjXA8rLOv8D6ssFCFp2ZOtV3zY1ku3Qgu+rG2hOqDs
         8zPJLUL2cW1jlWLL6kt6jUfrXkLNDfLWwkn0OY5zGhTUMAL64rjgvFpo7H6kgkSpDjp3
         Ei5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787603426; x=1788208226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=61h2VgfdJWdqGSu+H9lxOdRkwIvPdz2MyXbWOLReTlM=;
        b=Vrhy6a6o8fQP8lUh1Wc9s1gb7z4Ci+kowc7IOlxTJAYVfqNQt2AohV+W67VA/oNVd+
         8m6nV+5QhQN9LWdt6PKqVphgtLmAVL1bLgmSZyPPWValkNQSXUsRqaM93OdwE6EHsp8E
         RirZTktMcjKg+nG7bA4G8QRayV7jkQGKH/6Rzw1EV4530leSN228uoFwl3WOaWGIKLMI
         NDHPoFOmplSQyfimbA2SDwQVZhTGrYXEFDg37ef4uKRHgjGJjxXaoiYkksqPUwhTWvOX
         rEtrrzMC/xr3O4fE1oHGkjOVG6xM8NcPbg6TztOiE3eDgk8jWJOcABZM8XLhDAl9RqJd
         dWbQ==
X-Gm-Message-State: AFuF++lJSnGclom13I25ABypNi54E2KiP8Yoo5wewhjHSZStGs7t+4w6
	/Fy1aEUHOcrG0qBrzYWI9nMfAUn7xFNqCTAwahq8iDkCu7e2Uz/6I6l2GDNhcg==
X-Gm-Gg: AR+sD1200GwJtuB7o78wegaBz/PbsUX4UpVaR+xn+S6OSsyBfbwEcsCh1ey4DOCwdDP
	A8qq4dR48kQyoKMZbkb5gnvZexFRZlvqXFsyLHOELBuVeotZPbFabnGlTPnV20DYH7V/Fmzh2rz
	dQ0ceGEsiRiLGkgD5T0m20J/OFR5y/fpos571rljJSfM6sT0/AX44URvyW0SoJ+Vq6LksmZtV4E
	JFhN1VNZOQMLxMwlA25HIa2YrCRxlH0HuoMivZ8eZpOu5uxK/es5ncZ0ox7QLRgHn1QR2nlgVz0
	zHNsmtwsSEzJFCiuJcxF8dze671xeaC4gwAIMDhEN6FzqXigF99LRbDj1gioXx9k5FpjiQeqKls
	TgMWdBZrZGruzwJqH7Q0fmwvhV2R+NybMqausBmSLn1nB2r7m68iJSeRdy1KrdWkAulE0FWqBif
	kvveT5vB/owfogItTNDTxZ/VceObpEaxCkWTeaK34WfirOrACdlCSy4soOxyuHNvusnjvU+yybJ
	QI3k5M0r+oWxGImS2ff7NdU7/8yevCQcW8qD99s4k85zO1Cjd3c+dbuZhkAcDyLGkrVVI0ccc+n
	vmAFFm4R/TYLh7wXdvxhVtPSCbL+OeRf33AMqShWjQPRzrcs
X-Received: by 2002:a05:6a00:369a:b0:847:893f:2d0c with SMTP id d2e1a72fcca58-8523c831155mr2621973b3a.5.1787603426483;
        Mon, 24 Aug 2026 13:30:26 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520ef09251sm2440917b3a.19.2026.08.24.13.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 13:30:25 -0700 (PDT)
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
Subject: [PATCHv5] ASoC: xilinx: formatter_pcm: use more devm in probe
Date: Mon, 24 Aug 2026 13:30:24 -0700
Message-ID: <20260824203024.15574-1-rosenp@gmail.com>
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
 v5: fix wrong dev_err_probe call.
 v4: use dev_err_probe
 v3: rebase.
 v2: add signed-off-by. Further clean up some stuff.
 sound/soc/xilinx/xlnx_formatter_pcm.c | 79 ++++++++-------------------
 1 file changed, 22 insertions(+), 57 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
index 95312b4ddc5b..304220d9aaf5 100644
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
+			return dev_err_probe(dev, ret, "audio formatter reset failed\n");
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

