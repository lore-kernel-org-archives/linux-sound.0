Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9430D22EE8
	for <linux-sound@vger.kernel.org>; Wed, 17 Jan 2024 15:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705504343; cv=none; b=pUjH+RjmJiPdNFuPDAje2Qk/QRFeOfaOkDK1bV9xHrmQCy0CChLkokLDRKPmn1ZoV7FAVKUDU0nEw3xm32u0PBBXIzfzZWmGLHoinJ0HGhEx/sJXD/88+ZJ0pNPc2v/yyCG+mkdesgoLfIHDSa0DHXxnKa03g4ZvQxXN0lnyh3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705504343; c=relaxed/simple;
	bh=CEoOOu3lx1F0t2DXMRp7Dd+POoFYCjzJbOK7DJcvqdM=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding; b=gkvviWcHQZ9sWsliltY2Wahx/wUBgpZdZzb1aOBs7JxUACV1crgnJ/mk5kVxaRDORmz4v/2W1/+/RnrKB+lb+lzBSUKk+W8palxG5igla/IdC7/Im5Wt1a6QU7gQTMMbgJ6x+B86PiWyvRUEOja4lrxARPWKlTz291aGXeJugSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ImRlAvB2; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ImRlAvB2"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7835aea8012so177073785a.0
        for <linux-sound@vger.kernel.org>; Wed, 17 Jan 2024 07:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705504340; x=1706109140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jvT4DYI0xpteMdP3q2s5kHm3KTUWGSKMdy7WHIRX+6Q=;
        b=ImRlAvB2VX2WoNVjVFkfAx2s7RCaWtKacz9r5L6xihfvPiTJ2k9Jke0HVphWCK1XDx
         A3SRXZ1jdXTet/Ehp5MCjuDir0QX5kI3IEDABQwtvBLMKMwQxgMgV7HO4i3vQVHmKCGr
         ppPA+SpLOyaVzQyWbAQROpeKG3RGadgMobg7ep1jSTbIp8UEDNgroZR23oSmdoxguDvi
         GDf7oubtV+UJYuRf9Qb8AftsyxqofTE6kE8qpnNE8HNLoXV60FUALJpY825YZVHMjmTo
         vD4QEDp+A8dsAtynAKDB1DX9GqOrvWpHqCR7N7aHvuAMfroH3NfuXqR0G0jG+1rV6xr6
         CHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705504340; x=1706109140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jvT4DYI0xpteMdP3q2s5kHm3KTUWGSKMdy7WHIRX+6Q=;
        b=xQehlJT2RX6xPHfGxJR3y2mYcnWoHMkW8/kdcwlY8NWKy5mLIQfKGC+Qu5b3B/kOWu
         Yebh++n4+ad2+Q9lR8FvG58fT6I22LCiU/9H8TIFLJAQJ/FpLSGykyvdhiGU5fK2QI+j
         TIkVkbNeQV00ISL3RjytlcMaoU6NTkMQEZGfOazHb/LIYoptbJgBnDCiTEiRY3oZe5Og
         gvMwwkS/uUQbe3OMnonJ+jU98Rs5Oy5amMf/kT6IgclXKliPHZShgxXvtzEq++ZoG7a5
         CCJO3rGegKizJrjeuWr+lZ5kzWsm2XDcwH5WLpDFoRAAhmQk5XV44V4pO3u1XwA+WzMm
         g0Lw==
X-Gm-Message-State: AOJu0Yz5lARtVuNJONfC3HjXtI85PhUAe1uwfg37VuEO+MTKWap9n9xq
	WrQle/8W2Velwy7xQSfLMS7pKH2FkuarHA==
X-Google-Smtp-Source: AGHT+IH39mkNRZQTB7lr0OTpjPsUCqmf9g+mw8wVtjmr6UAff5u+AAbQ2wJeHKe/MhvIiKUuawEWmw==
X-Received: by 2002:a05:620a:10b4:b0:783:4e8a:6b19 with SMTP id h20-20020a05620a10b400b007834e8a6b19mr7348059qkk.14.1705504340607;
        Wed, 17 Jan 2024 07:12:20 -0800 (PST)
Received: from krzk-bin.. ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id m7-20020a05620a24c700b007816cf21f7asm4519337qkn.76.2024.01.17.07.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 07:12:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/3] ASoC: codecs: wcd938x: skip printing deferred probe failuers
Date: Wed, 17 Jan 2024 16:12:07 +0100
Message-Id: <20240117151208.1219755-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240117151208.1219755-1-krzysztof.kozlowski@linaro.org>
References: <20240117151208.1219755-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Probe calls wcd938x_populate_dt_data() which already prints all the
error cases with dev_err_probe(), so skip the additional dev_err().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd938x.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index 0aaf494844aa..54a21d2f5c40 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -3587,10 +3587,8 @@ static int wcd938x_probe(struct platform_device *pdev)
 	mutex_init(&wcd938x->micb_lock);
 
 	ret = wcd938x_populate_dt_data(wcd938x, dev);
-	if (ret) {
-		dev_err(dev, "%s: Fail to obtain platform data\n", __func__);
+	if (ret)
 		return ret;
-	}
 
 	ret = wcd938x_add_slave_components(wcd938x, dev, &match);
 	if (ret)
-- 
2.34.1

