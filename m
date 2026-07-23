Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD2B38D40B
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 04:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784782543; cv=none; b=d4kcnY/6H0gMa7Qbpa50omZh5oAd9tLeTd64NwxLqugistBfV9682cEYEPhAR9/OvH1TvAQje894hL0SY/24+6uWzol81+OMcidKBQLP4uE9X+bQmHWwJ/aTTe+maWycgzwSTgVHDVHXSLabHY13qccdX1t4IuvbJgZyp3Ux0rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784782543; c=relaxed/simple;
	bh=XnhnsPyA5QSjzg0tuQcdHLbqpbZbFqUdXNayJneipxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZUOFLIdIVjMfW982W3TwSgTWtwTLguHJ0qLKPpEVy1H0lyutHOw39VaLuUh3//wlndfaHlkYb+1LGs1k6ZcsHKaufR7F0gCgCx8QLHnPj4XR8VX90ZfAeWQVdAzTyZetFnZwOowwYDTpH9YiM3keT/dm0UYUzhR+1Gtnp7VhLk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=js8NIlJw; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="js8NIlJw"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ceed7018c8so1715135ad.1
        for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 21:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784782537; x=1785387337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RK1Qg1zMLuqf3deYuh7H14WODBPPcltBb1uxyeY+ius=;
        b=js8NIlJwSHr23fZWHoS5PHqp3zqIq88ETdsKVjE7r3ecsCgmNkeExepHyKVvUZ++Bb
         +8o/Ho0CgOxQ2mm8slUY3zlaHKWOnMaZPosARZcX3uoEK6FfQWDT2YeeVEjzj/zSMNKV
         oIfRwJHNO7gZs/UCdxIKdVeU7L2rM4to+Z3VodyCSYhco3tz01M6CDEouxvjt90TC/yY
         gQMiBAMqbG5DxAb73j3pwPV3214hlw48GgNsgD0rDHNdPAeZi6FGDEDJl94+PkXMkhXT
         YE8WbHtsIVRYTrvV/bXUN92nBxQ1DqojWbKqKBXn+4Ml1np+i6Mj9tlFZMgaski5/zoX
         ZAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784782537; x=1785387337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RK1Qg1zMLuqf3deYuh7H14WODBPPcltBb1uxyeY+ius=;
        b=o3SBNCeBVyu2rUm0HWl0IZOCMY/+J6wLIGilnf6enzbReC9aJN789cfWbCInSWnOEu
         vcHXW4/sXyJuDfhyn8Gus+hAbC+u/70Y5YAJrBPdm8tImPGdhqL1suV6R11Iqd+SVI/O
         +p3MemvsEn3PvO8iwLCA6nqZGOyDS1deAFWnlvcAKKm4BON48Ctq7eZ8aA5/lzIjLhOs
         vKVp1s8+BADaGfxN3iSwmZkzqRL3xx9GI/6F4DW+rLTaMcOapCRay5Qx5DHaNUUV/U49
         nKDUiz79Zyv+IqVYcGlisiwqyNsmwaK2pItXdIvjQunEgcoJ8ejnr2yBi6Ch8qUqnPLg
         lHvA==
X-Forwarded-Encrypted: i=1; AHgh+Rpg3oyeVvdz2DsTyOrGN2sdj/dGSvLeXGlihvuZ/O5Ul4WishUaKClLJ/f1NJ2HvnXjy1Sm3hjT79TgjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxyfa08uQTOF768S6Xj/T8H+LGv40YGMmz5VwG7ieIzLwqBSh5r
	ryp+m02LF90kreislTxUTulRLryGmRCMTv01uA7bwVh5wfDYXuUmmBpQ
