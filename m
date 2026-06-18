Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264093CF68E
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 11:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781013; cv=none; b=sNrOM/NIhQ67dguvRJc/aT8cdWVcGrjbHlmYPNBGVlCNFoR3Bxq4EhxjFOI31aBV+c2SEsDrNIHI8kX0kuJgn1FQVCzkcAvjvIQjPdykTbgc/xHsyAsD2Uk1LFrbKtfdFLk4PAD4r+wjqstvJeh5GAX2l8hmJ/WlBlUKDkeVsV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781013; c=relaxed/simple;
	bh=r7r9e6ypW8qX24PwRXoC+9CWtRWiGGy/uP12p3KkF1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EOfZD37WjC57mZ9OKp/rDWYpyxh4Ui9/aaPmm66kIDE2mhodusl4x3mbYa73Yx7M3WT1wmTExLLBS0TctIuJ9CwOHilu2rYx0DTTft+ky86ljkxf0DbP1vm1Loj2OiNtpq19lZNAbSfNQGVjBof3pQNTuNM0hNze3T/jLgHrswY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=inEz2h2J; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="inEz2h2J"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c0c379e8ffso6926305ad.3
        for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 04:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781012; x=1782385812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9U2r5uO0a4sNNWl3fg9q20Rk8WeevWmhUpMadyTlIYY=;
        b=inEz2h2Jp99lqLeH5G55XAmqYQCJIp6Vatoic/ugG88CtSYTJoPxbGs8eGnuQ45V0p
         JyygrIBkX208ZX2kGInYzlvv6mrKcvvYgQ1itdZGtBBUAS9/kJo8zdL0/YHpkE7oMnfN
         KTeBljjYJT2vi+LrKLfqM8Mg/CUzlgzci+6vZ5OcYqt8U9+310xf/3Uy1eXHwpaJLMg5
         BmMCgi4lORp+PTbT1gq/Zccbusn7P9+ybnh6XuyqLDNHFKlqmnOgybX5Tn7lV6XI72h2
         3jiR7tTLpX80cAoSmJ41lLgpOIcHcXYLPzd4O4lqQPGnL7T2v1ALJOZnN1/fGjHXrGiP
         ADgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781012; x=1782385812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9U2r5uO0a4sNNWl3fg9q20Rk8WeevWmhUpMadyTlIYY=;
        b=JG5s7xUnozJ3Bcp+Q4r2WAuxIfulspY381yHYG3Hoyo0vSmuYXdBzQyMHnKobzt/nO
         Eme/Yf2UKrTRILb7sivqaIBID35LrKYODujayr2UfiDkal9fyiy7tx5HWw7/KaOqoq7i
         HmQsQQ0UdUI4yDtTtHzlHdfHzCYs2lfTTnq4ssun4YY6tsJmkcXIW6sYcFousMIPy55r
         /KSx23j3QIXqQYulqs4L0oWBcv8Xr0D7/WiPiDBiRFR2CArtFFJujkPpYDbvYnEA2ow/
         E6iy3WycobqVSDoNZBuOZF50RVfs/fj+Yy1yUcg7UW6TneWWA9sOXB+5mlMtexmdAo/m
         mpBQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ENgt//sau4Q8nNpKm/vMkPCxEIabZFQHXOdNu9CQB00j34NRbuFymwFs41BXCUzv9n2cGdhZELjiLNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+QhncKpDf2sFVJoX+D+QjZYidJCKpHnVkdMF0gvIUD5SBNyx6
	tpdJ0VgMC/aNJhBCGS+3usIK9M6naXjHxOEzWxO8/ZngNdpcRE2zpcdj
X-Gm-Gg: AfdE7clE2ZpQR6EDXeqbvxUHkBMjZOX8TIDmXziaxfEvryUtnNt0VApYYgL6Ug6ST6I
	ZhC0t/YPrh2O6vyRoVLRVpl49U1z0wvji2Naw1LzsfhaPLnhOU3QCtl0FIJA0R0V6NMJEFZiCJD
	71ZjNote0dbhC9FJXtxEDGGhdBZqptIMmZGDs+8WZ1ut6/dYMsc0xqDgVtzE1dYXX36X6y9ZE45
	5Ifq+zj8LMmGR7xCGQ/CECm27YyHvszx0n0LSq9i2XTg7n7vRrrrfI3LerpeDC+X149K45BApJD
	dARjyodfGALRlELje9HQH8VBMVNiOuoUX0EOZ4tKbT0F0cE2JJM6r7AfiZVckmIZvclytp3eGlS
	P+uCOtf+cqZRk/8qU1tuHI2xKV8R+o7LI8w874809VsPFYvlZJW6GM4weKxFqyTPzgjBKfMAP0i
	ZZ9IZp6CshB5ECbk/Iga7zWC9cdYH9MNUGfZt2UqHamDUb6mw=
X-Received: by 2002:a17:902:ec82:b0:2c0:b5c1:8e3e with SMTP id d9443c01a7336-2c6e472d580mr33156445ad.8.1781781011500;
        Thu, 18 Jun 2026 04:10:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:10:11 -0700 (PDT)
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
Subject: [PATCH 66/78] ASoC: codecs: wcd938x: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:15 +0700
Message-ID: <20260618110827.232983-10-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wcd938x.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index c69e18667a85..9eef1ecec352 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -1976,7 +1976,7 @@ static int wcd938x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 					    int req_volt, int micb_num)
 {
 	struct wcd938x_priv *wcd938x =  snd_soc_component_get_drvdata(component);
-	int cur_vout_ctl, req_vout_ctl, micb_reg, micb_en, ret = 0;
+	int cur_vout_ctl, req_vout_ctl, micb_reg, micb_en;
 
 	switch (micb_num) {
 	case MIC_BIAS_1:
@@ -1994,7 +1994,7 @@ static int wcd938x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 	default:
 		return -EINVAL;
 	}
-	mutex_lock(&wcd938x->micb_lock);
+	guard(mutex)(&wcd938x->micb_lock);
 	/*
 	 * If requested micbias voltage is same as current micbias
 	 * voltage, then just return. Otherwise, adjust voltage as
@@ -2009,15 +2009,11 @@ static int wcd938x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 						    WCD938X_MICB_VOUT_MASK);
 
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
 
 	if (micb_en == WCD938X_MICB_ENABLE)
 		snd_soc_component_write_field(component, micb_reg,
@@ -2038,9 +2034,8 @@ static int wcd938x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 		 */
 		usleep_range(2000, 2100);
 	}
-exit:
-	mutex_unlock(&wcd938x->micb_lock);
-	return ret;
+
+	return 0;
 }
 
 static int wcd938x_mbhc_micb_ctrl_threshold_mic(struct snd_soc_component *component,
-- 
2.43.0

