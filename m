Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DDD3F0761
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 11:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781780996; cv=none; b=cZKU6GtJMyWcF58ry4qxJeNLNKzs4f4MwOKI9ghc0QQRxVf5MIzY+P2QBjKc42LfOiZSIv1acj+xTjrzleg0l+m7LAAeirnXf6llKQJKOK8j4/KFNaPM/Rk1O5ueFifnlVdcI27InYWj1esr1Em0aR+AGBExdF+a3hvAKv5f9rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781780996; c=relaxed/simple;
	bh=c5O372q2rjDQ5irwM8M2Qw2a9PpNWbTIU2zvtjVkg3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qOyvPtjnOxOGfW0IrIDqrTfAKyFXh5wsMYepSLJl5CNp0NcrjGqhc3fyEr9lFkVl9n/cOIAfnSv0WseqQsWmOMakESSW0muRYqoxKMXbAWYbKqPGQ+mCw+L6OfhdyK8RvwMHpUI85CXXAVnG4W0RZ/iX03LS7XvsRhFHH7HEE6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P2odMtNi; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P2odMtNi"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c6bdb8a8bdso5162235ad.1
        for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 04:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781780994; x=1782385794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mr2TzHHPLOZ5QRNblYXdE64EZ52E5yqz/2kOl9/QETA=;
        b=P2odMtNi4ekrY7FGzwvuo1EoYz29VA6T1m8pNyIMF9ilPNRAHDF2W1IBKH6s6pTgBG
         niPpdunOnieE6AyR1ej5b+ReNitvpeQO6iS/XER4AWx5VeMCbPVFADqZlXIAg+ZYny9r
         2mnw6S+A92G+D5WI+WZeTk4N1MNBWR+zyjIYZFkunNMcxdLxjqoioyme+Zf4nLHX9bQq
         WYSMcg1E7js0G9aGJmFdfSd0o5b0wGLRBZSGqnBIbrpHp8+BOSifOM0uTeojTXuRFwyQ
         tvZsoLBIJaA6Y4Xa8mO2f83bI11yTDFJYkgfHX+0VBOMszKf2735ZT+UJdAAvZGPkh/J
         Hsbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781780994; x=1782385794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mr2TzHHPLOZ5QRNblYXdE64EZ52E5yqz/2kOl9/QETA=;
        b=MIm5hIVHhY66vog2kSN1UobGlHR2gHaeBqxt/mGhjOsOu7GgWHGXwGWDzfBLNgrymE
         EgB2qiPg+uFv4t2HzJXWJYtMvQkatNTWDrzcLWL+8Q+hOm9y1x/Je1wl3PT7yKOthp9m
         VrzSbqAKa4lSjS0tkigDk3adJx31WJ7E4q8WkGckGE6Uz7dwLs3PJkwCx363LdnLeHUj
         44Kcv4ZmHdsV4XbuzyMw4yUOXFaJpBKWOL1FnAAQmM26jF0JO93He31CKjBq/xqsROld
         uqCNKRTxS3IQaNojNaUhBsh723Oc0wtzYwUNQ6G/5hKAYWrLpw4F1WB3BNzvihc6Hi/w
         nbeA==
X-Forwarded-Encrypted: i=1; AFNElJ+BJkvZKPnB9q9sxtdzlEZyhTU+W4NE2mBa2Er2fmejdtyMbdfNDXMzOcYakQ62eI2CjoXoPeL6LbnlEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPXonh060xWrlTCdC5fq6Str/p6l20xKiI8YDhc6y6maIkc4/r
	ky+EgmpcdRN+xlG/qpvwhzCpcqzbR2DawlCyNpw9BbGhmAJneXX4UoSZ
X-Gm-Gg: AfdE7cmfts9viysUm87NEmHXc1J4l7D9t99tH7L1Lxg/yQVsHuxbEvZ5bri2JDcTTYb
	+dGUUhgz3Lkrhg5fzoqJuax1UHCX2KDbWJNF30RWocKZdlpxcrEbyyCjV3X7+y+YgRUet6KFI5h
	ywDiCdW+ZjxlMSvDUqdhP/EynEouLU0o+/M8DMfAPU7euk2BoW9O4c1+ZDL+zu3FehxM7dEuG9i
	XXL9/+5KfzF4JBGfOUoxDTpmrsFyzJhc+i7udGPskf9pJQvZMFIAMPeo2Jslp6YDVhr9YCKeDUm
	91SEzrmJzruqiU6c1s0KWO/3PrWckNu6FSBJ5T75RicxF6fmYHXnbuWn37ag4SiTXc8OtI0pwbW
	J1tQf7ZNyf1UvCCQJTT+HAF8imcqH5TTupEg6smneh8/HV2nGeQOQIXb40FllbrtF6nx0UbMa7u
	37b1c/uB/uDMrW5I8oNSaRLAbUhIHHcqzyS8fIIKJeoNFQoZ0=
