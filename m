Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255752040A6
	for <linux-sound@vger.kernel.org>; Mon,  3 Feb 2025 12:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738586993; cv=none; b=YZSUOkNq6z4n3P5/gdWoukyp/yGbf4kXbtH91V48yM7X9vamKqErbYmfcpHhKZTE6eddnahBl08/1ydSEgVE/JEAuz8rgGp3JN84HwfpkLbvSrKsaSk6HA7jGI38Ob2UCMye2n7HxbT2beZ+/tkM1835X1HthWdWY6ALQ0qwUI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738586993; c=relaxed/simple;
	bh=nUkpU5HdizpxTWr8YxBaJkQkZC9L5Iy1O5dsyOZHQtY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ecs3zZxyD4ZMZ0HdpejrlBhisauUR3PNLaSpq6rBQZ/fY/n/IuARyYpR+ZAoZkBr8qghI/T8FnySWmjQ4oTrD97pb4CTXNJLPHyezvkqG/8PlGTKekGlKNkd2KL2Il1Dql0nLeB3ekPDJaKKNEQOgYPdAf0/ke502EWgpfgWUPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dI9+6Oxo; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dI9+6Oxo"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-385e3621518so2074752f8f.1
        for <linux-sound@vger.kernel.org>; Mon, 03 Feb 2025 04:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738586989; x=1739191789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ywGUrOp/w8H6RCppdbR3Agfd+wqSLlU6tOUovBhQqng=;
        b=dI9+6OxokdsnoihcAOg5SVnwAgJdhRbr4yoY2vKt1NmMyHrloRebNjBS7z/4wG2e6y
         KwDneDXWijRuWnYy+MUgYtJ2TSV2GjgG1xvBiOqr1Th/9bP3STpj+Hy/hIDc1txIffFW
         aObscZVLtL7P7gXtppoDUkY0hNtxTwP0nkLaluQ8BitU0h7X52c+mUnpXKxJc3Bt5PLP
         OLaWuVUYCUzv7IEvDD1Udjp3hYy2gYjCrVXHogEXPVXlpAKQ/lCi+bIm4LDFFrHLdHbs
         NJxP7mOKjkwa3WeoSMQueYVetWzBzZ5XBJGKZ8jiaJIy+xLzw0Oa5fxKdf8P6ULm0Ll/
         V7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738586989; x=1739191789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ywGUrOp/w8H6RCppdbR3Agfd+wqSLlU6tOUovBhQqng=;
        b=YM2zVvDNey+qpARLiXujzGQmCpKhkeePig4jPRhCEm7t/UqBJGoJXsxZJjgxHW/OvX
         JicgYFZuOKWasAobt2emVvb5IUXuG0a5EoN5c6heHdwQnpKZ+9h41vZyg/bALmhThXLB
         Eyeau2EtyZ6IFrinrYKeF6wKcwx6GO/gDQLsZhF+0pLxNBjENElzJ+PdqZifNTq1bWXQ
         DaWMWIP/2iN9HYrmIzoG3Rtn8fFqtAzT+YiEA/FUIkLHJrtwwmugDWT54xIVeeeAyd19
         EgnKdnulznrumRRkrRdRm4lpR4z5yX4oZ/epDT0BPf5sGbKFGtUwqq/jPkRGyag65Clg
         TcYw==
X-Forwarded-Encrypted: i=1; AJvYcCU4+hdvDM4vcLTYnutuzHVoNpIMWEKjHJ4qAePZmjEG4Sw0cZgfKvzquHqKsjjgq9N68owJ+ErxuQZTzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFfj+N0FerhDCu2sWjxdXZHvtQvYc7UkCr2oO239E6Ko9RByOP
	CZ8JdbayzwUQMiDqPPTLRRwj+140qYty97HED2LMinlxxrLd0FeF4g5+A6t/B9w=
X-Gm-Gg: ASbGncvHD0tHS+EJ2Wr9cZxz3KiP6U5dEGd0Wwerbl7VwJJsFl++mdqekyKIxdAo55V
	sAGUkrueEAj5Z2eX346vSyQVgVL5gsxaFWLhO8u6ZYuJzRQ+0Ij5ZLQmhywHPRUcWe+tILFn+NK
	bK5BIHbLrjgcBPfRahfopxiUCfAyGOeRD6XS7RXFnRCgZTJcMYatBydNh5Z3XqpHmSwTB9/4/Xk
	3xBib8bwptM103rM+4vNiiALgAcPuZ5kuolWayq7oIf8S4kfuNNUhKAtLmfvMsTSXqbBvjp/hZZ
	VvjcIe/X72WMAVq3hscwqbxYAD6R+FdhPkPVVh7b
X-Google-Smtp-Source: AGHT+IFcRPGPDmD48EIK6elAaZu2Zk8DxQERIr9dnmWyB0Uuf10XrVS2TvtkTaG7Mc0/1xomxVn61g==
X-Received: by 2002:adf:f504:0:b0:38b:e109:1e0d with SMTP id ffacd0b85a97d-38c520b6629mr14361510f8f.49.1738586989345;
        Mon, 03 Feb 2025 04:49:49 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc2f17dsm189411645e9.23.2025.02.03.04.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:49:48 -0800 (PST)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	krzysztof.kozlowski@linaro.org,
	pierre-louis.bossart@linux.dev,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] ASoC: q6apm-dai: schedule all the periods before we start streaming
Date: Mon,  3 Feb 2025 12:49:45 +0000
Message-Id: <20250203124945.11406-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

With the existing code, we are only setting up one period at a time, in a
ping-pong buffer style. This tiggers lot of underruns in the dsp
leading to jitter noise during audio playback.

Fix this by scheduling all the periods, this will ensure that the dsp
has enough buffer feed and ultimatley fixing the underruns and audio
distortion.

Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index c9404b5934c7..148c3fb77168 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -299,15 +299,17 @@ static int q6apm_dai_trigger(struct snd_soc_component *component,
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct q6apm_dai_rtd *prtd = runtime->private_data;
-	int ret = 0;
+	int ret = 0, i;
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		 /* start writing buffers for playback only as we already queued capture buffers */
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-			ret = q6apm_write_async(prtd->graph, prtd->pcm_count, 0, 0, 0);
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+			for (i = 0; i < runtime->periods; i++)
+				ret = q6apm_write_async(prtd->graph, prtd->pcm_count, 0, 0, 0);
+		}
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 		/* TODO support be handled via SoftPause Module */
-- 
2.39.5

