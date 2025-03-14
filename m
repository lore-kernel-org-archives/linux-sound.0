Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5DD201013
	for <linux-sound@vger.kernel.org>; Fri, 14 Mar 2025 14:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741962812; cv=none; b=TE3noQ6xtdrGekDTcfwx8PtB+UHJvVxi4Z/NrSl04Ky56k6MZuANnhyo3W26DzhqN6Qa7Tr4fiHq2rOCKk0jgfCSeXbMsY3oQ7j7u7Lps+eOei7F7iCsmceaeakLR0pnLrzEVGVeHnN8sr49w+5HHn3nyBDl8gAsJH+0LgPFwvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741962812; c=relaxed/simple;
	bh=49SQFDPVrfSgd5vzQ59y3EoTLS1r9SAAvEbV2EPsJ2Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UlgSzZ2t5I7wbO86O+MpJyo2iPmwZNFxp9JMJC6WIkam9MmhTxZ4z4KW2a15S4Zog6d4yutQH656Q+SollnBRvvbpvqmOt+B9lzxlM73932XwnAoc4f/G5ijAqra4Kraim0tYkO+I/hrTjxe/wRtu42+pXFOJOw2BmcmW0DnDLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rzc3tv3K; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rzc3tv3K"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso1826030f8f.0
        for <linux-sound@vger.kernel.org>; Fri, 14 Mar 2025 07:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741962809; x=1742567609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BmrpnnLM0D4kCXujXrwrPhEB5OgiMQcaOkuo+01fN7M=;
        b=rzc3tv3Kd0ou7jNF7JWL+FlHnqVTYsD4DERINfn7Y7TPYu81vwaJ4gydWITQiL8Let
         pvI0/ihYKeViKibewSdmS37Vvsjtxx2lapsfoqUi+Cd6gMLPL5UAT5ZXPSarezmuvstH
         CI+8+/GuUsL4yoQr5PlpSsS8mZl0d06+9H+LfE0ikYeqYihUMqFxwa6LcYRnJ1x+Ss6x
         lQHNTWHP88aGohRijSwAPe5DZETw8BbeTpaDrI3icP9nziG5+AVwN68J2yJBrHPWuzUK
         iQsEsnmjLVVPMzok406CjcHssduRztpP9eUp+D2AA6ap6ZpsRvMkKmKVqVoZiF+vzj4I
         4/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741962809; x=1742567609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BmrpnnLM0D4kCXujXrwrPhEB5OgiMQcaOkuo+01fN7M=;
        b=xT+MwkEB8q/syww9PWgJQf67d7wSwR2Dz0Uh+JBF2MESwJcAMRLw2wQVa6uDgNwY5R
         fTGojqhbSVaTa934xP5y6fmR0XV28I/tl3m4mang+z4B/oCpirTk1C/pAG2+JwKbvpVp
         59tnootuTxADVVa4DaKR5/5o58/NwayexX5vlaeT5jkAj8YCSFJJtOahUIkQRHDlyqK+
         3ba7dop4RX8szQFHBGe4haQy3HskhgStlKTWY+t7j4XssOnvTHaujxCsOpbHhajCoab3
         2/VX7n1yfJlkTl2AvIUGNzq8LCDyhM3I8jarTGA2aZ4vNGykkjI/CKCiZpMpIf+PTK3r
         woPw==
X-Forwarded-Encrypted: i=1; AJvYcCVQe2fZ00d6Pe7JOpvArUSOKbC9BWlVfmnGIztlk3rn3mIeitL544gkjSsg1GTHu+fhJVvrdoWjqckphg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQGCnzpiwiUsqkTn5I+3zNnbtVLe3Oz2OpMvtTopaPsbmpr7oi
	fytus8DPgn0gdMnh+IMBjDzKzHj9Pp9dJYbAHXAaIax15iWFmSDu7sSzuOGHwDA=
X-Gm-Gg: ASbGncsUKG2amZIMU4PvVco9tZadr/AQxC9BKkApLBXegvbvTFQ9TbD4BKNPzicMakR
	H23ywsDQzkWBjwh+L8OC18HXwXCF/gW7pgAn978f7o+ZPH9AFC8fsPkjoJMxiiAx7s2F9SY7dSU
	UYV8vcML/tc1eNL3/t/W1D8NdU4cGWBdBKVbKJxvJ/tCqEME8B3pKq7F/niQ9PUnF6G9BMKIxBi
	/JQ5BNAwGrFe+t80A/9P3gZADpOjYWRdm3Jr6p9aXVBzjnIsNTxmXneljdxqUNe6vaBoXkmfuVv
	19aNopc+KFSDLVyheTPs+VOJaSosPjvv6xGCXwZ72RZ0ltxgc4/kHx09xx2qDEtojfRoTQ==
X-Google-Smtp-Source: AGHT+IHv9cZ7VMEGzbxjDU272hTTPtgC2UDh1G+FUstyJcGJxM6GpRj97dHRlcSdi5ciiW0phluAww==
X-Received: by 2002:a5d:64a1:0:b0:390:e8e4:7e3e with SMTP id ffacd0b85a97d-3971cd573fbmr3738351f8f.6.1741962809334;
        Fri, 14 Mar 2025 07:33:29 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c82c2690sm5699168f8f.25.2025.03.14.07.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 07:33:28 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	krzysztof.kozlowski@linaro.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v4 5/5] ASoC: qdsp6: q6apm-dai: fix capture pipeline overruns.
Date: Fri, 14 Mar 2025 14:32:20 +0000
Message-Id: <20250314143220.6215-6-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250314143220.6215-1-srinivas.kandagatla@linaro.org>
References: <20250314143220.6215-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Period sizes less than 6k for capture path triggers overruns in the
dsp capture pipeline.

Change the period size and number of periods to value which DSP is happy with.

Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index a636f9280645..292cab61831c 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -24,8 +24,8 @@
 #define PLAYBACK_MIN_PERIOD_SIZE	128
 #define CAPTURE_MIN_NUM_PERIODS		2
 #define CAPTURE_MAX_NUM_PERIODS		8
-#define CAPTURE_MAX_PERIOD_SIZE		4096
-#define CAPTURE_MIN_PERIOD_SIZE		320
+#define CAPTURE_MAX_PERIOD_SIZE		65536
+#define CAPTURE_MIN_PERIOD_SIZE		6144
 #define BUFFER_BYTES_MAX (PLAYBACK_MAX_NUM_PERIODS * PLAYBACK_MAX_PERIOD_SIZE)
 #define BUFFER_BYTES_MIN (PLAYBACK_MIN_NUM_PERIODS * PLAYBACK_MIN_PERIOD_SIZE)
 #define COMPR_PLAYBACK_MAX_FRAGMENT_SIZE (128 * 1024)
-- 
2.39.2

