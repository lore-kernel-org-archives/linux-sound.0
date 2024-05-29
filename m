Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6015E632
	for <linux-sound@vger.kernel.org>; Wed, 29 May 2024 01:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716945305; cv=none; b=ssmZzuyLuU3ECSu701/ULJREG8Kr5RLqeGv+ImrPOugiSjaq+hOV8Vhg6fBknPS/unJjRT+vGK6O1tx76NVIUOJrL+6P/tSok2OJkFCLFjEGXyaUB+MzBwVWlvmWVwzgMcll6YhLD3WHJa/w3jhcYyhsklHZSFg6vrcXXb9JBpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716945305; c=relaxed/simple;
	bh=fT1IWBYuYBuKHGXS7Z/rrSyJHdgjGzCuAqkQqs+T8sc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HJ155IaTso0NvWT/nVY4l1yTOIz5ukTURPAB94BnajCVeu1pzNWh1198U4bAWI/P/14MCM31KRvzNadGgb6oe5rCk2AHwbp04/HSC5D2e3jmgSLuXERhwyDpMqrn0d48oD92ef9U3Vlb1EWtdLNz65x7+1zqjTzLW3A5dV+Xm3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iFKmepAu; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iFKmepAu"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-681a3e5d376so24886a12.2
        for <linux-sound@vger.kernel.org>; Tue, 28 May 2024 18:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716945304; x=1717550104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HDUt9ZVXQ8at5tso8T9Oo/6PbFR3R7WI2pW+tMTFBqg=;
        b=iFKmepAuRJbQSdE5bFdtR4W65yODqz1jYCKUFvG6PPs5TzadkmL9/KTHOqMrxoKee/
         V/epcueIKtmoxbDmsp4pR9+Ww9HvDzsa+IPfOlzu/fz3NviNzAF/G58qjqmaiMRhc400
         aGExkTxuYEgJCAuHoDpb/0RA77aotWpKJIPseJe2fKMsG2xE5oFDGlcchO3OdZpbeopu
         RSV1rCPn0CJOB0CNFNMLqknQC9Qakhx+xJp+umj6fgpg3EYbZkOsUGzT8i4FGmF0CU8p
         yGcQcD7/ID8tcJuVeeKqE3unPLMmfLyQ1GBR6FTwT9frCsKmcNNWJ5jO0X7da6LJRcMN
         s0jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716945304; x=1717550104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HDUt9ZVXQ8at5tso8T9Oo/6PbFR3R7WI2pW+tMTFBqg=;
        b=dj2xOleSOyfmpajBkBlM3gr/cRVc+GWhjbfsgA4JTTxwf8t0DXcEfEWVOXGDsSpBgO
         nJB+pk5R236/72XRLrtUFztCq+ONOZUTh229XzBh0lB/hJ+Xlx+0Si2bMR8OqMUFm+Ic
         stJf+KqiaW6ZGSbRF3NNjmRPWCCBIx7rbWSYaBfT7Ie97eZ0K0+OnBmpI/Tfng9ORamN
         VjIIqCgquuLcj6x3bl0YfljH21F8QWFiRQ0YCxikBITRgkqzmnWELBlZx9T2u3xqkT9L
         jLn6cOAKhxpFN4EJdV6eZWC8iWufkboqDaZNFOjtwTjhFtRcJgsqBY1hZKHmfiDiMvh2
         aJuw==
X-Forwarded-Encrypted: i=1; AJvYcCX8RRXK3XY6OMRr9a434BZpz44maPurA4nvY5c3xktRwTr31N2Pz3UA6TQ3J0QowyJnV466UDiplw4q2YJrQuEiA5QwiBdkw67e9o4=
X-Gm-Message-State: AOJu0YzW9HB864zAqi8YkgvDafeRo+HejQyxAyvEMTi+MMkJfxcHufrS
	0dEJXeIrR5f7Swi2d0gr/3cSbdjB2RZsTkp37ASlmgNRkHDVSJfT
X-Google-Smtp-Source: AGHT+IHZ04Y+C/NNxjzAUtl6L1dv2gBTfwktqKEtUA5ifjYnYLjD8e3iMJIigl3SNczFKrpwXmuMJA==
X-Received: by 2002:a05:6a00:11d3:b0:6f4:c946:5584 with SMTP id d2e1a72fcca58-6f8f3a231afmr14572003b3a.2.1716945303581;
        Tue, 28 May 2024 18:15:03 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:dfd9:2d9b:ff9d:4f57])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f8fbd3ebdasm7029015b3a.44.2024.05.28.18.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 18:15:03 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Cc: shengjiu.wang@gmail.com,
	linux-sound@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2 3/3] ASoC: fsl: fsl_xcvr: Switch to RUNTIME_PM_OPS()
Date: Tue, 28 May 2024 22:14:45 -0300
Message-Id: <20240529011445.1436596-3-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240529011445.1436596-1-festevam@gmail.com>
References: <20240529011445.1436596-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

Replace SET_RUNTIME_PM_OPS() with its modern alternative RUNTIME_PM_OPS().

The combined usage of pm_ptr() and RUNTIME_PM_OPS() allows the
compiler to evaluate if the runtime suspend/resume() functions are used
at build time or are simply dead code.

This allows removing the __maybe_unused notation from the runtime
suspend/resume() functions.

Signed-off-by: Fabio Estevam <festevam@denx.de>
Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>
---
Changes since v1:
- Only colleted Shengjiu's Ack.

 sound/soc/fsl/fsl_xcvr.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index c46f64557a7f..5472ace23d82 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -1364,7 +1364,7 @@ static void fsl_xcvr_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-static __maybe_unused int fsl_xcvr_runtime_suspend(struct device *dev)
+static int fsl_xcvr_runtime_suspend(struct device *dev)
 {
 	struct fsl_xcvr *xcvr = dev_get_drvdata(dev);
 	int ret;
@@ -1398,7 +1398,7 @@ static __maybe_unused int fsl_xcvr_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static __maybe_unused int fsl_xcvr_runtime_resume(struct device *dev)
+static int fsl_xcvr_runtime_resume(struct device *dev)
 {
 	struct fsl_xcvr *xcvr = dev_get_drvdata(dev);
 	int ret;
@@ -1483,9 +1483,7 @@ static __maybe_unused int fsl_xcvr_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops fsl_xcvr_pm_ops = {
-	SET_RUNTIME_PM_OPS(fsl_xcvr_runtime_suspend,
-			   fsl_xcvr_runtime_resume,
-			   NULL)
+	RUNTIME_PM_OPS(fsl_xcvr_runtime_suspend, fsl_xcvr_runtime_resume, NULL)
 	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
 				pm_runtime_force_resume)
 };
@@ -1494,7 +1492,7 @@ static struct platform_driver fsl_xcvr_driver = {
 	.probe = fsl_xcvr_probe,
 	.driver = {
 		.name = "fsl,imx8mp-audio-xcvr",
-		.pm = &fsl_xcvr_pm_ops,
+		.pm = pm_ptr(&fsl_xcvr_pm_ops),
 		.of_match_table = fsl_xcvr_dt_ids,
 	},
 	.remove_new = fsl_xcvr_remove,
-- 
2.34.1

