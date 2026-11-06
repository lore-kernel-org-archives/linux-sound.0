Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793943582;
	b=mTlTXHMOea3lr1e2RVLpwIUAmBh1b1MrFwR2/oPZoVQG3W14vsD7k6aVPmDz8uvZ1zmL
	 tQ1rCVg7zh5K9wMbUKlmcI0F+W7DqmmTKAcS0VUNI4IyOubmxS0WGklPAcme02XLlPar/
	 8DzI7r7p1CZlSmbLrMWRwfHgvrq3jm+UpzLyK3WQDBMUWOKv/TGan2RNPL3DM4EnZJDRA
	 wo9GM62daHz5j7UCFucULoezQtQAOri680aOCk9+FelIPcJn4fX2jvKQ9xuE0B9yxpDUO
	 PDrEiCsBkQ+5DoSuC4F4qSOsYIqKa6ffnr8Edic2NL+9zjGmqu4NvN6B8ksbmDginVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793943582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=+s+5mPEOJCGnK8cUsnfJmb4cg3e/zkf6cpoS1oVkWQQ=;
	b=rSVmK/DxsK4G8eKyEx3P/nBg+h0lYUaBS/NcHkDCeeesR5YLm1DuC5kUgGGUARrxSjvM
	 3txD75jtyIJbHvgZNFIjlWPrM0/YooGRVz69+Zr6yCbIL3D6uk3lMqJyCtWFilygLfxVA
	 zBQvgJmDUx/op+IC7DBqgjEITj6NOMlIZH/vBQIzjXyzF8d6Skd95R3OyxQmiVmtGZppK
	 HL9owmp5351D2nz3xsJP0B61KUMharDXits0Q+j0UebkHGOcsDRhO5ZbBosZ7DwW5MVYI
	 aNQJIZTRDs0D53m8GFouUMjsNwmlhVPKr2Z46WvIEm6asvpmvHUergyOOwRJOhiOjrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CCz678wE;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD0C606A335
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 05:39:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AD0C606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CCz678wE
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36ff9c9da34so119670eec.1
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 21:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793943580; x=1794548380; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+s+5mPEOJCGnK8cUsnfJmb4cg3e/zkf6cpoS1oVkWQQ=;
        b=CCz678wEjJYAKpo+x6hed2MlDVeLgiwOO2QDQtF7/4ZlAawARMD/BK0Q0qx5/TyQLT
         +QmQshi7DeVw2eId+518sL0ESpIvZrxG9tBKD7owjHV/6YXt6KWcrEQb210uC+nZK4IP
         WULWPjSg0UOnxmFSdDjQ32iAReiNDRbcjGwthkOmnroQ5OtH3vkfHcq6/ubW2azUwSug
         5pfkzj7gaLQCvuSnt0/Ne4DtGPpk4Uf0Jty2jT2xDaIGwLXODHluHpclnDCuLLtbVtQy
         bREA0J+3B9XXm80YnJhWR0oQwFxQjhXguytKVNEyEw4i5TKeXaKO4XfC92joN2NvZnt5
         wkJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793943580; x=1794548380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+s+5mPEOJCGnK8cUsnfJmb4cg3e/zkf6cpoS1oVkWQQ=;
        b=ZP/L5atLVg2FBc814DIqmTeMpl4Crc+iK8n4nH4juDoHYCD+EbOLui8Vb8cHgkmlxC
         IKdw9xRWJx1lXB4u7uvUz/F6L6LC1PbbegZKFREH0tGEIInAX6iDoN54Ug1MkArmBSqE
         MXxfJfwF3sHQnyQfmvQt6cPi59FHAQTKcBp7TkaZqwQgBEqSTrguY56oe3Zh2IlT9LFP
         V0DbIA4cWR0F+CBezOEgjqvR+Cm2fW++OxEhIfxFbiLmSbgXBhfLt2N8+yPxhu5WyBGS
         oK5gGmVoC+xurGcqnQOepdcxt9tpLhGvEoCc4V49Bs+Dz9xFPer95k5u0GE1UEDEY50w
         mtKQ==
X-Forwarded-Encrypted: i=1; AL+hErFRfTOGpBFkcHq44+9Zr0xSGt4ilj238GqOJBr6b/ChBgN4DAUuwj440kd9vOuHczakoIydI84L76qBeA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+MA2fH66/2FE+p6+T63f+hI40D8ANAvZ4F+/4q2c2cXz17fNKQ
	vabs2j2IWXEPjnT6VNmMEITsOWtdqsFnLjR3l1qXtJxY/EjW3SY7Ey45
