Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795075124;
	b=aHb5KJH+rKCOAGDy60xPCU8hTTpmPkBKNsU0qDJP3CZQlMOgUbFV915P+BAFfttM4WBU
	 qoeOkdhreTuyerOYG9+e/S/iWU8DsD2BCnj4y5Mo/cKTYZpZELEy7gRXAUgEPTwdejeIM
	 7y3VDF2SoAbz8rCxIpY6fkoV4FgHmgVQEZtrY3k1D8UwJvjHyBvTdhOYBeFS5NgsB2+an
	 wF+ZMvrFrfnyDamyEa0Cth4GB6N0XTaBx1bu0WwhkmwbojDwOKr/fVTFmW/3Jp9Iiqeg6
	 /NeFQj7nQMGw84hlCdF3xZTCslSSgTs18HSYYWqeSBVI5/TNlt8jPghZFJDzWkLwruA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795075124;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QPgbvmzX0JOJ9OoR1cjlJ+/u1a8nU/UDz+6qkCMTAjI=;
	b=5EJiqQoVBFuHA4kSeA1FEUDtPDrQ72ia6DQwFurXuaIs/5wiUI33CyCsTwmQIgnwYMK3
	 wb3dKg321rvYpu2vjHTKUdfaI+j7O1kBpPyWLe0AIwzT7vDJIAAGX9pI0Apk5GdnBwwvY
	 xIWYvULv8m6B0v+sQFnFs3/RCOCFowixOvGll1IIE5EUmoKDdWlIwqi4taZwP9H6LxHOe
	 m0QeZ3/vXecmYEVyDYVNaSBxHYseMETvM3LJ3lbnfn1U+8XIogu4dfTSLQVFrTYs9Su99
	 9z75NoFZuezUkFildN7cHHHEJN49F77248t0FDrlWzDpqFOjFvRTjBLR8WgoHD/2iow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=s2xNWPMy;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64C49606A334;
	Thu, 19 Nov 2026 07:58:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64C49606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=s2xNWPMy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=s2xNWPMyYbw99OpVfVIOVQg/KrnVJSWNDaAui1bowwKkiqpBXhal7QrfKeu8mk8zSsxvxvSnfD0Hb
	 x3yA+ZHanR2699VWar31wS2iKvJcr52IKVtUa9U4IjqqI+OIenbeKNOJvCUIcU+T1J+u5mTdUmm6lu
	 s491XwkTSYxVjVbM=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66afeac32104-e83ba;
	Thu, 19 Nov 2026 15:58:42 +0800 (CST)
X-RM-TRANSID:2ee66afeac32104-e83ba
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee46afeac2fe86-f59ea;
	Thu, 19 Nov 2026 15:58:42 +0800 (CST)
X-RM-TRANSID:2ee46afeac2fe86-f59ea
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	srini@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] ASoC: qcom: lpass: Propagate IRQ lookup errors
Date: Thu, 19 Nov 2026 15:58:40 +0800
Message-ID: <20261119075841.50185-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
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

The LPASS platform driver converts all four named IRQ lookup errors
to -ENODEV. When an interrupt provider is not ready,
platform_get_irq_byname() can return -EPROBE_DEFER. Replacing that
error prevents the device core from retrying probe.

Return the original error from each lookup.

Fixes: c5c8635a0471 ("ASoC: qcom: Add LPASS platform driver")
Fixes: 7cb37b7bd0d3 ("ASoC: qcom: Add support for lpass hdmi driver")
Fixes: 7d7209557b67 ("ASoC: qcom: Add support for codec dma driver")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 sound/soc/qcom/lpass-platform.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index dad4becf7579..7f4963d129e5 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -1281,7 +1281,7 @@ int asoc_qcom_lpass_platform_register(struct platform_device *pdev)
 
 	drvdata->lpaif_irq = platform_get_irq_byname(pdev, "lpass-irq-lpaif");
 	if (drvdata->lpaif_irq < 0)
-		return -ENODEV;
+		return drvdata->lpaif_irq;
 
 	/* ensure audio hardware is disabled */
 	ret = regmap_write(drvdata->lpaif_map,
@@ -1322,7 +1322,7 @@ int asoc_qcom_lpass_platform_register(struct platform_device *pdev)
 		}
 		drvdata->rxtxif_irq = platform_get_irq_byname(pdev, "lpass-irq-rxtxif");
 		if (drvdata->rxtxif_irq < 0)
-			return -ENODEV;
+			return drvdata->rxtxif_irq;
 
 		ret = devm_request_irq(&pdev->dev, drvdata->rxtxif_irq,
 				lpass_platform_rxtxif_irq, 0, "lpass-irq-rxtxif", drvdata);
@@ -1341,7 +1341,7 @@ int asoc_qcom_lpass_platform_register(struct platform_device *pdev)
 
 		drvdata->vaif_irq = platform_get_irq_byname(pdev, "lpass-irq-vaif");
 		if (drvdata->vaif_irq < 0)
-			return -ENODEV;
+			return drvdata->vaif_irq;
 
 		ret = devm_request_irq(&pdev->dev, drvdata->vaif_irq,
 				lpass_platform_vaif_irq, 0, "lpass-irq-vaif", drvdata);
@@ -1362,7 +1362,7 @@ int asoc_qcom_lpass_platform_register(struct platform_device *pdev)
 	if (drvdata->hdmi_port_enable) {
 		drvdata->hdmiif_irq = platform_get_irq_byname(pdev, "lpass-irq-hdmi");
 		if (drvdata->hdmiif_irq < 0)
-			return -ENODEV;
+			return drvdata->hdmiif_irq;
 
 		ret = devm_request_irq(&pdev->dev, drvdata->hdmiif_irq,
 				lpass_platform_hdmiif_irq, 0, "lpass-irq-hdmi", drvdata);


