Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F2E1940AA
	for <linux-sound@vger.kernel.org>; Wed, 10 Jul 2024 13:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720619569; cv=none; b=g0nW3NMyQcnczwMwbqZobYfZt2jCqA2BWzSKIEvE8bwNm8/59Spp7jwhVkk+6p0BWEMEGqIMGmuRYWuq9gbZr9BwCszjzDumVd/U0mck28ULpIdr70MTDpybJ2ejrs+U/J3DqOCRFX/NLWG5kh1Cc1guzIwvSb9p9T/o0XLkBkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720619569; c=relaxed/simple;
	bh=WB7TReeuz9p2xJwiha6GQMNAWLN4DRCFhtae1ITPqrU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Akp3hAcSgLQEr+uH5yvgFtgR/AylegGeivi2O0sZFzYNwUSQd4WztpuxijeThTdTCbLPp8f1PytRzYjAE2BF9ztOGQVeK31Vjj7nO6wKt7+U2WwxoEdHU1K6qXN6kxeUwLg7/F/GR7AlZSqM+6yCtr1YlYM1U1/qa2wNjsANVVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XHcxNJ/j; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XHcxNJ/j"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-595856e2332so2182577a12.1
        for <linux-sound@vger.kernel.org>; Wed, 10 Jul 2024 06:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720619566; x=1721224366; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4OC8QeR0kGY9dWOXLH/zkl7I9eWhOVZEAFq6fczOPCU=;
        b=XHcxNJ/jGQnIGOKGtbyafjR0XuYMxxUhrsXsXHrj8sTuqoIatJErgNSKBLF8hy2pTq
         vgENq3VtA1SuMUx7ck0/b6cvbqLggzOudGnnm8Y8sSz7NCureGszQWLa4vB0ygZBo6tP
         gcf/ogn/j/BrOgS3oTHF1upUsS3Imj2VLKz2DO4qRj4koBWgEpOn20Q2c1T+mKglOEDK
         sK44IgMhhT4lEdni2UowTqNjhpFc1pLCHShRvPFCNZBr5vd4LhWJOsNKq9vypdnV6VRN
         ts8OYBnZkeLGICScjc0UK88wzNi6GxWtZIlNkuo/oG1ObFp6Yptt6O0mtIPwQdZ8oFul
         hpoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720619566; x=1721224366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4OC8QeR0kGY9dWOXLH/zkl7I9eWhOVZEAFq6fczOPCU=;
        b=Wb86UGMJUgGWJ0SXli9qqBSk/4IzgMh1UJK4WZ/F/sg54evxODOuWCADoDBW4WNY16
         k/79dfC/vsvpqY+AkT+3eM5Y+aq6KGZad+XlkMvoItlJx0/wvV5ihhs+DWX4H6ljtmjR
         dIclV8VluXUBOEANUNK7f29Yjc20TdBz5vElEqPA/93Z6Gs9mZHMZUrhHvAYihWsynRk
         HzbnncwuL3Ujnt6n7sAC+YLnXBmJ8aYddBZLc4fl2R0NR4EoLZ7Umc+WR+TK2rVgmtE+
         HL3nbCJ4lPAVy9v0JIQOZ2Y2wLuFpEUF8OrmJrlVuB3R6XC7wfwyNNekETWtPD8S5hPP
         QLOg==
X-Forwarded-Encrypted: i=1; AJvYcCVKpOqTMN0NApSMbMYPx64WHvlUZv8cv7cv/SspDGKR1bifeOFA3XER87WYQJmjTVNDVpKDmpPoVlu3Hktv2CAy6KrwupsuuFns7o4=
X-Gm-Message-State: AOJu0YyZUJxD+Z+90ckWilldHIT+6ucHIIDwGE70BX4FEKDTV28807yl
	B2Yr4cC0Yq1Zq5+orki6N9CWrAXruaXSJ2zlhrYQ545EISthjf8HVR0RtFuAm1o=
X-Google-Smtp-Source: AGHT+IHgtY+jl1RRnFIQyLNJ97fWPscsE9ZarFQHgaMGp518nrfXgsChqvgkK2KRYnMJVo21PLAlww==
X-Received: by 2002:a17:906:40e:b0:a77:c824:b4c5 with SMTP id a640c23a62f3a-a780b6b18ccmr394586466b.18.1720619566685;
        Wed, 10 Jul 2024 06:52:46 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a8551afsm160440366b.166.2024.07.10.06.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 06:52:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 10 Jul 2024 15:52:33 +0200
