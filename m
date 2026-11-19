Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084481;
	b=nFpW52x8Lfg6zGvIYn1VU3EyithuRiLy//c3HHBNxxGjygNDJxnGLQBbEY59ag2qRs9z
	 GRdyf4tHNrqeF+/GY1LLkW1cHb8829RjGFIszEPmSwvKl43GvFZs366m9l2plVIip127l
	 QVhrvIO91chQeCCG7nw8L0MO0s7gW74fVt1PxDWHmxNCOMXQU//JtqztOYqrpozM59a5E
	 vqTN8X/FVfdCCgusSoL/FOUDFD0I2rXvk5fTXeRSVP+9TeEAlMMvEj377F76MQOSUwMlt
	 3X8amuxU35icWjf57Z7Rc1cX47UH725dAYLtAmtIvJ62U2S9/qTPI0NsBBQOTbQob+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ku1LNAdK9+Sshw+wLpGB4DZKU6CyeOx3BEylFZHlcIU=;
	b=ZGMShZgQ99Ri6XPvDUl9xn/VE/CKCq7ja9SeI+fMQ/bc1IOUXYFFjuf1st+6HCCrJLE5
	 mZjP10a+GRXH7DS8VAWIiwVe1qZh/KR1gXIAZ/VcpUJRUK1k8zNx0iecUaAseoziICAvi
	 JLRhT1r4yzOr6rTFgP9zRZL4HqOxeOe6Wu5YS/3M/bNO/9zzYjVOGGJkrE0kZAHLbIyzJ
	 WcPIpR43f1ayxqTjssnb/WaBrKBAEity1MGC0SES6bUKHj/f5qwZWF5Q9ouViqQfcBGLv
	 A6m7TP+ms7avQ/vFMJ34SqkXIXslHTd8TC3sT0B34FaIno0cvfVCWolVbZUOtwn0AcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mYUNWGDE;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4879D606A339
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 10:34:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4879D606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mYUNWGDE
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b402824d07so262744a91.1
        for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 02:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795084481; x=1795689281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ku1LNAdK9+Sshw+wLpGB4DZKU6CyeOx3BEylFZHlcIU=;
        b=mYUNWGDEwnbsX7jaSFNNTy3mEIrxRynuj8No94Ygc3RIVR44fOQnAC1BPG8dUKO2TY
         8culHafC2z4hTKVW9WDtKOyFiPN/OlvZw8dHN+peW+CKph1sH8b0XQ4xwx4/BeWfjBOQ
         DqI3toX3L7u7PNXbAw/f2EZZ4pitCH/UcRLchnQfa5MJcFm6cGMznQA5hm5r9PNCSZiv
         vqlmWanKmd+015wBAXIEVBlhYd6GxSFRRmG+gk6AZx9ta3tHekY/YYuTyflozjTdPpIB
         FmeFHewar/tFR40IXr0I3kaQDy09uZ9hH4CYrpSF6pIW9UlfnDglQz8kaqDj8O1yPOxt
         1VCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795084481; x=1795689281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ku1LNAdK9+Sshw+wLpGB4DZKU6CyeOx3BEylFZHlcIU=;
        b=C1Jana06pqVPH29pae6TCSFwE9pwoQTD1C2VeO023tqZbB8Lvb1VSqKFsSOFX0w7uc
         RMLhr5lA39wCtW0hJWOnSuXqtSUInhxmp8SnRfvr7wzG0ySC4ckvGkPbpdDE7N7cwJl8
         ATj/OOM9V4SD2JDNDAVN3WNzqEf5OAb5y8U2xKbN0G20uTxxuhGy7uwtuICxDhg+ArO+
         /831kZbCCEUOJruAUnHasmIjDNy5VUrraLMoE4cvmWRFRLwM3p6LfjfY7ymHMmtcvK/u
         wLOUEs/d3e0cVEzFzWTe7RFqu8kNNy4bttMBJrf78sLeL8qYhodUyxCfLTvdqZgRYotq
         t0mg==
X-Forwarded-Encrypted: i=1; AL+hErGa3Z1Zt9QglCjbmFtDQaox+llqUJ1d2kZGjoIHiCTWUi7gPAgoW8oZExwyrAPlRWwIATv/+b9MeU4qqg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8orSLdXOKtRTm2mYyco0gY1YXJHxQCFRVfXWtKxBq7bOjqlso3
	I6jjE0Ua9SpVMUdd2F+FHm+2ObQg9DTxgCFRUt3jvqsnKp4Ou84+fQCN
X-Gm-Gg: AZFdTZfvNNqw3noc6+y7pe3O32sLARDP3GBCJpJb/afyNQNY2eH6T+XBLXfh7VeEhoC
	u1SoV59/7qX4kwuRn3OMNQ/VzffuA+CbAUHwCT3zaU0CbzIK0bBvpjBkh4RFpi49uwgpMeBvvZb
	N4k8JV0il2IDtG2mn+ABYkWwtOI3dhpE7DFmMCka9NnjvHhYzaEAEUz9pDJAVNidTezRfADIl0s
	b+Xryrs7OurFDgq3SFatHTQFi5xjlzlevTHeCgwzQhrdk4Cd73LZQgxWMPLdIF3bREMu/rpq5Ed
	RNWJePpX23PlaOXE+yj7VSvDyAmeJIAqYjzTFx00ZBQGo+f7wi6Jw2o/Arrdfq8KPO07VLfLZjJ
	vjdBQyjDBeY2xKHSo1TfR6Tw06fYAIBgkN5eyKy89X70Kzn4e3CdYN+XQeaHsOh1ndKA7Hw2Acf
	k/eunHuZrC585SL9io0FLy8RYoD/COAqoaCiJWo42kGOuzwBcGh6kNGZwDCtkn9MlJqB6kUpaP7
	mpmrfqlUoBwSzmAobDbAhu98Cp1DnXeRnCJR0D174gZ0P4NzywGmlOiO2YJ9DWRC+cKYpl3MCYf
	lhPHIsxSxdQ/+1OkNgqISQMKJfRqojo+aRdDym0minS1Qt4mu8UMpsBAorava0qj9jZUe32p68Z
	CmEivGbPMg7sf0O2x12BfChc4yvAIkZawQQ2HIA450z4W
