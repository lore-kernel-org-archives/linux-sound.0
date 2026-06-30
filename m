Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F513237180
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 06:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782801438; cv=none; b=abayOYNXIyURBLxiJ6QjM2bTvhl0jxczHtV7Lb2z0wRz14QgiiBLXiJDsxMBd6kzdt2u1aYXa6kC4oPcdJZ7KSMb5y30EsAsdqVIgCElGQjp8vJkjE9Ic/i1SxmRn1QBz4alL0PLhrfnfk2bRXAZBWE800XqpH0foS9+Egtv20g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782801438; c=relaxed/simple;
	bh=irEDa3n0ohK3TQxzcb1dCcz25OmFm3UBow1veHYd1Gc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SBvBlYl5hk4KVEIfafvw6yw/x4pNVorV08LVZ7aDSLCqYee14fZyHpux/IURHOySj0HnJ1d5SMveLFtjogB87DoyQakfTSC+tdBg8LGJcNqim+fpD2U/yjmyhMg/7s5WzQ529uzQpTpI+UL+kIMeX3xDYDack+Zhqi8eu+j0J6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lA6fCbos; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lA6fCbos"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-845f2909cd4so1195509b3a.1
        for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 23:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801433; x=1783406233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tdURt4n+DcvB8vUuDlvqMqiJ0G2B0zktNvndjJF0Ruw=;
        b=lA6fCbosrWOssoj5CvhuuuF2exAuxVszyJHaFfxM4Z4kWBQimdvpEqOpGAeYLdZ3sR
         OpXPdW/I8xDeHsbshNXoWUKKHMGvwv3b20enP7jqeDbgQp7sNJ3ke0q1711IuHLReExO
         0DNQdfFN+TFCo0FxIyRmycN9c0LsBPl0RSlZaP17i5VMUNsekcK9yzk91zhoYopf5AX/
         8pRKvtvM9u7lWgYBTUHIenF66ZSnyhcqBrP3dad4c1W/TB/76b1pqe02pYhl5pzQ5W7w
         083yRs34/e+tslOvsGe9oU2Ux1mZZEAWmZvZHFgMqsUyhMcuZhy3aXwbbq/6hr4W3bXn
         wVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801433; x=1783406233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tdURt4n+DcvB8vUuDlvqMqiJ0G2B0zktNvndjJF0Ruw=;
        b=qpPkzU7OTCkwBKLDxssY/diPgsZRtg+w+/Eu2+R559juWvT2ajWK1nax6gBGscsleC
         5gKwi6DUHfGAzlLqo/ZYNbaxTzA1TLgJJT6Q4TEqs/I/bjijYF/fMWqlzWHVxjDxkDXv
         CE1dMUmwGT5B4Z6gu7phsLgzydVqkNlJlM+3QTqb0zCIF0MBvtSlAWFV9uKrYAPqQL9/
         JZQL+XsVtXhRDTDbqRc6g2C/qh4dR9p8jbaTuUB0BMfdAkpEFmxHzM8jylo4x8yj7CKW
         FeKMUsrEAllaE6BvC5JhXWWMjGheaN82h3zlKdgrwyDjynr5hemwgTmpBX+RAvaubJ+6
         vcMw==
X-Forwarded-Encrypted: i=1; AHgh+RoLCAFlr6MjGO+4WSpm8dtG9IaDwefF8rnYiedBEY5P9dYtSHpfX6/nRoInbHMf5Ezzhi4NkIG8lYLyig==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfvZBeo1d8sz6Nddr8vXNNVWqHo5QncnCDDYcDX0fBY1Fk31Wn
	ByQDnZnbqqctIFpSKBBJLfX5/p5qux/RQlXQSKa/6+E8RYE3h2BPwCvs
X-Gm-Gg: AfdE7cm0WCXaue/kNaDgBaLDGzdr9O+jOksY0DJMG12wmB79W16XkFUjRoqhQJhaEQQ
	R5gQmew3Bmh9GTg6mKsv5rHjBx0ZLQYrd/Qal6u/d2HV+dx8fE4ekYri43kg2e65tj7yHbN2Qcs
	3uAPv9or5FCy9X4icRomPhanzL4GeU3/c2jIWItpZmEkQ6IO9DbM/D8amo9YSmlCylP2hhglby3
	6T25YixGoErbpGIJ7Erbw0vhnkSlkGCyRU71KoGrrQA+PgZULPiy0pbpT1nb22Hpo0hU1PeJJEP
	CW3tftRt3ujYvDFMRaoxpnCPhqD/JKLiNe3GCQoGPogT3u1UZG/ohuk1ZBb/YCiGboZqagoLPqA
	oY4o0iJM4iPmYsP+rQ7qsdm+Qdc4r/iPtr5vK8ORD6Hf5Hfafwzk72CfsGDG9QJoqxJys5XLYeg
	x8KE2PBOHhoOHlWJKlYpaofpwduj6VGRdkzuuy/dvCFrqNCaYYJ4nFaQSp6Q==
