Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D3520126A
	for <linux-sound@vger.kernel.org>; Fri, 14 Mar 2025 17:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741974516; cv=none; b=NgMXIeRdOdEO19b/ptACWFB7HLNqZVXWuOC32wMAlcAzVnTDxC2Kcaslo9wvH5BxYDUQzibOcS+WswyR+f7AUEnWJNui5h1cft/gyEmrNw4rGKeRVhEJ4RFVWiwJ4faFUxctqA4+9ybJy15V8G4J+dSFlJGzyC+CbW9fPqy8y7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741974516; c=relaxed/simple;
	bh=HQ7LBpR32xGBqxjc9huA/ExDfMvzkYa6j2dkGfkbsHc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QBE4/t+wP5bOE7tb/wkCdMtPwm/MbbDZoK5pyxaQ+XOqls2V7bVwBCDr2ut3z/xzqJvgh4jFjIRwh0kwv1UX4vb7wM+Fx0Z5pFhr0xlEEhcB10Q+3Fd9A28NHcHVnYjfH5Ut1yqxLyWtesDjRUvRTxIH9FhV3JNptMl60Auig34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kuUq1lb0; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kuUq1lb0"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3912c09be7dso1603214f8f.1
        for <linux-sound@vger.kernel.org>; Fri, 14 Mar 2025 10:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741974513; x=1742579313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UeWiGiaBOkfBI5CIl4K/bsXJMAc22L9UaitEm54UW/g=;
        b=kuUq1lb0x+x1x0LNJC/9iWGDXpuCQQJBrw/7vMM0yTXL1AQZuZpzadhI+MbwbmGGCG
         Jq5DDi+ckwaI/stPo/nOeMW5iBw4nSmPinnng8zQTOZiSxAgK2bwg5JomaTAfZHjTCDJ
         IiZGym5M1P3QpBdwWb10Hi8BN3IwJSES2JbvXIFWioYkG8MCEbUZwajyodEq/j39g/kL
         sSZWjIO/5f4L42lIqLPi6j3Ez2euJK1Lg7jLskj0IumWCePwkxe5s+rnNscufxhFZelt
         kgS2dkVIBZK+7q/7GVsNBmF47Y9Z10voTm9Mycj8znSAOZ5XdLf+Zfex8mXLYxZoMFTH
         aTcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741974513; x=1742579313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UeWiGiaBOkfBI5CIl4K/bsXJMAc22L9UaitEm54UW/g=;
        b=U0v1pgmteoduj0MPr0PHSsU+Pr6XickE1uIWDC1DU9IsOJ8hWY3Xl37FP0gxSxHtvE
         WiBlQ/OIk9BnzMoDyS7gz4sW323aSgYPwbMJ6/1iU9JpbvqgPykf5Nh6RihgpVUov01x
         HzyCL/xKb8ub2IFuqvcgRSV9BoeQYEQE13xfE7ERb5YuhOKzSQB93PFe8o3goUv4GlHT
         nSjKd+gHZqoHa/4MXzgk4ZbI2QZcNCwrJNG7D7vGB5mlKdRDxXjfKbj1622WflYrbQmg
         sEKrplLsTTjor72+oRi7Lzh3RwkDDq3GRsth4dxNoiKsECcV5RDwpBDZGPPLAZhTCUeY
         87KA==
X-Forwarded-Encrypted: i=1; AJvYcCWzb3KBP4DMNB247366jaaeeMIWlzA8VJemWWg9Y1dM6Kb2mJQOI2JsAEsZX+3SBeOjfBvfdgKDJ9cWBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzezQ5yIoEcKyPbgpf0rK9m+8kC6D0rhnIW0JuTD8goeBoDiuvi
	XxhRq79e/Rw68IullKLyRsJ1+s/zgPYwX4jn5KErYcxQVwqVrTyxxvGXLFeNvRg=
X-Gm-Gg: ASbGncvy4irGE+lCC54sY1m56xvW9b9sj1K318CAko/bIcwztZ9JjEzwjk5zsSxmrvn
	H+kylKOnO8rwqGNXOptL1TR4yIqaVJogzWwZ6oa/XGAiIkta5iK3nlmmnDqIT1RFNC44qACwxNk
	lWwnnGxdPt8ZNUHquNiCTMMOHUNw88ncqJNJdYcZUvTFEJCQv6PvO+bobrUFpFNaCe0d0njjVen
	Cz9hw8mVslLfwO2g6th8RQnAEtf25BSK/hR+Swwvm5eHDLl+qvf9AhN/5O8H3vzWfpT6lAP13Ky
	9YHEotu540FU1wRVEOgAxhqJ6FWxozuCqn82tkumvng/BF6B3A7Ljnv66CeTMpuAD882rg==
