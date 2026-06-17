Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D90477E35
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 10:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692665; cv=none; b=GX72GgxgvSt35FbegAy5pYt95dIja35HkLoVock5qPssVSJefWQ9QiPIfAP013Q/DkGAzVy9TC9K4eQcrvSA3/q3ao0EfXzcDqVICWSL9bkTf8HtVqbdcmbAw9A351Ao6L4MhMPG26utXwSFl7OAW3Oxvc5M9rLywrDFkyhPWys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692665; c=relaxed/simple;
	bh=3bUys6HV/tss5thgIuDCpHo8udC2k0VC5ManfDXi4ZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YZRtC9tmtEhlrl44GbpS705+Yy2oyJ2hnr5kjCqI0OIaZ6pPFlfht48E49uPaBmjWpnQqHMjXJfITSu1rbJvk7OegoEk7qfq/r+3xxryGtfrrNQG4P9RDrmuWfd4PP96FlbfoaXN6VJYELprfQUjSi3X+1ZruW4SwMvqEPlq9nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nny1lvUg; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nny1lvUg"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3078e0dcd67so5791986eec.0
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 03:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692657; x=1782297457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJOS8aV3vDBfsZ2F8Mw3/ey9J1GEhxdoLAwx26PZ64E=;
        b=nny1lvUg4m76BY/NIv9MZlFI8BYME4esupYLqzTGBs/emtv+qAdkXUaJ9bQEkUhfjV
         B487O8pWkjeMUX1cDvrdI1ck61rZPOjmGvd/WFWqRx7wdCITu4cuUVuW5mf1ZU+LCiFY
         gaEjhz/AOi1bJvhj8IM22PPPDfo+c91Re2iOMOGerEN1P7mJNGxVuwGRQetnHjE5VRNx
         VCZrMahK0fuehcggREz/xlmXVG2GKrw/vd4RuIEbqdf1Fi4E4hgySbiZe/oC09cOWvWy
         Bq2l4wAd/msTKuENyHceOGB3kSHkYv8W6L5sY9RV8g2FSds6GLAzqT8d8ICCAZ9Or2is
         CF0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692657; x=1782297457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OJOS8aV3vDBfsZ2F8Mw3/ey9J1GEhxdoLAwx26PZ64E=;
        b=RLtcrQ9oU4jhlVAaqQQrSbRNsOxlZat6PDSCTODc8NxQ/l+KFCbuanSy76v8FtAgpC
         U3hMMRZ1QDiQ9pK0h6c4ywpz6bGjTom7zgRz1KBaHAw3d2rEzwOtQKYpSUp8zLnPinSv
         PE7Q0vV6QY5bfwitMjAB484sNR2p0c83xxfmrC2msqRY3D8C7Odz70cbkhI9EkjPvncO
         EuurAZXDRzdIHPcXENmVLFHkO6YT/DK6JiVUS86ewV51F3FZXAj37MnBss0HePb+tyv8
         dVwWQulVXaI3sT8S5PbZcnCmPivBVy3EJTeaSqYcolxfgqTPNUejBn8gGx5FbEAKvv4V
         EEYg==
X-Forwarded-Encrypted: i=1; AFNElJ/vzlbzZ8wHARlZ2iAh7tFE+j9VWqz4vAzxMEZgQABDH4cOjTS95CwR+zOE/gFRGW273Lroz+WCvWqhZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj9OUFna6HmLrKxsv1IloTmsx0nZmyJxgBUG5V1pQvwfk6ARV+
	hh0oYS1DKR6O6mbXZnfGkNHFRJAmUKnaH4LT+k3Zzvb63nVpIOy24Jwn
X-Gm-Gg: AfdE7cmLSb0hobzVtRFTeI8or7Rmn7ILvIlrSNWO6icWpDQ8D8jFSTI3WEnrdqzFGrx
	wV+bl97YGSX7Jzi8tti7jRF9vnSSL9iF/d5HNbzo6IJSB/Su1gKtE8bGQmbRgXdh1kxhD9CIZXk
	mmtCkNo9hMoNyhp5IQObz62Gs1Pz8nCZELy8M95895104th0HuMBzaJRzvgOqMPb3/VtFZ8FMJO
	HIYZZ3ota0gBmdNoLl2Fx9JfYgdBg/meqf2j2fK83fQvLi12fPNn1qAML2KYNN1/h5/9WQauk5T
	SZ+fUMmfc+rE8+se1AG8k54DSJctPm0Nhxa5py4TSxDvMHw3/wb06Rbh5erT4OzpwZmmDLIR4A2
	5gU4ZeVXJG+LZ0TrPRnmUTNMIBTAS6IazG0pOVS/g0v83ZmUZdQyCJDSTQ9x0pG6ybB9MBotvj6
	Z/QCqOhZHE6272y93A4H4rM36EDSONR9vINFF+3zh9sKcSjAs=