X-Received: by 2002:a05:6a00:3e12:b0:845:e9ff:5d97 with SMTP id d2e1a72fcca58-8479f105f11mr1877705b3a.12.1782801433517;
        Mon, 29 Jun 2026 23:37:13 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:37:13 -0700 (PDT)
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
Subject: [PATCH 14/27] ASoC: codecs: pcm512x: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:36 +0700
Message-ID: <20260630063449.503996-15-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630063449.503996-1-phucduc.bui@gmail.com>
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/pcm512x.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/pcm512x.c b/sound/soc/codecs/pcm512x.c
index fdef98ce52f1..bc777a53dff3 100644
--- a/sound/soc/codecs/pcm512x.c
+++ b/sound/soc/codecs/pcm512x.c
@@ -6,7 +6,7 @@
  *		Copyright 2014 Linaro Ltd
  */
 
-
+#include <linux/cleanup.h>
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/clk.h>
@@ -399,10 +399,9 @@ static int pcm512x_digital_playback_switch_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct pcm512x_priv *pcm512x = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&pcm512x->mutex);
+	guard(mutex)(&pcm512x->mutex);
 	ucontrol->value.integer.value[0] = !(pcm512x->mute & 0x4);
 	ucontrol->value.integer.value[1] = !(pcm512x->mute & 0x2);
-	mutex_unlock(&pcm512x->mutex);
 
 	return 0;
 }
@@ -414,7 +413,7 @@ static int pcm512x_digital_playback_switch_put(struct snd_kcontrol *kcontrol,
 	struct pcm512x_priv *pcm512x = snd_soc_component_get_drvdata(component);
 	int ret, changed = 0;
 
-	mutex_lock(&pcm512x->mutex);
+	guard(mutex)(&pcm512x->mutex);
 
 	if ((pcm512x->mute & 0x4) == (ucontrol->value.integer.value[0] << 2)) {
 		pcm512x->mute ^= 0x4;
@@ -430,13 +429,10 @@ static int pcm512x_digital_playback_switch_put(struct snd_kcontrol *kcontrol,
 		if (ret != 0) {
 			dev_err(component->dev,
 				"Failed to update digital mute: %d\n", ret);
-			mutex_unlock(&pcm512x->mutex);
 			return ret;
 		}
 	}
 
-	mutex_unlock(&pcm512x->mutex);
-
 	return changed;
 }
 
@@ -1465,7 +1461,7 @@ static int pcm512x_mute(struct snd_soc_dai *dai, int mute, int direction)
 	int ret;
 	unsigned int mute_det;
 
-	mutex_lock(&pcm512x->mutex);
+	guard(mutex)(&pcm512x->mutex);
 
 	if (mute) {
 		pcm512x->mute |= 0x1;
@@ -1475,7 +1471,7 @@ static int pcm512x_mute(struct snd_soc_dai *dai, int mute, int direction)
 		if (ret != 0) {
 			dev_err(component->dev,
 				"Failed to set digital mute: %d\n", ret);
-			goto unlock;
+			return ret;
 		}
 
 		regmap_read_poll_timeout(pcm512x->regmap,
@@ -1488,7 +1484,7 @@ static int pcm512x_mute(struct snd_soc_dai *dai, int mute, int direction)
 		if (ret != 0) {
 			dev_err(component->dev,
 				"Failed to update digital mute: %d\n", ret);
-			goto unlock;
+			return ret;
 		}
 
 		regmap_read_poll_timeout(pcm512x->regmap,
@@ -1499,9 +1495,6 @@ static int pcm512x_mute(struct snd_soc_dai *dai, int mute, int direction)
 					 200, 10000);
 	}
 
-unlock:
-	mutex_unlock(&pcm512x->mutex);
-
 	return ret;
 }
 
-- 
2.43.0

