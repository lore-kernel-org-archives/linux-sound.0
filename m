Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2612C0307
	for <linux-sound@vger.kernel.org>; Sat,  1 Nov 2025 13:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762003648; cv=none; b=Fg9LuCHOZusRF63vVLLNx5Z7ih6rCrXX/HH1tN+hQr+twAO9DSrpofNl8BJZqelqmMawtJ0AYsYrlBJ2i1dTEC9kE2ZiJzRgydfOScNGasEyTsOMZ9IguLMcO36olvFmWbgz8wpYuBMSeDzuPOsmMtsT0/iMxV3zIWN1YU3dBd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762003648; c=relaxed/simple;
	bh=2PAOIcseLes8QDrU/0O6eI7V5prSun82KB4s861oRuk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AMNX3l1NjoVnfQYCxCZIv0WoL7/+waHs0aK7QLhLx6WByex7l4itlfEIOxNTnxxP5Qc2TIOQrtqkSlfy3GRphjE7IdAapQdvJ5o+YeIZHgMSCFyQgfQa1FP7Ybexj/uzDa8VHG9Ym0IdI3vMQYk2qnBa3eygxLGXAnxqaghJtgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=COgWpTbr; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="COgWpTbr"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-429c7f4f8a2so186461f8f.0
        for <linux-sound@vger.kernel.org>; Sat, 01 Nov 2025 06:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762003645; x=1762608445; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZyMxV1dKZKD1oc5wPyS8VTSoTsg2uKzYIVyhunCik3c=;
        b=COgWpTbrcqgzwX2Q+EcM6HVZGj/VVCGfWNXebemnOn93dWbftxvne3uRNQ/BwOHHoJ
         f3pn1eul9/bTok3ptHlFHEWQuQQApYj07pUIFzPCIkyeEYEK//mymz6kDDPcsVllJ8at
         76uhYeUZFQ18JT05jkE/Nt8/UyK8I2+wsQOq3jnRPOf3t7pAb2hGhBWrxtY8/XdNhkVO
         kGj/QJcTweZCsRbgdjOI8A1baBc3hEn0yMzj0x+vi0CuacFUDBkLWQKGPdWE3zAGE4zJ
         dVl28KvrX8g68mCs45AZy5r/tFCrPUcCyvt5HVjOdImVdrZg+o0imLcNzHxHPSphtIny
         EU7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762003645; x=1762608445;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZyMxV1dKZKD1oc5wPyS8VTSoTsg2uKzYIVyhunCik3c=;
        b=vdov8mTgZB0Cp+2UrAXeXU0hkYRIgC45RkgMdMbnhz4KYePron2JQKkVCLO5OTPqc/
         FtU4Ojb67LZ5e6NKgzbhY+2c0VwFsfLnTGmhrFw/q1g6bs1QOjaFD7rNn4tTFUU0Glqa
         5LuKb8IsFY6L0Rv4dkizh4Ty5l1Gm6D4smIrR8w3ELq0TQJph1jqxeXHzdDiOMo8QDHO
         25R1GJDwuaoDYIdJakOROpKBQY7NNUuAqKusAgiZJaYL6T06fwZDKAZCmVh+EJkO3t/m
         FFn29s7EEejcZD/siO6nEG9GWgdYwIcl/7GCo8haD2PYYnW+9Y4sF7Po7ypYw0AnmCsn
         UaAA==
X-Forwarded-Encrypted: i=1; AJvYcCW2g5xF1DlmODgwbgN3jkAr6u5drBRhNkr7uYDkajCuaKAlbu3qdW1UBxwDNq2IBhat7YoBoJcVgAfqiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9OSMV78R4Yaga9JD7d1YV3W5vNSCTXwSlPXy8VyXZ1gvpYJ2T
	dxIJlAnmYoh8QsDOsDAarQSE2tFWRa92cbp30NebbFnVGS7P/s7Y2xXPq4dwfyuEQUk=
