Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EABE19922A
	for <linux-sound@vger.kernel.org>; Thu, 25 Jul 2024 11:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721906642; cv=none; b=qvSs9N3xSA8vyZ+tetd0V7V+pbiTosbQf3I/hGjeGU/fRXtSNdgwfZbl2OHOjdPEh2KtiS3+4N6uSBIE3/P4u81mwmX6wDW/h9SghnRfERnnF5DCdc7vnxQwmzZsUV5jk5rLIS/25Y7BItzepGBPpPJ3Li05qHvfafmtq4euQeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721906642; c=relaxed/simple;
	bh=wCaY3kZbkwPEwo1WVvpupNrkPaJVQt2eCab1H4lT8xs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KPatNY+VDPObGRgPGAodm5A8CcVR+K0krKPs0fvxkdDM+VrjmfkXK9IO5P5OiGnCyQRIv9aw8Dr5+XSOs2d/mmSMWjOh1yqm9st4ujwOjgj/Ahu+HVd/qjcjYbGCsQ9JuO3nGKW0ZHAnOWA6fOY4y2Dlt8L4sjZOGUeeVwNifQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KLIVjdvU; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KLIVjdvU"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-427b1d4da32so10829655e9.0
        for <linux-sound@vger.kernel.org>; Thu, 25 Jul 2024 04:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721906640; x=1722511440; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xv4gNohsSEkyCVH7/4Ky3TaKWmsSwASlKN9kZ+B7LDs=;
        b=KLIVjdvUsmoG/FObLzxC5Hxcya+Q1olKP40UvNPNQwIQNNIyP3tcaS9BxQF7/+MdC/
         PLS/y+JVSFF1lagxu+e8wE7dSrPSaygi2Bg4sm1s/+m4ktbqgNnOlLy3iGvSUnbGrGbQ
         1Z38vYhauq5lbDgp/+W76BB2Xslw25RV7buNuFSnxBfANoePXgcX1FF9ZOFKklvdCOSL
         AlxFCJYYZ6z8XAMrpy7PAzw3jfrvXY51IHLGyjollCtNfVFUwZI6NaaP47swcXsC1DMk
         WM+Owcx1jgxIf18G6DZDHUUD1lsMtt3uLW+vd+7Uf2aLpHAozH1KfJ/1m5Bp0uAwJ40T
         SEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721906640; x=1722511440;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xv4gNohsSEkyCVH7/4Ky3TaKWmsSwASlKN9kZ+B7LDs=;
        b=odjXHQPgWhewMJCi70o5+xaWGAGFMs2bP+yAVhwhlmTePfk+jrMcjhqgYQUyLx7KKQ
         3evZyvD+hkgBQmgd05Z8GO97fW6pyDYqCcURJt0ENm0WiReKagXPnAXV68Gd+iM8guUN
         8yPy43Kyb1LXXBu3RQa9doN07KQKKzbxSpO5+9xq5mYAPXGF/FhKFsKyddngdNU8bT9j
         58y5VDfFwHyEcNsbhSpUMapCbvjBEQxH2jA8aX62vluX2RY8e+LwGqi2rg/oP9KEwhHB
         YBz6gJNVj6/EOBTGJDWn9a96NKs6J9d3IO3XzAnqlhEkD+cCvxs61+6krnwZirdcMSwv
         Fvqw==
X-Forwarded-Encrypted: i=1; AJvYcCWPcKEX3kjlSFzpYQAopciAdFEsHBhEnoQde+KsbI77jSLRHjHbbzikoCLqoBo6+kgxi3YWqNUsYi0APkkc1V7tVt3T2Be0rpCNMEM=
X-Gm-Message-State: AOJu0YwsF+ubwHerstGPTdZw5+2oy2R9aM3pCIZatrjiA6IXw71N+TD+
	xvd/RWzsXPX9ajIR62lBWZs4YrJaqaKL35qMYBVagCUUTww0qzxnPfUTw5UFLck=
X-Google-Smtp-Source: AGHT+IGm/CIUyj3+IUxZZKmv3H0osV1MgXdLb9MIQ274YozSOERMoI7OrS7UBo8OSd0d2d84LnemvA==
X-Received: by 2002:a05:6000:104b:b0:368:3ac6:1fff with SMTP id ffacd0b85a97d-36b31b4e832mr1771595f8f.20.1721906639826;
        Thu, 25 Jul 2024 04:23:59 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b367e072asm1823607f8f.42.2024.07.25.04.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 04:23:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 25 Jul 2024 13:23:46 +0200