X-Received: by 2002:a05:7300:7c0c:b0:307:393a:8f1d with SMTP id 5a478bee46e88-30bc9f0d836mr1700729eec.14.1781692656643;
        Wed, 17 Jun 2026 03:37:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:37:36 -0700 (PDT)
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
Subject: [PATCH 30/78] ASoC: codecs: fs210x: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:47 +0700
Message-ID: <20260617103235.449609-31-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/fs210x.c | 86 +++++++++++++--------------------------
 1 file changed, 29 insertions(+), 57 deletions(-)

diff --git a/sound/soc/codecs/fs210x.c b/sound/soc/codecs/fs210x.c
index 5f381fe063e8..cfb3ffe86e5a 100644
--- a/sound/soc/codecs/fs210x.c
+++ b/sound/soc/codecs/fs210x.c
@@ -770,9 +770,8 @@ static int fs210x_dai_hw_params(struct snd_pcm_substream *substream,
 	if (fs210x->devid == FS2105S_DEVICE_ID && fs210x->srate == 16000)
 		return -EOPNOTSUPP;
 
-	mutex_lock(&fs210x->lock);
-	ret = fs210x_set_hw_params(fs210x);
-	mutex_unlock(&fs210x->lock);
+	scoped_guard(mutex, &fs210x->lock)
+		ret = fs210x_set_hw_params(fs210x);
 	if (ret)
 		dev_err(fs210x->dev, "Failed to set hw params: %d\n", ret);
 
@@ -789,15 +788,11 @@ static int fs210x_dai_mute(struct snd_soc_dai *dai, int mute, int stream)
 
 	fs210x = snd_soc_component_get_drvdata(dai->component);
 
-	mutex_lock(&fs210x->lock);
-
-	if (!fs210x->is_inited || fs210x->is_suspended) {
-		mutex_unlock(&fs210x->lock);
-		return 0;
+	scoped_guard(mutex, &fs210x->lock) {
+		if (!fs210x->is_inited || fs210x->is_suspended)
+			return 0;
 	}
 
-	mutex_unlock(&fs210x->lock);
-
 	if (mute) {
 		cancel_delayed_work_sync(&fs210x->fault_check_work);
 		cancel_delayed_work_sync(&fs210x->start_work);
@@ -816,15 +811,11 @@ static int fs210x_dai_trigger(struct snd_pcm_substream *substream,
 
 	fs210x = snd_soc_component_get_drvdata(dai->component);
 
-	mutex_lock(&fs210x->lock);
-
-	if (!fs210x->is_inited || fs210x->is_suspended || fs210x->is_playing) {
-		mutex_unlock(&fs210x->lock);
-		return 0;
+	scoped_guard(mutex, &fs210x->lock) {
+		if (!fs210x->is_inited || fs210x->is_suspended || fs210x->is_playing)
+			return 0;
 	}
 
-	mutex_unlock(&fs210x->lock);
-
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
@@ -852,13 +843,11 @@ static void fs210x_start_work(struct work_struct *work)
 
 	fs210x = container_of(work, struct fs210x_priv, start_work.work);
 
-	mutex_lock(&fs210x->lock);
+	guard(mutex)(&fs210x->lock);
 
 	ret = fs210x_dev_play(fs210x);
 	if (ret)
 		dev_err(fs210x->dev, "Failed to start playing: %d\n", ret);
-
-	mutex_unlock(&fs210x->lock);
 }
 
 static void fs210x_fault_check_work(struct work_struct *work)
@@ -869,15 +858,12 @@ static void fs210x_fault_check_work(struct work_struct *work)
 
 	fs210x = container_of(work, struct fs210x_priv, fault_check_work.work);
 
-	mutex_lock(&fs210x->lock);
+	scoped_guard(mutex, &fs210x->lock) {
+		if (!fs210x->is_inited || fs210x->is_suspended || !fs210x->is_playing)
+			return;
 
-	if (!fs210x->is_inited || fs210x->is_suspended || !fs210x->is_playing) {
-		mutex_unlock(&fs210x->lock);
-		return;
+		ret = fs210x_reg_read(fs210x, FS210X_05H_ANASTAT, &status);
 	}
-
-	ret = fs210x_reg_read(fs210x, FS210X_05H_ANASTAT, &status);
-	mutex_unlock(&fs210x->lock);
 	if (ret)
 		return;
 
@@ -990,7 +976,7 @@ static int fs210x_effect_scene_get(struct snd_kcontrol *kcontrol,
 	if (fs210x->scene_id < 1)
 		return -EINVAL;
 
-	mutex_lock(&fs210x->lock);
+	guard(mutex)(&fs210x->lock);
 	/*
 	 * FS210x has scene(s) as below:
 	 * init scene: id = 0
@@ -999,7 +985,6 @@ static int fs210x_effect_scene_get(struct snd_kcontrol *kcontrol,
 	 */
 	index = fs210x->scene_id - 1;
 	ucontrol->value.integer.value[0] = index;
-	mutex_unlock(&fs210x->lock);
 
 	return 0;
 }
@@ -1018,7 +1003,7 @@ static int fs210x_effect_scene_put(struct snd_kcontrol *kcontrol,
 		return -EINVAL;
 	}
 
-	mutex_lock(&fs210x->lock);
+	guard(mutex)(&fs210x->lock);
 
 	/*
 	 * FS210x has scene(s) as below:
@@ -1028,17 +1013,14 @@ static int fs210x_effect_scene_put(struct snd_kcontrol *kcontrol,
 	 */
 	scene_id = ucontrol->value.integer.value[0] + 1;
 	scene_count = fs210x->amp_lib.scene_count - 1; /* Skip init scene */
-	if (scene_id < 1 || scene_id > scene_count) {
-		mutex_unlock(&fs210x->lock);
+	if (scene_id < 1 || scene_id > scene_count)
 		return -ERANGE;
-	}
 
 	if (scene_id != fs210x->scene_id)
 		is_changed = true;
 
 	if (fs210x->is_suspended) {
 		fs210x->scene_id = scene_id;
-		mutex_unlock(&fs210x->lock);
 		return is_changed;
 	}
 
@@ -1046,8 +1028,6 @@ static int fs210x_effect_scene_put(struct snd_kcontrol *kcontrol,
 	if (ret)
 		dev_err(fs210x->dev, "Failed to set scene: %d\n", ret);
 
-	mutex_unlock(&fs210x->lock);
-
 	if (!ret && is_changed)
 		return 1;
 
@@ -1061,12 +1041,10 @@ static int fs210x_playback_event(struct snd_soc_dapm_widget *w,
 	struct fs210x_priv *fs210x = snd_soc_component_get_drvdata(cmpnt);
 	int ret = 0;
 
-	mutex_lock(&fs210x->lock);
+	guard(mutex)(&fs210x->lock);
 
-	if (fs210x->is_suspended) {
-		mutex_unlock(&fs210x->lock);
+	if (fs210x->is_suspended)
 		return 0;
-	}
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -1087,8 +1065,6 @@ static int fs210x_playback_event(struct snd_soc_dapm_widget *w,
 		break;
 	}
 
-	mutex_unlock(&fs210x->lock);
-
 	return ret;
 }
 
@@ -1219,11 +1195,9 @@ static int fs210x_probe(struct snd_soc_component *cmpnt)
 	if (ret)
 		return ret;
 
-	mutex_lock(&fs210x->lock);
-	ret = fs210x_init_chip(fs210x);
-	mutex_unlock(&fs210x->lock);
+	guard(mutex)(&fs210x->lock);
 
-	return ret;
+	return fs210x_init_chip(fs210x);
 }
 
 static void fs210x_remove(struct snd_soc_component *cmpnt)
@@ -1250,15 +1224,15 @@ static int fs210x_suspend(struct snd_soc_component *cmpnt)
 
 	regcache_cache_only(fs210x->regmap, true);
 
-	mutex_lock(&fs210x->lock);
-	fs210x->cur_scene = NULL;
-	fs210x->is_inited = false;
-	fs210x->is_playing = false;
-	fs210x->is_suspended = true;
+	scoped_guard(mutex, &fs210x->lock) {
+		fs210x->cur_scene = NULL;
+		fs210x->is_inited = false;
+		fs210x->is_playing = false;
+		fs210x->is_suspended = true;
 
-	gpiod_set_value_cansleep(fs210x->gpio_sdz, 1); /* Active */
-	fsleep(30000); /* >= 30ms */
-	mutex_unlock(&fs210x->lock);
+		gpiod_set_value_cansleep(fs210x->gpio_sdz, 1); /* Active */
+		fsleep(30000); /* >= 30ms */
+	}
 
 	cancel_delayed_work_sync(&fs210x->start_work);
 	cancel_delayed_work_sync(&fs210x->fault_check_work);
@@ -1287,13 +1261,11 @@ static int fs210x_resume(struct snd_soc_component *cmpnt)
 		return ret;
 	}
 
-	mutex_lock(&fs210x->lock);
+	guard(mutex)(&fs210x->lock);
 
 	fs210x->is_suspended = false;
 	ret = fs210x_init_chip(fs210x);
 
-	mutex_unlock(&fs210x->lock);
-
 	return ret;
 }
 #else
-- 
2.43.0

