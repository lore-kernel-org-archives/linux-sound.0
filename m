Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257453A4F51
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 04:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784782627; cv=none; b=Xgap071t4MBnr75BSiqS0wwBH2ki1+mzTzIe0h+vOj8+rAkGlqQUbiSOCzaFTnfwux6OTirJLgWEQb5zC+CgbI3WmuFGAdVUS3Dxm28t9GtYOkSI0P3Rdp4xYtw12AYsBpyilcSFEIiK9Yy++6rIonVB9ezl9OSlOilF887nDnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784782627; c=relaxed/simple;
	bh=Nwz58X1PCnQd0Jse3bQ1ZJ1IieSp/vhqwgf6xrW+MB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OuUIUJc7jheKH0WNS/4ovJKXCsToKJ7KIIRsUoFj3MMOxcz4FgV2hyGomoVbKLIL0bzku3fgKbbEATczG4P1G6w+bfQKLsAqfmMYjwyfKBBOVrQKlzSPVMu9rcjDdCWqPfRVZIse/YgChlr4j4UNwbRSMr7JIz6b7g0JNPsRjsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hPCdS0v0; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hPCdS0v0"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so190964a91.0
        for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 21:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784782612; x=1785387412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vph9mPIOkBC69ufOR2Dc/z1d7siOErcoyCyrp5zLzUg=;
        b=hPCdS0v0FH/2kHfo/wNE4PJlAwkPvjWmtXY7S2GwR7A/IL1GqIvjL1o3wtsEKgP0TI
         bO8kBNRz6cd9+fu/wf57irqbdqIJEKKgXjzTAFdp/+hutN4o8Xn5xOCCIzzDV23bSpYC
         Mn2GLp4INjkOqztBkH8ayqjisT5i8AMQs/bhvknnFU9te3XKMd0T5X4WhYtuAVutak+Q
         qyeZO1qTOPMBWpDXxVzQk9GBkw/D4zUCOwWRBj4qoFb7GeBuAgyAyfqM8t7NLnt/I2zp
         sxaS55S1ogl/CyF+jlO2cxb7dmM/PPyRSvS3LHEUhOzMUH6AJQtSJyKoouo2lzbiuPMd
         e5tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784782612; x=1785387412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vph9mPIOkBC69ufOR2Dc/z1d7siOErcoyCyrp5zLzUg=;
        b=QNAoLKuKbYmH+PEBZITOlF6moRaGdNVApniLGGb65UQyQSANuUz3brlASg/8f0+4KR
         uS/MA2Ud4yjyK/hijXPc3eArMCsFiyv/wFCdGB8DT+gkaGQ+bgudSigFXpu3aZFcv0CY
         0wRsw8QN7Aqr2gG67Z0xJM+6ez9Z4jMagZ8CZ9qKw9fqTdeqP70wIktgIJ0WOUq1u6cl
         dyYdw2rr+LZZDx+4+Bdpror3+xLWJsL3c3I5IUAnZ0jl7HU0lKkVV7kuh18Zv5hAIrUo
         jQbysPQgo2pu5RFExaWK7mcDISjUxEfF2fXBlWq0ZM8bx79F3M9nJN9Vk6VR3AoAVamE
         1/xw==
X-Forwarded-Encrypted: i=1; AHgh+RpkXqDxLyL0UkC21fnx3VQA0jCQr/Am+fGpvRQZNX6V6N2D9gqGOCY7DKWKSy0mEyDzwb+QLWqu8i8Alw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4oMvZrKiPyhZdE2f1j9d9FaFDLzO1GU5Atw3MsDGVuwwRe+lb
	Za8oakSqNzPAWX70FQ1HRR4/ACF2I1+29E319I4qcIJ5nZ6XbiaXy+nc
X-Gm-Gg: AR+sD11amSuNLMfK5nYcmmd8uiLWxT4+Vx1BZ3P8cN5dwFuYH630UObC9ugCxb5Tj2C
	km9q/t6PXfMpKHkkL5wrGDpiB/oTabN+sZq/3pZfNDGanp3PmgNDjSHC6fMpgtxK4texlk1mvCR
	x6xGGZJjKWDVcxYpn+678FGO8f1cnqEDy8XuPMw7v3CgDWjwQ6UQCMlMlFGduK32bGC1j3T7oGZ
	Qq1nDkIa1OMNwaxjpyrjhBAhT/69zJO0xgtCNdcnN/Jc2NHi4qPO040WSVh0behMl3gzBO9682D
	cpr04wHCRumaF4PVDqQ0p/dygFTTK6irt9RInCV2+rhuFvQ2WyYJ1og8o0X8Dqx4oy6Gr9pamSg
	ryqoQQ/zkST8qTaIWZkffW60VIzuShgPn+677ssdEFPlEZ1mq6gx/3KtJb6srRllfJa38NUyUaN
	ufpZI6Qth5oUdmRgtsOuDbRh5fXII4g0XOTF1r
