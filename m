Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177AF3EF0C2
	for <linux-sound@vger.kernel.org>; Thu, 23 Apr 2026 12:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776949042; cv=none; b=MVEKJQznE3393TVjYUU+QckyoZR3wO5rm6GJBHq5xSlAacyd1lDGwTfF6t78XIVOJB8DsynUZjRrgADdI08Pg65AnfHxcfA//HqjjfZb1T03Orek/+VGCwBOQs1r9y8HEW5Iipk0UImPQIRc4LwlcFHZz1LwvsZjRm70MjEAp6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776949042; c=relaxed/simple;
	bh=bTDWzZVmDIEzzIR2e9kQP08/l7bognv4SdRbWpJltEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MYTHaqrZcECEbAK1D2T33+M2t1fTmS4xcXeX+8YZQKg3NoOkvaIbcOfYsaTzIMxozDUafWO4yQq7KXF6ujS1xZgtlkc/OflcltwCZheUIQU6OuBR9A7Unx7LwXs3CXyRWLgtuuc4p6eQDz80BzpEQcpAprBmAp5F1xBoHZZ7BRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jlmwMiQq; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jlmwMiQq"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so54945685ad.2
        for <linux-sound@vger.kernel.org>; Thu, 23 Apr 2026 05:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776949040; x=1777553840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kDI1B8x0qzvt78g6hp6pJdTAzcHsH/waiJ0wXVZHtXE=;
        b=jlmwMiQqHNzNveslnOr/wlopfLdSlBMwn3eUyXYqy6TNEXh8rtRqGCH/T0+vKdEZse
         yS6rYKYdoxgK4yBeFGPqRoZxRhWo9NL5L4Yk2c362emYmxLETxAUAuj3IMnAyMSyGK/x
         S6msLWMh9hkni4FxPwmqTaBcquGSklMONatld1HjUka6NCqDi+JJydG92mY1r1j++lW7
         NAUPSUjpbMnjKQ6q6MSeBWBCCTs8qVrmcZXHdD53tcBEHF0yXGSrm5dHJfHiWT1Wl5El
         hlJ3B1bSiv1XslMfbXL9aGnzhdiw1BaMeeCrrbUzmVNkGYRdIcrLzjHtb2BF92zXxpQU
         Hi0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776949040; x=1777553840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kDI1B8x0qzvt78g6hp6pJdTAzcHsH/waiJ0wXVZHtXE=;
        b=cEizX/NOz1GS4gYwBECP6naaaRVHU8vVBB+tCkTpAOxEgon1Vz92n3wYvzYs9Q6N1K
         hAhbQEkSOlTLTHPuCwTJA7hV88XhAfegTXZwFAEupgB1Sbo//e+imLSxaEAFR1h4VGjD
         mt9uOnVSuc06Ny38VrfNS8H3BXmTUx6vQI02B24AvOyJsuGkPAbBviPsrKiccnxm01iC
         vQIJpc23qbF/dEurVJKGPQlUI6waRstY5YHqt47qqwsgXruDvDvNDOHsteAJNRfRndQ2
         W2RkELdXZoTU6qv0gSeAic3HSTLLxnsc7fjqagLBBllsTGRIHND5i3ULral5jUp5PAoX
         3MhQ==
X-Forwarded-Encrypted: i=1; AFNElJ8+Yl+MZF9I6iu9YYoneX8A/UpyeA63xaybXxQLOS9AYgpYHGUshjvBXAs3Jz9kr7h9s1AObg+xLUa1pg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKICGgKg/QhBCsE0efJfXVUOzwiCoAN4MU78+SZjc473YY2Dby
	f7Uvj8zpmtpUAzTZ/szNKnTrDDCCbdt2FSX06PgxZY5vDm7Qljq7xmto
X-Gm-Gg: AeBDietqiSQgPjE4dpJ9oJH2ZwAAN73gHA7VKdjXGGLQix079f38zkLv6nrpNzgNi6o
	8FRe9lr0oAyZBiKAroEVb9BuhLP5YGMihgaVxxcpaleFjZKCUi7//O2/h78oXBBtw1wIfYxUtiT
	udwV2xDRoUkZeT3kLOaGC18403laSA3Pzndh0mAjGO91JLuxhlzeyuJ5SgTJkhoUx6Y5KkjzBWd
	oIB/OpSQpxUWv8lQeuo1kczpAsxA1me01EbSDlf0629CKmy+0jK/uttKArztP+bM/1ZSnoi7Lvz
	lnpAtchO2HodaQKF4025dutd3TUfsWEzk3AcUcn24ejBHyGlAVdmh8Y1yYZ/LY4TISyI3wjTU+D
	c9yxIdp6reTeXrW87Rt1vgHSk+s1APNzcQo9P2jd+T3kOEUi1rLl873JB64PvjPZCgwjsa2ngue
	jTFfM2Auj/3SuiCYCtQQ1DV1d7k4Z3o19u7yhgy8c9jEQbxX3MNsFgAjrz9f7Xqc6OYxNT
