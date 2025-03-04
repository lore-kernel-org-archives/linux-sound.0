Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D421FFC4C
	for <linux-sound@vger.kernel.org>; Tue,  4 Mar 2025 10:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741085879; cv=none; b=R3UiwBAZnGL5BrrAtbLjAnvHtPaQFoSAvCSdxgQGoRmLP7fxAykTPWRSLT7j7rVB3bIQgLWAoYaTnpiNkkAnAlWrHPrMfl31oGXBuZ55BYz79Na3nXHkN5/T1w9z2ZsLb7nxHZGg56/Ek6fl/xPMBwR55+aGo+w4VVuBhMALlr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741085879; c=relaxed/simple;
	bh=T8BvseEhQtgXi/c6dzXEReCkqVf8+ZZBBGjoAN7DYSQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AJg3q2EhAwomAwVX9j+JIvr6ywemG2joBLcgL6u14uKdHkTFuyA/pkUaAXaarjWuqpT+eqbKlU6Mn27cm7ty9fOOOa0i8BTPRE2QbLP7IthTnpSKpi2Ec/7KS919yBM+hVDaDcVpnjwr5HZ+o+uw68EVMlRKPbZBduJviohQTBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Of1OOs14; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Of1OOs14"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5dc89df7eccso8989890a12.3
        for <linux-sound@vger.kernel.org>; Tue, 04 Mar 2025 02:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741085876; x=1741690676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H8qpY34vr6GYk8mljhQq04C1Vg9LVV3uW0bLLDq/qwY=;
        b=Of1OOs14magff5WkzoscXE1E6o2u8goWZqXah/vmbZb+BR1l+k1+SuRISQGRT7+JWa
         KhN6itYTjZgtFdj+Kbi2oxRs6fmcwposhX36z+B62mwvR/2jgtNI16u4d6vuYOqMMVsQ
         wcqVyrGThcO1joVXOS22jz3tfJXhSgagdO5qF7+c0a5CNh3RZB/SNx0bZVdNz2YNfQa7
         dg+lpDQVaCKcD26ZpUOjhAdoYww0pwPxBBskhK58I+srXbx/1G0Ll0+QZt50IrJ+DHww
         hOnAW5IfN5CEFXW/zoQhwOHVyQnqyTXXVcSu9b3C0+tpmE5YsrxV3BOQReNVuYEHHwlD
         mFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741085876; x=1741690676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H8qpY34vr6GYk8mljhQq04C1Vg9LVV3uW0bLLDq/qwY=;
        b=YkEOMs6oB3B1ey+VCW6DzTztD6hy+NoHouxUf+6wrm+1OkBMCDcDLX1pnro3RuzxHv
         vJTpFQzNzEjfdTJ7d9Im6jC+IJZE+ckkbhOE9eDLgCgHxuP+7O95mLO213Pk88yVGPG/
         an36R5KWkubJR/x+jLadWQ1s3WNtDyKbdadAcWOgrCHAldMIppPNJeMnK70/c3nZlmHz
         kRi77UaXI/3C8HN97pQauCWptJA/S82FAbb7gsN2W4/JI0stTIde+vcffKMFbwjz4G2S
         oBWSosXqJp3e92c8oUfj804+ABkk8LowBkDg01P7AV9Sw00/ZFFxvjrRzRoUKNyEchsd
         40Yw==
X-Forwarded-Encrypted: i=1; AJvYcCWm6THntIwvdlNbqc6Df38uJqL/9tcu0IX/PvtWKUAsxWzCrpvjXK2An15h6XcyH9WUWvK7CIAwjomi0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvJIIOAR73K9ifekQAEQ9pkwwkHLUj1iKYc19bxqYJPak+885A
	NFrLNvsEDNHSqXd6ew//72wsVVWWGPkcea6BX3DfO50xGD/k4Smgj1gfafbDqAw=
X-Gm-Gg: ASbGncsa4R4xmh5ICv4eTxAAtnZ2a3PCk6qj7Z8wNOGkf83zkzUcCDovFsG5rjL06/W
	9glNPX3wzxpMgpX5XNBRPReK4ZYetUrYiAoqUY8XYVAWKOaFxcm5WCZ/tMvCc1x5cD82jtU/ASF
	TjXezg7AWUSCq9c60PlGoLOzcmqE9NVhAAsA/x+CzYBookMl9/zOk4wLP/wFAaKuiXWvLFvSUuH
	qftRFe0A/0g7lg09qWwmJWO9e6sx+0cAO0dFfIQf20s/6q9U/m+U4ZBYb4TpGi5GcaPTd5hp123
	KOZ4W81TOf8LZ6Bgr40NW17z7keKduh9Z31dqypbNKIvWtCsP3AfFuveyZVgyT7C1ZiTdg==
X-Google-Smtp-Source: AGHT+IEMtAPD+3mslBPe9dpUnwDfjI6yIrS86aj52AjEbtCekD+P8Nt1T5PEVviZq9Ti8UN7hLn8MA==
X-Received: by 2002:a05:6402:1d54:b0:5e5:3643:c8b5 with SMTP id 4fb4d7f45d1cf-5e53643cd09mr11556338a12.30.1741085875856;
        Tue, 04 Mar 2025 02:57:55 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c43a5acdsm8002966a12.77.2025.03.04.02.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 02:57:55 -0800 (PST)
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
Subject: [PATCH v3 4/6] ASoC: qdsp6: q6apm-dai: set correct period and buffer alignment.
Date: Tue,  4 Mar 2025 10:57:21 +0000
Message-Id: <20250304105723.10579-5-srinivas.kandagatla@linaro.org>
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

DSP expects the buffers to be aligned to 64 bytes. Having a 32 byte
alignment can result in fast playback or capture in some configurations.

Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 90cb24947f31..bb761ee0164b 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -385,13 +385,13 @@ static int q6apm_dai_open(struct snd_soc_component *component,
 		}
 	}
 
-	ret = snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 32);
+	ret = snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 64);
 	if (ret < 0) {
 		dev_err(dev, "constraint for period bytes step ret = %d\n", ret);
 		goto err;
 	}
 
-	ret = snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 32);
+	ret = snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 64);
 	if (ret < 0) {
 		dev_err(dev, "constraint for buffer bytes step ret = %d\n", ret);
 		goto err;
-- 
2.39.5

