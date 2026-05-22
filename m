Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B9C3BF667
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 09:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779443672; cv=none; b=FkkheJplbowUrk9+7/ASOkHMYgfUWfLnfbC6NF9Wy/M615jal9fUhAN8ZFp5h4w7LZXtV7AEaGkQZI4gjj4bK8FA30KzFJtMF8GjsYFGwKjfPW1C9EvP/3jYEqlElO65tfUuTDK6pPIWz8YXJNF+aGZLSC+wxFSoKeoT5+cjAe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779443672; c=relaxed/simple;
	bh=FES/LPsuYUEIfYpCxaSWRQknC3l1jlyEQS86EeloiaE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lL/aXpZxUYiNWlVVpvXb6oXhVGh8mmqB/ipx5mxtPrMi8t8izGAVhpWXcqC5y5gmKnD3FmBZOPQr5RVniYHiBwKrCWNR7TC8pAYwgPi6/TdN/lzUxzXu3gCKJYHrDULzkPSQ35q9pJLXxRwgDyXdna35ZzJXCUxR5tJ2Khl37Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lDp7sEin; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lDp7sEin"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-837b39eb078so4832647b3a.2
        for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 02:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779443670; x=1780048470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WsLsnv7a/QcqqVOvsqB3nlisoqKckWLxKBBgfnHU3Rw=;
        b=lDp7sEin6PGJOiHzQsZKoYxIPYRYP9LcWhbD/AAt/EnRGaprlmSTA+FVwvDPD1Fd3n
         uBSkTn+eO7V3OOnuZ/bXkY2McSjFXkpK4M0499xW/Vktsn0x4pLAvogF30jDkWDxqPNo
         BW6BrxVLCSPVbO/brLdfgKgQd5ZRgHjjY2oF3ciofobZQaSTozsI5v5JrQexlI5xZU8G
         WIJJqtr0VU3PH+xmKhanzZrRqvabY0Bbv48RhPM21RnAzeP91fZ6uB0JShYRj/+jJ27h
         L3NGq0Qy9I8FVUzAqiGDNRKe9yHMg3OhggActWI7lDRhcXhlHTRpx2gz/QLL6IBD4lZE
         EGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779443670; x=1780048470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WsLsnv7a/QcqqVOvsqB3nlisoqKckWLxKBBgfnHU3Rw=;
        b=jPnPmbwyoIcK2TeD20rPUlT3tlyq/f33TLfTRtpJ5RgUqTK6tNBiTsWeyAWBgcVoIm
         XC8bRNfhGHiy/56n76sqvLGzxkowjKhOOuBwiaQRx3TluTlqxxwlV1FB5q5Q+5oxWuUe
         9mn2TLmUaGaGB88Wpi5mPL7ctEcmXPlyKhX2CD5iFc+OPB1bFBEFo4qVMls1KAm0zxNq
         4aUczrWeaFkJFcspx+0BzBA7eyxYZZ89Uvq4EvsbulKbOy0Rqdk7vh1QLaAg0v4wPvuF
         v9RchU1/RcxMUvnfKrXjqZjJBaPtqiY1XnC0D5cdUf5zDV59FEWUcchYQtl6AObRaRBT
         eQaA==
X-Forwarded-Encrypted: i=1; AFNElJ/PWg9FtYOzXlIehrwTy0C2sXxkB3tB/y+g3B6H8z8OPd+DEwk5wRpEJfqbk5XQydKXMgvhV+U9ko65TQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb94HTELNnBrjVL1OtBAhEhs7zHl+r1ZgBUcrRKUcRhzTVBeK2
	5v9n64bSiQry5mEGfBJmtTnaLjWoKa97wYNN8d7FWcCT2BqApRYEY71D
