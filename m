Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CE733F59C
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 03:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785467406; cv=none; b=Uwl07ZWhFmThBPWVy9ZDsnpVtvWHv8KfW7LajrFebVf9nHe36bUW0ZmqGWpFIv+RBAUx+CrCaoNpYkjYN4UHEe9sJ54xTzLAZcoWAvx02yIvTSErUjAcD11PWQl0/ce3Ed+Jl8wMuw8r0GJvgvGDajkreieaxzD/qY3xr3XLEnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785467406; c=relaxed/simple;
	bh=GEVBslxyQTjWkaD769j6sBltZvw/8KgoyK2Jx23lHrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZPrUnBHZ4Hqe/XGwdHdrxJbZFrG4pEgFskOkNMkrtEC7xf0y6KzT3oTjktefuwNrP9nzAhhpcEF8M2jvWGeMAoXTMQJb8WhGUpztMMIux031eNEHVHWBbwOYLf+BZ7BYO7uDzIYPp+MQloL6H+bKzzpLlPlSIqTvrqgRulYOgUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sM4iE/Up; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sM4iE/Up"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cf27856f9cso4982705ad.2
        for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 20:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785467404; x=1786072204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LJuHQA4AENaPcuIoY4pYQA3muOxiEnEKnbdN4NwUjpY=;
        b=sM4iE/UpA94cEu/JjcVFFLeHx/zmNzoTyaeL7f/doZag8G5MwgsGoFM+KyecfU7cYI
         MFygHl/gDnyLh1+F58L1hQqoMdC3e9kvrVcaq1TBPKhSDRddr1+W9fiDrySXVWElCSVU
         qGPLPVbNVenReKAVCjGArMOb4Y1cGxNia/Evwmkc7nd5mud/IpJyCyv8GOcX2d27xkup
         uVseoWFb3H0CqiUSxP9pk0+ia3gvXUd6TGpJ3sxofcRe6yoz7/G4SidVYDrNgOvEw1Hd
         nwDWUto9mDSK4ZNYh1+jzcNCzBIxjmFOIpyBWtdGGhPxd5FRDSDhmtisxNY9x54BGpxP
         P2vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785467404; x=1786072204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LJuHQA4AENaPcuIoY4pYQA3muOxiEnEKnbdN4NwUjpY=;
        b=bHrNqXRPHkqGPPbe+NeuVduB9kDICJP3MxL7jMjCEu6ImvFaEBMwhtBRWK8+2/fCDm
         woZkLGRwa3Cz1/m5UthcS3mCvJXA/aZM08ttM0KGKd1H9ur9B9BWa8bbfFT7jBTeMmMq
         2ESsCB7LAdmkoHBR9ovN8sAwFPL1yteogf80qI6XLGvDNKD9+6toaAGvj+y+lBex0oxB
         j1kpE3yetdsi/UaqGMtcqqQqEONEooOTrHxRHHSBLjvknBD9oqr6S5zPd6NJIHq5H+Ej
         xMV6m0a3jGH5OCvV6mV5aAT0BWNdwKgX4tImFBvpFLCJl61u01VE3D0u4GxkjZeGIoD/
         U5iQ==
X-Forwarded-Encrypted: i=1; AHgh+RqsYeYFtkU35g4oG8bI16X0NFhoBuZQYd7Vs8ytfUfPQ43i0roW4J1xWl/qHE0EedRIDJ/p9qpJ3UA0JA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCwW8DCPT2f/utREOrPaJWMDZayfX12lzgcJUm6evs7S6e/eJz
	kz0Ee//Shf6velC5kDjZZa5g6tNokv+wpz9k9eLHgsgNTnKQAIof7vDU
X-Gm-Gg: AR+sD127KnHBuk7kLcxKS+RX5eZoj4eOe7ayNb3/7VMPtd/QHw/DNl02goWyPLwJZg/
	3aQ8U46vBsx4t2++tyO2yutPqqpkQl6B07UbZ7Ke8BHayR0iwq0EPIAiChKEGT3pAGgRJrwmqQC
	CXJ9qLwm2IZr+c1DA756dlKHr6xF63lMjxWdb7fTC52owGI9mr104CUVu++mRvK/iJsgi3S8FiB
	+e6piQO7ZoJ9O0hnZj5J9hzzw5jxOOu6+uUq6hwFUdaFH1yA73skRnK/x5LBxfZfOroltAx1jyT
	dRDUWbeM40B6rxSasZ6VYrfI1O5I/XDY/VD6CUMInPHPBWym4bm88yo983gg2uk3l8feXBdgZ3p
	X++Sg/uJgerjtNgmPFx+85N7clUSwmxfqslVQKTWEnO1h7AwU4P/jHTvpw9cc1mf3LT/gNb4gcd
	ue3FpdDVWGgNL9mwvjD4V7BZ8ISE8NtlCWw+fxS1/qswb2c2Cb//jvccIoOdG6AU6vgVrld5AW3
	ILm18Ux64aIHcVDRAdR1Xc/LESzg3pySfUWNZBjHOMXnYDzofyFn/FOBg3nCbVkpAKv2jJ7IAsb
	Jydt
X-Received: by 2002:a17:902:e5ca:b0:2cf:b6b5:9cce with SMTP id d9443c01a7336-2d046ec87d3mr4546725ad.46.1785467404334;
        Thu, 30 Jul 2026 20:10:04 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d047ae9f31sm737595ad.60.2026.07.30.20.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 20:10:04 -0700 (PDT)
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
Subject: [PATCH v3 02/26] ASoC: codecs: sta350: Use guard() for mutex locks
Date: Fri, 31 Jul 2026 10:06:24 +0700
Message-ID: <20260731030648.8706-3-phucduc.bui@gmail.com>
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

