Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57ED1212FB8
	for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 16:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740068972; cv=none; b=XC6VMJK3SSf6t9O6nSWVwPWxtV1y2RVEjJd+WInr4I/B7Kjk7lZarfyTydXghEr0LnMEdKd+PYi/1cKKkoYd3f+IH4EcqEg6Ywi8GKN6gvKds8IYvJHCAYIJ8irbuBagzip3/sWMAfzpcd328UM4pUM3Mb/WVo9s9gJVNi++iaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740068972; c=relaxed/simple;
	bh=G44mzomd17zjRW176IaSow82CVHdPVhJq52qbX/krTc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F38bwPUnr5KczahMsiDwx2AfhRJCeluAEpld0NVbAOfVbZE+aox2WqgkE+kU4hPqMK2EA/mAFSwQ/jT7w7x1EMPbCfb+VwpeIgOWUsukcTXIodWXILAinL6adGQZIhAPmr9KTsvyWqwRWT1Um1PqFDFkatgDTrM6ndlqzq+pprs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zE1N0M+m; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zE1N0M+m"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38f2b7ce319so970575f8f.2
        for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 08:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740068969; x=1740673769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7m/CTzgrh0AA9xzhVYZwH6Z/AB9cMb21X+WgCPYE0r0=;
        b=zE1N0M+mcG6yeCVrShQIusxoURBJlTD5R/+EL5iJJCd42rO9aXh8QlISKn09oAZlS8
         cfuZOZ46FL/dKy0jV2g1yq01U1RDQD/zt4t843n0+SdmkNtrT08e0aHKh7zGTPJtXwLX
         L1wJYAhc5cHI+csGZirsREJBWUDOSoGIhB/90u0PnS+w6Lubjz0TZ28u/3YncEB+r1aI
         ay9GT5GmWW5hhn6loUsx9pvBRrEyUzrA943X9GWhdrLgK3N6tGOQSaCT4lYNFY0XvCAR
         OaX98jS8UX0PYG0L/nvQLWfi0bU7lj//ommHFy9MpbMyjLJjCG85ifjpu0Ujr9UAgcEV
         wz8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740068969; x=1740673769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7m/CTzgrh0AA9xzhVYZwH6Z/AB9cMb21X+WgCPYE0r0=;
        b=V9e4HNAkTOCrDJpVhCy0WBou0V/kCGAwPfIjaGYSV8LCidLiIewnNb5YbBbdePQXW4
         mB3/jpzXnfWQjb6AN0waMpJmRdswx6Bwp/gaHkjUGOd2zNgbIEKV3SUXstsubTDbfCkh
         FLpqj6WSLJzJsweuw3XjuE9/tkVXURqBcIKxwKjeKL9iNGQBZLvZDddqOhwVvYFeroz3
         hO/Ievg3OLKhws5vfCgbgDZHr9Ci/5KCvUQYJSAfYVQJVh91kmzkyaI2ABhJGNaLYOt5
         0r8CoOouCvtwCANSSAqbAUdfUgM2O5xssJxYn4m4psTT67cP07k6duHmkZ95ATOU/XWx
         L0/g==
X-Forwarded-Encrypted: i=1; AJvYcCVICunJy3yYNwdFfTgRngO7KqxD7ZNDGvQR5B+PB0UoycX644H7b0YB/FxFz5tZ/lFLbNLNm0YPQQy/CA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7M9C75sp0okg4bQ+lbX/5QEGKlZmrZnk8W/B7y8NzXiTiWrOd
	ITC2cZgkdPXVlU8ZTEloAkoRgRpU8p+C/zvDMyrmbxsq+08DLbMUTsQkGGmS/Ho=
X-Gm-Gg: ASbGncs2T5PV23RjND/JRe8+O7b3gEzU9hAI1Ok2SPYZopQAJDSWgrfo4BKfu3U89n2
	JbLG8lqVtEtuoUdW99Z7SfGsRUXIr66nq363fKscKdZYHjjEKVj5Sxtgv0C67jvkJZTxuDB/AnG
	Gx1lCNIWeqOx61cLTnVLlLRSkiZSCj1IhcMaX8O11XGuot0vpDR1WwO4sf4RhX6b4oeAl2BPn+/
	x2/KlPRMIO4lgGXhXTOFm82VJnEwPmmWz0cV05dtF89XK7A4d9ZSxjh4NbxZX8K8eTBNII8XYKg
	dJVO/sNk2WtYrJyKySVq7hK24tu8ITpvBarJT8z3
X-Google-Smtp-Source: AGHT+IErNAEoXnEuPGcHDzaI4u+qesPWr2oJ8v0KPpx1eLR4SBNS7L5XLR9zDyZbvaRrA+qYm3ZYUA==
X-Received: by 2002:adf:fa86:0:b0:38d:dffc:c144 with SMTP id ffacd0b85a97d-38f587e73a2mr5603019f8f.55.1740068968673;
        Thu, 20 Feb 2025 08:29:28 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258f5fabsm20813753f8f.45.2025.02.20.08.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 08:29:27 -0800 (PST)
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
Subject: [PATCH v2 5/5] ASoC: q6apm-dai: remove redundant hw_constraints setup
Date: Thu, 20 Feb 2025 16:28:47 +0000
Message-Id: <20250220162847.11994-6-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250220162847.11994-1-srinivas.kandagatla@linaro.org>
References: <20250220162847.11994-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

pcm core already does setup the hw_constraints from struct snd_pcm_hardware
values, setting this in q6apm-dai is redundant.

Remove the code that sets this.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 28 ----------------------------
 1 file changed, 28 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 049b91fd7a23..b644ce7d394b 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -374,34 +374,6 @@ static int q6apm_dai_open(struct snd_soc_component *component,
 	else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
 		runtime->hw = q6apm_dai_hardware_capture;
 
-	/* Ensure that buffer size is a multiple of period size */
-	ret = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
-	if (ret < 0) {
-		dev_err(dev, "snd_pcm_hw_constraint_integer failed\n");
-		goto err;
-	}
-
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		ret = snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
-						   BUFFER_BYTES_MIN, BUFFER_BYTES_MAX);
-		if (ret < 0) {
-			dev_err(dev, "constraint for buffer bytes min max ret = %d\n", ret);
-			goto err;
-		}
-	}
-
-	ret = snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 32);
-	if (ret < 0) {
-		dev_err(dev, "constraint for period bytes step ret = %d\n", ret);
-		goto err;
-	}
-
-	ret = snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 32);
-	if (ret < 0) {
-		dev_err(dev, "constraint for buffer bytes step ret = %d\n", ret);
-		goto err;
-	}
-
 	runtime->private_data = prtd;
 	runtime->dma_bytes = BUFFER_BYTES_MAX;
 	if (pdata->sid < 0)
-- 
2.39.5

