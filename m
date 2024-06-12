Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA2F1822D4
	for <linux-sound@vger.kernel.org>; Wed, 12 Jun 2024 16:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718208954; cv=none; b=q5P5xcgbZT2gDdLkmvRkLNZwY7LCHF4QW723dMDoYEco2+qZ6iwsSgEf/VqyNXdyYdpbpbbrOiwEtGd2t6b69ShS+hGGPsbGNd3xz61Ky0auN6r/hfasIuMK9ZO2RxGib89TsmV/67G5L8hKB0fF9iQ6I6W2ujYROw7znvHPjyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718208954; c=relaxed/simple;
	bh=0x271Ao5g1756MkJM0YnZ2eY6hyaiNB56Snmlinm2o0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NC5z9sI2yMX+wUwGZkDjM2y1SrK+rmTB57IgctTiAccQwnUwaJUMIwAjop6Phc+XDxWozW1zJBbZo44ObidbQfJtfkNRwK6xqfAI7jsTvWxgi/DyRxJA+OYD7ge9jq5JU4yppOqNo4wXnBHTb6p8QGLmiFg4Hs6S4HfOqZ4nGdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZHUk6gdY; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZHUk6gdY"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a63359aaacaso10269266b.1
        for <linux-sound@vger.kernel.org>; Wed, 12 Jun 2024 09:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718208951; x=1718813751; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nSj1wRbpqkX+8+PyNrcUZX8/G9u8adS5MtyYj32OWN4=;
        b=ZHUk6gdYE7HhjTmBD7/pHKC/QFxNrgivpH3Kgu67gBOn6bb3uWUSlYyNWI8OFb3A2Q
         aVEi+LmgfQj35KHDZydjv8aYDeqxQoEFilnwh01D3SDRG4veErdGF+mbzXtU5kVQh+A5
         0BOy4hFngB8MPZO7aFCZbrnXM7KV4NWQzG/8jw8omS7vLemB+fxtydRL7Izg4+oFNp3H
         mlNV0qOc7giXGnE9AoNyqo4S9cTBjpfgdBQ5Ma4HNGzwAIM9j58dEO6NFcdOAv5gPM86
         r2O/0pqqG5hezsidXydfePTRpSfmM76QekK+TszJPYmGSN6GwkJZgkp8REQ6JtCrz/pF
         UvxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718208951; x=1718813751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nSj1wRbpqkX+8+PyNrcUZX8/G9u8adS5MtyYj32OWN4=;
        b=fVWy5n9oADIfotEp1vSd2deYF/WmomV708Yj25FEjQ1aqQtuzAYf2f+9xKWxq5bwhz
         70ohgNmnnE+T8oqWB+sDpWI2dARvKslSP6xSUZGBEOWPiQVfmHjTiKFcusbDBABBnnfR
         VPHrb8cfryNuoQyTt+5Ml7QIyqfuxElLnJptwDwchuEyYSxeTHUxjK1zXTd2cSbxP2pS
         qrwi3nnjvOQAL/T1Z/DaaPqLkc4MvdoIG3J8mNBmQoZmEFkvNKOcciciu4yFrtyByQ73
         AjRFlQiYGoo/OYLS2AJBpIaZFtMEDKGgYe4v/T66Cm57mUGhVepgAdp7GDPACfjtiQa4
         Hx6g==
X-Forwarded-Encrypted: i=1; AJvYcCUhdR+/lzOOzwjmrwPUuC3qARVYoAbtuOcgZ60osCohIx3CTIKV3T9/R45yd4pWSncPstu+exQ341WVkbaBilZf14cebz2T9FPnjGU=
X-Gm-Message-State: AOJu0YyVcDyS4OaHnlz/EcclnOrS+CpnMckjI85qavcgE371GaJjXbMv
	ILYhJpr6dT2OPEgpix3Dg3CsLNxvpn7qRAKaCxAwiUxFCOtmis9GvKpJmLR+29o=
X-Google-Smtp-Source: AGHT+IEV+h2vbFgATGGL7Df9HCn4pV0I/mu2nGi8vVCTHaKKyDaxGp2hEWUoko7ZRX+TvbTeiXVv0w==
X-Received: by 2002:a17:907:7208:b0:a6f:51d5:ef0d with SMTP id a640c23a62f3a-a6f51d5efb7mr24161066b.60.1718208951530;
        Wed, 12 Jun 2024 09:15:51 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6efd6cfb74sm624815866b.20.2024.06.12.09.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 09:15:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Jun 2024 18:15:20 +0200
Subject: [PATCH 07/23] ASoC: codecs: wcd934x: Drop unused interp path enum
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-asoc-wcd9xxx-wide-cleanups-v1-7-0d15885b2a06@linaro.org>
References: <20240612-asoc-wcd9xxx-wide-cleanups-v1-0-0d15885b2a06@linaro.org>
In-Reply-To: <20240612-asoc-wcd9xxx-wide-cleanups-v1-0-0d15885b2a06@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=574;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=0x271Ao5g1756MkJM0YnZ2eY6hyaiNB56Snmlinm2o0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmacmdGHA1Mc5AxCcNSVn2jKSCaXp7KokuKm2d+
 NCQKnMfgTKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmnJnQAKCRDBN2bmhouD
 1+lTD/9nG9SnZKzUodnBZ9jKxGLqAYbuAcS95yXfKwvzL7gcFcHTqWYYRmWfOkUvUdXI0oY0gsm
 f2e1nkk0kmT0EkLmhc3iqNtQyJJoyUIPl39A/Hb+F1xHJxJEKwD8ClpD04ZOk9ttcSFpL0Rp4My
 xMc6F76okJKgmFYQEkjA+076pxMninW9PZsJ/7+4pfSHl53ZvN7OOVTnV8o+zztUXXh4ENPaRK6
 NT0hxYfYW87xM8IDjxSoZ/gfah56JrgpkuJsLcuqnyOUax151rXLuTUSkMy229tfBykSVlnEOeh
 COZ6QUszw1/K+kOiHIuCvmIDqxbm/AQzJ/F8Db+NLmZq70RX7Q34KQlL4EUCUVyZNTjLxv4tCWx
 yPMnljYyvrsk0+Qt6t0BgyBpHsok0j2BNV12pheUwwHxfU4yQ9DYPDTRvgIPokPcGj3ouo8zL31
 Voqe+7/fffZVwBdpxp7wSgQCYoipHd9JLt3a8i2dne2u2J00Dd6TvCEP3EAzZ8nz6fsuOrlgvkf
 +tuImGM4u7PgBskHjQAsbryVbBayat5FJ9aHg4H2nc0Qd57pkZa7VXPubWcDPwVaX6/IoADkNYi
 aUHwj8pgZ4b+vIJnI2FJyeg+Uz9KkrJMvaYbQySUq6Xr1DWkeXOSHpE2uYQD6NleQs078936UEP
 p6r2LGdNa4noAmQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The enum with inter path is not used.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd934x.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index fcad2c9fba55..cdb68f34e55a 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -475,11 +475,6 @@ enum {
 	INTn_2_INP_SEL_PROXIMITY,
 };
 
-enum {
-	INTERP_MAIN_PATH,
-	INTERP_MIX_PATH,
-};
-
 struct interp_sample_rate {
 	int sample_rate;
 	int rate_val;

-- 
2.43.0

