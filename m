Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD98345EAB
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 03:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785467456; cv=none; b=ilX68byQMF6Yb1vbZF4ERa+WygRUu2zB2Z+b63lA22g36S2SiZOftgnQH+3qzh/l3ODQKAJBJcJNywPIzqwpEP65RgsrAFEzzDGwz0Y/TEDPmTyQg0rk7GlEOphmRCHDT1lWNcpN1Jk9Y0N9XhBKxp2a6j7ZV9e/Sd6a0tryaNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785467456; c=relaxed/simple;
	bh=nZGVKfdU4GqxPhxmWCUGDD6Nc/KNfAjP7JAS+KPicHo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M9YJe2IO/hIKUVRJ54Yu2AN+VsZpQ0to85KcXwmyA2YmRqDupgc5OtYdRAqSL4TxgX6IPzIHqLzM3kbjr5zk6NfJOeYEyRrFCmGmWGr3tBVcP1juk+5SHr2llwDonslqOug6hNaYbRqPZuG0vz8GGqG6GDXuTeuySWLrboWwLas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BT96qPxW; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BT96qPxW"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso4108965ad.3
        for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 20:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785467454; x=1786072254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2URIyRhsqdkSXLbHXTDfJ+qkOeAaYtVPXldxW4D65fM=;
        b=BT96qPxW+IMcR1wxh387UjpnJrgMTHKPy73qmBtQW+FtXKHqm/hZzIrqV9RUHaCB1g
         dllLRsHSPDizKVG249V8xrL+temdtrxBt+YkXf5H0wPiMz3h9BKE4Fs5EG2pQkC0kilI
         gqY7CdbuuaiCnKljUoeplqnySweGvUMr/e1efSz4IuBiYuwdCnPpOunZu461by2KKePD
         u+CHiCyBMQDufMvvjVWv33IKvYc/8qbDJkc14zN0126rxC2xF8aKRb1yLbNPElZ4vY8x
         JdOp0PphW6MFltIy+v7AZzVVei6Zpqrwh0Zdl66LyngbhAfEltCpPdFDlh3YO0vwzOOH
         Ldig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785467454; x=1786072254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2URIyRhsqdkSXLbHXTDfJ+qkOeAaYtVPXldxW4D65fM=;
        b=kKqNIST3Y/YR4+/ZT+pwf1fZlbwQ9agclvYryxMWC4MmE1UPsErNKpFIE/L7bxpAZW
         ZPIaiog7E7fXvwI2Mx4p9rB271F5fF8zFBQowY+DiWkEdWcA7Nwz6s7dWf7UL4JVaPJn
         JduIJkaHZXjbTrwY0etFmyiuI9HHbeEpCNo6FMZdIk2U/IbWp9rdOYhLCjtEYmoS9/c3
         da8//jpsSRW555UOeR0jBUkag7laI474FDcS/Y8MqjZzCjAKsejKDazAMwdmSw76gvMg
         ybkJ2FYaYJGMaJLJjxOeVJwWljRP6oZehtnjkLwjtgwb3hUPhnXs8qDBTtYwooA+uX1t
         jRxw==
X-Forwarded-Encrypted: i=1; AHgh+RoN7sVkTkcGpWfWfTogmt8W/I/h+ZCrMJvb6L4g5xxNb3gwtB7PRs94UAYaGWblmmyTArn/u232pcYXYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIyAZTnpRE+3W8lWJwcoDMR/cIi1ufy1t2jkszTT0RSaQeUk88
	MNfpmoKzzillljDEi1lPLx6Gzes1YLm1btEqXTF/ALMGZIU+KDUA2Dkl
