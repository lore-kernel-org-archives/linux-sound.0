Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF29E221DB6
	for <linux-sound@vger.kernel.org>; Mon,  9 Dec 2024 12:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733745647; cv=none; b=b2Ig6vcZ8B87HmPOFrgeTx1mXyvnEnBfvDnu9v9iXOzp4CYInK5VlgSTaXUryB7PhL63OqyGJmevwOts1OxJuGKNwldERWGEt9tWTbLdn2irj7IdJG/5up+epv4kTNImH61G13X8CUOPiLc7k8hDJWXf4+qmbFOkCCHi0efNOnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733745647; c=relaxed/simple;
	bh=WhShiMoI5qZyDrMImdB/9FQDtPm2fCJn5q8eADeJPtU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bR+urQQWQ93HZDzWmwHAWd0isRNB3w+7BD7SmDRswQhy3+U0+l4HyJ2p+1gViw6QvuREk+MJy4HLF8OpHq6ZjiY/SCRuPSzt42vsPHob8e2JmKEVJsSqIdkuK2DABimLgCs99G6VpfpiqrBf3Rcpe8XmwaH/Y2j5TcfkcFjixJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=byMKvySA; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="byMKvySA"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aa6647a7556so35244666b.2
        for <linux-sound@vger.kernel.org>; Mon, 09 Dec 2024 04:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733745644; x=1734350444; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KEzv543yTtonY0OGrBiwa/9yBGOxRrOVZoppfjxzgLQ=;
        b=byMKvySA5jwnEWoNEH3m1d1Hz4cd80wtwZ8mUVFtpZojMaRuqp6tPHWYb8Eg9BmgxS
         ItzeVqWAVTaoe2ZtlU2j/8Yl8raz7XrdxnYJKJLhAEFN6wWZIE8nShx89bW3OI2KynkF
         OTSeYcPBdkAs+z6Tgk87a231Ur1HGWewqHBV5JYJ8fClAaOfgVZVEDJ2k2xq8mO93k3X
         c0EmdFWV5QNaZMvWoSVNEwxYY1dzIjn8KUe5W9PffSC8JZfu4+qZMlU3e18smwzyeX+b
         vx3jD1euXGvwqfBhP5pa9mV5PIUe1PNwuhHrn0Trk+A2723igCcWhhH17QjMwfX38Bpl
         HA7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733745644; x=1734350444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KEzv543yTtonY0OGrBiwa/9yBGOxRrOVZoppfjxzgLQ=;
        b=fYHW7V1vjaIK4D2BCeH4UJGeBs8Abd6+ktfbhz3VysMiAMFB3VdK2XkBajpXwu6ms0
         9Uf4OMwZRQNJyrF252PPy0X9c/iAfdQM531m5M9IafxzU8Xv5sXS5P9OSlfQfFo8AbHY
         lLmHr3FZPAmUJ8w3z8zRBDZfoWWRD9tslOYAN2suNTkuzcp5pLU4mxc+tRQiV8r0s7jy
         wE28R4Q75i+vs+iOXaP3yDxgyCUOVqVvomw+O090z/ByAWamMvW6Kp/bqYOSH1JggxIw
         ELl71kL6WmQRXUVdbNAQgMRg/kCJb6l+dkmGIXL1cpKC0HT2ih6vHXbqHh3F5jG5ey7A
         jFcw==
X-Gm-Message-State: AOJu0YyJmTrDSO5YkxJzcsu4ckV5qLHy26riKH2xptQvLazy2TE/o286
	PLwEp9nfYRcsG1WTEHqaQW6ya3yLjeo45lzy/lKDMxQTqQVIQ61l4n3t85FBfxssBl4iAk5GDoU
	Y
X-Gm-Gg: ASbGncsDgoYEeX/25NN7swAi9G5fyVifRZpySethTmKPvgNOjBL7LWyr43WYP+Cw+AA
	iO9RQ+qXkadZKcDFzda3k++9MRe2UvBEL8RXMxYRN+iZdPunPzRTeJ9DFLlohCyhi4nT8Hq0hCE
	GuVG1Pthj2GAaV2fD9njhXNiBrAVgRPBDGsOd8tfzvQ90n8N+a6dgEn6Us2oI9iCgzJrAkSZaC+
	ux5o2+D3glwbUD0seTCsYU8e08+GWoJsdyAk0zxRwlivt9CfPuuc+qQM5cXDKOvAA==