X-Received: by 2002:a17:903:2ac6:b0:2b2:549f:7d2b with SMTP id d9443c01a7336-2b5f9ee2f21mr281621055ad.11.1776949040431;
        Thu, 23 Apr 2026 05:57:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff390sm192106545ad.9.2026.04.23.05.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:57:20 -0700 (PDT)
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
Subject: [PATCH 5/5] ASoC: samsung: spdif: Use guard() for spin locks
Date: Thu, 23 Apr 2026 19:56:46 +0700
Message-ID: <20260423125646.156599-6-phucduc.bui@gmail.com>
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
 sound/soc/samsung/spdif.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/sound/soc/samsung/spdif.c b/sound/soc/samsung/spdif.c
index fb30f6b637a0..7fc46d55c522 100644
--- a/sound/soc/samsung/spdif.c
+++ b/sound/soc/samsung/spdif.c
@@ -143,7 +143,6 @@ static int spdif_trigger(struct snd_pcm_substream *substream, int cmd,
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct samsung_spdif_info *spdif = to_info(snd_soc_rtd_to_cpu(rtd, 0));
-	unsigned long flags;
 
 	dev_dbg(spdif->dev, "Entered %s\n", __func__);
 
@@ -151,16 +150,14 @@ static int spdif_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		spin_lock_irqsave(&spdif->lock, flags);
-		spdif_snd_txctrl(spdif, 1);
-		spin_unlock_irqrestore(&spdif->lock, flags);
+		scoped_guard(spinlock_irqsave, &spdif->lock)
+			spdif_snd_txctrl(spdif, 1);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		spin_lock_irqsave(&spdif->lock, flags);
-		spdif_snd_txctrl(spdif, 0);
-		spin_unlock_irqrestore(&spdif->lock, flags);
+		scoped_guard(spinlock_irqsave, &spdif->lock)
+			spdif_snd_txctrl(spdif, 0);
 		break;
 	default:
 		return -EINVAL;
@@ -182,7 +179,6 @@ static int spdif_hw_params(struct snd_pcm_substream *substream,
 	void __iomem *regs = spdif->regs;
 	struct snd_dmaengine_dai_dma_data *dma_data;
 	u32 con, clkcon, cstas;
-	unsigned long flags;
 	int i, ratio;
 
 	dev_dbg(spdif->dev, "Entered %s\n", __func__);
@@ -196,7 +192,7 @@ static int spdif_hw_params(struct snd_pcm_substream *substream,
 
 	snd_soc_dai_set_dma_data(snd_soc_rtd_to_cpu(rtd, 0), substream, dma_data);
 
-	spin_lock_irqsave(&spdif->lock, flags);
+	guard(spinlock_irqsave)(&spdif->lock);
 
 	con = readl(regs + CON) & CON_MASK;
 	cstas = readl(regs + CSTAS) & CSTAS_MASK;
@@ -214,7 +210,7 @@ static int spdif_hw_params(struct snd_pcm_substream *substream,
 		break;
 	default:
 		dev_err(spdif->dev, "Unsupported data size.\n");
-		goto err;
+		return -EINVAL;
 	}
 
 	ratio = spdif->clk_rate / params_rate(params);
@@ -224,7 +220,7 @@ static int spdif_hw_params(struct snd_pcm_substream *substream,
 	if (i == ARRAY_SIZE(spdif_sysclk_ratios)) {
 		dev_err(spdif->dev, "Invalid clock ratio %ld/%d\n",
 				spdif->clk_rate, params_rate(params));
-		goto err;
+		return -EINVAL;
 	}
 
 	con &= ~CON_MCLKDIV_MASK;
@@ -257,7 +253,7 @@ static int spdif_hw_params(struct snd_pcm_substream *substream,
 	default:
 		dev_err(spdif->dev, "Invalid sampling rate %d\n",
 				params_rate(params));
-		goto err;
+		return -EINVAL;
 	}
 
 	cstas &= ~CSTAS_CATEGORY_MASK;
@@ -268,12 +264,7 @@ static int spdif_hw_params(struct snd_pcm_substream *substream,
 	writel(cstas, regs + CSTAS);
 	writel(clkcon, regs + CLKCON);
 
-	spin_unlock_irqrestore(&spdif->lock, flags);
-
 	return 0;
-err:
-	spin_unlock_irqrestore(&spdif->lock, flags);
-	return -EINVAL;
 }
 
 static void spdif_shutdown(struct snd_pcm_substream *substream,
-- 
2.43.0

