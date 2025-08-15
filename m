Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22F72882A1
	for <linux-sound@vger.kernel.org>; Fri, 15 Aug 2025 11:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755257966; cv=none; b=NGixHe3l36gyAslrOXsMHySmEGxO4aG9ft3ji9TN7arPs3WZOo4nnzvrSCQu245z/2S/X+ARZbFGO/mS68V9FUYan3JC6iuli2Ry+FF7Bw+KHjYyugac4upF988Nu3Koj678s0RATEZDGCynYk5fjDWUI6Wlc+8VWYQHJIBh5M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755257966; c=relaxed/simple;
	bh=TOUVdqm7mQx3pyxgpuavzmM5bjtretRp24F0LUMdPps=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iu2NwUJ8RbOCGOOZmQ4EAHfkaHM/5amaWHiqgBl/8OWY3Dv5rfH4aopWdoZ/gTNri3Ll2hRXY3ttWTAxkJNVZ8nhhlBEAewqf/vWmbSS+iYnHAFWyKP9vvfLAfAWG/TbbMIaN9P+p0socmUZlR48noEJDfUI+X7ZzwGl29k/3/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I/IDUZvo; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I/IDUZvo"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-afcb78d5e13so28335066b.1
        for <linux-sound@vger.kernel.org>; Fri, 15 Aug 2025 04:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755257963; x=1755862763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x2PuPJpMglgU/pqE3sPu/yNVHdTRzSvgqfdxSlclOhI=;
        b=I/IDUZvocmiCnc/AsQ5R5ES12XEogwqBahE75ZQlvObEuJYcnvZyE9cu93Bw/kgW3U
         ZUBraPjDhx60jJXkWxfYhsw5VUEXL4rAl+jwB+7X/9w9IOC+r6akbdBsD2HB7J101VpZ
         cfC7GNGDf0PQVvB70u2sssK6r6HFQErAd5jk+k7GLs3aXxrovHlr7BZZecpNIgDQ3JD0
         vIzLd+CPkdVcX/iqIqFSXFBNHkz3BjsXCUNbYgb5gNhi2GQwcDZFKGoLUk/DKS09OPuV
         YodXZSVaZQ0hw5iabZrMoQhSs1ELYBFEKn2Lw4S0gMR/3DkvyxCGMce6hyRr9OpmA9Oy
         yoyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755257963; x=1755862763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x2PuPJpMglgU/pqE3sPu/yNVHdTRzSvgqfdxSlclOhI=;
        b=An9Fl8WoU/arTjW6/FCH3W9oSDZ40iEsXIvM3g/USbMaxvrqW5HldIlsAwGmHV5lVI
         WfawDs75HvlsP0z/h6hdCc6+qsemc3i5IKW6SbvTteevbMv0z/h+JiESYAP6kPRs6PhP
         nH5YxYiobPrdrxBOIuMsKM64DfwfRiCmn1LpQ/CaQqDY0POpHYCt+5+nDknz5Ivo2qpO
         UAzVkNX54MeR8VpSP2hZkPCFFnKrhdmSIO+e3rRhYjL7wdF9YDh+ivtw2of6IppBy3li
         YC9HvBx+gUuD6EYmAcJ7PtAn/rwH0g/uCv7Rhv8j96/qRKzLBKJqIquSmUYtgQh29rcU
         YsBw==
X-Forwarded-Encrypted: i=1; AJvYcCXdL1izM/IAgQBnPIdQaf4c2FYLvRKaHTNBEKToWHyntMop7+qOkeLTI8USM+72YbF2B2Rhsp5LKcOSHA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy51mdg9p0HYwzlsHMBdFMaX/4i5Wz7XNjpBbGFaeJ4+5/Xb5Rl
	GpeL3VIQ6HhMpE5nX5bhHKtFud1+ci+PMEVqlV7Y+qmUdhrWJK+2kUIhM2HnFbCtPIk=
X-Gm-Gg: ASbGncsj9XwniBvJdDj9NXsrZDYwckBKhIZNJPNxEOiSlvjGeXIV3et8TIyPXyNTfyk
	2Oi+Q/EX0AteYw0wiYjPNzb/Wap+WW2nXllOt+HF4u6QkmKcwVzjC84TZT4uzv1f7gl9HEa4jTR
	7bMs6tRD8ga/rT1eIOK+SHsBrUChULjzPrBgkq9MnDJE+evQS5AXJHgNmlG06Uw1GwwhXvB3ZDC
	6z4URGXwq0b1CMIlvkxXczzibf8DXKSjTUqbWEBvON+v7aatF9Nmr3Kni2IvK3WaCwXwXj8+ds4
	1a4wJJRJjoay2ayi2VuERqTZxUKxL0uB9zG5ruvVe4E5vsjDzcOugxHXxKhPlDfXYsXM7lBqvKk
	8e2ulMnGU5zEGJNGaBHl5Q7ulG6pH+tGI2Q==
