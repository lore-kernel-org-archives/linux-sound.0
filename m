Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88711345EB1
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 03:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785467522; cv=none; b=NrCmvmD96cwuno+buL3jCQvJ+FkkNhZ9cHV06E2PUCSUwKSqNA/d6Yq1fzZpVpiNw2SL/jm2CYDZHO7oa6pEKsm0tjt1Ob3pWiOVONfFaRJS3g+wlnPq/Uns92x8s8NtiMzH6tQeY7Dw36reXAXX7b54RwDBHyJxQ2fF7OvPpOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785467522; c=relaxed/simple;
	bh=qfYAbMupB0dauUp98L0JPr8A4YLqYtXX8lr09zfUid4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tfSMYpew7fsWt854LisjE/wPdUb21P6+AQ2LjufM40XvpPn1KRcRSzxIwMV6+KiAF6DNQ/YCzvv7S+e6kOqVmAllOYDCCIHgXqWVqx7I4uvnw9uxYu68oVwwDR+ffPX3Na6lzHMduv7wCwP5ibQnH/vhCumfKxr8Amz84hWzUGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F3ZpBjHE; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F3ZpBjHE"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cc891373e0so4733545ad.2
        for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 20:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785467520; x=1786072320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lOLFIqbE35iIA1xT77FTcDNQ9ZNie7IeZCAAkiIj56o=;
        b=F3ZpBjHEfTzvJn3QrTCDRjHvc7KhMOsKSrVSCAKNfKiJnJ8cEn9WG72lWtdEQPhdnN
         k4krK+RDjLp3SwCnsv0wUUvXS8q/IcD5PgnWYthvgN+Ne37eNNlsjackFoiZRbj/rq0v
         ONYwt1vjr7df4Ga9gQpObT0MHEYLxxXoF/ArOPB4dS7Q/MZbAgALuW+oEXCEvBKgRXzB
         bqhRIHdevJMdQMSHuTTavLe24XU5WsNqrmwCNNRO3XM3zMQ4cpHbgd2MzwhOQ+FGdo3m
         BT7tF7hgWCT6Eti6Aq81TrlZDNV0KhElYW7PtdSlGS+MCH2vOMnpUIchDr9TpdR9V4j1
         fgLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785467520; x=1786072320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lOLFIqbE35iIA1xT77FTcDNQ9ZNie7IeZCAAkiIj56o=;
        b=UVI0XdK7cfJuUEW6WToikwDYNI/DZmQprAMTeCnC+hnGsZMlSLfTyUQEzlijy8mEKv
         4VsczPJ4+fZ08Mc2/7ovxP8C5doAzeFYz5kytgaQd/QR7NA7lzIIIZ3oESRvpldJSdYS
         6R1rHyNSsc3IL+d0ucWkfBM8lhhyFGJK17Zepq/3Gol5gRCu+EZU9QRhIRuJIPLHh/wM
         r0QMbsISpvjsulUNiQwgkaEd0I0PsyAot3UUDK+mx3CDZDM+1+ZTNsohDTeaOTdk08Jg
         iak3Ugiii1B/8ysQpAghoqJEmU8UjY6l0s+9gA7gEfy2do1LOZShMcCqlj6zmDAFbLWZ
         UoKQ==
X-Forwarded-Encrypted: i=1; AHgh+RrZh18xg0GgOwih2Rx7KKEhN8spxydJw9NjK+qqufyb1esr5HJ0twSEHWz5aJBRpaZPbFJZqSpCVBTUPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaEdPx9wcHzXLB1u/LZYYLY/mzCpu4m4p0LzolryqhPD+LJYla
	hA13c5UTEyHZnHGBpFPpodhvYFTmiUTiBQa69gNiRjQ4B5mFtcGkMU4Tft80Hw==
