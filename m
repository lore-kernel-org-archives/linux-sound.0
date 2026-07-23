Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6F139CD09
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 04:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784782495; cv=none; b=SfA8jbI4npFmOoyylPDG03gDVsqSGp97zvcQBGJOMhooP/wiIsuHz/fBgpuZtL24mgYs1RIaR3fIfjH9hovOOIVw8y8lUM5Wh/Fc+OqqXjsgS7fXqTJmPTObfd1FlvHBxFq+HF3c1oLlpkKub53W3FF6IzmE9GVdSmiLjNie+LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784782495; c=relaxed/simple;
	bh=nZGVKfdU4GqxPhxmWCUGDD6Nc/KNfAjP7JAS+KPicHo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gIL41pxQoRCKmRPXbEVZ7yQAW+/Ipkq7AlaaIKCUWoWKpu0ee4O++A1z5c7RXQFku/+Vdec/eO9Ws+cQJ46nXnGGVAeyRmIGPs65dXZ4WupuF4h82hOcPwek8rjtzTNn0PpCt1zbHNVIsQtY8ZbDJZsuOg2NFgRooh+LiRFBAAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KbVIMY1i; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KbVIMY1i"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cca0c5799eso2248075ad.0
        for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 21:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784782484; x=1785387284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2URIyRhsqdkSXLbHXTDfJ+qkOeAaYtVPXldxW4D65fM=;
        b=KbVIMY1ixYi8TmFd6CWkRJcLP/1lbQq4BMl+r517aud6OtmakQyU6nytwF4xu1e6k5
         rcg6/q58DqF2cEWIDE4PZYpQg3v4a0YWuZm5NWW1XRKJGvMgfmQJOMQemqrh+2W8r39V
         4Jfr2lbbkVanW0A5jtCGYVva524QwFZF5kcWyVQcNNOm5cfhTayoB8qb8zUiB1GhcBv+
         3h/bB2MgNw2o7x5wuwdPkhXH8RgLoFBdt8hnZ/jiiW66l20iZz7PjFO4qrz1sbw81FPE
         MM0BkGyBCrcHI6/hourgFBAm10kvlentP/UUzMeKA7hDWyKgagh7VdxdW6SAyB0BPc0y
         VVFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784782484; x=1785387284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2URIyRhsqdkSXLbHXTDfJ+qkOeAaYtVPXldxW4D65fM=;
        b=NVe71PFvOmzTIwuLSvuOtj4Vg0erUkx4TsZh+19VCivDMKYLqvrD8qsUO3n4g+1YNl
         G68atIlkdmxBy9U1+C1fPTJ1jJDD4HpTgSNmeIvc4UupZmI3jVKyWHfxq1Q2yo5tDBtC
         Dv0O2Rw8s4K+a6XxkJIzHGkzSDJDPvkiDqlFbqgnBOSULCf/2mCF6DBPJVr7JSbjaY+8
         BuCXBjgTFgpwH7I7UfCZ3KjhkG4NvcJWt4yVCsVbNDK4Z09hxZ6y8CqSU1fqwzyuUNsj
         hh4+4H1CkydQZw8FIae79lB4I2OiZkQ4Vqh6Z6oDyz3u2g2uHLjQPNHwuei1lIBOQn1+
         4QLg==
X-Forwarded-Encrypted: i=1; AHgh+RqKSQp518SRyWBMa5YGnHPZjWSSM0MYz/0+++p2GUiITzYRXu5vLAGkGyJ5IdOi57azu1kOkNXAI8ifbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmAhdpbZFRZ8a0bRBTWImaiiFBJ3EoLKuNIdszBJdil2CAedX4
	XvyjsI/6sr5Bc4edBjpdpLFcrLXtqM61UUfQX264Ohvnc6aUNNMFwlm4
X-Gm-Gg: AR+sD139mPfko/v0Yi1OgzFJt3+I/8zE3QVa/sSmCZxb/P51sC/v1RBz4wzOajr5E0Z
	sFqiKIZbs3Sxh8q86EQydcw7Fm6d/GKbjVH2CjMhGpdjoKeb5pyomOgrxLNaxw97OhdaoewGQqX
	d698+25G1NmAlAP8ZcXVkdNCbGBFjJhZZ87ABeZNfJ1CLsrDclkkTclU1H9GyEiEGi09A3SKb80
	yR2AHNT9kJCnflRGVzFvcLnqIMxnRP1DAAmNNNEMQiuS+iNwUpzen1xsvxCKFOxuOyP41UpTyjK
	ohfTi0xzuDFSxmldqGBLvyT62yINSsTBiXLxqf+yvYq9nJmTmkMRL0x9qmaV6SdlJ6pgQvRXokh
	ecZ7zTWHJk4ietyTWjEd1cRt/3BgVz7/wtUSNe9q2vVkpQbjPMzIP2EcGHgHn3ZHSWguUBFGBZx
	drltGSAMmuvvH2i0j1ZdZnsPBXP8yjmbAqzmjB
X-Received: by 2002:a17:903:22c7:b0:2c9:ed16:8d8d with SMTP id d9443c01a7336-2cfa6d8797bmr19246355ad.38.1784782484352;
        Wed, 22 Jul 2026 21:54:44 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfa57542e0sm7258365ad.67.2026.07.22.21.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:54:44 -0700 (PDT)
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
Subject: [PATCH 08/26] ASoC: codecs: tscs42xx: Use guard() for mutex locks
Date: Thu, 23 Jul 2026 11:53:09 +0700
Message-ID: <20260723045327.28260-9-phucduc.bui@gmail.com>
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

