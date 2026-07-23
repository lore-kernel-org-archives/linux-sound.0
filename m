Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157CC3A5E70
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 04:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784782528; cv=none; b=GEEdq/LWggObVcMsvXFls1sW/W/1iZ+GivUqXxsry4+Fm3xqsbdiboj4b/mQ+yWN8YRqHDf7xEmxCVDW3rslERUA+pTfwO3FUWndbC3qezb1pU9wVgJwp5OS2DjG7SVFvivp8xYesp5kA9kfs06OSZc2A2Ju0LZ7EKQlRWONV/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784782528; c=relaxed/simple;
	bh=j5EzUp9GOmwEDgm+25/nvJ3ZrhLORshzsn3d8vYHp/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gqHN36nMl8qjBjNdLhvup3cklbeEl3kn3lRY5mCAAnfK/arIX5lnph/+EboYW3MTkV8uyBM2lSiPR5iELLsMdsrtUDFzXVmG8Oo3iPwYbx04zjKqwKtYCdtLXTXOAdCQjZQe4NQCDHXxP9N6Pfb+ihKo90XLF2iTbjj0Aod0Mx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NV2yn7rb; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NV2yn7rb"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cc891373e0so2811025ad.2
        for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 21:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784782516; x=1785387316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gdWonKZwUM9E97TXsH6QIsXcmSxW8h25KlrkA4nBf18=;
        b=NV2yn7rbiUIN0epKd6Lk9DuqQRi1oTAVqnk/+FWVOqvLqP9aXCiRR56E0eu5oPhOQs
         EKhu1NtP+Qtkmzl/xcZxjzxcjAdEFRE9WGtB6o4e5nvkCJyAx/Q+o0oZMKsZyDOsF6P2
         h3DRtbFh3R+Z/1CHkTIJjoEk9IKRBzQ8BZuXGxSLpDke1ayj8pfXzlwa0s5GfG9XVFuB
         fRTWdAzCyQ2y0fQJaU+QK2ntLNcLSs1ARXzJtSfyWIAMOPqxBgKJR8DCRvyUxntf3PhR
         gtG1msqO0G6dQo4AL5JjV/YYhk1VUSa1uns7qnZP0dY+MDd5TOS8kIkfO7aUJo5u9G4W
         u7jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784782516; x=1785387316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gdWonKZwUM9E97TXsH6QIsXcmSxW8h25KlrkA4nBf18=;
        b=bpZFV7R7worjczyjQ/9UZ/ieEL8//qIFz5EsVJkBtfPslPW60tuwj0gs/0mqmA1Smi
         4+s3rNpaTKTLvSi7qYZubRySKsVPwy9IttTzeoUYThc1HzhjkWhO/x5h2VoY9rmOU6LY
         bNvjmcz+QvEg3aEzILgUNvxcOVvqTQlJPRE/UY23MERA8NecjNISLYBCdTSt0JFj3J6p
         Z6V4fq/1VRy23QuxRvjJyP7cE2hX+K9vm5FIVLIqK5n6CGKDxW+RNpNjL14PK1InSuXF
         A5FVdWdtbNIQwHlFP6yLh1cascpXyrT+0qRxUkoD34aQF1MhN7igPQuDytXGrYg71HPC
         GlHg==
X-Forwarded-Encrypted: i=1; AHgh+Rp/rPiTW98ZSBoxAwAYk2wx3AnTxzrpjV0ZSVQ29bRbSwNYbK1uB79gEcCq/DHd/42YU0dwPS8Jj0RjuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHKqEElZVCZGBDGwOzqlGPdPSSwObcOJBZ/Il7OTGuUWKynYYr
	61fadIh4DFOlCCPFQgRflAXghEpErQ6q5xti4pdp0TQC2ZMwTmRpvbOQ
X-Gm-Gg: AR+sD12ztBjmm2D665RRcFLOt1ALzSmvrDZMvxY4BCZdlPaQl57Fu77VSVVOiEIkrn7
	8lH4eub8fueR/mh5SHDCN+IRnrxhXPDCb6LzzESK4ZQlYQHxDTv0VT7xwED6ck8Iu13wupSry8a
	ZL5iHp0UY6L7GGKvR2UX9R6xRx+sONRgMLm416VeuODO3RMyZyHax65sdzVdVof02b3fISIgNRx
	E2NsvXHpauIUXWFQkpwdwK2Xb1+BYBG3aWvfr7Ek+Fgn4K41ZM4Tw/Pq7FaCtDIrviGfiNjLlru
	sv+o51qV8lWeCbjIpPKB92WG1jqLTjPKpBIzH7r/g/5E1ctT8fpOnIVPK49Cc0Vic2oEnUexEFT
	9XlQRF4CcIOSiJlA+SVvgWX8lO6DD6pKbkc0AKrU78ayzCWkKwPvif2KIvpJ335Wz02+JbqsGsn
	A3g//bX+S9kWakIL/oZDzLCLoYvYSGnKmK42gS
X-Received: by 2002:a17:903:ac6:b0:2cf:9f62:1dcd with SMTP id d9443c01a7336-2cfa6d83500mr22439685ad.32.1784782516322;
        Wed, 22 Jul 2026 21:55:16 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfa57542e0sm7258365ad.67.2026.07.22.21.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:55:16 -0700 (PDT)
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
Subject: [PATCH 12/26] ASoC: codecs: wcd934x: Use guard() for mutex locks
Date: Thu, 23 Jul 2026 11:53:13 +0700
Message-ID: <20260723045327.28260-13-phucduc.bui@gmail.com>
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

