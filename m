Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA81F3EF0B3
	for <linux-sound@vger.kernel.org>; Thu, 23 Apr 2026 12:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776949040; cv=none; b=Ev05vDtI2S1NXYUi2Kl4NlyAD03RMNMQeM1Z/EWOBAlxze5sJohpL+pSpzITLwzURD1Exf5S13D8uYb2M20sPZy8TWeoTtZzuCb6FJpt0Ny+i7wPHB5K+ex12qOWfrZiDy/jtiT7YItg2T+umLxbEuukdCcXEtB+wCABi+98g+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776949040; c=relaxed/simple;
	bh=CP1ghv01QCcyLHSfiPOnX65aYM4APtuzG8pM9zCfUgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N5pdwmPKxVIFi7M8evwUeCesMPQqLJydT90JH9x899vhuKzh1OoK7ZqQgZHR3pQnFRkCWdCg8D5XLKtmzEDGiI1z9D2nMNra1yzOSOYujqQtFO1E8qRMdjI9mdnzXM+RYidovbXxZWBS/jtQs0y9jeS216TgNZxwrzsh6aEuGnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lecFdSms; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lecFdSms"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2b461310af5so25987625ad.1
        for <linux-sound@vger.kernel.org>; Thu, 23 Apr 2026 05:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776949037; x=1777553837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ujluhbOld/XQ/a08kQS62pX+2z7OtnQnN7cupiUIIOA=;
        b=lecFdSmsQnb47VufNSyiJ1tO6iPGHRWXvfg3t67nwHhPZ6LLFfO/NszivvdQGDgTKP
         2XqIPgXRazDv80/DCo5QeyUgjpLWd7Po+spq1T0d/dmkGgp8KY3pkTBMe9Xw2BBBwCyV
         WQI9wRPxolngZQIUhvnSVC55q5DqLuCNkWBX47Cq5HFqqf7MQp9itf2aa7PWW1wqrSxc
         yPuMfM52p8Tboc/M/+0EiWgkA211xoUK+HNuaVppW6m4gXWk/Gq/6fNhtcOBVRj+IiJO
         0y0BxqrTkEM5SCrMlVEzTmcY05xxOmSwtckPMMTvFzBIhwn3qs0yUY4Ly/ujval7KnBh
         RDGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776949037; x=1777553837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ujluhbOld/XQ/a08kQS62pX+2z7OtnQnN7cupiUIIOA=;
        b=Tk21wExTQVfzObfZiV4MinNvTfBKZnj+QY5NHt+XUYFYAwrlc1bTWFqeBvCoA229ch
         hRSz0Ni6bZnm1AgCmM4jQIlDsObk/4l/w2uovIh4hNgnd884dZeo9TGDohcP2nGO9tie
         FdCE+oK3AGXjxpOB8/aNRREOAOKPB20ZTzpUC7+scdAiQVUrurYf1PFjowLs2SAWp4dR
         J3xhykBUT2R6jFLu/xX+s5kPJPW1aOWmrPrhPCdcsWxdpbtH9sS+m8nzdBXn8Dfp1TYo
         z7neCpuxEkthYgtuxP5D5CCpR+oxvb5FLhHtlDI/RO1rFhSzQCrwlSFg2CBqC93muGXE
         GeSQ==
X-Forwarded-Encrypted: i=1; AFNElJ8kw64gwmyenLHvet4K8TDKPO0cwGofWKDPOrSg2Q/Akhi4mxJ1LoNOzZ4l/8iraezFJPxi8e0sL3vOQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxNSUPnpVkivM20D+DJiGc/6c7v3yY0umsG/cpDam2rjJ2+Hba
	VGANn3uDJGkvlubPPFaQX//l1Q+w1xdy5lSkNcTV34r+SR3AXJO9yR3g
X-Gm-Gg: AeBDievKB4gG+wRw/lDxukGYuoo2bMKwKj/5B9TmlWZz/7TZLcHKsF80WdqLuker6Td
	/6KeV6XQyzVtOXavGYgFhfJzlAVkevCJbYJk5HnaGaWVWGW/UL0yBt9pLPxeLC0HC8837FtGU/P
	w6peSDtZ4Wviodk4CD5gocSkYJvZ+Y2LCjrdlLiRwkpNMZcrIqGmM4Hd7mAiMpiHGGOHGMtL4/I
	4bYiMTYaIlfcUp9r1+u5FqP7+DnUQK52p0vQC+eeev8BOhf0w90krC+63HEeZZsknRa0uTIkCBn
	CzjLVQLRYywstNrBd23xGtyWoXxABFNTSvwB0Xy2xin5f21OUxDm+1xkCFFqcDC5HMtBp7ezqkU
	SnmZrGoyhKkil0WASeiYOavxUKq/Bc9BggrqrWfu9czAYBtUSLzMkzzjTMS9hHoVDJ4uZm+pbjq
	s72/8GSYgSE1HCVDsI57KlMdv8Y3At1MOQMQ8NaW/BwSus+2dvtovwGkQS5ViKKtiohHCamuvll
	PX1OqU=
