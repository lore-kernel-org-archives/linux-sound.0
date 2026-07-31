Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C39734AB14
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 03:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785467616; cv=none; b=j6LX07o5ypA7HUp70wooKuyRkK40CQemm/gXh7f8002G+ELK39gNRG6z/w97nn4RvSi27t8Yjc3Ea1nyqfI2XChXwbEzsuKWuqpQCj0Tph4/jjYuWZ4GNNtPfOyRDAhqutu8IYjVYxh6KI20q+ovapyfuvxIaVvW6F6ab43vAXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785467616; c=relaxed/simple;
	bh=O3CfuxA9ARvjSsoY8HBSq0ArTJLuGEMNPsj7JRmLNw0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p6lDUbfQ+v5612B0GEo0gF9iFrfL3OhFBadiGVmpY3LrmSZSGji6X2xsPxGI9VriWkZylTJnTIpsFKigVJhg4BdD//WXvQp7tXfPHRUTxLVXBIJ2QuWHNs/rFNxJru6OBPRRwyPkEihWSj2GNM7LYEJH2k38FnHSH4Ua7nFE3/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ipEI1zK7; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ipEI1zK7"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d004f135b1so5528675ad.3
        for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 20:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785467615; x=1786072415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rIs3ybzRs03b5a4Q81m863N9fCRIij9a9SB5EUTbVmM=;
        b=ipEI1zK7yNqJcev1V3Ckp12fvIn2tlmpzPDV7RyPfBoU2AZekMQqXUds2ClJJGxEGP
         dQqZgngpHGXtjWvIVqfz5dPRMXPJZZ3niVJEC5r/vcXyo9Cm3BXZOYes2fNDLrwW9Bs9
         sYJAQpjnQLadZBPbbl3TiOM+lM8Z6Y+IMkR3IzWyMeQq1oh8/i4dmI7Q1XPhiEqcbG7s
         uf06gZDQDhg4QjhfnPTepQYbY11M8nV9BaC7nagSSMeCgM+6opGgWN/Mr6rIrYblN4Iw
         KeDWG2YEIr6rF7uzaziH7eWWTvotnfunGkcH+149VXHt7QbeBovlbb0R/0EPWBNze+hN
         LnMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785467615; x=1786072415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rIs3ybzRs03b5a4Q81m863N9fCRIij9a9SB5EUTbVmM=;
        b=m/0n9a/TRRcdL75jswyrqYwS5/qwUONt0taEmyl1oGoRyfI/BL1TVYeJ+f0OY3NUws
         Fguf3f1Z+rtv+VDxcbEqodM9TNQ3ttd9FGKdKt6XHIXeKLnNGdoch4Ycx0OVlNGNAtGZ
         xiQbBYIuDBCNCcxg7pnelMH0Zo/yIlSXWOeF9M61HjG3+Db51PQl+W7ieqh/+spuFaUK
         aiNFF0OuLQ238RKTKubbTzN4P4ivarFxEglBdMnNc8Ycgs3+nG67F9/Fw50AOZxknlH/
         ncgd5cRSrpqTc0e4V2jKNypnaLgLfFYfIbL9oxaA7F33jzHMaEUKP30PaOt5y7a65o1t
         b8EA==
X-Forwarded-Encrypted: i=1; AHgh+RrGQ1E+ArryNmAp9S/ALnpmD5PQpChDwylJBz/OE0G0fv5inZFDrqqt/VQqc1fr5u/ph+tAeJfAtOvQqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3nubnMHy9fHUiHxWdJSH+QzOqdJALBkIFRRV3Il6pFzf6j8p5
	LrqLGr1cxczpl8vm2RDvaaY/MKdlkcarO2NgZlb+3a8UbKyHseqfqB09