X-Received: by 2002:a17:903:1b6f:b0:2bf:77b2:8b2d with SMTP id d9443c01a7336-2c6bc25ca62mr81275545ad.30.1781780994455;
        Thu, 18 Jun 2026 04:09:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:09:54 -0700 (PDT)
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
Subject: [PATCH 64/78] ASoC: codecs: wcd934x: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:13 +0700
Message-ID: <20260618110827.232983-8-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wcd934x.c | 46 ++++++++++++++++----------------------
 1 file changed, 19 insertions(+), 27 deletions(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index bc41a1466c70..817ad53595fc 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -1265,13 +1265,12 @@ static int wcd934x_set_sido_input_src(struct wcd934x_codec *wcd, int sido_src)
 
 static int wcd934x_enable_ana_bias_and_sysclk(struct wcd934x_codec *wcd)
 {
-	mutex_lock(&wcd->sysclk_mutex);
-
-	if (++wcd->sysclk_users != 1) {
-		mutex_unlock(&wcd->sysclk_mutex);
-		return 0;
+	scoped_guard(mutex, &wcd->sysclk_mutex) {
+		if (++wcd->sysclk_users != 1) {
+			mutex_unlock(&wcd->sysclk_mutex);
+			return 0;
+		}
 	}
-	mutex_unlock(&wcd->sysclk_mutex);
 
 	regmap_update_bits(wcd->regmap, WCD934X_ANA_BIAS,
 			   WCD934X_ANA_BIAS_EN_MASK,
@@ -1328,12 +1327,12 @@ static int wcd934x_enable_ana_bias_and_sysclk(struct wcd934x_codec *wcd)
 
 static int wcd934x_disable_ana_bias_and_syclk(struct wcd934x_codec *wcd)
 {
-	mutex_lock(&wcd->sysclk_mutex);
-	if (--wcd->sysclk_users != 0) {
-		mutex_unlock(&wcd->sysclk_mutex);
-		return 0;
+	scoped_guard(mutex, &wcd->sysclk_mutex) {
+		if (--wcd->sysclk_users != 0) {
+			mutex_unlock(&wcd->sysclk_mutex);
+			return 0;
+		}
 	}
-	mutex_unlock(&wcd->sysclk_mutex);
 
 	regmap_update_bits(wcd->regmap, WCD934X_CLK_SYS_MCLK_PRG,
 			   WCD934X_EXT_CLK_BUF_EN_MASK |
@@ -2384,7 +2383,7 @@ static int wcd934x_micbias_control(struct snd_soc_component *component,
 			__func__, micb_num);
 		return -EINVAL;
 	}
-	mutex_lock(&wcd934x->micb_lock);
+	guard(mutex)(&wcd934x->micb_lock);
 
 	switch (req) {
 	case MICB_PULLUP_ENABLE:
@@ -2446,8 +2445,6 @@ static int wcd934x_micbias_control(struct snd_soc_component *component,
 		break;
 	}
 
-	mutex_unlock(&wcd934x->micb_lock);
-
 	return 0;
 }
 
@@ -2488,7 +2485,7 @@ static int wcd934x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 					    int req_volt, int micb_num)
 {
 	struct wcd934x_codec *wcd934x = snd_soc_component_get_drvdata(component);
-	int cur_vout_ctl, req_vout_ctl, micb_reg, micb_en, ret = 0;
+	int cur_vout_ctl, req_vout_ctl, micb_reg, micb_en;
 
 	switch (micb_num) {
 	case MIC_BIAS_1:
@@ -2506,7 +2503,7 @@ static int wcd934x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 	default:
 		return -EINVAL;
 	}
-	mutex_lock(&wcd934x->micb_lock);
+	guard(mutex)(&wcd934x->micb_lock);
 	/*
 	 * If requested micbias voltage is same as current micbias
 	 * voltage, then just return. Otherwise, adjust voltage as
@@ -2521,15 +2518,11 @@ static int wcd934x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
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
@@ -2550,9 +2543,8 @@ static int wcd934x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
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

