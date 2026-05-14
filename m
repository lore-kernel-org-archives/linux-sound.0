Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1088352C2B
	for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 11:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778756781; cv=none; b=LferrIigU+St/0Lpcl3UGrbciR22xoC+RueSVxUtLYkyKk/GTCDqCBH0w2ysc4ootMq5GLZ4H0yZaNFQjsutG0hj+RVJ4eriZfOihMkusnhMrrihiiQnrTDAKEweH0dVXqwlgfGcXj4l948I+KjPC5nzTD0vd79WVbMMWHM3gQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778756781; c=relaxed/simple;
	bh=47sog5D+xEQbGjajYDAtYcSG4JoXZ0powok8EU5fFOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lqGfX7aq+14lVMY/wXz3sBKFDJOkowWpNYYACybFAeZdXYtFOID2INTE9+KPjcVIsjXnxqZlMyH5qNjNUHm3vkVlWapl829x3DJMUSj4tt7vBlt+kYiquuvLGK1k1GMKBTK9JNwmlShdgjriKE0g535R4rW2P47rtwmxPST0ruk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pJtW8UzZ; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pJtW8UzZ"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c80227b1f6cso3436838a12.1
        for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 04:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778756779; x=1779361579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=umazs7xdzJh6gNqfVRcGHxjaKuxZgvm9MNq62f5KWtU=;
        b=pJtW8UzZgz5k0ZjtC/ENWGBiuQ17rpmscP0qT8I2/AysF7pOGrWlVggiEqA7q1zi3N
         D02Z+mDetFAHRz97v8PkHQYWsibQ+equM30NWp0yUYZvMNB3KeLSRE92V3XWJB4y5dq2
         +0V/qMFQ7PIQCi7HNezEUDSkRnwN2VQSsNsXPo2pBTnT8Ya97yja8Lb/HE2prZLPJPP1
         r/U4kfhrMEfGBR7NA6+Yflsg5sQEm5T0lxj88pPfGRPMeg0Nv9mOVnZ/cjk/QZHdHOc0
         KXWRRMp5KSjDbx6gdCqlCFjoCBHSK8WMehXzjGPpD3SzurRC9h74sgwpxPw+dJRlnhyL
         4w9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778756779; x=1779361579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=umazs7xdzJh6gNqfVRcGHxjaKuxZgvm9MNq62f5KWtU=;
        b=VKuEWR1Q2b3WWGCndYKCrCcpI04vqVStKeBRQSlvzuclXl1bnq5TdIiqroHyp/VJId
         NZwRHjLWrgQ+rahFj92thRilafI54hBXedYoaAQn07QX8olq4OztT+XVyF9d/iyIthzq
         NoJx42gFQBPFs4BWHU/y0FnFuy2CLLvNyJhvnBFrlbvoO6PE7gROHpesgA5CvPWYlssV
         mXNR84Mlkll27yIZxFinzzcBOfHyAswhPbNpVwCp+ZL2bD8h0AYtojn+0r1ZpmvC2z9a
         6T1F5MKH1qfTUqvPL7bsolHxMEw+IOx0F+gDMqzhEveNOPqM0dWEwlCbR0wGq4l/Wbyb
         Wj4g==
X-Forwarded-Encrypted: i=1; AFNElJ9jCXip8xeUbxfkW5Dchq+cbRY0Yb0JSltlHzpBgPx9XW2glQDWx7Yeq7uMzCUh9HmOxS7m5HU4wPJ17Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxPL02I+sLlhWkALDhe/z5zQqI/x54T81mJAoma+yASvi+/Bv4
	hjQZD2jT5GmZggbuvPuCiiKhmi/CWztZbmDjHI9jWkUFd+XfupJ5gzMdGmc3rw==
X-Gm-Gg: Acq92OGloblJvmYLv8o4vbw1HRMCwpwueIcdgVUnHa0KSP4bAE6Q7dS/FvjrDIHI6ib
	72YEU3P3ARG7A7ofRAU063gTPbsGdayyNMk+HnABVX0BUESVgR1XjbgkMLr98eMYERq3OPwPoht
	DFnO2lQzKIU1JYDQBFwl1xToLmiwQoW7995F4xrVz+Zb5GogU6qq1nxmc0/1kslBqv4nOtQIJvp
	QcQTe7AomLrP5L0Q4nDLsKqpw0OiW82Z12Dpv1OqahOSp6ZiAdgT2gOf0RrvaVztB1pHaGZr+N5
	N1hl0Ff42Kw6XYqvmSkjx92yor4Nzy4pzyCP90ySJuqpIYVAJCLwOyLi8jf9XPpXSyALKIi22yw
	ewMG2KwwhJS7Ee7Hsq8ZOYTNRhLW7mUEXeDSsM6JAEv+3u91JppgIpuQdWu1gUqOKAFv46bD7Gj
	3z/gtsb6DKCvcQ0e0cEESHQaYcC1qhZ774uy/OGzKoHbFmLIArkw0X3NWOLA==