X-Gm-Gg: AR+sD11GHfwyMnoZJNvpR/WU28iiWGeg/+4fGc5/pTLd+S4efR/xIFfv0kQpT+8Uv41
	l0EGEM4NwXnTQrhtYfWltL3BCBkzdfHOanuwOOXR1Cup8Y/WLTPwhGyDS6jxbHLzO/ZZGz+4hJh
	HSBoI+DkTqbiOiaDYrHR4NnvQ6Klg9bOzuA1F6X/bh7Bv0muGbyinZxnixOpgXN6JP3KelYehC2
	15Fk1qW7STgbmHS+lZtAhz7vpuOzJ496UQ/zqTUKHm8NuZE3yMlasrB7iV7aNI6HyIVT3nHTwvR
	RnuSXzk9/JnMolXMczkg1ACXNAy20/hrWtsCs1R6sj+6lB0frWGCUZ/qBgYDwdX3EAVGHQ8jlkg
	jKZ69D3MRN7PFFHnT1dlbpYzjkp81hNBfNWvd6rhbsMvzJ5ryvmY8+Qiw3mc5Yqu9b6xncJaM8V
	BAGUNH2a/BVqYDIaHw0ReGwhHPURRhKmLG0Bsx9bflKDBvYYeNuCCE6jJhsHkZ/tR3D+VWSoO6W
	AL/8FdA6HUZLYlK4Ke/tEqFocGmUbJyd99pBgaeKW1MVtfvnmm1BtQiZ7xawzpcL+F5Noscg4Tj
	DALM
X-Received: by 2002:a17:903:2ecf:b0:2c7:f4bd:91b5 with SMTP id d9443c01a7336-2d046aefc4dmr4902305ad.0.1785467614690;
        Thu, 30 Jul 2026 20:13:34 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d047ae9f31sm737595ad.60.2026.07.30.20.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 20:13:33 -0700 (PDT)
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
Subject: [PATCH v3 25/26] ASoC: codecs: wm_adsp: Use guard() for mutex locks
Date: Fri, 31 Jul 2026 10:06:47 +0700
Message-ID: <20260731030648.8706-26-phucduc.bui@gmail.com>
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

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Add Reviewed-by tag from Richard Fitzgerald.
Changes in v2:
 - Add the missing `guard(mutex)` that was inadvertently omitted.

 sound/soc/codecs/wm_adsp.c | 77 ++++++++++++--------------------------
 1 file changed, 23 insertions(+), 54 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index baa75e7ff53b..90c24c4b318e 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -348,7 +348,6 @@ int wm_adsp_fw_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	struct wm_adsp *dsp = snd_soc_component_get_drvdata(component);
-	int ret = 1;
 
 	if (ucontrol->value.enumerated.item[0] == dsp[e->shift_l].fw)
 		return 0;
@@ -356,16 +355,14 @@ int wm_adsp_fw_put(struct snd_kcontrol *kcontrol,
 	if (ucontrol->value.enumerated.item[0] >= WM_ADSP_NUM_FW)
 		return -EINVAL;
 
-	mutex_lock(&dsp[e->shift_l].cs_dsp.pwr_lock);
+	guard(mutex)(&dsp[e->shift_l].cs_dsp.pwr_lock);
 
 	if (dsp[e->shift_l].cs_dsp.booted || !list_empty(&dsp[e->shift_l].compr_list))
-		ret = -EBUSY;
+		return -EBUSY;
 	else
 		dsp[e->shift_l].fw = ucontrol->value.enumerated.item[0];
 
-	mutex_unlock(&dsp[e->shift_l].cs_dsp.pwr_lock);
-
-	return ret;
+	return 1;
 }
 EXPORT_SYMBOL_GPL(wm_adsp_fw_put);
 
