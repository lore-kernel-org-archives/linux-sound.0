Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8B848125C
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 10:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629655; cv=none; b=V5JTFuyPJCGRoxfa8AzEsHMtlG35aFZ9AnZUBogLvy95cYC808HfWdcdaSaxNKTCUmDPtp3Wzml9h0hFTlI9uY2nTaJbxSTKHXWxvih5sxPEWdZbcV1+AECMKsS4/Kd9OXa4bbdr9yB4KuCqLx5VOzQ/unmc4QChBWGfVEW3hOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629655; c=relaxed/simple;
	bh=jMQz84Fwcrm8C1aXqMkUxF4g3vcEnzFavgi0MTk887k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LiGPeg/Qj9z41JGP5NUjHH7BxG6DkAfG+E5EElv0F2/gXKwJEUXJmrm3N1XL5Cihlpoi/bkI293nuPGmHGk+7hk7Q/yENDDrVGPLFcIxVwUe6aTGTT7aRPUQKnWhU4IY7S4NOSZpi1qRVeyr4r2S+qIz5QMEEfZavk061t22CW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EXoYgCuC; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EXoYgCuC"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cad8076b01so133731085ad.2
        for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 03:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629652; x=1785234452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=73JLQAmWuZSnNO0q42K5V2Btd42o1yjgi7/OGpCGXNY=;
        b=EXoYgCuCE4pAGpUCLuKEtxx9QuflEIKeYNeM8MXJPCKKReqCiz6LUXAlFCuQFvdm+2
         oWEsJn5V3k1GhU0IHb34HotZ+HydmNTuasfn1XNy/jrgw4i1Tf9C2kjvFoWip9Gz9zML
         utdmQJEdLgTwsSxVhPXDEtmUnteUKE5c1HQ9a+E8E9XbVNhCR5F+jVZlR6J92JiZ0qyU
         fjvkkj+ptyfub+Lcgd9RRFMHVIgK3qGCYRNyVHI3wHcyWYoFYYgCOiUYso55gcK42wJq
         SUExDMFjKd8RukG4GuIT6pcZPBs7Qbc7kxu8GIoX114B/JUPfEvkna1d9QO86d+CDN2m
         sAwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629652; x=1785234452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=73JLQAmWuZSnNO0q42K5V2Btd42o1yjgi7/OGpCGXNY=;
        b=MSA+ti0Dg6i+iG4UF6XujU6m7ls4jJlB9zF1mM4sYAZCfiKR5hbHndfw/LMUfCGOST
         t5Djb5L8+sNeeSNyXYnVtPsImiS2stpaDMI9NjmJoQc5Ft7/NaEqOZ3BoKT/baCk6pB9
         MYHDrmYq+asJ3Aa/J2CIK71gDBXsRDYV5WmGiF/821SSCNLx27R6UY/2ubBoDjtke8Q7
         RsbwVGK+9mpvuAkr73Kp7map8LARorbupVmusEY+G3XcaI0VSzHH/fekvxRZmU5VIPw6
         kZDOVKo//pA+cdb6RwIAjay61jvOJPfU/8REb1qbHi58h2FovpsxYcDGkmobNgNVphUm
         q+jQ==
X-Forwarded-Encrypted: i=1; AHgh+RqO4HS7lMJJYpc0LOeN8CWzKPjjsm1WSzhMZLPSaAs1d9mTH/q9s0aSmOgeJzPELxmPEcCMu3K7E+m9lw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGJEF3/GYU4z0Uscnn5IaLRNYr5Brt+VEElhgOV6U6byD3IMRd
	AvZePx9Rhuk7ghKrf7pzvGSpc4V6eVMr2WmBJZyXWgq2YjUkOQgxI1mm
