Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F43345752
	for <linux-sound@vger.kernel.org>; Thu, 11 Sep 2025 15:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757605425; cv=none; b=mLS1Sl9TFmoKXQ98inzDjDPcuAgEIqDEr3cBw7nKr6gIMPfd9h8hNAJW2VLzMVIKeQbA+hadSZ/RSMdl2kShe7IBQCAkNYZlhnQpF/aVgZ2dXGvUtFXlmlsi51/VFOliXFQzIdvqbwoFd5X58UzRYh4lqmNd9Fvv0X02ynonSkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757605425; c=relaxed/simple;
	bh=mtYEVqFfYfhoSwbzEKp/cEepkdVMf6SyvuyKmyLLU8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q3s+Oi0/X91bFrEHETufR7FU0/QN+aK+HH+98L6wjo4rtgqN8sq1BrILkOF8RDznTbJMS0cs+wRsVANNUPxF5Ig+I1Wsby2ae3M86ktsRBCDDpNZkmK4uua6YqoKhilM2vJgEghUlt4RN6fNUFsmArZcmDAZrcZpffdghnk20Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=meVHTyeE; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="meVHTyeE"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3d19699240dso1171895f8f.1
        for <linux-sound@vger.kernel.org>; Thu, 11 Sep 2025 08:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757605422; x=1758210222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z0oQTNxrqqvW11nhsresLiX6PlYtqN+ZQ8oB9MyzMxA=;
        b=meVHTyeEELUoRUkVauw8teFM+wZQpnAa3NNlzlLfsB18EAfiNVETE7IepV7imAoV+0
         ujNYdcrqwXLOGiC2zgpCoHB1f9Q/Oeu/+QRCdosJ7B4/CoICarCezHgzW7wR3PnYXKzQ
         IzprcfLw9q39xGfkgKbHsRU9wQGcn2OV9qshdCUWsVKiMbTrRb15bSnU2fAf47HjyUYY
         FDMJz2Bv17XTkmyf7EIkAQ5QXFcBbhEvEaj3yci9GBoSrNArfjvBOHNRWUUrdjIhCDNm
         D2AmtoGy/xIcY4jK8MBURSQgpujsTJJwqHjt3/rQ7O8e+lPj6IJ85uneUL4jL2fBOS+G
         Gfvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757605422; x=1758210222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z0oQTNxrqqvW11nhsresLiX6PlYtqN+ZQ8oB9MyzMxA=;
        b=qPvWB6O3lmPU75mOZ0S3eOSde9UlzPsJ+tdn4+Om6ihHijU5DdGPnvt9Xz+eyNNdhe
         WQOtpt2HCrVZafNQSMB5N6T7B0nLR3/TewZNbCbEXCs4DaN/aePm9GKbAFIWBSI/NcUt
         KfYcnROsvXGF9BeUEUT+/XfHRJJ9uw08dFR/2Ex1y9WYB1Vh+EITHEMy97hNrpy4EGbx
         oWlOaFLhWRGIfR0IVfPZQnv1lTemJkaVwqViYOwk6fryRVIabsmufg20YnItR1FVsCJC
         tvbKap8mKGIebWcPC8LybZh7V0yrKvXqVGai95BLXZ1OEhxzFF1dZGoq+J8d5sngzxcu
         BGVA==
X-Forwarded-Encrypted: i=1; AJvYcCU5Fdu9bZzN2r1m6evR31zHOr9rZRrLClu3pcCX5QixrLi42XV6FUSdmIlNWK9UPoxn6H9FDj6uKOsdew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8KtqbKZixlH3+rCtbMJ/uD4lJQnvLTYw5U5QGNCxruQTHzUxo
	EIxpzcg+tk5uJzjWNFk4ZDdUzgapiQewSh8Alv5Ih31ToUzuu91dGhresMzXZygXGKw=
X-Gm-Gg: ASbGncuyCXuHXFKC7EO9EGG+TKKJhv08EgvRTgnV+9APnMiRgciud24xJxl0XIIqqHs
	aDTt7MIXUJWRjZA2bkGVfYhtVDXMtDmeVsE21MYHuS74EpU7tSKoxz888qdtT/Ok71ZTzI6Is3G
	tCKFcYS4sTo1qY6JxEuxRDrHpG5BF5n6B6bt/7ILec+8KvCh4lT5KXgjPpXDZCt5qTRP8E2U1Ps
	qBUIMnNo45/BWH05Q39B/PLNOrKrVmi8Sjut+j2QkrG9Qae9eIVwgfI9didiVLKYmLbWFfcd5T0
	PMSIcvKB6y1u/1A5TjjHtgaInTBw6p5A2wHWI4sfvc5zWmCW4rTgJg3YVpKHVCVSxb5vbRVJeuj
	fIWAOYNmQ6YqZhp3RvxFda1v9H7AK3Y/Lb/6TrRI=
X-Google-Smtp-Source: AGHT+IFh15zztkJ1zOO4/RN3ASTtgLJC2rMLFG5k5RSkaslNY3P4anVKOXAQFo82PonNF26Qn1N8Xw==
X-Received: by 2002:a5d:5d06:0:b0:3bd:13d6:6c21 with SMTP id ffacd0b85a97d-3e75de70d33mr4111569f8f.0.1757605421647;
        Thu, 11 Sep 2025 08:43:41 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7259:a00:8a3c:25ae:f06c:6781])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e0185be34sm16847985e9.4.2025.09.11.08.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 08:43:41 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: srini@kernel.org,
	broonie@kernel.org,
	lgirdwood@gmail.com
Cc: perex@perex.cz,
	tiwai@suse.com,
	srinivas.kandagatla@oss.qualcomm.com,
	neil.armstrong@linaro.org,
	krzysztof.kozlowski@linaro.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: qcom: sc8280xp: explicitly set S16LE format in sc8280xp_be_hw_params_fixup()
Date: Thu, 11 Sep 2025 16:43:40 +0100
Message-ID: <20250911154340.2798304-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Setting format to s16le is required for compressed playback on compatible
soundcards.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 sound/soc/qcom/sc8280xp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 73f9f82c4e25..5d10b1c5909e 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -7,6 +7,7 @@
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
 #include <sound/pcm.h>
+#include <sound/pcm_params.h>
 #include <linux/soundwire/sdw.h>
 #include <sound/jack.h>
 #include <linux/input-event-codes.h>
@@ -82,8 +83,10 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 					SNDRV_PCM_HW_PARAM_RATE);
 	struct snd_interval *channels = hw_param_interval(params,
 					SNDRV_PCM_HW_PARAM_CHANNELS);
+	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
 
 	rate->min = rate->max = 48000;
+	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
 	channels->min = 2;
 	channels->max = 2;
 	switch (cpu_dai->id) {
-- 
2.47.2