X-Gm-Gg: AR+sD12p/vbc391HcyIMgMfZgGvi0UndpEuVBjbyP2GMbfYQYKG7mj5U8GU3FQ4eM74
	jr8isTIy2yipAjbmlOqFj/9DIzDkt1zMUGQ/EYw9jvhOkYe4boXIgV271w6rGZwcyWZLxNGEEXa
	Uj6d28YBq6LgGccQBRhSFffLShkbUi7RyFuLarhyyVQlxqqcQjVTcbmdeZH/KN7h814pOYQQ+MK
	SoKPsOrTjNqw0oMrMLHXQpeXScRra93w8FrCWMYOCSONqpwwOKJF63il7YSHl6/+2SHJFZlcs2e
	GXWJJ5Ksd99ylWbfCFReE8mfWVF4zzR93wj4DaHlwDKRoRUSjd44z0L1nkeWD5IeTpEPIByQHF+
	41qgP164YCUHNmuhkbuZWCrr4wm1UhuoFG/RoBOHv/gZNJzYkn4RDPkvf5pMzKaYjc5SrTYqa2z
	/1rvgBsBHix+wY0gkMBL5z1kNOOEwxYErEOiP7
X-Received: by 2002:a17:902:c412:b0:2cf:6f7f:55d8 with SMTP id d9443c01a7336-2cfa6c79503mr22078505ad.37.1784782536916;
        Wed, 22 Jul 2026 21:55:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfa57542e0sm7258365ad.67.2026.07.22.21.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:55:36 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>
Cc: Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Linus Walleij <linusw@kernel.org>,
	u.kleine-koenig@baylibre.com,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Kees Cook <kees@kernel.org>,
	Chen Ni <nichen@iscas.ac.cn>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 14/26] ASoC: codecs: wcd938x: Use guard() for mutex locks
Date: Thu, 23 Jul 2026 11:53:15 +0700
Message-ID: <20260723045327.28260-15-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723045327.28260-1-phucduc.bui@gmail.com>
References: <20260723045327.28260-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wcd938x.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index c69e18667a85..9a9ea37ecab3 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 // Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/platform_device.h>
@@ -1976,7 +1977,7 @@ static int wcd938x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 					    int req_volt, int micb_num)
 {
 	struct wcd938x_priv *wcd938x =  snd_soc_component_get_drvdata(component);
-	int cur_vout_ctl, req_vout_ctl, micb_reg, micb_en, ret = 0;
+	int cur_vout_ctl, req_vout_ctl, micb_reg, micb_en;
 
 	switch (micb_num) {
 	case MIC_BIAS_1:
@@ -1994,7 +1995,7 @@ static int wcd938x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 	default:
 		return -EINVAL;
 	}
-	mutex_lock(&wcd938x->micb_lock);
+	guard(mutex)(&wcd938x->micb_lock);
 	/*
 	 * If requested micbias voltage is same as current micbias
 	 * voltage, then just return. Otherwise, adjust voltage as
@@ -2009,15 +2010,11 @@ static int wcd938x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 						    WCD938X_MICB_VOUT_MASK);
 
 	req_vout_ctl = wcd_get_micb_vout_ctl_val(component->dev, req_volt);
-	if (req_vout_ctl < 0) {
-		ret = -EINVAL;
-		goto exit;
-	}
+	if (req_vout_ctl < 0)
+		return -EINVAL;
 
-	if (cur_vout_ctl == req_vout_ctl) {
-		ret = 0;
-		goto exit;
-	}
+	if (cur_vout_ctl == req_vout_ctl)
+		return 0;
 
 	if (micb_en == WCD938X_MICB_ENABLE)
 		snd_soc_component_write_field(component, micb_reg,
@@ -2038,9 +2035,8 @@ static int wcd938x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 		 */
 		usleep_range(2000, 2100);
 	}
-exit:
-	mutex_unlock(&wcd938x->micb_lock);
-	return ret;
+
+	return 0;
 }
 
 static int wcd938x_mbhc_micb_ctrl_threshold_mic(struct snd_soc_component *component,
-- 
2.43.0

