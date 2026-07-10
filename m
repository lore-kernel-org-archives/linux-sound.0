Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60670377EC7
	for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 05:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783660009; cv=none; b=cOikzGhPi73QSUToOq2vqLyReA9t+XvZq0Xn1odwdnvuNjadG377e5sAUREHmKO0+yl0TXJ+vkikHn23idsFMUP0psyk6rzeKSw7m1xCoGDoRrlcafC8b5XprwqOj28ora7iQcLrCE+Q3KguYF6kTQIXEXJp/oLcV0fr4yX1gOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783660009; c=relaxed/simple;
	bh=WwNjHw0SRNfo9aeoqwnXMQdjAxCjVTDeacaiflJQe6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MTUir9+tVb24o+exgZUVfLHZe7tI9KuBVD7WZReWcw1gO3gtAhePsoZxO7MmB0Am8az0iqfTF2jb9E6GXK7Ga1cucckoL2rtG/eaa77LyeTPSK+VL1H7TvXYnDnTgw4prHczggjbhzot+SyL/ZZVV1bVdONorsd1pG06bSZa1rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FHBdQATc; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FHBdQATc"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8487214ad2bso623746b3a.1
        for <linux-sound@vger.kernel.org>; Thu, 09 Jul 2026 22:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783660008; x=1784264808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AtVsXFH15IrgzMd0VFvy62roDSh+hKjqh257VzvTJMo=;
        b=FHBdQATcGs2jEaaWff+gNlup3QyqtLq19ldb3Oe/1iIjo+dtQgTpkurYSeQh+358bm
         jci2Jumh4D5G0tyiX0GB0fF26vzfQ9xHbzvfEn3qBwYe/Agbxk7Z6I5XaerxK8ynhE5R
         9Qfb35oSuGqfIXUHz/NZbP5o6UxtZ2ZW3CSVdap5uN6/fJswtAWw3WDU+9ml4JjkPqL3
         0DTVe1VVdCuXBIuw2C1pvyeJMtxTjPIIAoXEDnMLGdA/GMbv14nRJcZNKL3/FNy/R+Gv
         TydmnQCPcNTc8afMlbyFagWnzFNEh7NWPdR6Wh1jqtijsYHdr1dJ9WFULmvV8Lcsy2xu
         Jv/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783660008; x=1784264808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AtVsXFH15IrgzMd0VFvy62roDSh+hKjqh257VzvTJMo=;
        b=JlEQTtAzmYYEQFTR8W+7yt86b1Uy2xExzQwoV8EW6okg59xtdCuIKKDY5+dWQkTQ7U
         1zoqQRHb59HFmuEh4OONo0O0ugLztDJHK+n9yOo0KZeKuFf6xw3ZMCco4WvPZS3PfZmW
         rt35exWI90C4yebHamu1anGbr/EEfZ866NhL7FZDwF0e5jBaZDYvO45ikig/D8sbgkrJ
         Icc5yul/QVJ6KN4pxCeCh5zjwSq1rWVE/R17qyOVnZe1QecGtkztRSx+6fP1GT5Ejr/s
         mspqo62dANR3gANlec8DgwTKLUhy4thEN9R5y2jXoCCqKnD83odGDrM4tdj/e/UojdvX
         LoVw==
X-Forwarded-Encrypted: i=1; AHgh+Ro0Tzjpcvk066LAqi85sNDa2IyJ5lGjJhrTRDiRIo7Xn54GscT4J7ri60++L4wEeUfawA32YTSEvWJlIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmfVxj8OPYvHO4h72f9NDJ/NUWj0f52JE0wFebeF08wghJAJGP
	DewNahIVYdWcdcSWJIq6kfm9fKPvk+/87HpHh5qN2Q3k+UcSVd4Bhoe5
X-Gm-Gg: AfdE7clpggW3kcYbwM8KLb0h27Oqldq+g3Gl+XBC4p/HBp4f7FGiApsSZZv7da3XXO5
	Tc/bm4cvMIDv1JZdNefxmq3IJgiCJzvDYeRy4zzQCvLHXwWYLD3gYxWr8EX/XwVSEfqa3Levvr3
	1mNLWlNjfYcNYfd7anqPD/SlAqJTfkNb5KOAZE6FPXIrXu8Kf5PD8r/eCp1LpM5aFTAZMgX9pgb
	oU7R+rRxy229yOBQj+LzMKvsC5/4Bnjce0rXfV3QYc1NJPc1YeLMxbElA74BTgLias+eK6Wm5uc
	mJE4pUx0Rkc5MxijBTzAM2H9tNehogWCpqt80EMvUfuHAOpHOHJ2+VwOl2Tz8Z2zvPewqJlZQx6
	oTp5QKzeo7l/X5JDANU+JIduc4SEaRcqU0zmi13wfJMm/K2NkAglj1Q0CecJn9n230Q9qny4o06
	Vrea9zEk0Vu0Nv8Jp1nSRKmuJPuYcQDPT4KYFaZ2oQUISsJvg=
