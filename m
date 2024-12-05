Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C72E1D433C
	for <linux-sound@vger.kernel.org>; Thu,  5 Dec 2024 08:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733388030; cv=none; b=hzIhoe1vWMRdJGaKo4v6VpgLlps5K4/0vr89SepkLV/CGRyOJXSqTYeM5ExtA3c7OIaBNtmMvCwkK9WQeYyf4yp5/aJSmU5BvUr9UW96RX+l2XFcy3l7JHZaRtNJ6PFkDIGsLDJMeHwEpvN14s3HQMT3ZlPBfFVcnogXEtv0T2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733388030; c=relaxed/simple;
	bh=xjXR+zk+M/gbXTMjCLEiAICwQMABoaPIj5xLhMiEpGM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YoBAFjI9/g2PMn1KLKuFZPuBAbNRER1CRQBhFTJXqN+CBKPe1BfVByxRde3AVSZpFd6j6BlFHi5lFJF1hqFTQL2SR5CK4mCPXvNpPVlyM7fqKtZ5XBew59Hc+tNuOUIb1g/D9q/usTV9UwKjI4k68Ev8d1by8Ul23EXmRgnvO3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XLvQM6vG; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XLvQM6vG"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-434941aac88so185765e9.3
        for <linux-sound@vger.kernel.org>; Thu, 05 Dec 2024 00:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733388027; x=1733992827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DH+J2UQA3VOyjrU/P16pyU+YqVrTV2zl0tHrALJVR1E=;
        b=XLvQM6vGdICz/PvnTSce5Qqrors0BfOzfkuVAwKLamHvQ6+JWBS4ICkJpob+HeU327
         VQ9BcAA7gg9dhqkima6HTs+A3HrCbRu2ul4gJdW7u3kqMbwTJq3IDsl9NnkJWKGdKpIy
         ZgTHPTfyq0oRPn/Jo4puZ6P28Z0S3gLmzJWejK5k8g+ROP75oqn6n9je1cq9PgeBoKW7
         5CQ6NSWLheJdMTDV8mTXejJ67sbEfX0CqERc+6AaczTfpjfLW9XyN2rfYkWiHcGL3XP2
         9WKEoB36/4QqhcjHb7Sp6icO1H86lE1/1vzdzQo6j888k8lOPZfIOf1U3MmFClH4B7ar
         jxQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733388027; x=1733992827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DH+J2UQA3VOyjrU/P16pyU+YqVrTV2zl0tHrALJVR1E=;
        b=AIAMr6yrnARYFX9fpfeZyJcEVHkG/yAc8xdIsj3vkpXzpVXoYmSfKBf8jiQxs0aiUE
         Wk028+wH31tMmYiIiVgwl1TDWXbBy4Zf6MpY1Sd7ipWwFFO1vpFQ5NDW67rzM1F20cUF
         vSfaZb8nDeUgsV8U/BUyTAk3uQ3UHqtYbtkPTcBLgxfglkjUSg0MkeyxeCZAPApEJujd
         vjZOj6/gKI9x8KHo2yQ6QRYY///g/Bs25BWM2iYtZXRDzNUL2HEqh8isFf7FxDLvFKeA
         aDgl1iMtKjiLdi/1XfNFUbWIjz+aHcwtSCEvTEUye7Hn8fGD0BVWrMjflUbfBsGrt7bU
         FJUA==
X-Forwarded-Encrypted: i=1; AJvYcCX/LJ+9JC5nokZRB463KOzbiT+vJM2wqi12AspbIYGbtcQ0+dt2DoG44Ur7LJtoZFGZZ4+DYtUZ+0BJcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwvcKXGgb0FEJ0yuZLXc26LowzzC7LeRhW3OXPN9AjSiD9QXLk
	q3agnjuAb/hjY81KDmIJ0DMzZNEfJKsrE9rntT0li/LX6H3p7RmWO/skNxrqYvY=
X-Gm-Gg: ASbGncvobtU0Qe5PfYAvHadCut2lhkgzbrqvYvwlBSVoNHxAr9ZWHtbAvB7h+oomPx0
	zw9dUSSPD0lIimdptQB02YmAMfva39ZLZLtAjWMSV8n9VLuMZwNDxB+D0WJEbLnq8W+iKzj2o4j
	a5Tng5ryN9YpVJq6ZdXSNydltlCudNUC1XWjBynTVdHr8FtYadtOxl1oZp6AISKC0RdRpJd/Oj7
	i6EB0FDOwKJWPLw/Pz6NpXQQ9Cvi5bK6HpwZBSKMF3gusOUmp6F0Xa2biSnhnFq
X-Google-Smtp-Source: AGHT+IH5z3TSEXxivD/BkQB0gvwva92E/y7Ua/n01z4CyjTb5eBwOSqHS1jSJiEwgXjn4T4axoxYhw==
X-Received: by 2002:a05:600c:3594:b0:434:a1e4:d32d with SMTP id 5b1f17b1804b1-434d08eef18mr32429525e9.0.1733388027475;
        Thu, 05 Dec 2024 00:40:27 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da0dab9esm15935965e9.22.2024.12.05.00.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 00:40:26 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dzmitry Sankouski <dsankouski@gmail.com>
Subject: [PATCH 1/2] ASoC: codecs: wcd9335: Add define for number of DAIs
Date: Thu,  5 Dec 2024 09:40:20 +0100
Message-ID: <20241205084021.35610-1-krzysztof.kozlowski@linaro.org>
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
---
 sound/soc/codecs/wcd9335.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index a2521e16c099..d2604da619f6 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -159,6 +159,8 @@
 	{"AMIC MUX" #id, "ADC5", "ADC5"},		\
 	{"AMIC MUX" #id, "ADC6", "ADC6"}
 
+#define NUM_CODEC_DAIS          (AIF4_PB + 1)
+
 enum {
 	WCD9335_RX0 = 0,
 	WCD9335_RX1,
-- 
2.43.0