X-Received: by 2002:a17:90b:384a:b0:38e:753f:a6b6 with SMTP id 98e67ed59e1d1-38ec698b6d0mr1404882a91.17.1784782611962;
        Wed, 22 Jul 2026 21:56:51 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfa57542e0sm7258365ad.67.2026.07.22.21.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:56:51 -0700 (PDT)
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
Subject: [PATCH 25/26] ASoC: codecs: wm_adsp: Use guard() for mutex locks
Date: Thu, 23 Jul 2026 11:53:26 +0700
Message-ID: <20260723045327.28260-26-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wm_adsp.c | 77 +++++++++++---------------------------
 1 file changed, 22 insertions(+), 55 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index baa75e7ff53b..cef8472dda8c 100644
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
 
@@ -450,15 +447,11 @@ static int wm_coeff_put_acked(struct snd_kcontrol *kctl,
 	if (val == 0)
 		return 0;	/* 0 means no event */
 
-	mutex_lock(&cs_ctl->dsp->pwr_lock);
-
 	if (cs_ctl->enabled)
 		ret = cs_dsp_coeff_write_acked_control(cs_ctl, val);
 	else
 		ret = -EPERM;
 
-	mutex_unlock(&cs_ctl->dsp->pwr_lock);
-
 	if (ret < 0)
 		return ret;
 
@@ -486,15 +479,13 @@ static int wm_coeff_tlv_get(struct snd_kcontrol *kctl,
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
 
@@ -694,10 +685,9 @@ int wm_adsp_write_ctl(struct wm_adsp *dsp, const char *name, int type,
 	struct cs_dsp_coeff_ctl *cs_ctl;
 	int ret;
 
-	mutex_lock(&dsp->cs_dsp.pwr_lock);
+	guard(mutex)(&dsp->cs_dsp.pwr_lock);
 	cs_ctl = cs_dsp_get_ctl(&dsp->cs_dsp, name, type, alg);
 	ret = cs_dsp_coeff_write_ctrl(cs_ctl, 0, buf, len);
-	mutex_unlock(&dsp->cs_dsp.pwr_lock);
 
 	if (ret < 0)
 		return ret;
@@ -709,14 +699,10 @@ EXPORT_SYMBOL_GPL(wm_adsp_write_ctl);
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
 
@@ -1270,38 +1256,32 @@ int wm_adsp_compr_open(struct wm_adsp *dsp, struct snd_compr_stream *stream)
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
@@ -1311,10 +1291,7 @@ int wm_adsp_compr_open(struct wm_adsp *dsp, struct snd_compr_stream *stream)
 
 	stream->runtime->private_data = compr;
 
-out:
-	mutex_unlock(&dsp->cs_dsp.pwr_lock);
-
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(wm_adsp_compr_open);
 
@@ -1324,7 +1301,7 @@ int wm_adsp_compr_free(struct snd_soc_component *component,
 	struct wm_adsp_compr *compr = stream->runtime->private_data;
 	struct wm_adsp *dsp = compr->dsp;
 
-	mutex_lock(&dsp->cs_dsp.pwr_lock);
+	guard(mutex)(&dsp->cs_dsp.pwr_lock);
 
 	wm_adsp_compr_detach(compr);
 	list_del(&compr->list);
@@ -1332,8 +1309,6 @@ int wm_adsp_compr_free(struct snd_soc_component *component,
 	kfree(compr->raw_buf);
 	kfree(compr);
 
-	mutex_unlock(&dsp->cs_dsp.pwr_lock);
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(wm_adsp_compr_free);
@@ -1741,7 +1716,7 @@ int wm_adsp_compr_trigger(struct snd_soc_component *component,
 
 	compr_dbg(compr, "Trigger: %d\n", cmd);
 
-	mutex_lock(&dsp->cs_dsp.pwr_lock);
+	guard(mutex)(&dsp->cs_dsp.pwr_lock);
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
@@ -1777,8 +1752,6 @@ int wm_adsp_compr_trigger(struct snd_soc_component *component,
 		break;
 	}
 
-	mutex_unlock(&dsp->cs_dsp.pwr_lock);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(wm_adsp_compr_trigger);
@@ -1907,21 +1880,20 @@ int wm_adsp_compr_pointer(struct snd_soc_component *component,
 
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
@@ -1934,14 +1906,14 @@ int wm_adsp_compr_pointer(struct snd_soc_component *component,
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
@@ -1950,9 +1922,6 @@ int wm_adsp_compr_pointer(struct snd_soc_component *component,
 	tstamp->copied_total += buf->avail * CS_DSP_DATA_WORD_SIZE;
 	tstamp->sampling_rate = compr->sample_rate;
 
-out:
-	mutex_unlock(&dsp->cs_dsp.pwr_lock);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(wm_adsp_compr_pointer);
@@ -2063,15 +2032,13 @@ int wm_adsp_compr_copy(struct snd_soc_component *component,
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