X-Google-Smtp-Source: AGHT+IG1yj+lZs+M+jU/dqkLzO2Uzei8FmEuNpnnKZbBTY6w/ukv2TlkWZgSCe1/NeYLa4E5/wbXmg==
X-Received: by 2002:a17:907:3e1d:b0:aa5:3e81:5abc with SMTP id a640c23a62f3a-aa63a025e12mr529842066b.1.1733745644042;
        Mon, 09 Dec 2024 04:00:44 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260e33f7sm678589466b.183.2024.12.09.04.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 04:00:43 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 09 Dec 2024 13:00:30 +0100
Subject: [PATCH RESEND 3/3] ASoC: codecs: wcd939x: Simplify locking with
 guard()
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-cleanup-h-guard-of-node-asoc-v1-3-397f6385e4a5@linaro.org>
References: <20241209-cleanup-h-guard-of-node-asoc-v1-0-397f6385e4a5@linaro.org>
In-Reply-To: <20241209-cleanup-h-guard-of-node-asoc-v1-0-397f6385e4a5@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2262;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=WhShiMoI5qZyDrMImdB/9FQDtPm2fCJn5q8eADeJPtU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnVtvmQJL00sYkjfVvuVgIrhwYEy98tB9QE1roy
 vhg8xdWNWqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ1bb5gAKCRDBN2bmhouD
 10yKD/wO+Ga1nldyhsPmyyCVePuA3JuZQsFtvR5Dy7Y6KiBuc1BdG3OaFaRpScUAgxc2mVyiYri
 t1vQkt8F2FYF1yQ3HwD+wbi5JWjMDGQ1wxXpTpA9BXjOel9BwyOmy+9uAwkHuUcWKXE72KrVSnC
 +RCEgy5cQZyzNtGnVGoKbE/eT/JHzQwMmNuBMTn8dO8ZSGl6vwLNYReXVNVt+/9Seww3Vgi78ca
 WoQlMhR3t3TU/Q5zx9QipW/TyJIF9RXhfmryOTcpRTjaKCFumEg2ft7j+dM6oNlivm2tNs1HCtk
 BnYPcQMVcaogJULzVxWXMyeQeW9rdFKG57Oa9MTwd25iD2JCpmtzQaAVgjxcIq3RAY9PPl7RNSI
 aO4jxNPIpuhIylccvDpOQHeFQMq8CqVqDwBzUA47Sn9ezChNH+BcwS9lvQvAz1lxVJ2nRBFY52V
 BMQqtFRjS69uFdTVx0eCpZWae/7oCIZohv6LOPEjLuLIl+RWIGenXxtg2C0F0l1bKnjGCkxeOMN
 /wuncNwPA7V7HbRyd1pMiMjiyZy3mS3Cxy8Hu5FKBhj356xlVlrOPDLDCektI/37uREuhQw+9Vy
 qAXLeqMe5S69U9HiWnAz/HwXJ+lcEx6eaS6lYjDHPD6COrEKs2moL/sNf0nQEHEt1C8sc/aaSkU
 ZG/LVk62Z5FjWNQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Simplify error handling with guard(mutex), which allows to drop local
'ret' variable and to directly return instead of jumping.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd939x.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
index 4a417a92514d7979aab8a7b67c518e9889e12012..e033e153c2e8e663a04957779625b04ac11c7625 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2023, Linaro Limited
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/platform_device.h>
@@ -1933,7 +1934,6 @@ static int wcd939x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
 	unsigned int micb_reg, cur_vout_ctl, micb_en;
 	int req_vout_ctl;
-	int ret = 0;
 
 	switch (micb_num) {
 	case MIC_BIAS_1:
@@ -1951,7 +1951,8 @@ static int wcd939x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 	default:
 		return -EINVAL;
 	}
-	mutex_lock(&wcd939x->micb_lock);
+
+	guard(mutex)(&wcd939x->micb_lock);
 
 	/*
 	 * If requested micbias voltage is same as current micbias
@@ -1967,15 +1968,11 @@ static int wcd939x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 						    WCD939X_MICB_VOUT_CTL);
 
 	req_vout_ctl = wcd939x_get_micb_vout_ctl_val(req_volt);
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
@@ -2000,9 +1997,7 @@ static int wcd939x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
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

