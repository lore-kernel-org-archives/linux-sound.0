Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1E03EE1F5
	for <linux-sound@vger.kernel.org>; Thu, 23 Apr 2026 12:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776949033; cv=none; b=bmR25nk9osDzgXy/cuLrgWxhoRBa/DSvab3fJJBLeSZjsselAphvQLOC+YF6yItsgt60UXuWEQakBQwd3GIz3vPvb+G10oSbHlTRFz5l1z2cJ/8TwTaAekIyduar3tNRCSfr98Wn89letwcj5I31MUUqQp/XlcPbEi8gTIjWbUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776949033; c=relaxed/simple;
	bh=IKHZ3q96hTXuMIiH9BNrB3LA3G5rq5jK3yc32SGuub4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tHk1N7OEZHt2clhJrIhBxw6PEfIckJWl47kGH8V5u0ZEiaVZ4CqR4IwqpOmox3pBptdNHGpvGXV8u3KY8S+IhCCSP/QXKSOuVMcNRuJeoNIy2HKyMdDhBw4crwlV2BvciLtvmmMOjkneD5Ef1zv4bUmNXPrMPaqsGye5miTh6OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S8r3Sg2s; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S8r3Sg2s"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2adff872068so32731105ad.1
        for <linux-sound@vger.kernel.org>; Thu, 23 Apr 2026 05:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776949031; x=1777553831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M/+1WbMY5u1hix2GJGcVANS/NpesLEU0QcdbmptLbD0=;
        b=S8r3Sg2sd/eGxEqiktHJyGQ/DilI95VfPrIqo4l2GSBO3PUCTSg+AJWr/8J1sWTznE
         0wQl08QXQJnLYespxOhpVLr+DUhEPmcObKWpqacPWqGWdE8aLcFl38XusdpKmHFeGYTE
         +pQAXLBPaaEZUxxC601m6BY3qy9PAtHXii1YJgrWbBZ4JpwT+1elGMasPFJUvHakqUWk
         SgG7IxukxaTpnbXKNpeF8f5yBRsJKZuXul5eIQ+biACVUPvafVw2Xj4EhWnzssV637KE
         SMAWjMBDGILaNUzA77fnNMcna5heW9oYncEHuljcUvO7Oc8rk6381A35ooa1GS7cXaY4
         XC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776949031; x=1777553831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M/+1WbMY5u1hix2GJGcVANS/NpesLEU0QcdbmptLbD0=;
        b=ZG7oNTwfHF9vikHLheVYzseyFP/PQ9E7zrwhIJ97iMloEEQrOp6++4rzu0pewYV3Oi
         UWx7mqBvwTKOz0rAPISgDo+sOKqR6nLl7TRJPM/xHx9T1Rtdely2GslZjqu/WW6MHxhz
         el+rvKVKMoxfArbdR0jMUK8aAhzw/ckuE6iHq77HX48eEsn7UHMGt4xj1skaqBHlPmP2
         6lNSKIfgReCjGgwYjufT8UpyFlcfWs7XIiVlnq2Tv8oy0O+LmTQNEWSdlOTSBJwxFrfU
         ShwiIX76TI/dCYvFhGrRTd8zNlWGAXEzXol306XtDCUMXnuP1m4P264z02hVqlgBByqP
         NnzA==
X-Forwarded-Encrypted: i=1; AFNElJ9pmsFgDywi5QOlCa0qHc1kmyyJZptxd8BKhcqb74Vto4jaXrtzA9WvjWAoYh7mKh3M00FpkYaxLxsdhA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvk3hz/FxvZdTLfdRnO8RkmJodJh/vAV7ZpHA0m800P5e3tyYI
	2JuEnwAwLqftSHoDOrvWwzTyvCOPixTHW5SpvLQzp20mzrz9USlms/b6