X-Google-Smtp-Source: AGHT+IG3is9XPNoMvbvLw+fw8hEwF+57P+gasZWIKWJ8zpvGPShYlYN+17VhXnG/gz0Yg6JMVLiT5Q==
X-Received: by 2002:a17:907:3c8e:b0:adb:5985:5b58 with SMTP id a640c23a62f3a-afcdc062423mr65771566b.1.1755257962753;
        Fri, 15 Aug 2025 04:39:22 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdd050b32sm125285366b.112.2025.08.15.04.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 04:39:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH] ASoC: qcom: q6apm-lpass-dais: Fix NULL pointer dereference if source graph failed
Date: Fri, 15 Aug 2025 13:39:16 +0200
Message-ID: <20250815113915.168009-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1908; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=TOUVdqm7mQx3pyxgpuavzmM5bjtretRp24F0LUMdPps=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBonxxjFL3sVlJ7mhEF9BvOAVoVIk0y3Oq7cCtUT
 GlCjUpnV2mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaJ8cYwAKCRDBN2bmhouD
 1/MmD/0cOIalRyUB+JR//1Cs3p5cLxSOEBSxH9CJO113MV4+gBkBuStuw2DEdoQnq7fr8vyL+IK
 QuNwPkWybfb18XiuVZg9q9+BuoTenfqK+/e9sx8sPPHkNS7iB/IEHFvgtxiK1AchY3AUjqA3U69
 yCNR+L+u1UefH/sDLj2MzsRWvAeFdy+m7KCGTrKXFOcge4uAIEafMI4C1zUyv9XXWbfL92hQRXP
 HcE0CsotyBiAH6aSJxTxh+V1IgkCQBrerCkA9Uu5ibAXQDJ49G8P9LHYj7YPHzuA/1Gu0+STM6g
 m/bbvqUaYCCg4unlJ4KYLa336VdTxPe/PSEwfAlCH/BioY9G9g9wNjZsUIdATaqHpH7lTXDcjui
 AkqF/WHsI7GwuamJV34jmqj5sZCRBdBr4dGfAX3vpipABnOagkNPuhXeeLmknSzLIuxdK6tqK5e
 AD0ZOLv6IHsWwFMq6nW7JiNjnRpsFRPnckz1/yynbV39YCZGnrjj21bg1hEtSgu2wruxHkPMby/
 YHdnyLf4gW3XNXb9tedwnl6Tw0xnFb8GwVp/bFTedQVSZcf7Jm9guIKatde/XJZL2u0C1tfI5vh
 914u+fedhGhaPo5GwCrHjIRVVbtloWI0EescCBnQLt7S8G07XK1sW+DswoHJq7DhIA5/cwFqoTm uJFOc2R2JX3xSvA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

If earlier opening of source graph fails (e.g. ADSP rejects due to
incorrect audioreach topology), the graph is closed and
"dai_data->graph[dai->id]" is assigned NULL.  Preparing the DAI for sink
graph continues though and next call to q6apm_lpass_dai_prepare()
receives dai_data->graph[dai->id]=NULL leading to NULL pointer
exception:

  qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
  qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
  q6apm-lpass-dais 30000000.remoteproc:glink-edge:gpr:service@1:bedais: fail to start APM port 78
  q6apm-lpass-dais 30000000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC: error at snd_soc_pcm_dai_prepare on TX_CODEC_DMA_TX_3: -22
  Unable to handle kernel NULL pointer dereference at virtual address 00000000000000a8
  ...
  Call trace:
   q6apm_graph_media_format_pcm+0x48/0x120 (P)
   q6apm_lpass_dai_prepare+0x110/0x1b4
   snd_soc_pcm_dai_prepare+0x74/0x108
   __soc_pcm_prepare+0x44/0x160
   dpcm_be_dai_prepare+0x124/0x1c0

Fixes: 30ad723b93ad ("ASoC: qdsp6: audioreach: add q6apm lpass dai support")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index f90628d9b90e..7520e6f024c3 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -191,6 +191,12 @@ static int q6apm_lpass_dai_prepare(struct snd_pcm_substream *substream, struct s
 			return rc;
 		}
 		dai_data->graph[graph_id] = graph;
+	} else if (!dai_data->graph[dai->id]) {
+		/*
+		 * Loading source graph failed before, so abort loading the sink
+		 * as well.
+		 */
+		return -EINVAL;
 	}
 
 	cfg->direction = substream->stream;
-- 
2.48.1

