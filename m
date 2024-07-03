Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4A51741C9
	for <linux-sound@vger.kernel.org>; Wed,  3 Jul 2024 12:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720008678; cv=none; b=AAB3hIBMY6Pb9B0TSwOrO+ZnvMcgnM1CTYTDZLYrzQZLcpAIUrqMPFL3k+Iv2oiBLlbP0BQGSLSP45PJy68GjLUacSHGJCboKYjzwshRMjcri2E/3eVNVuLkONC5+xlYIJjnEowzrbcFIXTnU+3Lqv6ke7uBwBVt8JvZxL/hFBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720008678; c=relaxed/simple;
	bh=kohttqfCWrqbGc8ure/Vt69RKlLKq333AiDxnpMSqxs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hX8nOneVM/3qPHGcH+MeXjWHWG2nGmda+6/eRaRDVL90Tude58Bj4IGEzi91YWuFZFEPvsJWo+kkFtrIntSW0Db+OmOtMBMIyjaaFjhktIaHb0AUGCshrWyf+8LlE/vS94+OvijLGc0RC8A39VPIz0d2/mBoOlxi5qCpygahqzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ukGMD67J; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ukGMD67J"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42562e4b5d1so37143775e9.1
        for <linux-sound@vger.kernel.org>; Wed, 03 Jul 2024 05:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720008675; x=1720613475; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rdbATdFaTptmFaDd3LBcoz91pHQr1cKSbt3yHXPYoFA=;
        b=ukGMD67J3/3y5Ok4gt/EhrLW4SWTqdM/gIHOt6VEkgBvgn8CrEzjyhZH4Mel9c2JIg
         6KFU7Ng2dQ00+xVgEcUpGg62IzW2SFV/S8gs3elUQWo9x48Y4n+tmta3ZAzA6D49AzRS
         vSAolF4Up8FTfC2pAFPCLL8PVqgFM0ow81TGH0997ZwxjodEMresm67z01x2/vU5Krwh
         K3RmOClFvNrh4DtJN1RHi7nDj0Wj+zZQOaAN1if9OJT0JernSUCo1EC6cTJ76ePgFuFj
         lWcxM/t8EExQbeMBekQ/FT87kR6AjRPx72urvFo2vALQtjrFNHKQzHU7DfjF3RlNFjny
         s7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720008675; x=1720613475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rdbATdFaTptmFaDd3LBcoz91pHQr1cKSbt3yHXPYoFA=;
        b=BRFZvFHOCt3r8pK30GSemypp2ucemQVztB1d1gePdUR9aLVcdJRQFg2gy/mBlQT6Ro
         s6QtwJNN8278Wkq/dAnbm1rfJBsZ3FURlriFJtouxR/K21D4NwhKmYJQNPhZ/Xc8W04R
         t62jr1fhbM9TE0NOpfe1ROQyTNux0/28SC9DRFBL7CH5n8oIyNDT/lxxqcuyaObTjAX3
         B5DNQe4dRXaLT38cLzOkL5bRShI6e5nw7clhIavRIsEEnxu/ENSrMedVN1k+e7nB1H2U
         +ycskll8k2e4wRULxnkt5b0+sg3pmP4LrsTdohvtabFWX2h4BhOjkEwq0gq43XjF7T2p
         oqUg==
X-Gm-Message-State: AOJu0Yyb51lb1UcICuwGK1wuivzSdgkDaFfHmE6mXAjrbHm7Ggf1onGN
	nBvCC38wJK4ylHOz183e9Wf1xjWZz+2jtChhqOisRc8PI89x5FQB7stCAz+jpqQ=
X-Google-Smtp-Source: AGHT+IGrLsHp3VA6L8jTQ5ej6pjKRa1e82AI7Hd2/DqZYivIJ2FyYoGUJpc1Ou30fG1o2MruG9SS7g==
X-Received: by 2002:a05:600c:4c14:b0:424:abd7:2321 with SMTP id 5b1f17b1804b1-4257a00dc53mr75429565e9.12.1720008674781;
        Wed, 03 Jul 2024 05:11:14 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a10307bsm15716222f8f.94.2024.07.03.05.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 05:11:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 03 Jul 2024 14:10:58 +0200