X-Gm-Gg: AYBFou0yBRiVqxL+mIzWX1uq6vg6kpizWqqAZxbCcUVU0PKtl+bQg3jlTU4TX+c1bjG
	+Jz31Y8pSs6+zxvahuq5t4ILsOA2i2e3fT7lRUNt7FM6hRu3osCM4gLsQMN6fU0a+KaO5DSYBpQ
	hR6EsMGE6XLm8l1b+oiYtr82l3I+JZQQfHL1Pwp2EIIBxILZHCo2mF7o7KL5BoE+6V38H7tQ0Zt
	aKnqOqbnPY6SczBi5HiidYmqeWoJ0xJTsoCVYLq031jyfks73p05KQtxLHt0KiwcR/VQNMLkwWo
	KlH4H4z66jHizG0rpHozGgNciwhoFjkE93sTAJ4v+R7VLUWqVgGu3Su/rUSxZJPqJJxggpnvGdv
	wbPEKVV9nuQxjHYkXLCDIPfSbgClUwY9rqbLMvGHw0RPTx0jUySX6yAWDdLIjF89O9L/Kgbe+Ee
	UEl7JY3mE5UxlVURQSSEzzr3aJCK9spo8/NSnj5IEtO/uJYy2v2v5Dsw28M29hq6Y/3BAzou7DR
	uvOHaCbgKLEPRnXPRqDotQgmmjHcdynEhDXm1gZa/lcwHUydkHvSBxMSPj1v2MEwRmRvF22RxdB
	G/7EBiQy+Kpo/EjWS9kN7smzFNmBjFBvESajHB0vIsl+M9P1Yoov/3qu6FaVgzchnNSm9lHXrfM
	wYMu31hmkIXFAMqxFvKkdU65yAbkTmw2hA6tEZw==
X-Received: by 2002:a05:7300:da11:b0:360:b8b4:840a with SMTP id 5a478bee46e88-36f76f0f1b3mr2039233eec.39.1793943580296;
        Thu, 05 Nov 2026 21:39:40 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:64e:8358:c9cb:c17b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa651e6b1sm6126445eec.3.2026.11.05.21.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 21:39:39 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 05 Nov 2026 21:39:32 -0800
Subject: [PATCH 1/4] ASoC: arizona: convert audio pdata parsing to generic
 device properties
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-arizona-asoc-v1-1-25ec7338446e@gmail.com>
References: <20261105-arizona-asoc-v1-0-25ec7338446e@gmail.com>
In-Reply-To: <20261105-arizona-asoc-v1-0-25ec7338446e@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 David Rhodes <david.rhodes@cirrus.com>, Lee Jones <lee@kernel.org>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev
X-Mailer: b4 0.17-dev-e56a4

Switch audio platform data parsing in the shared Arizona ASoC helper
from OF-only property APIs to generic device property APIs so audio
parameters can be provided via software nodes or ACPI in addition to
Device Tree.

Align the audio configuration array types in struct arizona_pdata with
generic property types so properties can be read directly into platform
data, using boolean storage for out-mono flags and bounded array reads
that preserve unspecified trailing elements. Drop the CONFIG_OF guards
and obsolete error checks around the audio property parsing calls in all
Arizona codec drivers.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 include/linux/mfd/arizona/pdata.h |  15 ++---
 sound/soc/codecs/arizona.c        | 121 +++++++++++++++++++-------------------
 sound/soc/codecs/arizona.h        |   2 +-
 sound/soc/codecs/cs47l24.c        |   9 +--
 sound/soc/codecs/wm5102.c         |   9 +--
 sound/soc/codecs/wm5110.c         |   9 +--
 sound/soc/codecs/wm8997.c         |   9 +--
 sound/soc/codecs/wm8998.c         |   9 +--
 8 files changed, 79 insertions(+), 104 deletions(-)

diff --git a/include/linux/mfd/arizona/pdata.h b/include/linux/mfd/arizona/pdata.h
index d465dcd8c90a..984b2edfec07 100644
--- a/include/linux/mfd/arizona/pdata.h
+++ b/include/linux/mfd/arizona/pdata.h
@@ -11,6 +11,7 @@
 #include <dt-bindings/mfd/arizona.h>
 #include <linux/regulator/arizona-ldo1.h>
 #include <linux/regulator/arizona-micsupp.h>
