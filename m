Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43E538A72F
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 04:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784782507; cv=none; b=KkH5e4EXYBeIS0j8N+CPg1HtVfHjP0i98AkUqvEeyxbWRj0L6DoTOy86O7z1CIbaub4x9efOEjygI4kk4beYzNQx2boZIUKcWBIStT3tBGOwNj27A7hSEKkYLJ86s3WS7rWRqysL1Trp78FH0zSoTQCn2KEaDEpk3cCJPTbo1Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784782507; c=relaxed/simple;
	bh=tQignsy0Uqf27H/ST9+cDOhKM7ywT6SKO99/+Fa+egA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aoLnFsKTDnY8Qu11MoAWrpew0rSudxn+gh6nK/hzy3XYmG4zzKIjugIXMIZtLx8C8p4zXV4kif7N8r/wpdphU3r8z1DZZ38HFL+6tcL1kIsXmdFzDtjRIwvf3cUxG1ZJ5PoeQO9Bjw5FB2iGBxN7G/sKJE5pUe7sl/vGGHgf12c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gm08PH1A; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gm08PH1A"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2caced6038eso579315ad.0
        for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 21:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784782491; x=1785387291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ipgET18nqnZuvZuo94ljzJ78lvwUk1zejtWxurs02pM=;
        b=Gm08PH1AAjp1X1OKGm4FQBj87cFduC6FdFU1AP/ftQwwpYAKXhpVQnFWg+lr2FsdOD
         5Z1KEvYkmuJ8QiCtdSuf3Dj8fWBIPbFl41uzeMYF1EPZIehHfmaorCiVVL2x5MuYlqSf
         NIqhjUT1GKwcbjiRlPDPIgmZV7BMPx5ALESkSF+0to6N4Iv/zFsJ6OB4BM11J2nK122r
         SQerilxSJkWubHsFREHi2KeExgeHJ79HSAiCOzSJoF630/Oevk8HGP7URvb4hAmVEKOB
         70y3yffQfJGgFbVUjoTtNA1yIBhMVF4V9FpR3xiKRzJ97siyUzYoxOF6zFnxR2MxPVuK
         UXTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784782491; x=1785387291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ipgET18nqnZuvZuo94ljzJ78lvwUk1zejtWxurs02pM=;
        b=q6nz2q7gKd+Od9XS0Wy/Y+g0LlKaEamehGscNlpTT6PC2Spxj5oaoGc26XqewtZwH9
         JiU0/kKXTGYRtTlU5AsafY5Y42iWJwmUaQivDId2xl5JuNOq8fjoZeldommeztcclhZV
         +KU3oGpRml+G9exlQ0+5k+kodhnkC1K/2yeksDJMDiYNJqMsHuol0hjU9Ype07kM6Y/8
         fg2MnedGZkaSc/o3SKCd/na/zbFVSLFY8fSPTETqzJzwXjYe/MiTEGdSSvJA1Xk94xLS
         ND9mq+DE6YiKOTMBmcxLrKJI16ZuhlztCtXOjQpUREJQFMmMuOYQYQhrdMXCIyJ+3MEk
         6oDQ==
X-Forwarded-Encrypted: i=1; AHgh+RrouKp6WwRglxO+ATwHifzhroAvSqv1aAiuCRJ+J6UEPqS+3fM9CMTeD09hjk9P2uPjubjciNEQWTw6nw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyH7ptIqYVAkq+0jOndYxtB9huDNVDNtAkRqSPhrOMtN1AChaUl
	9jjRQcm1v+sPHEgMbEroKGZL/T6lBqHgwstpcaFEzeYtaiDNDUXLKiBh
X-Gm-Gg: AR+sD12XoFha3jDdJLjMHfTtbttDL4dcJPmfL8qwU/OObpxlVWBpUAWmA3lQZz4cBcc
	zwFA0R/9AhkvLYoqHaW3GMKws+891aiDD5q3Ryzjt2lz0iemtKgQU/1BofrRGHVyak4ekjFcSSf
	6m+CVOj8v7t779sFtsDfsnh23ChZSOSK7/uFpoF/akSBkLbEbugxm/xAHTzAmRYcyXyj/G3GKKT
	mOEBDHmHOYScc052kYRwJq0if4by0XDxLIrKM/NS11k7dTq8QnRPnuOpTfH4j+CIBzQ4RxU09JS
	+b0tfQjckyEVWunBm7vO3CvtO5w3LyybuZiK4y/cmJT13TBWa7rwR1Pu7Mx3wTPNjkOvXoXSuvk
	EsCEwusOCBfzRaiy2i5vbjEnhMHATcSluHgJ9jldCqyMpsnFpRUdOlZew0fOhtgk20iAmwU2de4
	DsyvXrKZZyEf5ferzr0X3/GfqTab8m9OW3eZJD
