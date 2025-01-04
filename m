Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9B118A6CF
	for <linux-sound@vger.kernel.org>; Sat,  4 Jan 2025 20:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736024085; cv=none; b=UtZN/7IaCDTJSRVhAKvj4giRRHePZlRkXvmlvje+F7uzOH+BhGI5tGTF9JeRKsL2rcbmMDPkFWIGLoj+ZF9CEHR5ZLzNL8VdG6PNxXDAtSqGxnzhY9uvAEvpI++kcE3kxAnQy2jnbVgUiB1VUTN1eNCSDvOx3Hev9xypbJaVwaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736024085; c=relaxed/simple;
	bh=fYNFkZ4E49jBh8K15pvFiL/fAUn0j4KNd1uS/SNnNLc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ehBMi5GMchHotTCZ/Rv5V6tNd0LaKxi9Ly13eaBbAt0cmd2bEhZqbL7hMYo1PrfICi3Z4xd2utLvIIfixanzjIh2Kt8WWWeTyMFguIQC/yj2lPgnqQf8CXSknJ032t790fwdjEN9IOOJ3hwDypk8ypJ7W9ZKZsNnSXK08oxveww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f+CxS3Fs; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f+CxS3Fs"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5d3e5c225aaso2819963a12.3
        for <linux-sound@vger.kernel.org>; Sat, 04 Jan 2025 12:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736024082; x=1736628882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BMnEf52UfAT7r8nhxUJ27WGRgof8roegZaPYvjI6+Zo=;
        b=f+CxS3FstA746ECg9npg4+CiwW5WlafE12tuQam5CYW0TdFKRhBfbQLd8RD6s4gfl7
         Nd7h7dVqIncK8pygkk/z7eVV19BlwVZAYZ0AcIDG6cfdB8qHlKcbxZ2nv9Har/TPgH+F
         26hBP4L7bh6Vk808mIEjhII5fsKHUxyFu/caELwVAfhBqLDD/3dAg7SxajJPNK2rkqtK
         EUq6/cUh7VSgd/Pr9hkomoNjgwWoqPVAKmtyGvGtvnOEVvMO5Ncgp0EmbtFZB9nw7fGw
         cFCIZAyFWkL52JELQ+AvST7f3twucq45I5lqKiDI3P+W5Epz5l7KFf3zPqX7Myj/tLyf
         +oZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736024082; x=1736628882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BMnEf52UfAT7r8nhxUJ27WGRgof8roegZaPYvjI6+Zo=;
        b=OPdXc9Q0d7Km7jy6F9672srNVXID5eIA4JljK6LfHSMC1xhuK5oHz71NGtXgOk1jaG
         59aSWXxk0JCMTThPumPTXcxh/RbMzLp8RbDxVJNateSCxAmBM9Q9EAlDFrz1z8SAjMPf
         w3KlWz463kB66xRwtDdD7Z6jwgXwn2uKbHlNLFfBhz4sFVwFmN3j9/l6NZdNMVfsBn8B
         4tIlkH/p4UkzUUrcAgnLkf8P5d/YJPhOtUzmdnWJDOxa+zpUrppOA54N0RE+9H14CtT/
         cP1kjcX3V1tl8RVs3f46G5vyTyI6rREGUKgk7BnN8uSUtunjktlolTlwYk9BbIra1sz3
         8ULQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxJfq+3Dx5QZKSEFdHuzsYqiSCgfXnoz8SughhKKUqziwYiAg88f0YIbPZzy8Zk1RwjHfYtWX+lk/spA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqn+NiYf7pqaU4kW2ZbBeXJ9Qm9Nk4qAHD/PJpjxx1Fpi7iOHx
	MsTgmklNF9JyCbayTs3MGIzZGrK3C8We3Y6iyXFVzbdR4RarXK1lePDsYh2zoQo=
X-Gm-Gg: ASbGnctcpWYjZ+x8VXfTYnJ3rp4EbwgOPhrQw84x/C9+g0RNzuELMsGkeo2RtIUvnSU
	ijlceM4AsFIWikvfEuUvIXHNk+ivqNsfc/3hrZUxnGh/80sG6C41x4t2BTUijZeUwK8Yg0SiAcP
	yS4dR21xJMcJWFOVY8QB+xdKZr75xtxiz1prTkk6/12bF1oCvPXvJOBdBjLMps9QLCPM3rWJ3Kg
	aY1BA/vk9hV8/5TRJdciuKERjjJ9gNhjPVQOsmmwlIX2n7f9LBEQPWhGtGNZHydkxkSLzY=
X-Google-Smtp-Source: AGHT+IFLOaiX+zI3DneKZWxfhc5l0F3vw+qCGBukNa5K0q1p/ZxNgoJYKPDQaaRdI+EszfqyaVTwdg==
X-Received: by 2002:a05:6402:2801:b0:5d3:e79b:3b4f with SMTP id 4fb4d7f45d1cf-5d81de1695bmr17922824a12.8.1736024081142;
        Sat, 04 Jan 2025 12:54:41 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aaf4a841749sm839666666b.137.2025.01.04.12.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 12:54:40 -0800 (PST)
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
Subject: [PATCH 1/4] spi: atmel-quadspi: Fix struct atmel_qspi_pcal kerneldoc
Date: Sat,  4 Jan 2025 21:54:34 +0100
Message-ID: <20250104205437.184782-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct the typo in parameter name for 'struct atmel_qspi_pcal'
kerneldoc and W=1 warnings:

  drivers/spi/atmel-quadspi.c:244: warning: Function parameter or struct member 'pclk_div' not described in 'atmel_qspi_pcal'
  drivers/spi/atmel-quadspi.c:244: warning: Excess struct member 'pclkdiv' description in 'atmel_qspi_pcal'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/spi/atmel-quadspi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
index f46da363574f..d135cca4e454 100644
--- a/drivers/spi/atmel-quadspi.c
+++ b/drivers/spi/atmel-quadspi.c
@@ -235,7 +235,7 @@
 /**
  * struct atmel_qspi_pcal - Pad Calibration Clock Division
  * @pclk_rate: peripheral clock rate.
- * @pclkdiv: calibration clock division. The clock applied to the calibration
+ * @pclk_div: calibration clock division. The clock applied to the calibration
  *           cell is divided by pclkdiv + 1.
  */
 struct atmel_qspi_pcal {
-- 
2.43.0

