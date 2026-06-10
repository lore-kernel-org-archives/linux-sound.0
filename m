Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16F8403123
	for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 10:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781088365; cv=none; b=SdV69GTh0ya+rQ9YfpqqYApvz3cGvdmWR4uKPHuSyH9wsZ+oVKnfZmoed3R6SzwhgpANBAmaTv9CwMbB9EEbZNgMK6mtP0a6AAio/e1zy5AMHE5MSTcvWZ0QUDATji+24zFFw/6fYtesM0XzpI2g+fP3YI9x8MTBsjpv8018EQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781088365; c=relaxed/simple;
	bh=8t6LHvA65A48PHn1Mcy/4oG44Glu5TFg5ujthQar7+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EHj+FQCUVo0VZRvE7twke049XdT0moDYEKUZV0C6m6offTR93cJbvqTwHX30Kqsb0Z7h1zm64vkBf59aBl7oOZRRTijwimqjchIwURXbh9+NpkKPhAYYjyWRg9daK3cJ4/sn8INU7y4GErj2wmnuZi4bk2ahp653Lhjb1mnvyKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cNp9idaN; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cNp9idaN"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-842319576d5so3728177b3a.1
        for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 03:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781088362; x=1781693162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AtIb1444lAeHP94lLBWeysMAmVXPamBnHNX9ycUPCFk=;
        b=cNp9idaN+c11ltsgGhFqq/yGufRp1nWhjlvoIoxN0e2PTgEwViqwN6hv87f3WKw9k1
         u7InchMnGQvIEqyj84oXBRs5DePuZ3wNQM/uDd6fBcTEZ7rwC3Y5GXlF09MidEFWKYzv
         MKHVPpmFjmZ2XzSzeAt87EQ0Ci+uf+LSMDRj0qYNhsJCbxv+sxbvqDw5BHJ6X/GuONwy
         tBIpzFqz/dUHgNke3ooT9lP+wFeALPJ1+ISZ+jdzgx6hsCBvIhzJciddPCZBi0UTuZpi
         DQV0/1luT7BZo7FVwAS9LsK2d7ELAtn/Xsx5ezwrE1BbEkm07y1GgAd/A40A0V6uWxfQ
         AAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781088362; x=1781693162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AtIb1444lAeHP94lLBWeysMAmVXPamBnHNX9ycUPCFk=;
        b=E+EOgrHhtH77J9/e6JesSqjcHdfYiujaU5czGNoWwrIOUCH+kN64UBdS1trSnhJWdg
         kKbPWKLieClBoVPSgoYo1iXBHj3MUJwWQp+M702Lj0cLlqM/1n+28H3RpG1Ienbu9+Hj
         BLFD2g0kALM5PVjsXcvgAmvAazmXYC1UZ3MwdJrZDl3gvmAxdMWdT+/h4iYIUPTnc1xJ
         ijEGdRCMZj3fAKWWkzLsBZM+pwOpGKuNj+J2q3cC+WUCqYRy1J0O9340sDML5LYTU17T
         MPVfOJg17l6bt3nWb7LZskQ7hnr1iXKJu6S0GjVmeijLy+VoJ3K+Z8dGxzyc6PVUDSHw
         Ya/w==
X-Forwarded-Encrypted: i=1; AFNElJ/9853VUt9ziCgMXRvknKv/w2+BwUKqRoA43uMDiakrgINkJw+W7Tv/Yy1F1RzC0dYkwRmqyO2ueZqgWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YymTAaUSFX8fo1fePk2uL/MI/6PMQFSoTXv6c8lmS9gQi56/OCR
	3XCXO1uj0T4E9eJB+hvS2+fRwaZbeFK6mte3/Hwkhqj5KGVJPy7DnPbM
X-Gm-Gg: Acq92OEM0XMGPZE4YxwMiOeXhz6H60yHZtZXBl9Gzj8h3LgohdqisibXPpKnxzBiR/f
	LFmvOnIGeQKM8crNpXC3KYY9PvzUfG1NVTfe4dfX87VAT09cua6tWIKhKtNpclHgOZro+jRK6ds
	gtR+UraUACfcHKugt0gnY/YFelOI6fXvTJ3qSxd3gn7Tce5Faxh00nELp7BRnkXkLGJ8TUG9r0a
	g7xlIEgH7WPDqSvlAHoiqYmOLsi55fkzuOwCjiUfPY1iF4UvFbPC6261TQqr7tPmWhYcfbb2wNU
	WtpavDAvwaAybxOTZkD1Z9c8pHMyb+NvfToibjAtIcx4QTGgGjBGqzmIHoKhfJENfZZ2Cgrppbh
	9/2EnvCz1sx88ka1GwFrJhN4GBrZW7sV0LESrN1MdHF6rN5CakOvrfy7fjBDTP9TXUkcoxGLe1z
	1kwkQtfnhqdPLmDrVWgvjIG524AIVm4p8yWmMQm+S4tAQao2wj8Zifj1bJ/kgSFGzZv5zF