X-Received: by 2002:a17:902:c409:b0:2c9:97a7:3283 with SMTP id d9443c01a7336-2cfa954df7amr13349015ad.23.1784782490606;
        Wed, 22 Jul 2026 21:54:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfa57542e0sm7258365ad.67.2026.07.22.21.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:54:50 -0700 (PDT)
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
Subject: [PATCH 09/26] ASoC: codecs: tscs454: Use guard() for mutex locks
Date: Thu, 23 Jul 2026 11:53:10 +0700
Message-ID: <20260723045327.28260-10-phucduc.bui@gmail.com>
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
 sound/soc/codecs/tscs454.c | 107 +++++++++++++++----------------------
 1 file changed, 42 insertions(+), 65 deletions(-)

diff --git a/sound/soc/codecs/tscs454.c b/sound/soc/codecs/tscs454.c
index aad394937ce6..b70c9d931e1e 100644
--- a/sound/soc/codecs/tscs454.c
+++ b/sound/soc/codecs/tscs454.c
@@ -4,6 +4,7 @@
 // Author: Steven Eckhoff <steven.eckhoff.opensource@gmail.com>
 
 #include <linux/kernel.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/regmap.h>
@@ -329,12 +330,10 @@ static int coeff_ram_get(struct snd_kcontrol *kcontrol,
 		return -EINVAL;
 	}
 
-	mutex_lock(coeff_ram_lock);
-
-	memcpy(ucontrol->value.bytes.data,
-		&coeff_ram[ctl->addr * COEFF_SIZE], params->max);
-
-	mutex_unlock(coeff_ram_lock);
+	scoped_guard(mutex, coeff_ram_lock) {
+		memcpy(ucontrol->value.bytes.data,
+		       &coeff_ram[ctl->addr * COEFF_SIZE], params->max);
+	}
 
 	return 0;
 }
@@ -428,15 +427,15 @@ static int coeff_ram_put(struct snd_kcontrol *kcontrol,
 		return -EINVAL;
 	}
 
-	mutex_lock(coeff_ram_lock);
+	guard(mutex)(coeff_ram_lock);
 
 	*coeff_ram_synced = false;
 
 	memcpy(&coeff_ram[ctl->addr * COEFF_SIZE],
 		ucontrol->value.bytes.data, params->max);
 
