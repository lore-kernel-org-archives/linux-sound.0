Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1658538F95B
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 04:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784782451; cv=none; b=lV6Rc5t0PN60YlIzELbj+jHesmIw+95BrrMgV93djbIsPQ5h/eBY7wHs9mc4Qg6gF1e+UsZO142rw/eh+hmGTGQAnhsQXRklcGGnIZJ45FE5ngC+H+z6VHbOXJmaGhyM7y8iX2Lx0g+rbMYglpqnaJ73+lQ7JtKanHuHWEOv/o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784782451; c=relaxed/simple;
	bh=GEVBslxyQTjWkaD769j6sBltZvw/8KgoyK2Jx23lHrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nKihYHGusI4Z8kd2/NYawgCiElcFxGijnABaV7UaxAM8IiSnpoIFw3M80Pjk8974R3vA2a6HGc8/syNMpga+asv6pV/vm1gANQusEVdxTQbhKKUKm0kuZ0w1biixjWhkjRZcsxX630byBevNeuvBHdX9Am2r7U9Bo0wQZZzJrcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lCbCWYTj; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lCbCWYTj"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cea3004256so2882815ad.0
        for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 21:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784782441; x=1785387241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LJuHQA4AENaPcuIoY4pYQA3muOxiEnEKnbdN4NwUjpY=;
        b=lCbCWYTjXe2z4WlE6x40viO06+Re+eCZzkxPFIPfjc6LbHrBVOTDDSxRjEeFPNK9fN
         TUOyqu+0VFr6PkBmqLBW8p4bYBERAMLeUrVzbGaa3RKFdOY3rbouKlMZ2ezDOuY5ePls
         GaxH44+aPp3IBk5edJ4hgvg7Py+S4Ai7RGDrtv0R6/NPGgI1cBFmQ+6mJNPTw6L3pB81
         TkzVege4loOfAAPe58GpNghAyYCL4Evw3/mwUFXipW8q1ElkNmXYHiZfbyz+BC5wsEXU
         Kx4aapkBud2I2gPAUUPtNgLsBBA3e52SL/bIP4HyNn98LhSMYxRPgRmKoAopDmw0vK72
         UOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784782441; x=1785387241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LJuHQA4AENaPcuIoY4pYQA3muOxiEnEKnbdN4NwUjpY=;
        b=aDC6Z43wLNDaRCS34pjAzDVyaZhe4C/RJvHaVupvFayuMjWWrnPGPFyQ9q+XV0jjKV
         W0a64PDh0Hem1Vd0Bzx7ihbRn8WRKRNLh0Ae286mNqfkVrHNKMd95ogwCaGf841KuwAW
         vmMr4voV6irh9121PvHggABWo1F73AHlxLMm3OadXYYRwPqX257RV+qHeHaK2GzW0ClT
         pgmvBdPx/nKLUtbKoTPIGJUboyYpCxpGmC9K4VerTXyIcfxW9Vi68AeZpCDnD71feKIc
         vs0w3fhRPRXfdLQ3s+i8RfLyHb7m/WOV7LHruzIu9UzifgEIzQil2+02BG7ZJZ1soQb0
         l+lw==
X-Forwarded-Encrypted: i=1; AHgh+RpK4r5Wz/lffWisHOanb4qcO9X3iLPAjiC73DLc1kDEVqnL/c6JEk5u0YRbfOgvwbpf4G+o6cPdOa82tg==@vger.kernel.org
X-Gm-Message-State: AOJu0YySFd7ZTm9U5nMdXqQl4SdEp3AoirweiyZGI+FWenJovMSKx57r
	wGEzDqjpIMVWvpfeEMKP27/nDsYTs59hTbfIVLUIIEnREYG46cHLNCRX
X-Gm-Gg: AR+sD10ipfksPrYdlteiJ4KBx69donlbcxsoeUqgnkomeb1rydeaV9i53i3YXRvVfgA
	NqtBnbLsYdGl58M7d0E4LyGfRPghx0BtuXtsGCGgmGPtTXKcrE7qo97AvVdSWmUWok1fLTuoyy9
	28YToNPqPDZq0HOG5miHgLNyXofx+8mUCVXLdgLKKMbcMYqhOsI/PkFst4xzydevBnFP9pEI1Ni
	x5jr54XoVHfYCUtbVN80bwi6fNfY5A68OOsu37ofzSLkKdZ7ndeOsQg5iIjwBtdCsHKGhxqpXke
	U5TqZX5jarRQAWR9Pcaap7tEz/ELqkT1GAj7JnRDkCNZpO8FAPoawVOHyvt8qyEn40HJTlHee1W
	DUDhllFRja7DBASoXh3yaKG6iH5cHoRePxd4j/oSm6PYgOK2Xcy8OtoLo6V8nNxGGnuKRO4BptK
	weGwJZ3lMNzjFqfo+WgeCzkC15aXWSqT0RKSRa
X-Received: by 2002:a17:903:1a67:b0:2c9:97a7:71af with SMTP id d9443c01a7336-2cfa6f79cd1mr19036105ad.42.1784782440729;
        Wed, 22 Jul 2026 21:54:00 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfa57542e0sm7258365ad.67.2026.07.22.21.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:54:00 -0700 (PDT)
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
Subject: [PATCH 02/26] ASoC: codecs: sta350: Use guard() for mutex locks
Date: Thu, 23 Jul 2026 11:53:03 +0700
Message-ID: <20260723045327.28260-3-phucduc.bui@gmail.com>
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
 sound/soc/codecs/sta350.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/sta350.c b/sound/soc/codecs/sta350.c
index 99c7f7ac807b..2ba35076732b 100644
--- a/sound/soc/codecs/sta350.c
+++ b/sound/soc/codecs/sta350.c
@@ -16,6 +16,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ":%s:%d: " fmt, __func__, __LINE__
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
@@ -306,9 +307,9 @@ static int sta350_coefficient_get(struct snd_kcontrol *kcontrol,
 	int numcoef = kcontrol->private_value >> 16;
 	int index = kcontrol->private_value & 0xffff;
 	unsigned int cfud, val;
-	int i, ret = 0;
+	int i;
 
-	mutex_lock(&sta350->coeff_lock);
+	guard(mutex)(&sta350->coeff_lock);
 
 	/* preserve reserved bits in STA350_CFUD */
 	regmap_read(sta350->regmap, STA350_CFUD, &cfud);
@@ -320,24 +321,19 @@ static int sta350_coefficient_get(struct snd_kcontrol *kcontrol,
 	regmap_write(sta350->regmap, STA350_CFUD, cfud);
 
 	regmap_write(sta350->regmap, STA350_CFADDR2, index);
-	if (numcoef == 1) {
+	if (numcoef == 1)
 		regmap_write(sta350->regmap, STA350_CFUD, cfud | 0x04);
-	} else if (numcoef == 5) {
+	else if (numcoef == 5)
 		regmap_write(sta350->regmap, STA350_CFUD, cfud | 0x08);
-	} else {
-		ret = -EINVAL;
-		goto exit_unlock;
-	}
+	else
+		return -EINVAL;
 
 	for (i = 0; i < 3 * numcoef; i++) {
 		regmap_read(sta350->regmap, STA350_B1CF1 + i, &val);
 		ucontrol->value.bytes.data[i] = val;
 	}
 
-exit_unlock:
-	mutex_unlock(&sta350->coeff_lock);
-
-	return ret;
+	return 0;
 }
 
 static int sta350_coefficient_put(struct snd_kcontrol *kcontrol,
-- 
2.43.0

