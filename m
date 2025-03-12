Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF1623644F
	for <linux-sound@vger.kernel.org>; Wed, 12 Mar 2025 10:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741773751; cv=none; b=IVaf/aTbNaVlZNo2CAD24gDECHdo8nhifPk+jz3aDcpOBH6Wz2InfrOwsclKVxpjjaVwlw7p9txHzDanUZiUHhJkoaj3VQxwj2NERDSYYO1UQA/ABL/3pDvaPY/7awBBfbw1+9XeMVoBLlog9drG9CzDDdal9JngjmpQIn/S7Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741773751; c=relaxed/simple;
	bh=9JfnF4zSAiji/1VFd6NQeyhvWHX/ycOL77E61Wfb6AY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ByKuTN44JkIE82bTY3W0BRMNFuUYv+wmdfCxq+EOFdExG3IoAbnSiFMDTIpDqlwj3PQQj0Rxiq/b+SO5hdhKT0QqnTeydr99OnXB4d+s7rFkECalCfwZXlAMoEU34VX0/xHsrNstRzNl5/3Nrc6Z2AORHRqLAX2n07DZIrFoK+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uNrVwQGp; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uNrVwQGp"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30bfc8faef9so43312981fa.1
        for <linux-sound@vger.kernel.org>; Wed, 12 Mar 2025 03:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741773748; x=1742378548; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ruY92NAVkm2iiW5TLeQGAEuGd7NZ84S1ymroSkK7ZYY=;
        b=uNrVwQGpEOmIdc8s6TXOVJ4xtTkZmeVX2By4i5/ks3/KLF9F66I1fg3ZuQg9oQt8U7
         7Vd0qz0vlPFAILG0Q6D1Z4Wae1Sr8NQPoyJbC6zsigU4yZSpI9GXDgd73F2jt/acSTIx
         gkEvENvge+l4r2jmkjA5hhIZdifxY17hipjacN5esz9jHGILsBJoJT0Xm9Ct3lYHUnZz
         x0m0f4sqBfvu4C3qGyCr/azoWHh5gcdP5KqNfyINHVW1IYeGv+mMvAZGScg0e7e6CyZG
         0LgRPWcRFTAeq9Tld64k1Dcytciu0OiAnXlyMA6F253HmjmaU7THCf2VWEhj6zD91+CD
         06eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741773748; x=1742378548;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ruY92NAVkm2iiW5TLeQGAEuGd7NZ84S1ymroSkK7ZYY=;
        b=TQjvIhtai/jgaYPWgSTIm+c4B6D5h9ycvR5ei06iRRcGKgWsPFakMShKja3XLYQqnG
         GD8kd0DwYHz4DebVzFczrRQfS0xx2S+lTsJNcNKFxTtT8d+QtnVMQ0yFmPoC28+yCJnx
         J0Df435HkEuzfZlE7jnwErjWheHgtTOXMKTZ0QsE66bBJOwZbWK8aDtBjofZWr4qsF4n
         FKPS9o/H1DcHLKvNH1y5RnoWGrxyBmDQ6bVObxZYEYMHN2tsp2T3QwlBJswb2ATUFRe5
         vOF+CC2yzvskNBaH07fmgpWu2GbswFBCZga/JmG2PtZQycNV4KaEdGhEqyY3/AmEURpb
         i+Vg==
X-Gm-Message-State: AOJu0Yw4YC0xhb7Eh7a9Kucc5IEwyfVpa4TaR9M9BEjpK4n07fmv2vcK
	TmTE5sQpYdGUPZX53+ScKUwxarscuiOL/TOanDnkW6zOaXYvx5r00z3NeCQJp+I=
X-Gm-Gg: ASbGncvBuXqpfqhVU2r/uXfpF3ot+eEsKZ/mEHHcLTlzCR7uFQ7lz6fVtPhRvUlcorf
	vh+bTVg1FN069jfoLLCv4pkT4qCopXj35+qY2MmnYI1LUdChvPFQvcDjre58IDMx+2KWvbuW04E
	9bWpuMee2TI2OsJGLoZFBlBrLtuE2oxidUTXngYC+cHB+3ZenSzZZpoaNXXFLugXdx0j2Gtka4K
	ZQQdPnTJarHzaBNYGLXGvfJCKRYqH9QakX08ctULuRu91YyWzOlbRxdt9dMln4nR1+YHW7q9bf4
	z+sCz+UotcSfO8B7NdIHiDL12Nd4VfUTPEiELfDaHXDh5PIKcam3qzQ=
X-Google-Smtp-Source: AGHT+IFJmEuqOwRtRbck+NFBCOFqG+Vza5RfvWsSDVTWLT3kW4knD8pf/ODrW2LW5rdTenX0BYie2g==
X-Received: by 2002:a05:651c:49d:b0:308:f787:5c48 with SMTP id 38308e7fff4ca-30bf4613b96mr58201911fa.33.1741773747891;
        Wed, 12 Mar 2025 03:02:27 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bf6a4bb84sm19487371fa.29.2025.03.12.03.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 03:02:27 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Mar 2025 11:02:25 +0100
Subject: [PATCH] ASoC: samsung: speyside: Free gpiod table
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-cleanup-table-v1-1-1d9a14464482@linaro.org>
X-B4-Tracking: v=1; b=H4sIALBb0WcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDY0Mj3eSc1MS80gLdksSknFTd5FQLMwPzNKMkw9Q0JaCegqLUtMwKsHn
 RsbW1AH1g8vdfAAAA
X-Change-ID: 20250312-cleanup-table-ce8607f2b1ef
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

We create a gpio descriptor table but it needs to be free:ed
when the module is removed. Add a devm_ action to do the job.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Fixes: da9146c19b17 ("ASoC: samsung: speyside: Convert to GPIO descriptor")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/samsung/speyside.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/samsung/speyside.c b/sound/soc/samsung/speyside.c
index f781e2be2fd496924045597b750ab7f2249d8977..9262e56265842e7f8e5b5a740115cb5fbb0c537a 100644
--- a/sound/soc/samsung/speyside.c
+++ b/sound/soc/samsung/speyside.c
@@ -347,6 +347,11 @@ static struct gpiod_lookup_table wm8996_gpiod_table = {
 	},
 };
 
+static void speyside_gpiod_table_action(void *data)
+{
+	gpiod_remove_lookup_table(&wm8996_gpiod_table);
+}
+
 static int speyside_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = &speyside;
@@ -355,6 +360,11 @@ static int speyside_probe(struct platform_device *pdev)
 	card->dev = &pdev->dev;
 
 	gpiod_add_lookup_table(&wm8996_gpiod_table);
+	ret = devm_add_action_or_reset(&pdev->dev, speyside_gpiod_table_action,
+				       NULL);
+	if (ret)
+		return ret;
+
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret)
 		dev_err_probe(&pdev->dev, ret, "snd_soc_register_card() failed\n");

---
base-commit: eea255893718268e1ab852fb52f70c613d109b99
change-id: 20250312-cleanup-table-ce8607f2b1ef

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