Subject: [PATCH 4/7] ASoC: codecs: wcd938x: Drop unused defines and enums
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240725-asoc-wsa88xx-port-arrays-v1-4-80a03f440c72@linaro.org>
References: <20240725-asoc-wsa88xx-port-arrays-v1-0-80a03f440c72@linaro.org>
In-Reply-To: <20240725-asoc-wsa88xx-port-arrays-v1-0-80a03f440c72@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1947;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=wCaY3kZbkwPEwo1WVvpupNrkPaJVQt2eCab1H4lT8xs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmojXGE1G/y/P+dD388yi2q67mlhwNSH55Ia5ue
 J5SAo6TxlGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZqI1xgAKCRDBN2bmhouD
 1+PMD/sFQvp0fm4/dgfL44ISNSNtPIJ7RtxpANkZKBEwpAWzGQSQkefWW9CsZA8BDIlWUUYhlZV
 yuDp+BuM0J2cRJuiIxoe+h4pVvk9ijZhZ/HUbJl8Zn96fIj4iBwTgKDAj1v9Gojlm715UiO09Ym
 79VxPoA3GGiUnqFApEknQU3e8IhPNT1ggN5Qtaa6BN3E3qlXDhhNzCek3rUyw7np4xZTKdXLI4P
 38TsivcJnOC3YyhSfTrxlz+XISWJUQMgcVkU3SgZ6+zGNIHvZmygrsWJdfnLZMhll0IvJRjjLFC
 9TtRqYeSTfudmgY8bIXPpD1+At+hnKzVqm+7xF6dTldfCiyxr8xXi7nKNeFqEPm1dTbM7uRugH9
 ewGgaUabGqqqMuw6OvuMPWrxS/r3AVHxrJJCfYZyFLT49oeEhMHIqQqnHT6iaimZ2BFFOSOCL7S
 dThi1bR5uh+J0V72HQKBDyznrkN01sUzgGCLIcEu+PxvBoE7laxHY0sB1anxQ8MbtL1YR49UgIc
 PYBDYsTvnJnVZV1aI+w+5OKqcHoHIALGrqdwJ7hAGtZEgCL4uMzjnoDZmHTzjKZx9HHvQU0aJCn
 12OD7k++dFbbnL+orZmmO20nLtyBxYreAA8WH5diGk2yG40iZTH2TT7MhaS9kCme+y4QB+OljfA
 +erd/NoxFy5UjOw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Drop defines and enums not used in the driver.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd938x.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index 12b32d5dc580..aa92f1bfc921 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -29,7 +29,6 @@
 #define WCD938X_MAX_SUPPLY		(4)
 #define WCD938X_MBHC_MAX_BUTTONS	(8)
 #define TX_ADC_MAX			(4)
-#define WCD938X_TX_MAX_SWR_PORTS	(5)
 
 #define WCD938X_RATES_MASK (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
 			    SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_48000 |\
@@ -39,8 +38,6 @@
 				 SNDRV_PCM_RATE_176400)
 #define WCD938X_FORMATS_S16_S24_LE (SNDRV_PCM_FMTBIT_S16_LE | \
 				    SNDRV_PCM_FMTBIT_S24_LE)
-/* Convert from vout ctl to micbias voltage in mV */
-#define  WCD_VOUT_CTL_TO_MICB(v)	(1000 + v * 50)
 #define SWR_CLK_RATE_0P6MHZ		(600000)
 #define SWR_CLK_RATE_1P2MHZ		(1200000)
 #define SWR_CLK_RATE_2P4MHZ		(2400000)
@@ -48,8 +45,6 @@
 #define SWR_CLK_RATE_9P6MHZ		(9600000)
 #define SWR_CLK_RATE_11P2896MHZ		(1128960)
 
-#define WCD938X_DRV_NAME "wcd938x_codec"
-#define WCD938X_VERSION_1_0		(1)
 #define EAR_RX_PATH_AUX			(1)
 
 #define ADC_MODE_VAL_HIFI		0x01
@@ -72,7 +67,6 @@
 /* Z value compared in milliOhm */
 #define WCD938X_MBHC_IS_SECOND_RAMP_REQUIRED(z) ((z > 400000) || (z < 32000))
 #define WCD938X_MBHC_ZDET_CONST         (86 * 16384)
-#define WCD938X_MBHC_MOISTURE_RREF      R_24_KOHM
 #define WCD_MBHC_HS_V_MAX           1600
 
 #define WCD938X_EAR_PA_GAIN_TLV(xname, reg, shift, max, invert, tlv_array) \
@@ -89,18 +83,6 @@ enum {
 	WCD9385 = 5,
 };
 
-enum {
-	TX_HDR12 = 0,
-	TX_HDR34,
-	TX_HDR_MAX,
-};
-
-enum {
-	WCD_RX1,
-	WCD_RX2,
-	WCD_RX3
-};
-
 enum {
 	/* INTR_CTRL_INT_MASK_0 */
 	WCD938X_IRQ_MBHC_BUTTON_PRESS_DET = 0,

-- 
2.43.0

