Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4663DCD99
	for <linux-sound@vger.kernel.org>; Fri, 14 Aug 2026 20:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786740273; cv=none; b=gb3D1zVdcTkl7DNxkiUVZ217UVdMfZDM5X/1iSxZuPOPPXl3wLv9lcHVkC5JMjDiI3khKmrAPI/h++FA/srNLAFdnUt9IQNB/LM/LENxSNkO8m1qgAd45QJgBLLDfxySLRWQxFdLV9hyizDO5QcsuyYrxJ2dfLSkZJHL/y3GhdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786740273; c=relaxed/simple;
	bh=3jOz2+/AE/FKwF4dcS0QwDUJg8ZQdE/0zlfIbQakh4w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yd81Tg+URIxgx2QfM9gkvHP4PzZGYxW9K3/EhlEAEOrk5BNKZDqcANrLqPHiEa6rqmeodYYp3j0iCoRIqIS5KAzNBwCF+I22jtlNSFldmkYC3z+cVDsgTELNOaei4SJB8BjVFJoAhEigsNbPe6Xnn1bF2QzC0JunXsZRIWcblVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kB4G58ZO; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kB4G58ZO"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so1642305a91.0
        for <linux-sound@vger.kernel.org>; Fri, 14 Aug 2026 13:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786740271; x=1787345071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1hCeXpXWagan4BjDtqiET2IflYSGY8D9XYFgH0KLPyE=;
        b=kB4G58ZOwiyo8L+e4bH1ftm6/QZXKJ0cZgH8ZgHQhUK0oDdUpjcAdD65AIbHD4GXeZ
         myxWDvGNlJPwC7kFkSET/zFlUBsNRZ8Nj7t4bBRMPtzUjnh1+/8erGDWIv9bz022E9jz
         19TDugjFIKXKfTNuU2/zdJIHRd5uuAYSTGxdXgUciBzw3By34Nclv7GtNH5xiO5s1Fdn
         tMN0y/Gy9Pl9siNt2Zaa7tRKv0juALGcLobIkq/5t11YH71QyTgfPMhakuOkdtPJZh1R
         gGxR7CWozA4d3TrP0Opglb/b3OO/9p0raxSDqVUL7/hJHLLT3A3UUr9T3QHqCU4cWcZr
         Tz6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786740271; x=1787345071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1hCeXpXWagan4BjDtqiET2IflYSGY8D9XYFgH0KLPyE=;
        b=OTCXxoGnwOOMXJ8hJgDpsuYIJsvDbl4tmiAZfQ0+V4n4CkM3cozasUrhu5OOLcZOC7
         EA5KKcWka8ES6Xn4Wvl+krvPw7Xd+iCyVzYoZk0bwHg9wD66dS1m0RsjFETNYW+R07CF
         QtgvkWvDbvUnysbnLFIyI6abG53jCXZVCYWb4/k/sQQ5UIAnggPmqCSHjX7uk7mMss9w
         j0asSEqtcS4fn8L8lI5ex6HoZKZCN06aGwrX5EaytUC9RtoWALGeqEiltH/lxV6Bu6eP
         Kyj7sgm/IN5Kb3IeceXq1Zjc9llFdh7B2vEqWLUB/yk+pJr4cO3RCt1H9LFF94Id1OAf
         luXg==
X-Gm-Message-State: AOJu0YybmqzpDFQkyYIzh8a/EP6pEbG5cETlpqe5CVUQ0HOgftlAqEZ5
	Eka3K7P3Rt2yqbk1zEHxITujE1Ma39jsKS2ArRtxNa/VXuLusuO0N/JVlduMCQ==
X-Gm-Gg: AR+sD10B3yxbP3+8tWtWrCfg2Vllt5zdFJ1uasOq0P1Z0EgOr9uPmGVP3KUmmy2i72j
	Qk3BXB5ilsa6P+hZUi1Fi6y9URXJwv4CAljwmv9r1OEao7qIVfeHLHP5SqDQmlTINYx33zbOFtS
	6NoWeD2sNcpHMZzC8RKQNtBCRQk1kAR3YkrimHcXwlFkP9SBoMd6ZQKLGHeU2HRN/tHRDUpQqOa
	4uuo4Sn0J9+ecwZ9GpN9q3GtXcnd1ZkAcoWIF7nHDPWLsrQRFrd9lysOI5Wqqrt3qKnD0CdNxrB
	hcupjaLzgSg0oVUKtj1ZZ99DsC1PB1OE9+HYJN1jdwJaRB0HBXKSYzozatsvW3G2WDmqKOIsMO0
	qaXa36Faz5etCCJJ72LfECOwqdXuef2tetSrMwzeacz9XPywOwNdkqZu7trvtDYyfUTUqIQGdZG
	8TbadMYHILB10Hals/nvDqeB/Hl2vE0j9eKbJ6eeRC55QB/X295Y+L28HZVbrot1lECO9RZxqkH
	JJM6nZN0tiRINxnDppZdoW0DKv/i33r2ztntEOzetp5djL/i3SNX3rga8Vkruw58BC1pKuxcMgb
	a2FUJpLPL/15W1Aieg3VF4L2O1sKp5uWD1sxrUE=
X-Received: by 2002:a17:90b:5803:b0:38f:18f9:785 with SMTP id 98e67ed59e1d1-3933cb3b889mr10137670a91.8.1786740271075;
        Fri, 14 Aug 2026 13:44:31 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3933b71e1f9sm1574288a91.3.2026.08.14.13.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 13:44:30 -0700 (PDT)
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
Subject: [PATCHv3] ASoC: xilinx: formatter_pcm: use more devm in probe
Date: Fri, 14 Aug 2026 13:44:28 -0700
Message-ID: <20260814204428.37786-1-rosenp@gmail.com>
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
 v3: rebase.
 v2: add signed-off-by. Further clean up some stuff.
 sound/soc/xilinx/xlnx_formatter_pcm.c | 71 ++++++++-------------------
 1 file changed, 20 insertions(+), 51 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
index 3d6f1e4046d8..5f63fb28ea5f 100644
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
@@ -662,34 +647,20 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
 
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
@@ -706,8 +677,6 @@ static void xlnx_formatter_pcm_remove(struct platform_device *pdev)
 
 	if (ret)
 		dev_err(&pdev->dev, "audio formatter reset failed\n");
-
-	clk_disable_unprepare(adata->axi_clk);
 }
 
 static const struct of_device_id xlnx_formatter_pcm_of_match[] = {
-- 
2.55.0

