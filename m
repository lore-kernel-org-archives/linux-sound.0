Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB29216387
	for <linux-sound@vger.kernel.org>; Mon,  9 Dec 2024 09:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733737497; cv=none; b=SqHlAjJbqg6guUlf/y+VyzuxhjOahV4P6RNOxtzij7BAajSPdoZkpLsBDZIDALj8CbcPPGmXE9pwGO6X5sYvDy8keM0mdLMTG4hgw3ddQPahom8700X+UeCyuVIL2rBAj8gzyk7o0Ib1UZSxpy/RLGI5ohEAyJVFz+3WLZjGF7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733737497; c=relaxed/simple;
	bh=ZMBz5ZZR5lOt9yuXE50yqmicdPRxRt8rxwXfEc+KwWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=raOxbHVMaZ0YjS2IBEWjl//5bvv5QhSuLf/cGjTvCtCddjcOjfx/kHyEmgzbnAMtI/7mBBPrIjuJlcmZHO8VJhu+4xiKTdyzsywgk0ntYpiCDofGEUGjn5JBRcImPmEYVAkHJXeGdJU1X9F1r4l7u15kaL+OAkN5ms50UgrZeT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tWnDqDmJ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tWnDqDmJ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-434e8ed6389so836395e9.0
        for <linux-sound@vger.kernel.org>; Mon, 09 Dec 2024 01:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733737494; x=1734342294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cs9vbivkO216Dc8HYQ/Zd8gvHi0Ause9by/A/vR6Gl0=;
        b=tWnDqDmJjGJ1Xy5Oug080yEh178hFhpv/hvnskPD2l9d7g4c4ASsfUqhY1i44k98k2
         skVN77GebYJ7yjOxDCVlP+SZ390NNtoV25Rps9orJVL+1jnXrfB/X/Fp2Q89JPueQr+8
         Zl+6FFLzRAREDRThFW61VMmyrPYMCExLxJjULrmrXFvnyEA0GeHBEL73TZcM6Tw9GzXs
         XjlkfUe2ecTPhCWqppfkZPEsAWmI9PwVsaCIzSdvXTCBqYCDgYNzMKNUTsqCQiWyLEaT
         mV9DY42CDRyQbZmJ/qSd5MB7rvVczQIdPB8Lot16NWAAKs65J61+lVpwrchseE4BW3ca
         cB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733737494; x=1734342294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cs9vbivkO216Dc8HYQ/Zd8gvHi0Ause9by/A/vR6Gl0=;
        b=blXIk5ucsrHC5myv5Xd83XkMEkc7ihAy8u2kdzNlWRxz/btX7jQWGyYXPiTNh/k0//
         uJb5b2WftuvNrJLgmH3aawnxOdE0RjRauIMdw8kgQ/un2FABiXV7hkBw9wPT/unlisgH
         y0PMxwNBt/KNQZMcRiMdXJ2QN4Ef1QGsExqpqWFOkwF589u/NRx0v1bqmokRWuY5VXAx
         jM4wjfgxOq1i7cu4mhw9TrXPb0FyC82OBw0IObT3oATLmXvHajdG7xrmD6UF6KWz2OdP
         G04x/TSj+6fS0R2PEL8moqKmnZa1tY99aDw70K5Zkge5lUZg99bd4B2gRVl/f/zw17B3
         0dIg==
X-Forwarded-Encrypted: i=1; AJvYcCWTcoaZFMdJRNT6v8YokjOEGeH2FYD91bHqBWvNLWYwYe8M0xsoguw2/nfgzHDJ5oG9FSfBjLF5ItPYrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEz+AceWFltLMJxJkySldvLR+V699i6bT4ZH9wzDjsNIpbT0xl
	uWPhxIYpBGbN1lfZAtPBfsANn8qVR+VAnYV5FOnkLn7u1YE5BXQdKBEiTEgGzgs=
X-Gm-Gg: ASbGnculfbYndouqaoh2RtEh1FuvyTSxgCBrc/vZqA02cGhiLRyLSRiA9QyX6DSFAmM
	tUWjPhAHmTR/t6527rr+dFpXoWBYda2c03ARGg1aBlJGn4uZA9U3q36lMXmgAvsCXvcjO1D5yZV
	iddUAM/v2Rme9kE3hr5xXnTAzxQFFID4bQ+30VXU33m/xY8Kd68KiE9Cfrr7zSmm7EMmLJItIUk
	iQ39YLzHPjRf02/BI7DsTzr54BF5jaTMvEfXDYnL+7AnBTQZ7C31xa/tG4JtU3g
X-Google-Smtp-Source: AGHT+IHecMb6+js452qiT9G+qHvWh9vpINrVmf9jmZNLo9NLCiKBHCX+t3zASHR8lIlaD2w5TTHXtA==
X-Received: by 2002:a05:600c:138c:b0:434:941c:9df2 with SMTP id 5b1f17b1804b1-434dded98a6mr37786385e9.8.1733737494165;
        Mon, 09 Dec 2024 01:44:54 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434e962028bsm80503345e9.38.2024.12.09.01.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 01:44:53 -0800 (PST)
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
Subject: [PATCH v2 2/2] ASoC: dt-bindings: qcom,wcd9335: Drop number of DAIs from the header
Date: Mon,  9 Dec 2024 10:44:42 +0100
Message-ID: <20241209094442.38900-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241209094442.38900-1-krzysztof.kozlowski@linaro.org>
References: <20241209094442.38900-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Number of DAIs in the codec is not really a binding constant, because it
could grow, e.g. when we implement missing features.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Dzmitry Sankouski <dsankouski@gmail.com>

Changes in v2:
1. Use "dt-bindings" in the subject prefix.
---
 include/dt-bindings/sound/qcom,wcd9335.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/dt-bindings/sound/qcom,wcd9335.h b/include/dt-bindings/sound/qcom,wcd9335.h
index f5e9f1db091e..4fc68aeb9e04 100644
--- a/include/dt-bindings/sound/qcom,wcd9335.h
+++ b/include/dt-bindings/sound/qcom,wcd9335.h
@@ -10,6 +10,5 @@
 #define AIF3_PB                 4
 #define AIF3_CAP                5
 #define AIF4_PB                 6
-#define NUM_CODEC_DAIS          7
 
 #endif
-- 
2.43.0

