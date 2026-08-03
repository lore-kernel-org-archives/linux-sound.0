Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F74F38BF8D
	for <linux-sound@vger.kernel.org>; Mon,  3 Aug 2026 23:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785799107; cv=none; b=oxSCvwhN1jGfwWP0sCO1xGTXs7Bpz38rT1HvNybavBrfx/qgvCiwsJQXYznNONY1QyfO6cEwpRkQCYoP6ki8pPupjjLwq1znxWGzXsZHW/KRazXlH/IFr/AzwShHm4V5actGHWgJx7EKfPYDPEl5+s1bhxA/V1vH5sfcVwAejBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785799107; c=relaxed/simple;
	bh=1Bi8dYj6PJP8SCx08LdhS5uel3E7MINzk2ww5QBKnvE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a/KIWTqm/VoT4LnehLmm7L5yrsXgkjtll1bHpL/B8MYy5p4VOSsc4NenAst5JJqkxitFMycZdSG6aPahXsZF3ofggziPVzLHRkQ/ah0roke1c0NJhMXRcZaN4lNz6iir/okYymUdWuNE29RrXi3ZOjUeAZimhcRD110xL5+OQ2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Alt4LJ4d; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Alt4LJ4d"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cea3004256so43879345ad.0
        for <linux-sound@vger.kernel.org>; Mon, 03 Aug 2026 16:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785799106; x=1786403906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pNy0UkHqJf4wD9Q7SUQtnbzuWP3YB4RBFtxq12jMuKE=;
        b=Alt4LJ4d/i4F9QpBO595DuyYKeFdCwLeSTfu2PVBbo0E4PweRUsdIVqtPCA64E9KcB
         a0wTUkk9Rj0udOjcDhXbbHSxw+wlgGd2jEJsXij8Y0WmEIUG3dZofvFw8tHcuPhDxKJB
         O55i+pftJspwbIAE6bmnu+s18l7iWFL4cA07i7lx1Ray4/Rml8MWpm7IVXWMt+75ViLW
         fr3JjnPHQUw27VbY4++cwoFsYkYaCC3GLh7Y13M7tT9bIAa1x7CLFf11hlpvux7didoC
         9W3cPPuftaZrN2C280yA8kII2FTaNDTVu5i75b+Q9y+O+PqS12AJDr2xLaSxLLCPR2xR
         rM8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785799106; x=1786403906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pNy0UkHqJf4wD9Q7SUQtnbzuWP3YB4RBFtxq12jMuKE=;
        b=XHgdevy3xRdauHe5LutNRD8uMnZrZ1SpspgAyY3laji4A4TY7+40msBhL1eh3Y/aTi
         KGjR62oK00qdB9Dd3itaBy2it0E9Il/xBxxvkweXTI2Y4glcdvGdsegyyKa+XH42xOGj
         0hwnzkpgp92rtN+B7njA3K0V5lMqdRJVSp2ZQONHg1a/1h7ZPOlmX54I3fNK1db4hJgz
         MZAzeZJdqbrtBQ2Q08XhXgx1KbJeAl+luBompNDzefEbHCayTSQK9nEcyQpbaHx3IDFo
         S+b66DIr0rOP+CE05JpdCOJVXbzHMkdsePlAcD87oNOCPaZGvB2s1mXmOi99Y8LThxlg
         s80A==
X-Gm-Message-State: AOJu0YzSlzPAFUwxn2aiqS6I6LbAULnsjfr6I0rzXsY3DIqfd7xiwpsW
	miYQ9K/S1esgxjJ2n5uoctNKTrQG9JkymWec4Cc2BRs249GN2ICtC8GmA1mdBw==
X-Gm-Gg: AR+sD12SXSOAqRo6rlllnsA18y/56PtyeZU2011KJNylbr6vYqAjFMAS1qRJmY0UT36
	a1v5JT7BbXJV7BVGrV0Xp9UJ0KIDXbs0yA2ILgWuNS7u3wi38AI8rEsbBwktxacDJvnSBEwnIgU
	mSq7vAWPMA+bemUjxi82WN2EX1WVbKV9VHft5P22D857bOUXceyioOqvKV//wrBR3I1VgrrhsBS
	bIL02iIwhUEyFmk+3I80x7ykXAIYT0sfzgDZxl0q282WhhmGVzbOCXzI7L6AXBtnS8UXcRdezGh
	+UcPeHlcJ8I9BMSiLiN9eAd4IveW0jueSkvOLwWkyieN+X5mrMMQaXuB3KnJXBXup3zjM7/15OW
	E/N34N2y44o13MBm/Us5+n2I4nnor9wpQG7pcnatB/iIb9DcxVNZr7Wo72Pu18Ob25wwx6eVgkW
	1a1CRJKlJ8uXJ1cI9WrGMBgNz5hPDndy41i8q1WmXPabcfB61a/dgU1vEscYi+ePj8ab0BxpqRA
	FZ3WCw1EyXCxF0G9FHuCzcAHmgd3uSYJx6eu4nBZcdyD4WBevEHaa8ieh9Lc8PXLhomjoQarITy
	khiatQrO2T7bse9paNXC9GCoyCUrD7o9ugSb4w==
