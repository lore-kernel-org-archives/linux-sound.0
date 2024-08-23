Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E801898F3
	for <linux-sound@vger.kernel.org>; Fri, 23 Aug 2024 16:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724430100; cv=none; b=flYNxb2kzBwWgZgmhH3vDMU6z22Z5IcvEeiAd6ZLKfv7xaEtFH6S4D0se5sKutMRKVvh4/sPWXpTi93CbNYKQ+0uCZmbq3K5EcgZO4AmE8f0MrspG7VWGIuxGLG1KBA8d35SqgJcH3uc/ElofbwP3h5ds+ghvhbDs1JENhpalzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724430100; c=relaxed/simple;
	bh=ub/VuVWp0Knj12UIC5h+BDoK62pFjZRxW7gqCbPSQXw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dtrmDSyXl+xYbix0bjfTm5MpJHpqk3dnvmAJXi0TFRtDia6sC2aEzK6MqlYA1S+Hf4OPMeicJB888aGJdqNyr7ezzLRr2do3BzgU3JdRUYMvp70c2tZGhB9cLkjYmOzwQ5mW+C5DVw5vc2Isy9Xh3PAQ/rhZA/Z4yq3S6DClAn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=To0nohPH; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="To0nohPH"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4290075c7e1so2718445e9.0
        for <linux-sound@vger.kernel.org>; Fri, 23 Aug 2024 09:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724430097; x=1725034897; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oHlJrjBVePe1SeLSbv4Eko9PRunifYIKIfHjAwXzAIk=;
        b=To0nohPH+Qk8rub6k8PHhwiRXWkqPpBRe2cd7rr2DeqPZZVMWY74ZPc9HTasRnNRw0
         cJzCQqOpGyViPZDQIbt8UxbKymT1ZBJpFjmmVLcNsrdPP32DmyXg31y9xWLFVZmgvrG8
         7n3voi5mchQgKBNd3pQ2lmV2JLImrl5voFcWrkW+wZC+lzGneyq/+B/BzBtOkqZW+waA
         hFWVYeFzB+shEo90WOsagPPkTDP1QhJ+laFFqThxiy+40l4NmzbqdJOfWJlYOf4S5Myh
         ZkFGzVqI3xDbFwQrw63vxoII3kd/PMXOvwwdpVKECXi5giuZFsZvcVWZx6HbdmCS4fft
         7UvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724430097; x=1725034897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oHlJrjBVePe1SeLSbv4Eko9PRunifYIKIfHjAwXzAIk=;
        b=eYcL5I98xcYbT8adRHPC54JSgi/8IfSrOIVXICWgMHU+Ulof3pQsdQZh+hsx1ZCZwz
         DpMv3JWtzRGNB1hl8RRZE8C7xei44pK3SgL37Pe7s/f2HZ4twdZQD3mIIUww/RI96A1m
         Wa1moUSOxCq3OHU+theVq9ib4YmcfsTfJzqFeFtC9ZOFZcpBN49Gp0Sx6eI5XNUh/hgq
         AD8MxH0LpO9i+aFP05BWDI6GGM4x5WcozzDwXIlirtTUNkoOXoUi/r8AMFF83UhjpIdp
         AHak4bDdQjXF3Wigatev7yMhEJX8ct0YHjtCBFc1pTJH75eN4YwNdVT2IGEu1YrRcJbN
         Le9w==
X-Gm-Message-State: AOJu0YyPDSTQ3zhG7tHpnzuShYfhw//qmDFaKmQL7ald1uK8SZ8sXC83
	3nRju6cmJMYmAAIwkk2OQE4RJQSWwSnb5DUogjAic2/gRcCwsZKOtakrsDRKa1/7l26bIxw+JXn
	y
X-Google-Smtp-Source: AGHT+IGaAT5CoBTn0zsG4cPP6D+5MC+AXuVqHDCJvSm5Lnq3Y/7n8RDjZ2yyq7jMTQ7u/rOKSqKtzg==
X-Received: by 2002:a05:600c:1c9f:b0:426:6ea6:383d with SMTP id 5b1f17b1804b1-42acc8de6bamr12721845e9.2.1724430096759;
        Fri, 23 Aug 2024 09:21:36 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37308160586sm4499312f8f.58.2024.08.23.09.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 09:21:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 23 Aug 2024 18:21:29 +0200
