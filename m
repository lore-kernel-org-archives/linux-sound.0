Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD2F3FF882
	for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 10:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781088361; cv=none; b=WuQ8K8Jyo0s4p/E1vnEoZOEgX2Pi0A9JyRn2lYdJsFyzqnqfkR8HiSCl6ok4CWVan75vFINxGsBoj+XHcyndJkeQK6D0kEQgR3IYQD+lVLMoVxElJjxHcR7fImnNlGFgBR+EKy62XBcv4gH8/mnllhzVrQB9V5pXwgDe/ln9ecs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781088361; c=relaxed/simple;
	bh=I78UecyAVuWvCj4V3klZ4e8YWCssj6DTz26oU7aJPD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C7IZ/wkAGn9S0Zt9jMPmLorU6VI44EOdXeUL17JQ7JsrLib3daBl4Fv1uOq7V3P+37Kns+WKHb2BgF3S1f2UPsbgUfd5YCcxeGbMuDO3oSU9e2xayrFUH8AzfEKXiJIZPgwx00ROsXmBUxTe0/D+1fMNxjKVLTeXtpTBDruvNAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rzR6QjXJ; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rzR6QjXJ"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-36da151a152so4602659a91.1
        for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 03:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781088359; x=1781693159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RE1W3bej/2sBCXuUve43v0t09ubiwO69rCSBYDSnzuE=;
        b=rzR6QjXJ3IKgPgHSmmXz1fI/ApZUNR7M78fWabFdWwVUwv3dC2akzWv/wPGULwl2Q9
         mw+nhmxgZZ1xg/q/sSRN/BOOZVllk2wpw5wLYQzjj/icLeS2zK5v5g0c5xhzyAXOyVLd
         kd3Sk5vrr/cR7dwflEYVx0r15LkAww3YDXQaQNVHyiRnQIptfM3QITY8LF8HwYnJpSuq
         j6A8Q3tUwrQNQfjBYe9SMmnPax4jM38i/YDuq0R1tG5n+h2/lHUkNJ+EHA1CDvF7OH8d
         T95hquWwmJ4JRhAdYxq67ohSmgFuJl7p8/gYXhWzTkYbGS/9eeaEiqAXEIY+srxtivqp
         24WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781088359; x=1781693159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RE1W3bej/2sBCXuUve43v0t09ubiwO69rCSBYDSnzuE=;
        b=ZJ6WJ6liw99Q5FObyRpv4+9aDnqT+IoIakhXOziG2lKSusUR/7lXYZBxZFjTPTIgVb
         vj3nHFjcThPb6YYJxBl7QLMO7vnlv3DWP9JvxKNf4mmoEioga3xeqCtfJj3FHt5zos1/
         BKv0kUxKHfGDwhvwZ8MKYVmq/3WxifIiGeoX86U+g88GD3lkoDar35cMKSH9Kmp3u/TN
         JWRLeMjwQVxq1Z4mXyyKTOGUakXMw/ceVuRph/SJl0hRxlt20+YkYQngZVVoM+VzljaF
         QEhBMu8pHhKdxDWpYw3hJtIQRb+RvHTV+Q5/EkQQJ5tqqrC9kGbeQg42IZUwYc10vWaI
         qYvw==
X-Forwarded-Encrypted: i=1; AFNElJ9q33TOPM/Bg9i8lPSas3eaAtWl40+vFQpTVTtomVs+Fc2fl/pvmtGTW0XqyIz8AWp5ZhH4e50O97wZTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRZwG5OJSdBv/fIQ+Wd2jcAauGxS9EuDAsHgmbDiaBVYzT/BEh
	vs1DaFlRB6lgb5ByUbaSjExAKDKSW7JC7sY6/2q6xajok8AzarKrhx5y