X-Gm-Gg: AR+sD13/upE5FxulYfqitA6FnxRKlv2nHeBXL1ZAkCsDSg7DkBEeOgsJa28IMCu9svz
	P99cbpncuXNY8OfLX5ycd649I9EbBDRJlDHRDjdq/1FMx52wr7BKXQuP5VjYdNCyYzcgGUrtipf
	wECAEuCelmOAusbnyysJG4gwzIgyKlVGzfCydLJ40Ian1KuBb7qKmcWIO5iB1TZ/FPFZyeGwwqx
	+PRYzeXDMLXZdhxDH8J9MhXEscvNVDXEXPC0Xsp4zKoNGBiVAcQVc74iNODy7jffO5UJyT2HBMR
	6KWtzgquqzKdE/VduID6zWaDncuVDYEAodKOaMkBQaQGkoTkwmOp4ZuIOrKUKWXyOE0KJqKqqaV
	FlIeLTyDXmQp2pL7SEfuMykK13Q9FVk9ZRXUboVa6lUDfT9mZF4NuVk79MwGTXSMqVGnz94wJZX
	pMSYjHjtS4Xa/qKpW030WhdNlQxbQH8fPBEAiU
X-Received: by 2002:a17:903:2ec5:b0:2ca:7131:cace with SMTP id d9443c01a7336-2cf3496094emr219480565ad.31.1784629652158;
        Tue, 21 Jul 2026 03:27:32 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:27:31 -0700 (PDT)
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
Subject: [PATCH v4 09/29] ASoC: codecs: idt821034: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:40 +0700
Message-ID: <20260721102600.523199-10-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721102600.523199-1-phucduc.bui@gmail.com>
References: <20260721102600.523199-1-phucduc.bui@gmail.com>
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

Changes in v2: 
 - Remove temporary variables and return directly 
   from the functions.

 sound/soc/codecs/idt821034.c | 144 ++++++++++++++---------------------
 1 file changed, 57 insertions(+), 87 deletions(-)

diff --git a/sound/soc/codecs/idt821034.c b/sound/soc/codecs/idt821034.c
index 084090ccef77..387f17b5f7b3 100644
--- a/sound/soc/codecs/idt821034.c
+++ b/sound/soc/codecs/idt821034.c
@@ -7,6 +7,7 @@
 // Author: Herve Codina <herve.codina@bootlin.com>
 
 #include <linux/bitrev.h>
