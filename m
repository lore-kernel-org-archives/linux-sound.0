Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D438518AE3
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 05:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775711276; cv=none; b=Cevafb419CbaQ7kHzNgDws8yG69Fixi2u6pWZ0ldcfEUdh6wFgXhUPVroMmGetVgLis6Ozyx46At+/969pgSUSHLqPKn0U4uwmKOFVMa7aPs+CHtz1i0pWI3q2YHPkvVtaPiEErIraXci4b/G8l8Ytsj5P2azkAE4yF9zsNx8yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775711276; c=relaxed/simple;
	bh=LzW3JM4BIkuh3dXk6nKvU5Nj9l42FLzIyP3Xm1Tl9ek=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VsR3ENy5dkn21yDz5TXVXmyK/PsFs4xpFbvItppaxEjVp3HLQ6pXfKax/ZrWcnVN1SdGhjb7ZHbt/gJdsvAQgOK/xcksIGeUrCAgwlQJ1Lk+pWWhXWpDWl/iXTiExRJzty8yivAuFAR4qW5pQIxIOTeAfnUWAeglOZXbZ+kahYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=be5JM72O; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="be5JM72O"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12c1fcce8f8so3588363c88.1
        for <linux-sound@vger.kernel.org>; Wed, 08 Apr 2026 22:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775711274; x=1776316074; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CO4Y3v2y5LC1rP0BVajwReTvbiUPuMkV3YBcRwbWUQM=;
        b=be5JM72OCQ1znDUY5g9+HTK+b1y8cnmYUxAGWMNabJu+U4AdC9+O/ZpO67pCaafSVd
         A/EhU+ae3tzf68tAUIwH6HSkB/Pr6DDcDM5plBuVjsbn1+je7jmmwb7Lao8Vr9URKEQc
         rKieqBW2QddPYjYU9EL5JfueQu5iUUaJWVFeyOM7xipegPKelFHUUr8Eyd/Nz9DNAol1
         Dn6SLcVERccFNMfNEDLHIy77gShP6bS1P80jP+dvTPy9dBWbHx8SM1SiuKPHbNAVb4cy
         5Ivam1RD2CVuuE8j5l9nKcSzGmL0txEWVAf6AoFXZrOR/qC57uDns0OG7IGQET38MLGV
         YmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775711274; x=1776316074;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CO4Y3v2y5LC1rP0BVajwReTvbiUPuMkV3YBcRwbWUQM=;
        b=ZRuEbiTfnqOx31qDBoc1MzIuldG4Dbul0YSEw04qLk9gJqI9ZuhGFd14/eCh7OT29t
         NNR0awOdUpqjExoAipFhF/CXefjgARTY7eecDY1UBeodwJv6tiXukbD9JO7URPMwazRe
         WqKGiUlrekaiqfndZtNScG7LpPa6xR3IdM20KR2k9h260MaL3wJH/yerrTAwFcyVChts
         MpqXpdxM7sF+6HrRrjXAgdlunGIBYcEfSbv3FqJtMNsdxe+91HVsMO/38LvCnrAVLPVg
         l75HRDIzwWWhKroJuArUGJFE1XnDRLn2z0WKLjpbE5cfiW966oq142GJAf39/1CAnKtW
         a0LA==
X-Gm-Message-State: AOJu0YxM32Hu790CpEQC+WRjhhiS+wx7tscRjxRqZY/P76zI14sQFBdh
	cEPXo1tHzzTrDKmQYto91Ghfak0tn8axsJpqwZlRrdKPILh9p1iWe/Fe
X-Gm-Gg: AeBDieu+VsOl2NUxJLOi7g+vdXRqQ5TKcM8iW2PxdcY1jSJJREXX4u+h/XAifQtlGsF
	4C6fTpjDZVwHH2DhC3skRsZ+gdb3hy3sbBx2tX5R3g2Va8/5by/u16OYdgQpq+KQkB5G13/3Z8Y
	l8DK0oiCYG1zRY0kplW/b/08hoBY1gf/tVVUCRuuU7PeR96xQpwTeJylAyrRVbZkYUZtsMqgqN6
	xLNf06JDWyrxcOvNRtEIl/S175lilcpp77OIpZHtSZMzeSSjc0FhS4Z2SQPCN/keGvrtZgOayOb
	jeK8/vbWM7iu9zpwX3k1MWoHqc7PEP4bpAkKN0UMhBCAW565vMEWCd4afqDYMasUMiZGX9E3oqK
	Ey/b04Ng/gQnZKEM6q2WjOFt0tC+5r0NdCwMubkSZIFRJ65kcMYxcP7cKLcqjoG96hZI9FEbBkS
	vhxBrU19JbhTUNybOQZnznCUeP0hmdsdh04Akx/LtNsCM7UqNehiteR0cJESouIgEQR12zkbt24
	Tg0