X-Gm-Gg: Acq92OH2z74eiqFUeRbIrsmEVuxzDp2+sIWXeMBx8nUBC+zG8Gu1/cO/6vCI8TgkOKn
	fpJoeMrAdGxBTVA2Z4g0v8EJe6iqOND7oHyNTfEx02Wq93zEXirIv1EO3eq1vry9h5bDp7z3ksu
	GYezoEMJxLBEvEEKm53TwKY/yjjmSOvDaiDw+LNOQlxIRA9tTRR6//TIbHDpXuLPN7jsEpAPx53
	9UqlVpGj+E6J0U0b3JalWr8VXmCoOe2XbsyO27BUqY4jRWaCwpgEPvF2umdbfC0VXSZyLlGZR9R
	HnTO8HPNEK4roq5j6krjf6H+FuCcFH1vPnCHg+fYG2g9wZwXYsJy2uMIMnWPizRWnE4pKxOg7wz
	eLKeFUsDn9eH1LS4IU2aHhWcSA//kkPq5aHIwp+i3+/x8NptACB93k3mk2uy6BigCE0TjLTcw9X
	+5Lk66hP5NvZOu071QK93Xic8YTYxOJTLnvoT3+M3KUXlGihawDUXS+Pt1z5I+/mSepDZY
X-Received: by 2002:a17:90b:5787:b0:368:147f:bd27 with SMTP id 98e67ed59e1d1-370f0d52f5cmr26868149a91.23.1781088358614;
        Wed, 10 Jun 2026 03:45:58 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282916b10sm24455965b3a.58.2026.06.10.03.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:45:58 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] ASoC: img: img-spdif-in: Use guard() for spin locks
Date: Wed, 10 Jun 2026 17:45:23 +0700
Message-ID: <20260610104524.87166-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610104524.87166-1-phucduc.bui@gmail.com>
References: <20260610104524.87166-1-phucduc.bui@gmail.com>
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
 sound/soc/img/img-spdif-in.c | 70 +++++++++---------------------------
 1 file changed, 17 insertions(+), 53 deletions(-)

