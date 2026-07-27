Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C823F7886
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 09:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145434; cv=none; b=c5fOITT/0vvhfCrWptgZue0gbi//86DRS47kGYtz415EeG1zCG1tvbGtSB6nZb+bNZlRn3+65smb3Qn/0Q7SAV+7qMZViCGgS4VlL+caqiTs1UMQH0/RVr57LYhvMrIVt8VWXPIyDfGJ/7durY5c/eB9awmpetuMD5xwzg5KI2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145434; c=relaxed/simple;
	bh=ejYwKV1fvCU+OGYNk147FP+gAndpm1ujSerj4glbyk0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rdX/TOcYh7bgnI2x2DBU5aISIZGBFIDog42m7EWsDEllLUPn9JvPL7vyeYNDDwm6LbPQ2ZPTTVE7+V3lDZ4BDBk7qKy7l8fJyWdCf5gYZxUGh77Dg0YXGUezNuSzvIr1dIoM/Bk3CYqdOoa2zEPA2ngVSjXr8F9iBb61Lbe9GFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s3L6PcAs; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s3L6PcAs"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cbb8b54fcf8so2415588a12.0
        for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 02:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785145431; x=1785750231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PMQIA5NlQdKTc/dqW/t5DllpXIgAMPtDSEZ406vK3Lc=;
        b=s3L6PcAs6woHaxNjnCV3S7nTTaP0LXA3C31qO7aQpSOvWo7fAeO1puYxPQ4uWF40FE
         PYpw+lY2TKj2g5/sPQAtAQYYiTeWlsBlAns8mqxi4zfDNjG+YrHR/bYw+ETI71FsAtBa
         dqo2BRTK6A4NnkQtpOy7nZiA4WyB8DYel6OBJaXIgIazfMzAyTado9cXwz9nOzfTlDoQ
         cO3oHfywSSO+hRpmR6btm+DB3ZCMhKke1lZdqgJy5+NjT+Z96DyT8S09U9Au6JzKeZbY
         Z5JtI/yL68ZBj00qRFMyEt548O8odYG3FsrYjs7OmTzK6l06bMI0nvnLbpdcxHFoonYh
         81Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145431; x=1785750231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PMQIA5NlQdKTc/dqW/t5DllpXIgAMPtDSEZ406vK3Lc=;
        b=P5WcTRc2Joes4Gm9hab34tF7MFLzlTMgFuyppYn31I+Q42s5KgOHEKOK580p/J99ZX
         Z7KkgD9yxJimQjO1KUkKKcggM+flEtK1jJLt8xqiyDpybg1QyNkxnvHY9pVtQWkvrYvL
         584irisHMwoCbLd/H1RDfa8rm+OpXEZDqmCiFEGTDwSer/jkh+B2fGgMe1v5HaPeUBUq
         9zuIUQDY7nC+gGlZ8FXhZEJmXwZzUyIimllTc3Z7ap/Mel5+VJzj88xPpb+WJaOQWbr+
         BuEjKFXgslcLGnqY5h8Hy5CB5iZ+tQT2niUdUNw1GU9fOI1+PP3DrtlS/lQvX1XOJ0Xv
         vG8g==
X-Forwarded-Encrypted: i=1; AHgh+Rpffb63JEUGSuw8g1nS40xl9I3jGOvnIFuS1C+TUpAaWYUhg9YzxI4glEokZpFl2KIwsu2U3HtzerW8Og==@vger.kernel.org
X-Gm-Message-State: AOJu0YywlGXbYd9ryJisqCyH0S4e/TZ28cPG9UjnQSm7oUJaL5pnx/qw
	nH1W4+laPzh6FfdNGNkWPAPGOaRqFGbQ+kmvTyq88Niw2jVA6+LRaA6y
X-Gm-Gg: AR+sD109NvXWpvVrepQBIS6DxguFcrwY1bCVc27vxUI2cO5ie2jOik5juLyKA3fsqQV
	9BJFlWN0rskAMBcsnVPOB6GHGK34/MxfRCe3gybPa1iGA0Wq3zJqYKDpKc++KXIaMbPCDozpwvg
	oVbRzE2TgPHJiUGad8Hx/eiOmp9pAungS73tLrQxrkm8adOmZ0Pxfz9ou9hyZNqJGfpT5xeOizL
	hcx75MrSPad+11AzlmrmR1tcvAyFFD2JE+3Wd65irfQFp3t2+8l4CLxfUCOhKkXEcwR1VEGjL9R
	w+MB9fA5kbPnuWRyuzdlk5gp27DiJCCkqdsm7FDZyqjtRPd3brqExxRk2g4ZU52pwyrtzd4Px61
	g4a7uZWvbkz/1IW/QRsQdEuJb2BajecyKNyqeOZJ3zJlAJ4uD9l7+ECg6vQ7Cze9E9HaD/CONxL
	MObjNRiCdVwNMmqDrThiOYhmp+4duqzpvQDgJFpJSyzOWDXIyrQ+biHEQjVIcerBEU++P1Y0pkM
	zcplDcQ4ApHvits+rcWI0Xk825P0dnW
X-Received: by 2002:a05:6a21:99a6:b0:3c6:3c5b:f32f with SMTP id adf61e73a8af0-3c67e0b93b9mr7312102637.51.1785145431478;
        Mon, 27 Jul 2026 02:43:51 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66b5ffesm2959018a12.19.2026.07.27.02.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:43:50 -0700 (PDT)
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
Subject: [PATCH v2 13/26] ASoC: codecs: wcd937x: Use guard() for mutex locks
Date: Mon, 27 Jul 2026 16:40:33 +0700
Message-ID: <20260727094046.23001-14-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wcd937x.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index e0169e783ee9..0dd05604f5b8 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -2,6 +2,7 @@
 // Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
 
 #include <linux/component.h>
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/gpio/consumer.h>
@@ -1056,7 +1057,7 @@ static int wcd937x_micbias_control(struct snd_soc_component *component,
 		return -EINVAL;
 	}
 
-	mutex_lock(&wcd937x->micb_lock);
+	guard(mutex)(&wcd937x->micb_lock);
 	switch (req) {
 	case MICB_PULLUP_ENABLE:
 		wcd937x->pullup_ref[micb_index]++;
@@ -1136,7 +1137,6 @@ static int wcd937x_micbias_control(struct snd_soc_component *component,
 		}
 		break;
 	}
-	mutex_unlock(&wcd937x->micb_lock);
 
 	return 0;
 }
@@ -1460,7 +1460,7 @@ static int wcd937x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 					    int req_volt, int micb_num)
 {
 	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
-	int cur_vout_ctl, req_vout_ctl, micb_reg, micb_en, ret = 0;
+	int cur_vout_ctl, req_vout_ctl, micb_reg, micb_en;
 
 	switch (micb_num) {
 	case MIC_BIAS_1:
@@ -1475,7 +1475,7 @@ static int wcd937x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 	default:
 		return -EINVAL;
 	}
-	mutex_lock(&wcd937x->micb_lock);
+	guard(mutex)(&wcd937x->micb_lock);
 	/*
 	 * If requested micbias voltage is same as current micbias
 	 * voltage, then just return. Otherwise, adjust voltage as
@@ -1490,15 +1490,11 @@ static int wcd937x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
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
@@ -1519,9 +1515,8 @@ static int wcd937x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
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

