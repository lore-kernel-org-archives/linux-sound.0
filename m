Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88C23F327A
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 09:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145426; cv=none; b=uy3bL4kO4K5V5IRA3+yrACkPJFNYIs/mxraTkCPhT4jVYmiWdCAgxbC3Blbd9XMbekf0dro8FdooS98aQbixIH/tmv9FOzsZ7aJbYaFfV3s5+p5B5M8H5t6TZ+4+tqawzZKjQxFNc0Ak1tY2KU2Ks7tTeuIzu+Swqi89dtWMpQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145426; c=relaxed/simple;
	bh=j5EzUp9GOmwEDgm+25/nvJ3ZrhLORshzsn3d8vYHp/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CRtHPaqUDJ+ZdzJQ3PYhhbSpjinGtK3pBIQb2IuG2K+r++/f7kxfCUh2tLqzr12ij0OmmW4r4Bq7hlQHRGgStPL8/JKhWlNqhDe1af8/70g2W/xEzQe9l7wUyL65BH9Ki8uKc8ch0MzdRJQRc2rN+I/TswAzpBpr4FhlMgPiQhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gA1Ly4o2; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gA1Ly4o2"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso1443200a12.0
        for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 02:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785145424; x=1785750224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gdWonKZwUM9E97TXsH6QIsXcmSxW8h25KlrkA4nBf18=;
        b=gA1Ly4o2Tdk1PU6jUzzMyfKuZ1uI5rdVmz1JVMRwO0xEca/YbR25Lfkp39Fc2YG/8m
         mQj18hUcFM89HIta+CPUOrbVpupOGngyOIZrRFxkZzFXivrYaAXFENW7FSiXOEYruCt8
         N44vu3u7Ys83JZYir8w7v2hSYa6xgCr+vlKo4a3qVAN2FNZOU9sKx8oCCPc30w/XPcAw
         rnKTosiNuyWmThaZ7veJjNHbp7QwqlOsf91K3An0HxjQChHr9Hco2sAZDJTgIu8pFZMw
         6jKn+Avx8qq8Q1YFrWktZM0V3ulXO8qBviq529dk5dRjyXFx6LTEBRgDeMiHrqP4sdIh
         MEyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145424; x=1785750224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gdWonKZwUM9E97TXsH6QIsXcmSxW8h25KlrkA4nBf18=;
        b=i80QAfrVu3C7nONkfKiVIvSqmAnfMqE8hVCR3z4tGW7bsg0AEEjj3dZPKlB2f5jWpN
         yFeT4vwKx5eavb3TvH0luneJ+l+ItC65zA20W9c2PFDd5mux6EdO0OquXT0dN8/wcrZ5
         5ekBJ0X4tQWY2DFn3KlmSBM8oDfFkrhVJWXLX07DPmCyxt6fdR4N3A+z/0giiZ87JDcZ
         vyIh1sHCRXi/uj3lwfCek6apEoyjcriscrAqXtqypx+/mrjfB+QZ2SfKeZdko2Lcw23T
         VMMv1TzXJeztJd1NeAskFtQXC+6vctncpTJeGVFSUa2mwJmY3ex6j17Xrbs33HxmGQ5N
         U4RQ==
X-Forwarded-Encrypted: i=1; AHgh+RpJcz9syz2ctnnZ+CkF4wDMsa5FmKy8Za4laOoljf3+pO8BQRE68Nn7KDi1KG9WVc+LcwPLLKChAecVFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPNQL8FWmnssaybfOmyFYToriJ5PWAu0qlkSLe5I8r4c7knkcl
	+daZe6r1Td/vZeOB9O7l0GFu52jfaEOcGbv9+6y8eWBbsk4S+DnMaLhf
X-Gm-Gg: AR+sD12FD7ogisC6MLwxfLjr0BWjdSwLorzA/YZl8WIKjL8keEbsu2yezMNbKe1jnZ5
	C93CrGaL5sGsoYskqftGdAv7kOkJY/+Uuv3Nd1dfo0eubaJfLVo6O32kI2wyZahGZxAszYcY/ks
	jFjY3yBCutrANsmsR/mfDSjaL8vmRMXVL26tFF74bRTGwhFcpTCrSV52G4fb5P+z5nqDyQmAR2/
	F8u3zSSdb9H0bAdXXBiTc8+SK60sJcQQEe00mqbR0TURya5OAhQxpVcOy0NbK+aavkDJclTqEWh
	X/vMs0NCsk+cSnW9yD9Vmpu/wctkYWk66EbSVcMpQoVjqTa9iyxIBOtxcjoIJ/b2AT5/IqMOHhD
	DK2NQg1/BqyMIhlQDwN7mbEEZBrG+kMubMA4hqmA9KLZNBEwGgOGnfO0hF71vNvwiIRe6ZVwgZ3
	OXm0XJtSWSllPVqesQ6x6ouC5CTlwmqpV5Lm4FYGureAvnKmrbpxQrKzLhYrFyHK5qnZQ5zkdKO
	K/x2qO6BximFdIW5jHdXQ==
