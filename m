Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09152200B8B
	for <linux-sound@vger.kernel.org>; Tue,  4 Mar 2025 10:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741085881; cv=none; b=I7/VetGu4gTkAAwXGFySPJ0pyFfyq5xg049iHMxyt35P1g8rr0Xh5myqHkUFndrqyszx7cdgzzBEgffEEvlJHtiKI2iPTRFPzchMwAuEesvrDIk3juBsYtABRylYm22BRymARlgcI1QnSigNpKjvQtmU5r+4tgsNoLU6ZutQQ34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741085881; c=relaxed/simple;
	bh=OOlm6HNrfX6e8YtvAb7GXOiQezhdyWO8PXRO+Eqpahg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hNBhoZFP1sU/V8ubemXqXm1gSrFNbeB/rJVHtINu7TrT6H2q0RZTFHiJSa/62ZHqNFdZBlI72vpbKJRfUl6L/hDugyevBSejCdHcOnQJ0yCmf5FyKsYe7HZgLET8Wog6u3Jzc1z6xQ3OIAXRo7zYZOqvVgeNmjZeXNwApuZMzz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=whPv99s3; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="whPv99s3"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e0b70fb1daso9507786a12.1
        for <linux-sound@vger.kernel.org>; Tue, 04 Mar 2025 02:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741085878; x=1741690678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ECyziH9vC+Bjbefgj+dSQZiFMSs3qn0VmvLNDRi3E2g=;
        b=whPv99s3ZZXLV09HG/qXihTThG/hPvVlI3lPr04mnk6DjMMa2Wma2pDDbMzWsRChk+
         1rXFd/wXIUUjLZ8uMZg6zYCeXqDY/Go+0shiokNZ+XZJAdG/36NuBpJJvt0TWsH/vtKZ
         aC2MGq8aXxny8Jo8V+v8sHbD8kunq4bPUHWsk9QePa8/dAMVkD0kTmYr/ZXxHP1GW7oZ
         7cnZN0WF/0exB80PQIOTFNv4+5SGrxQS5B5/PFO8bs2/sI6YJXClL3sQUUDU0dufqnvL
         a1PyqMtyIu9ouqFtkoHeSLgjmqJL8fQMY7NB9pOVrqE3s6DCEL8u+Zibbg1jbL6c9CB0
         Ar6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741085878; x=1741690678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ECyziH9vC+Bjbefgj+dSQZiFMSs3qn0VmvLNDRi3E2g=;
        b=Q7QNNdnnOlWQTXGFoOb19bhYNcEp9X6f8CtT/QrIa5nsWC57sgUY4NJjtBtjZP53z8
         MQvg8beLfmvG5NSl9DKLkPpcVqo7h8FKuoxsuQ5B12i/20FXB4aEmpAcrZ1hlYRW5y7Y
         9ZCXVoEBJEb44WwZ30CP5kx6yBYVyZi29T+7wXOAgU8pAcjQLWgjcHFukjgI+ctvagGD
         kcSay08Q5bQtBvq5fOrihH2EiWIVZipvVRYnka6/1lzBHCLR7Ox4kioA2WhiirZ5eQ6i
         DslzWd5c+7itZcHUNI7LOoV5t6gw0uazu5Xr5V8hygNvclw1EatFmO2GjBFBvs4WvCxZ
         w7sw==
X-Forwarded-Encrypted: i=1; AJvYcCXWkMQ15qAwAkneH9bTr/RV2yCERau8oLDpEuu1JlSnrbFZmiSa/Xb5zuapd9RDU89hdH++UN4x/6Gc0g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7em5nu9Ou2C6gsHRJ76GgX3p0mp2jKsDLEMTMBewClgIGutlJ
	789lOiczbHk078xlVz/bG6jK4krLc5UZCzaYrXsDdKhDTVW95OOAGrpX/IgDDzRvEkTQYTyoMQO
	H
X-Gm-Gg: ASbGncsK42+t9Hhqpd9JvlGZFlOEXYq0ZK46/nZxb6ohGeYSvxOhcvpBMaYvSRTD5k/
	brSsUWhbU8ovhSzkb1Hbr9JsFytAaaWkxvxZny+c6RC0BukOcH0D0KQSRbd1HQ3OfTR9sEAgtb1
	7/s5+y+viraCABvf7qAtu0aG/i925RLbNa8idq4rn8FSgbT094kZRqGRLLzrXWfImvYI0J/yKov
	PrqyeJSP8OolTQTAyM1oOgUrc4rPYvWl/06UM5QiHsfypnPqi7mtLDFlp/Pj84RUKQcDolarbLq
	oz58m3WqJ4NL6wgit4+oL2EBNmbVM6Hc5A1bYRWKaPcWKs+JrxGCchBkDS4CiORX5NyiIQ==
X-Google-Smtp-Source: AGHT+IHfeHT/FTjffKPwdBKiP6ewQQTMUOqoklnatPZdqtNFAdsCpP2K8dPS2Eccu/L8rXNPyexCvA==
X-Received: by 2002:a05:6402:350f:b0:5dc:58ad:b8d5 with SMTP id 4fb4d7f45d1cf-5e4d6ad5fa3mr17089784a12.9.1741085878276;
        Tue, 04 Mar 2025 02:57:58 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c43a5acdsm8002966a12.77.2025.03.04.02.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 02:57:57 -0800 (PST)
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
Subject: [PATCH v3 6/6] ASoC: qdsp6: q6apm-dai: fix playback dsp pipeline underruns
Date: Tue,  4 Mar 2025 10:57:23 +0000
Message-Id: <20250304105723.10579-7-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250304105723.10579-1-srinivas.kandagatla@linaro.org>
References: <20250304105723.10579-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

QDSP has latency of 10 plus milli seconds, Which is difficult to acheive
with just 2 periods and fragment size starting at 128. Increase the number
of fragments to 8 so that it fulfils the dsp requirements

Without this patch, DSP playback pipeline seems to hit few underruns.

Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index aca0a98d58a5..aa6bd359300b 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -18,8 +18,8 @@
 
 #define DRV_NAME "q6apm-dai"
 
-#define PLAYBACK_MIN_NUM_PERIODS	2
-#define PLAYBACK_MAX_NUM_PERIODS	8
+#define PLAYBACK_MIN_NUM_PERIODS	8
+#define PLAYBACK_MAX_NUM_PERIODS	16
 #define PLAYBACK_MAX_PERIOD_SIZE	65536
 #define PLAYBACK_MIN_PERIOD_SIZE	128
 #define CAPTURE_MIN_NUM_PERIODS		2
-- 
2.39.5

