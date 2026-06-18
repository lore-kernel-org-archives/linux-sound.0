Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928A03EFFAF
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 11:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781780962; cv=none; b=gakAL0uoA9C+QG9q37ClLQ2/Lf0Gl9/MF4emODk1V5A0hc5J3beDbfsEssoVjO/nBi1Qa5r5QDj9HKRAllrn1hd7ZrLfaXf1SfX6rVJYNLOn1xqnDaHbElo1FusJmo7GYXlZ80TmwNf0mQHROQnVurxl1NKZnP0V4AbfN1pSd4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781780962; c=relaxed/simple;
	bh=9eLKKTv14da0IXCzpSeoChYsabAzS0BWIAzAJYA3gf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NAks7JPRIoGtm14KeA9MtfLB/w0XqvLwywR6gJZG3d4O8ciRWDLwtR7TuCdn/JG07vokPv+0VvnrTZpOxFQ8t0rHBWoe3ODsY+XlBt2DSqKuIfmVhD0YGy+/+f9bY2wyQxoP0/u/fgn7HCPISzO7UA//HXi6LPvgmhF1P2qs+xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RkGQ1P6m; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RkGQ1P6m"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2c0c3546924so7058325ad.3
        for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 04:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781780961; x=1782385761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iam6sOaw4t4SQ8HW45BuU6pnPmpQPvQwQp9j/RbUvJo=;
        b=RkGQ1P6mpGVlgbmvuKXLWycsbWSg2mZTO5CpWQ102WpOcGBAMTut+YocZt0L1/I910
         o8VexvmrERWMk3li44zk87sgvVaHYYqIN3ElXtth/UMTkf9hldssoNg/qaho2Pbh/Kxn
         EZapZwxAL1LpXemy+1rsr/OUm0IY7JdHdtKiCTnemnf4A0wvtFeBeFvIljtNauY/pZMI
         +jkexazED7woOJ+wXDNlijihcqLyH2iS3CXQI/JHiV+eIsaTT7g1XKIrl6LAS0p0IaB/
         5GodlxMexovepgeHMAalomwm6x5hNhr8rueFjDTZbZggSZdoMjmp6BvPMhdu/tGiUV0k
         8VUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781780961; x=1782385761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Iam6sOaw4t4SQ8HW45BuU6pnPmpQPvQwQp9j/RbUvJo=;
        b=ZSSQbY2pYl7ZhaDwY+koegjOLrpZ9WwUzUHg5INP0XGEZlxvh9+HHKrNG/yj3gEIOC
         x975JhNd/XgGIMZ/ZVTLTGPJ1D/C2jYvrEMo31Qlj5+AO/+N/nY7Do9ldEuFejCuFUm0
         K7Wk7Az4SO7W7fTOBP4S2498abTBodFSEmM8DkWYc1GUVv+uissaaYQwaOrp9Xv5dKfr
         pyFGWvsVAesHERZrgRUC3dhyK04y5twha3BgMZgiolXu2IpysA6kDdQ0kh3qNYDN74lZ
         Nd3KPpjelZx/Xq/fyCgZhXR11pKARIy/8mOcCEIvURs0GfodKi7W4Wpd4iTklnmttMZJ
         t/tw==
X-Forwarded-Encrypted: i=1; AFNElJ/42m77HvHdF8Y6C307Nwuopp1kDJ4qm0NAT4lizykoTXpVmd0z6JW30knRqSnG9gtySR5CsvOSuZkIug==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwRr3ueECaVJL9OBYJd89s+M/IbcNn4JjO6gCkxAZZDQ39bQJq
	08x2cDhVu9XR2l57BXukybeMZXlmsi/SsREMLIpUv35VJtR2QtDBAtmz
