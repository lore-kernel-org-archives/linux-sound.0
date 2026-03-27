Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A756435B642
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 03:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774580893; cv=none; b=RkJpM12aIQUTS7AbXei7rqNBu9qo2wiTBdPukOViIZFuQ91B8+rtjh7w91WaenhnCUfpigFMFDt9dBxMEa9EJa+c+lzxYI7I4dKaSzyOQcHYeHSNkBhoLVXzFMy/2Afi5M6HA7pDlQXZN1sumhvr6/8u6fIRKpOvP7PLe10N8Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774580893; c=relaxed/simple;
	bh=UY39v+uccVOXjUrPjagUwUmslnITip4hb9Gf6olFOSA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KnF/13ydPcITIXqvSnorsxgTl/wkSCsenfXmkjf22XoAlq251gEWrmzahj8xD3oLCHDmhpLW6WcRWWyWooogkunaQ0VxVFcVN200T4hYIGOCI4T4p19a4qupCSi6iKLU/1ixuuV5I2NaPu8Kd1NsdfRnYGQ2b3MA42ISmb162KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VgbbDJB+; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VgbbDJB+"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2b04e6a989eso10333885ad.3
        for <linux-sound@vger.kernel.org>; Thu, 26 Mar 2026 20:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774580890; x=1775185690; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u9sHiGdzn2qDzhDupTpjKDt4PFnLpOq2bLUHxlcYLRg=;
        b=VgbbDJB+EqX4jDjaLUYnLqQ6C0YtCmudCxa10jiH9zRiTJ9UJegpaml0f3l9EpQTBN
         QWbB5iu9VELeW/ejwO/E3P/8WNOCcXQO77mmvCwk6H/RlJXZojD6KbyjveJbJDFlHmyd
         8gPOjW2eFQARQx8Sg3eVnu0R8jDDfCP++DVmym8F1bvxjGN2ag7eu1Px8lO7eh1trIwI
         OHeHjo89vdG/26a+jZAbUnlQiExtDj+jVjn9MO1KM1q5MvzktAt6oh/TGaTQVV7c53Wh
         PO3UYMPLTXZ1FkucsNOuAIfIGGaNl96tB17wPoh1qamT8dhTY3bAUutivLBv4ei46esn
         uYyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774580890; x=1775185690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u9sHiGdzn2qDzhDupTpjKDt4PFnLpOq2bLUHxlcYLRg=;
        b=MNlpID7cmlH4+ZI2tX9hg5ezLvTxARSkXlRfUAjvnnAeusL4oAryryXB+kj8G1qIyI
         dP1FAiSPbmvkW7APjHtZnakdDJKiW6iLy4gLAnhZy3w9jhdvoqVv9JrZLrQsvYXtV2w2
         tXver8+RKG3dbSTMlL4GK7ZxycE7H4R2/qJj9+Kyju215xdiXWROxsYFqIT+Puloubsj
         +sEvXstO8dor+YSodLXs029EHvxIH/A2g17F6z8mkYnbvlwm6LQFwXkqBYiUbvZZZlhU
         DMYOiIHokGiFC7k3TxH8PUMGn8bwQG4n8iF8qJ8jCWriK/2+hO4r9oP+W1HYnTrcINoX
         1JQA==
X-Gm-Message-State: AOJu0Yyaqq08rWmX11xEeHz6tns4aWZ5SKwe0MnXyYsJqVAFtKyKwoJB
	F8FFdTHk9MnGCEyhZqQbG2pxGwNFiVdeNiewHXYengP+ympwDkZHJClhyhN9lMXH
X-Gm-Gg: ATEYQzwueLLgQnVhlIyRSPQp1EZKpgKz/l6taZnOzdlPaZYGvic5vSo/44GGE2nD7S7
	yg0WmJqP117K4x/BGFVieWsG3egkjkRXQqkGMul/V9CBLQ88MbOgHxqf+9wvpuy4prr+OcLqBbp
	JKI0y0ZFdxWrKO1ltO52tD2GjoQrdfs9/jC2h9v2p/1gTW6MsxFueXabqWgnsQMgR38M94pDzFr
	QnClTrhgB+QCV1k370rP87mmvrSQFf0A2TJvmyL2TQ1otPdtigeoOWClm+46Qj1GxPDK/xLKwNq
	of2YL3XlNgv6fQgCW/87bU/14274Zf8JsDs52SV6w7n1p4iEkj6cRhSahyzgNscL9MJfZmDWJbU
	OyPOnFU0XpO1Fg4fWQ5wHAD6t5ehe+azSMTNnKQg0wdaob39bHXdN5UOIFfOQ1ntnglikDkBxBR
	dYDhHsKJDT1lzFchohMCC3qs+hXPwu6GnAFKQMIQHg4T9EAQSLWQ1KE+OstJTAtHGwlg==
X-Received: by 2002:a17:902:f693:b0:2b0:4aeb:dedc with SMTP id d9443c01a7336-2b0cdcdb783mr10126455ad.26.1774580890071;
        Thu, 26 Mar 2026 20:08:10 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc7a17c5sm52158665ad.26.2026.03.26.20.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 20:08:09 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ASoC: uda1380: simplify allocation
Date: Thu, 26 Mar 2026 20:07:52 -0700
Message-ID: <20260327030752.9048-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a flexible array member to combine allocations.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/soc/codecs/uda1380.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/uda1380.c b/sound/soc/codecs/uda1380.c
index 63c3ea878fcf..7ee9172c81c4 100644
--- a/sound/soc/codecs/uda1380.c
+++ b/sound/soc/codecs/uda1380.c
@@ -35,7 +35,7 @@ struct uda1380_priv {
 	unsigned int dac_clk;
 	struct work_struct work;
 	struct i2c_client *i2c;
-	u16 *reg_cache;
+	u16 reg_cache[];
 };
 
 /*
@@ -767,11 +767,14 @@ static int uda1380_i2c_probe(struct i2c_client *i2c)
 	if (!pdata)
 		return -EINVAL;
 
-	uda1380 = devm_kzalloc(&i2c->dev, sizeof(struct uda1380_priv),
+	uda1380 = devm_kzalloc(&i2c->dev, struct_size(uda1380, reg_cache, ARRAY_SIZE(uda1380_reg)),
 			       GFP_KERNEL);
 	if (uda1380 == NULL)
 		return -ENOMEM;
 
+	memcpy(uda1380->reg_cache, uda1380_reg,
+	       ARRAY_SIZE(uda1380_reg) * sizeof(*uda1380->reg_cache));
+
 	if (gpio_is_valid(pdata->gpio_reset)) {
 		ret = devm_gpio_request_one(&i2c->dev, pdata->gpio_reset,
 			GPIOF_OUT_INIT_LOW, "uda1380 reset");
@@ -786,11 +789,6 @@ static int uda1380_i2c_probe(struct i2c_client *i2c)
 			return ret;
 	}
 
-	uda1380->reg_cache = devm_kmemdup_array(&i2c->dev, uda1380_reg, ARRAY_SIZE(uda1380_reg),
-						sizeof(uda1380_reg[0]), GFP_KERNEL);
-	if (!uda1380->reg_cache)
-		return -ENOMEM;
-
 	i2c_set_clientdata(i2c, uda1380);
 	uda1380->i2c = i2c;
 
-- 
2.53.0