X-Received: by 2002:a17:90b:3f88:b0:3ad:b7d1:8631 with SMTP id 98e67ed59e1d1-3b3d074e2a8mr5208458a91.17.1795084480615;
        Thu, 19 Nov 2026 02:34:40 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6116323sm28617325ad.23.2026.11.19.02.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:34:40 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/4] ASoC: atmel: mchp-spdifrx: Use devm helpers for runtime PM
Date: Thu, 19 Nov 2026 17:34:11 +0700
Message-ID: <20261119103413.31729-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119103413.31729-1-phucduc.bui@gmail.com>
References: <20261119103413.31729-1-phucduc.bui@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Use devm_pm_runtime_enable() and a devm action to handle runtime PM
cleanup automatically.

This removes the manual runtime PM cleanup from the probe error
paths and the remove callback.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/mchp-spdifrx.c | 47 ++++++++++++++++++----------------
 1 file changed, 25 insertions(+), 22 deletions(-)

diff --git a/sound/soc/atmel/mchp-spdifrx.c b/sound/soc/atmel/mchp-spdifrx.c
index 7d80f35576cd..25122f6ef3c9 100644
--- a/sound/soc/atmel/mchp-spdifrx.c
+++ b/sound/soc/atmel/mchp-spdifrx.c
@@ -1079,6 +1079,15 @@ static const struct dev_pm_ops mchp_spdifrx_pm_ops = {
 		       NULL)
 };
 
+/* Runtime suspend the device on cleanup if necessary */
+static void mchp_spdifrx_runtime_suspend_action(void *data)
+{
+	struct device *dev = data;
+
+	if (!pm_runtime_status_suspended(dev))
+		mchp_spdifrx_runtime_suspend(dev);
+}
+
 static int mchp_spdifrx_probe(struct platform_device *pdev)
 {
 	struct mchp_spdifrx_dev *dev;
@@ -1141,11 +1150,22 @@ static int mchp_spdifrx_probe(struct platform_device *pdev)
 	dev->regmap = regmap;
 	platform_set_drvdata(pdev, dev);
 
-	pm_runtime_enable(dev->dev);
+	err = devm_add_action(dev->dev, mchp_spdifrx_runtime_suspend_action,
+			      dev->dev);
+	if (err)
+		return err;
+
+	err = devm_pm_runtime_enable(dev->dev);
+	if (err)
+		return err;
 	if (!pm_runtime_enabled(dev->dev)) {
 		err = mchp_spdifrx_runtime_resume(dev->dev);
-		if (err)
-			goto pm_runtime_disable;
+		if (err) {
+			devm_remove_action(dev->dev,
+					   mchp_spdifrx_runtime_suspend_action,
+					   dev->dev);
+			return err;
+		}
 	}
 
 	dev->capture.addr	= (dma_addr_t)mem->start + SPDIFRX_RHR;
@@ -1154,7 +1174,7 @@ static int mchp_spdifrx_probe(struct platform_device *pdev)
 	err = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
 	if (err) {
 		dev_err(&pdev->dev, "failed to register PCM: %d\n", err);
-		goto pm_runtime_suspend;
+		return err;
 	}
 
 	err = devm_snd_soc_register_component(&pdev->dev,
@@ -1162,34 +1182,17 @@ static int mchp_spdifrx_probe(struct platform_device *pdev)
 					      &mchp_spdifrx_dai, 1);
 	if (err) {
 		dev_err(&pdev->dev, "fail to register dai\n");
-		goto pm_runtime_suspend;
+		return err;
 	}
 
 	regmap_read(regmap, SPDIFRX_VERSION, &vers);
 	dev_info(&pdev->dev, "hw version: %#lx\n", vers & SPDIFRX_VERSION_MASK);
 
 	return 0;
-
-pm_runtime_suspend:
-	if (!pm_runtime_status_suspended(dev->dev))
-		mchp_spdifrx_runtime_suspend(dev->dev);
-pm_runtime_disable:
-	pm_runtime_disable(dev->dev);
-	return err;
-}
-
-static void mchp_spdifrx_remove(struct platform_device *pdev)
-{
-	struct mchp_spdifrx_dev *dev = platform_get_drvdata(pdev);
-
-	pm_runtime_disable(dev->dev);
-	if (!pm_runtime_status_suspended(dev->dev))
-		mchp_spdifrx_runtime_suspend(dev->dev);
 }
 
 static struct platform_driver mchp_spdifrx_driver = {
 	.probe	= mchp_spdifrx_probe,
-	.remove = mchp_spdifrx_remove,
 	.driver	= {
 		.name	= "mchp_spdifrx",
 		.of_match_table = mchp_spdifrx_dt_ids,
-- 
2.43.0