X-Gm-Gg: AfdE7clPAwT+zA1W4fLMdy+g/muJvyyr4Avq8y0pYtx5PDl6Pe8Js3WrVoMbu2mHEgb
	jbRkDunAeizgOcKRLqbo883KAEaaO0JRx3a2dRVrduiUhGfU3FkAdXO3UX9A7r6+TZr+auIzSPx
	pMU3bCQrM1pn9yRei3KaG1466FbUzmKD+M/MVH47xGEcEOz7NYF0CwMxWjcysEroPygKJp2RJqU
	2e46J7J+wwboB7OVbiwSz8T6NpfFkN6KYnEEhRaEBtlKZDh/83LqMQBWytlnlRrDn/Sb7/+3DdD
	4iwV4vVvGBgiUgrzmHUD1u9uXZccEg/AQbQ6/Xx1pp6fTS3U8FMUQV4X9Rw4f++XvJ/QNiC373Z
	Ywn4fk7klOmuYTAVc1iEcSbZI+rVDB9v5HOuC3S20Ow5UA4nhLN75bvVO0Nnj6bPJ9Ud2ouSgrW
	JE3yG7z2XoaQipRC5aZtFLuPOD3CZt52D5FCQXVmt38aEDD3E=
X-Received: by 2002:a17:902:f688:b0:2c6:c66b:4b03 with SMTP id d9443c01a7336-2c6e4746cb1mr34135155ad.10.1781780960796;
        Thu, 18 Jun 2026 04:09:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:09:20 -0700 (PDT)
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
Subject: [PATCH 60/78] ASoC: codecs: tscs42xx: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:09 +0700
Message-ID: <20260618110827.232983-4-phucduc.bui@gmail.com>
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
 sound/soc/codecs/tscs42xx.c | 44 ++++++++++++-------------------------
 1 file changed, 14 insertions(+), 30 deletions(-)

diff --git a/sound/soc/codecs/tscs42xx.c b/sound/soc/codecs/tscs42xx.c
index dba581857920..66810b992935 100644
--- a/sound/soc/codecs/tscs42xx.c
+++ b/sound/soc/codecs/tscs42xx.c
@@ -210,23 +210,21 @@ static int power_up_audio_plls(struct snd_soc_component *component)
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
 
 	ret = 0;
-exit:
-	mutex_unlock(&tscs42xx->pll_lock);
 
 	return ret;
 }
@@ -236,26 +234,24 @@ static int power_down_audio_plls(struct snd_soc_component *component)
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
 
 	ret = 0;
-exit:
-	mutex_unlock(&tscs42xx->pll_lock);
 
 	return ret;
 }
@@ -269,13 +265,11 @@ static int coeff_ram_get(struct snd_kcontrol *kcontrol,
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
 
@@ -290,14 +284,14 @@ static int coeff_ram_put(struct snd_kcontrol *kcontrol,
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
@@ -305,16 +299,12 @@ static int coeff_ram_put(struct snd_kcontrol *kcontrol,
 		if (ret < 0) {
 			dev_err(component->dev,
 				"Failed to flush coeff ram cache (%d)\n", ret);
-			goto exit;
+			return ret;
 		}
 		tscs42xx->coeff_ram_synced = true;
 	}
 
 	ret = 0;
-exit:
-	mutex_unlock(&tscs42xx->pll_lock);
-
-	mutex_unlock(&tscs42xx->coeff_ram_lock);
 
 	return ret;
 }
@@ -385,19 +375,17 @@ static int dac_event(struct snd_soc_dapm_widget *w,
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
 
 	ret = 0;
-exit:
-	mutex_unlock(&tscs42xx->coeff_ram_lock);
 
 	return ret;
 }
@@ -926,12 +914,10 @@ static int setup_sample_rate(struct snd_soc_component *component,
 		return ret;
 	}
 
-	mutex_lock(&tscs42xx->audio_params_lock);
+	guard(mutex)(&tscs42xx->audio_params_lock);
 
 	tscs42xx->samplerate = rate;
 
-	mutex_unlock(&tscs42xx->audio_params_lock);
-
 	return 0;
 }
 
@@ -1253,12 +1239,10 @@ static int tscs42xx_set_dai_bclk_ratio(struct snd_soc_dai *codec_dai,
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