+#include <linux/types.h>
 
 #define ARIZONA_GPN_DIR_MASK                     0x8000  /* GPN_DIR */
 #define ARIZONA_GPN_DIR_SHIFT                        15  /* GPN_DIR */
@@ -100,7 +101,7 @@ struct arizona_pdata {
 	 * useful for systems where and I2S bus with multiple data
 	 * lines is mastered.
 	 */
-	unsigned int max_channels_clocked[ARIZONA_MAX_AIF];
+	u32 max_channels_clocked[ARIZONA_MAX_AIF];
 
 	/** GPIO5 is used for jack detection */
 	bool jd_gpio5;
@@ -150,7 +151,7 @@ struct arizona_pdata {
 	int num_micd_configs;
 
 	/** Reference voltage for DMIC inputs */
-	int dmic_ref[ARIZONA_MAX_INPUT];
+	u32 dmic_ref[ARIZONA_MAX_INPUT];
 
 	/** MICBIAS configurations */
 	struct arizona_micbias micbias[ARIZONA_MAX_MICBIAS];
@@ -161,19 +162,19 @@ struct arizona_pdata {
 	 * wm5102/wm5110/wm8280/wm8997: [0]=IN1 [1]=IN2 [2]=IN3 [3]=IN4
 	 * wm8998: [0]=IN1A [1]=IN2A [2]=IN1B [3]=IN2B
 	 */
-	int inmode[ARIZONA_MAX_INPUT];
+	u32 inmode[ARIZONA_MAX_INPUT];
 
 	/** Mode for outputs */
-	int out_mono[ARIZONA_MAX_OUTPUT];
+	bool out_mono[ARIZONA_MAX_OUTPUT];
 
 	/** Limit output volumes */
-	unsigned int out_vol_limit[2 * ARIZONA_MAX_OUTPUT];
+	u32 out_vol_limit[2 * ARIZONA_MAX_OUTPUT];
 
 	/** PDM speaker mute setting */
-	unsigned int spk_mute[ARIZONA_MAX_PDM_SPK];
+	u32 spk_mute[ARIZONA_MAX_PDM_SPK];
 
 	/** PDM speaker format */
-	unsigned int spk_fmt[ARIZONA_MAX_PDM_SPK];
+	u32 spk_fmt[ARIZONA_MAX_PDM_SPK];
 
 	/** Haptic actuator type */
 	unsigned int hap_act;
diff --git a/sound/soc/codecs/arizona.c b/sound/soc/codecs/arizona.c
index 7c296c5b24f7..46e2ca48e70f 100644
--- a/sound/soc/codecs/arizona.c
+++ b/sound/soc/codecs/arizona.c
@@ -11,8 +11,8 @@
 #include <linux/delay.h>
 #include <linux/gcd.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/pm_runtime.h>
+#include <linux/property.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/tlv.h>
@@ -2799,77 +2799,76 @@ int arizona_lhpf_coeff_put(struct snd_kcontrol *kcontrol,
 }
 EXPORT_SYMBOL_GPL(arizona_lhpf_coeff_put);
 
-int arizona_of_get_audio_pdata(struct arizona *arizona)
+static int arizona_get_variable_u32_array(struct device *dev,
+					  const char *propname,
+					  u32 *dest, size_t n_max)
 {
-	struct arizona_pdata *pdata = &arizona->pdata;
-	struct device_node *np = arizona->dev->of_node;
-	u32 val;
-	u32 pdm_val[ARIZONA_MAX_PDM_SPK];
-	int ret;
-	int count = 0;
-
-	count = 0;
-	of_property_for_each_u32(np, "wlf,inmode", val) {
-		if (count == ARRAY_SIZE(pdata->inmode))
-			break;
-
-		pdata->inmode[count] = val;
-		count++;
-	}
+	int n, ret;
 
-	count = 0;
-	of_property_for_each_u32(np, "wlf,dmic-ref", val) {
-		if (count == ARRAY_SIZE(pdata->dmic_ref))
-			break;
-
-		pdata->dmic_ref[count] = val;
-		count++;
-	}
+	n = device_property_count_u32(dev, propname);
+	if (n < 0) {
+		if (n == -EINVAL)
+			return 0;	/* missing, ignore */
 
-	count = 0;
-	of_property_for_each_u32(np, "wlf,out-mono", val) {
-		if (count == ARRAY_SIZE(pdata->out_mono))
-			break;
-
-		pdata->out_mono[count] = !!val;
-		count++;
+		dev_warn(dev, "%s malformed (%d)\n", propname, n);
+		return n;
 	}
 
-	count = 0;
-	of_property_for_each_u32(np, "wlf,max-channels-clocked", val) {
-		if (count == ARRAY_SIZE(pdata->max_channels_clocked))
-			break;
-
-		pdata->max_channels_clocked[count] = val;
-		count++;
-	}
+	if (!n)
+		return 0;
 
-	count = 0;
-	of_property_for_each_u32(np, "wlf,out-volume-limit", val) {
-		if (count == ARRAY_SIZE(pdata->out_vol_limit))
-			break;
+	if (n > n_max)
+		n = n_max;
 
-		pdata->out_vol_limit[count] = val;
-		count++;
+	ret = device_property_read_u32_array(dev, propname, dest, n);
+	if (ret < 0) {
+		dev_warn(dev, "Failed to read %s (%d)\n", propname, ret);
+		return ret;
 	}
 
-	ret = of_property_read_u32_array(np, "wlf,spk-fmt",
-					 pdm_val, ARRAY_SIZE(pdm_val));
-
-	if (ret >= 0)
-		for (count = 0; count < ARRAY_SIZE(pdata->spk_fmt); ++count)
-			pdata->spk_fmt[count] = pdm_val[count];
-
-	ret = of_property_read_u32_array(np, "wlf,spk-mute",
-					 pdm_val, ARRAY_SIZE(pdm_val));
-
-	if (ret >= 0)
-		for (count = 0; count < ARRAY_SIZE(pdata->spk_mute); ++count)
-			pdata->spk_mute[count] = pdm_val[count];
+	return n;
+}
 
-	return 0;
+void arizona_get_audio_pdata(struct arizona *arizona)
+{
+	struct arizona_pdata *pdata = &arizona->pdata;
+	u32 out_mono[ARRAY_SIZE(pdata->out_mono)];
+	int i, n, ret;
+
+	arizona_get_variable_u32_array(arizona->dev, "wlf,inmode",
+				       pdata->inmode,
+				       ARRAY_SIZE(pdata->inmode));
+
+	arizona_get_variable_u32_array(arizona->dev, "wlf,dmic-ref",
+				       pdata->dmic_ref,
+				       ARRAY_SIZE(pdata->dmic_ref));
+
+	n = arizona_get_variable_u32_array(arizona->dev, "wlf,out-mono",
+					   out_mono, ARRAY_SIZE(out_mono));
+	for (i = 0; i < n; i++)
+		pdata->out_mono[i] = !!out_mono[i];
+
+	arizona_get_variable_u32_array(arizona->dev, "wlf,max-channels-clocked",
+				       pdata->max_channels_clocked,
+				       ARRAY_SIZE(pdata->max_channels_clocked));
+
+	arizona_get_variable_u32_array(arizona->dev, "wlf,out-volume-limit",
+				       pdata->out_vol_limit,
+				       ARRAY_SIZE(pdata->out_vol_limit));
+
+	ret = device_property_read_u32_array(arizona->dev, "wlf,spk-fmt",
+					     pdata->spk_fmt,
+					     ARRAY_SIZE(pdata->spk_fmt));
+	if (ret && ret != -EINVAL)
+		dev_warn(arizona->dev, "Failed to read wlf,spk-fmt (%d)\n", ret);
+
+	ret = device_property_read_u32_array(arizona->dev, "wlf,spk-mute",
+					     pdata->spk_mute,
+					     ARRAY_SIZE(pdata->spk_mute));
+	if (ret && ret != -EINVAL)
+		dev_warn(arizona->dev, "Failed to read wlf,spk-mute (%d)\n", ret);
 }
-EXPORT_SYMBOL_GPL(arizona_of_get_audio_pdata);
+EXPORT_SYMBOL_GPL(arizona_get_audio_pdata);
 
 MODULE_DESCRIPTION("ASoC Wolfson Arizona class device support");
 MODULE_AUTHOR("Mark Brown <broonie@opensource.wolfsonmicro.com>");
diff --git a/sound/soc/codecs/arizona.h b/sound/soc/codecs/arizona.h
index 0703182d87b3..499891e62183 100644
--- a/sound/soc/codecs/arizona.h
+++ b/sound/soc/codecs/arizona.h
@@ -388,7 +388,7 @@ static inline int arizona_unregister_notifier(struct snd_soc_component *componen
 	return blocking_notifier_chain_unregister(&arizona->notifier, nb);
 }
 
-int arizona_of_get_audio_pdata(struct arizona *arizona);
+void arizona_get_audio_pdata(struct arizona *arizona);
 
 int arizona_jack_codec_dev_probe(struct arizona_priv *info, struct device *dev);
 int arizona_jack_codec_dev_remove(struct arizona_priv *info);
diff --git a/sound/soc/codecs/cs47l24.c b/sound/soc/codecs/cs47l24.c
index 5100b1aac902..09cef46f09fc 100644
--- a/sound/soc/codecs/cs47l24.c
+++ b/sound/soc/codecs/cs47l24.c
@@ -1222,13 +1222,8 @@ static int cs47l24_probe(struct platform_device *pdev)
 	if (!cs47l24)
 		return -ENOMEM;
 
-	if (IS_ENABLED(CONFIG_OF)) {
-		if (!dev_get_platdata(arizona->dev)) {
-			ret = arizona_of_get_audio_pdata(arizona);
-			if (ret < 0)
-				return ret;
-		}
-	}
+	if (!dev_get_platdata(arizona->dev))
+		arizona_get_audio_pdata(arizona);
 
 	platform_set_drvdata(pdev, cs47l24);
 
diff --git a/sound/soc/codecs/wm5102.c b/sound/soc/codecs/wm5102.c
index 74b775b95bfd..bd747171212e 100644
--- a/sound/soc/codecs/wm5102.c
+++ b/sound/soc/codecs/wm5102.c
@@ -2041,13 +2041,8 @@ static int wm5102_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, wm5102);
 
-	if (IS_ENABLED(CONFIG_OF)) {
-		if (!dev_get_platdata(arizona->dev)) {
-			ret = arizona_of_get_audio_pdata(arizona);
-			if (ret < 0)
-				return ret;
-		}
-	}
+	if (!dev_get_platdata(arizona->dev))
+		arizona_get_audio_pdata(arizona);
 
 	mutex_init(&arizona->dac_comp_lock);
 
diff --git a/sound/soc/codecs/wm5110.c b/sound/soc/codecs/wm5110.c
index 7a311c869bd3..73c4ffabf4ec 100644
--- a/sound/soc/codecs/wm5110.c
+++ b/sound/soc/codecs/wm5110.c
@@ -2403,13 +2403,8 @@ static int wm5110_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, wm5110);
 
-	if (IS_ENABLED(CONFIG_OF)) {
-		if (!dev_get_platdata(arizona->dev)) {
-			ret = arizona_of_get_audio_pdata(arizona);
-			if (ret < 0)
-				return ret;
-		}
-	}
+	if (!dev_get_platdata(arizona->dev))
+		arizona_get_audio_pdata(arizona);
 
 	wm5110->core.arizona = arizona;
 	wm5110->core.num_inputs = 8;
diff --git a/sound/soc/codecs/wm8997.c b/sound/soc/codecs/wm8997.c
index 83106523385a..c126afb65928 100644
--- a/sound/soc/codecs/wm8997.c
+++ b/sound/soc/codecs/wm8997.c
@@ -1119,13 +1119,8 @@ static int wm8997_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, wm8997);
 
-	if (IS_ENABLED(CONFIG_OF)) {
-		if (!dev_get_platdata(arizona->dev)) {
-			ret = arizona_of_get_audio_pdata(arizona);
-			if (ret < 0)
-				return ret;
-		}
-	}
+	if (!dev_get_platdata(arizona->dev))
+		arizona_get_audio_pdata(arizona);
 
 	wm8997->core.arizona = arizona;
 	wm8997->core.num_inputs = 4;
diff --git a/sound/soc/codecs/wm8998.c b/sound/soc/codecs/wm8998.c
index 8e6f03d00c71..fdb2018e9367 100644
--- a/sound/soc/codecs/wm8998.c
+++ b/sound/soc/codecs/wm8998.c
@@ -1346,13 +1346,8 @@ static int wm8998_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, wm8998);
 
-	if (IS_ENABLED(CONFIG_OF)) {
-		if (!dev_get_platdata(arizona->dev)) {
-			ret = arizona_of_get_audio_pdata(arizona);
-			if (ret < 0)
-				return ret;
-		}
-	}
+	if (!dev_get_platdata(arizona->dev))
+		arizona_get_audio_pdata(arizona);
 
 	wm8998->core.arizona = arizona;
 	wm8998->core.num_inputs = 3;	/* IN1L, IN1R, IN2 */

-- 
2.56.0.506.g506a7eabc5-goog