X-Gm-Gg: Acq92OHQiT5Dq7jd4Ju0JCfy93pC1w7lrm3bSxnUWhq6noJGDS6WqVmSdeRPtj7Uc0K
	71WzFvzZ3Wly4IJ01RFlGGO7QnDgMHymQo9vqpG+pg4LYKKicY4gUkeF4merBmKmmM5OELVWOm3
	PhcrO7VAU3cLyaJEj4Pecm17I8qw48Yqg2/GbrFykkCWvVmTiRmB4Cu6XSNHFfczCfP6jc4Om94
	WDizjbr0nO0HMC6U0vePey3pewTm8ASqTaKI/pPoCztfK9SkxvYLM4Qpr0Pq47d6Pp0CSOWiCLP
	aoaWOn4TKigqWb+eb0PSPAF8kA2Qu8VJoQEf1I0HKEflmcOMa377eD9jq7qEJvDSQ1LiQQdAYei
	dlXxuaXhtduap5VwkO83RB9JNs9OIIUuJkwsY85TScG8pNzm9ozdL9c4Vx33m7t0ZSqsxPNbBju
	D1XGDC7qGpKEadgQm7/D9w1rEWzSggHIGMvCMFGUdSkavypRSYlB469VYUQaO+xxJv/xO8
X-Received: by 2002:a05:6a00:2447:b0:835:4776:7d7b with SMTP id d2e1a72fcca58-8415f65c44bmr3236104b3a.42.1779443669845;
        Fri, 22 May 2026 02:54:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164aed7c9sm1757366b3a.13.2026.05.22.02.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 02:54:29 -0700 (PDT)
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
Subject: [PATCH v2 2/3] ASoC: sunxi: sun4i-spdif: Resume device before kcontrol register access
Date: Fri, 22 May 2026 16:54:00 +0700
Message-ID: <20260522095401.72915-3-phucduc.bui@gmail.com>
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

Accessing registers while the device is runtime-suspended
may lead to invalid hardware accesses on systems where the
APB bus clock is gated during runtime suspend.

Ensure the device is resumed before accessing registers.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/sunxi/sun4i-spdif.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
index 89eccc83a130..f54eb14c9ed8 100644
--- a/sound/soc/sunxi/sun4i-spdif.c
+++ b/sound/soc/sunxi/sun4i-spdif.c
@@ -428,6 +428,11 @@ static int sun4i_spdif_get_status(struct snd_kcontrol *kcontrol,
 	struct sun4i_spdif_dev *host = snd_soc_dai_get_drvdata(cpu_dai);
 	u8 *status = ucontrol->value.iec958.status;
 	unsigned int reg;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(cpu_dai->dev);
+	if (ret)
+		return ret;
 
 	scoped_guard(spinlock_irqsave, &host->lock) {
 		regmap_read(host->regmap, SUN4I_SPDIF_TXCHSTA0, &reg);
@@ -443,6 +448,8 @@ static int sun4i_spdif_get_status(struct snd_kcontrol *kcontrol,
 		status[5] = (reg >> 8) & 0x3;
 	}
 
+	pm_runtime_put(cpu_dai->dev);
+
 	return 0;
 }
 
@@ -453,8 +460,13 @@ static int sun4i_spdif_set_status(struct snd_kcontrol *kcontrol,
 	struct sun4i_spdif_dev *host = snd_soc_dai_get_drvdata(cpu_dai);
 	u8 *status = ucontrol->value.iec958.status;
 	unsigned int reg;
+	int ret;
 	bool chg0, chg1;
 
+	ret = pm_runtime_resume_and_get(cpu_dai->dev);
+	if (ret)
+		return ret;
+
 	scoped_guard(spinlock_irqsave, &host->lock) {
 		reg = (u32)status[3] << 24;
 		reg |= (u32)status[2] << 16;
@@ -479,6 +491,8 @@ static int sun4i_spdif_set_status(struct snd_kcontrol *kcontrol,
 				   SUN4I_SPDIF_TXCFG_NONAUDIO, reg);
 	}
 
+	pm_runtime_put(cpu_dai->dev);
+
 	return chg0 || chg1;
 }
 
-- 
2.43.0

