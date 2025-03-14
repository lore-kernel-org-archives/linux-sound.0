Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91489204C13
	for <linux-sound@vger.kernel.org>; Fri, 14 Mar 2025 17:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741974520; cv=none; b=CJlQsSl3PRMf9KKWZfpOGQH0aXurXMyfL2bsOSUYmUJDi5gKpFqU5Pe4sl1nGO6kxHOSwMEY6m+8bJZUITxIemSax2XJsY1ZnuNWWXNfxuIXmEoKQcYkGbg8WfMffdKsH8bTcBb0+TBWy+DVGEnTX4++YmwjiepCGlpYb0VpVfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741974520; c=relaxed/simple;
	bh=GTv0VCH3s0WKdgoZHW+Neb05F5hHPFrcMTNWEHTQEPc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i/2Z/MUSIZViLpraL/+CQaZAX8CvSMygRBtJ5G9WYnpvtcMUiTbB4wNRlLut1yoamCYRN/Lpz5J0HX5gRfO98i0Yp++H4MTFeeQR0Vbj37lfgLGNUUdbvolTpC9O2Z6aa9nPjwJajvK4T82eB7x1eR7B7EEacQqd/p9G8xuIXQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FQk1h7zb; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FQk1h7zb"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-391342fc0b5so1983333f8f.3
        for <linux-sound@vger.kernel.org>; Fri, 14 Mar 2025 10:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741974517; x=1742579317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UmD5vNzSSLCYtQiI6TARd80NsNkLFJqSnN180ML5a34=;
        b=FQk1h7zbG/In83KeSzc7kav2fg+TJmkzb9qqyGOf1JQkubfTfBTtfKNg7dCmKjpXu0
         PCDyBEQNDXzn+tisQNBydCsHL83TvzatS1OqrPXXLTjnqPLSbKrPnxiVIXVzpMfiGX+P
         M396vjnoecIevnUsUNYRJKRoYmFaJ1QRpF04b69AyFAPJ8/N5AUE833NBesTyEYkVB+a
         cxqekdPkdL1xGKO/a7PXK7q1wasPnO9H9ALe5nlagHWbzWSyg7LiKFOXw9RC+eqMrFtV
         OkJLN815O8ad/b3Y6ZfJgXE9C0ghNnONUf+2XrZry05hCqvR1IPEofHm2eMLq1q5x4ng
         G1YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741974517; x=1742579317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UmD5vNzSSLCYtQiI6TARd80NsNkLFJqSnN180ML5a34=;
        b=F3ODBpnagxFzBc2wtdj3yuV78UCiWvJGBKgiZzuKwkJcwGAOPPan1VvvVr0bSvtV88
         JdEXZ56FHhdmhN0TZoxj2Jtlk4lWe0Xl+FzNEdhx8jLpGFMmmniLLn7oxcImNPZGv0zG
         Nc0MjIzlJ6JemoNgxwYOIxFUdqlYW0729DZMR2HRunDdSSfeHgGaeXAfXcmUNYOYUd82
         CxahsLHM1USQR6LcOtdBdm1Kq3QKIK4+qn2W1aI7YiVUwJuvpxvDlN3hH+ca9jJ8HXzV
         iHd+8aqg2fbPe/5VeI2xRGzz7I1gPE3c+6yppjCbTaUAtSmcyZ3jYjcecxjdo9nSc1O/
         VuGA==
X-Forwarded-Encrypted: i=1; AJvYcCXrRUEA7jtbc5460yxCO+CC1ROF4bCRMi8lhYJOP4FbxwFJD5V8WCzme5PemIJNkLVZ8rrxrUvKbpo2rA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2/WAT/kk5cdo+++f0V8m8SEINPaqwH9Hi6obKFys0hQCPApj4
	frL285Xfm7mbmpSdwMNzVzpoli4Kbw/OuOs/SsDnjkpit+C5gb6csgyEG1UM1VE=
X-Gm-Gg: ASbGncvq4ayCUx+O4wfh5TOaIGbdfdJjCF7On5vrRT/lbLhOmOrcTla+MFMnY9XXEvC
	R0W071tjA1wGTwBet5ZjMBq/gb8y1ChVos25dVuL5UDInOicO9Wmw5WTnUr7EDc3EIID0DnhnrH
	lL8vJELW2Q3iz6z/Vx8kaQHnlxLvo+Efj7T4TlA2zzMBfCOHzzNCd9lE3SD7WUjXxIVza0qVfzF
	ENqDp3geKDk1Z5nnA8KHsE/2KbxM2CssFdT5DoSZ8OqwjOG84Ox7YJNidfO59R7aoXJk/97WezY
	Bj6CLi5kyVAKxpg1Gl3RauTdbTe+Ru9ToJ57EcM8SfBSIL1DWTRpBCjyNvY8OnVGk2DMcA==
X-Google-Smtp-Source: AGHT+IEDC3mTs5ZEgnH5M13Yv5WSovrEtsi3f3jqP63eSIlzIlegYCTCHHMMtUO2OfGOcqcPh6kT9w==
X-Received: by 2002:a5d:64c2:0:b0:38c:2745:2df3 with SMTP id ffacd0b85a97d-397202a1acemr4508526f8f.37.1741974516847;
        Fri, 14 Mar 2025 10:48:36 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c8975afesm6117243f8f.47.2025.03.14.10.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 10:48:35 -0700 (PDT)
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
Subject: [PATCH v5 3/5] ASoC: q6apm-dai: make use of q6apm_get_hw_pointer
Date: Fri, 14 Mar 2025 17:47:58 +0000
Message-Id: <20250314174800.10142-4-srinivas.kandagatla@linaro.org>
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

With the existing code, the buffer position is only reset in pointer
callback, which leaves the possiblity of it going over the size of
buffer size and reporting incorrect position to userspace.

Without this patch, its possible to see errors like:
snd-x1e80100 sound: invalid position: pcmC0D0p:0, pos = 12288, buffer size = 12288, period size = 1536
snd-x1e80100 sound: invalid position: pcmC0D0p:0, pos = 12288, buffer size = 12288, period size = 1536

Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
Cc: stable@vger.kernel.org
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Johan Hovold <johan+linaro@kernel.org>
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