X-Received: by 2002:a05:6a00:a15:b0:848:2f77:e2df with SMTP id d2e1a72fcca58-8484392f4a8mr10653484b3a.72.1783660007641;
        Thu, 09 Jul 2026 22:06:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:06:47 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com,
	Zhang Yi <zhangyi@everest-semi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>,
	HyeongJun An <sammiee5311@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 12/27] ASoC: codecs: max98095: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:04:56 +0700
Message-ID: <20260710050511.14439-10-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710050511.14439-1-phucduc.bui@gmail.com>
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/max98095.c | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/max98095.c b/sound/soc/codecs/max98095.c
index ced9bd4d94da..c47bfa2378b8 100644
--- a/sound/soc/codecs/max98095.c
+++ b/sound/soc/codecs/max98095.c
@@ -5,6 +5,7 @@
  * Copyright 2011 Maxim Integrated Products
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
@@ -1532,15 +1533,17 @@ static int max98095_put_eq_enum(struct snd_kcontrol *kcontrol,
 	regsave = snd_soc_component_read(component, M98095_088_CFG_LEVEL);
 	snd_soc_component_update_bits(component, M98095_088_CFG_LEVEL, regmask, 0);
 
-	mutex_lock(&max98095->lock);
-	snd_soc_component_update_bits(component, M98095_00F_HOST_CFG, M98095_SEG, M98095_SEG);
-	m98095_eq_band(component, channel, 0, coef_set->band1);
-	m98095_eq_band(component, channel, 1, coef_set->band2);
-	m98095_eq_band(component, channel, 2, coef_set->band3);
-	m98095_eq_band(component, channel, 3, coef_set->band4);
-	m98095_eq_band(component, channel, 4, coef_set->band5);
-	snd_soc_component_update_bits(component, M98095_00F_HOST_CFG, M98095_SEG, 0);
-	mutex_unlock(&max98095->lock);
+	scoped_guard(mutex, &max98095->lock) {
+		snd_soc_component_update_bits(component, M98095_00F_HOST_CFG,
+					      M98095_SEG, M98095_SEG);
+		m98095_eq_band(component, channel, 0, coef_set->band1);
+		m98095_eq_band(component, channel, 1, coef_set->band2);
+		m98095_eq_band(component, channel, 2, coef_set->band3);
+		m98095_eq_band(component, channel, 3, coef_set->band4);
+		m98095_eq_band(component, channel, 4, coef_set->band5);
+		snd_soc_component_update_bits(component, M98095_00F_HOST_CFG,
+					      M98095_SEG, 0);
+	}
 
 	/* Restore the original on/off state */
 	snd_soc_component_update_bits(component, M98095_088_CFG_LEVEL, regmask, regsave);
@@ -1683,12 +1686,14 @@ static int max98095_put_bq_enum(struct snd_kcontrol *kcontrol,
 	regsave = snd_soc_component_read(component, M98095_088_CFG_LEVEL);
 	snd_soc_component_update_bits(component, M98095_088_CFG_LEVEL, regmask, 0);
 
-	mutex_lock(&max98095->lock);
-	snd_soc_component_update_bits(component, M98095_00F_HOST_CFG, M98095_SEG, M98095_SEG);
-	m98095_biquad_band(component, channel, 0, coef_set->band1);
-	m98095_biquad_band(component, channel, 1, coef_set->band2);
-	snd_soc_component_update_bits(component, M98095_00F_HOST_CFG, M98095_SEG, 0);
-	mutex_unlock(&max98095->lock);
+	scoped_guard(mutex, &max98095->lock) {
+		snd_soc_component_update_bits(component, M98095_00F_HOST_CFG,
+					      M98095_SEG, M98095_SEG);
+		m98095_biquad_band(component, channel, 0, coef_set->band1);
+		m98095_biquad_band(component, channel, 1, coef_set->band2);
+		snd_soc_component_update_bits(component, M98095_00F_HOST_CFG,
+					      M98095_SEG, 0);
+	}
 
 	/* Restore the original on/off state */
 	snd_soc_component_update_bits(component, M98095_088_CFG_LEVEL, regmask, regsave);
-- 
2.43.0

