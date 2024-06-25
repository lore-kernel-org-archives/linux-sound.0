Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5AC17623E
	for <linux-sound@vger.kernel.org>; Tue, 25 Jun 2024 16:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719334746; cv=none; b=Cga7/7s42fgDD+vXzbjzg24dzjDoLLxM+MhaXjnAGNcqSDHbiq+IyTz3T8avqY9YN5ZBBn3wK6G+EySYqB9ycztB+QeD7GgC6SyGDUNeuSY+Ti3bMFdM1smkZvlUyoGxAiYu4c+A0g1ehXS56BmcSr9hF1afoEOcq8mtWuNsjU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719334746; c=relaxed/simple;
	bh=vF37Z0aZiJEeLWEKoNSeoRo+xDDMR/tNEztnp1b16K4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R4/Fo9A+Se8RGxMnbDn5wcJ0e8fjepA7g39UsdkPyaAia9kMZxjNIV1CkVgIDIiq1jiqM5muCcXGde9L7kaQE85/kkwnVyFbWz6FE3oQYVcwq4YWXfk0JNV+i7O+Iz4FJ3TRltUIYyhX6vvhUf5GBAyXhwuak5EGWHrvehc9tjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dcZIrqfp; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dcZIrqfp"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52ce674da85so2545403e87.2
        for <linux-sound@vger.kernel.org>; Tue, 25 Jun 2024 09:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719334743; x=1719939543; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=re76ACXG9OmJmqLT6FZEpdvG6nPrWdtBRKUnS+4yqic=;
        b=dcZIrqfp8OrxErBKmBJFIzdyCS202Dt3ebWdcJIAgH9ojEptfEeBJoHFnuE2tD8tTo
         n4hTO4tUkddJM/uk6P76P3k4grf+lh189wwYCfl152k8KNJOpmKOgB6IlG6I8jV+Iih1
         CPwb5LSmjl8/fQkqBMgWHhTd4DBlIJva3FbW7SYvqSIaJKGG7JYMKHxzhob8AEqoXDHE
         qfKR377sCGsYOn1qbvtMyMBNWxdjxta5bY2tb7RqadfwmMnqgB3cVwCOD6kllKi1PoON
         e6Pxg63EtU6XjKmhGZet5zdEHhNgbuDPf/cdUmo1GT69oZAmTn/x5U+3jTF3rTJfTZk/
         bZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719334743; x=1719939543;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=re76ACXG9OmJmqLT6FZEpdvG6nPrWdtBRKUnS+4yqic=;
        b=GgeB4G4Q9oqhrOMSRxX9wMhdd4VqneTO+PNtq4SaytY9ji/oMT+Lzcx+3EIlrf+A/Y
         2+vaWtjo3aeepGTTWoXEgAdn0zcYRaWrtUCr+S7dj2D8J4LiDYkqa+CYlYFkPGqy9aQV
         lbNJ6XHBVCqsusTl5G8RM4cD5R2zaN+8K8Y4AurAQcChjCFXGdMc712kvRcjzdTvsapz
         gnV/xmojLLI/x03bfyfxr3a6ZB2W6Y5NnC4MpZoEDkMrW6wqvG/2dMU+veUXCpIn3+jW
         8TXTbj5SgC6o3ryTZVEXgDjPiWZwQrQygyi2gbO2MlWJkLTeajIRbOnXd8acixVZ26uH
         nHrg==
X-Forwarded-Encrypted: i=1; AJvYcCWxpF9sKMHY2PGHskgijxeRM8ynq4RpK0uPCa6KY5R4Ja7a2pds4dlY6SucEuLYUVzFi74vnEbnxXWLaa05Cqq0jVXYcyjydTnF6Lk=
X-Gm-Message-State: AOJu0YzI3KxAAK5jlsndByE3vUyS2rXM8VMPQc2tNvRlf1gBoHqYX4F+
	4NDptCBeMyCJLJ3KwadtPeCsllEMVgmrCdtwxBP4LDWtL6KSVT0iMNFcP2TC6BI=
X-Google-Smtp-Source: AGHT+IGR7Qhyf8Y3HWNl1SPoUEbvvo2YHcOxUjAhBJioVQV9vrofLD/WBQj8YIQ9FREJo6iOttG1lg==
X-Received: by 2002:ac2:515d:0:b0:52b:c233:113c with SMTP id 2adb3069b0e04-52ce1835167mr5952139e87.17.1719334743050;
        Tue, 25 Jun 2024 09:59:03 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d211881sm217969785e9.46.2024.06.25.09.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 09:59:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 25 Jun 2024 18:58:45 +0200
Subject: [PATCH 1/3] ASoC: codecs: lpass-wsa-macro: Drop unused define
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240625-qcom-audio-wsa-second-speaker-v1-1-f65ffdfc368c@linaro.org>
References: <20240625-qcom-audio-wsa-second-speaker-v1-0-f65ffdfc368c@linaro.org>
In-Reply-To: <20240625-qcom-audio-wsa-second-speaker-v1-0-f65ffdfc368c@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=701;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=vF37Z0aZiJEeLWEKoNSeoRo+xDDMR/tNEztnp1b16K4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmevdR2h79GggPHusd3v4VoaUckqX1xpQHoZro9
 O3/5py+BuSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZnr3UQAKCRDBN2bmhouD
 17waEACaU+lphVs4h28nyJ272D/X1VUo+55FfxobbeqYsSpPQ51epzL42gqR6bZv/EAhLTwpt9p
 tIis5PZNOFo84hb8oeOmO+BOQJ2mLXJlXxZqQIyKY5up0QeZVRjsPhiuKEfXgBEMCHNHfHFMN3+
 HphpHgIKzGKXUYKrhe9Ymyz9/idKlT7q+YbJ8kaIMSNGHAmxhnBio7z87BR0u4oepsPiMYb4XRk
 6OwBj/p0uW9Ux2VOb7qn33XJvVRAxJXLVDQIsktfSKvVKaNQWBZouBalLkU7PpAXhxbZt85qgrA
 X2TgQkWpNalV4iUINTzg1xdLleD6++IOMBvrfyLtotLRV95YQwZjjqCgPXCjVJJJzZTUeVBpJgN
 M8F9oqkjDzJVvPd+85LopPzGg/LN7PeJwumRXczq8KZ6un/s+JJNOrYMadyjc39bULymJ7P/CxJ
 IUne9tVtpFoyvXGI6sivNZ0ZlWhPzMo4ysolyQZW6t/VAXU17mxWsZguBDEbwgNlZZSfbWd1Axu
 AgYjSR37ujOpePfPwL+Qw6/fnZxEtLxoGTvXQ6szdtfzkY7r4AaN3GdZ1IxXqOewTt5Lo8iaOi2
 zGCzV+jMP4w2wcumATat+vyR/pQ/kSw8Xd/n8tGi2foCCe6J3y3xQXqUt/Y3zKtvNRPwfDa0TN7
 KvinIJNSTw+speg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

WSA_MACRO_MUX_INP_MASK2 define is not used.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/lpass-wsa-macro.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 6ce309980cd1..d12aff62a868 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -235,7 +235,6 @@
 #define NUM_INTERPOLATORS 2
 #define WSA_NUM_CLKS_MAX	5
 #define WSA_MACRO_MCLK_FREQ 19200000
-#define WSA_MACRO_MUX_INP_MASK2 0x38
 #define WSA_MACRO_MUX_CFG_OFFSET 0x8
 #define WSA_MACRO_MUX_CFG1_OFFSET 0x4
 #define WSA_MACRO_RX_COMP_OFFSET 0x40

-- 
2.43.0

