Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85202130A54
	for <linux-sound@vger.kernel.org>; Wed,  1 May 2024 17:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714585895; cv=none; b=EvbuGCJvLuhEZwBPjNm6ifSjHNClD+k0pi/D5SBAySMt7Ephv5dtNypOdOvbMMn2L8wKxbObPbLP+o5V/u61NDpPBOPm0tdiQ90AGGzKXXR3DL6dW4YTZjt+Zj7OU7VpNvH9h/kOJP2q9peeGlAsM6hlYfj8EeW5PoXYEMAwCNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714585895; c=relaxed/simple;
	bh=5ZZzMRluvzAZl1AQwx7JpyOKF1ab9xMN11ApWuUwiIc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mu4892n7XIReB0CzFZyPIGV169QTNIWvQs6k/zkJ9Mxj4eQn7J8kcPdQbF16MwIUN+y7ppHS28R1fxoB99QIlJB5CpI9IFIMeHUzvGlUZFSU2XBEmcFlCVhz8RlHYYBqFuPpLv5QordSj1y9+28Z70mTh0j0wUZ1k/KL7BmuaYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Sr6116lC; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sr6116lC"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-41b79451153so40720155e9.2
        for <linux-sound@vger.kernel.org>; Wed, 01 May 2024 10:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714585891; x=1715190691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/81fAAO7tSbrp7DiPZB/sQZzbcLbBgfoiaQER6Oz3O0=;
        b=Sr6116lC6HfZ3sLl/0Hp+NHLXx1ShBO4g8XHVg3yQHSX1Hwt2aJionHQ40Ow4edWhF
         arieNgZcC7xubuPjETu03a2uT07bkuApwI9J4PIZX0z17Jp1HPLXerIDmIu9YkiFjTxu
         7dnzmAFsmaIUQ0RRPw+ZgLeoK8xEZnMg+wP5QWqI/qPWvZ9cvdzHO7kAWZ3DftYHBfXn
         ki8QJY/XrjKRhvdy93syff8V6rCqFB89sOsNh6+tHZC9WpuMXB3MDCicuAZu6L7bh3+u
         RP0UKkBvJPCl1MUpjJbyQw11ZGVw7IK2fKb8Svv2LLCl3I0mnr3PKf9lqlbviYgcVg/L
         bk1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714585891; x=1715190691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/81fAAO7tSbrp7DiPZB/sQZzbcLbBgfoiaQER6Oz3O0=;
        b=t+nKqwnLrpMKpvW8t8ZbU6gwtJnbFigGL+UsOCjuAvc741LeYY4fAQpuEVVAe8EGOR
         u9YtBA/aT+VA3HFk01Mwxab3In3/h1GmS/nyNsopXaXa5TSK0N0bK6XfmeAlWEpHz3U/
         Tu1exH8ISncaSnorySn4BxkOnfw7DOzNzJUAx3IJoS0TP6/4LJ2HHRd/7StPETGA8Wss
         hhnN2Ww3WBR8ONAdLth+spHe0JZA4r3QUgX0rKha/GjRuQCa9qXBww40IUd95ieXrJ7g
         4kd2z9Ex03wADaOKoa2h/zopu1u9tS2Ngk509YI+hQNJLKJfTqYEEUAIBInyAsXYc3xP
         nhdA==
X-Forwarded-Encrypted: i=1; AJvYcCU9/lWJUIfKnbzUNrf8ETZtAUrvpEBGj6sWXGlCAOpGUvJlpgFy8yjM2pTNFGuKRrSurdbD4TNCGGFxzi+TtH72zrhW2uEdieJW6Gk=
X-Gm-Message-State: AOJu0YxafCoFlzlcsuZbI/gC9O51Y2v+gTArikJzCSivTjcR480GA513
	fztQ4xPhqi0sjWnWv5zRxyOOdF8499iKyYIDqb6hU70W00dpWrxBwkxtL9sEEAc=
X-Google-Smtp-Source: AGHT+IHquCsYoJyPtIrulLcrRjwsfC6PKDaFYdv7tt3IIa5cijvcc2rCziprUOjBPfKg/753a8zo0Q==
X-Received: by 2002:a05:600c:3d8b:b0:41c:8123:f8a5 with SMTP id bi11-20020a05600c3d8b00b0041c8123f8a5mr1980232wmb.23.1714585890722;
        Wed, 01 May 2024 10:51:30 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id x35-20020a05600c18a300b0041b61504565sm2845605wmp.28.2024.05.01.10.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 10:51:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2] ASoC: Use inline function for type safety in snd_soc_substream_to_rtd()
Date: Wed,  1 May 2024 19:51:27 +0200
Message-ID: <20240501175127.34301-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A common pattern in sound drivers is getting 'struct snd_soc_pcm_runtime'
from 'struct snd_pcm_substream' opaque pointer private_data field with
snd_soc_substream_to_rtd().  However 'private_data' appears in several
other structures as well, including 'struct snd_compr_stream'.  The
field might not hold the same type for every structure, although seems
the case at least for 'struct snd_compr_stream', so code can easily make
a mistake by using macro for wrong structure passed as argument.

Switch from macro to inline function, so such mistake will be build-time
detectable.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Do not open-code underlying macro snd_pcm_substream_chip()
---
 include/sound/soc.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 2a1b6c198547..ab2dd1590db0 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1215,8 +1215,12 @@ struct snd_soc_pcm_runtime {
 /* see soc_new_pcm_runtime()  */
 #define snd_soc_rtd_to_cpu(rtd, n)   (rtd)->dais[n]
 #define snd_soc_rtd_to_codec(rtd, n) (rtd)->dais[n + (rtd)->dai_link->num_cpus]
-#define snd_soc_substream_to_rtd(substream) \
-	(struct snd_soc_pcm_runtime *)snd_pcm_substream_chip(substream)
+
+static inline struct snd_soc_pcm_runtime *
+snd_soc_substream_to_rtd(const struct snd_pcm_substream *substream)
+{
+	return snd_pcm_substream_chip(substream);
+}
 
 #define for_each_rtd_components(rtd, i, component)			\
 	for ((i) = 0, component = NULL;					\
-- 
2.43.0