X-Gm-Gg: AR+sD11BMywoJsgBj2BKwa2Xj6yRnsEnHPgFFVgH2AWDOgLvfBOKd/tCRfZKoZLGJW0
	tnULYqU7gpSRS+fTWOUeL+gdIGPvJypjIyTtp8DGS4GviQkqt+ZMHwdLObayg39SAeJqXxYM1EA
	VZB9iSyL3lgURA1oUtrTEQaOBMEX6P3EdDL3G+/lS3TDiAl0GehAcTmmgjvO14RuMTPLksPjq3f
	HI0vfvYevOQXZ0HTEYfjw9dr6qTH2OAlBkkk44onrie8ailxh8Koa4zbltd1TeCJXS2w6hcb10d
	rgBnqovTHrrIdP7IO+BJjQ5HtLG3HVKPts++sIyVx0ZK6U0yjLB201ZMCLntzA4FbGrY5w8kxl8
	JFW7ymsIdAJ/0uKd/bqQ4mPyMLQX4XH0ReKMugycC1I8KC0xIGu89z0uH21kGNFLO5aQEbmDPxx
	kPK6Sbd3CG7WUGNcGseaz8G4naz4zmF8TZ+2xorZQo9ZlQCsWX1wVru8eum+7evJpnBQcmuH/tg
	le2FyiHopIne4K1AtxpbLUPG0rFXNb8+3mKKrjz08nbq8d5FKsqfSNensVwQxHublw7ho520Eao
	9SjK
X-Received: by 2002:a17:902:f603:b0:2c9:e846:a57e with SMTP id d9443c01a7336-2d046ae584bmr4953925ad.0.1785467453334;
        Thu, 30 Jul 2026 20:10:53 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d047ae9f31sm737595ad.60.2026.07.30.20.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 20:10:53 -0700 (PDT)
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
Subject: [PATCH v3 08/26] ASoC: codecs: tscs42xx: Use guard() for mutex locks
Date: Fri, 31 Jul 2026 10:06:30 +0700
Message-ID: <20260731030648.8706-9-phucduc.bui@gmail.com>
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
 sound/soc/codecs/tscs42xx.c | 61 ++++++++++++-------------------------
 1 file changed, 19 insertions(+), 42 deletions(-)

diff --git a/sound/soc/codecs/tscs42xx.c b/sound/soc/codecs/tscs42xx.c
index dba581857920..02082ef790b4 100644
--- a/sound/soc/codecs/tscs42xx.c
+++ b/sound/soc/codecs/tscs42xx.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 #include <linux/delay.h>
 #include <linux/mutex.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <sound/tlv.h>
 #include <sound/pcm_params.h>
@@ -210,25 +211,21 @@ static int power_up_audio_plls(struct snd_soc_component *component)
 		return ret;
 	}
 
-	mutex_lock(&tscs42xx->pll_lock);
+	guard(mutex)(&tscs42xx->pll_lock);
 
 	ret = snd_soc_component_update_bits(component, R_PLLCTL1C, mask, val);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to turn PLL on (%d)\n", ret);
-		goto exit;
+		return ret;
 	}
 
 	if (!plls_locked(component)) {
 		dev_err(component->dev, "Failed to lock plls\n");
 		ret = -ENOMSG;
-		goto exit;
+		return ret;
 	}
 
-	ret = 0;
-exit:
-	mutex_unlock(&tscs42xx->pll_lock);
-
-	return ret;
+	return 0;
 }
 
 static int power_down_audio_plls(struct snd_soc_component *component)
@@ -236,28 +233,24 @@ static int power_down_audio_plls(struct snd_soc_component *component)
 	struct tscs42xx *tscs42xx = snd_soc_component_get_drvdata(component);
 	int ret;
 
-	mutex_lock(&tscs42xx->pll_lock);
+	guard(mutex)(&tscs42xx->pll_lock);
 
 	ret = snd_soc_component_update_bits(component, R_PLLCTL1C,
 			RM_PLLCTL1C_PDB_PLL1,
 			RV_PLLCTL1C_PDB_PLL1_DISABLE);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to turn PLL off (%d)\n", ret);
-		goto exit;
+		return ret;
 	}
 	ret = snd_soc_component_update_bits(component, R_PLLCTL1C,
 			RM_PLLCTL1C_PDB_PLL2,
 			RV_PLLCTL1C_PDB_PLL2_DISABLE);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to turn PLL off (%d)\n", ret);
-		goto exit;
+		return ret;
 	}
 
