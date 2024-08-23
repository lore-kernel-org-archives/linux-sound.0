Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA2C12B6C
	for <linux-sound@vger.kernel.org>; Fri, 23 Aug 2024 16:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724430101; cv=none; b=g4j8FnfaSkWX373hLDnfj8CFCZTapBowwy2kaTwBmyJbsNEZX7Mg1Xh+YOkqlgWbDR+qJeLnnEZBqN0ZevF5qBBoGNi1krPwNO3Ycb7kg6ODCaGJk0d6JJB4Tfe3lrV0QQaoMQlyltzdYYv1hfzeIBGZFqVAiWR9A4rzGnAXnt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724430101; c=relaxed/simple;
	bh=D+zkVBV6t4Pm0wNjj/vCouujptgcyT0JrPLkU/hlsTY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qVXtrkkUib5KItesDKkUOWhqDZJeeJe2hHvb27HSeVjJSSxiqnwppl4ok4DJvceyHn2/3EesYZZICYWKQJ+zuHPIcnJRb8OqbkEoTJkIiu6dB5zi8twRQ41bHqHhvWVbTc952gmUCikVXoKqjLUqJR+8WDe22qKlFLyhEJa7rfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G/xhRjwQ; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G/xhRjwQ"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-371a939dab9so317567f8f.2
        for <linux-sound@vger.kernel.org>; Fri, 23 Aug 2024 09:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724430098; x=1725034898; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=757Xyd4GDjdQ78EeSCWOM/UbvfLrpKBRwkR+ySC2BSM=;
        b=G/xhRjwQSsdP64MsLFw22P0jbXqrBj0S9RfNXGPMOJPzG3sYH+gAcgqcpXSPH+m8ts
         Q4gHX5KBzLhfvFxK/JtRskq2UN4vkEle6FHZlxt8fffOfbIpNDQk6XrIq8FU+wGg01JT
         wrl7fPfreqnF9NSLm2Mx1W33jrZW1QLooNCZErCEzhYsv5eW9PXCbjv73bGwLI0441t0
         921otlL/toEbVxMO9roCVKvUZwK/vm01Eref0CTkLdCwq8ODqBg/DL5Mmu8+dfYWO+6Q
         N8I3Rvi8hGqU225BRI512a7hZcyO3lbW+ZeVRoxHyeos3+lJ6DRaDMBjh+gClFm3P6bz
         kl3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724430098; x=1725034898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=757Xyd4GDjdQ78EeSCWOM/UbvfLrpKBRwkR+ySC2BSM=;
        b=LjroNlBSt2gMDn6BUIp8e2Yok/F5h2yYzPGOpLe+M+ls2Yh798rPEPUhHnTvAY/hs3
         HTIXIdr4nsjjtZ4nw63BnNx8xSEOsLhhC3yOHF5iP7aXP3DkZu9+my82GxovfNECGbbe
         33fKHNQTUTSxuBwJLg6ikELkNGngGVhmA4KDMLwx2qe/GyH5P8QdhZzFYm7980W76Awo
         sPs23eG++uFKs9CgbmTGEFEUrJkjZiI5qgmKlVKD+a0JbQoA6oIuZerKrEu1sFvk7pV0
         /0gwNJBOSFj35Lndskb439o9HXDUgu2fLBw41UKFp8M6WWzGIVA0l8ihVGU+7DEZ2WHt
         Ktow==
X-Gm-Message-State: AOJu0YwrJsUVAPp/8m0Szev4AtqfQNJLHAlUQpHKBp2P7ZBu7TyuiN3g
	u4h9hKR+ctEt2zJTC8Ylo49EHvk5VMWD+SON+5QNMWiXCBritqJCG2arSzH8LxM=
X-Google-Smtp-Source: AGHT+IE0NOFf0ynPJHje0E7k3ADLffLdWE83krf1vj3Mu8Li7Z+DhEbvkzeo8PhD6s7NgKBsjJ98zw==
X-Received: by 2002:a5d:6c6f:0:b0:368:4e31:7735 with SMTP id ffacd0b85a97d-3731191ea94mr1072233f8f.9.1724430098059;
        Fri, 23 Aug 2024 09:21:38 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37308160586sm4499312f8f.58.2024.08.23.09.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 09:21:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 23 Aug 2024 18:21:30 +0200
