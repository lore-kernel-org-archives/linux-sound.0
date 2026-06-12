Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACC337CD31
	for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 13:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781270843; cv=none; b=heEBe0dS0cOkuUhzRrKp8iErtWSUnv+J+pV5RS/dRn5MQKCP1RG5myBPs9ijuPxRVTMNhG/icz0dzaepGpDiJDeb7MUH8VLeRwoxlZWQABliwjL0CzmVEo0fYLLKDVCJ6uso2bKyKCPH2Z+GSkvv0ga1R8B29VEvo0GsZgn9d6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781270843; c=relaxed/simple;
	bh=qSQmlpC0OGwGcB+/9udOFkuHWL4YoPGy1E9XqZycimM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q9Bjo3xR4wX++DoIb50LXl4upwlcxzfOm29dY8QITCy+sgO8ihbFjgCpXSi+c2LD67psqBeBLRsHfSxW5ujDILHNRoX+EyWjU67LxKYgEO4dPCTkfZif5Lv/nrYo1S+CkcUpahbfeOyHLylykFpAfYp7uYEo3dCBmraO+ZcZcnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hlHrI18E; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hlHrI18E"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-304f590dd91so1111058eec.0
        for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 06:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781270840; x=1781875640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PmZ2sl38PCCS0bv5D9o7S4WvjIIRHmjBHALA0zfK1Ow=;
        b=hlHrI18EDPEmtRZ9/n7VykbJfMhF7g66inMfNLQJXUqeude0UeeQ/t6sasWFE3PlFT
         mQBxWFDJfDCCNxD1RCtopKZq+Wv3bCG0jNc8RQoafxWV/QqhUMjKK/m92roqTOn4QyTw
         Ypg8lMALDDrVMm8og0DpioJqYHR3SO8wzjlfN85kZ38H06IMZxv2nt30S7fCx7pmzuIr
         KUJEmLkvNtuqU2RO82F+0T29W5DTh8G346dpUm/zRpHPLeiAUK3S4IVHp/1nW3vs/6dF
         O7Zcm9ady2SHxyM/aEceiDbgS8UjQ7u8HPdWfUsKvGtybJ0CeOpPFt2lFhUf6iS1CHnL
         Oxvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270840; x=1781875640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PmZ2sl38PCCS0bv5D9o7S4WvjIIRHmjBHALA0zfK1Ow=;
        b=qbB3zMgur/QzGmoI45O7OGGjg80I6cKQ6i2Wzd9jgdCtgs4mRVEWSx4pcEQ4V06etj
         pDoWKQtwuuYmQlqDi/VrEeDIEtIkQwe6M39c3bDpkYQTPHdM+e0DOC6t60FmqbGjC5CU
         bPIxbGu9m6AP8ia93s6o6t/A148itSkcgKe3pRYsePMkrkCXTiUzHcWV1Uu/1vDRtctV
         btjnFIAh0UwhG+5i9Tdv8U1J8YvjIl4NMRvcq+lWyJ01D2up2/2PJGFCKyP2R1g9or8g
         RLfhqiptWvziEIW3+3X9oXlKyK/PRU7CwepB6Bux0du2IKMkMs5zO5sPiGh9HROoRO9c
         Ir2A==
X-Forwarded-Encrypted: i=1; AFNElJ8iaRusD06n+pmozxCALadIICnJ/Yig4xWf6FDxNL7NRko60cxE2mTQQlU7PigmsZSdpQFFFvln4WHZug==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0yPLbevnse06wWjfvKiS06ftaM9F1aZ5dp8O/5+6FzmFn1BhG
	SDq21WeIdXsH5n1DRcNKVQ+4C9tYWYttG+vYc8LwnNLWT6jEyei5P7VV
X-Gm-Gg: Acq92OFDor0RDEb2CFVVqUf/L2xtwn2CLq9MXWdoscRF5HG0yQWPQM7xzX7cteR9FcX
	Qw9ojH5/sfUp08VeFuceC6LblxM8nY27DZFgQBveJSWGRHiXKcDWt1zRXjwZDAy0xf/VYrP5wQh
	ctP8HJZGTcV2o1nfjK291q5Z8eQeTzbd2NiDDpS3Z9yxnoUyik2MjfVeeHRpLBUgmwA0q1xRWaa
	WIsme97J1yCDDIe33YTuEK1oNSgfQ21F3kY6lL/5zsZVKFcL9nPehSeP+y3HI9OFrFZ6KEv53uW
	eQRIpghVKsHKC1LlC+fPa8aKZsGQFwPUtpC7gbjbbgH94zsQ+tYXpnlKFhSQ/3h/oguYR4xp2Wn
	p5ZX3IwO1ztcuuwPL9YUGq9NED6r/9sid3Hs5p/xuIzM35F3zQ8CT8rHFt7CyRbl4U6/vBCWH0z
	+NWi0nFva8OD1GDjpFvobiRETRyz9gs2ASBSm1o1fag5Wuc2bVo2giI0vmHg==
X-Received: by 2002:a05:7300:238b:b0:2f5:3fb3:4a76 with SMTP id 5a478bee46e88-3081ff73b6fmr1678230eec.10.1781270840085;
        Fri, 12 Jun 2026 06:27:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e91f8b5sm3302343eec.19.2026.06.12.06.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:27:19 -0700 (PDT)
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
Subject: [PATCH 04/11] ASoC: fsl_esai: Use guard() for spin locks
Date: Fri, 12 Jun 2026 20:26:32 +0700
Message-ID: <20260612132639.78086-5-phucduc.bui@gmail.com>
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

