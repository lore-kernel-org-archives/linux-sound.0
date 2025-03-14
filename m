Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C3A20299A
	for <linux-sound@vger.kernel.org>; Fri, 14 Mar 2025 14:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741962811; cv=none; b=V0KW+SS/GzyuGBWX5ydgbIEhISCjizAliyHHx9Zb59zS4YFB4YGEJlhxpbBjFNGKjD7fdNFO65ZFNblfL7CAxS6ni6cqWKO3KhAB1Dn9Gf7/ptmu6vc1GaH82QU6VENyhOprjfQh4zvkIBqO/7UYLYUWIsjbqXJIVQqpxtwcqBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741962811; c=relaxed/simple;
	bh=etID88XhArSgmvosEDMawlWfvyYiW3vHyBAqplbUD90=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GYYM5ZFuAfWHQrB5DEKIGYPgjG7iE3dsNCfFsnuLXewt/Ix0vhRqWdzVgjzjOIlpuLJ9Z4odrGJmg5mu6Jw+AzUIunG+OWdN4lfJfHPvc926oRShufVAqvAvnLmD0KyzXY6c0TXZCfdGCCCMUjgH6Ct/XDbmEjAKFsCGpBi4oKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g73ymznm; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g73ymznm"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3912e96c8e8so1428652f8f.2
        for <linux-sound@vger.kernel.org>; Fri, 14 Mar 2025 07:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741962808; x=1742567608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=86CJK2fc0cAvOYyDOyHTA5kr0QOMsZ602Wh5UOHhaX0=;
        b=g73ymznmPQ+l3wbZ7nChZLt9j0OptWwba7Z+ES3NZLj5jSpgMHRSXdKPx65IdCppwo
         hmHl6K/wxkd0h6QoI8+lfuRbXvSMuFnfvwSujBaIz4EnvYxLOcm5jBPZrC4d8rwkhEAP
         kCk2lVBl0fMl2KlqemjvJl7aD0zmK/NYdpGsXS8RLE7rglT/2MGmiNeBVpToubITKxv0
         begNQiuZ01/ZmYJ0et3CiksswTp7dKSgLK55bs7OJBcO47bxR5ALGYeqIDWXZgVjoM3d
         +j26oZjTfmadrVxLENrDOA2z7uXEu/CyZ7+loLUGa7Ng0HXX1kGToU4lUQsHM4eEblHY
         aD5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741962808; x=1742567608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=86CJK2fc0cAvOYyDOyHTA5kr0QOMsZ602Wh5UOHhaX0=;
        b=GK7Pey2jsZngI9dtosDavtuvJlSDOCCMSmE5SF/940hrJyEXUvW08Zsldu7YJe9YG8
         g+DJBmf3EZjTquw9p8Twrn87Pq8Xq6AgspkrhTIhxWlzla8+LGUxmEsp00Z0bt2oJZta
         tX+hyN1JGbsCOqu9zHcm9UN27W2aPaDCGaJmEMRy4FFWlZZOxEEvBWcDIWsRzwuIH9P5
         Kpi0KtqgeEqPzqd/tBH5ypNklXGoVSNXzwfezqDTNnkgQwTyFIupkA+zw2Lum52Og20F
         gZxWjxalKjODNInlLsMMl+iMzKO1oChunl8trMFCuEIYNAgUNe3R3l+RvuQXnsAACDqA
         FiHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcXrH6V5SwpgKAwOtx8+NaKwOJf/WkR2WpqtXfuR8cTe47OnCxZAN5ncvLK0OkdE8tt5ghtnDwuCuaoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKxIXSlxVTJktlYkS+tyneQqjnkMQt7CqcaDPLVaohu9nHph7x
	vC/NfcjW268ChEQHNeRz7qFnDOJ36P0akVu5xasR0JGFZCTQZVOJPtMni5Y9T+/wx9lMBShs3nR
	V
X-Gm-Gg: ASbGncvCZmik9NI1ZM+AQHanQafVtUZakO6tCX3RF0ZChlcSD+Q4WLZnVMxzgnhez3V
	KeSHEfpS3tauDJGEw+kh5XmFLCvykbdaZ6nYN+4mCPBozo8diIkOqEBwqgJ3DldvLOIIp8f2Wdt
	VgG2SRQ2NO4bpVIA5CCzowpfuEAmoFM/3pB+O+sbDbjEpmY2Z1thJvOpMkWDFFG/88Gxas8dBrs
	Ub1yKfvY7tEp/+8oFxeEeuWI9CBJLw5AOsbxg39k2+G45l5e0GPp5qiqsDlisgTQFB9oHp1Nf5t
	m4ezqAtDGAYrAg37AiPA6O1/GucavSgefIEjOEeiyLPXxmTsmsb2yM9XGT2RxdZFL72jAw==
X-Google-Smtp-Source: AGHT+IHVs9aqh53jMw+jTNDbDhOzV9r2dswK8/QSdrxt12hvlpFw9Rs059AvnN5+zk17YnDOTrO2nA==
X-Received: by 2002:a5d:47cf:0:b0:391:31c8:ba58 with SMTP id ffacd0b85a97d-3971d03ee20mr3210099f8f.10.1741962808009;
        Fri, 14 Mar 2025 07:33:28 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c82c2690sm5699168f8f.25.2025.03.14.07.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 07:33:26 -0700 (PDT)
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
Subject: [PATCH v4 4/5] ASoC: qdsp6: q6apm-dai: set 10 ms period and buffer alignment.
Date: Fri, 14 Mar 2025 14:32:19 +0000
Message-Id: <20250314143220.6215-5-srinivas.kandagatla@linaro.org>
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

DSP expects the periods to be aligned to fragment sizes, currently
setting up to hw constriants on periods bytes is not going to work
correctly as we can endup with periods sizes aligned to 32 bytes however
not aligned to fragment size.

Update the constriants to use fragment size, and also set at step of
10ms for period size to accommodate DSP requirements of 10ms latency.

Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 90cb24947f31..a636f9280645 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -231,7 +231,6 @@ static int q6apm_dai_prepare(struct snd_soc_component *component,
 	cfg.bit_width = prtd->bits_per_sample;
 	cfg.fmt = SND_AUDIOCODEC_PCM;
 	audioreach_set_default_channel_mapping(cfg.channel_map, runtime->channels);
-
 	if (prtd->state) {
 		/* clear the previous setup if any  */
 		q6apm_graph_stop(prtd->graph);
@@ -385,13 +384,14 @@ static int q6apm_dai_open(struct snd_soc_component *component,
 		}
 	}
 
-	ret = snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 32);
+	/* setup 10ms latency to accommodate DSP restrictions */
+	ret = snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_SIZE, 480);
 	if (ret < 0) {
 		dev_err(dev, "constraint for period bytes step ret = %d\n", ret);
 		goto err;
 	}
 
-	ret = snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 32);
+	ret = snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_SIZE, 480);
 	if (ret < 0) {
 		dev_err(dev, "constraint for buffer bytes step ret = %d\n", ret);
 		goto err;
-- 
2.39.2