X-Received: by 2002:a17:903:37ce:b0:2ca:1479:d9dc with SMTP id d9443c01a7336-2d05221d3bbmr113140515ad.12.1785799105666;
        Mon, 03 Aug 2026 16:18:25 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04aea0f8asm43349705ad.35.2026.08.03.16.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 16:18:24 -0700 (PDT)
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
Subject: [PATCH] ASoC: xilinx: replace OF with device handlers
Date: Mon,  3 Aug 2026 16:18:23 -0700
Message-ID: <20260803231823.95147-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All of these usages of OF handlers use the node from the
platform_device. Use the device member to simplify slightly.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/soc/xilinx/xlnx_formatter_pcm.c |  2 --
 sound/soc/xilinx/xlnx_i2s.c           | 12 +++++-------
 sound/soc/xilinx/xlnx_spdif.c         |  8 +++-----
 3 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
index 8f7a76758535..55b5b473d85f 100644
--- a/sound/soc/xilinx/xlnx_formatter_pcm.c
+++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
@@ -9,8 +9,6 @@
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/of_address.h>
-#include <linux/of_irq.h>
 #include <linux/sizes.h>
 
 #include <sound/asoundef.h>
diff --git a/sound/soc/xilinx/xlnx_i2s.c b/sound/soc/xilinx/xlnx_i2s.c
index 0676da122edd..273258125497 100644
--- a/sound/soc/xilinx/xlnx_i2s.c
+++ b/sound/soc/xilinx/xlnx_i2s.c
@@ -9,9 +9,8 @@
 
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/of.h>
-#include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 
@@ -174,7 +173,6 @@ static int xlnx_i2s_probe(struct platform_device *pdev)
 	int ret;
 	u32 format;
 	struct device *dev = &pdev->dev;
-	struct device_node *node = dev->of_node;
 
 	drv_data = devm_kzalloc(&pdev->dev, sizeof(*drv_data), GFP_KERNEL);
 	if (!drv_data)
@@ -184,13 +182,13 @@ static int xlnx_i2s_probe(struct platform_device *pdev)
 	if (IS_ERR(drv_data->base))
 		return PTR_ERR(drv_data->base);
 
-	ret = of_property_read_u32(node, "xlnx,num-channels", &drv_data->channels);
+	ret = device_property_read_u32(dev, "xlnx,num-channels", &drv_data->channels);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "cannot get supported channels\n");
 
 	drv_data->channels *= 2;
 
-	ret = of_property_read_u32(node, "xlnx,dwidth", &drv_data->data_width);
+	ret = device_property_read_u32(dev, "xlnx,dwidth", &drv_data->data_width);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "cannot get data width\n");
 
@@ -205,7 +203,7 @@ static int xlnx_i2s_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	if (of_device_is_compatible(node, "xlnx,i2s-transmitter-1.0")) {
+	if (device_is_compatible(dev, "xlnx,i2s-transmitter-1.0")) {
 		drv_data->dai_drv.name = "xlnx_i2s_playback";
 		drv_data->dai_drv.playback.stream_name = "Playback";
 		drv_data->dai_drv.playback.formats = format;
@@ -213,7 +211,7 @@ static int xlnx_i2s_probe(struct platform_device *pdev)
 		drv_data->dai_drv.playback.channels_max = drv_data->channels;
 		drv_data->dai_drv.playback.rates	= SNDRV_PCM_RATE_8000_192000;
 		drv_data->dai_drv.ops = &xlnx_i2s_dai_ops;
-	} else if (of_device_is_compatible(node, "xlnx,i2s-receiver-1.0")) {
+	} else if (device_is_compatible(dev, "xlnx,i2s-receiver-1.0")) {
 		drv_data->dai_drv.name = "xlnx_i2s_capture";
 		drv_data->dai_drv.capture.stream_name = "Capture";
 		drv_data->dai_drv.capture.formats = format;
diff --git a/sound/soc/xilinx/xlnx_spdif.c b/sound/soc/xilinx/xlnx_spdif.c
index ae05818ba064..a70ca6beb646 100644
--- a/sound/soc/xilinx/xlnx_spdif.c
+++ b/sound/soc/xilinx/xlnx_spdif.c
@@ -10,8 +10,7 @@
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/of.h>
-#include <linux/of_platform.h>
+#include <linux/property.h>
 #include <linux/platform_device.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
@@ -242,7 +241,6 @@ static int xlnx_spdif_probe(struct platform_device *pdev)
 	struct spdif_dev_data *ctx;
 
 	struct device *dev = &pdev->dev;
-	struct device_node *node = dev->of_node;
 
 	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -257,7 +255,7 @@ static int xlnx_spdif_probe(struct platform_device *pdev)
 	if (IS_ERR(ctx->base))
 		return PTR_ERR(ctx->base);
 
-	ret = of_property_read_u32(node, "xlnx,spdif-mode", &ctx->mode);
+	ret = device_property_read_u32(dev, "xlnx,spdif-mode", &ctx->mode);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "cannot get SPDIF mode\n");
 
@@ -278,7 +276,7 @@ static int xlnx_spdif_probe(struct platform_device *pdev)
 		dai_drv = &xlnx_spdif_rx_dai;
 	}
 
-	ret = of_property_read_u32(node, "xlnx,aud_clk_i", &ctx->aclk);
+	ret = device_property_read_u32(dev, "xlnx,aud_clk_i", &ctx->aclk);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "cannot get aud_clk_i value\n");
 
-- 
2.55.0

