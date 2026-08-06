Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369EC30C16E
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 23:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786059157; cv=none; b=LWWhuiCCpLUt/u7KqKPmIdp6T/D+FFQJOAU2plF3FlP5dww2/ZX4/faB/t2jnIYDT6NsW2VRZNmeu/7dr86dVAalp7vwLFhRuTaExJ4YbTmzOcJw9arlXbEVZvdZzR/Uf3tH6sSGTCTMiBRxpxJOTMqsDohxHczhpIAdvh16EXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786059157; c=relaxed/simple;
	bh=gVAQZ+amyRHuws5F3tdAPZhZOfmuI+TufQC/ISSMwvM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KRTJdRw6yam6cy4I0sLTL3HsaJyif2bM2hjc3tr7o7WMZMv2+hizZ38zlLWLTkovpOKQ76JGu6yYuZ2APkjYN6adK4PWNAu631Wl+EuoczVJRHdulCA3kIvVd+395ROh3UACyOm0gtdhhxLOHQilTELDB9a4zcScSVlCVaxbbJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MtAm+3v+; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MtAm+3v+"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-92e54f8c051so151706485a.3
        for <linux-sound@vger.kernel.org>; Thu, 06 Aug 2026 16:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786059155; x=1786663955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bByA5tzpJTMFYPvaOtMt5JHJJTkEHrdfwgPmDZ1jMOs=;
        b=MtAm+3v+xyeEAs53KqmbmOvY98phSKJAHiihy1EmT2VHQ0J2dxdbUmG5er+zokcMCP
         HDqeehVOJVsAx53Jdl0NcTYgXdMxHG4Z2D6EC0ccweFD7gtRA3lz7/rsJXEHc2LFaEuz
         QEOXqTrCFzHUTi/v+X4R0zifm5drTG6WKFFSOXcws+OjcFcdXwhhZ2SukZqurouTKO5K
         IphLZLmCxFGZwbbGQrS2pHpNN7u5xkNsDcKT9KrT2b/iZtzgnepFPJRLsbfS/EllY8+d
         Sh87F12D+S/r4ls3uipiR4QDRZ8vggiKiSVYApxGEmsLyJeBM8RbbwwpiMJEccI97N7Q
         yvgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059155; x=1786663955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bByA5tzpJTMFYPvaOtMt5JHJJTkEHrdfwgPmDZ1jMOs=;
        b=Zqedar69VLW3lFcVsV+KY3E7PZgRzUvBYwBvkzi2JqxqON6WU6hRuX4wKnCvJWFOWr
         ZIU/Qnaettdwih/LzlG5G7f5aLczr+BnwsP1IamrnMM2aHYTBeqmRBQ1AoAjoWkQOuum
         1eIXiCsw+SZABLeCUuRjGyJqycuk8xeH25YYm4H+u0X3sqet8MQOxZmoa6ac3sxqXwZb
         yAnfqwFyvmorH+xMj0LcXX/7UiKpki4AdOjxt4FHEUTNFwKRwxJaKN6QRPcmkLMq++1p
         hq8qr55bg9FTCUCoAbVEr4SSr9kK73HCfEX4I/anh1G40gj1QhiJn9zcjhhf1PXUiXXM
         7GSA==
X-Gm-Message-State: AOJu0YznbRQe6cVTSmsnrSGEfAyPAH3af809oj0/cubLEoXCknMehzTe
	AEQEIAb8p4I3DUg2wtasVkvlcpbfXr+3e+UdGmrc19JDrDRCwfZOHhHKu5vwJQ==