X-Gm-Gg: AR+sD10XQjImeLI6cUQQ/76r5SpmnmtjDXoeZhnZk2GsMK40p/Q8iJTs+GwnpPTP97y
	u20/ltGkUumS+zI2vfc1N7gZmeGyhhNYyd98qoretAV+3ES2VmshIcAtRrRLBf3/iT7tb+wWvXQ
	ElJrmIe+p5x+3RT7JTZW+Su+Yi4B9QFc2CbDLF+VcC/xHt9e6FMytemkg6fjK7ulxaYbD9ZE0Ss
	y6I0FbLk1qNAZ50yMmcSnOHp/hr87KP05BnNyzbNKY5rlQddavi/L6QH+8BBXX4DzWWVB+S/aeR
	QpLjXVPZ+f04COtxZ7pL/Vs5fS816a2bXLqXEQxdf1QrnpxxYJ86aJRAyIeS1lllMfXSicIpkSn
	GwYjW+tcxD9RonN8L5oP6Ro74zG69T+kGuFr0n/dOCO+6z83i8kJqYQfE4YNqjrenjgCSym3TO5
	SkJHbD9HTlUZ5XB46cFeHpfQvwRlSUcG43lELMyYvtmtk29Aiwf/f1AZzchTpHtxNG6XtRUYEE1
	RW7ViUu6e3AA1OoLhK2uVUpja4ABITWJJXuzT3yS51hIEbfZ/mEa4KwtjV71D+4oaWCJrmQZGma
	gYLH
X-Received: by 2002:a17:902:e543:b0:2ca:329:3da1 with SMTP id d9443c01a7336-2d046dbe8cemr4696395ad.16.1785467519953;
        Thu, 30 Jul 2026 20:11:59 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d047ae9f31sm737595ad.60.2026.07.30.20.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 20:11:58 -0700 (PDT)
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
Subject: [PATCH v3 15/26] ASoC: codecs: wcd939x: Use guard() for mutex locks
Date: Fri, 31 Jul 2026 10:06:37 +0700
Message-ID: <20260731030648.8706-16-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wcd939x.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
index 010d12466722..26fe0b6313cd 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -8,6 +8,7 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/platform_device.h>
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
@@ -1923,7 +1924,6 @@ static int wcd939x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
 	unsigned int micb_reg, cur_vout_ctl, micb_en;
 	int req_vout_ctl;
-	int ret = 0;
 
 	switch (micb_num) {
 	case MIC_BIAS_1:
@@ -1941,7 +1941,7 @@ static int wcd939x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 	default:
 		return -EINVAL;
 	}
-	mutex_lock(&wcd939x->micb_lock);
+	guard(mutex)(&wcd939x->micb_lock);
 
 	/*
 	 * If requested micbias voltage is same as current micbias
@@ -1957,15 +1957,11 @@ static int wcd939x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 						    WCD939X_MICB_VOUT_CTL);
 
 	req_vout_ctl = wcd_get_micb_vout_ctl_val(component->dev, req_volt);
-	if (req_vout_ctl < 0) {
-		ret = req_vout_ctl;
-		goto exit;
-	}
+	if (req_vout_ctl < 0)
+		return req_vout_ctl;
 
-	if (cur_vout_ctl == req_vout_ctl) {
-		ret = 0;
-		goto exit;
-	}
+	if (cur_vout_ctl == req_vout_ctl)
+		return 0;
 
 	dev_dbg(component->dev, "%s: micb_num: %d, cur_mv: %d, req_mv: %d, micb_en: %d\n",
 		__func__, micb_num, WCD_VOUT_CTL_TO_MICB(cur_vout_ctl),
@@ -1990,9 +1986,7 @@ static int wcd939x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 		usleep_range(2000, 2100);
 	}
 
-exit:
-	mutex_unlock(&wcd939x->micb_lock);
-	return ret;
+	return 0;
 }
 
 static int wcd939x_mbhc_micb_ctrl_threshold_mic(struct snd_soc_component *component,
-- 
2.43.0

