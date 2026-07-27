Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4644A3F44CE
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 09:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145404; cv=none; b=XIe72afSiGvNstvx8XULYjLYTYtefDgocIpIQyfB57MKFBPXHLxx6Pag89W0OY+AdcB+1kEPvheQAl7lPRTXF29uHVOOGtESD5TtWFdMFnNtouWA7QP4gLXScmhwY37BY5ZI8KEhu4I3h/IPGB6Gl/kgdJyVl5CJd7CN2yrZO6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145404; c=relaxed/simple;
	bh=tQignsy0Uqf27H/ST9+cDOhKM7ywT6SKO99/+Fa+egA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dQk8laseFTO2tGLdP8gvO4BtDQwWmHQFkuT1CZZoX0yhQvCy68ZbeJUv4umDcmNiFgfeMT9UT3gfwnH3yXR2t0zErSlehvDw/0s+CNZrIGSh3uRAa+t7VJH6ccpjVX2iJEPbaCPx76ew3QzsRt3JoQ7yfYcJ9DuB/3LFmxGoDOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R0HHTfVC; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R0HHTfVC"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c9d1fff21edso1482535a12.1
        for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 02:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785145403; x=1785750203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ipgET18nqnZuvZuo94ljzJ78lvwUk1zejtWxurs02pM=;
        b=R0HHTfVCTq/WmWeHHuGHNN6dQpvLiBpjTFBK0n6DmWhPR49PRrMl084VL49RyaTnTX
         lmGRYjob6QMlGNVotEN79ZxZexVvu+G7XkVCTKyNB7w5+IrEjaeOBc+tW6Bo54srlRiQ
         Tsvd/FvbIhdf7dcj8H12IY49VC89H4+BHoVOJdj3xbVBxVkMrIfrnrjmRjioUfrd5Fmk
         TdRg8t3hI3djI2QWsW2MeLRYl7+xwujJGeo0zFbLhqxFx+JdYg20zNScTlCcF6UC3yQS
         yHB0sMyMMUhppLeqkGuhrJyeYS0jlSTWFfqYGggJTenrJiuqUhNKajdq1ozx+QPKUyTV
         PoiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145403; x=1785750203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ipgET18nqnZuvZuo94ljzJ78lvwUk1zejtWxurs02pM=;
        b=EE9IrDJmslXIFtGBJ3ooZkQx1RwduCPxh0JxV0ZYnaCGLyRek84gNVG17IP+bILwFc
         7uJfBCKPIVHnLudfo170a8b5e0BXw2MzCHWVPsmsYbS/Yr0zqtjEPUlj5Uc7CPFCKvrD
         6WtXbe1zCGWKYl18ocqnxK2dE59SPT+UJVGhs3N1aNsB0LMvz5p9hj92gZ2EDhNQUchi
         DVsWBDXspTR04f4PqExNTN7JgwFE2tMfKjUt1+QatCYJAxBp0XzxnXLcF0GNbgfgVOls
         oPEEECgy2fMVU4zrCQsdzQ1FCfjhQFHTKh6MJV6D3q/5DYF8YmKVh2af7phlkkSgO0wE
         qYlw==
X-Forwarded-Encrypted: i=1; AHgh+Rr53Kf82Rk/N2ftOW/iq2PoZNhwoUywdgZu9RZ20l95im1XAHSGxJfm3NVA81W7aqv3t10DkVYIjt01+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIVqWAVEvDnZhKx5++lmp+MzpDMxcdr4CI6iFbv22QS7438exs
	riB56tv1FswjqfzZkpEmjtReUvG9QI/5fN+97f+faM/A3ucVgreNTTSL
X-Gm-Gg: AR+sD12IQa9I3v5zSTIe/zfWG+eF8XHQI4uir0pFXq62poke0Vz8xbm0yB4PIqiVvww
	klaf/VMRrJjlmOkDd/oc7mj/h/R7X8bmybHmihLpadkbh5Tallh0lnvNbIJgo932FxG04gwmxVS
	JRXRDxiZmUY4etSNo8m9grYQ1xqQiO8JGIACORBv5oBeqatTOAKHhAMHHAgETYPi3qkghxwAIYA
	H2Ym0idH2WCoyKUYy9L+SEwiOdsVH/h9gdsJ5GQ2hY8Dh8+RMBW0zmSw+Vmy7I5CCgm0c+Ro3zD
	51YTmmRxnNjybYxXCexPcnPSeESx49QJIFEfvlMlJNTY5S06tcz2p4c8g062j6A37SbZY/2MJPb
	ZJEuoFEvyzN1lap2VyLZz7X/Lscoxw89udd21p9qYbSG24W1/8e2TjJD4LTM1UFYl+eUUDirL5/
	HT97uTN9I33BBVDawZNRRhxP89jgX9x5CWzT995Q1NCg815qQl+s8UkKAZEbmLU0VlBeBm8XxnK
	t9FVOFlK6mF2zb8LZX9rA==
X-Received: by 2002:a05:6a21:6803:b0:3c3:b650:fd24 with SMTP id adf61e73a8af0-3c67e0d918dmr7166511637.59.1785145402680;
        Mon, 27 Jul 2026 02:43:22 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66b5ffesm2959018a12.19.2026.07.27.02.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:43:22 -0700 (PDT)
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
Subject: [PATCH v2 09/26] ASoC: codecs: tscs454: Use guard() for mutex locks
Date: Mon, 27 Jul 2026 16:40:29 +0700
Message-ID: <20260727094046.23001-10-phucduc.bui@gmail.com>
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

