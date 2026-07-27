Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBB63EB108
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 09:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145297; cv=none; b=DRYLEznnrJIDK4TAmFKJL8FhS5U955NvnIcp2OD3mXfNChGaEj+8fn/y2h+ONIKOX2qvn44ResBuof7hNBKdoKr1P0MRC6Ce5Py5PvTwNFdjdpM41yBQvN+hArZpT9br3PizeqDsXPjatmKwVc4AuFgL7FYZH0i2pI9Y9HqVT0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145297; c=relaxed/simple;
	bh=Fa/+gfQ3SzEgi11qWxA09O6FM4GPY4YkSzC3+KOzEZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=opkzpqJWfAuZqGvoYBCPAZZ5sF8VahXn2rSn+1DdxM14KIKti47A/yTU+2JnUAk98sfN/EsEz3fOGtyBJOdqhcjYUC3HuSVW+111Bz1ldEqJ7gxN+xiets+4v+spBJXdDG7Q3gJ47hSi7MWQv/fs6WKr+uYBLKV//XUsxCPO10U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=maecXg9f; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="maecXg9f"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84a2c90e383so2209901b3a.0
        for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 02:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785145295; x=1785750095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aWHLEKCAQ5mV1sF9yyFHSMFUTDOduAtPgNwQ5RGsXm4=;
        b=maecXg9fVTKk9MppnS8HKdp8ZzAy6Du+s41APop1LdPbDyHpsJJvNILL91Rb4RU3pe
         a7mCgHMNjPojPRzQgZ2z1J+dKaNp2EKIFRmmpoN0V5XilvvP7udML3WcuaWACMrik32A
         sJsdJZLwyfQkzM/8HzG+CuSortLw4ZG+iwaT92mFLrViqLzn9upp+QDB8CFlrRiAzeG2
         z7M44ahHDFB/1c2b8lLMQM+WSHnCc5Z+llSVXr91U5zYHWrLrIWXmlV8pSpv8u0p5Pog
         dxzJQ8ZwlKUUD8lvY+y3z37C+nuiSjf7utQiylNikZXXYgeynBBdK8lqkGPKTuZXDVJo
         rvqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145295; x=1785750095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aWHLEKCAQ5mV1sF9yyFHSMFUTDOduAtPgNwQ5RGsXm4=;
        b=AU8eANLftfdtTddkE5piAI8yz4DdL9W2fKjeoWkZs2eHz2jbZq470pLbPYgGOtqffi
         LWHX+MLxqzRdv19F3v9pvpRZ5g6TW+VTsn1jcXLyJODDbNLhtEqsXWcvyPMsc+zoWZo5
         hGslGspk0xZaNzDwwQC6geBB4/JvE2/lVYQs7IyM+6fPQbkxftz0LpGT/d8LE/dUwmph
         SOkRG9SJPwTIj0TC4CgbAoVICGbT/vHaCpD/Ebb29//l1SoF96GYuigYW/ertygUa8Lo
         lnpXib+0fDUysHRK/Oev/vVDqwnaSJYW/w+AdeOjxEt9hLCSd9mUh8SzuoGdysSphIE2
         8Z2g==
X-Forwarded-Encrypted: i=1; AHgh+Rqphl00CsXUt4KUC8DQqtAthvOOIrb4JPhz/QgW1njqN5zGQoj1EYVz2HQVC1GZXY9KohZGR9OYYL18dA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVpjfympHGOw6ih/K7cjWoP9LzP7aFfjpSYREd3j9KOBwbfqqk
	F4Ldlqd62zgAtK3ixN3mJiNEFvAJ40cSnCiYorPd96S+xaJMi5uGMFtBJhdu1Q==