Subject: [PATCH 2/3] ASoC: codecs: wcd938x: Simplify locking with guard()
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240823-cleanup-h-guard-of-node-asoc-v1-2-2349bd7fb7f4@linaro.org>
References: <20240823-cleanup-h-guard-of-node-asoc-v1-0-2349bd7fb7f4@linaro.org>
In-Reply-To: <20240823-cleanup-h-guard-of-node-asoc-v1-0-2349bd7fb7f4@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2364;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=D+zkVBV6t4Pm0wNjj/vCouujptgcyT0JrPLkU/hlsTY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmyLcMy2WxPO+SbR0y4B04islNvwLxCIeu5PxJV
 yNMiRTNE7eJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZsi3DAAKCRDBN2bmhouD
 1xdhD/0X7hEUTG0wwG1W6xxir1GrQopHRjUwgyVXWqIl6xwvtS9kaKBTbZ8nV4ezo+oAazh1UTS
 kmMG6sfXfxsesXC2lsL1QzagrjMxuTRNCnPKEVSL3PFq9r/dWP0C2aZcNLVeJUQ67TzbzuzFhJy
 rDqqQwzifcdbFblBI/vUA+WgnpJf/KyDe2aS6ZzBOFpf2hgexebNAW3oH5V3mtkkeOHKT/lE6qu
 XFu/mLbRmckcDeXWTlDdb4hkhAmoPZtorNUUbEVoOspJWyxDpcKshxnvlKDTaesRrrSkZj/FPe5
 sC9jupbWRVD7miOiOloD5cCtesR6PwbKAYupeTKiEgHU6pap7XPeTfFi5gR2Cw7AClwdNQFq1Y/
 SfPEfldHG6dWlUZ3xWJDSj/D9Jn3aX2RNTwkH4cVKq8oXtS0WHNN9e3CekBdHrG8X+7GdXwZWDy
 uYkOA/9dChSqSQFADeDvxI82VYAyN2jrofkv1ZhrmzEQAZn5fDJbXUJ3pSNiGgqq5/VBS6pccIE
 bYU49OsJ+zwkFWcdfKmFj8/YUDp6lHioXI11VQV3P6i9MCpD5c8Ayy1pBtNMJUDT5296A1hXOlB
 BYLikkVR8+2Wj6Co4dhzvBlHgKvZ5PUF2U4P4fruW9NUIRv7hJnTraKiszdQScQsri/Ne+nl9bF
 y92WV/gWLec6dOw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Simplify error handling with guard(mutex), which allows to drop local
'ret' variable and to directly return instead of jumping.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd938x.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index aa92f1bfc921..15056fc493b7 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 // Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/platform_device.h>
@@ -1992,7 +1993,7 @@ static int wcd938x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 					    int req_volt, int micb_num)
 {
 	struct wcd938x_priv *wcd938x =  snd_soc_component_get_drvdata(component);
-	int cur_vout_ctl, req_vout_ctl, micb_reg, micb_en, ret = 0;
+	int cur_vout_ctl, req_vout_ctl, micb_reg, micb_en;
 
 	switch (micb_num) {
 	case MIC_BIAS_1:
@@ -2010,7 +2011,9 @@ static int wcd938x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 	default:
 		return -EINVAL;
 	}
-	mutex_lock(&wcd938x->micb_lock);
+
+	guard(mutex)(&wcd938x->micb_lock);
+
 	/*
 	 * If requested micbias voltage is same as current micbias
 	 * voltage, then just return. Otherwise, adjust voltage as
@@ -2025,15 +2028,11 @@ static int wcd938x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 						    WCD938X_MICB_VOUT_MASK);
 
 	req_vout_ctl = wcd938x_get_micb_vout_ctl_val(req_volt);
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
@@ -2054,9 +2053,8 @@ static int wcd938x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
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