X-Received: by 2002:a05:7300:e207:b0:2d1:d434:cfe3 with SMTP id 5a478bee46e88-2d1d434d32fmr5533344eec.0.1775711273850;
        Wed, 08 Apr 2026 22:07:53 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-167.user3p.v-tal.net.br. [177.4.161.167])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7c3010e9sm29975641eec.14.2026.04.08.22.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 22:07:53 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Thu, 09 Apr 2026 02:07:45 -0300
Subject: [PATCH 1/2] ALSA: msnd: prepare system sleep support
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260409-msnd-pm-support-v1-1-2abef720d0e7@gmail.com>
References: <20260409-msnd-pm-support-v1-0-2abef720d0e7@gmail.com>
In-Reply-To: <20260409-msnd-pm-support-v1-0-2abef720d0e7@gmail.com>
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5789;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=LzW3JM4BIkuh3dXk6nKvU5Nj9l42FLzIyP3Xm1Tl9ek=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJnXTVSq983SORjarnS0YHtmiH3b3BPnMvysJ9pdr2GPY
 V7D0n2go5SFQYyLQVZMkWV10iLLPV0PrtbHrfCAmcPKBDKEgYtTACYSmczIcKChIGfBinKTbd2c
 fM75x61+l59MPMPbmvLzn0Ze+8fMl4wM9/0nf998i/GSOjuXUUP/jwIzCXetm7Vb1h8qEKwqDJn
 GAQA=
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

System suspend cannot work for msnd today because the PCM trigger
paths reject SNDRV_PCM_TRIGGER_SUSPEND, and the driver has only
refcounted IRQ helpers.

Add the small helpers needed by the PM callbacks and restore master
volume from the cached ALSA mixer state when the DSP is
reinitialized.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/isa/msnd/msnd.c                | 72 ++++++++++++++++++++++++------------
 sound/isa/msnd/msnd.h                |  1 +
 sound/isa/msnd/msnd_pinnacle_mixer.c |  4 ++
 3 files changed, 54 insertions(+), 23 deletions(-)

diff --git a/sound/isa/msnd/msnd.c b/sound/isa/msnd/msnd.c
index 5e350234d572..77367e102fda 100644
--- a/sound/isa/msnd/msnd.c
+++ b/sound/isa/msnd/msnd.c
@@ -127,11 +127,8 @@ int snd_msnd_upload_host(struct snd_msnd *dev, const u8 *bin, int len)
 }
 EXPORT_SYMBOL(snd_msnd_upload_host);
 
-int snd_msnd_enable_irq(struct snd_msnd *dev)
+static int __snd_msnd_enable_irq(struct snd_msnd *dev)
 {
-	if (dev->irq_ref++)
-		return 0;
-
 	dev_dbg(dev->card->dev, LOGNAME ": Enabling IRQ\n");
 
 	guard(spinlock_irqsave)(&dev->lock);
@@ -152,17 +149,9 @@ int snd_msnd_enable_irq(struct snd_msnd *dev)
 
 	return -EIO;
 }
-EXPORT_SYMBOL(snd_msnd_enable_irq);
 
-int snd_msnd_disable_irq(struct snd_msnd *dev)
+static int __snd_msnd_disable_irq(struct snd_msnd *dev)
 {
-	if (--dev->irq_ref > 0)
-		return 0;
-
-	if (dev->irq_ref < 0)
-		dev_dbg(dev->card->dev, LOGNAME ": IRQ ref count is %d\n",
-			dev->irq_ref);
-
 	dev_dbg(dev->card->dev, LOGNAME ": Disabling IRQ\n");
 
 	guard(spinlock_irqsave)(&dev->lock);
@@ -178,8 +167,39 @@ int snd_msnd_disable_irq(struct snd_msnd *dev)
 
 	return -EIO;
 }
+
+int snd_msnd_enable_irq(struct snd_msnd *dev)
+{
+	if (dev->irq_ref++)
+		return 0;
+
+	return __snd_msnd_enable_irq(dev);
+}
+EXPORT_SYMBOL(snd_msnd_enable_irq);
+
+int snd_msnd_disable_irq(struct snd_msnd *dev)
+{
+	if (--dev->irq_ref > 0)
+		return 0;
+
+	if (dev->irq_ref < 0)
+		dev_dbg(dev->card->dev, LOGNAME ": IRQ ref count is %d\n",
+			dev->irq_ref);
+
+	return __snd_msnd_disable_irq(dev);
+}
 EXPORT_SYMBOL(snd_msnd_disable_irq);
 
