Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E79D47DF96
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 11:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844331; cv=none; b=uzaZW5dPuMe82rjofm/XwnH/sUrEZAPgdolX+HTMMcsHFl/E6ocuRaqDZLou9i/nUSmI48py/vmYWlojKNMajDfys7ZnkNRRDqt+u6qCfoFjMt5C4h1/ZBTOs0BHl4DAaI+/eJ5qKSSpwy7KSQDVuzwxcwkj9qit5uYKpJOMt4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844331; c=relaxed/simple;
	bh=9X50H0I+x7I976Wzew0r+L0k3lHvMtlfL5mk+JUjdSM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JLmb+3M6iSIalfGDXNr6W2LCz5XlZ2wb+kOdcWHdnwguJEhDpiViEqnhFs0z/cv5nOSPxWe89JusSB7xDAwAd1SBChKsdMmbizp92x84QFXNv/TKAH23nGLG+jYx51EA6qyzEZ8Z+QViVYuZ8WUzlwCCQHzxXvIMVqPB3pZYeu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MJ1hkt25; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MJ1hkt25"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2bd8c4aa911so4346535ad.0
        for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 04:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778844329; x=1779449129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8VLjZ5HRUHB7pc8eNKnSNbRiReFzaEooAwXWvAuxy2w=;
        b=MJ1hkt25sVFX5zmlt+0qh9k9YnvEIWLt/vBfMKX5PaQu/lSMnr25pybCP0zzD+TWpE
         W2s5X6kz0NssD3Muh0UIc9zQAJl9iZpIi4tPrPD2ecU0x9OTihpu1YnIFWgfETTzeWS1
         LdK3bjF93cZzXvS+Rfm7diMNjRDsEaGaG5A+WRcMFrGWDXGXIC1IhWznFGPZkYbgYRIH
         AOHpVzEddrj4liuBBqklFrw7Er9wLxtgesSpLQoArQj1J5ZBW3nAn+2tkTgVqRMFsTEA
         MrYoBSJWf/yQYM0TzLvLYEa2FfiVDQYOQElkTcpWqaBWC0JksxQRFB9FLPCljOqVVQ5X
         9rvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778844329; x=1779449129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8VLjZ5HRUHB7pc8eNKnSNbRiReFzaEooAwXWvAuxy2w=;
        b=OINk+pDZC5QX5s73y44KXPj42uhLlhuKe14f7CeN1QiPjaXCtdicnNQAig3eGNclO9
         jXBuxtTXA0p8b/2y8vmnTiK9Cp2gu6TbOnOEaBe7WGd3wPIzpF70AabXTQhquDCmO461
         s//PY5MQDcyug83kLLOubkGmM+8Rvpf3hQYj8aPDr4m44TtAjsG2suKWvlVU+V9LJYZh
         XDSVnmsd0uKe6mtG7RWV77OqvlU7b250y5mANFG4c3VEWqECvMPymYD8dhzY071vFzwO
         69IMsrbLQg8TtWae2YiUs9j3aCpQ8IulCy/ixl7DPBfJ+omuO66usodxBohFafyFWDgI
         ZoHQ==
X-Forwarded-Encrypted: i=1; AFNElJ/5oaB7aGj5do7vtmmnqTbOH4VLLK00BKG3Yso+tdhqOVOmNRGCT2bWFNDYYOLxNmkRJhEZqggEC+Daxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyhToJPvbM9NDC9hCleznD668ccIeeTw7mP/lnScTxxovR5X2k
	v1o4S3mNY+Pq+AaHdVJydwxgP5iz89cwAolmXAoLwWhXxxfW55bFekoJ
X-Gm-Gg: Acq92OEc7a+QwQ3kPqxlzep8sQ5EKPtm5CrGni4MPWo30lFZOUrBmu79+HGMtVaVDak
	NgLXfiNrwmu+1390W65x/m9rrangPwCJZAQlkQ0WPSg6UBVNbrgRG0hy0igWIoHSKhheeWpfyzi
	I1QHEYTee6sCjW6Rpxqu2VB88NW93bPJvVD7TFOm+sm95sE3vJ3AUUIeJnWUabI+P3Y8VsXGTlF
	oPl8ufdN4viIGhPmPY4O90WBz3kP4obfYUsjUZgyRLSqUZMi2V0ASyajKp12SjIMszGEp6ouTYd
	uiolKL2e2+CwBSRRqb9LqtiRzWcKvZoYPgPWG9S3zi90tRY6tfBigGDiwAECcBbMo3E7iNsu+E3
	3Yp+fk9gNmmaS001H5IG+lZ+sgUKtItgwqW7/S/JHD4dtCKnzFP4Mv6+MpMOjMGlM7rE6/C5Ueu
	phzsb+V+/xUZc/jhIiJHltS2CQg+kPheR0i9EBEowTS1gJZwrhhmqoS+8tUBgxYtnDa+iu