X-Gm-Gg: ASbGncuh9bm9VzQaQUfJsrIKNZ6gQoZHWHU4WyVkwpqJluNNYf1jrYHOR5n5QPoMf/p
	XZV5/oDzlZU+Y/gZxrUHz9w+OQCuzX4vCZ0SA9HZCvcAj1t03nBtq/8PwgQUV9AsdOCD7WOSNgH
	Z/kOoTfTtFjkPUZ7T0rF82iq9xZHDByfW2CmoIiFwXFpYKVf/wNJbTzT3DQAR/ck48eIStObMNv
	jfiK+0RTphKVCB9Ejlu7xdtaGj2MoqX9XRWpU7+0/xTnMasOS15ywSLcGHk3lSxhO1o+Dt/C9zN
	hZCtV68IMgMRzlU/iNTr+a+ZDnv4Pk/piyG1AjhxwdCUqVkKEOFORLex94ZOOmhhC9aeOpNaK9g
	M3W4AYN010MDacugK7GGx9V55h+CrCltWFiG5QnRP52xC7tZsYK2XyrxfNW5fXbGjZZSMX68Ece
	gugzYL6KMZc/MNixAJ
X-Google-Smtp-Source: AGHT+IEqQsJBFv5uwUWvnqKuKWaeqqvXllSedT2UBK/+ULtHgNwi01zCsS4nKdErZ6SQJVrrjAvBXQ==
X-Received: by 2002:a05:6000:1acd:b0:429:a89d:ecef with SMTP id ffacd0b85a97d-429b4c43672mr8852365f8f.13.1762003644568;
        Sat, 01 Nov 2025 06:27:24 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429c8910c42sm3140228f8f.7.2025.11.01.06.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 06:27:24 -0700 (PDT)
Date: Sat, 1 Nov 2025 16:27:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: codecs: simplify aw87390_init() argument a bit
Message-ID: <aQYKuQuKekmoUrHP@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Just pass "aw87390" instead of the address of it.  It's a bit simpler.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/codecs/aw87390.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/aw87390.c b/sound/soc/codecs/aw87390.c
index 460b782e96a1..d7fd865c349f 100644
--- a/sound/soc/codecs/aw87390.c
+++ b/sound/soc/codecs/aw87390.c
@@ -360,7 +360,7 @@ static void aw87390_parse_channel_dt(struct aw87390 *aw87390)
 	aw_dev->channel = channel_value;
 }
 
-static int aw87390_init(struct aw87390 **aw87390, struct i2c_client *i2c, struct regmap *regmap)
+static int aw87390_init(struct aw87390 *aw87390, struct i2c_client *i2c, struct regmap *regmap)
 {
 	struct aw_device *aw_dev;
 	unsigned int chip_id;
@@ -384,7 +384,7 @@ static int aw87390_init(struct aw87390 **aw87390, struct i2c_client *i2c, struct
 	if (!aw_dev)
 		return -ENOMEM;
 
-	(*aw87390)->aw_pa = aw_dev;
+	aw87390->aw_pa = aw_dev;
 	aw_dev->i2c = i2c;
 	aw_dev->regmap = regmap;
 	aw_dev->dev = &i2c->dev;
@@ -398,7 +398,7 @@ static int aw87390_init(struct aw87390 **aw87390, struct i2c_client *i2c, struct
 	aw_dev->prof_index = AW87390_INIT_PROFILE;
 	aw_dev->status = AW87390_DEV_PW_OFF;
 
-	aw87390_parse_channel_dt(*aw87390);
+	aw87390_parse_channel_dt(aw87390);
 
 	return 0;
 }
@@ -426,7 +426,7 @@ static int aw87390_i2c_probe(struct i2c_client *i2c)
 					"failed to init regmap\n");
 
 	/* aw pa init */
-	ret = aw87390_init(&aw87390, i2c, aw87390->regmap);
+	ret = aw87390_init(aw87390, i2c, aw87390->regmap);
 	if (ret)
 		return ret;
 
-- 
2.51.0

