Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A04A14B967
	for <linux-sound@vger.kernel.org>; Wed, 25 Sep 2024 04:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727239111; cv=none; b=SBfGJe3R5AMEtmKfKXVvpbH2Fuwq3ZcYv3nGSAuQAQH9ctxLNoxaeKezJPy5PrrwyjOHhniq1qG3TyWVsziTXsQ53Y+oSdJY42Wye++XQ1VIgDDrEOA0Sfb/XfwN/cA8j+t8SEBQwVsw2nIDHXaBoUhoesQf2yb3KWcljZmypCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727239111; c=relaxed/simple;
	bh=ciTImMBS0p6wks5mQK0mcllczL97Z3Zssq9pfQWx3xs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jCA5G+Ef/qaeJOZWBi94AEwwefj9P0tZlRFsNvYCw/nT/UlSWzXX+6zwdygpIWnerrw9+xu5eKf3vEQLcO2JbQSkMO3NLZ5UkZSXm2spxs5ilBrIfNSKnd10BElq1LUz9XmjBKHObqwMdhcuLiT25K8pIh0ywGmCU3yr9cDwPnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MAoUc2lk; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MAoUc2lk"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a86e9db75b9so983488366b.1
        for <linux-sound@vger.kernel.org>; Tue, 24 Sep 2024 21:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727239108; x=1727843908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eqcG1Y/DqvLJS0U3eydB1IqD9oVuSGX+UlV/1xSIyT0=;
        b=MAoUc2lkIfHSanC/k/VTS3tfcLqGjtvLOJ1vBgdk5XSOQikocbEsybcfvdR2zvCkvm
         XtZqCSLnazE7kbatmo4zRCmqW8FBjZmTPq/mRAhC4gWkDhs7mcNfVVV5F9TnDlegGmSV
         tM0SOOtePdpFqIjqreVW+FeJI/NzpflmK8ygXDVScD+jJa5keRXS7s4ApsCIshjeWu6e
         GOL0sg+AxDW3KnKsYb7v8c9WhT1FTeF8li864PJqYUBRaW7/QUhGFy4l+k1VnmlXcGbh
         aUULabtyx7TtJDXRA8vEsZb7AHgeSEnBugAx4Ca+o294BD6ak9OgVVTIuZcYz5k4JR7l
         adoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727239108; x=1727843908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eqcG1Y/DqvLJS0U3eydB1IqD9oVuSGX+UlV/1xSIyT0=;
        b=WiDHUbZegRh7u0ml1KP1cyv2oyUn1k5z2CesuBp1UUKl89bUTbIxVKi+IoaRODyS0J
         I0rwDg89yn4p5vuuqPNJgbo/WL9/XrOXD4KGNVH58Olf05v0h9Pv5u74kGLLKeW2+/oq
         b4VSfliRAaW7d/dj4/gHos0U1pLtvPE4+BVdBNa7/Vhh6pNBzPjlKvBAiTu4uhqELHNC
         7gASQIr7mjxOB5TIMiYyoZJsYT0RusL0MUTIU8z3YDGRnmDorpgJ/GEPKzPFQKjQQjbF
         U6O0/JMchOH5mut0KqyeoYqMR0pggPYhb5zJEBccxXDBPSrYm0T97BZR3LWdkHxOelRu
         iAMg==
X-Forwarded-Encrypted: i=1; AJvYcCVv2K3N5Lgg1avJgdy2TogvIZhpvSMtKlBtHEXymW0uMReLsJQ22RyZNRY/gx34UUVGfkCBdxjBtWkHEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKMePSUoXYgm6gLhbafBu2M0DSTjo361/iNeL25M6B8oIEj8vY
	9/biHaotgSOX72J3TXeSr46RxABcCwHI/F4Hl2askeMuHvqDXx7XX92zUgsywUo=
X-Google-Smtp-Source: AGHT+IGxDWA9Bpt+Vo+5NwY4exmWH9AugLbSR05W212S951aBgbB3SXoz6SBoMQb7pJmFGUWWMTH7w==
X-Received: by 2002:a17:907:f14d:b0:a8b:6ee7:ba26 with SMTP id a640c23a62f3a-a93a0322a63mr119177866b.1.1727239108517;
        Tue, 24 Sep 2024 21:38:28 -0700 (PDT)
Received: from localhost.localdomain ([2.125.184.148])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9392f346casm164857466b.24.2024.09.24.21.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 21:38:27 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: srinivas.kandagatla@linaro.org,
	a39.skl@gmail.com,
	linux-sound@vger.kernel.org
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	krzysztof.kozlowski@linaro.org,
	vkoul@kernel.org,
	klimov.linux@gmail.com
Subject: [PATCH REVIEW 2/2] ASoC: codecs: lpass-rx-macro: add missing CDC_RX_BCL_VBAT_RF_PROC2 to default regs values
Date: Wed, 25 Sep 2024 05:38:23 +0100
Message-ID: <20240925043823.520218-2-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240925043823.520218-1-alexey.klimov@linaro.org>
References: <20240925043823.520218-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CDC_RX_BCL_VBAT_RF_PROC1 is listed twice and its default value
is 0x2a which is overwriten by its next occurence in rx_defaults[].
The second one should be missing CDC_RX_BCL_VBAT_RF_PROC2 instead
and its default value is expected 0x0.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 9288ddb705fe..2f6699c0a643 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -961,7 +961,7 @@ static const struct reg_default rx_defaults[] = {
 	{ CDC_RX_BCL_VBAT_PK_EST2, 0x01 },
 	{ CDC_RX_BCL_VBAT_PK_EST3, 0x40 },
 	{ CDC_RX_BCL_VBAT_RF_PROC1, 0x2A },
-	{ CDC_RX_BCL_VBAT_RF_PROC1, 0x00 },
+	{ CDC_RX_BCL_VBAT_RF_PROC2, 0x00 },
 	{ CDC_RX_BCL_VBAT_TAC1, 0x00 },
 	{ CDC_RX_BCL_VBAT_TAC2, 0x18 },
 	{ CDC_RX_BCL_VBAT_TAC3, 0x18 },
-- 
2.45.2

