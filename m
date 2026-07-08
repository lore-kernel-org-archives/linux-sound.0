Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF243783C3
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 14:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520459; cv=none; b=CjUDPLaXEWGn+fn+jBLhPkC0wVg87rC6vNrj6hJ1mVBvboRhh9wqGslmM1lSvhkbSuzu2xGkgiQQAdSKL2FyJB7KFn463vOpHbSxvnjS0jjNYU3xSedHfL3JbeWUfhKBb8XWCG05Z0o2jh9U6KJa4ehIjmrfPfX+FVHfcnCcrGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520459; c=relaxed/simple;
	bh=irEDa3n0ohK3TQxzcb1dCcz25OmFm3UBow1veHYd1Gc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YhdIv1CNamuigyfx6C77Gy+JTd5OaQVEHSF6Imtgo0dqBD66FRfauq0eKhoRGJsulvSHVpyLDHWnmWqyRc6S5Cm8T65hU5GOEJX2To/Gjla87uiwe/zu1kssRQ/KLGwYa7WnOb5JHyGcxIv6ZVpjePUYlmx5IIOg9ttB/bXmas4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gu7Lr8lu; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gu7Lr8lu"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ca64c3ce5fso9387515ad.3
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 07:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520457; x=1784125257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tdURt4n+DcvB8vUuDlvqMqiJ0G2B0zktNvndjJF0Ruw=;
        b=Gu7Lr8lujx2eXN+/5uTyRrP8p7qx1fOkDR3b3ZNBarOLnYSM3vrMB+ei6y8yqVSZl4
         JuUoopsHaoCW784Qu/nyBWJP7tz++SAZeYMnkL+3TDlg2HFN+p70JCnaKyQqZASNvQGo
         q9Ph9ShlOZJlNAat+GhGJXn1MnksQAaD1KtiiuAxa99dVROZ4sgHn+sXucTKKyRG4moO
         xJpE23ieDsydYdGdSWWkBlOaFahOIypTFVSPvJz1hj/7Z7NsF4pcrBZ/wwk5ORFdehtS
         OeFEdUouKo1DzmCOsnY56o8Fz2nnl8CZjw7YNpDUfB4GDMxNUuobZ+DTWRgxhwhjYMii
         j3Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520457; x=1784125257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tdURt4n+DcvB8vUuDlvqMqiJ0G2B0zktNvndjJF0Ruw=;
        b=HqnCbzehn7DoNK9nagNNkn/dmyd1yDwpNjHJGvAfRZV3nrUBHJNON7fh38XLwWG89H
         zZceXD/rp7kRBNGLT3btpFoDdDMnWxmiBRGMHI/SfLlCO24mfhaRWIxaWFbML6+CWsbJ
         X49GBeOVIlyWvcHsA3OpIj+/Uq3qUfh2BglwZmyZriscwxMzDD0x1Q0ChpKTFI5rN7kp
         taPI6Kxr1bBnO6V0QGH90w9t0K54bUZiTKiTa0QRep7YUXS/juuhWFjkDxnoEmIPOzRN
         dMPdpY0rEj31+3qn+UGsMzA1Eg6ubZNrY/t0HycZBZrhWUnub7iDcwafBeK/XqZcSEoL
         cGbA==
X-Forwarded-Encrypted: i=1; AHgh+RpISGR+DUyEGjqJzw+d7eO4ygliXdUiydpT80uSFi5RPXumAzn8OssW0MFY388JmnJ4civ8tGYpdCgUAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJdQXi1U69RwovsFefpv9MEKE/JFcyC6wicrlbsQWG8hs41zuC
	xLMsOiPlQsd6FkGepEh/qacF2ajyDzHNrD4YGsmt/M9J2xW97G1q8Vb8
X-Gm-Gg: AfdE7cldwccvZ9yaY1pfHGMpGJsyUI7pCUMFewJb/yuxnjYuEgBKl5lWrZOBBoPs5B0
	CxMOJ3V05OpeAFCYFo3iau8WoDpoZmwYuBjhbLCgCRoKDct+3em+wqM+AvxbvTXlHnqN6LT91Oh
	uKPmd7r8IyVP9+NpLJvx25lcMGFTlwmlZCE71Bz5vuqNCakVvi/mk9N0XK2GqFK3m9oo5VcU2TM
	iZuYmI4/dzvAQ+MD8AVq4E5pG7Ypw3NqCldX4cXdgDHT9rNJYPN1o3pcC2j40lwIYLHFSkrn1CV
	O69qcOTAc4Hm+wtRsjzjJv47prCuQegLAejGm8lh8ZTFToYW7/yLfA7pwge/dGcXkeOQ5gsMdJv
	pRMK0y87De3qa/5XOe+/+6sRC/eOX/lRpq//kIgC18ZLpYXTnsakvuvJFpEblituyQE/VNbSelm
	i0m5q1nTw+Y2aw3kH9be9AJt4c+Er0MDZPjD6pwaEkRf3XPaE=
X-Received: by 2002:a17:902:dac3:b0:2ca:4b7a:4a02 with SMTP id d9443c01a7336-2ccea599232mr28329495ad.43.1783520456871;
        Wed, 08 Jul 2026 07:20:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:20:56 -0700 (PDT)
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
Subject: [PATCH v2 14/27] ASoC: codecs: pcm512x: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:21 +0700
Message-ID: <20260708141734.578926-15-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
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