X-Google-Smtp-Source: AGHT+IGXspLE+tLwuq/II5uBd+Om3QATYkBGBnFc09jyWv2iMP8x/7KV53ItXjMrWcN1x5c51ID4zQ==
X-Received: by 2002:a5d:6c65:0:b0:390:f641:d8bb with SMTP id ffacd0b85a97d-3971f12d12amr5027495f8f.36.1741974513301;
        Fri, 14 Mar 2025 10:48:33 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c8975afesm6117243f8f.47.2025.03.14.10.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 10:48:32 -0700 (PDT)
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
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH v5 1/5] ASoC: q6apm-dai: schedule all available frames to avoid dsp under-runs
Date: Fri, 14 Mar 2025 17:47:56 +0000
Message-Id: <20250314174800.10142-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250314174800.10142-1-srinivas.kandagatla@linaro.org>
References: <20250314174800.10142-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

With the existing code, we are only setting up one period at a time, in a
ping-pong buffer style. This triggers lot of underruns in the dsp
leading to jitter noise during audio playback.

Fix this by scheduling all available periods, this will ensure that the dsp
has enough buffer feed and ultimatley fixing the underruns and audio
distortion.

Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
Cc: stable@vger.kernel.org
Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Johan Hovold <johan+linaro@kernel.org>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index c9404b5934c7..9d8e8e37c6de 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -70,6 +70,7 @@ struct q6apm_dai_rtd {
 	unsigned int bytes_received;
 	unsigned int copied_total;
 	uint16_t bits_per_sample;
+	snd_pcm_uframes_t queue_ptr;
 	bool next_track;
 	enum stream_state state;
 	struct q6apm_graph *graph;
@@ -134,8 +135,6 @@ static void event_handler(uint32_t opcode, uint32_t token, void *payload, void *
 		prtd->pos += prtd->pcm_count;
 		spin_unlock_irqrestore(&prtd->lock, flags);
 		snd_pcm_period_elapsed(substream);
-		if (prtd->state == Q6APM_STREAM_RUNNING)
-			q6apm_write_async(prtd->graph, prtd->pcm_count, 0, 0, 0);
 
 		break;
 	case APM_CLIENT_EVENT_DATA_READ_DONE:
@@ -294,6 +293,27 @@ static int q6apm_dai_prepare(struct snd_soc_component *component,
 	return 0;
 }
 
+static int q6apm_dai_ack(struct snd_soc_component *component, struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct q6apm_dai_rtd *prtd = runtime->private_data;
+	int i, ret = 0, avail_periods;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		avail_periods = (runtime->control->appl_ptr - prtd->queue_ptr)/runtime->period_size;
+		for (i = 0; i < avail_periods; i++) {
+			ret = q6apm_write_async(prtd->graph, prtd->pcm_count, 0, 0, NO_TIMESTAMP);
+			if (ret < 0) {
+				dev_err(component->dev, "Error queuing playback buffer %d\n", ret);
+				return ret;
+			}
+			prtd->queue_ptr += runtime->period_size;
+		}
+	}
+
+	return ret;
+}
+
 static int q6apm_dai_trigger(struct snd_soc_component *component,
 			     struct snd_pcm_substream *substream, int cmd)
 {
@@ -305,9 +325,6 @@ static int q6apm_dai_trigger(struct snd_soc_component *component,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		 /* start writing buffers for playback only as we already queued capture buffers */
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-			ret = q6apm_write_async(prtd->graph, prtd->pcm_count, 0, 0, 0);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 		/* TODO support be handled via SoftPause Module */
@@ -836,6 +853,7 @@ static const struct snd_soc_component_driver q6apm_fe_dai_component = {
 	.hw_params	= q6apm_dai_hw_params,
 	.pointer	= q6apm_dai_pointer,
 	.trigger	= q6apm_dai_trigger,
+	.ack		= q6apm_dai_ack,
 	.compress_ops	= &q6apm_dai_compress_ops,
 	.use_dai_pcm_id = true,
 };
-- 
2.39.5