X-Received: by 2002:a05:6a00:1803:b0:842:6fac:bd3 with SMTP id d2e1a72fcca58-8430a710dbfmr8249969b3a.28.1781088362230;
        Wed, 10 Jun 2026 03:46:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282916b10sm24455965b3a.58.2026.06.10.03.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:46:01 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/2] ASoC: img: img-spdif-out: Use guard() for spin locks
Date: Wed, 10 Jun 2026 17:45:24 +0700
Message-ID: <20260610104524.87166-3-phucduc.bui@gmail.com>
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
 sound/soc/img/img-spdif-out.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/sound/soc/img/img-spdif-out.c b/sound/soc/img/img-spdif-out.c
index 52f696219ef4..39a37e4830d8 100644
--- a/sound/soc/img/img-spdif-out.c
+++ b/sound/soc/img/img-spdif-out.c
@@ -135,9 +135,8 @@ static int img_spdif_out_get_status(struct snd_kcontrol *kcontrol,
 	struct snd_soc_dai *cpu_dai = snd_kcontrol_chip(kcontrol);
 	struct img_spdif_out *spdif = snd_soc_dai_get_drvdata(cpu_dai);
 	u32 reg;
-	unsigned long flags;
 
-	spin_lock_irqsave(&spdif->lock, flags);
+	guard(spinlock_irqsave)(&spdif->lock);
 
 	reg = img_spdif_out_readl(spdif, IMG_SPDIF_OUT_CSL);
 	ucontrol->value.iec958.status[0] = reg & 0xff;
@@ -150,8 +149,6 @@ static int img_spdif_out_get_status(struct snd_kcontrol *kcontrol,
 		(reg & IMG_SPDIF_OUT_CSH_UV_CSH_MASK) >>
 		IMG_SPDIF_OUT_CSH_UV_CSH_SHIFT;
 
-	spin_unlock_irqrestore(&spdif->lock, flags);
-
 	return 0;
 }
 
@@ -161,14 +158,13 @@ static int img_spdif_out_set_status(struct snd_kcontrol *kcontrol,
 	struct snd_soc_dai *cpu_dai = snd_kcontrol_chip(kcontrol);
 	struct img_spdif_out *spdif = snd_soc_dai_get_drvdata(cpu_dai);
 	u32 reg;
-	unsigned long flags;
 
 	reg = ((u32)ucontrol->value.iec958.status[3] << 24);
 	reg |= ((u32)ucontrol->value.iec958.status[2] << 16);
 	reg |= ((u32)ucontrol->value.iec958.status[1] << 8);
 	reg |= (u32)ucontrol->value.iec958.status[0];
 
-	spin_lock_irqsave(&spdif->lock, flags);
+	guard(spinlock_irqsave)(&spdif->lock);
 
 	img_spdif_out_writel(spdif, reg, IMG_SPDIF_OUT_CSL);
 
@@ -178,8 +174,6 @@ static int img_spdif_out_set_status(struct snd_kcontrol *kcontrol,
 			IMG_SPDIF_OUT_CSH_UV_CSH_SHIFT;
 	img_spdif_out_writel(spdif, reg, IMG_SPDIF_OUT_CSH_UV);
 
-	spin_unlock_irqrestore(&spdif->lock, flags);
-
 	return 0;
 }
 
@@ -205,7 +199,6 @@ static int img_spdif_out_trigger(struct snd_pcm_substream *substream, int cmd,
 {
 	struct img_spdif_out *spdif = snd_soc_dai_get_drvdata(dai);
 	u32 reg;
-	unsigned long flags;
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
@@ -218,9 +211,8 @@ static int img_spdif_out_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		spin_lock_irqsave(&spdif->lock, flags);
-		img_spdif_out_reset(spdif);
-		spin_unlock_irqrestore(&spdif->lock, flags);
+		scoped_guard(spinlock_irqsave, &spdif->lock)
+			img_spdif_out_reset(spdif);
 		break;
 	default:
 		return -EINVAL;
-- 
2.43.0

