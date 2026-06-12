Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030B03EDE5E
	for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 13:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781270879; cv=none; b=luj71hyIE08Zzb39XufZvI5BGh5KGsVDl2M7J0EUyRIMHTBaOjlIGe2kRCvPHpLxxks5V3+V8xKmRql2TzyTwT5HVsY8mcBq0Gweo4lc4LQFYTpLdhCaiGKEkA2CtzM7fS9kRFAurf1azP2kjoizYKFkgXFeiA20R8kvqbsItvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781270879; c=relaxed/simple;
	bh=/Y4fs1/9QhCczmqk3YkGlZVkwGj2PaT0jGsJY5U02Hc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cnZEgcV8tXMkSGuLh175Gbq3iOcAHt//Da5uHXOrQR9lZdcIXsFp3wUqbnUC9Sw46w5Oi8gT6FBQHRxYW+xjB4906oyikp1MB1NZNOBr5TAX52ln7PSh1Abxxr5GDbwI2bIeq6xL+9BQzY9WZ/IOGm4IocwLNogsWgtS35rU/Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n6llgUX8; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n6llgUX8"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-137dd523634so1392438c88.1
        for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 06:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781270877; x=1781875677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n5EcAgUJr/miZOm5euArTUYqCmQuAK60NFxSW5E+pw0=;
        b=n6llgUX8kbg/57ewLXqGaVgII8atm6Jkv3EAwnHpa30GE2EuQU8ATIqW3S0nUz+5IA
         j+ErwPpnQ3qIRk8GNUah/7uvwWSVa3YHWjMYg0SgZDNV7jKSxU5ILhWifxegGWBVvrxn
         GGkZGoMSgrPeMra5R4U+9PsN0r1Td5ngECNFxnG2yVlD53J5HFWeH4/UU++JVf5NyOT2
         xbs8FrmR5SdUDlPcAOQS9rBZ/mT8MsvOWjbGr3pQF4w7xFIqyrF6n8gynsXb539xQt89
         qyd1I/GTRGrixJ/UZTBpDA/E0b+JO08XxGPcAk5W+U7FMJntlsRUDU9SUzCG1giNgKF0
         mIYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270877; x=1781875677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n5EcAgUJr/miZOm5euArTUYqCmQuAK60NFxSW5E+pw0=;
        b=BhH57fC+UJRO8zKI3JzAy/8xACYZFC2FR97+L2knsYrwdWqUX6TJKN5s2/LGBvexi7
         kFdDWy3pC+TmMrG+SzV9ZHrS5ppX/IVHk8eD5l/qM77hOnfclfDubVoh/YY0VLUS6lNs
         qYnYuywH1L3oS4Qnp0qtFG/rKPLpZ34xmj4C2YnoQhyGlocaPdpteMTuA7EoqZof6hIn
         P/niCZVQYEbRPC6a8g1UYT+/Kfac2STeVUYDxZz82cNxKVRGIERleLMff/dIu3a7h0jv
         Sczi5qmbI+6jP9/0PlO5GvPDMKObMaSGJkVFwkLKzFjGMCS3UN0UYPeBkozx5xpykErr
         CJww==
X-Forwarded-Encrypted: i=1; AFNElJ8HBJTQRznF0R7aNB0pPqtKI6x+PY2Xp1e8g9AnafbJI0Oz5wJu8XjUS6kOsz49kkO4he4sHAP3RS4kIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOLH192mcvwWY52iBUHQH1ydDazZNkWC38lcnIa+LROmEMJdfD
	5GxrgJtwJnxJ2deyCcSUKv185WzLPxXQMqBNF6I9KlclP8DIGPbAsNO8
X-Gm-Gg: Acq92OFLOxzey5aOZSNwVAp0AsTBooleWoj0dSv1bUOJLwZZQehdD2qqeEAc7JG2up7
	r4CruwBKFld+y82gABAg0B+19w1BEmAM/866nZNPiHQtv1NWlQczvWA0X+SlSctTsbQQQ18nasn
	1Me946ZZPqwFvYUdirw3xNG7QicDtcIBKGXYS8Ufpgh3mY9qlylpLqKtLxIF8Dh0fSH59rN3B7k
	HB6Wj/+FnSwtIKnlXc8s8IW2Rc2R5rMauVgaR4J62HJoGaCnX2fg1RU/tFjjL+LGAZXj59//ptX
	RB3guCVlb+14C7Kw9r2XT73MjGLvSn/W0RXEF+sQsn/NWKcdSVJ9ArcwwHXhIbmrrztEITwc7Mm
	HgBHOTR/qQ8IqH80caBUOOuHwzdTEAYpUIpJ0mIhAOneLzJnVhJUHMrS34CPjmf6oOENSRqQflP
	/sI6zq/GQ742M3hEx6MIzot0q5mACEjnyOwdBzN5XoGPfdL8vA5jcWrswWsA==
X-Received: by 2002:a05:7301:6083:b0:304:2eb0:2726 with SMTP id 5a478bee46e88-308200a883dmr1707604eec.25.1781270876974;
        Fri, 12 Jun 2026 06:27:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e91f8b5sm3302343eec.19.2026.06.12.06.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:27:56 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 11/11] ASoC: fsl: mpc5200_psc_ac97: Use guard() for mutex locks
