Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795474879;
	b=GYj0kLYu9IS1zFccLkOTaFLIjKCfMePWVfL+PjckdRlZkr2uBd/0/gzeBfTFQMdz4IsM
	 1i5CIx1qcdiCDastSWFvfFPhohSdDBgzcdgRrINo+w5BSJFFwgqw+4HyltI6DMxQNFGok
	 SvZjjmknKplANpt+LGTa/aIixEltsrUQApDZ2M+x/dByj8mPvkHHsz5mDp1D4TLodhQdo
	 rdijlUw+3tLai0CbWwb+8+FMQahvxaXqFE0kGfg206VuCRY4rAxr+8YQPOnp4IulCaHRm
	 4Kc8NrgScUYmZPMYof+xgwoOGK0o5KqD6EDMX+l6HG4YskRaRXgFiUtx2NBlM9mKd3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795474879;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=fhqNj5xrThDOL0uCWjCUGvkw8GyT0Wc2ZFXSoJZgs0s=;
	b=FtfSMqOwOgfCGYHBmDH/XnQkZ+B3BQEOINQhd9XSsaIbOS5zwkt6tkgv/fA8f9sOn3fQ
	 0HMJX2vydzNChB9ZbJzjnKXix1uXBdWO5W0ZYKkPILJ2Wjr6zWXo0B/bW6mYWhWUInUGY
	 YRhNn21z6ZpRxmXeVhhKdkjkeuyPo8LzuKgoOVokPgGbwc/BHtkRCn+HyHuCToZaHCbpJ
	 fHovci4Idw0/5r+BQbSssK3h/Y/jPIT7kaDIExleTbURmAuKsjcsjVtSb6EUbnV2Ez+zX
	 n9oqttgAi6XVfn1tRENI78nJU/umF9PgAGE2m2brF+UiL/7cRKRHaL3pat+V1d1UtgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xYQ4Btq9;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855BA606A68B
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 23:01:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 855BA606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xYQ4Btq9
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-38190551625so7939632eec.1
        for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 15:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795474878; x=1796079678; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fhqNj5xrThDOL0uCWjCUGvkw8GyT0Wc2ZFXSoJZgs0s=;
        b=xYQ4Btq9kSKp2mJmY5JQzel+/qNkm5/FxBfK+fuxwzVMuAvISh8qniZk0GYnBTSGDY
         iepmZESq0yf9pkcc0b4cNigziP3fBZhqCYDYxUI7jLT0D4w3sGaVLSlvvwCHknmbJYgf
         9QRjUEQOUugDhXR/LK6mNctn6h46gikyAL1ddACimIz/6w/F2DL268nwSZJbNgtyr/JL
         GSEeGtwbonWx3K5NiWksxQ5WXgTHdtPlFvvjrRcdFKjeX4kES5R1ynQCHePRWD/mIK5U
         +kisHB493odXjszQHoXwb28SVCEQiZ1KFAXgU9DArAaEN8kJ3Dl0yEhy3nQ/69ZubLMz
         YKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795474878; x=1796079678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fhqNj5xrThDOL0uCWjCUGvkw8GyT0Wc2ZFXSoJZgs0s=;
        b=Es9nTT8inKAHzmoL2VFFEtSzpfF+JtiJSy5WfI4TNdHtoHlexGMtoLGJFB9YotsuBR
         k3D6QvcPWSQcCyS36kEOqkTOCdz2w6W/dTaxIPz/wSuZhkY7jc6dLsH3VP/dVTmzQzNJ
         E3NDtN4QqabyvOhzai6q+fZNddkwGkMQ1QkKPQ14U7Pe8iJnXN0eFiEEHxujWna/R+5e
         lZVp+auHq/8UWTpFHTwJ+UtGLPOXdDkctBvyEkDeFHQSQ6OcCqIevXTz4PRoQwLNIKiV
         EI8YztLyPgJcdagRpmz0guk9yZuwb4nftev1nJMq0/sXXpyFHxOliXwNKrMMLp1VX2+j
         tmVQ==
X-Forwarded-Encrypted: i=1; AL+hErGeBWY/P+ECUwpk5ep3ZcI0rs0UwUr6FmGaQfwd5f453a4QPYZC9fZd+dl2s3ZY2DkoYRV0GEJs0WsvdA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Qs137fgwr55NJkVyuiwpJH+ZXR+M4OU3qQ9+T4cwUPMGomMYB
	ZJMiS6i24XtvRcwZ+M0DhlgScDGEWqX9dIk/GQdSAFv6Qh+vAexuYvES
X-Gm-Gg: AZFdTZeWg2/VtZLtc1c3EIe7pO4uOeDh1Xo/XA7uZJ4h3BlggMEtW68CwXJx7Fach9O
	jL1SMHp2KVVepEsiXbC8TVGtrnyQuyiK+SV+Jw6aJ58sVtmheConZ9w4n/viYA9+/b6uXoFWKv1
	0YLbb/rRSq+PSK9LfD+N7onNVazOuEmx76FHqd8VIpkKG8EEpzuP5rwVm2qkmEY6Mj18y2+KATD
	b/y8t8FQvtIZN9GhCM3BHY8e3F9JM0ShemgsI2pm1n25CPADZEArlalL5LfJnZ+W7Pq1x9nfEw/
	q/kvPC6a3V8TELg1+lDOmuG3cgb5VSRxsxPF2BhM1Bk00Zfq7UzFGpy2FG17sJnbILrYGdLIy3W
	+Vsb9Rc+4VM7TDCFy+469ktLl0s0pxP+DH43Ma+w6uALhSLGZWW6mxrWVXChgQgJdlsJTWVzKk4
	d+Gs6g2nyB3Y9tR8gB3A4f5kEfGibLRb3NVudykWb0G+OFrwytYIi6OebT5Wl9QpbUroycqxgjv
	KyMGgVdFLENWXwQFCvvZgZoH7ZyHSYEQbNjIRLH9Ah3J5XHTTh7mr+6UfMcfATOxjQssd7hsy6k
	N2moIPusL+Ha+v9e88IQ9yaMnRKpZs3eQWOZVbPMD6dvzAYsrQ0mEz2u1Jy5mlD4B1OfrCsUumK
	evZldCQ/h0rF1NtKVsQ==