X-Received: by 2002:a17:902:b195:b0:2b2:4bbc:14b0 with SMTP id d9443c01a7336-2b5f9eb272fmr163793265ad.20.1776949037203;
        Thu, 23 Apr 2026 05:57:17 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff390sm192106545ad.9.2026.04.23.05.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:57:16 -0700 (PDT)
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
Subject: [PATCH 4/5] ASoC: samsung: pcm: Use guard() for spin locks
Date: Thu, 23 Apr 2026 19:56:45 +0700
Message-ID: <20260423125646.156599-5-phucduc.bui@gmail.com>
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
 sound/soc/samsung/pcm.c | 99 +++++++++++++++++------------------------
 1 file changed, 40 insertions(+), 59 deletions(-)

diff --git a/sound/soc/samsung/pcm.c b/sound/soc/samsung/pcm.c
index a03ba9374c2e..309f024bf2a4 100644
--- a/sound/soc/samsung/pcm.c
+++ b/sound/soc/samsung/pcm.c
@@ -218,7 +218,6 @@ static int s3c_pcm_trigger(struct snd_pcm_substream *substream, int cmd,
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct s3c_pcm_info *pcm = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
-	unsigned long flags;
 
 	dev_dbg(pcm->dev, "Entered %s\n", __func__);
 
@@ -226,27 +225,23 @@ static int s3c_pcm_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		spin_lock_irqsave(&pcm->lock, flags);
-
-		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
-			s3c_pcm_snd_rxctrl(pcm, 1);
-		else
-			s3c_pcm_snd_txctrl(pcm, 1);
-
-		spin_unlock_irqrestore(&pcm->lock, flags);
+		scoped_guard(spinlock_irqsave, &pcm->lock) {
+			if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+				s3c_pcm_snd_rxctrl(pcm, 1);
+			else
+				s3c_pcm_snd_txctrl(pcm, 1);
+		}
 		break;
 
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		spin_lock_irqsave(&pcm->lock, flags);
-
-		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
-			s3c_pcm_snd_rxctrl(pcm, 0);
-		else
-			s3c_pcm_snd_txctrl(pcm, 0);
-
-		spin_unlock_irqrestore(&pcm->lock, flags);
+		scoped_guard(spinlock_irqsave, &pcm->lock) {
+			if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+				s3c_pcm_snd_rxctrl(pcm, 0);
+			else
+				s3c_pcm_snd_txctrl(pcm, 0);
+		}
 		break;
 
 	default:
@@ -265,7 +260,6 @@ static int s3c_pcm_hw_params(struct snd_pcm_substream *substream,
 	void __iomem *regs = pcm->regs;
 	struct clk *clk;
 	int sclk_div, sync_div;
-	unsigned long flags;
 	u32 clkctl;
 
 	dev_dbg(pcm->dev, "Entered %s\n", __func__);
@@ -278,36 +272,33 @@ static int s3c_pcm_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	spin_lock_irqsave(&pcm->lock, flags);
-
-	/* Get hold of the PCMSOURCE_CLK */
-	clkctl = readl(regs + S3C_PCM_CLKCTL);
-	if (clkctl & S3C_PCM_CLKCTL_SERCLKSEL_PCLK)
-		clk = pcm->pclk;
-	else
-		clk = pcm->cclk;
-
-	/* Set the SCLK divider */
-	sclk_div = clk_get_rate(clk) / pcm->sclk_per_fs /
-					params_rate(params) / 2 - 1;
-
-	clkctl &= ~(S3C_PCM_CLKCTL_SCLKDIV_MASK
-			<< S3C_PCM_CLKCTL_SCLKDIV_SHIFT);
-	clkctl |= ((sclk_div & S3C_PCM_CLKCTL_SCLKDIV_MASK)
-			<< S3C_PCM_CLKCTL_SCLKDIV_SHIFT);
+	scoped_guard(spinlock_irqsave, &pcm->lock) {
+		/* Get hold of the PCMSOURCE_CLK */
+		clkctl = readl(regs + S3C_PCM_CLKCTL);
+		if (clkctl & S3C_PCM_CLKCTL_SERCLKSEL_PCLK)
+			clk = pcm->pclk;
+		else
+			clk = pcm->cclk;
 
-	/* Set the SYNC divider */
-	sync_div = pcm->sclk_per_fs - 1;
+		/* Set the SCLK divider */
+		sclk_div = clk_get_rate(clk) / pcm->sclk_per_fs /
+						params_rate(params) / 2 - 1;
 
-	clkctl &= ~(S3C_PCM_CLKCTL_SYNCDIV_MASK
-				<< S3C_PCM_CLKCTL_SYNCDIV_SHIFT);
-	clkctl |= ((sync_div & S3C_PCM_CLKCTL_SYNCDIV_MASK)
-				<< S3C_PCM_CLKCTL_SYNCDIV_SHIFT);
+		clkctl &= ~(S3C_PCM_CLKCTL_SCLKDIV_MASK
+				<< S3C_PCM_CLKCTL_SCLKDIV_SHIFT);
+		clkctl |= ((sclk_div & S3C_PCM_CLKCTL_SCLKDIV_MASK)
+				<< S3C_PCM_CLKCTL_SCLKDIV_SHIFT);
 
-	writel(clkctl, regs + S3C_PCM_CLKCTL);
+		/* Set the SYNC divider */
+		sync_div = pcm->sclk_per_fs - 1;
 
-	spin_unlock_irqrestore(&pcm->lock, flags);
+		clkctl &= ~(S3C_PCM_CLKCTL_SYNCDIV_MASK
+					<< S3C_PCM_CLKCTL_SYNCDIV_SHIFT);
+		clkctl |= ((sync_div & S3C_PCM_CLKCTL_SYNCDIV_MASK)
+					<< S3C_PCM_CLKCTL_SYNCDIV_SHIFT);
 
+		writel(clkctl, regs + S3C_PCM_CLKCTL);
+	}
 	dev_dbg(pcm->dev, "PCMSOURCE_CLK-%lu SCLK=%ufs SCLK_DIV=%d SYNC_DIV=%d\n",
 				clk_get_rate(clk), pcm->sclk_per_fs,
 				sclk_div, sync_div);
@@ -320,13 +311,11 @@ static int s3c_pcm_set_fmt(struct snd_soc_dai *cpu_dai,
 {
 	struct s3c_pcm_info *pcm = snd_soc_dai_get_drvdata(cpu_dai);
 	void __iomem *regs = pcm->regs;
-	unsigned long flags;
-	int ret = 0;
 	u32 ctl;
 
 	dev_dbg(pcm->dev, "Entered %s\n", __func__);
 
-	spin_lock_irqsave(&pcm->lock, flags);
+	guard(spinlock_irqsave)(&pcm->lock);
 
 	ctl = readl(regs + S3C_PCM_CTL);
 
@@ -336,8 +325,7 @@ static int s3c_pcm_set_fmt(struct snd_soc_dai *cpu_dai,
 		break;
 	default:
 		dev_err(pcm->dev, "Unsupported clock inversion!\n");
-		ret = -EINVAL;
-		goto exit;
+		return -EINVAL;
 	}
 
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
@@ -346,8 +334,7 @@ static int s3c_pcm_set_fmt(struct snd_soc_dai *cpu_dai,
 		break;
 	default:
 		dev_err(pcm->dev, "Unsupported master/slave format!\n");
-		ret = -EINVAL;
-		goto exit;
+		return -EINVAL;
 	}
 
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_MASK) {
@@ -359,8 +346,7 @@ static int s3c_pcm_set_fmt(struct snd_soc_dai *cpu_dai,
 		break;
 	default:
 		dev_err(pcm->dev, "Invalid Clock gating request!\n");
-		ret = -EINVAL;
-		goto exit;
+		return -EINVAL;
 	}
 
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
@@ -374,16 +360,11 @@ static int s3c_pcm_set_fmt(struct snd_soc_dai *cpu_dai,
 		break;
 	default:
 		dev_err(pcm->dev, "Unsupported data format!\n");
-		ret = -EINVAL;
-		goto exit;
+		return -EINVAL;
 	}
 
 	writel(ctl, regs + S3C_PCM_CTL);
-
-exit:
-	spin_unlock_irqrestore(&pcm->lock, flags);
-
-	return ret;
+	return 0;
 }
 
 static int s3c_pcm_set_clkdiv(struct snd_soc_dai *cpu_dai,
-- 
2.43.0