@@ -450,15 +447,13 @@ static int wm_coeff_put_acked(struct snd_kcontrol *kctl,
 	if (val == 0)
 		return 0;	/* 0 means no event */
 
-	mutex_lock(&cs_ctl->dsp->pwr_lock);
+	guard(mutex)(&cs_ctl->dsp->pwr_lock);
 
 	if (cs_ctl->enabled)
 		ret = cs_dsp_coeff_write_acked_control(cs_ctl, val);
 	else
 		ret = -EPERM;
 
-	mutex_unlock(&cs_ctl->dsp->pwr_lock);
-
 	if (ret < 0)
 		return ret;
 
@@ -486,15 +481,13 @@ static int wm_coeff_tlv_get(struct snd_kcontrol *kctl,
 	struct cs_dsp_coeff_ctl *cs_ctl = ctl->cs_ctl;
 	int ret = 0;
 
-	mutex_lock(&cs_ctl->dsp->pwr_lock);
+	guard(mutex)(&cs_ctl->dsp->pwr_lock);
 
 	ret = cs_dsp_coeff_read_ctrl(cs_ctl, 0, cs_ctl->cache, size);
 
 	if (!ret && copy_to_user(bytes, cs_ctl->cache, size))
 		ret = -EFAULT;
 
-	mutex_unlock(&cs_ctl->dsp->pwr_lock);
-
 	return ret;
 }
 
@@ -694,10 +687,9 @@ int wm_adsp_write_ctl(struct wm_adsp *dsp, const char *name, int type,
 	struct cs_dsp_coeff_ctl *cs_ctl;
 	int ret;
 
-	mutex_lock(&dsp->cs_dsp.pwr_lock);
+	guard(mutex)(&dsp->cs_dsp.pwr_lock);
 	cs_ctl = cs_dsp_get_ctl(&dsp->cs_dsp, name, type, alg);
 	ret = cs_dsp_coeff_write_ctrl(cs_ctl, 0, buf, len);
-	mutex_unlock(&dsp->cs_dsp.pwr_lock);
 
 	if (ret < 0)
 		return ret;
@@ -709,14 +701,10 @@ EXPORT_SYMBOL_GPL(wm_adsp_write_ctl);
 int wm_adsp_read_ctl(struct wm_adsp *dsp, const char *name, int type,
 		     unsigned int alg, void *buf, size_t len)
 {
-	int ret;
+	guard(mutex)(&dsp->cs_dsp.pwr_lock);
 
-	mutex_lock(&dsp->cs_dsp.pwr_lock);
-	ret = cs_dsp_coeff_read_ctrl(cs_dsp_get_ctl(&dsp->cs_dsp, name, type, alg),
+	return cs_dsp_coeff_read_ctrl(cs_dsp_get_ctl(&dsp->cs_dsp, name, type, alg),
 				     0, buf, len);
-	mutex_unlock(&dsp->cs_dsp.pwr_lock);
-
-	return ret;
 }
 EXPORT_SYMBOL_GPL(wm_adsp_read_ctl);
 
@@ -1270,38 +1258,32 @@ int wm_adsp_compr_open(struct wm_adsp *dsp, struct snd_compr_stream *stream)
 {
 	struct wm_adsp_compr *compr, *tmp;
 	struct snd_soc_pcm_runtime *rtd = stream->private_data;
-	int ret = 0;
 
-	mutex_lock(&dsp->cs_dsp.pwr_lock);
+	guard(mutex)(&dsp->cs_dsp.pwr_lock);
 
 	if (wm_adsp_fw[dsp->fw].num_caps == 0) {
 		adsp_err(dsp, "%s: Firmware does not support compressed API\n",
 			 snd_soc_rtd_to_codec(rtd, 0)->name);
-		ret = -ENXIO;
-		goto out;
+		return -ENXIO;
 	}
 
 	if (wm_adsp_fw[dsp->fw].compr_direction != stream->direction) {
 		adsp_err(dsp, "%s: Firmware does not support stream direction\n",
 			 snd_soc_rtd_to_codec(rtd, 0)->name);
-		ret = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	list_for_each_entry(tmp, &dsp->compr_list, list) {
 		if (!strcmp(tmp->name, snd_soc_rtd_to_codec(rtd, 0)->name)) {
 			adsp_err(dsp, "%s: Only a single stream supported per dai\n",
 				 snd_soc_rtd_to_codec(rtd, 0)->name);
-			ret = -EBUSY;
-			goto out;
+			return -EBUSY;
 		}
 	}
 
 	compr = kzalloc_obj(*compr);
-	if (!compr) {
-		ret = -ENOMEM;
-		goto out;
-	}
+	if (!compr)
+		return -ENOMEM;
 
 	compr->dsp = dsp;
 	compr->stream = stream;
@@ -1311,10 +1293,7 @@ int wm_adsp_compr_open(struct wm_adsp *dsp, struct snd_compr_stream *stream)
 
 	stream->runtime->private_data = compr;
 
-out:
-	mutex_unlock(&dsp->cs_dsp.pwr_lock);
-
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(wm_adsp_compr_open);
 
@@ -1324,7 +1303,7 @@ int wm_adsp_compr_free(struct snd_soc_component *component,
 	struct wm_adsp_compr *compr = stream->runtime->private_data;
 	struct wm_adsp *dsp = compr->dsp;
 
-	mutex_lock(&dsp->cs_dsp.pwr_lock);
+	guard(mutex)(&dsp->cs_dsp.pwr_lock);
 
 	wm_adsp_compr_detach(compr);
 	list_del(&compr->list);
@@ -1332,8 +1311,6 @@ int wm_adsp_compr_free(struct snd_soc_component *component,
 	kfree(compr->raw_buf);
 	kfree(compr);
 
-	mutex_unlock(&dsp->cs_dsp.pwr_lock);
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(wm_adsp_compr_free);
@@ -1741,7 +1718,7 @@ int wm_adsp_compr_trigger(struct snd_soc_component *component,
 
 	compr_dbg(compr, "Trigger: %d\n", cmd);
 
-	mutex_lock(&dsp->cs_dsp.pwr_lock);
+	guard(mutex)(&dsp->cs_dsp.pwr_lock);
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
@@ -1777,8 +1754,6 @@ int wm_adsp_compr_trigger(struct snd_soc_component *component,
 		break;
 	}
 
-	mutex_unlock(&dsp->cs_dsp.pwr_lock);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(wm_adsp_compr_trigger);
@@ -1907,21 +1882,20 @@ int wm_adsp_compr_pointer(struct snd_soc_component *component,
 
 	compr_dbg(compr, "Pointer request\n");
 
-	mutex_lock(&dsp->cs_dsp.pwr_lock);
+	guard(mutex)(&dsp->cs_dsp.pwr_lock);
 
 	buf = compr->buf;
 
 	if (dsp->fatal_error || !buf || buf->error) {
 		snd_compr_stop_error(stream, SNDRV_PCM_STATE_XRUN);
-		ret = -EIO;
-		goto out;
+		return -EIO;
 	}
 
 	if (buf->avail < wm_adsp_compr_frag_words(compr)) {
 		ret = wm_adsp_buffer_update_avail(buf);
 		if (ret < 0) {
 			compr_err(compr, "Error reading avail: %d\n", ret);
-			goto out;
+			return ret;
 		}
 
 		/*
@@ -1934,14 +1908,14 @@ int wm_adsp_compr_pointer(struct snd_soc_component *component,
 				if (buf->error)
 					snd_compr_stop_error(stream,
 							SNDRV_PCM_STATE_XRUN);
-				goto out;
+				return ret;
 			}
 
 			ret = wm_adsp_buffer_reenable_irq(buf);
 			if (ret < 0) {
 				compr_err(compr, "Failed to re-enable buffer IRQ: %d\n",
 					  ret);
-				goto out;
+				return ret;
 			}
 		}
 	}
@@ -1950,9 +1924,6 @@ int wm_adsp_compr_pointer(struct snd_soc_component *component,
 	tstamp->copied_total += buf->avail * CS_DSP_DATA_WORD_SIZE;
 	tstamp->sampling_rate = compr->sample_rate;
 
-out:
-	mutex_unlock(&dsp->cs_dsp.pwr_lock);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(wm_adsp_compr_pointer);
@@ -2063,15 +2034,13 @@ int wm_adsp_compr_copy(struct snd_soc_component *component,
 	struct wm_adsp *dsp = compr->dsp;
 	int ret;
 
-	mutex_lock(&dsp->cs_dsp.pwr_lock);
+	guard(mutex)(&dsp->cs_dsp.pwr_lock);
 
 	if (stream->direction == SND_COMPRESS_CAPTURE)
 		ret = wm_adsp_compr_read(compr, buf, count);
 	else
 		ret = -ENOTSUPP;
 
-	mutex_unlock(&dsp->cs_dsp.pwr_lock);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(wm_adsp_compr_copy);
-- 
2.43.0

