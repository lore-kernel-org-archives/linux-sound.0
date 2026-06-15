Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727233D9680
	for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 09:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781516443; cv=none; b=tIJ6K99sHUQ8DUzOKwhCE/0+XPooiEhHTPWLpS6Q4klPFsGKZGBE3uTeXUVPDFut9eMDMfiZjf79qUdHpaMgIhjxTIVtl4tnCwmT+ZFCwkgrCY9VCVgKmoU75ZEtT/0Sovr9yvtgsSVm38JAnLrc01WjZ1fvjYfnpJjxOzS67+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781516443; c=relaxed/simple;
	bh=uVOODI0dcvu4VrcEd7Pee45Ik1Uu9/KkXXqPodrFKkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R5PgMyXMvKg6afy8iwOeA9jXchtgpG4eRktXmuonsraMw/EZ9CL0/e2GkjgDS5tw31bHHn/cjacMgnQll5gBZgx35+KcewNxMtxG+fjh9JLZXpLK0f53UHXik1ph+7Oc0luaDq4Zg69fNcleXIKZXqD7KGRG9FsphzM+QoMOXWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rW1axjgl; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rW1axjgl"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-372b4330deeso1960252a91.0
        for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 02:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781516442; x=1782121242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MVq+Lu3avSLljn1bjHDwqj7k0Y9nxoC/mnINOIpcocM=;
        b=rW1axjgltor6aE1ZVLUFiys7VlLgmgbUp1sJOpupCteL2D5WjnSdL44J6rHjFtnnk1
         9gnrDERhVMWeLOBiuoxmM1vsNwIPhMXtpflpBVyh7++9Jx4Xid5g8U3L7mXyfmzy+ex6
         8uvZFu4bLTcBIyLOk2ZM3buMxbgjqqScdj7ko3GPVxgPZv5/qA+cqk6NfnNwNqNALi1v
         IIMtvKmkktoTrhYvpky7aXMCmQkl0+g8XkXD9Z3bncivRC1ILaVSsn+A4W29IACQXNLH
         6AvSkGkfNdu9Dz9NJiHkRTFp8gxjCbygD5a3ZjXKutf2F/tDgm3cA9hinhIA9RJN6SWz
         8AGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781516442; x=1782121242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MVq+Lu3avSLljn1bjHDwqj7k0Y9nxoC/mnINOIpcocM=;
        b=lG2yuRqi6ANbGiNaKKIk+ZEOggGA/iYEBB43m+5mgDZfZr4MNYvHbGzIIqgVxhEwRZ
         ERmionGtTFys3qPQdpy/zBw+3jkxyqF/FCG5e1zOvSmxYeivt3w5Qnl5OukbcMDQfR88
         XY9QM3ZeuVPiMxM7rzVh8oPk/khVpJ57znrdRuPInTtvlHuAqryHw6ur05oVn1eLqReH
         YP+P98nUa/awNLUWGGKzGXHz2z1m+w7T+ae5ckWHd/Qw6qtV+jmUXB4NNJkGCM1Z+HJ3
         TsCtNodjuYCwOIIyFmsxdvKnbK6kmhrE4hxpvK819UzDDWm8a8QF6M8sjoWU/4DquSmn
         i4kQ==
X-Forwarded-Encrypted: i=1; AFNElJ/LxlHygDnqHslfquEf/dpwsJLl6/Q8538ckIqLya8FCnNeVe/boX6FPCXzIL0MyP48D4QxZ3K0lpsAjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNvs1yaf8iWIA+yTyXzDsf1GGKwYKuw4u7VMW+86VRuNV1VKmp
	g05ZqV9sAWS0dX0FlvbxEV2uFE7vFZjLHq8qIDJlWI+VfEZzosKMjE+a
X-Gm-Gg: Acq92OE61I/GmmyQ+2P697oR11y0Li0vI2gGr6ZJnsAfR0KS9QroIwQxuQaYGUUcJQ0
	qAoFxC2brgSuZ0z30H0jhD4uQb+utF3o+ZTUCa5yThzUnvDqooZSyG67qd7vRwPGdOFHApIkdAz
	1YcSxE/I92hZobn4cyDmhTnHMrggp0gH4YGLeF6y5TDyCb8PQ+9BUBfT+PwpDymlYkm5hY5OZVL
	GHDRViSdigW5XwG+M8zC3oemr3ipMsahx8e51MEXXBOS8vRoZtOhyZgAJG9wVmAaicisqR2A0wR
	d7SV/5kLatU/PwROcISoEl0f4ES90lL9Rz7YP6WZLOzTGqXPtmuj/z7kF9YT7vpPJz0QC9J2aHy
	5AQ3E5OwfiIb6yrKnV4uT+DjAl2Fq8pf9JAdn6qdvhd8D0rAhEgcOPxsEAs+8cr0VJoztw4cRw/
	nF8Zv+IfJk6snd1yoUfwZVWGaKw91ZX7y7kquNLqiDbbarXv26qC6WavvIzw==
