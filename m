Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509881FF611
	for <linux-sound@vger.kernel.org>; Tue,  4 Mar 2025 10:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741085878; cv=none; b=HB8teNJRoUm43AtgPcUiawoTzSTzMNDm6SF/MWuiqgKWXcFdCL+3IR9HkOf1oTQ3M6vu6qYlauVDoWM69oW1P8ffzL8tg9+scsDnIx5L2tJbnuEfnOvoBBQrPTePMfTAgHKlnIvpJDTLyw8O43SkzDV+/tQ3JpCVkh0EnjDHxAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741085878; c=relaxed/simple;
	bh=2cyClla8P6nWRItjw60GOMchhN9i8E2qxWYIAydEh1U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IuKOLM8wpT+KaIIXcDPWR9qejbX8JjcFvkxVXSGflvdShha2o6+t97J4YQNok47JefIVpxthmjNl6cmF1ZSpEEH0ZE0RYdia8oI9lkjztFLc6WUa/AqrfWy0BY6I7b14ZS5Y29e9N/DVkwU+Tce3GErF/iyVM0wzx+EiSS/yGns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pNba2wxU; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pNba2wxU"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5dca468c5e4so9845396a12.1
        for <linux-sound@vger.kernel.org>; Tue, 04 Mar 2025 02:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741085874; x=1741690674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ey071ua+N+9tAjiihktgShgQiT43owN1w7pBcfUu5o=;
        b=pNba2wxU7i/nwvVqF1bqfLHzLYB5/OFSy++gxwjWYwP4KoGYRXQiOSImu9g9M770UF
         y7OPqZiimIM+R/g2R5zgbGztGH6CJaLjQGvvl5t/gSfBDbOpCbJ+DF2HB3GfC1qHooX+
         L42uZDGihrjcpMu4Ov6MjOEZlrjwymQu6EPjVPsYtsjUoVkcAX2YiAZ3cqc2VbD7pnFD
         zmerkZOCzA5V+oHnWKrlGvlJGaFT8EBrbhXDu2ZxMPY5KSOm2Bu0DMLaExfym/cgi1Qv
         7637g3XWm3HEME4qE5DYiYMmrgvI7VTxwxVyYWyeY6It08vKV7niARKCFCRB+TsZlr3W
         x/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741085874; x=1741690674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ey071ua+N+9tAjiihktgShgQiT43owN1w7pBcfUu5o=;
        b=W1EwpekSmvQTVPVsjFFLKdb5twnWzczpCHc11hQKAi3iKbQdbyB5NnuF7SZ3lOA5t/
         ZI7ME9kiVqFK5C16thOPA7avKxRgPkeKXFxEuf8WQawRHPmROGJNJL6JcbKVTnGX52aC
         Qowql//xHPefp1pf8IEl2Uzn0+d/y5LzXZFSwm3BfCmVMnNXX9MVF8OOtfSOeswl6oUz
         CKOtFEz2Y5UDc54QZmVf5WvjLClHRwKEokAa6SpXeF6Apq0u5XRRFaoUYRLQzJV10Sb6
         P0tcksgHGfAf/BWDtOa4zgvDh24qAk2+vLaYMd3cKRj4ApVXNNZkG6ZNnEI27abMOUxe
         4hzg==
X-Forwarded-Encrypted: i=1; AJvYcCW9JqJHHEkYjvHiEjpYqW9L05UbtSfp5wPe5i6RPr1Nxkx7HxYbwwieUyl4a24ZCc02DZGrhELOWFS3MQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyTGYIwlBamUsjGBHp3L4JwtPl/y/yB0x1112IZ0XcFebXVdjy
	HPQ5ZiUdcEoLnnPneZPRK0zIz1ic83xZAhtPiUEvPUm0iJeqkhrQEEdoS0lNtTQ=
X-Gm-Gg: ASbGncv5UWigU+4LclpSPn8G3v8B7bjq7p4EdU+UZtScw1c7c3q9JlOO+XkMikPsfoa
	4t6mRiG7U0cPwVXtCCraxZFzZ46GFYXTPmTGqrswfj82yNPS9VD1JYYfZnzpVl/Ptht8MwaTaYj
	qwKlqu+Nk26TCDt8n4B77uT+I0kJexf7De7BRZSoB0+hH09oTpH88h3LRRQV6Tye+UvuHNmOLaM
	c15Ro9ykjYVBtiq4kt+Y3Kc49T0vJ4LCbveAyZrD376cgoT+c9McgXlTM2x/lTEC6pcaiHdzcIk
	khoDUQvWOp9weu71uQdwvApK5yOugvwHPv37dy47CAJ9TOonD4dXEk5nR5TpCfJxP4XVoA==
