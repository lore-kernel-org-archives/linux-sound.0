Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCEE3BCD2F
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 09:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779443667; cv=none; b=S0L/FX5Vrbq/yaBGpRRdtY07evkFv70wAFzIwnI0yk6pSs6DTvQ5n3+pqZORqDw998ZATDYwxS06Lh5ffPz5Z3+tEcJ/f7D1yTh5WKOEjLifcDtkimKh7EA+QI03fCLOdztJAWa7OjKYCgMOGzBWY1yA+d1XjdirnlNDWqRWkLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779443667; c=relaxed/simple;
	bh=hk+pW36En4Wy1AZ68b3gwc2MovHJXPl64J4AmrYmsEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qGGCo2fzczuwsSaDxhCWjruHiP8O10ph4XSxVrkwZMdwTqr/0x9vMYe47c1gd3JAG2pHnJwLrLPZlBRcX2nodzPspZrN8+tVKjRu49CUvj0FM5BgFrmJ54GyhEoPTxtfkUaQ0WkJjE97/iqk2mVTHxBIKwctRMCBbjlJ1Kzma+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CtbouQeF; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CtbouQeF"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-83ea84df1d0so2372007b3a.2
        for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 02:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779443665; x=1780048465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nfxD9+jDbayH+o4mAO389jhPYWsWPPQA6d87WX8ntHs=;
        b=CtbouQeFYWABE9x3h/+qraJS1bSiZ259zBr6nybAxfBnnKN3qSTNc+WUyEilcPNWzG
         DjiNnFSXukKrVlil4n9sRhu1uKA/RodqijbDttBaGUUocXtpF5//n8Ctx5op6ZqSiU0d
         IoH4rolx2NOAYvkQh0SxVx37m/6hIhtv+c51xEsjYMolte9RsZEwbDJnrZRl2yapE5WX
         n0C/KCSKOtJI1G/4zNV8xlnQ6DaXOicJARgyB80sLAmi0SwnnIL6pCReAGFWFw0G7LJP
         j2FHIPGcY1ZKSKLeJKw3JNq1IMRgzOJix7mxpKC4095lcTKUhSIv9EaFhr02nLx2VyDb
         NG1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779443665; x=1780048465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nfxD9+jDbayH+o4mAO389jhPYWsWPPQA6d87WX8ntHs=;
        b=obplXCrE0nXklQct4+JGapZjfzwbPhI2DVO70hzs/NTmJH0GRiYZPPMUD+THBu7Lgf
         oqaJZvGPkcvJEQjH0+v1pLxNb+Ag16C9M989vohFlZ+DgM9dGyXk/A4/14IpidI9l+io
         L/kKoBRWqcs2atBI6tcPNVXhBOw0H+ucLX+JiJosiiHB2bG0eUeOeaU7b1BXKaOyfv+M
         Vr+uKd2IS5d6G3TzWz6aW8e0jyH/6EFBuf8++DpTq9SdZz/QDJK1TvLWUFbCZIS6rimB
         cGSIsMsWQYa13wu5pGWE8jBkOgwV7Wnqut1Ss0t+70Q6aakyVlUhVBeuQNHK8l+u/28H
         KcDw==
X-Forwarded-Encrypted: i=1; AFNElJ/yobcziAsnHm5RCOBUISfOF9iMZgLuXt+6Ar17C97bb/w5SGVaUCALwcsaKcwkvFs5dPYYoY+WBfbBag==@vger.kernel.org
X-Gm-Message-State: AOJu0YzP5+O3HDLlsXVgPcCYoa0QSAPSu1AohpYEFPCq4OBsheqyMMz/
	lHtVtI4m6nKQQIPEwnew4GdQn09MkwYfGBEi/O0dh9l6HaSFE5Ce1l60
X-Gm-Gg: Acq92OGzrdWu0iYtvlQPKSqkZiVsjgzTf9/qiUzGSoLHiwaX97HY7BrKs4oQ3rYI8do
	S7eDK1ovFQV26cc4Xd9QLuq5eHVA74AlwtJldrgs8kq6kceCMo83cuQbCY+Ahftc3STcuWOEF+w
	fqd+H6CvAlSMpzQoHK4pNfrDcFLuRHDwmJpsWuJV8PQiW6ylE9wSdhYJN6wDZ4vrmmQUtZN74Fa
	bjWv3FpIoypPSRbDMm94r3EZi2qN4eQGGDNVmWgyIb4xQJ7d7DFqVapUNgVB7qU5JRGavcpRdLz
	4oecNjPuHlpOsVdoYgHEiXrV4lkAmtSsTmH2dTL7oVEUIKSfEi+/1CmL1ab22LZMuv2JO1l7ZWK
	sDHPwVkD47irfgKuRIJA1bp00BC31hFwWIrGxM+BndNmMFjFacpx3XQQrqDciFEH1ixl57Z0mVx
	Rk0uEqt4y3L1sbQ39yiOJRGqc7wkwgKRGbqBuFlSQesoyEUUE1aVULpBkl4Q==
X-Received: by 2002:a05:6a00:4b45:b0:827:3b1b:43e6 with SMTP id d2e1a72fcca58-8415f5ea4bbmr3190006b3a.21.1779443665338;
        Fri, 22 May 2026 02:54:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164aed7c9sm1757366b3a.13.2026.05.22.02.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 02:54:24 -0700 (PDT)
