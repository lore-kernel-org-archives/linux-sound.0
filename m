Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B913215F65
	for <linux-sound@vger.kernel.org>; Mon,  9 Dec 2024 09:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733737497; cv=none; b=tOxgY5Vpz2TKwslTPZ6bV9Nz1j6ASad4lcdqB5aXMZG5X8ZajfP6uBY8t3dEGgZh8IHvPy90ox/BnTSY2bQ0HcyNzX/Crwk/GPGvv/3E9PbFKVPqKJJuBWkiFU7cX4Qja96Qk+VnIt7F/X8mnRUuy+whTpvKGORsyWOCc9+Cs7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733737497; c=relaxed/simple;
	bh=fjb9i990GoQpb8o7S4Y3ba1ibdKhHVEzq60SLMZRjGs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S8Y79RnMjJ/5SLIEwDU29er2yaXkScnJb3AIa23J2l5UZ+h4l2GeS2VebE7aq2tHiY3RdFEpd8/HKU1+wTqmFkOqAar+xx3a17TvOW7qb3fMMN1JGV1t3apk9qHbEKgwm8xH0p5o28AD/UEiZVetnpRUaFwe1ZnZNZSSIqjVhxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JvwHl3ez; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JvwHl3ez"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-434e9e22a99so730395e9.1
        for <linux-sound@vger.kernel.org>; Mon, 09 Dec 2024 01:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733737493; x=1734342293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l1sUV7roJsGmgZfOhLBngscTUOda+ttUP/edvvhP//E=;
        b=JvwHl3ezHSEJaYCiyOrpmTuh9tSGsuLKg+QoRQEGtLp7pSd1qQtfKuP/pyu5GV7QIs
         fHIJ7NYZRwth/XPfGa6W6/O/diVe25HcsyvupgkBS0oupeIbQuotxlNBN50xAZb6xTkM
         c6h8syR8eUxmlzF9qt4Y+qu65Bw6UGKbN2WMAxQGRlJ6293fcbg465HZtxnFOYBxlQfG
         fJSIVoVGqZ9ySCXDnrnJefDGM7pPWtsyWon+eel7Ck/2lMKQN+z2JqDs41/10w7qLnpQ
         koJ6njV+VcC9osEbTvuspWlP6fDyYvmnfpi0zGSVv1rSR88EPVSMc5rHlBMFqc3tZeCC
         gfHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733737493; x=1734342293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l1sUV7roJsGmgZfOhLBngscTUOda+ttUP/edvvhP//E=;
        b=UUp4gWQEFmiNx8Ng5k0LTGRUXwaujCx6hj2G2ow7xE5YaSeCyiyAQA3l6XJq/UUyfr
         PjMe2QNftXRqiIg5OjJJ+Jq9y/vs0fjlVoeTobG0TD/bG7bBP8eJUIGeGtIU1fngOJWY
         uTmNeTwGsaLwYkm5FxYOYWA4EKX2jYFcYnBCNsASY1UWHfh06X8fXU3AZBHvF6mTFS11
         zYO//PfL40d82AwifVztE4BwAL+CB9PBJCC7Q8tSkZBZRagTpyl6SzkZYe4W2bSx5fTB
         NZvVAtIJPjT0Io8nxnYSS3VrHgNfPGg3LM9+7fb0kQmP+DmybtdVfnnyBHBX0mS3T++7
         qUmg==
X-Forwarded-Encrypted: i=1; AJvYcCWmZz3vjOwRxxoAxHAALfAMix7TYW+dHxzSsvIYDU/zqRyNi4eFGhHL/41qr5+SZypPTm8ZRS1eW95h0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZpHJhinZubt9j/wF210i6FDXVq46bbxFhudIbrNcTlttKBsN5
	oSquB7zpHSPqieLZb1tlDtoE5jnwrLqjLOGEf7rXo41PmngD5VlgUsfU1nqHcPI=
X-Gm-Gg: ASbGncvd21OIf//U9IP1PKuFAMrYdOgXyNTgHzYebi7TCAqWTD8tfvZbky4Kvzs149F
	bL3JbkRMeNFUgMQ/qJbVNUlt19yQsRfL2+9TUNR1FkL6eD6y1fSKyt+ZNmxlhHKBiQjS+oKghUb
	fFaVsd6fI6a+a+cm4q6UtQIWcVvkc+S+i4d5u75ZwXHVYbE0LSWP9WPMPwBOwk8EqhZB8zrW+sT
	KrNhN7PhI9q/GfIhoTNQPm+7ShDNT5vvPM0mlON//8LTqWLObHwZ9XzootxOOGD
X-Google-Smtp-Source: AGHT+IFfnWuaEEFQ2SCpKa35Hxvbxx4TbEd7vRGr3JaRGDSa3d6Pbtwvg8lyAMELgezOfxR6fP5yTw==
X-Received: by 2002:a05:600c:1c0e:b0:42c:aeee:80a with SMTP id 5b1f17b1804b1-434dded5411mr38198335e9.7.1733737492784;
        Mon, 09 Dec 2024 01:44:52 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434e962028bsm80503345e9.38.2024.12.09.01.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 01:44:52 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dzmitry Sankouski <dsankouski@gmail.com>
Subject: [PATCH v2 1/2] ASoC: codecs: wcd9335: Add define for number of DAIs
Date: Mon,  9 Dec 2024 10:44:41 +0100
Message-ID: <20241209094442.38900-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Number of DAIs in the codec is not really a binding, because it could
grow, e.g. when we implement missing features.  Add the define to the
driver, which will replace the one in the binding header.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Dzmitry Sankouski <dsankouski@gmail.com>

Changes in v2:
1. Fix 'error: "NUM_CODEC_DAIS" redefined' error (Mark).
---
 sound/soc/codecs/wcd9335.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index a2521e16c099..7cef43bb2a88 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -159,6 +159,8 @@
 	{"AMIC MUX" #id, "ADC5", "ADC5"},		\
 	{"AMIC MUX" #id, "ADC6", "ADC6"}
 
+#define NUM_CODEC_DAIS          7
+
 enum {
 	WCD9335_RX0 = 0,
 	WCD9335_RX1,
-- 
2.43.0

