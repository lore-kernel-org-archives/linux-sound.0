Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8719C3DB319
	for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 09:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781516468; cv=none; b=DawNj2LPnlDEMURVMQDzZBUN5AZ+comUbVm/wIiZ5suCpzTuZtLkKVj62Lu2jxtmpQogiEO+ymeBPMxxLdgHQeyCijTp0XCRLutHDuprmXVlCAJsMbhmurRoXWRQXqwczMAgMKRD00H+xDRBB6F4qi2A+3uqgYCoz1MqnD8oIOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781516468; c=relaxed/simple;
	bh=W3fFeC8tGE3QV93ifp8hjoP3jLnqLch5LsU+YpSWHPA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tgyjq22TEF+RLWVdxn80cJHU6TIcCaK6Orlm+kW09+qcR0E1X/jgOOjcNsaiWrg9TFvOEQiGYxK5z+l16K/RXunMLA5VYCLQ8R1DIOm3JpTLiWA9EEgC4fJ9fE8BPoLol5vH96FQ+Z8Zpp1qLfyxhB5yQs1qJJlmwhQkGokwc6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BcJjBm3r; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BcJjBm3r"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-36b9d265355so1435921a91.2
        for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 02:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781516467; x=1782121267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NnE4Srd5uTTyhfuQp5PAjqJfajCDEXq0juLBDGnU9sg=;
        b=BcJjBm3rRgoEdx1W1Q0GpeKlHnN0pOCAZd9Xm+WeFkzwuj65W9W77L2m8m/LrBqIkY
         Ao2ULYpdMRcUPmzDbUmu4wd5ECqD4HeREwqPvzj8/M6Ic/NYElmlo10gfMwvbWmPjCN2
         Bas0s7ubE7p87A9x7oYV3G5fnASTFj6ckTbgb0bW9GkLa8v7ozxKeQtAufL9nfKoDlV2
         LPhZqXlaldYdn0dWzEze0970N5fdisd0WNSBqLV1f3XjYyN7JTo8z6McuR0BAUIks36p
         H7v7t6taXkGjdIXddlVVVTCw2Di01huzrT4W8M68lFpgW50sUkc3LZ/BVc/4SuRUW5Zv
         IwEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781516467; x=1782121267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NnE4Srd5uTTyhfuQp5PAjqJfajCDEXq0juLBDGnU9sg=;
        b=BrxfyJ3Nq8GHywMQCYlCjSaarGp7AZ0yDcmbslJzQB1b1Dk7xzd0Dp34ZFUlOGTeMq
         KV41Yut1HCaUw+HUG8+jKrlBLoJ+SGyLXe+Ng4CL0m8WrEwjD+sr+fKfzCILJwQVpsi4
         SJPsp3dWFy8wBecFRskjxNJAIGdVt/aOL8YzP3I7Vk/f6yzOkwJp6Tp2EdbY5eOp3/6d
         quObMsnnYS7A5tUXslaWz4a9XiVj8zbqPILw65Q2MMOFjghmwMJMbyAm90ORjN6rfB3Y
         8wllDDe+luI7fbWsppMyv1nqpsXHqQevMDJEfI1SVRLQrcWR2aDJDdovwjeyHu1Gf3QX
         rmBw==
X-Forwarded-Encrypted: i=1; AFNElJ+As0pKEjWxmC9SXh+ij039B46niHhbC32LQTBd08jB7lplCplBe8rkSrxUcgmDqjj8IzgV50wprKbO/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTax1OZfKis97gRxBd8l1AJtssrJTYc13JKxGfX8YTjWBiSWQJ
	j49EIlK/mvgX4YTL3fnt1lTQue+zUPrq4TOaIlsXtU1XvNUKX8bi6rAh
X-Gm-Gg: Acq92OFfBTFoUclbPnBcAYq1g+lZtLiMmRisfSZqZstGmU54IZqTzjTcWdhvOsB47TP
	vBJLHS9drCIGiEIQphs/bzET1b0SFVbe1kxuQCOPt/BF4gVEJzf9Y3cLjlH+89Pt+n3MmoNpFIg
	mP/GjROOFj3Sqo1GqOoQ5wH/V09TUtqeUrWUdMGPh2e/u9h4XwBaG6U3+4Xd5qIDqUbwhcG8ORT
	tGNTOO5DA32rjecSq3Ug4KSsahWP7Gre96CFN7q0k3YorH2BeYwUTrHbn4ePj7P+mf23fzs2NFW
	VugHvL/OYj9RQIi887QD2ziZE7Y7X4pbNqTrJ765qKDVdroDk7qMEqGhwgaAuBPtNl7vZ6sPPPV
	Jjz7hV1YpmsJ3XbGONWrTKPsHnVZZOL/L3BKautDZ9m+G9y5J+gr5U/uoZMIb6nuxpR2v4nQh/W
	RFNqY2j89a+yQbOa90S5xV35RaSsCV9Fud/YQxpZj1kuz8kKEFqLb/uAKoTQ==
X-Received: by 2002:a17:90b:4a11:b0:36a:4074:9aa6 with SMTP id 98e67ed59e1d1-37a01b3f8b6mr13135815a91.6.1781516466932;
        Mon, 15 Jun 2026 02:41:06 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1eba8e9asm9936290a91.2.2026.06.15.02.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:41:05 -0700 (PDT)
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
Subject: [PATCH v2 11/11] ASoC: fsl: mpc5200_psc_ac97: Use guard() for mutex locks
Date: Mon, 15 Jun 2026 16:38:24 +0700
Message-ID: <20260615093824.115751-12-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615093824.115751-1-phucduc.bui@gmail.com>
References: <20260615093824.115751-1-phucduc.bui@gmail.com>
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

Changes in v2:
 - psc_ac97_cold_reset(): Fix scoped_guard() usage by replacing
   scoped_guard(mutex_lock, ...) with scoped_guard(mutex, ...).

 sound/soc/fsl/mpc5200_psc_ac97.c | 34 +++++++++++---------------------
 1 file changed, 12 insertions(+), 22 deletions(-)

diff --git a/sound/soc/fsl/mpc5200_psc_ac97.c b/sound/soc/fsl/mpc5200_psc_ac97.c
index 8554fb690772..d4d9f5b6bc07 100644
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
+	scoped_guard(mutex, &psc_dma->mutex) {
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

