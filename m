Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084476;
	b=5DtvAyZOx9lQU3L4OvAN6H966mrDlMhXBbE24eYtACNTYfqMOF15W4YXHo5ryC/tKLk/
	 LKTyQInpKR7wJptfitjdSvIKpWrMnWXHyzbRLj7/2emdNc3WTsb30oKZom9u5HKX0I7ox
	 yaNXNPnjtOqzgQ+4vUu/H6YdyD0kHqfx6YSc8sEsHEoNAIaTcuB4CSmlljhomDJm4xc/B
	 sYrAfKE/r5ycREZUEQu091ri7bMu8bxPEvbBGqZ2t3JMmkBB6lDzDCapNyUEhqeHloO1f
	 HvGNdEVQKQsqGLPf3NLz7ZstHCq/b0LF1K4MWQ6sWvqpfL5Y04hnKLJJsL6ZONkXYUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084476;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MwBH+eIxP99lWtxI1I1+C/1djt449J2HrlK8pIk4vKY=;
	b=VRxosU+1vJX2aOZ0DEe2uuEgwVuWyxBevGKuW1BQvuQ8gkfP5brLLEqPdBm9+UbpHxyv
	 Nl/htsHm/yXhKlvg4XV64ObNh8VPjCRqYdJGqg1sumXAWCDBggN9vvxgFyIUsDqO+keHl
	 O53hPl5hchQdOzxYmHYO43k+kWHqX2nmOiFkpUsSPSYER66aPpUTJPFLwsLigF/+tjAdL
	 tbmcK/KnABcVfh6IIt9pspXkis/nqqHP4I9Lj7rxJFybMgHfuGuYmlP0rD3ePnlEcz/ok
	 3kvdzrCfTehSgsXyUi43CTIxGcJT0U/Zu+Ll0wOZ3tp1Y7+oTClTk9vN1Qz+qpc2j4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TkE9GyLt;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0132E606A330
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 10:34:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0132E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TkE9GyLt
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e98798cbddso10023005ad.0
        for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 02:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795084475; x=1795689275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MwBH+eIxP99lWtxI1I1+C/1djt449J2HrlK8pIk4vKY=;
        b=TkE9GyLtgJ+C8SsUjgQ1bqK4um9+oagFPJyqajdckc46PJwgNI/t4Y3EiaNAK1LpnS
         2VN89k3LFlSAGegXC3+ZuxINJ9tUZ3PrUYvd3tG5jP8VWLvPFPfdY/5cCfnPUX+XmVP2
         lbFqbaBvpCbYCgNsetyVHF6ohl7G+kN7zqixJ2R5A41vdCCnQrWEpYPyEojCCsXHeyzD
         erOFvzfNEWNecFEDovBhr1xgTTEOgN8zF6KwmW++FGC9MdeARRC1HmQOJR49brRITlnA
         uGn2V7SFtuE3n+OJqZM/RWEB96ep8uGJVAgOMr1RjrxFt0Mk/2D6Efm2GjgS8ovNC5Ip
         B03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795084475; x=1795689275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MwBH+eIxP99lWtxI1I1+C/1djt449J2HrlK8pIk4vKY=;
        b=VJUEAEFMQW9TFqSbC2pWi4I1mWwosrG/6nWNcJGtYE7tzu0TSJBOlBqtHC4e7JukNQ
         UZhHpK5w9+wv6Pvh9RRo++ftuxL2jvMZjavv8DRXSnmB1mGeZHc8X11P9xObVfO7tYk4
         Dik2LqKUQLN8ohSgr2E9k+cmHutcakWKrgWNYht6mnBvH171q8xUgmWO0ghwQS+BUYZz
         xtDSsyy+4EE1wV4C9zbqtjCJ+fLkejWb3Y1+WjapmFEYuUGJCmMXf+O0SGSM/YpTYmQ0
         1qstA2lXPAvNQ+Wveh44iuTSk3OOFY/k6TcuG49cM5m1MEDBOys9dHP6xuycDlv3tMy7
         wNHA==
