Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EED34888F
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 03:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785467512; cv=none; b=X42uYXq8tTHHl1kLeX/p2hvbrEOV7ZOwf9qvdE6+jE6/fnjjBzACCaSgcRAIpImrUqXmnav8ufpVm4GedAptqkl5NDt0FDyLK5aAfWoylVjp41rX2k6uBfTXFleOtWePDRPxB6Dov9VL8fWAm9rHSwl3BUg5vxb+g52CEeBZcds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785467512; c=relaxed/simple;
	bh=XnhnsPyA5QSjzg0tuQcdHLbqpbZbFqUdXNayJneipxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fVzqWxcojqbmUVYK/alY2UoV68wQ8hCpyc7zl0BPfh43lwCHc8M9xZINGWHBpmvGSqtxNYti3jH9SEtvFKW1pSIeWbdm9ikXxyY0T+1Y4Ljjgapua3iSzqv8Gqm0fGPg0j/4UsMQRcsgtqd4bmBxMIwYQliR84bgrX6XoY9g7oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WxjC6fIY; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WxjC6fIY"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d02b4c3601so5337965ad.3
        for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 20:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785467511; x=1786072311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RK1Qg1zMLuqf3deYuh7H14WODBPPcltBb1uxyeY+ius=;
        b=WxjC6fIYji/q5DMH34TSnRdULpn4qcc2XByd9T5k2fOingd6FmBcVXyaz+qYLsAzTg
         wf1QaA71Bvb5fYFlqYJ7kXHsOhgMkQf0JV13OwhqisobXwAwEWRlH7ege8ufoOSHBPl6
         bdTCwwlkX54k4yzBwmNl03qMgeCuhldfI57dlx51JEzz49mrqjpG/fB86Tg3cmngiKMc
         sZWd93GempgWA5sW54PL2iM4gkb7CAobqgMwt2cOM3Hg+LZYotGLeNoRy6ddKvoo2io/
         vELEZ/+Ptv6AhR6atXKX1X/jBoRBuXhj8IItIUimlRDBDdImXw0N0blclKYaeTgs1mTe
         v3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785467511; x=1786072311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RK1Qg1zMLuqf3deYuh7H14WODBPPcltBb1uxyeY+ius=;
        b=fW1X7R+aU/EvCciIkyVtNATybkcAy0ACadLBZk0nCkpQ4tTpJmCbHex6CcCmhxfZFV
         mkMWw/Pm1ilgr1goQj0iKDGra57r5BZjV66kOIHvMJ+qYWvVokJZ32C5C3j8onZx8Ka7
         9toWgUN/QqvaxRqLnsLgjIvqx2Ok5GCH7lNNZCRFzQnMfcbL3LnbsmTeDdwP0YtH/FHU
         6nYymxk1Pm1nAWrWltaqMsHSwv4snWsY6nMXIAH1Hs28Vhs7noNPh579WGIblFVOONIm
         PBxRb6M8qjboSFiQc9FYtrxTM/d1rZJEviFMJjsj8Z4CIKtQTslvSM71oitBMMf0CfNM
         tsIA==
X-Forwarded-Encrypted: i=1; AHgh+Rq6ZnuoQZk5qgrNTsUTHB8HU8kMVSm46DVszvYAGdrxduDh6q8hBTY2TCBRJCJmCnBDw/frNVBxnWvDJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyixSrlcDs+QmQFftnV2JivoJGHAvuFB/vX3DAUewzBXL7XVjaB
	+sG+Cc/nBFAcRGn9ck201j6Ng4EyvGEwp85azvGNIDDz2DdiY/q5hm2J
X-Gm-Gg: AR+sD12fkagJsF/PIZ2Ic+jNHq4ER1NFbMpWAOuvj0/8pfKsHgIom0lf5/7CatbhkIl
	xbjUkXNVSn0slA1bbpofpwL6i7B0uFAa8/g8mqn+1A5GSLbHAgSDqhOc+yblPkaChLAQrGVPlch
	78pw358qMx9e6jf41/j98XxQIDvNR0VwbJvVN8ro13VQL+h9QyR13nk6Kv2iFvBhqmqRlfvL2qD
	4T4rtWcQWzm/MYknv1zl1jlQTQrJveqE+5BRG+/qFLKiU8I9CC3fopIgeNs3vy32l/n4G5TXP6n
	2Y+nladsNj+g5fJyYXeXmDzl0DwObZ6jjR7Em7p64kXfqQeFE97YJ2d6AEQdIuDFvO3u8RU8TTZ
	Afom3RPbHc9C5BMaTNlWPcNdouPuf+VnOA2SxcXrgWQO58Y2BKM84gE56ZJuw9FERswl4Z+QL7L
	GP2mrYuzOS69s13jM0KbqKZgIEtif44g6QzDLpyG7wSyTxjCxgTUB0G6xR3Cu5v6eHizdLQddZR
	1KLcLly9K8+z7Xhb+GLhp+DsvjGW9MXlZ0aEuMQkgNFQoIeG64kf+a3VuDV5jQZj7tbG7njlKeX
	E4lX
X-Received: by 2002:a17:903:2c10:b0:2c9:bd37:ae76 with SMTP id d9443c01a7336-2d046ec8af4mr4558385ad.47.1785467510586;
        Thu, 30 Jul 2026 20:11:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d047ae9f31sm737595ad.60.2026.07.30.20.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 20:11:49 -0700 (PDT)
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
Subject: [PATCH v3 14/26] ASoC: codecs: wcd938x: Use guard() for mutex locks
Date: Fri, 31 Jul 2026 10:06:36 +0700
Message-ID: <20260731030648.8706-15-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wcd938x.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index c69e18667a85..9a9ea37ecab3 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 // Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/platform_device.h>
@@ -1976,7 +1977,7 @@ static int wcd938x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 					    int req_volt, int micb_num)
 {
 	struct wcd938x_priv *wcd938x =  snd_soc_component_get_drvdata(component);
-	int cur_vout_ctl, req_vout_ctl, micb_reg, micb_en, ret = 0;
+	int cur_vout_ctl, req_vout_ctl, micb_reg, micb_en;
 
 	switch (micb_num) {
 	case MIC_BIAS_1:
@@ -1994,7 +1995,7 @@ static int wcd938x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 	default:
 		return -EINVAL;
 	}
-	mutex_lock(&wcd938x->micb_lock);
+	guard(mutex)(&wcd938x->micb_lock);
 	/*
 	 * If requested micbias voltage is same as current micbias
 	 * voltage, then just return. Otherwise, adjust voltage as
@@ -2009,15 +2010,11 @@ static int wcd938x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
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
@@ -2038,9 +2035,8 @@ static int wcd938x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
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

