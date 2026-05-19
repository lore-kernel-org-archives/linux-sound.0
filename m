Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F313A1DFFB
	for <linux-sound@vger.kernel.org>; Tue, 19 May 2026 01:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779152637; cv=none; b=ONF7pNdN8ULpx20DPkhhz/mImwiNCuy8pNEzsnmmzSGcpBOIdOxMuGaAzJvcmsnGRoiv3LD3tGhSjgp4UdWxHegtu1ffC73spCQgAKWQOdCG96qSmSwLzt1U89bLCb6yQX8LzlEcXCdi+Wc8sHgQBjSY2fZ5P3sfXyHQBtv4SOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779152637; c=relaxed/simple;
	bh=VyFdjWMRA/rwd3WGnfxqhX69a//8M/PilWiOZmRSGYs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eN/1QAhRhVUDCfGixtApLE0wjhalFdK2lqyLHLzNUOxnd5yvwqUSrYWTyS2D36d/uSzCpZ6FLxYCh7kcg9HolfgAu02xSDMb4zW3olsPGMDFQOQ79DZcyPBUFPX/mcW+p2JYJJ4y7I9r8ZSuToj8eDzUrH5i2EbteTMAlfbCzdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bn94mHd1; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bn94mHd1"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c8028fa6039so1996337a12.2
        for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 18:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779152635; x=1779757435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=foamIZYfrhpMFL5r8IvGdGAIs9H4gU/kPQLf5krYHzw=;
        b=Bn94mHd14B2CEsiVyRKP9rWyXjwsx6ml2jC+VcZvXQnwNwwYMBAIufJiCxyG2N/Wb2
         YvGJnn9ilPHYHrVq6d6Af+eDoTt+TZlv+LIM5krm9rZE6sNE/qjAq2uiStWxCnc/2op2
         58PX/mCv37AZmyFA4XtgVwZCEDaGToJck6fEcwl3ItTGIA1ePVIaLIVRkGFPvyYl+owB
         Hju1YwdYSatUP8a7m9TAv+c82lh5DvtjDKsYHi2Djig/UEWoEcqSsPO1g8zZ8VcDtPb7
         TApEG/rg/+3ra7wYHb7+cqH0AAwe2yBPIIW1aLoVDMHGVLCslsehVO4eLUi5t9rjegUi
         PNuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779152635; x=1779757435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=foamIZYfrhpMFL5r8IvGdGAIs9H4gU/kPQLf5krYHzw=;
        b=pIAiiYaHKWCLovyaExP9btT+2L7brYtARjlr2NBz5HMZqIlM3n6y088i+B8jr5TJXN
         nV2yZd7Ktp4yEdlu1wJElnoS+4bQveTakvzrtGCGHzirTE4ZWWo/fYivwAyk8p93J9CN
         aUuaEVd9ADArqNcRZ3eXIoFF1BypxBWFJvBaIQ8P5JQIZ3QW9sD2EPn+ftIIuOX9feh5
         +gY8BY/KN6p6k9ky8EcO284RQU7poPMq6pEpfJCE4J6PWplnSazoZGkOXrmcI5khBMr1
         wVy/iGJqDCEgtMmV5wrZkSe0DtEZoBdUhZRMjwt2cD7s0wHIaNasE1EaU03L6TsklloN
         bdtw==
X-Gm-Message-State: AOJu0YzhvcYWgp9uc1n1HG+zDZRzSSR549C4gayCTgz2orz87/DykAyi
	E4O4yJzqvzWWf0lHNX66FIl4WRvIxxudQEAx5jf8T2phGbcTo/RPeFiduIiQ96XN
X-Gm-Gg: Acq92OFaFfOIuo/shzSv6ZkTovAI9obtdBu4631KaKdz+f4BIZTwxfwjlj5Bp7DfMUc
	KvdLJN3Ixdx1VrkGg0TaX4IwXpB1zQL021Q/6UDvkXNY6gdfG0CnYxfQBFT+KlE8YN83ZMh5XCm
	DNEd3/ZyP2jYiWCru8jwXQImChUR8FDw2c6IH5s6pBIUSxLSKO777j671efXa5aeNTzI3O8Ex2a
	sGlJX0VXJ4n5p3hIO13OGIlHDFe4CYlxwCD+URSF8Myx6nCgnO1waPynpVDHYDjcqOcwE5880tr
	cRETG6hybHZsHgbO/0KKIBnh+Pd2vzObjx7nbYCslUX2o5HYknHkQdY9QzAvkDKdvKDkMZ2DmRF
	SqHDlBnjROb6tSsIKwMSZBdor9Ao252keDPKrsuQpLlBU8qvugp8LPHiv3UlB+CPp54VgFom7U6
	WUOu7zimkOiYYIycyGHGMP8IQv+JG83UNQYDM0CJ5Jb9EiLioCCjzOdj3PjYz7steoEgnrN1+rz
	FMTebBEY87GkW3VSio6o3Eil777M2WO1zA=
X-Received: by 2002:a05:6a21:4ed8:10b0:3b2:846d:f388 with SMTP id adf61e73a8af0-3b2846df459mr6078176637.45.1779152635326;
        Mon, 18 May 2026 18:03:55 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb121ccasm14524680a12.29.2026.05.18.18.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 18:03:54 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ASoC: uda1380: remove kmemdup_array
Date: Mon, 18 May 2026 18:03:37 -0700
Message-ID: <20260519010337.629127-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
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
 sound/soc/codecs/uda1380.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/uda1380.c b/sound/soc/codecs/uda1380.c
index 55c83d95bfba..4df2d01cd5fb 100644
--- a/sound/soc/codecs/uda1380.c
+++ b/sound/soc/codecs/uda1380.c
@@ -38,9 +38,9 @@ struct uda1380_priv {
 	unsigned int dac_clk;
 	struct work_struct work;
 	struct i2c_client *i2c;
-	u16 *reg_cache;
 	struct gpio_desc *power;
 	struct gpio_desc *reset;
+	u16 reg_cache[];
 };
 
 /*
@@ -767,11 +767,15 @@ static int uda1380_i2c_probe(struct i2c_client *i2c)
 	struct uda1380_priv *uda1380;
 	int ret;
 
-	uda1380 = devm_kzalloc(&i2c->dev, sizeof(struct uda1380_priv),
+	uda1380 = devm_kzalloc(&i2c->dev,
+			       struct_size(uda1380, reg_cache, ARRAY_SIZE(uda1380_reg)),
 			       GFP_KERNEL);
 	if (uda1380 == NULL)
 		return -ENOMEM;
 
+	memcpy(uda1380->reg_cache, uda1380_reg,
+	       ARRAY_SIZE(uda1380_reg) * sizeof(*uda1380->reg_cache));
+
 	uda1380->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(uda1380->reset))
 		return dev_err_probe(dev, PTR_ERR(uda1380->reset),
@@ -789,11 +793,6 @@ static int uda1380_i2c_probe(struct i2c_client *i2c)
 	if (device_property_match_string(dev, "dac-clk", "wspll") >= 0)
 		uda1380->dac_clk = UDA1380_DAC_CLK_WSPLL;
 
-	uda1380->reg_cache = devm_kmemdup_array(&i2c->dev, uda1380_reg, ARRAY_SIZE(uda1380_reg),
-						sizeof(uda1380_reg[0]), GFP_KERNEL);
-	if (!uda1380->reg_cache)
-		return -ENOMEM;
-
 	i2c_set_clientdata(i2c, uda1380);
 	uda1380->i2c = i2c;
 
-- 
2.54.0