Subject: [PATCH 1/3] ASoC: codecs: wcd937x: Simplify locking with guard()
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240823-cleanup-h-guard-of-node-asoc-v1-1-2349bd7fb7f4@linaro.org>
References: <20240823-cleanup-h-guard-of-node-asoc-v1-0-2349bd7fb7f4@linaro.org>
In-Reply-To: <20240823-cleanup-h-guard-of-node-asoc-v1-0-2349bd7fb7f4@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2368;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ub/VuVWp0Knj12UIC5h+BDoK62pFjZRxW7gqCbPSQXw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmyLcLG8HQHGINNmHWD3ZNgw/T5pgusG7Ng7fhx
 L60p4yQ1kyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZsi3CwAKCRDBN2bmhouD
 14SwD/wLVdZJmNWBwyt8sE2Me3LkhDATw+Ka38o40SDKTczfAcCnWTxwNEwgcuqCStlwJIIIrtt
 Y0n0kWFxKDz8Biu+qnlk8lpVzw+mzZfl/2s/5pJIizWM5FapNKd0DD0dx2jg8vXiJQdYuPwkV0C
 ZZH3VVX5mdhpsQTEL49L6Ubmg9XW47ZIA32/453zaluWgwmAhnDE9/IOpGwy0+MXyBKIWDdEGPJ
 olB65xGv9DUwDDnY36K50bewU+XFgG8UyAcdSSQ228ZHWNAro1PynjoMStTfu+opTwr2ubIy7un
 pv50YHu9sFQUV9al49GkR8KveVDqOiF3UEE5pnNM+3QqID+arPUZmAPrA1ANnhw7pwzTO5yy+GH
 RWj/WVUn9Xl64pEfBMsn7dnCuEKQkW+8vy3cY/x6iEAJ5sEGFmWqqkPbCllpVi+BfN5AyQ3a8EO
 SSieQSyCvVo7z4vE+KOhQXZcwHy4bvVEiqeiORaDB/lEtS7HceVfIY9OLPmZEcGOB7zWHf8DKzW
 wYZSbuUrTj8w0gs41PeDYlPW2OyEnR6pG7aIlCn5A/pKW+6JRPhvFOE+/Q4djgkl9NnBTtxCc2/
 xJFzHW9bTfxKz9C6sDVtHE1fTrRz60B5Nka0OULrTkiOM7Npi1OKiWz+7fDo/ELa0DODyzyT992
 Dq+idLSDsqVX2jw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Simplify error handling with guard(mutex), which allows to drop local
'ret' variable and to directly return instead of jumping.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd937x.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index af296b77a723..59d2a5da9854 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 // Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
 
+#include <linux/cleanup.h>
 #include <linux/component.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -1440,7 +1441,7 @@ static int wcd937x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 					    int req_volt, int micb_num)
 {
 	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
-	int cur_vout_ctl, req_vout_ctl, micb_reg, micb_en, ret = 0;
+	int cur_vout_ctl, req_vout_ctl, micb_reg, micb_en;
 
 	switch (micb_num) {
 	case MIC_BIAS_1:
@@ -1455,7 +1456,9 @@ static int wcd937x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 	default:
 		return -EINVAL;
 	}
-	mutex_lock(&wcd937x->micb_lock);
+
+	guard(mutex)(&wcd937x->micb_lock);
+
 	/*
 	 * If requested micbias voltage is same as current micbias
 	 * voltage, then just return. Otherwise, adjust voltage as
@@ -1470,15 +1473,11 @@ static int wcd937x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 						    WCD937X_MICB_VOUT_MASK);
 
 	req_vout_ctl = wcd937x_get_micb_vout_ctl_val(req_volt);
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
@@ -1499,9 +1498,8 @@ static int wcd937x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
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

