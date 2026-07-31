Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274BA33F59C
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 03:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785467398; cv=none; b=FaPLiiQ2tLv8Yl51yd5D8Dy3I09J8ehHHHiJ2x79c6zRMh+y5WUztXY7PTy5borCPoT0kUYEqbiRM+Ld64rJ1i2rrSON4/w1u3mPQTLECTTee7fMcsr53E6iDJaRUTW/Gp2MhQZbEqLmPxwA24KfNsXBgTuWLtvRnvI2i3Ne4gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785467398; c=relaxed/simple;
	bh=Fa/+gfQ3SzEgi11qWxA09O6FM4GPY4YkSzC3+KOzEZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=InGFwjvm8PyqvaEfSmT2K07Cl92y65SwwhMQlBiDEJhh1jgHqUQOb7Q/RrVuJr4RmcQfJ+6jiLC3Lx1qIFDIynzsKZg0eNCZMwvfxx/dUoD3eUgNOFWtUPep8Ebl/VnkS4bPH2LJeuY0uXEQ7dp3WGEM5flmdtDTYfG6gG3/Un4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mKImLUzR; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mKImLUzR"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cacf197759so6664865ad.2
        for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 20:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785467396; x=1786072196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aWHLEKCAQ5mV1sF9yyFHSMFUTDOduAtPgNwQ5RGsXm4=;
        b=mKImLUzRxA0uk5pfsvrn65IkfNC4eMvwIEAHmsI4R/oe/Ua0cxKnveDg842iyAaNlF
         OEsFPZTg03LBFnpOjOl2CYH5Wq8yqyZ61dmNAsVLh7Z9rwUEm9zMIDi7izq+JGX3G2tb
         VheIeTmp4mXJ0SWMxvKNGxTr+4zEdbn5FaZdw+qSUa/zaxqJStujebnNOwHwz4hzMq5q
         mY2th90vf32SWHkDLKnY4s/NEYQPISTYw4zo/Ca804UL2ADVgIY0at4sMHZsQAYgVjU2
         cjJINxI7ejPTr9eoC4iyS3GqAiI7Gw+PRfuTB/kygn5HwYVTGjuO27fLz/EyaxGnV0C+
         Yckw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785467396; x=1786072196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aWHLEKCAQ5mV1sF9yyFHSMFUTDOduAtPgNwQ5RGsXm4=;
        b=dDHU0OgZl8tKDReq+elmDjkIDhCZ5+wB8yoauce/wJHuRmr8njxRn5NZSQYeCiXRuZ
         hXzV4SosLyPLpLVZgjfYGx6MtDMXa8SLyDbDApv6TzTBqXVbIpyB8xR6trWU+sohn/5/
         DAMGShAXXDEiYtOuEj0U0AZkA9BwK2kiZu9XfxetT7xWPHfvPriCjRhRco5EfgdYARvk
         HyHII8QyYRs+aUjLBciQ/ZIizMHlTb36gvSGSjoun1Tav0SytZvKj3b7RKoWPKz5yFPy
         vn61S8a8uPMhtwioq0LzCiI1zhXpscmqBiWZPunQfOw+4ZVAyguE4Sq4642c2nTVwVDj
         Mzxg==
X-Forwarded-Encrypted: i=1; AHgh+Rq5Uj7XPXIgVO2xV+DmIV9U+yMp6N3A75Ga1tsqpCGj/vg6AfmdPuDAWzndRk/mlpOW0vEwa2wHhiJ0tA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwePxrpsT04MSQhxpwk+5ouA9ksldWYhTBGU35CprXVmxn0sbGJ
	ylc7W5z4DrBuPvc0c9v0Zl9MOg3iUK6jLTcA8uMmJMqPQoJi9qDg49Ud
X-Gm-Gg: AR+sD102z2ye3gTl3Mku49B494Ax2k/56bgNVSWXlWrpNIhdPzHEiJUp0YCOYeb0q48
	YcAf3aJ6/WgtmIwG0hiRDcRoH5tPJEquL2CWq5TRxqdnHCAlwp2LhDOlcfRNfkMNYe3u8r8cD0d
	N1sQJwEKFgYfm0yFWR6h+zEfNdo0FpcwwJ08DAqGLl0Y3MpXa7ZZJWf0izGaPIAXtVPOrQkVR96
	6RDwdAnnJFTrD9buGfLfpAP42tI3icmfzFliGnexWcSmyY7+ybFUUAPf1Kf83rzCkD9v8dZczg+
	MccRNK0teOY26mGxF4BOtySo0aH3fSyJwu7xCrJh1S2Jsnx52PhmdJD4qUwEXK6RvjQRjxLTp+S
	00iqwo28LWD9Vm8g7Qznbug7uXP5nIIEboXEyhDvsxdNsZgE38wsQMfAhendeIG0BhvINV2MFHT
	A3i7mkXJ+AmKQadpIcPzzFLqwPkE6B+eHNiq228AUXMMbMGjOZd8JEn9b4Q26S0vdQuvtEaVuDw
	WvBRp/XCioC79HfxiwplhfkIIyv5+tDG6pUJ9xCH69d7L+OiQtHQvo94GHxmYaJ2W2xoBdLqlOC
	LOOGhf8mMGEoN19L
X-Received: by 2002:a17:902:c94a:b0:2bf:dd0:c8b1 with SMTP id d9443c01a7336-2d046b34b50mr4660025ad.0.1785467396392;
        Thu, 30 Jul 2026 20:09:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d047ae9f31sm737595ad.60.2026.07.30.20.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 20:09:56 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>
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
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 01/26] ASoC: codecs: sigmadsp: Use guard() for mutex locks
Date: Fri, 31 Jul 2026 10:06:23 +0700
Message-ID: <20260731030648.8706-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731030648.8706-1-phucduc.bui@gmail.com>
References: <20260731030648.8706-1-phucduc.bui@gmail.com>
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

