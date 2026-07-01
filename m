Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC573CB2CF
	for <linux-sound@vger.kernel.org>; Wed,  1 Jul 2026 08:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782893135; cv=none; b=uQwXdf3kCZzwufDXYU4+P6QpINbnXnqqL3Ib5omcddkkTZCBJQsh10Cb6m5d7phpBF4HPYJkvkuoI5SiQ2maGwIdKh3U+24Jp7+nHxzEG+9RwbGDVuc7pWsEt/3ONGUy5PxugMj1mPeQeTn3WvpkOBWjLI9UZqTiC2ELmRtJQDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782893135; c=relaxed/simple;
	bh=yb0MFHFxJuuQ5y1vAfOyStDO6ECSivCDb0ZRWwvICp8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ChQ45cCcxcrWP3rDMJ/ZUf8fGRebHahwDLNT/fHUW8RClH7ZFCAFK38sKwpKGqlxu6dO/l1fq60UWIKMn8IU/O2yvrqFQAdbLqEtnjws3jcmwegUY8kJ4ahDTsABTpKFJwggIgFLlWiA94WoWSvJ3Q70sijucA0dz6W6cqmhFtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SdH8xgSL; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SdH8xgSL"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-847917c3678so603129b3a.1
        for <linux-sound@vger.kernel.org>; Wed, 01 Jul 2026 01:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782893132; x=1783497932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YZgET5sP7s4+Gl/MNxq10s0JbKQ5og9R+YfjQjFjLIs=;
        b=SdH8xgSLOZjCjrCFVYWr1Xyqgbb4PbU7CVUjTNSmNPqlG0dm9OqbZh5VXdnLFkjQJa
         WAnjatAFq0yn1lagmfsv2M+zII2RNe253UGwtPZQ/A6j+TOcmmzqI4GohxIr9zfHKrbi
         qwYvEagTY3TdMfR7/BgbyWsmcnsjfkK0O922In1Jfy50J2pmcUVL9VWGFzlDsgAQtv+z
         muzI90/D66SYDmkmZfl9qoeG9qlXFpF2u6f48XcUZ9z+yeUNgHZyb8clf9cR/uBJlQ9B
         aIpRTwWaN+/y8dgUnxiPE/jOb7bvrr1kd8afuoBPpJc918k50+DPtp+Zk6M7BeoVFpyh
         7EUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782893132; x=1783497932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YZgET5sP7s4+Gl/MNxq10s0JbKQ5og9R+YfjQjFjLIs=;
        b=UmaLxEuuz2ZEVoPBPftfNTEF/R2yt3E4aaiPaKvrn9LilzyVcFBVDiKKivbKYfnd9u
         xNZBV6QM8EvJf3j1cNg8Bq8F5DgO+Y4hZYWUoz2JpDj4e0Rs6fX8V7H5fHqNUuJwYWOT
         IJIGcwCnN/2ybMopYTbYyRpwQ1XcYKeMmSr4bo5BlVDGt5945Ds8U5Z2rZtfmimk3sEh
         V+tJaHCPC9JoSVReCrMXdL16uPsY13DuKduqqCp3xbH5SP4/32e+rob0FW83kZWhzN0g
         ezrfibE4D7Gwp6nDdD4FQ4/58hFCfwD6LaK6Ob5YeN0qfBmT60BWnfeIgCRF/ZaA1cqB
         s8Lw==
X-Forwarded-Encrypted: i=1; AFNElJ85bF4C0RCd7fSkbBYIKs2zaty+zmmoxNSOw4X4S/KCFQuM4jjGdqmFjbSwfLMup1SmgXX9yWNadbIX6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzluHvai0A1Gae5aAknAjbFQJbKU3gY3Dtor8ZZPxmUFhUt7jah
	SPVQm+gQ5bFy9+v8MIWxn3VNaFdYV/7rJ4P4T5H77pI8GP83twB1kG8D
X-Gm-Gg: AfdE7cnLJTs7VoYR/+wYYe+YKqDJmnmBaQ5oTqbRVJBT3xE4V9UVJpCnTm9V3IAqofG
	tfNahKT0cXb605JtGGUpzH/vy9/JyldKMaL4+PxIxqgpgPlnCsxma15/vbzN4v6tPFQzaHPjtns
	cQfBQupYx0BZGVIGLqRYYgCifts3FbpJtBLCTCvmsiJfwU0PpZOitbN0Ukp1WE32NH7B85plcGp
	VRVcl5NnJdirU5XtU0Ck+SCqMeSDBHhauV46S5W+zRiq4bYEb0eKpe3TSKIbdOKU6tkUKzUvPzY
	7vIGih2isTt9taRV0yENIkUF7zaqGvGoAv/S/78YnbFZgoM53cjpZvNkta8gyxqFt8/CyAxC552
	FQRBCowd6wGho8l5SsqW/WlD0czF2RVzIf6ZtfJmsqCahjJP3ROqC6aTrkArkqZ4XAXPROlQGXV
	4uQhqOAVMvmJ+GfklQfeJutkp17AG1mJEvoBpmmiRt7LVhvT0=
X-Received: by 2002:aa7:8893:0:b0:845:e6d0:62c0 with SMTP id d2e1a72fcca58-847bf941e22mr555545b3a.18.1782893132031;
        Wed, 01 Jul 2026 01:05:32 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd382sm3566656b3a.35.2026.07.01.01.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 01:05:31 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ASoC: samsung: spdif: Preserve the original clock acquisition error
Date: Wed,  1 Jul 2026 15:05:17 +0700
Message-ID: <20260701080517.298294-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

devm_clk_get() may return different error codes, including -EPROBE_DEFER.
The current code overwrites the original error with -ENOENT, preventing
deferred probing from working correctly.
Replace dev_err() with dev_err_probe() so the original error code is
preserved and propagated to the caller.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/samsung/spdif.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/samsung/spdif.c b/sound/soc/samsung/spdif.c
index 7fc46d55c522..53eaabaf8956 100644
--- a/sound/soc/samsung/spdif.c
+++ b/sound/soc/samsung/spdif.c
@@ -380,8 +380,8 @@ static int spdif_probe(struct platform_device *pdev)
 
 	spdif->pclk = devm_clk_get(&pdev->dev, "spdif");
 	if (IS_ERR(spdif->pclk)) {
-		dev_err(&pdev->dev, "failed to get peri-clock\n");
-		ret = -ENOENT;
+		ret = dev_err_probe(&pdev->dev, PTR_ERR(spdif->pclk),
+				    "failed to get peri-clock\n");
 		goto err0;
 	}
 	ret = clk_prepare_enable(spdif->pclk);
@@ -390,8 +390,8 @@ static int spdif_probe(struct platform_device *pdev)
 
 	spdif->sclk = devm_clk_get(&pdev->dev, "sclk_spdif");
 	if (IS_ERR(spdif->sclk)) {
-		dev_err(&pdev->dev, "failed to get internal source clock\n");
-		ret = -ENOENT;
+		ret = dev_err_probe(&pdev->dev, PTR_ERR(spdif->sclk),
+				    "failed to get internal source clock\n");
 		goto err1;
 	}
 	ret = clk_prepare_enable(spdif->sclk);
-- 
2.43.0

