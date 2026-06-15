Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0F2211A14
	for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 09:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781516425; cv=none; b=icq2ZDnLBP7rTBg6sgN++4p3Dx8lWCpw0hp8Ag/2TOynzpfGA6Ba7RuXKSP6g+SRF8lIUFQiSi5V7tIZsMMGGgE6KYugkUq75ewHYyK0XCJwIgavfOaPvY3Po3s4LzgiFo5NMMx3BGdmvHgHPvE6JvQSmdCdpGYykqNHwUV4DQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781516425; c=relaxed/simple;
	bh=qSQmlpC0OGwGcB+/9udOFkuHWL4YoPGy1E9XqZycimM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UMyjAnUkFVlaO/AAi6ueZuA8fxAdybgEzskrGSxTn3t3AnUolSn8eqFaumSQ6gE1/KtFuHp8aIDEB7SN8XS/fXrMfd1iTcXSNQql4BV7SWjt1NtsNlggcNADg4Jkpx2H2f9s7xD2Z2ibg17qv8plgmjHx6HgkYA1EmSY/1m1HVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=St04RTSX; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="St04RTSX"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-372b4330deeso1960097a91.0
        for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 02:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781516423; x=1782121223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PmZ2sl38PCCS0bv5D9o7S4WvjIIRHmjBHALA0zfK1Ow=;
        b=St04RTSXtX+DC2U0x9DKCHQhBXv5grNQGChMMCs+W9EI6/sSclm0SQMEbBwLT8qqgl
         4R9vuFhaU06Ae25P253ub/td95bIoperqFW0VYlZdN5ISv+IT+eMw92l9rcCUCXO1QXe
         EzOLd114hJ4Kc6se/PGltOYEIcr6czoivUiMb4kZmqcrGBLb4vkp6Jnse1SwNqxK/F2H
         oKk13LoqARoKHSwc3einX62vTnhjGGxGSATvHIm2YZwOYR+pcKG+Lt3D06DfOycpDW0N
         INsEO09hgNF0j9htW43KqQ9usJ7yP3jMCYUf3a+rIiJxTVmYpYRTaAN8Fuu5mFbsXKtB
         yCaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781516423; x=1782121223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PmZ2sl38PCCS0bv5D9o7S4WvjIIRHmjBHALA0zfK1Ow=;
        b=B6aY/JTXjaR2luMmRwvGelHKDGtfvBQh2U4o0ccECe8Pu/Y3pP8YdGT8Jqcvhc9fdx
         9EYsNddNaTTJ1bOWEcAyiVcKrsLtu3kPTO6MoOZ/UPXkpJnIZxsKkuJV5rldK6HJb5e0
         +QQoCTJs3L+oMnLclpLJdS2UDNn3r5IQ8uE6/sVX4tArsDXgN7DVICz6KaKvbFI7skm8
         SZIvcmu85evp3WclCdLrRcNaLlPbkUo2mtO+cmGZ0fFVQY8SqT3No9+1WGsJg38kkYCH
         ZwIsOXQ3XWaVI88UXQhy8W9iTOlEe+LaTvND6usBcXH7Cvs39AOGbjD1KfLp7g6/I7fQ
         a0Kw==
X-Forwarded-Encrypted: i=1; AFNElJ8owAg1g9Ecm3e+wLk+xxsaSko15YgN6lXg0ZDJey7aj9i9bBQtHKHn/K3xMxtdPYrpZXw0YbxJFY+MYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YybzbTouRPA1hsdDH3ZkJN1au+bsgmkXRuRSVBBUwWjGn6sZHVc
	jLVbsp3QmWwss20toFQoWSJz+n+Vw+Ra/Dr+5tEczpmcOyli3ImUFLLH
