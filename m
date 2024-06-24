Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CCD13A876
	for <linux-sound@vger.kernel.org>; Mon, 24 Jun 2024 13:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719235061; cv=none; b=PLd4qERltHPlRkiuKF3ODWDgIjysW0VtWbWTetE/x3rAEknS8qAzZI3uqkG9pX9e+TS3Q8dciEphMabMCEZV1Utqo++XLlQSgaSq1OXW9AFyh9zlLhN+SuMhqBwRdhvOYG2tk5nRluSAzRyw1PG3Z/ATeLa5/Vh20hjVKr9qe58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719235061; c=relaxed/simple;
	bh=zBAbVg7eY5v3w1YQ9z/X5gWtjjykDycleuAsmUw5MbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nSUibP4cRTSs1s1SV/OaBVxuhOPeMpAmhjvDG31ZmzMkMuQH7/9mXhWSop1N1Q53GaKswtxEhL8UIyoSeI7WLeIvErOpYnaoHPwZq1r0/hdMA/SMzgbwrARjRgl7HpZZ3uo4rojMl6Iujd/WIuY8Je7nE5hf7ZPqxnMAuFgVWQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=lLN0SCFo; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="lLN0SCFo"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42172ab4b60so35902925e9.0
        for <linux-sound@vger.kernel.org>; Mon, 24 Jun 2024 06:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719235056; x=1719839856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uf6/MqxTn+2Qt/l7h8bfPK5FWFTkO7Ox6K1eiKN7/3o=;
        b=lLN0SCForyoIPbm51ql/tXs4jnUNcPTYwmnvdbHQTqAjNfdVrTQ3RHs+bi90DFheEa
         FdCHk/IqVNGCfWlK5RKbozbRa5MFcSttABE/rdNXgMsGoZYis+EDcZTPvUUDk5owXk8s
         mxJteozuc3y85bB8a60wXN9rRQt5O/dduaByP7Qk+TGSvFapJQNYfWW3cIK7Z7lGnjY6
         2SEB/RNNr84Ru7f3urWgJagG89yFccWyQUM9QsRZhQIGo9AWeIUg3KwmJezTUd8QiYOl
         iiGajSq7scKgiAi1+kmdzcE9Id08fOZ44e25JkJufl5QhUFrWe6ibwzybQfbWYbc/GAo
         vHLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719235056; x=1719839856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uf6/MqxTn+2Qt/l7h8bfPK5FWFTkO7Ox6K1eiKN7/3o=;
        b=nRIe2fNu7JQmlFFl3NJCuTZY8D3eyU22bXcIau08utxlmu4BApN0kX1g3Zs4t0UZTf
         GzigU23B1f0yJKZa2QZyP++Dzds7wy3Y9qQ/X7SkogY7S384zdue5Zoz3MxNPOPAdH+A
         SyJuGkRGxY7Q+nT83RI1FcofLxZO8xoTUlRkfevjG8ulPWRsQJtd6vfHv9nXPz7v1cHm
         ancl7GdXU04Sn4f8syFatce8Ma4aBLn02ePYHLUrZ6NM3pCD1fhIwEpqMtxpz3evSTzQ
         U4aPs8x8KgZYwjOecwqXiKO10KSVPyxYW6YKXs4jWnSiK7zpNscjzn7TsGXnZKWhFm1U
         IIOg==
X-Forwarded-Encrypted: i=1; AJvYcCVLu+zUZnPeYfZjUfh516lNt6Y1m522fdBKbPc8STt/tYyOt/HJUhlfbbMkaptmF7dPvQMe39AiRSGMO0vz6zc8s5jD8VTy8vou07I=
X-Gm-Message-State: AOJu0Yz1S/t+3YGjegY3HccaLfE7aq630ujYjJ3gLkhv7cqgTDFKkrZu
	B5wmVU2xdZ24zfCf3bqlifZi56lEaQCIPvG4Xte4j9mM5juooYvhpFQcDZQLUgM=
X-Google-Smtp-Source: AGHT+IGmuNonSBd4K5OMu+znO4FDc1Iz5xX1rsU7FDahhX9zP13Nb+uZ9kGoGdX8EBDOPFFs1VU4XA==
X-Received: by 2002:a05:600c:2d55:b0:421:f68f:a144 with SMTP id 5b1f17b1804b1-4248cc66c9bmr31937595e9.36.1719235056480;
        Mon, 24 Jun 2024 06:17:36 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:5d40:c7b4:b6ef:a1b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424817b53f2sm140173725e9.25.2024.06.24.06.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 06:17:36 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Oder Chiou <oder_chiou@realtek.com>,
	linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: codecs: Drop explicit initialization of struct i2c_device_id::driver_data to 0