diff --git a/sound/soc/img/img-spdif-in.c b/sound/soc/img/img-spdif-in.c
index 82295e2508fa..b630644f20cc 100644
--- a/sound/soc/img/img-spdif-in.c
+++ b/sound/soc/img/img-spdif-in.c
@@ -179,7 +179,7 @@ static int img_spdif_in_do_clkgen_single(struct img_spdif_in *spdif,
 		unsigned int rate)
 {
 	unsigned int nom, hld;
-	unsigned long flags, clk_rate;
+	unsigned long clk_rate;
 	int ret = 0;
 	u32 reg;
 
@@ -196,19 +196,15 @@ static int img_spdif_in_do_clkgen_single(struct img_spdif_in *spdif,
 	reg |= (hld << IMG_SPDIF_IN_CLKGEN_HLD_SHIFT) &
 		IMG_SPDIF_IN_CLKGEN_HLD_MASK;
 
-	spin_lock_irqsave(&spdif->lock, flags);
+	guard(spinlock_irqsave)(&spdif->lock);
 
-	if (spdif->active) {
-		spin_unlock_irqrestore(&spdif->lock, flags);
+	if (spdif->active)
 		return -EBUSY;
-	}
 
 	img_spdif_in_writel(spdif, reg, IMG_SPDIF_IN_CLKGEN);
 
 	spdif->single_freq = rate;
 
-	spin_unlock_irqrestore(&spdif->lock, flags);
-
 	return 0;
 }
 
@@ -216,7 +212,7 @@ static int img_spdif_in_do_clkgen_multi(struct img_spdif_in *spdif,
 		unsigned int multi_freqs[])
 {
 	unsigned int nom, hld, rate, max_rate = 0;
-	unsigned long flags, clk_rate;
+	unsigned long clk_rate;
 	int i, ret = 0;
 	u32 reg, trk_reg, temp_regs[IMG_SPDIF_IN_NUM_ACLKGEN];
 
@@ -242,12 +238,10 @@ static int img_spdif_in_do_clkgen_multi(struct img_spdif_in *spdif,
 		temp_regs[i] = reg;
 	}
 
-	spin_lock_irqsave(&spdif->lock, flags);
+	guard(spinlock_irqsave)(&spdif->lock);
 
-	if (spdif->active) {
-		spin_unlock_irqrestore(&spdif->lock, flags);
+	if (spdif->active)
 		return -EBUSY;
-	}
 
 	trk_reg = spdif->trk << IMG_SPDIF_IN_ACLKGEN_TRK_SHIFT;
 
@@ -262,8 +256,6 @@ static int img_spdif_in_do_clkgen_multi(struct img_spdif_in *spdif,
 	spdif->multi_freqs[2] = multi_freqs[2];
 	spdif->multi_freqs[3] = multi_freqs[3];
 
-	spin_unlock_irqrestore(&spdif->lock, flags);
-
 	return 0;
 }
 
@@ -323,9 +315,8 @@ static int img_spdif_in_get_multi_freq(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_dai *cpu_dai = snd_kcontrol_chip(kcontrol);
 	struct img_spdif_in *spdif = snd_soc_dai_get_drvdata(cpu_dai);
-	unsigned long flags;
 
-	spin_lock_irqsave(&spdif->lock, flags);
+	guard(spinlock_irqsave)(&spdif->lock);
 	if (spdif->multi_freq) {
 		ucontrol->value.integer.value[0] = spdif->multi_freqs[0];
 		ucontrol->value.integer.value[1] = spdif->multi_freqs[1];
@@ -337,7 +328,6 @@ static int img_spdif_in_get_multi_freq(struct snd_kcontrol *kcontrol,
 		ucontrol->value.integer.value[2] = 0;
 		ucontrol->value.integer.value[3] = 0;
 	}
-	spin_unlock_irqrestore(&spdif->lock, flags);
 
 	return 0;
 }
@@ -349,7 +339,6 @@ static int img_spdif_in_set_multi_freq(struct snd_kcontrol *kcontrol,
 	struct img_spdif_in *spdif = snd_soc_dai_get_drvdata(cpu_dai);
 	unsigned int multi_freqs[IMG_SPDIF_IN_NUM_ACLKGEN];
 	bool multi_freq;
-	unsigned long flags;
 
 	if ((ucontrol->value.integer.value[0] == 0) &&
 			(ucontrol->value.integer.value[1] == 0) &&
@@ -367,17 +356,13 @@ static int img_spdif_in_set_multi_freq(struct snd_kcontrol *kcontrol,
 	if (multi_freq)
 		return img_spdif_in_do_clkgen_multi(spdif, multi_freqs);
 
-	spin_lock_irqsave(&spdif->lock, flags);
+	guard(spinlock_irqsave)(&spdif->lock);
 
-	if (spdif->active) {
-		spin_unlock_irqrestore(&spdif->lock, flags);
+	if (spdif->active)
 		return -EBUSY;
-	}
 
 	spdif->multi_freq = false;
 
-	spin_unlock_irqrestore(&spdif->lock, flags);
-
 	return 0;
 }
 
@@ -399,9 +384,8 @@ static int img_spdif_in_get_lock_freq(struct snd_kcontrol *kcontrol,
 	struct img_spdif_in *spdif = snd_soc_dai_get_drvdata(cpu_dai);
 	u32 reg;
 	int i;
-	unsigned long flags;
 
-	spin_lock_irqsave(&spdif->lock, flags);
+	guard(spinlock_irqsave)(&spdif->lock);
 
 	reg = img_spdif_in_readl(spdif, IMG_SPDIF_IN_STATUS);
 	if (reg & IMG_SPDIF_IN_STATUS_LOCK_MASK) {
@@ -416,8 +400,6 @@ static int img_spdif_in_get_lock_freq(struct snd_kcontrol *kcontrol,
 		uc->value.integer.value[0] = 0;
 	}
 
-	spin_unlock_irqrestore(&spdif->lock, flags);
-
 	return 0;
 }
 
@@ -448,16 +430,13 @@ static int img_spdif_in_set_trk(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_dai *cpu_dai = snd_kcontrol_chip(kcontrol);
 	struct img_spdif_in *spdif = snd_soc_dai_get_drvdata(cpu_dai);
-	unsigned long flags;
 	int i;
 	u32 reg;
 
-	spin_lock_irqsave(&spdif->lock, flags);
+	guard(spinlock_irqsave)(&spdif->lock);
 
-	if (spdif->active) {
-		spin_unlock_irqrestore(&spdif->lock, flags);
+	if (spdif->active)
 		return -EBUSY;
-	}
 
 	spdif->trk = ucontrol->value.integer.value[0];
 
@@ -474,8 +453,6 @@ static int img_spdif_in_set_trk(struct snd_kcontrol *kcontrol,
 		img_spdif_in_aclkgen_writel(spdif, i);
 	}
 
-	spin_unlock_irqrestore(&spdif->lock, flags);
-
 	return 0;
 }
 
@@ -506,15 +483,12 @@ static int img_spdif_in_set_lock_acquire(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_dai *cpu_dai = snd_kcontrol_chip(kcontrol);
 	struct img_spdif_in *spdif = snd_soc_dai_get_drvdata(cpu_dai);
-	unsigned long flags;
 	u32 reg;
 
-	spin_lock_irqsave(&spdif->lock, flags);
+	guard(spinlock_irqsave)(&spdif->lock);
 
-	if (spdif->active) {
-		spin_unlock_irqrestore(&spdif->lock, flags);
+	if (spdif->active)
 		return -EBUSY;
-	}
 
 	spdif->lock_acquire = ucontrol->value.integer.value[0];
 
@@ -524,8 +498,6 @@ static int img_spdif_in_set_lock_acquire(struct snd_kcontrol *kcontrol,
 		IMG_SPDIF_IN_CTL_LOCKHI_MASK;
 	img_spdif_in_writel(spdif, reg, IMG_SPDIF_IN_CTL);
 
-	spin_unlock_irqrestore(&spdif->lock, flags);
-
 	return 0;
 }
 
@@ -545,15 +517,12 @@ static int img_spdif_in_set_lock_release(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_dai *cpu_dai = snd_kcontrol_chip(kcontrol);
 	struct img_spdif_in *spdif = snd_soc_dai_get_drvdata(cpu_dai);
-	unsigned long flags;
 	u32 reg;
 
-	spin_lock_irqsave(&spdif->lock, flags);
+	guard(spinlock_irqsave)(&spdif->lock);
 
-	if (spdif->active) {
-		spin_unlock_irqrestore(&spdif->lock, flags);
+	if (spdif->active)
 		return -EBUSY;
-	}
 
 	spdif->lock_release = ucontrol->value.integer.value[0];
 
@@ -563,8 +532,6 @@ static int img_spdif_in_set_lock_release(struct snd_kcontrol *kcontrol,
 		IMG_SPDIF_IN_CTL_LOCKLO_MASK;
 	img_spdif_in_writel(spdif, reg, IMG_SPDIF_IN_CTL);
 
-	spin_unlock_irqrestore(&spdif->lock, flags);
-
 	return 0;
 }
 
@@ -625,12 +592,11 @@ static struct snd_kcontrol_new img_spdif_in_controls[] = {
 static int img_spdif_in_trigger(struct snd_pcm_substream *substream, int cmd,
 	struct snd_soc_dai *dai)
 {
-	unsigned long flags;
 	struct img_spdif_in *spdif = snd_soc_dai_get_drvdata(dai);
 	int ret = 0;
 	u32 reg;
 
-	spin_lock_irqsave(&spdif->lock, flags);
+	guard(spinlock_irqsave)(&spdif->lock);
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
@@ -657,8 +623,6 @@ static int img_spdif_in_trigger(struct snd_pcm_substream *substream, int cmd,
 		ret = -EINVAL;
 	}
 
-	spin_unlock_irqrestore(&spdif->lock, flags);
-
 	return ret;
 }
 
-- 
2.43.0

