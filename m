Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5CB199949
	for <linux-sound@vger.kernel.org>; Thu, 27 Mar 2025 15:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743090415; cv=none; b=cD4iGxkEs+cQGDSjJqh8Sq+qWZqdH9F+ird72FJnsU5YDWbXMFxDxlabjzHYCPQznoJ4fO2lW5SCFIiGpzSFq086SJu+U5ML6n4GHY3Q/WO2VE09qSxvqS+on0RFgqHH15hhAutVjk4i+TUuA5NphFvcQfcpfsGC0y5WyYYMCos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743090415; c=relaxed/simple;
	bh=LPH7fmB2piYJTlMhDGZnc6I3l1pOMgZFoEBi543qq+s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gYthnSCGgIORQ5V+OklWMQJ2OxOvkTc/ylgJlOD0JBb0wSwipur4z8X3Ynzc28A/cUP8yUO0/HWDu7R+8TE0WASVKmnmKVxa4yrDcP/dkMsadH5sPJFIuYjtB7K6J7K42hS2b03lfLtZKG05OFULr3xd1+CHEI+WeKCQIFfZHv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XO6E1K9K; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XO6E1K9K"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso6174545e9.0
        for <linux-sound@vger.kernel.org>; Thu, 27 Mar 2025 08:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743090411; x=1743695211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tA2zJWv1o+75nzP8/krgasVJF7/Bs9xLeh0TRybxqLI=;
        b=XO6E1K9KBKFAlkpvoa6b0HjQWU6bAXd8PE2o4jWs5h21l+Ayfus4yWTQYC0Tf23w/3
         oZdXcrQBVP2Gznv5foI/iIsk0dvsWLRJk7k4ouCuVy7/MxLuOvjnEtcpUHx8t47JJgSE
         iKdMXxQKJuXD/wul5EuiFJxBiqb0/KvDF0xN5wU1v3S0MKxjLlOz5gHcUDQYP5YqX6Ic
         Q3O6ZsFT3e9lEI/KbdfDEEhDT+lE3ui27Q+VGwr+epSUva1m87kWp8QGqrH0tx3wpL8w
         hTep97GrN9dw79lU/XvF0mlw4ffv/TBS9UTYAPKOFbXQrJ8GmXYHWfT7bPLyOZ3vJgLB
         uquQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743090411; x=1743695211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tA2zJWv1o+75nzP8/krgasVJF7/Bs9xLeh0TRybxqLI=;
        b=bTC/nbMpb1fYfKaQTevgCr9P7tdgeTP8DazXfkh14hFKayocJ+cSPV+8yVIl3iIUlf
         IABOAajlupxAC37FwadNmH46o/PfdfrzE2BxvbjUWm1VDZ+ZzOmKz3WRGkZcAuE8mpXm
         0Zsi4LbASK7s16qFMTKLJWugxVhi9e2yFhvNC7o1RymlUH/aud+7SyccCBx3jiEtcD8s
         /L1a4sg1tRmtuXEo8Yd45ezGSWhz3RwkZ8Px3Vt/Pjk3LTFd5uLzFvTBHOTyJGQHuxVM
         22FDRGr8MlpjyldQyqAs0d3X9Ao029b3fdBRt6QsOp18SdHt2msVMZIGm5jG4QoKCKSg
         JxFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRiwFzbvU5GYD6gNfNjL0qrSEDVqQyxZNljahf3rEjSkUz1638sbnGpFwCDDMDEBskS2dC2OYqu6RYYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YylKqaUWNyQQy7dipHZ9HVDUCbnJBqPoTbeAwphnB/wzIHZJWh2
	oIl889SoK8qUPjsQ7J+Q8cj25BDB6dnnV4+A6Op6symTNZEEwDPDIWzCYOWVQzw=
X-Gm-Gg: ASbGncuwuxeWDn5uqC7Q1drtKphP2LDtdiVLrAbv/7kka7AEv1twH1k8dOwG6MGTsBm
	SVAXmpkojugI3YSK5qKsJti/1qxJ/DkFxYr6fEfloqRcFd01pR2m8ALf1yJyZ86gRN2rbO0SUJr
	jtyf2YWcqC82ndbYL9H26qh1tQgY1FlGWp0rUG1G5FGKGFnvjWhlMtxnJRq8kunV2HEoV4Wl2H2
	SC9Qsb19X3OxWk7QRHGvvDZilKN/sBYEVHQw7g73PAjBs2NSEOGME2o+jfgjLA42c6+KkeOfIdw
	IHNoyvHE02LBlu40IRDOYhArxK/swTqS8e+mC7TKftN+NB/7eBJDGaRk337san3gG7U=