Subject: [PATCH 4/4] ASoC: codecs: wsa884x: Simplify handling variant
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240710-asoc-wsa88xx-version-v1-4-f1c54966ccde@linaro.org>
References: <20240710-asoc-wsa88xx-version-v1-0-f1c54966ccde@linaro.org>
In-Reply-To: <20240710-asoc-wsa88xx-version-v1-0-f1c54966ccde@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1636;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=WB7TReeuz9p2xJwiha6GQMNAWLN4DRCFhtae1ITPqrU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmjpIm7n6j5rSUbIfZVj7o449ncopexzUhu5/AH
 QhMa+YOvCOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZo6SJgAKCRDBN2bmhouD
 14ApEACN2oL1zIaMFQ6Ucxm9eW4neIeeG+DeSn0dTmGO/kaA7yYrMtBe2eKxURAmT+3Ijv1mPxY
 +P3cezRBgIYmjOZB9h1HC5sVa03qi8uxDTWEt/bS4Cv6MgiLCcO6PPDQ6x1soaa84/UnJTqhhQt
 O72gTTfh43MgNod0IdVxZwzKGSnszys0xnz8cFfV63ufqG15yAxEIxE7ZAY36AMD9X+9FiLZI/S
 uWJaUEikPGXGqgx+Wprq3XuRsfY2GiC0IrrUQ5WywC5tLMtT/mBusRx5qCGw6WFB1gzYq1n5RDP
 1Kgz+3i8DrXB82SmohXpH7+qct5J1JZr4hgdwQj4EwrCBLTP92RSUTtFdiYgIRvrxzTTr8xm72U
 mC++PSeRb3/5oW36Z0CODwjstoWljyXx2J0avKPzA4Ks+KSRX5CtrUPGmDABiK9lkphYDP8rKDd
 q1rOAebtS1VNdlqBMRpFxDm9xPpt7/scouggv/f5IJotxnzBK7nhm+WvcHUTfy323HcaGQLYhOJ
 sEcQ4B6nRfoHs89zpeu5NorK8TpaGtSxDr+1rClWFFSacX6/DlTqoU+vDvUi6XT4h24KTmrCcBm
 yvb8RG3sWBUu8KXRGmEPF4od0ljjHUy8mb/lHM4UONia/GzRWn6w7MT3t/OyIgDVCFrYcX5HeAd
 Ywz3QTiBnCWhrVg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Driver does not use detected variant variable past the init function, so
do not store it in the state container structure.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wsa884x.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index a6034547b4f3..7b19df9c1728 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -703,7 +703,6 @@ struct wsa884x_priv {
 	struct reset_control *sd_reset;
 	bool port_prepared[WSA884X_MAX_SWR_PORTS];
 	bool port_enable[WSA884X_MAX_SWR_PORTS];
-	unsigned int variant;
 	int active_ports;
 	int dev_mode;
 	bool hw_init;
@@ -1465,7 +1464,7 @@ static void wsa884x_init(struct wsa884x_priv *wsa884x)
 	unsigned int variant = 0;
 
 	if (!regmap_read(wsa884x->regmap, WSA884X_OTP_REG_0, &variant))
-		wsa884x->variant = variant & WSA884X_OTP_REG_0_ID_MASK;
+		variant = variant & WSA884X_OTP_REG_0_ID_MASK;
 
 	regmap_multi_reg_write(wsa884x->regmap, wsa884x_reg_init,
 			       ARRAY_SIZE(wsa884x_reg_init));
@@ -1474,7 +1473,7 @@ static void wsa884x_init(struct wsa884x_priv *wsa884x)
 	wo_ctl_0 |= FIELD_PREP(WSA884X_ANA_WO_CTL_0_DAC_CM_CLAMP_EN_MASK,
 			       WSA884X_ANA_WO_CTL_0_DAC_CM_CLAMP_EN_MODE_SPEAKER);
 	/* Assume that compander is enabled by default unless it is haptics sku */
-	if (wsa884x->variant == WSA884X_OTP_ID_WSA8845H)
+	if (variant == WSA884X_OTP_ID_WSA8845H)
 		wo_ctl_0 |= FIELD_PREP(WSA884X_ANA_WO_CTL_0_PA_AUX_GAIN_MASK,
 				       WSA884X_ANA_WO_CTL_0_PA_AUX_18_DB);
 	else

-- 
2.43.0