X-Received: by 2002:a17:902:d392:b0:2ba:7610:3f21 with SMTP id d9443c01a7336-2bd270fbe07mr63185415ad.5.1778756778730;
        Thu, 14 May 2026 04:06:18 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c0600b4sm23053735ad.28.2026.05.14.04.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 04:06:18 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	asahi@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ASoC: ti: omap-mcbsp: Remove mixed goto/scoped cleanup handling
Date: Thu, 14 May 2026 18:06:02 +0700
Message-ID: <20260514110602.30480-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

After converting to guard()/scoped_guard() helpers,
omap_mcbsp_request() still mixes scoped cleanup with
goto based error handling.

Remove the remaining goto based cleanup paths for a more
consistent cleanup flow.

Suggested-by: Mark Brown <broonie@kernel.org>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/ti/omap-mcbsp.c | 46 +++++++++++++++++++--------------------
 1 file changed, 22 insertions(+), 24 deletions(-)

diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
index d82fef629867..26af616c33f5 100644
--- a/sound/soc/ti/omap-mcbsp.c
+++ b/sound/soc/ti/omap-mcbsp.c
@@ -307,7 +307,7 @@ static int omap_mcbsp_request(struct omap_mcbsp *mcbsp)
 		reg_cache = NULL;
 	}
 
-	if(mcbsp->pdata->ops && mcbsp->pdata->ops->request)
+	if (mcbsp->pdata->ops && mcbsp->pdata->ops->request)
 		mcbsp->pdata->ops->request(mcbsp->id - 1);
 
 	/*
@@ -322,42 +322,40 @@ static int omap_mcbsp_request(struct omap_mcbsp *mcbsp)
 				  "McBSP", (void *)mcbsp);
 		if (err != 0) {
 			dev_err(mcbsp->dev, "Unable to request IRQ\n");
-			goto err_clk_disable;
 		}
 	} else {
 		err = request_irq(mcbsp->tx_irq, omap_mcbsp_tx_irq_handler, 0,
 				  "McBSP TX", (void *)mcbsp);
 		if (err != 0) {
 			dev_err(mcbsp->dev, "Unable to request TX IRQ\n");
-			goto err_clk_disable;
-		}
-
-		err = request_irq(mcbsp->rx_irq, omap_mcbsp_rx_irq_handler, 0,
-				  "McBSP RX", (void *)mcbsp);
-		if (err != 0) {
-			dev_err(mcbsp->dev, "Unable to request RX IRQ\n");
-			goto err_free_irq;
+		} else {
+			err = request_irq(mcbsp->rx_irq, omap_mcbsp_rx_irq_handler, 0,
+					  "McBSP RX", (void *)mcbsp);
+			if (err != 0) {
+				dev_err(mcbsp->dev, "Unable to request RX IRQ\n");
+				free_irq(mcbsp->tx_irq, (void *)mcbsp);
+			}
 		}
 	}
 
-	return 0;
-err_free_irq:
-	free_irq(mcbsp->tx_irq, (void *)mcbsp);
-err_clk_disable:
-	if(mcbsp->pdata->ops && mcbsp->pdata->ops->free)
-		mcbsp->pdata->ops->free(mcbsp->id - 1);
+	if (err != 0) {
+		if (mcbsp->pdata->ops && mcbsp->pdata->ops->free)
+			mcbsp->pdata->ops->free(mcbsp->id - 1);
 
-	/* Disable wakeup behavior */
-	if (mcbsp->pdata->has_wakeup)
-		MCBSP_WRITE(mcbsp, WAKEUPEN, 0);
+		/* Disable wakeup behavior */
+		if (mcbsp->pdata->has_wakeup)
+			MCBSP_WRITE(mcbsp, WAKEUPEN, 0);
 
-	scoped_guard(spinlock, &mcbsp->lock) {
-		reg_cache = mcbsp->reg_cache;
-		mcbsp->free = true;
-		mcbsp->reg_cache = NULL;
+		scoped_guard(spinlock, &mcbsp->lock) {
+			reg_cache = mcbsp->reg_cache;
+			mcbsp->free = true;
+			mcbsp->reg_cache = NULL;
+		}
+
+		return err;
 	}
 
-	return err;
+	return 0;
 }
 
 static void omap_mcbsp_free(struct omap_mcbsp *mcbsp)
-- 
2.43.0

