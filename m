Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112AB2EACE5
	for <linux-sound@vger.kernel.org>; Mon, 16 Jun 2025 11:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750074864; cv=none; b=t2KjDSmkvmfg0uoAYmk7Cazy4yqBqeyXGaJw59A3kM5g8FpDbvIGYVlpHBMh1YmwcNZUSBpU6FL6wTRnpjiti6l0Jj4ACRFeNb+A9x5SMi7P+yaD8wtDyclyHACTFvmSZDydXQPDAf8SKC+TxwZqxJ6eSkGhEFV4asCwwKuVJpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750074864; c=relaxed/simple;
	bh=dko5KYqPzySoU9RnyDxUu4yd2haGpVUPNa9DkKFt8i8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SVTEbgets/sucU3hUmVlIlFJ2oPz995ahTV8RBoXs0/6X+lpD1G1pjK5g+3d/mTnInMA/ZKQOldDgNZAbBbpZgYpZoFcRnDW9YnIfgn41v5lfi7zfjMGGF4xXxI82IaIRTqiHFZvquDKrD2uMbKueZp8EACsH3pYvzqwbFpCJq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oxTxTlc7; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oxTxTlc7"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a524caf77eso665076f8f.3
        for <linux-sound@vger.kernel.org>; Mon, 16 Jun 2025 04:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750074861; x=1750679661; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s74Q0lewZDu4cRSnAqEZWy58R9g+TkWV9lfKe5cLOPw=;
        b=oxTxTlc7O4p869aojC80IEvQB+zc00aRohFibSj7/+ff6pEBDNb09u27hALoKebgjz
         +Y32GEb8MeTuNTxjqdqVhtPre6OZUYAS08tI+DMD2Q6GUXSxT6MXQut9iH+EjokFPwbY
         JBEpBdql2n6ShN/Y2kulKn6T4jDeVTu0giGCmQABdyK95siZ4fOca4o2XEMuSbOULSQT
         WQWYDk7bXS1ZB/XYm86hramaKfaKyp2ClCkXbooZh1x0bybUCrPLZu6gEsm1ixO43S3G
         d0meYzlrYyY3fJI0sdzefmNDFUBHSJLCEVOmkHuStHWSLPgUB0wzKUruiVE0FVnVKutH
         TaWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750074861; x=1750679661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s74Q0lewZDu4cRSnAqEZWy58R9g+TkWV9lfKe5cLOPw=;
        b=PWbSZ3lLuYDjyIwtjEPzoGndrP4j6oRnwhNbZo4uFz1PRQkjGPoosq0tIRqWkna1Tm
         0XcnqWxMEmOLLp88c128/VNV1qg6GTbknTmqELYcuuV1bLk3lByDiRJvznz/jV/F5YGy
         tD24oIHVKt6Js6JrfLK6+6e9JwJ3j2jE2L/hG1gKtsebYcvpFNz06XxXod2ZFqbMj6Uu
         ecx+zNBd/xQt2NuCW3jPeL5jGwHTd6510GSa9VMPcR2P0dziYN/PwmtlmhIsxqmMfTfd
         t8PEEDx3zIEfdDCV8MmYroF9ijJfXl6FrMWgIrNOeEf8xUvFaqUJ50a3geeK4W7TE2du
         Fczw==
X-Gm-Message-State: AOJu0YzGc+HlBn2yGu742b9DEQ0YbjNoBakdLcOjP7BaGNdkfLyA5aLM
	tFYLQrAYqxoTbcLtqUW5pkkr3VpYKhDyAWmnwhywMqQeBiYdREE2tJHFL0zS+voAYn8p155y129
	/bxQY/dvGew==
X-Gm-Gg: ASbGncuhs47yVYno+F636f1Hq3MOPAWHaOJpuPjwYvf0vI9IBhSY/8Sz00f50X2g7mW
	rxcikjEI7brjjwjJ1XH/2FqTa/Y2PxPK2a4N7h+KD5jo1M8VT+4o33/qaQCM1EG4DvZnoarhmFT
	W+ZZRkjfX0W8BRhG+WCXw7SXaHyyRPXkkIq8CfKNsz+8tUQHV6J6ONjDTqFTqqOSxoM+WqQi36F
	nzBQiYEoMkp4GM02+2yEbABuQgu3hqkV+CQpmV/6lFwJQtCYVnl1CQisteE+zmg3xk2JBwi0XZt
	9oKZUIgsEdjCrLHt2KTEBhBREKG8U9vVFZbhDkGf6RVbkVPjKtVJOIO5OXDf8xsl7e/S/gPrD7i
	ram/4Obw=