X-Gm-Gg: AR+sD124FHttSrqYgkRN+PEubKA5xGyQ5TNPdr/U0IMKDdjDmuMvBW3J5qxuwgs5neS
	6oxlCKFE2ulsRH2B24hO79b739OrH0U/zNs6s02+iGCl3D4lO4z92Sd25iRGYfKyfeLi7d3K6sn
	0kpiIebS30QN9pmQ2GkkyvPXedZFGRJlIpdwJjFq++S+3Xywsbl78GqLwHmMWBo0weLQZ0knD4W
	dwOep6WFRR2AGnjbBBm/rnYkIl/Bh1LWu3pYT1GrNCXyxBMo9dIUewJH/TqP0415sV/lDDDKM6W
	TImbQuGjNMpfKJcmZKd0JhkVzoJ20YPwzOZuBQ0dbHiECIGTQnlqsl1qecOz0ZIXK/ihPdgFGAp
	AUM0yPsCwvPQ+0jEp+HdsdTRoJ0Yve2GIGWOGSJa7+dHRgVxEV98npzwJogRIjapEV/N4zYdhaU
	QTHWeANOgko2EltcGHVxLd1uS0XCAMjngMbK/k/n7f6Cs4374fu2qpH9KQeOLJ7GBb4iAEFkz9f
	FQ+ViKYC9h7uFtU7/+EpoLTKJfgDC5Ai/dLDqm++8FNQSsOi3ZOpS5fmiJkglkjik6vbngjkdDJ
	uQvSztdvdFVGOOVrYTsuc5rbMHNN0bukl7pS+u42rdeMGW+E
X-Received: by 2002:a05:620a:628b:b0:92e:f0a5:ac3e with SMTP id af79cd13be357-936490ebca7mr2066666285a.28.1786059155042;
        Thu, 06 Aug 2026 16:32:35 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9366e09dc07sm24753185a.15.2026.08.06.16.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 16:32:34 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Michal Simek <michal.simek@amd.com>,
	Maruthi Srinivas Bayyavarapu <maruthi.srinivas.bayyavarapu@xilinx.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ZYNQ ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ASoC: xilinx: formatter_pcm: pass aud_drv_data to irq handlers
Date: Thu,  6 Aug 2026 16:32:31 -0700
Message-ID: <20260806233231.30631-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The irq handlers take a struct device pointer and call
dev_get_drvdata() to obtain the driver data.  However, the driver
data is only set at the end of probe, after devm_request_irq(),
so an interrupt taken in between causes the handlers to pass a
NULL pointer to readl() and crash.

Pass the private data directly as the devm_request_irq() argument
instead of the device pointer, matching what the handlers expect.

Fixes: 6f6c3c36f091 ("ASoC: xlnx: add pcm formatter platform driver")
Assisted-by: opencode:deepseek-v4-flash-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/soc/xilinx/xlnx_formatter_pcm.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
index 7eba3a0205f1..b50306b0fc06 100644
--- a/sound/soc/xilinx/xlnx_formatter_pcm.c
+++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
@@ -280,8 +280,7 @@ static irqreturn_t xlnx_mm2s_irq_handler(int irq, void *arg)
 {
 	u32 val;
 	void __iomem *reg;
-	struct device *dev = arg;
-	struct xlnx_pcm_drv_data *adata = dev_get_drvdata(dev);
+	struct xlnx_pcm_drv_data *adata = arg;
 
 	reg = adata->mmio + XLNX_MM2S_OFFSET + XLNX_AUD_STS;
 	val = readl(reg);
@@ -299,8 +298,7 @@ static irqreturn_t xlnx_s2mm_irq_handler(int irq, void *arg)
 {
 	u32 val;
 	void __iomem *reg;
-	struct device *dev = arg;
-	struct xlnx_pcm_drv_data *adata = dev_get_drvdata(dev);
+	struct xlnx_pcm_drv_data *adata = arg;
 
 	reg = adata->mmio + XLNX_S2MM_OFFSET + XLNX_AUD_STS;
 	val = readl(reg);
@@ -636,7 +634,7 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
 		}
 		ret = devm_request_irq(dev, aud_drv_data->mm2s_irq,
 				       xlnx_mm2s_irq_handler, 0,
-				       "xlnx_formatter_pcm_mm2s_irq", dev);
+				       "xlnx_formatter_pcm_mm2s_irq", aud_drv_data);
 		if (ret) {
 			dev_err(dev, "xlnx audio mm2s irq request failed\n");
 			goto clk_err;
@@ -663,7 +661,7 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
 		ret = devm_request_irq(dev, aud_drv_data->s2mm_irq,
 				       xlnx_s2mm_irq_handler, 0,
 				       "xlnx_formatter_pcm_s2mm_irq",
-				       dev);
+				       aud_drv_data);
 		if (ret) {
 			dev_err(dev, "xlnx audio s2mm irq request failed\n");
 			goto clk_err;
-- 
2.55.0

