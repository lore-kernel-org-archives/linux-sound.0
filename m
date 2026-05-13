Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030983F211A
	for <linux-sound@vger.kernel.org>; Wed, 13 May 2026 10:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778669048; cv=none; b=be2+5dx1+/95kkX//NeyFxfZlySrrFmjpuCFKuQbftXQqfTC6FEjXGfCa5NFeF26HSAAd5uPIdnq/jGGqn3hGAnYxk+3dYuhMn/pgo4wkiwFq7Zo48JBWheKXPeOLdoJki2uzPelQRgKZ38c3scADkqq0jUnN8N6A/NBBo3JyhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778669048; c=relaxed/simple;
	bh=9X50H0I+x7I976Wzew0r+L0k3lHvMtlfL5mk+JUjdSM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O0SE930qEHKwUO02saQhtY9VaBdGZtcrvK4r57beJnjkK52DZI1oqgpQrJdYSTfLMzuyo6A9e+TLhmkWaWPkkU3OL+hKPrNlhjSk/Jn1UrNlxKR4xeOZkv/DY7nB2PGQ1uQRfsRjjcEenmOQXtg/y0xEJ6jO2GoQQIYUh3c43kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XYNx756L; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XYNx756L"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2bab2548e8bso30836925ad.0
        for <linux-sound@vger.kernel.org>; Wed, 13 May 2026 03:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778669046; x=1779273846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8VLjZ5HRUHB7pc8eNKnSNbRiReFzaEooAwXWvAuxy2w=;
        b=XYNx756Lh159wN91tytiBD4euWzr0DG7vFLLDtOtvNm1au8eyE3a+sf77M10ONLMg+
         gNQrOPYwml8Z7CBnmtnj1jMTEsTQ+upa9QyweWGXiAzbWuriHRS1EWRdeRBuX3t+y/+U
         Va1Kmcfub/7nPoggf2BYOPQDrDZ9mroBjQCTKK3E/qcPysSAGYytjrjLUWiviap3EmhS
         soSLOvPoVAeEWuL3/7EpvRbfyHKKHsfjZpVcXkAy8KHVP7H20pBSEpptbvsWgJMPvBlT
         SZTrvJcSAEiGaOzZITMcVl+30KGhQxtNq2Ra1mgY2ga3RVvaq3JB4lGeRmqG9I9YuOLt
         6eqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778669046; x=1779273846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8VLjZ5HRUHB7pc8eNKnSNbRiReFzaEooAwXWvAuxy2w=;
        b=cvtytWQeZX938Hy2Q83tgPmwA4LLb7VBm+IGVfiJnZp9ca0ppxcX4LKLWmf/rLG+Az
         z7wfbHb9r9XGIZg2XYQf1ZmnZt36NOxK2HMCq0PYNDA6shZcEmzrG2LJ6LNKuXPIiVyH
         /UTn4tpTm2krUlWizQQns3vPLXmjgOSQZ8cT9cAUPqoBrKctKQQ+AGHmkXKiqaEWOIiZ
         Kxpb2hIdYgb4iRQj7mAe+5tyPeDxAJwGD8Qya1sBkWd5bisBYn+R628fROWwOB217ssr
         unBKTIANR3stXstpiv8VnLK0CCC0fwVls2ZIPrv/u1pvuhZnuYQXfgZ9WeS8ljSwUEC0
         gcbA==
X-Forwarded-Encrypted: i=1; AFNElJ+Wt6DKtVpTfmYodHJ21cQk/LgdbuHfAMzSJjvqZ7VDT6ocAD3PF6a82WUmV4tKdQB8X8DKQA06egwwaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMssS9n3VP3xreEyN5lSWc9YpekKQXPVTGpU00jm7cMSAV8uKl
	fnHOxDzDSXY48aWXhcScCh7QVp8pEoXA60JNuQ548FBXhyQGmDWaROP0
X-Gm-Gg: Acq92OFMnqkn7GVWtfGSQK0fXN3ROIv4uWbExmxK8+zqoC1P315Ecgpl7npoyq7mZYr
	ZUnrfc1xyOY6QiOjKYMEFt8KhxuNyBli5GbiTQPbptTs9Xbs5GbHsA/QlwIDGhnwOpAhaYbLEO0
	+/t04bGmoRekFcseV4KKdR/PyFqBOx1nCK3VwdgrawiIrf+PXWizxF9ew9ZYeEFmJNG7oJnUftr
	Ex/vqDMw5j4oSbkZg0e48miN88GfhdTemCJpgn7B03pme3VV08+UATO2sOSrDEMfPKtECpEWpO+
	aiKw2I34FNbyqAfiAexQKVcSlfqCC248nxU4x/x49G5tHb1G4Qjq3eF/1q5J9u4uj84/c2aHj3H
	OwdoUVhep1psqzdrv97jmY2TlWy5p0kVbAlU+lSurffaOBWYI9NdxQiaBDxXPmJvUgYRiISt/aV
	wipBBtpl1bXSrU9h8RIXTkAU4fVR6QG1tkD4Lna/RFafTrknvaj1yOEtOPWA==
X-Received: by 2002:a17:902:c40f:b0:2ba:bfc:76b5 with SMTP id d9443c01a7336-2bd2f4dba62mr24128275ad.4.1778669046222;
        Wed, 13 May 2026 03:44:06 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e35e9dsm170479535ad.39.2026.05.13.03.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 03:44:06 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/4] ASoC: stm: stm32_sai_sub: Use guard() for mutex & spin locks
Date: Wed, 13 May 2026 17:43:28 +0700
Message-ID: <20260513104329.81592-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513104329.81592-1-phucduc.bui@gmail.com>
References: <20260513104329.81592-1-phucduc.bui@gmail.com>
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