X-Received: by 2002:a17:902:d5d0:b0:2b0:7531:b61e with SMTP id d9443c01a7336-2bd7e97a6c2mr26865625ad.41.1778844329329;
        Fri, 15 May 2026 04:25:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fd856sm54530385ad.66.2026.05.15.04.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:25:28 -0700 (PDT)
From: phucduc.bui@gmail.com
To: olivier.moysan@foss.st.com,
	arnaud.pouliquen@foss.st.com,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 3/4] ASoC: stm: stm32_sai_sub: Use guard() for mutex & spin locks
Date: Fri, 15 May 2026 18:24:57 +0700
Message-ID: <20260515112458.34378-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260515112458.34378-1-phucduc.bui@gmail.com>
References: <20260515112458.34378-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex & spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/stm/stm32_sai_sub.c | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index 3e82fa90e719..ea9e8bddd63f 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -280,9 +280,8 @@ static int snd_pcm_iec958_get(struct snd_kcontrol *kcontrol,
 {
 	struct stm32_sai_sub_data *sai = snd_kcontrol_chip(kcontrol);
 
-	mutex_lock(&sai->ctrl_lock);
+	guard(mutex)(&sai->ctrl_lock);
 	memcpy(uctl->value.iec958.status, sai->iec958.status, 4);
-	mutex_unlock(&sai->ctrl_lock);
 
 	return 0;
 }
@@ -292,9 +291,8 @@ static int snd_pcm_iec958_put(struct snd_kcontrol *kcontrol,
 {
 	struct stm32_sai_sub_data *sai = snd_kcontrol_chip(kcontrol);
 
-	mutex_lock(&sai->ctrl_lock);
+	guard(mutex)(&sai->ctrl_lock);
 	memcpy(sai->iec958.status, uctl->value.iec958.status, 4);
-	mutex_unlock(&sai->ctrl_lock);
 
 	return 0;
 }
@@ -658,10 +656,10 @@ static irqreturn_t stm32_sai_isr(int irq, void *devid)
 		status = SNDRV_PCM_STATE_XRUN;
 	}
 
-	spin_lock(&sai->irq_lock);
-	if (status != SNDRV_PCM_STATE_RUNNING && sai->substream)
-		snd_pcm_stop_xrun(sai->substream);
-	spin_unlock(&sai->irq_lock);
+	scoped_guard(spinlock, &sai->irq_lock) {
+		if (status != SNDRV_PCM_STATE_RUNNING && sai->substream)
+			snd_pcm_stop_xrun(sai->substream);
+	}
 
 	return IRQ_HANDLED;
 }
@@ -894,11 +892,9 @@ static int stm32_sai_startup(struct snd_pcm_substream *substream,
 {
 	struct stm32_sai_sub_data *sai = snd_soc_dai_get_drvdata(cpu_dai);
 	int imr, cr2, ret;
-	unsigned long flags;
 
-	spin_lock_irqsave(&sai->irq_lock, flags);
-	sai->substream = substream;
-	spin_unlock_irqrestore(&sai->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &sai->irq_lock)
+		sai->substream = substream;
 
 	if (STM_SAI_PROTOCOL_IS_SPDIF(sai)) {
 		snd_pcm_hw_constraint_mask64(substream->runtime,
@@ -1083,7 +1079,7 @@ static void stm32_sai_set_iec958_status(struct stm32_sai_sub_data *sai,
 		return;
 
 	/* Force the sample rate according to runtime rate */
-	mutex_lock(&sai->ctrl_lock);
+	guard(mutex)(&sai->ctrl_lock);
 	switch (runtime->rate) {
 	case 22050:
 		sai->iec958.status[3] = IEC958_AES3_CON_FS_22050;
@@ -1116,7 +1112,6 @@ static void stm32_sai_set_iec958_status(struct stm32_sai_sub_data *sai,
 		sai->iec958.status[3] = IEC958_AES3_CON_FS_NOTID;
 		break;
 	}
-	mutex_unlock(&sai->ctrl_lock);
 }
 
 static int stm32_sai_configure_clock(struct snd_soc_dai *cpu_dai,
@@ -1284,7 +1279,6 @@ static void stm32_sai_shutdown(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *cpu_dai)
 {
 	struct stm32_sai_sub_data *sai = snd_soc_dai_get_drvdata(cpu_dai);
-	unsigned long flags;
 
 	stm32_sai_sub_reg_up(sai, STM_SAI_IMR_REGX, SAI_XIMR_MASK, 0);
 
@@ -1298,9 +1292,8 @@ static void stm32_sai_shutdown(struct snd_pcm_substream *substream,
 	if (!sai->sai_mclk && sai->put_sai_ck_rate)
 		sai->put_sai_ck_rate(sai);
 
-	spin_lock_irqsave(&sai->irq_lock, flags);
-	sai->substream = NULL;
-	spin_unlock_irqrestore(&sai->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &sai->irq_lock)
+		sai->substream = NULL;
 }
 
 static int stm32_sai_pcm_new(struct snd_soc_pcm_runtime *rtd,
-- 
2.43.0