X-Received: by 2002:a05:693c:808b:b0:386:3535:1dd with SMTP id 5a478bee46e88-3863535052amr11576876eec.12.1795474876743;
        Mon, 23 Nov 2026 15:01:16 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm41359262eec.22.2026.11.23.15.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:01:15 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 23 Nov 2026 15:00:57 -0800
Subject: [PATCH v2 4/4] ASoC: arizona: clean up coding style and formatting
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-arizona-asoc-v2-4-6323d3c0961a@gmail.com>
References: <20261123-arizona-asoc-v2-0-6323d3c0961a@gmail.com>
In-Reply-To: <20261123-arizona-asoc-v2-0-6323d3c0961a@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 David Rhodes <david.rhodes@cirrus.com>, Lee Jones <lee@kernel.org>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev
X-Mailer: b4 0.17-dev-dd645

Clean up minor coding style issues in the Arizona jack detection
driver, removing redundant parentheses and fixing argument continuation
alignment.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 sound/soc/codecs/arizona-jack.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/arizona-jack.c b/sound/soc/codecs/arizona-jack.c
index 5650a7f47ede..6f2286eb7cbe 100644
--- a/sound/soc/codecs/arizona-jack.c
+++ b/sound/soc/codecs/arizona-jack.c
@@ -423,7 +423,7 @@ static int arizona_hpdet_read(struct arizona_priv *info)
 
 		/* Skip up a range, or report? */
 		if (range < ARRAY_SIZE(arizona_hpdet_c_ranges) - 1 &&
-		    (val >= arizona_hpdet_c_ranges[range].max)) {
+		    val >= arizona_hpdet_c_ranges[range].max) {
 			range++;
 			dev_dbg(arizona->dev, "Moving to HPDET range %d-%d\n",
 				arizona_hpdet_c_ranges[range].min,
@@ -436,7 +436,7 @@ static int arizona_hpdet_read(struct arizona_priv *info)
 			return -EAGAIN;
 		}
 
-		if (range && (val < arizona_hpdet_c_ranges[range].min)) {
+		if (range && val < arizona_hpdet_c_ranges[range].min) {
 			dev_dbg(arizona->dev, "Reporting range boundary %d\n",
 				arizona_hpdet_c_ranges[range].min);
 			val = arizona_hpdet_c_ranges[range].min;
@@ -833,8 +833,7 @@ static int arizona_hpdet_wait(struct arizona_priv *info)
 	int i, ret;
 
 	for (i = 0; i < ARIZONA_HPDET_WAIT_COUNT; i++) {
-		ret = regmap_read(arizona->regmap, ARIZONA_HEADPHONE_DETECT_2,
-				&val);
+		ret = regmap_read(arizona->regmap, ARIZONA_HEADPHONE_DETECT_2, &val);
 		if (ret) {
 			dev_err(arizona->dev, "Failed to read HPDET state: %d\n", ret);
 			return ret;
@@ -1143,7 +1142,7 @@ int arizona_jack_codec_dev_probe(struct arizona_priv *info, struct device *dev)
 
 	if (arizona->pdata.gpsw > 0)
 		regmap_update_bits(arizona->regmap, ARIZONA_GP_SWITCH_1,
-				ARIZONA_SW1_MODE_MASK, arizona->pdata.gpsw);
+				   ARIZONA_SW1_MODE_MASK, arizona->pdata.gpsw);
 
 	if (info->micd_modes[0].gpio)
 		mode = GPIOD_OUT_HIGH;
@@ -1155,9 +1154,7 @@ int arizona_jack_codec_dev_probe(struct arizona_priv *info, struct device *dev)
 	 * will reside, but if we devm against that the GPIO
 	 * will not be freed if the extcon driver is unloaded.
 	 */
-	info->micd_pol_gpio = gpiod_get_optional(arizona->dev,
-						 "wlf,micd-pol",
-						 mode);
+	info->micd_pol_gpio = gpiod_get_optional(arizona->dev, "wlf,micd-pol", mode);
 	if (IS_ERR(info->micd_pol_gpio)) {
 		ret = PTR_ERR(info->micd_pol_gpio);
 		dev_err_probe(arizona->dev, ret, "getting microphone polarity GPIO\n");
@@ -1189,13 +1186,13 @@ static int arizona_jack_enable_jack_detect(struct arizona_priv *info,
 		regmap_update_bits(arizona->regmap, ARIZONA_MIC_DETECT_1,
 				   ARIZONA_MICD_BIAS_STARTTIME_MASK,
 				   arizona->pdata.micd_bias_start_time
-				   << ARIZONA_MICD_BIAS_STARTTIME_SHIFT);
+					<< ARIZONA_MICD_BIAS_STARTTIME_SHIFT);
 
 	if (arizona->pdata.micd_rate)
 		regmap_update_bits(arizona->regmap, ARIZONA_MIC_DETECT_1,
 				   ARIZONA_MICD_RATE_MASK,
 				   arizona->pdata.micd_rate
-				   << ARIZONA_MICD_RATE_SHIFT);
+					<< ARIZONA_MICD_RATE_SHIFT);
 
 	switch (arizona->pdata.micd_dbtime) {
 	case MICD_DBTIME_FOUR_READINGS:

-- 
2.56.1.809.ga0b61035b5-goog

