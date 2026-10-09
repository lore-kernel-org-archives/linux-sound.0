Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25933330D29
	for <linux-sound@vger.kernel.org>; Fri,  9 Oct 2026 11:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791544955; cv=none; b=ILKom2TzDMmy9PE/m7WSGnh9G7hSw9j3Fe8LOpnqOnNvsLIFuA2TSpwZOFahxt1xtpqKl3K0Q3UtmrQgMw7Qp+NRQhRdpSpyuE751gAypEYbkVZ8bXV2j87U+hK7PSg38QFdQd6MdeklhIdfsXAYEwuUpNhz+NRK9BTEglB+kWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791544955; c=relaxed/simple;
	bh=Nrfy526swql1ij9G4gq9I/Gzn0+eqeTqdguk8EGDC4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tDwCE27iuOBPAQc47/TSJK5s4dgeBQi4qT6hD92RQZ4FJ/cD5+BoLTOrN6xdlhVHO0HdqJyVvwvQVa1zEJV47c+d/hTpXtSOIr6laGN6UM35DLhh77ctxuQqJpNlaCRUV9JE77YoxMeLcXo6RotCjwsTir4J9uRwrnbPIm6VK/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G+BA40Ir; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G+BA40Ir"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15ea896ddc8so5955310c88.0
        for <linux-sound@vger.kernel.org>; Fri, 09 Oct 2026 04:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791544945; x=1792149745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PkE/mtXxhD7ywmyvlYSqjpdIiOm8dtPe5CfShZ2eazQ=;
        b=G+BA40IrAZihdwBjzA1ZFDFE4NUaBbgzr8PMGEEcFj7jOpZxYLcYPkIF02mo5QAwWe
         XpfJ6vDOBzD0M6BqrJ+sDKImcsO8243B4lH2c+QfxggPUt3ELj2qPzIL4C5iHPrMvDQS
         9ZZvklRO8cl03eKydG0DATaPjlPqsJTIPib/MbkXwMq2jfNBPJQTzsWgZq365PE17VLz
         ro6p+PZYSd4pw4WN2sKFCfK6MS/TQW+23LaHfLhBBl4UXB3qBIMqDK+TyJfpe6HxK+9a
         OY4zwHxzpyLOVe7+igYAOEBaAdZWM9KO3Hm6DB610oI2YSKkNDT8qW6zWu89+o2UaZ86
         flTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791544945; x=1792149745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PkE/mtXxhD7ywmyvlYSqjpdIiOm8dtPe5CfShZ2eazQ=;
        b=i9/9GJhlBHB6MdA9OFND5TM0pqHZvU+ouWmG0DqpzdtL5lt87sk+URDJUmIkSL6TsL
         ICoXMp8HDimiJZftnf9XiElorQ4U7VCioo7QAc8oaGj9ArU28ARoiju0JWEj1Ikk+SbQ
         FTGT9ILLnQKt0ZTCmoyzMzITbfj/k2UlRj16bjnm3h7foFHU2y7yh0qb0aKNtLIuVzTe
         nTIW3ki2bw58IYqLh6U9fhKy4PVaBO+fQCgRYcg+hZNTVbUQk5N/p/t+dmYhcS04P4Qa
         19Klp3zgJcOwNQXdICBPs5CPwLJ+AIeCRlDup3V8qnh56hXhs2lXN3LkRObzw1tM+a5c
         WVtw==
X-Forwarded-Encrypted: i=1; AKwUvBzPD8Y81RYT8q3d5EB//YWROzJe067nRLZ981gJV5eAkXB+iq13AEB5jYXCt02nKXiwyunrYFwVIlhWkg==@vger.kernel.org
X-Gm-Message-State: AFuF++mJjESN10OK5cHDBbj3gMZ6Lg6Z6ZEDl1xVBT+9j2OxzLCYJdZT
	zdxIs0h7PO+J8wc7/p1yoRF1H4vuRzdvKN3GnY6iGqHw968idQ3FWwJu