X-Google-Smtp-Source: AGHT+IEl5dQ7SUi+h+pAoAiqxB4IHkrcoHFGA18aKW1ukykTVB77J+DM70kzsLvNIP2qQEyNm/KbYA==
X-Received: by 2002:a05:6402:378a:b0:5e5:bb0:5d8b with SMTP id 4fb4d7f45d1cf-5e50bb0608emr14240833a12.10.1741085874589;
        Tue, 04 Mar 2025 02:57:54 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c43a5acdsm8002966a12.77.2025.03.04.02.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 02:57:53 -0800 (PST)
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
Subject: [PATCH v3 3/6] ASoC: q6apm-dai: make use of q6apm_get_hw_pointer
Date: Tue,  4 Mar 2025 10:57:20 +0000
Message-Id: <20250304105723.10579-4-srinivas.kandagatla@linaro.org>
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

With the existing code, the buffer position is only reset in pointer
callback, which leaves the possiblity of it going over the size of
buffer size and reporting incorrect position to userspace.

Without this patch, its possible to see errors like:
snd-x1e80100 sound: invalid position: pcmC0D0p:0, pos = 12288, buffer size = 12288, period size = 1536
snd-x1e80100 sound: invalid position: pcmC0D0p:0, pos = 12288, buffer size = 12288, period size = 1536

Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 9d8e8e37c6de..90cb24947f31 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -64,7 +64,6 @@ struct q6apm_dai_rtd {
 	phys_addr_t phys;
 	unsigned int pcm_size;
 	unsigned int pcm_count;
-	unsigned int pos;       /* Buffer position */
 	unsigned int periods;
 	unsigned int bytes_sent;
 	unsigned int bytes_received;
@@ -124,23 +123,16 @@ static void event_handler(uint32_t opcode, uint32_t token, void *payload, void *
 {
 	struct q6apm_dai_rtd *prtd = priv;
 	struct snd_pcm_substream *substream = prtd->substream;
-	unsigned long flags;
 
 	switch (opcode) {
 	case APM_CLIENT_EVENT_CMD_EOS_DONE:
 		prtd->state = Q6APM_STREAM_STOPPED;
 		break;
 	case APM_CLIENT_EVENT_DATA_WRITE_DONE:
-		spin_lock_irqsave(&prtd->lock, flags);
-		prtd->pos += prtd->pcm_count;
-		spin_unlock_irqrestore(&prtd->lock, flags);
 		snd_pcm_period_elapsed(substream);
 
 		break;
 	case APM_CLIENT_EVENT_DATA_READ_DONE:
-		spin_lock_irqsave(&prtd->lock, flags);
-		prtd->pos += prtd->pcm_count;
-		spin_unlock_irqrestore(&prtd->lock, flags);
 		snd_pcm_period_elapsed(substream);
 		if (prtd->state == Q6APM_STREAM_RUNNING)
 			q6apm_read(prtd->graph);
@@ -247,7 +239,6 @@ static int q6apm_dai_prepare(struct snd_soc_component *component,
 	}
 
 	prtd->pcm_count = snd_pcm_lib_period_bytes(substream);
-	prtd->pos = 0;
 	/* rate and channels are sent to audio driver */
 	ret = q6apm_graph_media_format_shmem(prtd->graph, &cfg);
 	if (ret < 0) {
@@ -445,16 +436,12 @@ static snd_pcm_uframes_t q6apm_dai_pointer(struct snd_soc_component *component,
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct q6apm_dai_rtd *prtd = runtime->private_data;
 	snd_pcm_uframes_t ptr;
-	unsigned long flags;
 
-	spin_lock_irqsave(&prtd->lock, flags);
-	if (prtd->pos == prtd->pcm_size)
-		prtd->pos = 0;
-
-	ptr =  bytes_to_frames(runtime, prtd->pos);
-	spin_unlock_irqrestore(&prtd->lock, flags);
+	ptr = q6apm_get_hw_pointer(prtd->graph, substream->stream) * runtime->period_size;
+	if (ptr)
+		return ptr - 1;
 
-	return ptr;
+	return 0;
 }
 
 static int q6apm_dai_hw_params(struct snd_soc_component *component,
@@ -669,8 +656,6 @@ static int q6apm_dai_compr_set_params(struct snd_soc_component *component,
 	prtd->pcm_size = runtime->fragments * runtime->fragment_size;
 	prtd->bits_per_sample = 16;
 
-	prtd->pos = 0;
-
 	if (prtd->next_track != true) {
 		memcpy(&prtd->codec, codec, sizeof(*codec));
 
-- 
2.39.5

