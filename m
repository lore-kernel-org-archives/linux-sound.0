Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869AF1FE469
	for <linux-sound@vger.kernel.org>; Tue,  4 Mar 2025 10:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741085876; cv=none; b=FqlGfajWpqZNBW0aYMRvhjU8e5n9mWLaPhKWqwJhZLde/7t9ieTV1lxrVuiW6YYhNXC2e9NL2dDZrmL3onFbxiFG51AWgKY4Q5FHHADQu9cxhRN6+F1Zj0o+mfmkPeHsQx9+2aGqrwjMi/3x1UXNu66jTeVSw4PNbOfMkwQvE8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741085876; c=relaxed/simple;
	bh=a8wBb5Pu3Xn+ai4AGmTn/n+jSwHVc64nuzgsrIqk6KU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VcbFTrX6DpABWGo4N2MYSB2X3yujZHdW//QmgqNLVh/ZJLFKkZw8Pleht5jp009oTDi+vaTJJN9jQQubfZpKWSlp/5xQ78DWNyAFa9TGpJZ0I0EFzUZ6iFRDm0UCE74bhfgQCh0n2Wae8hjx+fJonRWrcliHPj1mzc09Y0mBy+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uy/lLvWZ; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uy/lLvWZ"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e4c0c12bccso9692974a12.1
        for <linux-sound@vger.kernel.org>; Tue, 04 Mar 2025 02:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741085872; x=1741690672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i0rt3fuU/Pf0rTgHYvdRPIfkUIcPPHNUBjw5GiQRLAs=;
        b=uy/lLvWZvtHfrQojVjj6SGU9ht9lfSFUHl06//CTzn9UZAGG3trTM+gYW66nD+pJhL
         C5xvfIM6DDHBA2KjO4iZrx6IwDKhdbm4u5slo+VeXQhZ766ixAH8YDUA/uCTjM4ZfyUL
         QXhNTG8JQXq+kmzNVi8oSRdshOe4EraWYNjd59ZhHAtpkdo+1j+V70dqClR69oLjR5Gk
         HC3+JCF+mlHiZT0ISG7HCftanfbObb8KLqRRA3Gu4sk2/9rR/vlvT/JGPfIjZqoKXM2x
         K8AAxUNO0cnJ+Z4du7+RlYvKVRvRzfLB46GUqS4JsWIkWzqEBPSTVMx/q2+JXfgl5MqY
         zpFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741085872; x=1741690672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i0rt3fuU/Pf0rTgHYvdRPIfkUIcPPHNUBjw5GiQRLAs=;
        b=gPSoEwekVylkfftWM9uA9iffznUOnSlrbQC3znbDquNFvxumUYhhzEv9OSF4JJRxg5
         +7JBzPZ5dkXVIg2klwSwuoDRAfPB1n2SezSrP78UlZcdOZQdnrMqWMTtBnFDG9ci8WVe
         gv9EcIf+k0QahxPL+raNmS9wqyH+jIrsYohfMwi/av1vh0PLzOlroPHAi70X5tEFWsA2
         EonUNY2VHUbNUVQRoVO2AXLhfx8X7DDo6mgqm+aafqQyVpqGr53POiVPa4SUQswWH9nx
         ZlA4t8Wqc0Lx88TV9XWRoH42J7wgV375mEBLCZW9iuOm7iCAcXg5UOr8NfMr8VU53kP2
         ddBg==
X-Forwarded-Encrypted: i=1; AJvYcCUwfvMF3EStte4FvgO7gRk82jt9/CsbHa1dyuN1+q8Q1r9nt8Xhz2dbQp7A9L23Q32x/S6SX0FSdclDmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ7KD/DkS5gr1s5VNYLoiie/fOlKckcm9n3iAAR8aXMCIpJv0r
	7wdSiqq/ER4X8WCUT0khGbq2+w0QTjlurfMBXS7QdjH09CXbQQEJPQmCmH+T3kY=
X-Gm-Gg: ASbGncv7nKlyDKSsrNDwpdN9nasGR13jkgPU+GVjNt5cDDnv4odLJKJe/6Q5tjfU1lE
	wpaXgzFFRUkcIF2b1s+Zuywu25HuRHpLJRh1Z12+VtQIgOwMfMSfJQO7wnCPHXx/9eEECU7cpM7
	a57usRpzgxapuzakk9vp6scbJWGZwb6rd3mL5aTghkwA0OyE2VJBajGUZ5aoqMjseUFonoREtUo
	eWKBcyL/iXZpXhe1weSxtgo6So8Xu2bCF+Pk28VlZBeD/RwxpWXbeRlkH57ZviWESounU8qWIx7
	z2o/wE4/iYghSmdYuCiGpZyfulH2rJyNQ5qTyM3o0xhyyQ0O/PzDI5+Q0suiErKuzqHwPQ==
X-Google-Smtp-Source: AGHT+IE2oxoC1L64pceFAJjINpFW78bsl4/VjfI/l/jWFrb64hOpXvLnDRUmBAhXfrCjNcCe085GuQ==
X-Received: by 2002:a05:6402:848:b0:5dc:d10a:1be8 with SMTP id 4fb4d7f45d1cf-5e4d6b0e6c9mr19059467a12.19.1741085871828;
        Tue, 04 Mar 2025 02:57:51 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c43a5acdsm8002966a12.77.2025.03.04.02.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 02:57:50 -0800 (PST)
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
Subject: [PATCH v3 1/6] ASoC: q6apm-dai: schedule all available frames to avoid dsp under-runs
Date: Tue,  4 Mar 2025 10:57:18 +0000
Message-Id: <20250304105723.10579-2-srinivas.kandagatla@linaro.org>
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

With the existing code, we are only setting up one period at a time, in a
ping-pong buffer style. This triggers lot of underruns in the dsp
leading to jitter noise during audio playback.

Fix this by scheduling all available periods, this will ensure that the dsp
has enough buffer feed and ultimatley fixing the underruns and audio
distortion.

Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