X-Forwarded-Encrypted: i=1; AL+hErFWBUvmW9jA7ZlTq7WG5c5SbGT7yaD0dOHOmySLTJvu6krBGS2eGFAdFDNT6YWZPGwOUkN7OFbad8fjNw==@vger.kernel.org
X-Gm-Message-State: APuU4Z99xKDLg8gBN63EbH0CFcnb5tIIFGaxPOBkUbX1TGZZzKlFQkA2
	fIo94AC4jeMDP1TDuIufEchGGoGEbKVTtInDcq6gfZ+VerwgoA4cXRnB
X-Gm-Gg: AZFdTZelKMdzm5gCVRPL33eSivHo2ZYsijYI/0rs6PKIN6sMWGG75uFYrZIglXUrdtH
	H2hxKgouGp7jAKITXHYbNn99V96aMfGyWK9BphKyBDWu8lir7bTfeRFnY3ELMO660QaOFrO+3/8
	raUJeKM8hGA8iSLAjlUlakxCMxLVe3iXy3VFqfmJsL+I/BgFKEFoMwON9CmdoYcMFs9d3zjyWii
	awJibj9JhY6mK/0/E0Aer9dNk7RJvqj4PqZvWQcdbdBCUxfCtDY+cl0VynBWUvDa80HzgcrwsWK
	5Q1jd1IYStHaRfp0au3BZDqwYWBanxJxQKC1nVj1oSaFaGBgyU/Me0Pr8+frDQs3xLl5aKm4Wor
	n1b2D/tO5l06U4A4k8Qins1/LHNnjqfntiTqZ5XYPvZJ8ri0mXCvbxViYqwdvx3Yi/14pK5OWDq
	4vWZ12+mak/dQQQeP/MrbVn89PGGfLqJUYGLL2Q/ppe++nwACLigCycV+p7t3494QN0kEQ85JyT
	+S1chSr0Cht8VClSqx7bhjkqsP1Ty1sqLC2iCsTtMph5c6aRkN/bsplEgKRuuQhXiTi0+zfdYBj
	YAEYXpYNUEGeC10pY8cEla8969xt0tVzHEGKyxVNaSAcwUdCddjJlw/ytSEr6/mwx4xYmPrPmro
	C7n9g4i1sbqXgwJn1E6R+ToCL6od6Yy5DxPQ9VuGL9Dt0dDKaBtw7TtXduj4pFwamCQ==
X-Received: by 2002:a17:902:e94f:b0:2e9:5714:608b with SMTP id d9443c01a7336-2eff74230d4mr56015135ad.34.1795084475267;
        Thu, 19 Nov 2026 02:34:35 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6116323sm28617325ad.23.2026.11.19.02.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:34:35 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/4] ASoC: atmel: mchp-spdifrx: Improve probe error handling
Date: Thu, 19 Nov 2026 17:34:10 +0700
Message-ID: <20261119103413.31729-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119103413.31729-1-phucduc.bui@gmail.com>
References: <20261119103413.31729-1-phucduc.bui@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Use dev_err_probe() when retrieving clocks to avoid logging errors
for deferred probes.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/mchp-spdifrx.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/sound/soc/atmel/mchp-spdifrx.c b/sound/soc/atmel/mchp-spdifrx.c
index 63089ac3ebdc..7d80f35576cd 100644
--- a/sound/soc/atmel/mchp-spdifrx.c
+++ b/sound/soc/atmel/mchp-spdifrx.c
@@ -1116,21 +1116,15 @@ static int mchp_spdifrx_probe(struct platform_device *pdev)
 
 	/* Get the peripheral clock */
 	dev->pclk = devm_clk_get(&pdev->dev, "pclk");
-	if (IS_ERR(dev->pclk)) {
-		err = PTR_ERR(dev->pclk);
-		dev_err(&pdev->dev, "failed to get the peripheral clock: %d\n",
-			err);
-		return err;
-	}
+	if (IS_ERR(dev->pclk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dev->pclk),
+				     "failed to get the peripheral clock\n");
 
 	/* Get the generated clock */
 	dev->gclk = devm_clk_get(&pdev->dev, "gclk");
-	if (IS_ERR(dev->gclk)) {
-		err = PTR_ERR(dev->gclk);
-		dev_err(&pdev->dev,
-			"failed to get the PMC generated clock: %d\n", err);
-		return err;
-	}
+	if (IS_ERR(dev->gclk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dev->gclk),
+				     "failed to get the PMC generated clock\n");
 
 	/*
 	 * Signal control need a valid rate on gclk. hw_params() configures
-- 
2.43.0