+#include <linux/cleanup.h>
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/slab.h>
@@ -413,12 +414,12 @@ static int idt821034_kctrl_gain_get(struct snd_kcontrol *kcontrol,
 
 	ch = IDT821034_ID_GET_CHAN(mc->reg);
 
-	mutex_lock(&idt821034->mutex);
-	if (IDT821034_ID_IS_OUT(mc->reg))
-		val = idt821034->amps.ch[ch].amp_out.gain;
-	else
-		val = idt821034->amps.ch[ch].amp_in.gain;
-	mutex_unlock(&idt821034->mutex);
+	scoped_guard(mutex, &idt821034->mutex) {
+		if (IDT821034_ID_IS_OUT(mc->reg))
+			val = idt821034->amps.ch[ch].amp_out.gain;
+		else
+			val = idt821034->amps.ch[ch].amp_in.gain;
+	}
 
 	ucontrol->value.integer.value[0] = val & mask;
 	if (invert)
@@ -456,7 +457,7 @@ static int idt821034_kctrl_gain_put(struct snd_kcontrol *kcontrol,
 
 	ch = IDT821034_ID_GET_CHAN(mc->reg);
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 
 	if (IDT821034_ID_IS_OUT(mc->reg)) {
 		amp = &idt821034->amps.ch[ch].amp_out;
@@ -466,22 +467,18 @@ static int idt821034_kctrl_gain_put(struct snd_kcontrol *kcontrol,
 		gain_type = IDT821034_GAIN_TX;
 	}
 
-	if (amp->gain == val) {
-		ret = 0;
-		goto end;
-	}
+	if (amp->gain == val)
+		return 0;
 
 	if (!amp->is_muted) {
 		ret = idt821034_set_gain_channel(idt821034, ch, gain_type, val);
 		if (ret)
-			goto end;
+			return ret;
 	}
 
 	amp->gain = val;
-	ret = 1; /* The value changed */
-end:
-	mutex_unlock(&idt821034->mutex);
-	return ret;
+
+	return 1;
 }
 
 static int idt821034_kctrl_mute_get(struct snd_kcontrol *kcontrol,
@@ -495,11 +492,11 @@ static int idt821034_kctrl_mute_get(struct snd_kcontrol *kcontrol,
 
 	ch = IDT821034_ID_GET_CHAN(id);
 
-	mutex_lock(&idt821034->mutex);
-	is_muted = IDT821034_ID_IS_OUT(id) ?
-			idt821034->amps.ch[ch].amp_out.is_muted :
-			idt821034->amps.ch[ch].amp_in.is_muted;
-	mutex_unlock(&idt821034->mutex);
+	scoped_guard(mutex, &idt821034->mutex) {
+		is_muted = IDT821034_ID_IS_OUT(id) ?
+				idt821034->amps.ch[ch].amp_out.is_muted :
+				idt821034->amps.ch[ch].amp_in.is_muted;
+	}
 
 	ucontrol->value.integer.value[0] = !is_muted;
 
@@ -521,7 +518,7 @@ static int idt821034_kctrl_mute_put(struct snd_kcontrol *kcontrol,
 	ch = IDT821034_ID_GET_CHAN(id);
 	is_mute = !ucontrol->value.integer.value[0];
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 
 	if (IDT821034_ID_IS_OUT(id)) {
 		amp = &idt821034->amps.ch[ch].amp_out;
@@ -531,21 +528,17 @@ static int idt821034_kctrl_mute_put(struct snd_kcontrol *kcontrol,
 		gain_type = IDT821034_GAIN_TX;
 	}
 
-	if (amp->is_muted == is_mute) {
-		ret = 0;
-		goto end;
-	}
+	if (amp->is_muted == is_mute)
+		return 0;
 
 	ret = idt821034_set_gain_channel(idt821034, ch, gain_type,
 					 is_mute ? 0 : amp->gain);
 	if (ret)
-		goto end;
+		return ret;
 
 	amp->is_muted = is_mute;
-	ret = 1; /* The value changed */
-end:
-	mutex_unlock(&idt821034->mutex);
-	return ret;
+
+	return 1;
 }
 
 static const DECLARE_TLV_DB_LINEAR(idt821034_gain_in, -300, 1300);
@@ -623,24 +616,20 @@ static int idt821034_power_event(struct snd_soc_dapm_widget *w,
 	struct idt821034 *idt821034 = snd_soc_component_get_drvdata(component);
 	unsigned int id = w->shift;
 	u8 power, mask;
-	int ret;
 	u8 ch;
 
 	ch = IDT821034_ID_GET_CHAN(id);
 	mask = IDT821034_ID_IS_OUT(id) ? IDT821034_CONF_PWRUP_RX : IDT821034_CONF_PWRUP_TX;
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 
 	power = idt821034_get_channel_power(idt821034, ch);
 	if (SND_SOC_DAPM_EVENT_ON(event))
 		power |= mask;
 	else
 		power &= ~mask;
-	ret = idt821034_set_channel_power(idt821034, ch, power);
-
-	mutex_unlock(&idt821034->mutex);
 
-	return ret;
+	return idt821034_set_channel_power(idt821034, ch, power);
 }
 
 static const struct snd_soc_dapm_widget idt821034_dapm_widgets[] = {
@@ -717,9 +706,9 @@ static int idt821034_dai_set_tdm_slot(struct snd_soc_dai *dai,
 	ch = 0;
 	while (mask && ch < IDT821034_NB_CHANNEL) {
 		if (mask & 0x1) {
-			mutex_lock(&idt821034->mutex);
-			ret = idt821034_set_channel_ts(idt821034, ch, IDT821034_CH_RX, slot);
-			mutex_unlock(&idt821034->mutex);
+			scoped_guard(mutex, &idt821034->mutex)
+				ret = idt821034_set_channel_ts(idt821034, ch,
+							       IDT821034_CH_RX, slot);
 			if (ret) {
 				dev_err(dai->dev, "ch%u set tx tdm slot failed (%d)\n",
 					ch, ret);
@@ -742,9 +731,9 @@ static int idt821034_dai_set_tdm_slot(struct snd_soc_dai *dai,
 	ch = 0;
 	while (mask && ch < IDT821034_NB_CHANNEL) {
 		if (mask & 0x1) {
-			mutex_lock(&idt821034->mutex);
-			ret = idt821034_set_channel_ts(idt821034, ch, IDT821034_CH_TX, slot);
-			mutex_unlock(&idt821034->mutex);
+			scoped_guard(mutex, &idt821034->mutex)
+				ret = idt821034_set_channel_ts(idt821034, ch,
+							       IDT821034_CH_TX, slot);
 			if (ret) {
 				dev_err(dai->dev, "ch%u set rx tdm slot failed (%d)\n",
 					ch, ret);
@@ -769,9 +758,8 @@ static int idt821034_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
 	struct idt821034 *idt821034 = snd_soc_component_get_drvdata(dai->component);
 	u8 conf;
-	int ret;
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 
 	conf = idt821034_get_codec_conf(idt821034);
 
@@ -785,13 +773,10 @@ static int idt821034_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	default:
 		dev_err(dai->dev, "Unsupported DAI format 0x%x\n",
 			fmt & SND_SOC_DAIFMT_FORMAT_MASK);
-		ret = -EINVAL;
-		goto end;
+		return -EINVAL;
 	}
-	ret = idt821034_set_codec_conf(idt821034, conf);
-end:
-	mutex_unlock(&idt821034->mutex);
-	return ret;
+
+	return idt821034_set_codec_conf(idt821034, conf);
 }
 
 static int idt821034_dai_hw_params(struct snd_pcm_substream *substream,
@@ -800,9 +785,8 @@ static int idt821034_dai_hw_params(struct snd_pcm_substream *substream,
 {
 	struct idt821034 *idt821034 = snd_soc_component_get_drvdata(dai->component);
 	u8 conf;
-	int ret;
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 
 	conf = idt821034_get_codec_conf(idt821034);
 
@@ -816,13 +800,10 @@ static int idt821034_dai_hw_params(struct snd_pcm_substream *substream,
 	default:
 		dev_err(dai->dev, "Unsupported PCM format 0x%x\n",
 			params_format(params));
-		ret = -EINVAL;
-		goto end;
+		return -EINVAL;
 	}
-	ret = idt821034_set_codec_conf(idt821034, conf);
-end:
-	mutex_unlock(&idt821034->mutex);
-	return ret;
+
+	return idt821034_set_codec_conf(idt821034, conf);
 }
 
 static const unsigned int idt821034_sample_bits[] = {8};
@@ -897,11 +878,11 @@ static int idt821034_reset_audio(struct idt821034 *idt821034)
 	int ret;
 	u8 i;
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 
 	ret = idt821034_set_codec_conf(idt821034, 0);
 	if (ret)
-		goto end;
+		return ret;
 
 	for (i = 0; i < IDT821034_NB_CHANNEL; i++) {
 		idt821034->amps.ch[i].amp_out.gain = IDT821034_GAIN_OUT_INIT_RAW;
@@ -909,24 +890,21 @@ static int idt821034_reset_audio(struct idt821034 *idt821034)
 		ret = idt821034_set_gain_channel(idt821034, i, IDT821034_GAIN_RX,
 						 idt821034->amps.ch[i].amp_out.gain);
 		if (ret)
-			goto end;
+			return ret;
 
 		idt821034->amps.ch[i].amp_in.gain = IDT821034_GAIN_IN_INIT_RAW;
 		idt821034->amps.ch[i].amp_in.is_muted = false;
 		ret = idt821034_set_gain_channel(idt821034, i, IDT821034_GAIN_TX,
 						 idt821034->amps.ch[i].amp_in.gain);
 		if (ret)
-			goto end;
+			return ret;
 
 		ret = idt821034_set_channel_power(idt821034, i, 0);
 		if (ret)
-			goto end;
+			return ret;
 	}
 
-	ret = 0;
-end:
-	mutex_unlock(&idt821034->mutex);
-	return ret;
+	return 0;
 }
 
 static int idt821034_component_probe(struct snd_soc_component *component)
@@ -965,7 +943,7 @@ static int idt821034_chip_gpio_set(struct gpio_chip *c, unsigned int offset,
 	u8 slic_raw;
 	int ret;
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 
 	slic_raw = idt821034_get_written_slic_raw(idt821034, ch);
 	if (val)
@@ -974,8 +952,6 @@ static int idt821034_chip_gpio_set(struct gpio_chip *c, unsigned int offset,
 		slic_raw &= ~mask;
 	ret = idt821034_write_slic_raw(idt821034, ch, slic_raw);
 
-	mutex_unlock(&idt821034->mutex);
-
 	if (ret)
 		dev_err(&idt821034->spi->dev, "set gpio %d (%u, 0x%x) failed (%d)\n",
 			offset, ch, mask, ret);
@@ -991,9 +967,8 @@ static int idt821034_chip_gpio_get(struct gpio_chip *c, unsigned int offset)
 	u8 slic_raw;
 	int ret;
 
-	mutex_lock(&idt821034->mutex);
-	ret = idt821034_read_slic_raw(idt821034, ch, &slic_raw);
-	mutex_unlock(&idt821034->mutex);
+	scoped_guard(mutex, &idt821034->mutex)
+		ret = idt821034_read_slic_raw(idt821034, ch, &slic_raw);
 	if (ret) {
 		dev_err(&idt821034->spi->dev, "get gpio %d (%u, 0x%x) failed (%d)\n",
 			offset, ch, mask, ret);
@@ -1015,9 +990,8 @@ static int idt821034_chip_get_direction(struct gpio_chip *c, unsigned int offset
 	struct idt821034 *idt821034 = gpiochip_get_data(c);
 	u8 slic_dir;
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 	slic_dir = idt821034_get_slic_conf(idt821034, ch);
-	mutex_unlock(&idt821034->mutex);
 
 	return slic_dir & mask ? GPIO_LINE_DIRECTION_IN : GPIO_LINE_DIRECTION_OUT;
 }
@@ -1034,7 +1008,7 @@ static int idt821034_chip_direction_input(struct gpio_chip *c, unsigned int offs
 	if (mask & ~(IDT821034_SLIC_IO1_IN | IDT821034_SLIC_IO0_IN))
 		return -EPERM;
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 
 	slic_conf = idt821034_get_slic_conf(idt821034, ch) | mask;
 
@@ -1044,7 +1018,6 @@ static int idt821034_chip_direction_input(struct gpio_chip *c, unsigned int offs
 			offset, ch, mask, ret);
 	}
 
-	mutex_unlock(&idt821034->mutex);
 	return ret;
 }
 
@@ -1060,7 +1033,7 @@ static int idt821034_chip_direction_output(struct gpio_chip *c, unsigned int off
 	if (ret)
 		return ret;
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 
 	slic_conf = idt821034_get_slic_conf(idt821034, ch) & ~mask;
 
@@ -1070,7 +1043,6 @@ static int idt821034_chip_direction_output(struct gpio_chip *c, unsigned int off
 			offset, ch, mask, ret);
 	}
 
-	mutex_unlock(&idt821034->mutex);
 	return ret;
 }
 
@@ -1079,24 +1051,22 @@ static int idt821034_reset_gpio(struct idt821034 *idt821034)
 	int ret;
 	u8 i;
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 
 	/* IO0 and IO1 as input for all channels and output IO set to 0 */
 	for (i = 0; i < IDT821034_NB_CHANNEL; i++) {
 		ret = idt821034_set_slic_conf(idt821034, i,
 					      IDT821034_SLIC_IO1_IN | IDT821034_SLIC_IO0_IN);
 		if (ret)
-			goto end;
+			return ret;
 
 		ret = idt821034_write_slic_raw(idt821034, i, 0);
 		if (ret)
-			goto end;
+			return ret;
 
 	}
-	ret = 0;
-end:
-	mutex_unlock(&idt821034->mutex);
-	return ret;
+
+	return 0;
 }
 
 static int idt821034_gpio_init(struct idt821034 *idt821034)
-- 
2.43.0

