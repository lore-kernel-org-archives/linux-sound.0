Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD273F0761
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 11:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781780971; cv=none; b=br556714X+RCst/4BSUSSuMJdALw+Ukk8F7x9tiTgrnxt7/czTeAUg1Zyk+RWT3rAiolj82lmp6CKkbYUTW3g9jxQyi7OpnMa3sF0oNFTKhezpRDhjm374Ipr3KmZEHcvUWspl1k/0sqjcQOMV4i1qjC7F6J4DiRH9eA1c//foo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781780971; c=relaxed/simple;
	bh=Wf7RizomEejznlHG4II2F373J69gtT3DNPFH/bJfU7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ks1NI6dcFQAn8vL1Ys1jw+kailIEk3pPKFK+Y+GcwBFCMb2JDgYrcVSccNkCu3zlxJEVNXHnRM9vuQLcLQ1ZP5Q9lTR8YpbmDwoWS3TOdfIEmkHr0szYwManCa8CtMTLzgmyyB9IbirLx9+5ZP2Egt/E37nSM5cddhyM1S6S13k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YcwYzf2O; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YcwYzf2O"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c6b3f71648so10577545ad.2
        for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 04:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781780969; x=1782385769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u6I1cU0uB+Ybu2EHEeduQ3ny6eKqLEtOuo8klPvt1zY=;
        b=YcwYzf2O00RSp/rPHN1XT1APNnHB1U1mAzcXb1xdueg7KTGBhP6YP5uikAqIV9VJVu
         Nu9erfkjG+U03UQi5m6Ep7hNKvcAJjZkNOnjz+f2lgkHrgoiNQ+FArHU8F9IlMhPiISR
         ivWRKEPcKrwZKAH1EdLRB/Dl5Pjpyhj+eK7mgumAjPW+tV3r5JIpXD4JxtP6ZIPOMIdJ
         1s+y2+HpW1BGhY97WZirW35xvk3uWIFE0RKIVQMvf0rPiFPujZvcegHYffeTqdeF2GWI
         izQYWiYwzaCn2toVrfT0jtkyzxN3F6c4/BrcJ1TPKDzhXAgoh+y8+quqJgIHg/wIv8WD
         COUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781780969; x=1782385769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u6I1cU0uB+Ybu2EHEeduQ3ny6eKqLEtOuo8klPvt1zY=;
        b=iNg0TDDO3cFK4r7phIeakmqdF2AF3KEpazXppDzaBWEwypl0b0kvjBbqlvtgWkrSJa
         8+QAxUZ5mYFCiaxYr9utAVKcY1hkBQpvaJcJUIzbbzRhTuDvnBTAEIX34f05my3txxph
         QNV0/FKSjNtBmnUGYeMe33k8f/xJ3YrmDuoREhG8Obn+RLeiaZsRxsL2at1a4tBvXRds
         EkgeO4GvcXnrOjJlDJI2gOVEwpoXlMv35gaVzhio25glPoMDvOLQe2CAUfuRDwMaXmty
         I2n4jhcX6so1Z2ntHXbjX0sfDrklP+g6R9VjcSh5W9zMwJR4qPaw1L+pXgqR256HCXr8
         lDcg==
X-Forwarded-Encrypted: i=1; AFNElJ8ukriOXIC0JLFjYqlPgB/Hb2sSO76GRIkUk2h52Iek9yl4cqWHuNo4zS/2FQG5UcXu0ey0KFi7GQdo2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwL6lvzcuIWY5vN3ShgTSfWr83gP3wmWlemuIJYVnbazyKCTfPz
	N8byDP/oKYWnzVo7asSqfA5KTXqSn8lZS9vYB+vVW8+G1GBxYn7PMCgw
X-Gm-Gg: AfdE7cmVyKHoLscasiiJ4r41g2HpvNql19gf6yEtXSzbmU2JTtrcWch6lbzKH8ZZtJj
	ISCahhRslDrtCWY2NcXagYs+PCYu7whN8YGpnhC5c+58CZ0v/CcCgUXHt4U/EFKWC7OTJup4NmT
	n6A+W9ZHz3kCaxZRZhnfTptGzufUE3v9EDDV8WFTNOhukobmaQ3R8cyo7CL1FtMPNQne1tIrbLm
	G5ZuNVBAeNcnQ6qqPZ903inV3sYP3/5MGgRSfkT9euqUhHRRQeAlK5D8kM3SmbUKsnGcGJdWPWA
	FZw86qC+q+ozo74iSb0hBqKRX8ZiJ/qWnM2k9S792roBpyP/HpdRQXMj5+msAuL1p1JwsQVYns5
	khphaqZfZ2oKsnxWsItQR0p43H5IlgmnWb/wXmqcLVhEXyP6vSuHwCrSQ9JyLgza0GWftEvt77X
	FMvwAC3ZrfzBNiw4ZYA7j9bG2P458reqdi/pNH59WeXVnigTLgxMIWVsGROw==
X-Received: by 2002:a17:902:d58d:b0:2c0:cb90:1dfc with SMTP id d9443c01a7336-2c6bc0b5952mr91663075ad.12.1781780969257;
        Thu, 18 Jun 2026 04:09:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:09:28 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 61/78] ASoC: codecs: tscs454: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:10 +0700
Message-ID: <20260618110827.232983-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/tscs454.c | 106 ++++++++++++++-----------------------
 1 file changed, 41 insertions(+), 65 deletions(-)

diff --git a/sound/soc/codecs/tscs454.c b/sound/soc/codecs/tscs454.c
index aad394937ce6..af0c21ca3a16 100644
--- a/sound/soc/codecs/tscs454.c
+++ b/sound/soc/codecs/tscs454.c
@@ -329,12 +329,10 @@ static int coeff_ram_get(struct snd_kcontrol *kcontrol,
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
@@ -428,15 +426,15 @@ static int coeff_ram_put(struct snd_kcontrol *kcontrol,
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
@@ -446,18 +444,12 @@ static int coeff_ram_put(struct snd_kcontrol *kcontrol,
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
@@ -465,41 +457,35 @@ static inline int coeff_ram_sync(struct snd_soc_component *component,
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
@@ -658,16 +644,14 @@ static int set_sysclk(struct snd_soc_component *component)
 
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
@@ -679,15 +663,13 @@ static int pll_connected(struct snd_soc_dapm_widget *source,
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
@@ -806,7 +788,7 @@ static inline int aif_free(struct snd_soc_component *component,
 {
 	struct tscs454 *tscs454 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&tscs454->aifs_status_lock);
+	guard(mutex)(&tscs454->aifs_status_lock);
 
 	dev_dbg(component->dev, "%s(): aif %d\n", __func__, aif->id);
 
@@ -829,8 +811,6 @@ static inline int aif_free(struct snd_soc_component *component,
 		free_pll(tscs454->internal_rate.pll);
 	}
 
-	mutex_unlock(&tscs454->aifs_status_lock);
-
 	return 0;
 }
 
@@ -3174,7 +3154,7 @@ static int tscs454_hw_params(struct snd_pcm_substream *substream,
 	unsigned int val;
 	int ret;
 
-	mutex_lock(&tscs454->aifs_status_lock);
+	guard(mutex)(&tscs454->aifs_status_lock);
 
 	dev_dbg(component->dev, "%s(): aif %d fs = %u\n", __func__,
 			aif->id, fs);
@@ -3207,14 +3187,14 @@ static int tscs454_hw_params(struct snd_pcm_substream *substream,
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
@@ -3223,11 +3203,7 @@ static int tscs454_hw_params(struct snd_pcm_substream *substream,
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

