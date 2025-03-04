Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74FF1FF605
	for <linux-sound@vger.kernel.org>; Tue,  4 Mar 2025 10:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741085880; cv=none; b=ppkBnTZasGLKJGoOEaBcaF2NGMHVOsJ9Q3r+IH8HQnUoYRQLAfIjMOwB4kBRN6yKpfSAGbAeAAJCvTPejdADvjmiE4JtLRa3Di2yxrapo7xu4YyoOhB2VwY/JgEHZk/v3DRtfDOwv8a745JUxif1m5UO04296vwYvKafOD/w1xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741085880; c=relaxed/simple;
	bh=U03Y8+otvCPyp6B90WiniVnGB768hd4h2QJoJ4PjQL4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VoZ8PWYGUN2I8zlZ1MmuMrTJTxBJXnXmIHzGbpa4FADHZIBDvED0tDvDtheFIQfkURiV5inG8bbsWa6ii4bUolQA0Rx0L23V6GG73MAGcdfhhBLADgYujK7uLj4x1RQl37t3E1/XsLACKqiV8CgBk+qQI/j5tX6a9OBICgle5H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MbZ5SdHZ; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MbZ5SdHZ"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e538388dd1so3017108a12.1
        for <linux-sound@vger.kernel.org>; Tue, 04 Mar 2025 02:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741085877; x=1741690677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EpWmkRDsOmXj9Ho1jnnfhy87hBtzpfdzQehUQCbXU8k=;
        b=MbZ5SdHZ6du5n6P1A2wKrr3gGiJWeafYrl4Cm1/jv60/XP43MWJByDr+gsUG1xv6qf
         t4fAmnBRvTe639oUT+WQfcMnThpiFoz9qtGh0H7Mhk0ONrJebz72zGmhQdS6xNd4Sl7z
         1u+XRI1GId5iNsWXwEsplhBhfEHdfY2061wVyBk/Q4XL8p1VGFtGHc7QJtyfOJruSaqd
         Yp8c1Za29YMCe+uZcQo21Aa5OkemRqXCexFAAac22FAvb4Nsgcael3tCONnh8StMgtv5
         RUbpff8nRxjNj8AovEz79Vvt79Z+gWeUEskZqeUlcpSLefCbfyXry+wRXOH0JyyO4PUM
         brnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741085877; x=1741690677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EpWmkRDsOmXj9Ho1jnnfhy87hBtzpfdzQehUQCbXU8k=;
        b=TFlyJzw7eITzpK1tDz5L+pFlTcmUlMygg4ydqrZ4uCyKrFiyIDqPdsdNjtmRcVxGD0
         mzyCW8vNeeBwYE7/HWhvPklFJ9/lrj9Ji+IKTgauA8mnQT5eM869R9A5RnnGSGmMBK/J
         o0/S/6h6eXLJc/AvD9vMLfC9rAwJTFnsjpXyB4uuyd1jpoMTelaUVUme39OJIzzMFmtm
         UXkpKIt6RJqExbxEUk5Vz4qCM9tMCpx/LQuzwS0MeBWZiGoRLnrSqTEECKV829SflSt5
         SsQLOErrZ6o94JtYaK5u4yp8GsCNumv4dcpupKd4kRFv2QK8JWvWutFzFYRCj4ZfI7Qi
         pYiA==
X-Forwarded-Encrypted: i=1; AJvYcCUmKueauc7puIYrvaytcR3J4iD5QASfa1xg/kd1VRtyRGuG4G0TN8MzFqqgNIWvuai1nw4RwdPO1b1Ngg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKk9eWgYvwt9gHXcLsj9hLPpBfoFdiaCaSGM7kUql5a3bntBag
	5sL9NUp9dPAoiWzksJpElL0bmH4yuPS7XoiC7/mxDur45ss5BDCNEYKsuLa07x0=
X-Gm-Gg: ASbGncsOY4EB93eI77bhcyWg7Pzdrpju+Dkdyo/7OmTYf6fUuHbFaG8LCfI3XLanJFS
	e7+McJCfv1RXEbjDNzlpwsNGEi8O3tUEO7+NeVh1w8MtUMPzlsRLtCL7jCRuwJOGEYQku7VG2oQ
	waZvqf82G9bZZi8lpVqaAv4ttUyxv+eyT60SnCC619zASgVC64D4wmtao5U4ryiNcChukCk/77P
	BnQe0bIfVMdOIODH8mC2YqdCslJ8hiNqO0PTENOWekfC5wKPMk9hysxK2ZAb1BkDqP9H/s91Hgt
	4Mt+4EFls5hCl45SCvR3FvqcZzt5sQljRd6OyiQ7Lu6G8OTIn2SZ/Nt+KMxBxRTLwM9iig==
X-Google-Smtp-Source: AGHT+IGeygA0lA5u++5TADbRIt4j3Ll52BOM26+v0dT+XCymoz2shCvC0jL3k2lSpDpggwQ5CUbTmg==
X-Received: by 2002:a05:6402:2794:b0:5e0:8c55:504 with SMTP id 4fb4d7f45d1cf-5e4d6ad3e21mr16124141a12.7.1741085877089;
        Tue, 04 Mar 2025 02:57:57 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c43a5acdsm8002966a12.77.2025.03.04.02.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 02:57:56 -0800 (PST)
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
Subject: [PATCH v3 5/6] ASoC: qdsp6: q6apm-dai: fix capture pipeline overruns.
Date: Tue,  4 Mar 2025 10:57:22 +0000
Message-Id: <20250304105723.10579-6-srinivas.kandagatla@linaro.org>
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

Period sizes less than 6k for capture path triggers overruns in the
dsp capture pipeline.

Change the period size and number of periods to value which DSP is happy with.

Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index bb761ee0164b..aca0a98d58a5 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -24,8 +24,8 @@
 #define PLAYBACK_MIN_PERIOD_SIZE	128
 #define CAPTURE_MIN_NUM_PERIODS		2
 #define CAPTURE_MAX_NUM_PERIODS		8
-#define CAPTURE_MAX_PERIOD_SIZE		4096
-#define CAPTURE_MIN_PERIOD_SIZE		320
+#define CAPTURE_MAX_PERIOD_SIZE		65536
+#define CAPTURE_MIN_PERIOD_SIZE		6144
 #define BUFFER_BYTES_MAX (PLAYBACK_MAX_NUM_PERIODS * PLAYBACK_MAX_PERIOD_SIZE)
 #define BUFFER_BYTES_MIN (PLAYBACK_MIN_NUM_PERIODS * PLAYBACK_MIN_PERIOD_SIZE)
 #define COMPR_PLAYBACK_MAX_FRAGMENT_SIZE (128 * 1024)
-- 
2.39.5

