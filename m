Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3588F20127A
	for <linux-sound@vger.kernel.org>; Fri, 14 Mar 2025 14:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741962810; cv=none; b=QfnHbzjODDwDp7tLD2kJrYvBHVzZDunVfjadNJ25slVdDWrBPjFSaf11x4CnOaX++BuXGJBTaJ5QMFlF7loc21w8RHwfp/1EQE0V2y+wfKptlvOVRhTVf6iOdD3y7NkINkuzDPR61LoC/x2dCNsZbKACBPLk2c+pmh+dKtN6NwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741962810; c=relaxed/simple;
	bh=rl1JUAbzuHruCH71rfySFM7KQHZ8STkXFPVIDYURSF0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=frv08kMcYvbNvjk/mDyf5W258TBHyXnIBd8rETqzZKn/DQA+MGZiF1ngpA3jPeqWmUW10E8jmFzp+N6GZuYgr/Ub8Xh+EWXOL82kMSfO/hLYPfebX75aHvuBa+Et4gM5HvrFKoa0qV36jGP2LEhc5HvV93A6SJvOr6DiGxtj8XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UlrVHwKQ; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UlrVHwKQ"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-391211ea598so1323853f8f.1
        for <linux-sound@vger.kernel.org>; Fri, 14 Mar 2025 07:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741962806; x=1742567606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m7r265E8NIQTLThxcAbd4dtQS3El8DVfLuvsTAa+XKw=;
        b=UlrVHwKQK+fpgNNXNiUJ2Z2aO/JsVlG23OaxaPfxm94E8CyXihZM2F+TbBxtZa0X09
         R6tsSxpjyLE8Q3esMWiYxR3Py9upeIh3ArYeTevgtAsEbSkG8qzW4nKT9PWwrHCoK4uP
         fMnaAHre291zLFYsN+bAF7kweBTOc5R5afPZIxAvRud+TNsFBseJfnj/kt11YZeMp2UY
         +AqAqU8wYeQpoe+NQORNsL1xnHhyR/pS0JH2NomLoeRYt+KHdbzZeDc+LbSuV5mCC3BF
         /3D9s1DwD35mkLGjQ3PesnaMoj9PqlVcS8tN4IlBTy3LPpACYeWRLdt1mvRMO6ZML9hw
         MggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741962806; x=1742567606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m7r265E8NIQTLThxcAbd4dtQS3El8DVfLuvsTAa+XKw=;
        b=eH+LasVicOq/1twfxVfR/jNRMIZiKkYEheuWFILwO4JjDDeVOR+9wT8UZYdHgBt4U9
         wUBZzTnWWL7Xw2fKg026+B0k+V2wN7ilYuqMWK+1OFH+iIXKeY8XqlkyhnthVvf29sYM
         /B2aQoPsuGMN8Kav2e7UTk0pritUaKlb+mFctz234bO+lfTzyFKh36RG9aLbRbDze5NH
         eS9RK93FmckNGrTwse4ZKI45lSNQmJdZOz1oMBYiaq/nzOTrh2P9HbGU2BKC62KtPZFH
         BfZ/cfbQ3j6NA1MI9pa6vsknhei2vGPxjq7VkLl9viWyJ2IWi7kAXnOfOWJkx70HZBF5
         4s/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWQ42YvVO3dB3wi3pabdqoMnMXVrn+a+T/aUcfq1XWgJcFYZCtlTeoEDgzlvlszuCjtgCUvStLb5MILRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvkNF1xbBh3SJes5xuqwLzfL9EeBJ7JjwD7L5mFaPvEwRad33p
	zXsJPSXk9+augBpFC1PZuOBOxCrPCrlwQW7duzeiHbPRc6f/vOaarfiE1VPsWAA=
X-Gm-Gg: ASbGncv6SCWePlGkIf4AvshBH90NKNws7m/duBYCEpPOnQPNYVvI/rPzQ7cgT9hLZBF
	VKyIkXbflNcadaUxIFk80WdGThGFtnw02U01z+TrRWyPL/dvRLkBDjeGn1S9HjO92wmzaBkZrp+
	c4GugBI7opKqLMp/GuFI4+36/tB1WeHiwOXGMFoSl6Qe0jimsxMpPfM5lJi4dZHaF0RPJFtRGmI
	vJsgPrixkaILZC2VxsRJxBKg14fg41YxV1i/wzDwmj+xFks9Yv4Qn9sXxQIFzUhR8h1ELmh1v35
	VGXNTjFQy4D/uZYa3SeNf4o4xDKMbm+346/iGQgjxz6oA/YNcEpiaq+7heIhzPQUxb/nJbpdgTy
	I0fw7
X-Google-Smtp-Source: AGHT+IHHvG7zpgRF/biasWJacaE8BgqYA/+Tzt9Ba1i6MJmKfz1aq1nD3PLvd4Da03+ceLCK/JoXgw==
X-Received: by 2002:a5d:5f84:0:b0:391:4095:49b7 with SMTP id ffacd0b85a97d-3971f12e65amr4834829f8f.25.1741962806395;
        Fri, 14 Mar 2025 07:33:26 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c82c2690sm5699168f8f.25.2025.03.14.07.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 07:33:25 -0700 (PDT)
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
Subject: [PATCH v4 3/5] ASoC: q6apm-dai: make use of q6apm_get_hw_pointer
Date: Fri, 14 Mar 2025 14:32:18 +0000
Message-Id: <20250314143220.6215-4-srinivas.kandagatla@linaro.org>
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

With the existing code, the buffer position is only reset in pointer
callback, which leaves the possiblity of it going over the size of
buffer size and reporting incorrect position to userspace.

Without this patch, its possible to see errors like:
snd-x1e80100 sound: invalid position: pcmC0D0p:0, pos = 12288, buffer size = 12288, period size = 1536
snd-x1e80100 sound: invalid position: pcmC0D0p:0, pos = 12288, buffer size = 12288, period size = 1536

Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
2.39.2

