Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4231345CCA
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 03:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785467496; cv=none; b=Cyxgb8h8GHHRDCoZP9RwKCyizll25+UBasjow1MeqfxOLXHbbN9TAtBob6WxAfro4YKveK9XRnGZ9PSip8ZZdTr49QD/xM+o+eKH5zITFYr1UPRJxNTRaiQ+WNCwwox+7ex9Gmmuv+nWUuDDQk2pHGkhandhclhODAeSawzEc7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785467496; c=relaxed/simple;
	bh=j5EzUp9GOmwEDgm+25/nvJ3ZrhLORshzsn3d8vYHp/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TrcNoefEt0yn8AKl6uJsP+IPnx9SpOoLIvHVnQSCFHcThHfmeHelDzuktvgTFT4SQ02zjkHicAt4iX/jYXfNwvAp6WckDZNBTPEiCcDC7kxy9YNO1qaCuw31enzUlpbS5DhKoT6lpHYcCcjsCcEqmDhivuN7q5DxKNamCYhP/XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bX3up40u; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bX3up40u"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ccf2360620so3639225ad.3
        for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 20:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785467492; x=1786072292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gdWonKZwUM9E97TXsH6QIsXcmSxW8h25KlrkA4nBf18=;
        b=bX3up40uZ6zMkbKLhyfwl1IwXJpAIvH+J5GPxqmA1Cz9yixwTp0SXFdQ/4i7Ai0xxU
         H90vR76EK2OKQgJLNIel+/Ta0UvZ/feyyyMHhmsPkg1RXAObL3iP70czw3Re8z7fRWWG
         czGU+VOXf0xIzVRN06QhTsmmeLbDtSjuohp98M54hWwq37BhT4a6vrl0MTRZart5aBQa
         GOUXCGs0q/heRly5oVReZBri1smdkmh6B0Xu//2YQbzChKVt4+61srrngzCQNAHsHfCR
         Ri9D5Ka2L1nRIzcBitoTXOZ1DXnw/s0Vxada19vD+aDh5EqExIgMfizH2wK+pLMbM3xy
         rT9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785467492; x=1786072292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gdWonKZwUM9E97TXsH6QIsXcmSxW8h25KlrkA4nBf18=;
        b=lHEeLm1gn1NswbXElPxPV5fG/gOwxQ0PyxBxOeDzc4gyiZ1E8procy0ADbX14ZyTYH
         QSJAqdTuXOCi2nbCazYeQMwX7Z/mHJ/fozP3YFyGmq0mbWqeRH228GkzA2/PJE+LL3L4
         lNd20uk3uFAizxE8sNfxU/36rBCWUPWSVBQCMGp+9pyqKIdNtP5FBxn0L6FOoUajFUf7
         M6dk0jQaKo4Pj6c1KFcOizW5mM0jLdI5zIKhUkhLWsQu39uuHiwvVaYyvlHJVtWBq8Ky
         CNY0D0qzeQxRKlZ5YD55u4473ok3fnj2EehGQ5NdHbNRaMoIZS/kpIT0nrCXYcEi17CE
         rRTw==
X-Forwarded-Encrypted: i=1; AHgh+RrKgq1bE2zVM3OXPtg5nVdToyXSykLHrgavcNh/5c6RyVd4Zb6nLqrrChaCUejOgtU5Bz+rPc2Y3aGpMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgnQcT3QdDjGmdxBh+svLziloDQEiDu66EMfzJPtxRel48WeUL
	esK7fYoRpHCdM/jYVvx3axC5QAdmNOtj/KDcmEN2Muf+KmLMKflwSvng
X-Gm-Gg: AR+sD11u6p0i6AxZvPXWDpeNCm1Nl6vMZSHXI3ZcNJbM4WGoTDx6UW8C0Ej8u5K+LDX
	zxRchanIw9rvcDIWh2KWo13EKAG7ozZKQu5Pwx88NsTiwv/cBzwRBkEWM8uiRuO34wAgh9rJCGX
	1zHB5OK7Kc4EfrnXlce8ULMRY81ss0XPL3qL91/FBy2mj2tCIQnRCWv6XwZDitA1G9I73CpATfP
	nbbw8jW0CCUDUNwO6emY4NlSdQlITshsAgYfD9yy+zi97yMbRNfTNenxbZSZzTtPL54jLF56kZg
	bqxQgQD04Ht0xlZK7Wjs75Y2xlWUMSZ16lIttizdYh84NG/o5wODHVfJzhejnnWifMIJ0LNbOkj
	TGSWOFSi48gDvHhaHC+05OJz2uNYiuIR9RpnIi68cDWC6VALtHtDpivZVA7CDrifNTJ22tt3smY
	nhNCYJiNXc9jg+XpiLQ3fAM+r1T9QB6V/30H2WnnqMivhjlaYtLo964FT4aZj6LmHXJpttd1bYj
	sjAQeUV2kQ4/56rlkOQyNdNZ27mmyPIyUPADICmILdnVozAtH0CkbB1FgsxVmcuoocXWj/8CnVZ
	tIYZX8hs/HucxeY=
X-Received: by 2002:a17:903:8c5:b0:2cf:bf32:b754 with SMTP id d9443c01a7336-2d046d66d44mr5106275ad.8.1785467492271;
        Thu, 30 Jul 2026 20:11:32 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d047ae9f31sm737595ad.60.2026.07.30.20.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 20:11:30 -0700 (PDT)
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
Subject: [PATCH v3 12/26] ASoC: codecs: wcd934x: Use guard() for mutex locks
Date: Fri, 31 Jul 2026 10:06:34 +0700
Message-ID: <20260731030648.8706-13-phucduc.bui@gmail.com>
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