Date: Fri, 12 Jun 2026 20:26:39 +0700
Message-ID: <20260612132639.78086-12-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612132639.78086-1-phucduc.bui@gmail.com>
References: <20260612132639.78086-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/mpc5200_psc_ac97.c | 34 +++++++++++---------------------
 1 file changed, 12 insertions(+), 22 deletions(-)

diff --git a/sound/soc/fsl/mpc5200_psc_ac97.c b/sound/soc/fsl/mpc5200_psc_ac97.c
index 8554fb690772..80666da923d0 100644
--- a/sound/soc/fsl/mpc5200_psc_ac97.c
+++ b/sound/soc/fsl/mpc5200_psc_ac97.c
@@ -31,14 +31,13 @@ static unsigned short psc_ac97_read(struct snd_ac97 *ac97, unsigned short reg)
 	int status;
 	unsigned int val;
 
-	mutex_lock(&psc_dma->mutex);
+	guard(mutex)(&psc_dma->mutex);
 
 	/* Wait for command send status zero = ready */
 	status = spin_event_timeout(!(in_be16(&psc_dma->psc_regs->sr_csr.status) &
 				MPC52xx_PSC_SR_CMDSEND), 100, 0);
 	if (status == 0) {
 		pr_err("timeout on ac97 bus (rdy)\n");
-		mutex_unlock(&psc_dma->mutex);
 		return -ENODEV;
 	}
 
@@ -54,19 +53,16 @@ static unsigned short psc_ac97_read(struct snd_ac97 *ac97, unsigned short reg)
 	if (status == 0) {
 		pr_err("timeout on ac97 read (val) %x\n",
 				in_be16(&psc_dma->psc_regs->sr_csr.status));
-		mutex_unlock(&psc_dma->mutex);
 		return -ENODEV;
 	}
 	/* Get the data */
 	val = in_be32(&psc_dma->psc_regs->ac97_data);
 	if (((val >> 24) & 0x7f) != reg) {
 		pr_err("reg echo error on ac97 read\n");
-		mutex_unlock(&psc_dma->mutex);
 		return -ENODEV;
 	}
 	val = (val >> 8) & 0xffff;
 
-	mutex_unlock(&psc_dma->mutex);
 	return (unsigned short) val;
 }
 
@@ -75,52 +71,46 @@ static void psc_ac97_write(struct snd_ac97 *ac97,
 {
 	int status;
 
-	mutex_lock(&psc_dma->mutex);
+	guard(mutex)(&psc_dma->mutex);
 
 	/* Wait for command status zero = ready */
 	status = spin_event_timeout(!(in_be16(&psc_dma->psc_regs->sr_csr.status) &
 				MPC52xx_PSC_SR_CMDSEND), 100, 0);
 	if (status == 0) {
 		pr_err("timeout on ac97 bus (write)\n");
-		goto out;
+		return;
 	}
 	/* Write data */
 	out_be32(&psc_dma->psc_regs->ac97_cmd,
 			((reg & 0x7f) << 24) | (val << 8));
-
- out:
-	mutex_unlock(&psc_dma->mutex);
 }
 
 static void psc_ac97_warm_reset(struct snd_ac97 *ac97)
 {
 	struct mpc52xx_psc __iomem *regs = psc_dma->psc_regs;
 
-	mutex_lock(&psc_dma->mutex);
+	guard(mutex)(&psc_dma->mutex);
 
 	out_be32(&regs->sicr, psc_dma->sicr | MPC52xx_PSC_SICR_AWR);
 	udelay(3);
 	out_be32(&regs->sicr, psc_dma->sicr);
-
-	mutex_unlock(&psc_dma->mutex);
 }
 
 static void psc_ac97_cold_reset(struct snd_ac97 *ac97)
 {
 	struct mpc52xx_psc __iomem *regs = psc_dma->psc_regs;
 
-	mutex_lock(&psc_dma->mutex);
-	dev_dbg(psc_dma->dev, "cold reset\n");
+	scoped_guard(mutex_lock, &psc_dma->mutex) {
+		dev_dbg(psc_dma->dev, "cold reset\n");
 
-	mpc5200_psc_ac97_gpio_reset(psc_dma->id);
+		mpc5200_psc_ac97_gpio_reset(psc_dma->id);
 
-	/* Notify the PSC that a reset has occurred */
-	out_be32(&regs->sicr, psc_dma->sicr | MPC52xx_PSC_SICR_ACRB);
+		/* Notify the PSC that a reset has occurred */
+		out_be32(&regs->sicr, psc_dma->sicr | MPC52xx_PSC_SICR_ACRB);
 
-	/* Re-enable RX and TX */
-	out_8(&regs->command, MPC52xx_PSC_TX_ENABLE | MPC52xx_PSC_RX_ENABLE);
-
-	mutex_unlock(&psc_dma->mutex);
+		/* Re-enable RX and TX */
+		out_8(&regs->command, MPC52xx_PSC_TX_ENABLE | MPC52xx_PSC_RX_ENABLE);
+	}
 
 	usleep_range(1000, 2000);
 	psc_ac97_warm_reset(ac97);
-- 
2.43.0