X-Received: by 2002:a17:90b:2781:b0:365:a5f6:4a5c with SMTP id 98e67ed59e1d1-37c2bc5d202mr10797246a91.1.1781516441891;
        Mon, 15 Jun 2026 02:40:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1eba8e9asm9936290a91.2.2026.06.15.02.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:40:40 -0700 (PDT)
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
Subject: [PATCH v2 07/11] ASoC: fsl_xcvr: Use guard() for spin locks
Date: Mon, 15 Jun 2026 16:38:20 +0700
Message-ID: <20260615093824.115751-8-phucduc.bui@gmail.com>
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

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_xcvr.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index 6677d3bf36ec..41d100500534 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -797,10 +797,9 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream *substream, int cmd,
 {
 	struct fsl_xcvr *xcvr = snd_soc_dai_get_drvdata(dai);
 	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
-	unsigned long lock_flags;
 	int ret = 0;
 
-	spin_lock_irqsave(&xcvr->lock, lock_flags);
+	guard(spinlock_irqsave)(&xcvr->lock);
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
@@ -812,7 +811,7 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream *substream, int cmd,
 					 FSL_XCVR_EXT_CTRL_DPTH_RESET(tx));
 		if (ret < 0) {
 			dev_err(dai->dev, "Failed to set DPATH RESET: %d\n", ret);
-			goto release_lock;
+			return ret;
 		}
 
 		if (tx) {
@@ -824,7 +823,7 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream *substream, int cmd,
 						   FSL_XCVR_ISR_CMDC_TX_EN);
 				if (ret < 0) {
 					dev_err(dai->dev, "err updating isr %d\n", ret);
-					goto release_lock;
+					return ret;
 				}
 				fallthrough;
 			case FSL_XCVR_MODE_SPDIF:
@@ -833,7 +832,7 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream *substream, int cmd,
 						      FSL_XCVR_TX_DPTH_CTRL_STRT_DATA_TX);
 				if (ret < 0) {
 					dev_err(dai->dev, "Failed to start DATA_TX: %d\n", ret);
-					goto release_lock;
+					return ret;
 				}
 				break;
 			}
@@ -844,14 +843,14 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream *substream, int cmd,
 					 FSL_XCVR_EXT_CTRL_DMA_DIS(tx), 0);
 		if (ret < 0) {
 			dev_err(dai->dev, "Failed to enable DMA: %d\n", ret);
-			goto release_lock;
+			return ret;
 		}
 
 		ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_IER0,
 					 FSL_XCVR_IRQ_EARC_ALL, FSL_XCVR_IRQ_EARC_ALL);
 		if (ret < 0) {
 			dev_err(dai->dev, "Error while setting IER0: %d\n", ret);
-			goto release_lock;
+			return ret;
 		}
 
 		/* clear DPATH RESET */
@@ -860,7 +859,7 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream *substream, int cmd,
 					 0);
 		if (ret < 0) {
 			dev_err(dai->dev, "Failed to clear DPATH RESET: %d\n", ret);
-			goto release_lock;
+			return ret;
 		}
 
 		break;
@@ -873,14 +872,14 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream *substream, int cmd,
 					 FSL_XCVR_EXT_CTRL_DMA_DIS(tx));
 		if (ret < 0) {
 			dev_err(dai->dev, "Failed to disable DMA: %d\n", ret);
-			goto release_lock;
+			return ret;
 		}
 
 		ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_IER0,
 					 FSL_XCVR_IRQ_EARC_ALL, 0);
 		if (ret < 0) {
 			dev_err(dai->dev, "Failed to clear IER0: %d\n", ret);
-			goto release_lock;
+			return ret;
 		}
 
 		if (tx) {
@@ -891,7 +890,7 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream *substream, int cmd,
 							FSL_XCVR_TX_DPTH_CTRL_STRT_DATA_TX);
 				if (ret < 0) {
 					dev_err(dai->dev, "Failed to stop DATA_TX: %d\n", ret);
-					goto release_lock;
+					return ret;
 				}
 				if (xcvr->soc_data->spdif_only)
 					break;
@@ -905,7 +904,7 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream *substream, int cmd,
 				if (ret < 0) {
 					dev_err(dai->dev,
 						"Err updating ISR %d\n", ret);
-					goto release_lock;
+					return ret;
 				}
 				break;
 			}
@@ -916,8 +915,6 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream *substream, int cmd,
 		break;
 	}
 
-release_lock:
-	spin_unlock_irqrestore(&xcvr->lock, lock_flags);
 	return ret;
 }
 
@@ -1448,11 +1445,10 @@ static void reset_rx_work(struct work_struct *work)
 {
 	struct fsl_xcvr *xcvr = container_of(work, struct fsl_xcvr, work_rst);
 	struct device *dev = &xcvr->pdev->dev;
-	unsigned long lock_flags;
 	u32 ext_ctrl;
 
 	dev_dbg(dev, "reset rx path\n");
-	spin_lock_irqsave(&xcvr->lock, lock_flags);
+	guard(spinlock_irqsave)(&xcvr->lock);
 	regmap_read(xcvr->regmap, FSL_XCVR_EXT_CTRL, &ext_ctrl);
 
 	if (!(ext_ctrl & FSL_XCVR_EXT_CTRL_DMA_RD_DIS)) {
@@ -1469,7 +1465,6 @@ static void reset_rx_work(struct work_struct *work)
 				   FSL_XCVR_EXT_CTRL_RX_DPTH_RESET,
 				   0);
 	}
-	spin_unlock_irqrestore(&xcvr->lock, lock_flags);
 }
 
 static irqreturn_t irq0_isr(int irq, void *devid)
-- 
2.43.0

