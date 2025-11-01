Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7495F2E54B9
	for <linux-sound@vger.kernel.org>; Sat,  1 Nov 2025 13:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762003662; cv=none; b=K1rYFLZAZEE16wn3YmyOOwgXn96N+zqLvo0bBwici3GzHbpvRt/0/q93hasI6FuXssJG+th4V2439VfV8WH1LOKxjeYiB3PmxPAtYrNIe4a04D1p0QSriIdU8napLAdaw1GLV5ePXiPR4khQvuBHTpGri5U5osOnXLNPLofhqKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762003662; c=relaxed/simple;
	bh=O7ACs0ldqUJpLVDp+21SQI0MSqblXSVfkxhdkXYAbio=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uGgesYGPmeqVAoiPE/mAVcMoZgsAbsmPsPcWj1pp/C+DgLh8f2mSUCP9QxsgvovFCzavkhQS2YilPqb2Tkm7j08flWfkKODKiAf+EcEjVhe+lPYALbb4gxs0qFhbRgYuWoTs3G6rew8HnuIETMnLtrntte9fIGTpur9pWkoQgTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LHWd44YO; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LHWd44YO"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47109187c32so15878685e9.2
        for <linux-sound@vger.kernel.org>; Sat, 01 Nov 2025 06:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762003659; x=1762608459; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YXhWn6yI771aYOLRcSIj3itITp8Yx3KJMWGw7nupRLE=;
        b=LHWd44YOQBGe+Aj0B9QLiXQI+7ubRnClAS2uvvUlbWOw3moe98NjJbjbA+4sbVMAO0
         wjJSQLhtt7ScrWdC7UqyPWEd7vNzUe83ifjbTdZ6cAAh4XhbuCL7pl8wyJNgVaNSCX9A
         WhZkZr9Z4pkDvzm2PpfkZWoq+auHCE9f9hJ0FSGsxHwcMSoI0XMp2w7PwD4jgRdhxuXv
         EMmvf8vC/vZa0kWk9reFIU9sk4YDOFPz8E3ZxuD5I/cZCwDAvQaMZzZaOA8BLa34ZiTK
         spgFB7k1J59jI7J+zkPP/+x9ErHPm2cn1NqDd0rYZEfncjQvbWH7JhNvLDy1n1i3tFkc
         e9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762003659; x=1762608459;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YXhWn6yI771aYOLRcSIj3itITp8Yx3KJMWGw7nupRLE=;
        b=aTwLbOsR9Ku6HW+zgxE22S7s7F/CGSHKepv0dgI3agCZk7Rm0UPOVAh+gbWY00RPRf
         bgtVgnZWGf2B50WwrmZn9gn26/XzHOfw9tz0VTq3OO5Cmlds1E9DeTnTwcctSM0v0lO8
         qUqcRzJS/VYXd4RgY7E6Vpw58Kz/PVM57nVhxIe4bN1NIIMAydTewn0Dc8aGYLbGCIth
         7z3RMLzqEcu9wWe1bRWtS2YICz8mw8BSJ2OGF9VPP3cwpOkrLsOG4Ivmp9jtGvmb1di/
         sxK1zqrqJA1PeDM4C3kpHEj5tAt9eKgjxgidKx9BRv6sq6IbjabPxh2EP6Aldi6VFPH8
         NU/w==
X-Forwarded-Encrypted: i=1; AJvYcCWknXt6ia6PXCmhPiKjwtFW90yoWAzoy62GVyeQNqbbT1XCIuc0LQk/BWfKXdkIPjcL6cc3ahRHVRZjew==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWrFHOa3stlDFy+3v1RnQEY898k6QvCur6dUm8cX/KUYxVUZ7V
	Yc2cXOAdT0hKOVlsQaLVhGXU3bD1lASChw/lCX0qkZ8LalgzaVFKWpzr8wUhvoLUXxs=