X-Gm-Gg: AeBDietiyP2hCOPDIUEVD3Ud/yPTh3iAcP65UKDsFzOpM6xB232uHhtH4M/nxW4c5WU
	vTmklDr4neGVymkgl/gSm86FQ0hg3pPvmxbSBk2tQl5OQFbVHbRWPytWQf8GQA7gbzfTKHwsBZP
	JuRAxvKMo+aTIhGVKW1htMY31QwQNlvhiLkG+jpkGI7U2WIzrLdJq59Woqs15KXl2phMx5ME4vT
	xIXAMcazs7vnESOK89CJB6JsGTFuTTrAymBoVIKtPyPumHNU7RoJThnVoJFnJ4bqliDS3ggkv64
	O0LEe7YT2dIWZZgFyfLVz03a0PMkxPXVaARWPrreH1oo0cHaIkOImLGuOYFohxGV+wyVkzR6w1I
	sojagkskWH/AJl67rT7aZ22btLCxY3UsblB4j/1n/isPko6tls0AnQtVCsBXXHUkp0LcwcEve06
	cfvHkn2AMF2JHQAuf1v7gjgLMt1V2bo/SCqV2L00tajcnzZJh63+gD3IZoWwf5JrCJI2zT
X-Received: by 2002:a17:903:98b:b0:2b0:7026:24bf with SMTP id d9443c01a7336-2b5f9eff280mr280220285ad.14.1776949030721;
        Thu, 23 Apr 2026 05:57:10 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff390sm192106545ad.9.2026.04.23.05.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:57:10 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	asahi@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/5] ASoC: samsung: idma: Use guard() for spin locks
Date: Thu, 23 Apr 2026 19:56:43 +0700
Message-ID: <20260423125646.156599-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423125646.156599-1-phucduc.bui@gmail.com>
References: <20260423125646.156599-1-phucduc.bui@gmail.com>
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
 sound/soc/samsung/idma.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/sound/soc/samsung/idma.c b/sound/soc/samsung/idma.c
index cb455ddce253..d362136e1069 100644
--- a/sound/soc/samsung/idma.c
+++ b/sound/soc/samsung/idma.c
@@ -67,9 +67,8 @@ static int idma_enqueue(struct snd_pcm_substream *substream)
 	struct idma_ctrl *prtd = substream->runtime->private_data;
 	u32 val;
 
-	spin_lock(&prtd->lock);
-	prtd->token = (void *) substream;
-	spin_unlock(&prtd->lock);
+	scoped_guard(spinlock, &prtd->lock)
+		prtd->token = (void *) substream;
 
 	/* Internal DMA Level0 Interrupt Address */
 	val = idma.lp_tx_addr + prtd->periodsz;
@@ -101,16 +100,15 @@ static void idma_setcallbk(struct snd_pcm_substream *substream,
 {
 	struct idma_ctrl *prtd = substream->runtime->private_data;
 
-	spin_lock(&prtd->lock);
+	guard(spinlock)(&prtd->lock);
 	prtd->cb = cb;
-	spin_unlock(&prtd->lock);
 }
 
 static void idma_control(int op)
 {
 	u32 val = readl(idma.regs + I2SAHB);
 
-	spin_lock(&idma.lock);
+	guard(spinlock)(&idma.lock);
 
 	switch (op) {
 	case LPAM_DMA_START:
@@ -120,12 +118,10 @@ static void idma_control(int op)
 		val &= ~(AHB_INTENLVL0 | AHB_DMAEN);
 		break;
 	default:
-		spin_unlock(&idma.lock);
 		return;
 	}
 
 	writel(val, idma.regs + I2SAHB);
-	spin_unlock(&idma.lock);
 }
 
 static void idma_done(void *id, int bytes_xfer)
@@ -192,7 +188,7 @@ static int idma_trigger(struct snd_soc_component *component,
 	struct idma_ctrl *prtd = substream->runtime->private_data;
 	int ret = 0;
 
-	spin_lock(&prtd->lock);
+	guard(spinlock)(&prtd->lock);
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_RESUME:
@@ -214,8 +210,6 @@ static int idma_trigger(struct snd_soc_component *component,
 		break;
 	}
 
-	spin_unlock(&prtd->lock);
-
 	return ret;
 }
 
@@ -228,12 +222,10 @@ idma_pointer(struct snd_soc_component *component,
 	dma_addr_t src;
 	unsigned long res;
 
-	spin_lock(&prtd->lock);
-
-	idma_getpos(&src);
-	res = src - prtd->start;
-
-	spin_unlock(&prtd->lock);
+	scoped_guard(spinlock, &prtd->lock) {
+		idma_getpos(&src);
+		res = src - prtd->start;
+	}
 
 	return bytes_to_frames(substream->runtime, res);
 }
-- 
2.43.0