X-Gm-Gg: Acq92OG6DI51opdzKPOtTDDF6LrjdqsmxGY2m+bdkWFzNK27iHjJ2Fb7v8dp5cTKlnt
	wlQ674BA72hqqV+FqjzxjJg6AwC3gVwxyyZ5wxwpFiOxTkTp3gPXhgJgkWL7i9K3vhLgtmnO+8Q
	8d5RoQJ90b401fwVOkPRkA84Pt7zV5E0VNUS2xhbs94kX+2xnMxiURqVHibGJps73HlLYQDxKN7
	U/ODgkMj6FtDUlG4pig8QujY9hLjhLWeNPvW0T+M/Waulwi3sGcETRevetnqcMfopBlCqmCCMl8
	ViS+kD6dI6VHkysa8M4wMV59zQfioXKhyim6q8FJZzC/D+l+CJY8130XLn18YlucUb8Cb6gXBUr
	5OUIAePykC0pHcyplDzUv5JxNAUx+VraIpjIg+O7JTTnvnkcx4ymYaUnDAmAGCNQchy7ofwas4K
	exGch+1bxokG0R+FwM+L0lqxT/FqG4hOgJqrjC8HEaTaQ2CShA8m4tqqKO5BeOkmKszfaa
X-Received: by 2002:a17:90b:3a81:b0:36d:633a:e7e5 with SMTP id 98e67ed59e1d1-37c2bc5d64bmr9860091a91.3.1781516423443;
        Mon, 15 Jun 2026 02:40:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1eba8e9asm9936290a91.2.2026.06.15.02.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:40:21 -0700 (PDT)
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
Subject: [PATCH v2 04/11] ASoC: fsl_esai: Use guard() for spin locks
Date: Mon, 15 Jun 2026 16:38:17 +0700
Message-ID: <20260615093824.115751-5-phucduc.bui@gmail.com>
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
 sound/soc/fsl/fsl_esai.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index cde0b0c6c1ef..4a530a6c33f0 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -709,10 +709,9 @@ static void fsl_esai_hw_reset(struct work_struct *work)
 {
 	struct fsl_esai *esai_priv = container_of(work, struct fsl_esai, work);
 	bool tx = true, rx = false, enabled[2];
-	unsigned long lock_flags;
 	u32 tfcr, rfcr;
 
-	spin_lock_irqsave(&esai_priv->lock, lock_flags);
+	guard(spinlock_irqsave)(&esai_priv->lock);
 	/* Save the registers */
 	regmap_read(esai_priv->regmap, REG_ESAI_TFCR, &tfcr);
 	regmap_read(esai_priv->regmap, REG_ESAI_RFCR, &rfcr);
@@ -750,8 +749,6 @@ static void fsl_esai_hw_reset(struct work_struct *work)
 		fsl_esai_trigger_start(esai_priv, tx);
 	if (enabled[rx])
 		fsl_esai_trigger_start(esai_priv, rx);
-
-	spin_unlock_irqrestore(&esai_priv->lock, lock_flags);
 }
 
 static int fsl_esai_trigger(struct snd_pcm_substream *substream, int cmd,
@@ -759,7 +756,6 @@ static int fsl_esai_trigger(struct snd_pcm_substream *substream, int cmd,
 {
 	struct fsl_esai *esai_priv = snd_soc_dai_get_drvdata(dai);
 	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
-	unsigned long lock_flags;
 
 	esai_priv->channels[tx] = substream->runtime->channels;
 
@@ -767,16 +763,14 @@ static int fsl_esai_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		spin_lock_irqsave(&esai_priv->lock, lock_flags);
-		fsl_esai_trigger_start(esai_priv, tx);
-		spin_unlock_irqrestore(&esai_priv->lock, lock_flags);
+		scoped_guard(spinlock_irqsave, &esai_priv->lock)
+			fsl_esai_trigger_start(esai_priv, tx);
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		spin_lock_irqsave(&esai_priv->lock, lock_flags);
-		fsl_esai_trigger_stop(esai_priv, tx);
-		spin_unlock_irqrestore(&esai_priv->lock, lock_flags);
+		scoped_guard(spinlock_irqsave, &esai_priv->lock)
+			fsl_esai_trigger_stop(esai_priv, tx);
 		break;
 	default:
 		return -EINVAL;
-- 
2.43.0