-	ret = 0;
-exit:
-	mutex_unlock(&tscs42xx->pll_lock);
-
-	return ret;
+	return 0;
 }
 
 static int coeff_ram_get(struct snd_kcontrol *kcontrol,
@@ -269,13 +262,11 @@ static int coeff_ram_get(struct snd_kcontrol *kcontrol,
 		(struct coeff_ram_ctl *)kcontrol->private_value;
 	struct soc_bytes_ext *params = &ctl->bytes_ext;
 
-	mutex_lock(&tscs42xx->coeff_ram_lock);
+	guard(mutex)(&tscs42xx->coeff_ram_lock);
 
 	memcpy(ucontrol->value.bytes.data,
 		&tscs42xx->coeff_ram[ctl->addr * COEFF_SIZE], params->max);
 
-	mutex_unlock(&tscs42xx->coeff_ram_lock);
-
 	return 0;
 }
 
@@ -290,14 +281,14 @@ static int coeff_ram_put(struct snd_kcontrol *kcontrol,
 	unsigned int coeff_cnt = params->max / COEFF_SIZE;
 	int ret;
 
-	mutex_lock(&tscs42xx->coeff_ram_lock);
+	guard(mutex)(&tscs42xx->coeff_ram_lock);
 
 	tscs42xx->coeff_ram_synced = false;
 
 	memcpy(&tscs42xx->coeff_ram[ctl->addr * COEFF_SIZE],
 		ucontrol->value.bytes.data, params->max);
 
-	mutex_lock(&tscs42xx->pll_lock);
+	guard(mutex)(&tscs42xx->pll_lock);
 
 	if (plls_locked(component)) {
 		ret = write_coeff_ram(component, tscs42xx->coeff_ram,
@@ -305,18 +296,12 @@ static int coeff_ram_put(struct snd_kcontrol *kcontrol,
 		if (ret < 0) {
 			dev_err(component->dev,
 				"Failed to flush coeff ram cache (%d)\n", ret);
-			goto exit;
+			return ret;
 		}
 		tscs42xx->coeff_ram_synced = true;
 	}
 
-	ret = 0;
-exit:
-	mutex_unlock(&tscs42xx->pll_lock);
-
-	mutex_unlock(&tscs42xx->coeff_ram_lock);
-
-	return ret;
+	return 0;
 }
 
 /* Input L Capture Route */
@@ -385,21 +370,17 @@ static int dac_event(struct snd_soc_dapm_widget *w,
 	struct tscs42xx *tscs42xx = snd_soc_component_get_drvdata(component);
 	int ret;
 
-	mutex_lock(&tscs42xx->coeff_ram_lock);
+	guard(mutex)(&tscs42xx->coeff_ram_lock);
 
 	if (!tscs42xx->coeff_ram_synced) {
 		ret = write_coeff_ram(component, tscs42xx->coeff_ram, 0x00,
 			COEFF_RAM_COEFF_COUNT);
 		if (ret < 0)
-			goto exit;
+			return ret;
 		tscs42xx->coeff_ram_synced = true;
 	}
 
-	ret = 0;
-exit:
-	mutex_unlock(&tscs42xx->coeff_ram_lock);
-
-	return ret;
+	return 0;
 }
 
 static const struct snd_soc_dapm_widget tscs42xx_dapm_widgets[] = {
@@ -926,12 +907,10 @@ static int setup_sample_rate(struct snd_soc_component *component,
 		return ret;
 	}
 
-	mutex_lock(&tscs42xx->audio_params_lock);
+	guard(mutex)(&tscs42xx->audio_params_lock);
 
 	tscs42xx->samplerate = rate;
 
-	mutex_unlock(&tscs42xx->audio_params_lock);
-
 	return 0;
 }
 
@@ -1253,12 +1232,10 @@ static int tscs42xx_set_dai_bclk_ratio(struct snd_soc_dai *codec_dai,
 		return ret;
 	}
 
-	mutex_lock(&tscs42xx->audio_params_lock);
+	guard(mutex)(&tscs42xx->audio_params_lock);
 
 	tscs42xx->bclk_ratio = ratio;
 
-	mutex_unlock(&tscs42xx->audio_params_lock);
-
 	return 0;
 }
 
-- 
2.43.0