Subject: [PATCH 04/11] ASoC: codecs: wcd934x: Simplify with cleanup.h
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-asoc-cleanup-h-v1-4-71219dfd0aef@linaro.org>
References: <20240703-asoc-cleanup-h-v1-0-71219dfd0aef@linaro.org>
In-Reply-To: <20240703-asoc-cleanup-h-v1-0-71219dfd0aef@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2346;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=kohttqfCWrqbGc8ure/Vt69RKlLKq333AiDxnpMSqxs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmhT/Up3Lhqw1lG8hf6t79kWGG+4wCsdFcumtsc
 T9S3yaOibyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZoU/1AAKCRDBN2bmhouD
 18TVD/sFzG/Chwmi1OFCni8P6wToAEF0mWU3fsKO4cdcBdThHB5JG0otzPtaSKk/NngKHF8qFYx
 7bXfnXw65p0AIzyIi+K/KT/HS2JqWziHSf8ztIiu/eMt3jxbSaC71V5k1gfSZxJEvLNMIcBUOhU
 s8IQoNsMSSatumy4nLovUfHNChCas82BtISCmoEpHftZIr4FJZ1G5mGgJWWdX2wbxBia3stm11X
 VYBQxG18BC7NsyLY0Y0KVdOOMNYbB4zOJYCA96xlTzOwiWz0etfgvArlb7y5nl1pq7HdGoJ7NTm
 hrX4nR5SaQudQg1PWP7HlVuOtyYH4DmGw4PNaV/7CImP+hPBSh5bHjp3PpDMOcHLcyVmX/xu5Mk
 nJ0kAi4Yyqo33sFw5jKjCDtMmy3C065QqrP4gpssMYt+yVluRTme+gD6VXEufkCLn1HXiWkET3Y
 2tYePWhNHAWy2r1kLkVLmEJUnICPHQh3KV8gRdsE58tTNb2CUIKALHqTzKVMn5PvY/DD6rW5ze2
 1ypvy76pvgSdXSz8O1ZlRw4m/LfpkUWp3PhaD7GyzsHE3gDnXakzA/PySna6wcTQl2a8jJKBIQr
 f6fwRFI8zzDPmUpI8d/ixZSZNGdMOtURZgzK5GYpzsyfgq0m6s2IP6rI7FXctnclehMYDltwEAR
 8r+c07k6ETwUrSQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Allocate the memory with scoped/cleanup.h to reduce error handling (less
error paths) and make the code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd934x.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index 6c65b46e2dc9..291d0c80a6fc 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2019, Linaro Limited
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/interrupt.h>
@@ -4973,25 +4974,23 @@ static int wcd934x_codec_enable_dec(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
 	unsigned int decimator;
 	char *dec_adc_mux_name = NULL;
-	char *widget_name = NULL;
-	char *wname;
+	char *widget_name;
 	int ret = 0, amic_n;
 	u16 tx_vol_ctl_reg, pwr_level_reg = 0, dec_cfg_reg, hpf_gate_reg;
 	u16 tx_gain_ctl_reg;
 	char *dec;
 	u8 hpf_coff_freq;
 
-	widget_name = kstrndup(w->name, 15, GFP_KERNEL);
-	if (!widget_name)
+	char *wname __free(kfree) = kstrndup(w->name, 15, GFP_KERNEL);
+	if (!wname)
 		return -ENOMEM;
 
-	wname = widget_name;
+	widget_name = wname;
 	dec_adc_mux_name = strsep(&widget_name, " ");
 	if (!dec_adc_mux_name) {
 		dev_err(comp->dev, "%s: Invalid decimator = %s\n",
 			__func__, w->name);
-		ret =  -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 	dec_adc_mux_name = widget_name;
 
@@ -4999,16 +4998,14 @@ static int wcd934x_codec_enable_dec(struct snd_soc_dapm_widget *w,
 	if (!dec) {
 		dev_err(comp->dev, "%s: decimator index not found\n",
 			__func__);
-		ret =  -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	ret = kstrtouint(dec, 10, &decimator);
 	if (ret < 0) {
 		dev_err(comp->dev, "%s: Invalid decimator = %s\n",
 			__func__, wname);
-		ret =  -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	tx_vol_ctl_reg = WCD934X_CDC_TX0_TX_PATH_CTL + 16 * decimator;
@@ -5101,8 +5098,7 @@ static int wcd934x_codec_enable_dec(struct snd_soc_dapm_widget *w,
 					      WCD934X_DEC_PWR_LVL_DF);
 		break;
 	}
-out:
-	kfree(wname);
+
 	return ret;
 }
 

-- 
2.43.0