X-Google-Smtp-Source: AGHT+IH/vzfxOQnDsyqXm63fWShGso3DWBAqEt/dm5FiwNVVuEADqgBlxqoRPMV7+O8LrNEllx46DA==
X-Received: by 2002:a05:600c:1d0d:b0:43b:ca39:a9b8 with SMTP id 5b1f17b1804b1-4533ca48dffmr32383205e9.2.1750074861150;
        Mon, 16 Jun 2025 04:54:21 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4534172d2b0sm73485315e9.35.2025.06.16.04.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 04:54:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 16 Jun 2025 13:54:09 +0200
Subject: [PATCH 2/4] ASoC: codecs: wcd938x: Use simple defines for chipid
 register value
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-asoc-wcd93xx-enum-v1-2-a20a1b538509@linaro.org>
References: <20250616-asoc-wcd93xx-enum-v1-0-a20a1b538509@linaro.org>
In-Reply-To: <20250616-asoc-wcd93xx-enum-v1-0-a20a1b538509@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1838;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=dko5KYqPzySoU9RnyDxUu4yd2haGpVUPNa9DkKFt8i8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoUAXlted2iMiPCTeysQRJKBzzICcgFBdB2+3IK
 vEOAmuPyx6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaFAF5QAKCRDBN2bmhouD
 163tD/49Fig44V6VoJDkbLhvhxrRXs53a768CECa0NdKIH2NbRwizSBrn8KZOK1OKAobQiOMT0w
 a33qwjLXDPIkZpbPlmHIu/if1bjbjzVJ6byO6X1sS2sqHdKSRj6qnIgymPCF/9DaTtS4WOrupDA
 1kaNSiPWtquJr7kX23lZxJg+6WLEtfLxSov1Gy0KEJwjxaDtTtDiOc1TJbkgbix/OeAyml1PW9k
 JH/J78VjMJG8uE0/Be4g71ceCCKWJ7GgUjga9dX7St+X1I5RWppCO17PKGkLhuQpef5urdMeY/1
 aZdRAM4PjMM5gFsUkIzI/N4y6LiNt3iEuszT9W8P4ZkhmzQfEy1NOTqJjRI8wTUobhnJW2qaB7O
 V7E70+OM9Ui5wcrI0cruNjeVh/AshnO1UEdqVZXtSWq0OVjWqlwxNNrBalwssQ4l/wZOceQ/ure
 q7NFjw5pgOnrz2tTyknK92ZgA7DSOuMsCTRWffsD7jE3hbA/QekgiGxt3pW837Zl4n1mVkc2HRP
 6t8+4ZqlvlmOvMt8K1sx3HAlDPj68qkNwD+9m6Y9SYFHDEsTBB9jKdiCUpwdTEZOe/6UarU3MMu
 CqVF+R9oNvsWPbrcFoNtYTrbz+yqEMgdQDUlK3WeVTYFmJFtnLvLVcGXYbztKSaNaiY4YFnuVRQ
 r9pth7D/yp+vXIw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The value used to identify chip variant is not an enumeration, but raw
value used to compare registers with.  The 'enum' is not used in the
code at all, so simplify and make it a raw hex value define, so
intention will be explicit.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd938x.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index 6401ac32d1b6faf3f8c97be62e51c809016a954d..711f373ece24cf4e0db73e9e9b8432b3ce3a1717 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -25,6 +25,9 @@
 #include "wcd-mbhc-v2.h"
 #include "wcd938x.h"
 
+#define CHIPID_WCD9380			0x0
+#define CHIPID_WCD9385			0x5
+
 #define WCD938X_MAX_MICBIAS		(4)
 #define WCD938X_MBHC_MAX_BUTTONS	(8)
 #define TX_ADC_MAX			(4)
@@ -72,11 +75,6 @@
 	SOC_SINGLE_EXT_TLV(xname, reg, shift, max, invert, snd_soc_get_volsw, \
 			   wcd938x_ear_pa_put_gain, tlv_array)
 
-enum {
-	WCD9380 = 0,
-	WCD9385 = 5,
-};
-
 enum {
 	/* INTR_CTRL_INT_MASK_0 */
 	WCD938X_IRQ_MBHC_BUTTON_PRESS_DET = 0,
@@ -3119,7 +3117,7 @@ static int wcd938x_soc_codec_probe(struct snd_soc_component *component)
 	disable_irq_nosync(wcd938x->aux_pdm_wd_int);
 
 	switch (variant) {
-	case WCD9380:
+	case CHIPID_WCD9380:
 		ret = snd_soc_add_component_controls(component, wcd9380_snd_controls,
 					ARRAY_SIZE(wcd9380_snd_controls));
 		if (ret < 0) {
@@ -3129,7 +3127,7 @@ static int wcd938x_soc_codec_probe(struct snd_soc_component *component)
 			goto err_free_aux_pdm_wd_int;
 		}
 		break;
-	case WCD9385:
+	case CHIPID_WCD9385:
 		ret = snd_soc_add_component_controls(component, wcd9385_snd_controls,
 					ARRAY_SIZE(wcd9385_snd_controls));
 		if (ret < 0) {

-- 
2.45.2

