Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF946149E00
	for <linux-sound@vger.kernel.org>; Thu, 10 Oct 2024 05:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728536698; cv=none; b=nJ7LC3cz8PQ9iL/y/tKLtNaEsSVmHdnMy0j4lIwYVWaUTFc5jvUa8cqWHb4vMp2MmUyqWUmmCSP07H4p8Iy1mBGyrwHXOaG/OeY1vg96VYqseHHQq2UcM2qDmGgZtTtyiT5kY9BC91BUAzPez1/KbrjwpLemc7SiIquuLxdHpFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728536698; c=relaxed/simple;
	bh=GfiDKfx5a1AjhcyHuiuXq8lE21gaNSy3lluDclyQ3oM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s7AQZVCxjJOATR0M1MItWBYLU/kkhrgkPJ2cyzS3A3oeHXDqAZZkkQvefLmmpPAaRVzetNUhjzfVRGRN3aYWI59o8lYlosTNbNvtNWGQwuy0rxy8Fc4nuBgeMfg9xFH5lvRYef5l7USgloly7rOW0IPqLEOlt7PDtVsaHTrIeJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YyOlj596; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YyOlj596"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43111bdd54cso789995e9.1
        for <linux-sound@vger.kernel.org>; Wed, 09 Oct 2024 22:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728536695; x=1729141495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jbc2uR+ePxfXp2ltY2VNtmdr1Yv+lwKP50Ov4eu113k=;
        b=YyOlj596fkHsTpHLguS+4+5LV6ldb2pqaCLAOavIfc4i1K0ramw/9aWO/nIs9JMw/W
         HkhAzwL6HZNLn05+gZrXBeuuoETqJG/wHbPF4hIYLF5I6JJ+t6JjoB1P4dJUDMBC1RWl
         VSgK8OvWlMZX3mjCLliDCo5SGQ3NX4BuMUehm7xlIfW3avD2uy5SE3KtMfndyYGF16Nn
         sDkV2aTcDiKGkVuLsybGq20EIELipQUneu5eML099r4ed4p8rwJV7BjuSrQsk7Ql7D5F
         PH27fZy+ZKGFF6N2aJ7DjRUa+OdhALsaS5YIxDj/4JtmfLiFD22f6TmqHSRKpYTLOGQB
         tZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728536695; x=1729141495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jbc2uR+ePxfXp2ltY2VNtmdr1Yv+lwKP50Ov4eu113k=;
        b=UP2FkRYnbgWky9H0Xf0wv/ORT9HkoIEQp8o0mwtxTNlBvx7gWn/fsfFgP3rbWcTM3v
         UNiT3aVlTpYDZQPT+G6CHcXu7xG9ZZAT5YrgMu0A9qtIHslrzcu7iwp2p0JlqFp0NK0n
         G9NqaDq/rwYT/2RUyzOE04sFLdDjMPXP7H94rFuTFkcmsptQISQN6sYfpkiFR8Nwk32q
         i8WX5L6RnC8Z9F7VONGOsskIfinFC5UT6LCsxf7/4ZKY0xeo3tO5maCWQjtpZhFfYXFE
         kUBA2X1rgc5NMLRvVbEQGMoGUoX+VImZByAkJPq12pzPi44ClmuNM2zaFr89PMi8bWVc
         JQwQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/yHYS0Yb06eZGIoAT+hVX7lA2JmNLvvP9h5dUHQNVzsicatqr5gY4cU7X4mfkzrub7rK9BFdioDoRaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyle0WraveMWYpkRRQn2ScZly1Ze1GswxCDY+oAgi5TzbYA/npK
	1zGc1QpgRW0B6zAjcvapA3OPGsbfp3W3WrcGvldNjWW4qKmP1DEsbxa6/mqdbSs=
X-Google-Smtp-Source: AGHT+IHjOO5/3OmweNS045RjhKStWrN5/D4V4RM46O2JiZ2w6pXTyi2bzfZfpCB2Jcrirhn2c062Yw==
X-Received: by 2002:a05:600c:4448:b0:430:52ec:1e2a with SMTP id 5b1f17b1804b1-430d70a6aeemr19085955e9.7.1728536695196;
        Wed, 09 Oct 2024 22:04:55 -0700 (PDT)
Received: from krzk-bin.. ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4311830612csm4526865e9.25.2024.10.09.22.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 22:04:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ASoC: qcom: sm8250: correct typo in shutdown function name
Date: Thu, 10 Oct 2024 07:04:51 +0200
Message-ID: <20241010050451.11913-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function is for sm8250, so fix the odd number in "sm2450" prefix for
soc ops shutdown callback.  No functional impact.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/qcom/sm8250.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index 19adadedc88a..91e9bba192c0 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -78,7 +78,7 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 	return qcom_snd_sdw_startup(substream);
 }
 
-static void sm2450_snd_shutdown(struct snd_pcm_substream *substream)
+static void sm8250_snd_shutdown(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
@@ -123,7 +123,7 @@ static int sm8250_snd_hw_free(struct snd_pcm_substream *substream)
 
 static const struct snd_soc_ops sm8250_be_ops = {
 	.startup = sm8250_snd_startup,
-	.shutdown = sm2450_snd_shutdown,
+	.shutdown = sm8250_snd_shutdown,
 	.hw_params = sm8250_snd_hw_params,
 	.hw_free = sm8250_snd_hw_free,
 	.prepare = sm8250_snd_prepare,
-- 
2.43.0