X-Google-Smtp-Source: AGHT+IEQdOD49ykeAMjyB/w/AZwjJja6wbJrFyDzakLR4KdkXKrN6xLOpUaq5nSdkDLMVtpBUCPPHg==
X-Received: by 2002:a05:600c:458e:b0:43c:e9d0:9ee5 with SMTP id 5b1f17b1804b1-43d84fc181emr43722905e9.18.1743090411433;
        Thu, 27 Mar 2025 08:46:51 -0700 (PDT)
Received: from localhost.localdomain ([2a02:c7c:7213:c700:e992:6869:474c:a63f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82dedde6sm41768545e9.5.2025.03.27.08.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 08:46:51 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: broonie@kernel.org,
	srinivas.kandagatla@linaro.org,
	linux-sound@vger.kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	krzysztof.kozlowski@linaro.org,
	pierre-louis.bossart@linux.dev,
	vkoul@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH] ASoC: qdsp6: q6asm-dai: fix q6asm_dai_compr_set_params error path
Date: Thu, 27 Mar 2025 15:46:50 +0000
Message-ID: <20250327154650.337404-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In case of attempts to compress playback something, for instance,
when audio routing is not set up correctly, the audio DSP is left in
inconsistent state because we are not doing the correct things in
the error path of q6asm_dai_compr_set_params().

So, when routing is not set up and compress playback is attempted
the following errors are present (simplified log):

q6routing routing: Routing not setup for MultiMedia-1 Session
q6asm-dai dais: Stream reg failed ret:-22
q6asm-dai dais: ASoC error (-22): at snd_soc_component_compr_set_params()
on 17300000.remoteproc:glink-edge:apr:service@7:dais

After setting the correct routing the compress playback will always fail:

q6asm-dai dais: cmd = 0x10db3 returned error = 0x9
q6asm-dai dais: DSP returned error[9]
q6asm-dai dais: q6asm_open_write failed
q6asm-dai dais: ASoC error (-22): at snd_soc_component_compr_set_params()
on 17300000.remoteproc:glink-edge:apr:service@7:dais

0x9 here means "Operation is already processed". The CMD_OPEN here was
sent the second time hence DSP responds that it was already done.

Turns out the CMD_CLOSE should be sent after the q6asm_open_write()
succeeded but something failed after that, for instance, routing
setup.

Fix this by slightly reworking the error path in
q6asm_dai_compr_set_params().

Tested on QRB5165 RB5 and SDM845 RB3 boards.

Cc: stable@vger.kernel.org
Fixes: 5b39363e54cc ("ASoC: q6asm-dai: prepare set params to accept profile change")
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index 045100c94352..a400c9a31fea 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -892,9 +892,7 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
 
 		if (ret < 0) {
 			dev_err(dev, "q6asm_open_write failed\n");
-			q6asm_audio_client_free(prtd->audio_client);
-			prtd->audio_client = NULL;
-			return ret;
+			goto open_err;
 		}
 	}
 
@@ -903,7 +901,7 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
 			      prtd->session_id, dir);
 	if (ret) {
 		dev_err(dev, "Stream reg failed ret:%d\n", ret);
-		return ret;
+		goto q6_err;
 	}
 
 	ret = __q6asm_dai_compr_set_codec_params(component, stream,
@@ -911,7 +909,7 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
 						 prtd->stream_id);
 	if (ret) {
 		dev_err(dev, "codec param setup failed ret:%d\n", ret);
-		return ret;
+		goto q6_err;
 	}
 
 	ret = q6asm_map_memory_regions(dir, prtd->audio_client, prtd->phys,
@@ -920,12 +918,21 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
 
 	if (ret < 0) {
 		dev_err(dev, "Buffer Mapping failed ret:%d\n", ret);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto q6_err;
 	}
 
 	prtd->state = Q6ASM_STREAM_RUNNING;
 
 	return 0;
+
+q6_err:
+	q6asm_cmd(prtd->audio_client, prtd->stream_id, CMD_CLOSE);
+
+open_err:
+	q6asm_audio_client_free(prtd->audio_client);
+	prtd->audio_client = NULL;
+	return ret;
 }
 
 static int q6asm_dai_compr_set_metadata(struct snd_soc_component *component,
-- 
2.47.2