-	mutex_lock(&tscs454->pll1.lock);
-	mutex_lock(&tscs454->pll2.lock);
+	guard(mutex)(&tscs454->pll1.lock);
+	guard(mutex)(&tscs454->pll2.lock);
 
 	val = snd_soc_component_read(component, R_PLLSTAT);
 	if (val) { /* PLLs locked */
@@ -446,18 +445,12 @@ static int coeff_ram_put(struct snd_kcontrol *kcontrol,
 		if (ret < 0) {
 			dev_err(component->dev,
 				"Failed to flush coeff ram cache (%d)\n", ret);
-			goto exit;
+			return ret;
 		}
 		*coeff_ram_synced = true;
 	}
 
-	ret = 0;
-exit:
-	mutex_unlock(&tscs454->pll2.lock);
-	mutex_unlock(&tscs454->pll1.lock);
-	mutex_unlock(coeff_ram_lock);
-
-	return ret;
+	return 0;
 }
 
 static inline int coeff_ram_sync(struct snd_soc_component *component,
@@ -465,41 +458,35 @@ static inline int coeff_ram_sync(struct snd_soc_component *component,
 {
 	int ret;
 
-	mutex_lock(&tscs454->dac_ram.lock);
-	if (!tscs454->dac_ram.synced) {
-		ret = write_coeff_ram(component, tscs454->dac_ram.cache,
-				R_DACCRS, R_DACCRADD, R_DACCRWDL,
-				0x00, COEFF_RAM_COEFF_COUNT);
-		if (ret < 0) {
-			mutex_unlock(&tscs454->dac_ram.lock);
-			return ret;
+	scoped_guard(mutex, &tscs454->dac_ram.lock) {
+		if (!tscs454->dac_ram.synced) {
+			ret = write_coeff_ram(component, tscs454->dac_ram.cache,
+					      R_DACCRS, R_DACCRADD, R_DACCRWDL,
+					      0x00, COEFF_RAM_COEFF_COUNT);
+			if (ret < 0)
+				return ret;
 		}
 	}
-	mutex_unlock(&tscs454->dac_ram.lock);
 
-	mutex_lock(&tscs454->spk_ram.lock);
-	if (!tscs454->spk_ram.synced) {
-		ret = write_coeff_ram(component, tscs454->spk_ram.cache,
-				R_SPKCRS, R_SPKCRADD, R_SPKCRWDL,
-				0x00, COEFF_RAM_COEFF_COUNT);
-		if (ret < 0) {
-			mutex_unlock(&tscs454->spk_ram.lock);
-			return ret;
+	scoped_guard(mutex, &tscs454->spk_ram.lock) {
+		if (!tscs454->spk_ram.synced) {
+			ret = write_coeff_ram(component, tscs454->spk_ram.cache,
+					      R_SPKCRS, R_SPKCRADD, R_SPKCRWDL,
+					      0x00, COEFF_RAM_COEFF_COUNT);
+			if (ret < 0)
+				return ret;
 		}
 	}
-	mutex_unlock(&tscs454->spk_ram.lock);
 
-	mutex_lock(&tscs454->sub_ram.lock);
-	if (!tscs454->sub_ram.synced) {
-		ret = write_coeff_ram(component, tscs454->sub_ram.cache,
-				R_SUBCRS, R_SUBCRADD, R_SUBCRWDL,
-				0x00, COEFF_RAM_COEFF_COUNT);
-		if (ret < 0) {
-			mutex_unlock(&tscs454->sub_ram.lock);
-			return ret;
+	scoped_guard(mutex, &tscs454->sub_ram.lock) {
+		if (!tscs454->sub_ram.synced) {
+			ret = write_coeff_ram(component, tscs454->sub_ram.cache,
+					      R_SUBCRS, R_SUBCRADD, R_SUBCRWDL,
+					      0x00, COEFF_RAM_COEFF_COUNT);
+			if (ret < 0)
+				return ret;
 		}
 	}
-	mutex_unlock(&tscs454->sub_ram.lock);
 
 	return 0;
 }
@@ -658,16 +645,14 @@ static int set_sysclk(struct snd_soc_component *component)
 
 static inline void reserve_pll(struct pll *pll)
 {
-	mutex_lock(&pll->lock);
+	guard(mutex)(&pll->lock);
 	pll->users++;
-	mutex_unlock(&pll->lock);
 }
 
 static inline void free_pll(struct pll *pll)
 {
-	mutex_lock(&pll->lock);
+	guard(mutex)(&pll->lock);
 	pll->users--;
-	mutex_unlock(&pll->lock);
 }
 
 static int pll_connected(struct snd_soc_dapm_widget *source,
@@ -679,15 +664,13 @@ static int pll_connected(struct snd_soc_dapm_widget *source,
 	int users;
 
 	if (strstr(source->name, "PLL 1")) {
-		mutex_lock(&tscs454->pll1.lock);
-		users = tscs454->pll1.users;
-		mutex_unlock(&tscs454->pll1.lock);
+		scoped_guard(mutex, &tscs454->pll1.lock)
+			users = tscs454->pll1.users;
 		dev_dbg(component->dev, "%s(): PLL 1 users = %d\n", __func__,
 				users);
 	} else {
-		mutex_lock(&tscs454->pll2.lock);
-		users = tscs454->pll2.users;
-		mutex_unlock(&tscs454->pll2.lock);
+		scoped_guard(mutex, &tscs454->pll2.lock)
+			users = tscs454->pll2.users;
 		dev_dbg(component->dev, "%s(): PLL 2 users = %d\n", __func__,
 				users);
 	}
@@ -806,7 +789,7 @@ static inline int aif_free(struct snd_soc_component *component,
 {
 	struct tscs454 *tscs454 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&tscs454->aifs_status_lock);
+	guard(mutex)(&tscs454->aifs_status_lock);
 
 	dev_dbg(component->dev, "%s(): aif %d\n", __func__, aif->id);
 
@@ -829,8 +812,6 @@ static inline int aif_free(struct snd_soc_component *component,
 		free_pll(tscs454->internal_rate.pll);
 	}
 
-	mutex_unlock(&tscs454->aifs_status_lock);
-
 	return 0;
 }
 
@@ -3174,7 +3155,7 @@ static int tscs454_hw_params(struct snd_pcm_substream *substream,
 	unsigned int val;
 	int ret;
 
-	mutex_lock(&tscs454->aifs_status_lock);
+	guard(mutex)(&tscs454->aifs_status_lock);
 
 	dev_dbg(component->dev, "%s(): aif %d fs = %u\n", __func__,
 			aif->id, fs);
@@ -3207,14 +3188,14 @@ static int tscs454_hw_params(struct snd_pcm_substream *substream,
 	ret = set_aif_fs(component, aif->id, fs);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to set aif fs (%d)\n", ret);
-		goto exit;
+		return ret;
 	}
 
 	ret = set_aif_sample_format(component, params_format(params), aif->id);
 	if (ret < 0) {
 		dev_err(component->dev,
 				"Failed to set aif sample format (%d)\n", ret);
-		goto exit;
+		return ret;
 	}
 
 	set_aif_status_active(&tscs454->aifs_status, aif->id,
@@ -3223,11 +3204,7 @@ static int tscs454_hw_params(struct snd_pcm_substream *substream,
 	dev_dbg(component->dev, "Set aif %d active. Streams status is 0x%x\n",
 		aif->id, tscs454->aifs_status.streams);
 
-	ret = 0;
-exit:
-	mutex_unlock(&tscs454->aifs_status_lock);
-
-	return ret;
+	return 0;
 }
 
 static int tscs454_hw_free(struct snd_pcm_substream *substream,
-- 
2.43.0

