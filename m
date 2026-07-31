Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FE833F594
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 03:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785467503; cv=none; b=t2KON+/z7iYrMArNqV55lPWVWPtfRKDuRtvvNM1rboxKPGgO/lCfjxbDYYVAMpl09DpTPlZetrY/C4VEmYQhHQjABSSRrtBw6dm8Q20J5bG24ORunVG0ryVB0NK3nlO+crr4FTvCyoaS7+YTTZxWhY2spiQWYWCLvhn0h6jJRb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785467503; c=relaxed/simple;
	bh=ejYwKV1fvCU+OGYNk147FP+gAndpm1ujSerj4glbyk0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D787f5W6HcVGVi5VypN7o/dER+HiPpDwGcqMRUT8bwoDuEuM0TvSF2ATuth1rVkCWBXPM/af7hKB1mN/3ZYr2pHsgReZDt7drGQ/64o6NLQP9zzvp9IgWluO7tkKAeCWLB39dYaWhIv4h4w7lORqbmvNTlYBz+6SDv8G8PS+q4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JabWkbSV; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JabWkbSV"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso4474375ad.2
        for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 20:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785467501; x=1786072301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PMQIA5NlQdKTc/dqW/t5DllpXIgAMPtDSEZ406vK3Lc=;
        b=JabWkbSV4H1erldfwGeSIN5t+MrJEN2ukgUHWpjgZUWhcOux1+5J1//tOwyAOyrYas
         JQKAJs8Tv0gOTxAWqFK4SD6zwUY5LyY/Wv6XRrf7CCYMNjXUh7CEP3TUjO5TPWuJfK+9
         ASc1vjzYWSmuzDPI7CsSem2pFncwDMEoYlVuRpaPTOGrM8MZzDFhnvdU7SZf06ec/Wdc
         ryE1g7a3V0VMHxMFIZh56XjZlzEPYM+VlnnmJ6/6+6FiLwIg97yk8kw2c5NJ/IKgK+AD
         1i5ZEGYvvX+Tot7Mv5J0jkRblD97jDDE4/u2FKbaGXHjoTMI1cx23ICC5hKEsf/gwZ8i
         rjSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785467501; x=1786072301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PMQIA5NlQdKTc/dqW/t5DllpXIgAMPtDSEZ406vK3Lc=;
        b=s3nd4S3ELLunThJD56RI/2BVJSW9xoMp86E+dZLQOS5Ht72YtciH7fszGD8p/L+Vyh
         tlXtwWIPCTEDCagCLzJt9JdyLWH1pOCATQyB+3KWliPVCJuiL8tPSScV8Nsh29zxfBXp
         UfVcrUW9bLm3/tYMleHq8DnVqrwiS9HH68hgxU14YCPxvJds+gDDjZqtFemmv8Jripd/
         Dw8F2bmMZKQNZhn/62JoHV6X8OzAbP6ttw/KwqGAUyRbgBq9a3evtQSiTvUhEp7SkT0k
         q787TxlVf1rw3gNlyiEqDE/2vXVZzuKr5KBEvVXKb7UkjWa8aoUIx/TQBizze17c34jg
         HkSA==
X-Forwarded-Encrypted: i=1; AHgh+RrwfQwhF2Nl79+RSNrBANcNoPSQ4FJ4JgiJIvisZ8lzjyLdNwbdixSP7Pr8hdyRkqu7iBu7qhAbDRjq3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUIjVOTLZmuvKWF4/sQREnqWexUyFGjm7zDsEVgTe2T8ZSrnym
	MKooPdtrXaBQ8Tb+zoDIZ1TqLc5LiJSVg/d/rklgowP6bw1UsqnRAkTu
X-Gm-Gg: AR+sD125K6dBe8haUFnA8WN3GQjSXxTt/uh9w+de8gCowy8DmXgdeIB+vhhJfFO8S6z
	uORzq3NmfqOd1jHhkBzI51p1DfXKoGGYOmi5BYnu0y4g/wDTZKj882BsI6aHF+Y40pIh9zS/4e3
	k7AvmhJNq3AP75JYF2g0BAb9FZryOsZgZbhFiL+EmjqbFBhNMbQVYG72IQC25Yjv/PmlriB3ozb
	rJvq+6hOdxXcBGd0jxgXMJNqNj6X06o0bbiJ2p3cpU6Z735jgytlwPApIrZ3FTggbAh4cD9Ezfo
	bSlVUTCxesG2FadUhnTsQvn2K4mnJDT8nQinEDL085lwUiSt21flpHUVBx1VpQhnzrF6vmeKgNx
	NctRwnpalWHYnkdGN80mN4v6LVAd3CsaShYpflQHSwK5ckV6xCxbN56ikkwOz1UUpVBY28W1fJx
	lxZACBmh4iWJTdcFJ0EaPlfz2NkYdyU2qsqhjkTd3pFjh6Bfj2bXKIguxtaDkbHPQ9fRao6WcCu
	9EZ3wmHCxIC4dfDAq/30gMEhcFlRONGY9CW723GMrujnU+doFo8vGYlCwicX0+kDD3TjF/HRe7l
	Jcii
X-Received: by 2002:a17:903:2c50:b0:2c9:97a7:f543 with SMTP id d9443c01a7336-2d046ec8829mr4422505ad.41.1785467501244;
        Thu, 30 Jul 2026 20:11:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d047ae9f31sm737595ad.60.2026.07.30.20.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 20:11:40 -0700 (PDT)
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
Subject: [PATCH v3 13/26] ASoC: codecs: wcd937x: Use guard() for mutex locks
Date: Fri, 31 Jul 2026 10:06:35 +0700
Message-ID: <20260731030648.8706-14-phucduc.bui@gmail.com>
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