X-Received: by 2002:a05:6a21:7a8c:b0:3bf:a0e5:99a5 with SMTP id adf61e73a8af0-3c67e072571mr7606700637.47.1785145424179;
        Mon, 27 Jul 2026 02:43:44 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66b5ffesm2959018a12.19.2026.07.27.02.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:43:43 -0700 (PDT)
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
Subject: [PATCH v2 12/26] ASoC: codecs: wcd934x: Use guard() for mutex locks
Date: Mon, 27 Jul 2026 16:40:32 +0700
Message-ID: <20260727094046.23001-13-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wcd934x.c | 42 ++++++++++++++------------------------
 1 file changed, 15 insertions(+), 27 deletions(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index bc41a1466c70..11108c37648f 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -1265,13 +1265,10 @@ static int wcd934x_set_sido_input_src(struct wcd934x_codec *wcd, int sido_src)
 
 static int wcd934x_enable_ana_bias_and_sysclk(struct wcd934x_codec *wcd)
 {
-	mutex_lock(&wcd->sysclk_mutex);
-
-	if (++wcd->sysclk_users != 1) {
-		mutex_unlock(&wcd->sysclk_mutex);
-		return 0;
+	scoped_guard(mutex, &wcd->sysclk_mutex) {
+		if (++wcd->sysclk_users != 1)
+			return 0;
 	}
-	mutex_unlock(&wcd->sysclk_mutex);
 
 	regmap_update_bits(wcd->regmap, WCD934X_ANA_BIAS,
 			   WCD934X_ANA_BIAS_EN_MASK,
@@ -1328,12 +1325,10 @@ static int wcd934x_enable_ana_bias_and_sysclk(struct wcd934x_codec *wcd)
 
 static int wcd934x_disable_ana_bias_and_syclk(struct wcd934x_codec *wcd)
 {
-	mutex_lock(&wcd->sysclk_mutex);
-	if (--wcd->sysclk_users != 0) {
-		mutex_unlock(&wcd->sysclk_mutex);
-		return 0;
+	scoped_guard(mutex, &wcd->sysclk_mutex) {
+		if (--wcd->sysclk_users != 0)
+			return 0;
 	}
-	mutex_unlock(&wcd->sysclk_mutex);
 
 	regmap_update_bits(wcd->regmap, WCD934X_CLK_SYS_MCLK_PRG,
 			   WCD934X_EXT_CLK_BUF_EN_MASK |
@@ -2384,7 +2379,7 @@ static int wcd934x_micbias_control(struct snd_soc_component *component,
 			__func__, micb_num);
 		return -EINVAL;
 	}
-	mutex_lock(&wcd934x->micb_lock);
+	guard(mutex)(&wcd934x->micb_lock);
 
 	switch (req) {
 	case MICB_PULLUP_ENABLE:
@@ -2446,8 +2441,6 @@ static int wcd934x_micbias_control(struct snd_soc_component *component,
 		break;
 	}
 
-	mutex_unlock(&wcd934x->micb_lock);
-
 	return 0;
 }
 
@@ -2488,7 +2481,7 @@ static int wcd934x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 					    int req_volt, int micb_num)
 {
 	struct wcd934x_codec *wcd934x = snd_soc_component_get_drvdata(component);
-	int cur_vout_ctl, req_vout_ctl, micb_reg, micb_en, ret = 0;
+	int cur_vout_ctl, req_vout_ctl, micb_reg, micb_en;
 
 	switch (micb_num) {
 	case MIC_BIAS_1:
@@ -2506,7 +2499,7 @@ static int wcd934x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 	default:
 		return -EINVAL;
 	}
-	mutex_lock(&wcd934x->micb_lock);
+	guard(mutex)(&wcd934x->micb_lock);
 	/*
 	 * If requested micbias voltage is same as current micbias
 	 * voltage, then just return. Otherwise, adjust voltage as
@@ -2521,15 +2514,11 @@ static int wcd934x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 						    WCD934X_MICB_VAL_MASK);
 
 	req_vout_ctl = wcd_get_micb_vout_ctl_val(component->dev, req_volt);
-	if (req_vout_ctl < 0) {
-		ret = -EINVAL;
-		goto exit;
-	}
+	if (req_vout_ctl < 0)
+		return -EINVAL;
 
-	if (cur_vout_ctl == req_vout_ctl) {
-		ret = 0;
-		goto exit;
-	}
+	if (cur_vout_ctl == req_vout_ctl)
+		return 0;
 
 	if (micb_en == WCD934X_MICB_ENABLE)
 		snd_soc_component_write_field(component, micb_reg,
@@ -2550,9 +2539,8 @@ static int wcd934x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 		 */
 		usleep_range(2000, 2100);
 	}
-exit:
-	mutex_unlock(&wcd934x->micb_lock);
-	return ret;
+
+	return 0;
 }
 
 static int wcd934x_mbhc_micb_ctrl_threshold_mic(struct snd_soc_component *component,
-- 
2.43.0