+int snd_msnd_force_irq(struct snd_msnd *dev, bool enable)
+{
+	if (!dev->irq_ref)
+		return 0;
+
+	return enable ? __snd_msnd_enable_irq(dev) :
+			__snd_msnd_disable_irq(dev);
+}
+EXPORT_SYMBOL(snd_msnd_force_irq);
+
 static inline long get_play_delay_jiffies(struct snd_msnd *chip, long size)
 {
 	long tmp = (size * HZ * chip->play_sample_size) / 8;
@@ -507,25 +527,27 @@ static int snd_msnd_playback_trigger(struct snd_pcm_substream *substream,
 				     int cmd)
 {
 	struct snd_msnd *chip = snd_pcm_substream_chip(substream);
-	int	result = 0;
 
-	if (cmd == SNDRV_PCM_TRIGGER_START) {
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
 		dev_dbg(chip->card->dev, "%s(START)\n", __func__);
 		chip->banksPlayed = 0;
 		set_bit(F_WRITING, &chip->flags);
 		snd_msnd_DAPQ(chip, 1);
-	} else if (cmd == SNDRV_PCM_TRIGGER_STOP) {
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
 		dev_dbg(chip->card->dev, "%s(STOP)\n", __func__);
-		/* interrupt diagnostic, comment this out later */
 		clear_bit(F_WRITING, &chip->flags);
 		snd_msnd_send_dsp_cmd(chip, HDEX_PLAY_STOP);
-	} else {
+		break;
+	default:
 		dev_dbg(chip->card->dev, "%s(?????)\n", __func__);
-		result = -EINVAL;
+		return -EINVAL;
 	}
 
 	dev_dbg(chip->card->dev, "%s() ENDE\n", __func__);
-	return result;
+	return 0;
 }
 
 static snd_pcm_uframes_t
@@ -589,17 +611,22 @@ static int snd_msnd_capture_trigger(struct snd_pcm_substream *substream,
 {
 	struct snd_msnd *chip = snd_pcm_substream_chip(substream);
 
-	if (cmd == SNDRV_PCM_TRIGGER_START) {
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
 		chip->last_recbank = -1;
 		set_bit(F_READING, &chip->flags);
 		if (snd_msnd_send_dsp_cmd(chip, HDEX_RECORD_START) == 0)
 			return 0;
 
 		clear_bit(F_READING, &chip->flags);
-	} else if (cmd == SNDRV_PCM_TRIGGER_STOP) {
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
 		clear_bit(F_READING, &chip->flags);
 		snd_msnd_send_dsp_cmd(chip, HDEX_RECORD_STOP);
 		return 0;
+	default:
+		break;
 	}
 	return -EINVAL;
 }
@@ -668,4 +695,3 @@ EXPORT_SYMBOL(snd_msnd_pcm);
 
 MODULE_DESCRIPTION("Common routines for Turtle Beach Multisound drivers");
 MODULE_LICENSE("GPL");
-
diff --git a/sound/isa/msnd/msnd.h b/sound/isa/msnd/msnd.h
index 3d7810ed9186..b25beca25c0d 100644
--- a/sound/isa/msnd/msnd.h
+++ b/sound/isa/msnd/msnd.h
@@ -280,6 +280,7 @@ int snd_msnd_upload_host(struct snd_msnd *chip,
 			     const u8 *bin, int len);
 int snd_msnd_enable_irq(struct snd_msnd *chip);
 int snd_msnd_disable_irq(struct snd_msnd *chip);
+int snd_msnd_force_irq(struct snd_msnd *chip, bool enable);
 void snd_msnd_dsp_halt(struct snd_msnd *chip, struct file *file);
 int snd_msnd_DAPQ(struct snd_msnd *chip, int start);
 int snd_msnd_DARQ(struct snd_msnd *chip, int start);
diff --git a/sound/isa/msnd/msnd_pinnacle_mixer.c b/sound/isa/msnd/msnd_pinnacle_mixer.c
index ec354483b9f8..8ca987221753 100644
--- a/sound/isa/msnd/msnd_pinnacle_mixer.c
+++ b/sound/isa/msnd/msnd_pinnacle_mixer.c
@@ -310,6 +310,10 @@ EXPORT_SYMBOL(snd_msndmix_new);
 
 void snd_msndmix_setup(struct snd_msnd *dev)
 {
+	writew(dev->left_levels[MSND_MIXER_VOLUME],
+	       dev->SMA + SMA_wCurrMastVolLeft);
+	writew(dev->right_levels[MSND_MIXER_VOLUME],
+	       dev->SMA + SMA_wCurrMastVolRight);
 	update_pot(MSND_MIXER_LINE, bInPotPos, HDEXAR_IN_SET_POTS);
 	update_potm(MSND_MIXER_AUX, bAuxPotPos, HDEXAR_AUX_SET_POTS);
 	update_volm(MSND_MIXER_PCM, wCurrPlayVol);

-- 
2.53.0

