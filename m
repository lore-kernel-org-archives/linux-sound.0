Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56193F0779
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 11:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781004; cv=none; b=fQt6pyAVhJYwzJcxNluXizpGOLv1+LmszAfUILTiON/q+YZ6VNdGz1voWnCoPo/vjPS5Dg71hfLKWHz/71Ie3KO1vs3ciKy320YovcOkcMv/blkiJ4yimSFenJLYzWbAEOZShP2MuxMLMXK4NO6xbEi8wULQgYerT8StN39QZyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781004; c=relaxed/simple;
	bh=r4nP5iq5srzymqWd5sW1nNO9Ilz4j50vuTzEN76jxq8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lIosT3jeNw0KQQTaWMVshcWbG39c+UvfdjkoGeNHoIRmdlroWCGt1jTDhdnx9BJp/c0TScepR94be2UQzoaEPTOsU+GNjQzc6XMuOCjXzIInhjmUhn+FI7PlqCdMV7OoPLY7Flck2fQn5+HBvp56unGObMfIYIuh+86ubknQBXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ffqDHbtG; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ffqDHbtG"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c0b9328c4aso5614955ad.0
        for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 04:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781003; x=1782385803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ml8Dfg8DiRS+hvlcBV4USOy9unLoDNhfJzJGobm3XwQ=;
        b=ffqDHbtGLWvcm5Lo8Z2rNP3qcPMDhvdHjkg5Pd1NcIowD33hZzX+hZhHRhS9jc71Ny
         uWmNlRSbT25iu3SayXWcYnZ+vrALH8cgK7kOV+T/jALPQTvB5PrcwIKZJKQLlCuMpdrg
         jZ8YJQIRkdyuUgltYMtyQ7hlYrK/9ScG4QZjmXshel1EI0w8Ou9PBUvLNyRpKp/lguey
         gtwQQhoPR8CYrisbITJkzEkOuApOXPHCTWGZg13eeLRTOVt2c/6PtXe4Aap05mc6OWUH
         +2h2JI1lvw1pOpTyeyHYj5iDQjXB/9vfuvkgzPJdoZSajSGjEvCdZ56Tlj+jCcYwBZso
         f0lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781003; x=1782385803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ml8Dfg8DiRS+hvlcBV4USOy9unLoDNhfJzJGobm3XwQ=;
        b=MS4ZPtEqwZzE2KQ3zolnvJxxEv1CsXS1T0GwBVjHi+YHsWU4AbrDNOw11KUSAF0L99
         MXJQ5n0V6VirkVXPILTAPxz/ykvE8ueBc5E8+954klIu1vdzATXq2jfrlpxf50L/9VkU
         xMDDr/pg7Nw4jAjhx6qPUCzfSNJgnfEtmDZc0HEO9bJRfDpjMm4fp/7Nn2zWs+nGaOzG
         ZHU5mFqJhi2BbOUEyKqQyzWScQVWMiHrfd/Sp9Q8BzSXIT/yiNJehldRDh6ep63csWQy
         zfqbJ4a1flXllEUetGsa01Ptzdd/ePFMc2w3CCOJGFJsgnGxO0tyeDJKqV7HNAkgDdLb
         +cnQ==
X-Forwarded-Encrypted: i=1; AFNElJ/VidYZm7BWSa9MS2DilI7CCu4Hwy4LLPl6Kx53dO69QpufQcPbiKDjBcFaXnG0O1AQC+6X6GYst+c7Pw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxutkZN9JRLgQC8Elc15WbKfTNzZ71DFED/+bhQaAarP6C9dIsK
	ye5W1qCCUkSc6A9kQcgE/NPmUe5lc8wP6K47N6pN8+UC4jV8OUMJuStR
X-Gm-Gg: AfdE7ckNjW1HTeqQTdrM3RyTZ9JqBKGuFDm3BsKlnbYywfx0qtBPycHVAEKW9Wk02yr
	28hLRB4dDJz4ITqBRB/fWNpgcao7RgJPKKG6DalJ2cTRyy7c9EIMFAORdCUwcSKXcG/sXKltCkE
	7FRxs8MLmQrAHft52keqM67FwnT3eFU0PWmR8uWcUrHqw5TcmAHkfiSJdegqtKGWA0D3XRGPR/Z
	fHXe4WNZ0eMEYMmDtdU+c+tc5Rnwm3eYgRAw05roL3qQ8OFUD96POun/6jwIYr5CNIYBCAyjCdL
	yyl9msL2aMPRR4b1mbbCrQa1Plw6y4pg7uadeQ8TXjcTCAhHbVY+uJOhEMTNi32K3zq5nCC5jqM
	fxKbJrcpcwwkb9lSo+zLCWAZZ4Qv89N7rrkoO+ctgSihv3mYqfWN1d3cIh+haQgWXDzTdBpCIOY
	9oqXmGItZfaCe/yK4gm5Q5B2OLLZzfb9w/VViyxkQvFZJSKwY=
X-Received: by 2002:a17:903:249:b0:2b2:ec46:dfed with SMTP id d9443c01a7336-2c6f347409fmr21914825ad.31.1781781003000;
        Thu, 18 Jun 2026 04:10:03 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:10:02 -0700 (PDT)
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
Subject: [PATCH 65/78] ASoC: codecs: wcd937x: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:14 +0700
Message-ID: <20260618110827.232983-9-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wcd937x.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index e0169e783ee9..8336316866ea 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -1056,7 +1056,7 @@ static int wcd937x_micbias_control(struct snd_soc_component *component,
 		return -EINVAL;
 	}
 
-	mutex_lock(&wcd937x->micb_lock);
+	guard(mutex)(&wcd937x->micb_lock);
 	switch (req) {
 	case MICB_PULLUP_ENABLE:
 		wcd937x->pullup_ref[micb_index]++;
@@ -1136,7 +1136,6 @@ static int wcd937x_micbias_control(struct snd_soc_component *component,
 		}
 		break;
 	}
-	mutex_unlock(&wcd937x->micb_lock);
 
 	return 0;
 }
@@ -1460,7 +1459,7 @@ static int wcd937x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 					    int req_volt, int micb_num)
 {
 	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
-	int cur_vout_ctl, req_vout_ctl, micb_reg, micb_en, ret = 0;
+	int cur_vout_ctl, req_vout_ctl, micb_reg, micb_en;
 
 	switch (micb_num) {
 	case MIC_BIAS_1:
@@ -1475,7 +1474,7 @@ static int wcd937x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 	default:
 		return -EINVAL;
 	}
-	mutex_lock(&wcd937x->micb_lock);
+	guard(mutex)(&wcd937x->micb_lock);
 	/*
 	 * If requested micbias voltage is same as current micbias
 	 * voltage, then just return. Otherwise, adjust voltage as
@@ -1490,15 +1489,11 @@ static int wcd937x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 						    WCD937X_MICB_VOUT_MASK);
 
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
 
 	if (micb_en == WCD937X_MICB_ENABLE)
 		snd_soc_component_write_field(component, micb_reg,
@@ -1519,9 +1514,8 @@ static int wcd937x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 		 */
 		usleep_range(2000, 2100);
 	}
-exit:
-	mutex_unlock(&wcd937x->micb_lock);
-	return ret;
+
+	return 0;
 }
 
 static int wcd937x_mbhc_micb_ctrl_threshold_mic(struct snd_soc_component *component,
-- 
2.43.0

