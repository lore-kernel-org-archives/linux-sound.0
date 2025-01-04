Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB381D63D1
	for <linux-sound@vger.kernel.org>; Sat,  4 Jan 2025 20:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736024090; cv=none; b=rtlQBap14jH55qIdsenuc3bVWU1aElbCh+k4wbsmbOeExInstX9KAuRt8hEOybrSwk5XDzOB1lgE8by4Vv+ISQPklrY3DiDdhUV7jNPvemtt4DNfhH59YuSy/CMI2fO8ZgqX8QWVlEwVunIHoiCro8XRUm3b9vqDA8UtYV+XSSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736024090; c=relaxed/simple;
	bh=OVi515b6fvB1D8FMPWpdYGP+XIs4Du8HE+mgPE8IwMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QASe1hjH/6C+hBtJHYAcFP7UOdp71wimdOf/XnVVIiSkHEe0DRhAXqC+/EYpxqfOxaZdyQ3NJs7XpriSmAadBsD/lQHa7u05CPLkRXTaBnvdH4+cu+Rl8LwbZUi+nVARQjuFlyPnAuTC093aEcabdi7FqoVi5bIPDRAcn+Li9Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OqBLnas0; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OqBLnas0"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d3d69e5b63so2180192a12.1
        for <linux-sound@vger.kernel.org>; Sat, 04 Jan 2025 12:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736024086; x=1736628886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/5tKgeyFg00MgtfGaAYBuFBjwqBNpORNVJY5iBPqbW0=;
        b=OqBLnas0b3u2iphRWe03NbjI9mEC+QoYFvHc7vHsBTCAdTqXB09dyuMPCIS8LbA0/j
         0MOEz5wCDpMW+v6WZ6XLrrgzkUkC1BKicdJIChrjeDRv2Em+iEtSAzfyIG+BbTBDE6hk
         fzfEvzyelEUH3Z2Ypa9v3zbQYTFBe+ZBJCPuhldNbksJdpFqrZRChtgu1m61RVC+sJ2Y
         1DOxw9V9xxpKchaynbwuBVdJUlnED9WJtewEzwis3lo5GlIhWO1cCflU51ecb8ng70Bk
         iod3rOndeUw1e/Kx2WffdCIsK+fZstD5VIkhepAokhf1B3nBDBBlt1JWgOc29uEPvykc
         JTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736024086; x=1736628886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/5tKgeyFg00MgtfGaAYBuFBjwqBNpORNVJY5iBPqbW0=;
        b=oTrFlNoYWxO19tjlzgSwDcBRJFV/XzU9eb1Vv3KppF8qPoCTQ9xlTUJBy4077Gb92+
         LspubeZRfyinrwuXBgz9gr39w4nQZfBRAoVdVqfrHWzzKZ3bZ/hnvnz5dN/XrjHlPY4L
         9NH/+fx3pdR8JvnjbXZ36DSyhlwhVv7g/YXy8+hJjwC+4qEqvymGmxgm9GvwN8+3SEMa
         BmP7A0AEIWhmP2kIYA8ErAGVS8tyn6WdJ1VG2FnKxsRDSGdySTX8mH2mcsAtlaZMsNa3
         2DjRY8RLVFRgC5EhyrFakCgs+CRrlEPOhLvhQZdO8Fp6hH6xV3mMuP0/pCNUc594LPYc
         t7ew==
X-Forwarded-Encrypted: i=1; AJvYcCUv5HySMe7NE/4MzGz6N2DBn27ypXk2BWupXLjjfVqo26pgisAqKouhXkeFXXRVtAtT9PtPzM7CQMVfRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlZ7YQ2mo/rhQid9B5vqBOKO9lByNQ17CnSh57WajsKgyrQXXV
	3HrfPW4Aw8OJUQhOIvuAE9MjJLTJCtGr2TUYWLccYKglP9DyrkTQcumqiazWkGo=
X-Gm-Gg: ASbGncs2ei7RH6bXP9zjrkHNR5f/vuTcJWOG0yfWdpDuB8qBnn4yM40PGa3DzN+Yt6e
	HWy/LYbazYsjiUK1M+brn93yhE8iykH8bGdPqVhvXLjLbCVlqJjklAbC3RBfKfKxTa2IbtWr3GM
	lOzUzdexeXi/iHMYKp8qatHGzbyAAw5x6aHaSY7FT3XJhfNuGWlzsBR2gjKkHo6wHbsEnac4oHc
	NqwlxEyJLOxwtvmuEPVwOdMS5xmQc8XLwIpLgl8LRIMwktI4yY7Oeshn64wc+OCqeIBH7Q=
X-Google-Smtp-Source: AGHT+IFYBTBJPclwUSGwCj06Or/uq4VGv6lfISakgOmL+cPEXrHfIpLkbx2RfKlkxwiJ7dN0dGBBQQ==
X-Received: by 2002:a05:6402:2349:b0:5d0:214b:96b4 with SMTP id 4fb4d7f45d1cf-5d81dd5a17dmr16470255a12.1.1736024086537;
        Sat, 04 Jan 2025 12:54:46 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aaf4a841749sm839666666b.137.2025.01.04.12.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 12:54:45 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mark Brown <broonie@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/4] spi: cs42l43: Make handling missing spk-id GPIOs explicit
Date: Sat,  4 Jan 2025 21:54:36 +0100
Message-ID: <20250104205437.184782-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250104205437.184782-1-krzysztof.kozlowski@linaro.org>
References: <20250104205437.184782-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gpiod_get_array_optional() for spk-id GPIOs can return NULL, if they are
missing, so do not pass the value to PTR_ERR but instead explicitly
treat NULL as acceptable condition.  The old code was correct, but
misleading because PTR_ERR usually is used on errors.

Reported by Smatch:
  drivers/spi/spi-cs42l43.c:241 cs42l43_get_speaker_id_gpios() warn: passing zero to 'PTR_ERR'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/spi/spi-cs42l43.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-cs42l43.c b/drivers/spi/spi-cs42l43.c
index ceefc253c549..90180662c4c2 100644
--- a/drivers/spi/spi-cs42l43.c
+++ b/drivers/spi/spi-cs42l43.c
@@ -237,7 +237,9 @@ static int cs42l43_get_speaker_id_gpios(struct cs42l43_spi *priv, int *result)
 	int i, ret;
 
 	descs = gpiod_get_array_optional(priv->dev, "spk-id", GPIOD_IN);
-	if (IS_ERR_OR_NULL(descs))
+	if (!descs)
+		return 0;
+	else if (IS_ERR_OR_NULL(descs))
 		return PTR_ERR(descs);
 
 	spkid = 0;
-- 
2.43.0