X-Gm-Gg: AR+sD13dBsLwM6afXp3Qk2HOgGw4GTYocDFMNN93p8uZAzTGbLWNSjRQe7gvaV3TSno
	MlalqUG7DtULgAKMW8EVCP7jI7lZZkqP9Vuus/RmeAvPxzmt8XFFKOR9QDrbQktgWl2ZNMPxwez
	2HmfxwzlVn/7sBrjozzIGvkwBB3VV/NRz3pWW5f2VoBYtdhwtczx92fT0aG3Pwlm6okbpWA64Tn
	5CVxKJ8I+Vp0n9eMuBHs0ms7QvbqCF6s81lEm51cqzY4UfFpFrPIAzfxnn+Oyl+9hnjeu4hH5vZ
	rC9Zy/eauxgRyxFTrXwaWscpu/U3qmks7vU1EEAuYzI9s9qKYJtVuPDE4PueZ5doSznz/TUwyZE
	Mt6/B+AZg5K1hAjweZFPhCwDUSObWCKIS3VbSkp+//P/MvLNpishhWJPukM2lgKMpuUgVfvTwPK
	4pDz5lNPHo2yc6MFN5AluLNNz5aQldhnGv4l43+pKCmcfV5aIq8yLoMSVIKxjCPDTvVM0Kd2i/7
	b5+mz6ko8umD/bDK/yRltBpdtoBO6X5
X-Received: by 2002:a05:6a20:430f:b0:3b3:a66e:3911 with SMTP id adf61e73a8af0-3c67260e5c1mr9504557637.19.1785145295401;
        Mon, 27 Jul 2026 02:41:35 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66b5ffesm2959018a12.19.2026.07.27.02.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:41:35 -0700 (PDT)
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
Subject: [PATCH v2 01/26] ASoC: codecs: sigmadsp: Use guard() for mutex locks
Date: Mon, 27 Jul 2026 16:40:21 +0700
Message-ID: <20260727094046.23001-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727094046.23001-1-phucduc.bui@gmail.com>
References: <20260727094046.23001-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/sigmadsp.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/sigmadsp.c b/sound/soc/codecs/sigmadsp.c
index 2e08fde3989c..b7dbeb237447 100644
--- a/sound/soc/codecs/sigmadsp.c
+++ b/sound/soc/codecs/sigmadsp.c
@@ -5,6 +5,7 @@
  * Copyright 2009-2014 Analog Devices Inc.
  */
 
+#include <linux/cleanup.h>
 #include <linux/crc32.h>
 #include <linux/firmware.h>
 #include <linux/kernel.h>
@@ -135,7 +136,7 @@ static int sigmadsp_ctrl_put(struct snd_kcontrol *kcontrol,
 	uint8_t *data;
 	int ret = 0;
 
-	mutex_lock(&sigmadsp->lock);
+	guard(mutex)(&sigmadsp->lock);
 
 	data = ucontrol->value.bytes.data;
 
@@ -148,8 +149,6 @@ static int sigmadsp_ctrl_put(struct snd_kcontrol *kcontrol,
 			ctrl->cached = true;
 	}
 
-	mutex_unlock(&sigmadsp->lock);
-
 	return ret;
 }
 
@@ -160,7 +159,7 @@ static int sigmadsp_ctrl_get(struct snd_kcontrol *kcontrol,
 	struct sigmadsp *sigmadsp = snd_kcontrol_chip(kcontrol);
 	int ret = 0;
 
-	mutex_lock(&sigmadsp->lock);
+	guard(mutex)(&sigmadsp->lock);
 
 	if (!ctrl->cached) {
 		ret = sigmadsp_read(sigmadsp, ctrl->addr, ctrl->cache,
@@ -174,8 +173,6 @@ static int sigmadsp_ctrl_get(struct snd_kcontrol *kcontrol,
 			ctrl->num_bytes);
 	}
 
-	mutex_unlock(&sigmadsp->lock);
-
 	return ret;
 }
 
@@ -677,10 +674,10 @@ static void sigmadsp_activate_ctrl(struct sigmadsp *sigmadsp,
 		return;
 	changed = snd_ctl_activate_id(card, &ctrl->kcontrol->id, active);
 	if (active && changed > 0) {
-		mutex_lock(&sigmadsp->lock);
-		if (ctrl->cached)
-			sigmadsp_ctrl_write(sigmadsp, ctrl, ctrl->cache);
-		mutex_unlock(&sigmadsp->lock);
+		scoped_guard(mutex, &sigmadsp->lock) {
+			if (ctrl->cached)
+				sigmadsp_ctrl_write(sigmadsp, ctrl, ctrl->cache);
+		}
 	}
 }
 
-- 
2.43.0