X-Gm-Gg: ASbGncsNoCGtGqb6IBrAQkKBL7a5DJgn6hjzbZ487YX9VrvUFrYid9sB3ojnroiWyjv
	0Fkz09SvIRxJMICGECe9LRxwnmWTv3TDLSJNIaDaLrIADKyEB2OYrmJGP5xN2pcYZoJRQ4M5nut
	T5h/kUZmJBToyU8NfRy06ybJaV+EXC1mGCPnnU/aicipqB+b8OpwbQQXkAilsTfV7moHmqJcaut
	Hjc5zT4P4M1Ge+z9NzIr9Y3VRFmBBkZVPpnZeQ9N1S23zXDvHrRkR693757f74RY4u/0AYj/Dnl
	Z7HxjkGBE9C/Pr4uMYw9XJCUcwLXEpoLkTTkzkp/AIfyFTr/hpdGpoK5orDV4akIOaF2NcbKaOx
	zreZK821xPCQoyIGGMIK/VqfVkIvoBUcsueS/xty2BaDaMlyiMy/7f5k1K3e1Z6Kg0NPCOT15DE
	PRSfVS7A==
X-Google-Smtp-Source: AGHT+IHqXes4RC0d/pZNok2qTFXjlWakyDJ5XbPAbjHTCzlugL+3ND+rGETKmKuLd5fEQQ0F3CoHKA==
X-Received: by 2002:a05:600c:4e56:b0:46e:2cfe:971c with SMTP id 5b1f17b1804b1-477302d3677mr58158665e9.0.1762003658683;
        Sat, 01 Nov 2025 06:27:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4773c53ec2csm48606565e9.11.2025.11.01.06.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 06:27:38 -0700 (PDT)
Date: Sat, 1 Nov 2025 16:27:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: codecs: aw88261: pass pointer directly instead of
 passing the address
Message-ID: <aQYKxl2f-zGVdYFC@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

It's a little bit cleaner to just pass "aw88261" instead of the address
of it "&aw88261".

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/codecs/aw88261.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index 43556f66549e..8600b21ea618 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -1184,7 +1184,7 @@ static void aw88261_parse_channel_dt(struct aw88261 *aw88261)
 	aw_dev->channel = channel_value;
 }
 
-static int aw88261_init(struct aw88261 **aw88261, struct i2c_client *i2c, struct regmap *regmap)
+static int aw88261_init(struct aw88261 *aw88261, struct i2c_client *i2c, struct regmap *regmap)
 {
 	struct aw_device *aw_dev;
 	unsigned int chip_id;
@@ -1207,7 +1207,7 @@ static int aw88261_init(struct aw88261 **aw88261, struct i2c_client *i2c, struct
 	if (!aw_dev)
 		return -ENOMEM;
 
-	(*aw88261)->aw_pa = aw_dev;
+	aw88261->aw_pa = aw_dev;
 	aw_dev->i2c = i2c;
 	aw_dev->regmap = regmap;
 	aw_dev->dev = &i2c->dev;
@@ -1221,7 +1221,7 @@ static int aw88261_init(struct aw88261 **aw88261, struct i2c_client *i2c, struct
 	aw_dev->fade_step = AW88261_VOLUME_STEP_DB;
 	aw_dev->volume_desc.ctl_volume = AW88261_VOL_DEFAULT_VALUE;
 	aw_dev->volume_desc.mute_volume = AW88261_MUTE_VOL;
-	aw88261_parse_channel_dt(*aw88261);
+	aw88261_parse_channel_dt(aw88261);
 
 	return ret;
 }
@@ -1250,7 +1250,7 @@ static int aw88261_i2c_probe(struct i2c_client *i2c)
 	}
 
 	/* aw pa init */
-	ret = aw88261_init(&aw88261, i2c, aw88261->regmap);
+	ret = aw88261_init(aw88261, i2c, aw88261->regmap);
 	if (ret)
 		return ret;
 
-- 
2.51.0