From: phucduc.bui@gmail.com
To: broonie@kernel.org
Cc: codekipper@gmail.com,
	jernej.skrabec@gmail.com,
	lgirdwood@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	nichen@iscas.ac.cn,
	perex@perex.cz,
	samuel@sholland.org,
	tiwai@suse.com,
	wens@kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 1/3] ASoC: sunxi: sun4i-spdif: Use guard() for spin locks
Date: Fri, 22 May 2026 16:53:59 +0700
Message-ID: <20260522095401.72915-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522095401.72915-1-phucduc.bui@gmail.com>
References: <20260522095401.72915-1-phucduc.bui@gmail.com>
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

Change in v2: 
 - Switched from using guard() to scoped_guard()

 sound/soc/sunxi/sun4i-spdif.c | 62 ++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 34 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
index c2ec19437cd7..89eccc83a130 100644
--- a/sound/soc/sunxi/sun4i-spdif.c
+++ b/sound/soc/sunxi/sun4i-spdif.c
@@ -427,24 +427,21 @@ static int sun4i_spdif_get_status(struct snd_kcontrol *kcontrol,
 	struct snd_soc_dai *cpu_dai = snd_kcontrol_chip(kcontrol);
 	struct sun4i_spdif_dev *host = snd_soc_dai_get_drvdata(cpu_dai);
 	u8 *status = ucontrol->value.iec958.status;
-	unsigned long flags;
 	unsigned int reg;
 
-	spin_lock_irqsave(&host->lock, flags);
+	scoped_guard(spinlock_irqsave, &host->lock) {
+		regmap_read(host->regmap, SUN4I_SPDIF_TXCHSTA0, &reg);
 
-	regmap_read(host->regmap, SUN4I_SPDIF_TXCHSTA0, &reg);
+		status[0] = reg & 0xff;
+		status[1] = (reg >> 8) & 0xff;
+		status[2] = (reg >> 16) & 0xff;
+		status[3] = (reg >> 24) & 0xff;
 
-	status[0] = reg & 0xff;
-	status[1] = (reg >> 8) & 0xff;
-	status[2] = (reg >> 16) & 0xff;
-	status[3] = (reg >> 24) & 0xff;
+		regmap_read(host->regmap, SUN4I_SPDIF_TXCHSTA1, &reg);
 
-	regmap_read(host->regmap, SUN4I_SPDIF_TXCHSTA1, &reg);
-
-	status[4] = reg & 0xff;
-	status[5] = (reg >> 8) & 0x3;
-
-	spin_unlock_irqrestore(&host->lock, flags);
+		status[4] = reg & 0xff;
+		status[5] = (reg >> 8) & 0x3;
+	}
 
 	return 0;
 }
@@ -455,35 +452,32 @@ static int sun4i_spdif_set_status(struct snd_kcontrol *kcontrol,
 	struct snd_soc_dai *cpu_dai = snd_kcontrol_chip(kcontrol);
 	struct sun4i_spdif_dev *host = snd_soc_dai_get_drvdata(cpu_dai);
 	u8 *status = ucontrol->value.iec958.status;
-	unsigned long flags;
 	unsigned int reg;
 	bool chg0, chg1;
 
-	spin_lock_irqsave(&host->lock, flags);
-
-	reg = (u32)status[3] << 24;
-	reg |= (u32)status[2] << 16;
-	reg |= (u32)status[1] << 8;
-	reg |= (u32)status[0];
+	scoped_guard(spinlock_irqsave, &host->lock) {
+		reg = (u32)status[3] << 24;
+		reg |= (u32)status[2] << 16;
+		reg |= (u32)status[1] << 8;
+		reg |= (u32)status[0];
 
-	regmap_update_bits_check(host->regmap, SUN4I_SPDIF_TXCHSTA0,
-				 GENMASK(31,0), reg, &chg0);
+		regmap_update_bits_check(host->regmap, SUN4I_SPDIF_TXCHSTA0,
+					 GENMASK(31, 0), reg, &chg0);
 
-	reg = (u32)status[5] << 8;
-	reg |= (u32)status[4];
+		reg = (u32)status[5] << 8;
+		reg |= (u32)status[4];
 
-	regmap_update_bits_check(host->regmap, SUN4I_SPDIF_TXCHSTA1,
-				 GENMASK(9,0), reg, &chg1);
+		regmap_update_bits_check(host->regmap, SUN4I_SPDIF_TXCHSTA1,
+					 GENMASK(9, 0), reg, &chg1);
 
-	reg = SUN4I_SPDIF_TXCFG_CHSTMODE;
-	if (status[0] & IEC958_AES0_NONAUDIO)
-		reg |= SUN4I_SPDIF_TXCFG_NONAUDIO;
+		reg = SUN4I_SPDIF_TXCFG_CHSTMODE;
+		if (status[0] & IEC958_AES0_NONAUDIO)
+			reg |= SUN4I_SPDIF_TXCFG_NONAUDIO;
 
-	regmap_update_bits(host->regmap, SUN4I_SPDIF_TXCFG,
-			   SUN4I_SPDIF_TXCFG_CHSTMODE |
-			   SUN4I_SPDIF_TXCFG_NONAUDIO, reg);
-
-	spin_unlock_irqrestore(&host->lock, flags);
+		regmap_update_bits(host->regmap, SUN4I_SPDIF_TXCFG,
+				   SUN4I_SPDIF_TXCFG_CHSTMODE |
+				   SUN4I_SPDIF_TXCFG_NONAUDIO, reg);
+	}
 
 	return chg0 || chg1;
 }
-- 
2.43.0