Date: Mon, 24 Jun 2024 15:17:27 +0200
Message-ID: <20240624131728.1244053-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3713; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=zBAbVg7eY5v3w1YQ9z/X5gWtjjykDycleuAsmUw5MbQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmeXHo4Db+ROG3fOAriQz6O3XjKVLpfnHtkTmaA YIMupulZSyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZnlx6AAKCRCPgPtYfRL+ TkJFB/9aUNTZoZg0Om6imheGwQqsU6RAXSSNuZHpwQwgLSCT8HBbE6/IoZp7kXAQtsVP9vSGBM3 zdjLZXMx793Zr/55AbCiayz/Zet2kl8foMGKSZh6ilYGYOHeSCYNQusUaGc5d4hAvgDXnKRm/+K OLCCsy9UFuudZ+cOnzAejttXXBVSpQ/77VtC0bq1/29sjvHwJKZ4UnuMqdGxYvP9dffScuU+/H0 Ki4w/2M2a4+WSsmrLA1u9+AKUrWoBDgEl+hcdRwdho3ZKtnIYIaUkojKk0dpBKdak+SFCs452zV e7Vp5JId06irENNWJnikN7JnYl20o7yzvrTABo+AlgfFJAbZ
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

These drivers don't use the driver_data member of struct i2c_device_id,
so don't explicitly initialize this member.

This prepares putting driver_data in an anonymous union which requires
either no initialization or named designators. But it's also a nice
cleanup on its own.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

I already send a similar patch for drivers below sound/soc/codecs that
became commit ba2a2c378ada ("ASoC: codecs: Drop explicit initialization
of struct i2c_device_id::driver_data to 0"). The drivers touched here
are all new since then.

Best regards
Uwe

 sound/soc/codecs/aw87390.c         | 2 +-
 sound/soc/codecs/aw88261.c         | 2 +-
 sound/soc/codecs/aw88395/aw88395.c | 2 +-
 sound/soc/codecs/aw88399.c         | 2 +-
 sound/soc/codecs/es8311.c          | 5 ++++-
 sound/soc/codecs/rt1318.c          | 2 +-
 6 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/aw87390.c b/sound/soc/codecs/aw87390.c
index 79521ff44001..110009616966 100644
--- a/sound/soc/codecs/aw87390.c
+++ b/sound/soc/codecs/aw87390.c
@@ -445,7 +445,7 @@ static int aw87390_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id aw87390_i2c_id[] = {
-	{ AW87390_I2C_NAME, 0 },
+	{ AW87390_I2C_NAME },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, aw87390_i2c_id);
diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index a78ceedd0334..fb99871578c5 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -1266,7 +1266,7 @@ static int aw88261_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id aw88261_i2c_id[] = {
-	{ AW88261_I2C_NAME, 0 },
+	{ AW88261_I2C_NAME },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, aw88261_i2c_id);
diff --git a/sound/soc/codecs/aw88395/aw88395.c b/sound/soc/codecs/aw88395/aw88395.c
index be6ebcb51cca..aea44a199b98 100644
--- a/sound/soc/codecs/aw88395/aw88395.c
+++ b/sound/soc/codecs/aw88395/aw88395.c
@@ -560,7 +560,7 @@ static int aw88395_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id aw88395_i2c_id[] = {
-	{ AW88395_I2C_NAME, 0 },
+	{ AW88395_I2C_NAME },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, aw88395_i2c_id);
diff --git a/sound/soc/codecs/aw88399.c b/sound/soc/codecs/aw88399.c
index 5d8481612eab..8dc2b8aa6832 100644
--- a/sound/soc/codecs/aw88399.c
+++ b/sound/soc/codecs/aw88399.c
@@ -1892,7 +1892,7 @@ static int aw88399_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id aw88399_i2c_id[] = {
-	{ AW88399_I2C_NAME, 0 },
+	{ AW88399_I2C_NAME },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, aw88399_i2c_id);
diff --git a/sound/soc/codecs/es8311.c b/sound/soc/codecs/es8311.c
index b2ee2d04b0e4..f557e33c26ad 100644
--- a/sound/soc/codecs/es8311.c
+++ b/sound/soc/codecs/es8311.c
@@ -943,7 +943,10 @@ static int es8311_i2c_probe(struct i2c_client *i2c_client)
 					       &es8311_dai, 1);
 }
 
-static const struct i2c_device_id es8311_id[] = { { "es8311", 0 }, {} };
+static const struct i2c_device_id es8311_id[] = {
+	{ "es8311" },
+	{ }
+};
 MODULE_DEVICE_TABLE(i2c, es8311_id);
 
 static const struct of_device_id es8311_of_match[] = {
diff --git a/sound/soc/codecs/rt1318.c b/sound/soc/codecs/rt1318.c
index 4e47db4fc7fb..83b29b441be9 100644
--- a/sound/soc/codecs/rt1318.c
+++ b/sound/soc/codecs/rt1318.c
@@ -1141,7 +1141,7 @@ static const struct regmap_config rt1318_regmap = {
 };
 
 static const struct i2c_device_id rt1318_i2c_id[] = {
-	{ "rt1318", 0 },
+	{ "rt1318" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rt1318_i2c_id);

base-commit: f76698bd9a8ca01d3581236082d786e9a6b72bb7
-- 
2.43.0