X-Gm-Gg: AYBFou2iAovKwuGA7UCgps17vd00kq2OPTli7EZv0ek/ANXC1R0oMGH3F67zp2unNvC
	BB/FZz1vIHBeild8OnVCYDHlNg58UV7OY9KtDn0o9dWAwojacAhsl+9BdKLTfYwV/pHE7+Pp2px
	W0g+8FlSfeRNywVR3vcxsGKaHoZLEPRMHvteqqatIJLWwwkbogZ7atFjpSxlPgWPEcJSSVo9EFG
	ShS5XNGnmN1kKqvfZHhgyz1CHmej1Veqbz+T89wx0nj5ZNcKL3wOMPm/7WMd8SzrfqLEqz1i/jb
	oSotbbhXK0bNA9yMD/2BaQZoLiM72PkJAJNkmNg5wpJvIn6z1P98wSmfj4wHAIOTgMuY9Gelh1Y
	AZ66LU3MtX6L1fbti45PTX/7roX8vBXCcMPYxYNwBRFPF0oV1Upj24xf2apLySgIPDWAgt/FMEb
	KdEFYYAV6nobG5vpkiPOFEWxAcvYxClNV8HqJ6M3+qcOSrU/UqWHidqmYVH3vTm/7Fh0N8mtooQ
	TtSalVeGt2FjQo7EWSFijkaPT5E9yiAkaJnRn+REjCPpCzyxj3J/r99Ds4KFM1ondTUOIRhWo4F
	pgSmFrSthlx2eQ==
X-Received: by 2002:a05:7022:699a:b0:16b:1a1f:ed8a with SMTP id a92af1059eb24-16b1a1fede2mr1744976c88.39.1791544944883;
        Fri, 09 Oct 2026 04:22:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cacb5e9sm7258752eec.20.2026.10.09.04.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 04:22:24 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Oder Chiou <oder_chiou@realtek.com>,
	Bard Liao <bardliao@realtek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] ASoC: codecs: rt5645: Simplify optional GPIO error handling
Date: Fri,  9 Oct 2026 18:22:03 +0700
Message-ID: <20261009112204.33199-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

gpiod_not_found() converts -ENOENT to NULL before
devm_gpiod_get_optional() returns, so there is no need to handle
-ENOENT explicitly.

Use dev_err_probe() to simplify error reporting and handle
-EPROBE_DEFER.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/rt5645.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 7313ea71c958..ea58512a55b0 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -4032,26 +4032,16 @@ static int rt5645_i2c_probe(struct i2c_client *i2c)
 	rt5645->gpiod_hp_det = devm_gpiod_get_optional(&i2c->dev, "hp-detect",
 						       GPIOD_IN);
 
-	if (IS_ERR(rt5645->gpiod_hp_det)) {
-		dev_info(&i2c->dev, "failed to initialize gpiod\n");
-		ret = PTR_ERR(rt5645->gpiod_hp_det);
-		/*
-		 * Continue if optional gpiod is missing, bail for all other
-		 * errors, including -EPROBE_DEFER
-		 */
-		if (ret != -ENOENT)
-			return ret;
-	}
+	if (IS_ERR(rt5645->gpiod_hp_det))
+		return dev_err_probe(&i2c->dev, PTR_ERR(rt5645->gpiod_hp_det),
+				     "failed to get hp-detect gpio\n");
 
 	rt5645->gpiod_cbj_sleeve = devm_gpiod_get_optional(&i2c->dev, "cbj-sleeve",
 							   GPIOD_OUT_LOW);
 
-	if (IS_ERR(rt5645->gpiod_cbj_sleeve)) {
-		ret = PTR_ERR(rt5645->gpiod_cbj_sleeve);
-		dev_info(&i2c->dev, "failed to initialize gpiod, ret=%d\n", ret);
-		if (ret != -ENOENT)
-			return ret;
-	}
+	if (IS_ERR(rt5645->gpiod_cbj_sleeve))
+		return dev_err_probe(&i2c->dev, PTR_ERR(rt5645->gpiod_cbj_sleeve),
+				     "failed to get cbj-sleeve gpio\n");
 
 	for (i = 0; i < ARRAY_SIZE(rt5645->supplies); i++)
 		rt5645->supplies[i].supply = rt5645_supply_names[i];
-- 
2.43.0

