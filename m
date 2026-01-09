Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3725527FD48
	for <linux-sound@vger.kernel.org>; Fri,  9 Jan 2026 15:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767970951; cv=none; b=uBKcsT00lCOZRGXgH2Me/u9MeHLGVMAZ73jPBB71V12is34xJo3+3XlKgkFiISDkKtnz2KooyWd1xnr9wBTfoPmPbqQDZQfXo5/Yv7KofdsqcmBMqJmkwKnzw+9N2caOaFBidbCnWfnK815MQeu4K1CkvdL+e8GX930w/3/7e7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767970951; c=relaxed/simple;
	bh=nCBqxP5sqd/ywO7hxySgo/z7MuNVnRmbeNezGsLL5DM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hkAvjygKhy6YyiMe8FP1/FIb9QyhMUcbQ9KLGkom4EVyVGIININLiQt6IINcVTeSW+qpFDvOUQ/M7zDVtE2Jnb1r8PqAdHae/qsS52UukBD95mI8+oB+IwXMncCj0u8m7WrfR5NLtgYs+VXLHflmFPWEGvOvr2AVTpBblobCy+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=q2/OL9oT; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="q2/OL9oT"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b736ffc531fso830372866b.1
        for <linux-sound@vger.kernel.org>; Fri, 09 Jan 2026 07:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1767970947; x=1768575747; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eh1b7PJlh1mkmaX9+zF40XSmRj4kINuJfJyjc07Wr4o=;
        b=q2/OL9oTh1284U6vIcRNDODlYbw9lpy4TrqO7gQ1ZEBMPGawqJXDsvR+mdvUqBi+VV
         4MnvcNitsk2gwrzn8rZrQJ/Mp2jWvtDpwhWnNQEQL70oCr+ZwSh4XA4IUU5u64+QXW//
         inmtQtkNM2ZBHpdj0FDqHGG9bVwTIgZUugEfK1f+jTvkZAZ9AgbRckNXe4T2uYDciWKJ
         B2KAjepwXb3LbR7tp3VKkKFenqCl4/QVXcmNGub5md4Wy8sQcx7ApSabp/YTV4py5ef6
         HeZUNqD+PXyVhIT1np+dM9FfrFpo6VoUo/Yey7F0vFsGa6On/MMQJuKSCB/Net6CZCs+
         wCJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767970947; x=1768575747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Eh1b7PJlh1mkmaX9+zF40XSmRj4kINuJfJyjc07Wr4o=;
        b=U0Y2rHXiwlJ7/WZ/Vx1Xw3zKKQ69Zm+a9XI7XL7/zhncxWqdatnlhm0S3QqAX1Ae2t
         uKhy1bW0bUetvH4m1AaYZ3iy6v4Fs2GTuIXcecE9zRmwqZQsX/MBHLOwttIjdUhI69yT
         VSyECIeW6yT3BuNk3lCaYD0rwJL4VZMyx4u0z6VF+QWeDHhJBTFd7/TV+dfPXM5TEoeU
         HlQDBq5gNVpUYcugurla0UImTetm/gdw4EmaII4DWD8YcpGhr3dHUDHB9C9MjPCuEFua
         Uvg7hovvtd0xBCgCzARY/jy+X1oOlBdcMeReLYF9hB52Dr0dooNaW8PdydYQpQmgf4J8
         iqaw==
X-Forwarded-Encrypted: i=1; AJvYcCXBWI0aX+XbSDewf/uoIqWh7h0XnsxAb0RpQXd5/BDjHbxV4/heMfXHV2ZeKRYN5QqeRVUHeOkuth7ugQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGsTurHNQ+Dbvmkgj95jSiv8SKFz7/sf/ZC/lwTw6Pa05dQ1Q+
	OEct4f3QGWTHUuCuoetiwTJkipnD2yh2RrdgNlyGYf3fUmlIWE49jLxuxPtjc9ubtyE=
X-Gm-Gg: AY/fxX7f8ZSxhmZ4owS+peBxwJ3DXH9mmUDhG/HKuAsCXBpXJ/pB04AQLDFZnTgqTK5
	lzV3mlwm2tZVw2llrsNy85CU0fWAx6I8WHQ50zhbp1AxQJKMJwLf+5SKGYxnM7prEdEw0NMV7RU
	5XSuytXn/578IMA+3isRMB3SbShSWH5QLR9A5On3MSbY3RAisUUmZiTP+ku9UrJ4VGZvzE4y+3V
	8nGdKN47VGJ/w/xLEHgt5RkEcsg4Tq+YJeBVDLP68jES7dQj2RhW5JHZOAYDhn+Vl/M/IFnE502
	sMlOyZqkJVJXcT+2wG6pNoMbgivQh+kxh9kCkJA/EwsL8hv1YZoh0eSoT0NdZHrTlSa+gtCjqLp
	U1D4dOAJ2MR+VU8+BRAsIlZ5iy+EwQ7SQeKS0fwwKJQ2mr/lgU6CHdYdIk2z5OJuPG1OC9v2OXZ
	3RZ7fQNjKkec/IYytHFrvAAPhKV8D04fnEcAZzvHqpa4L9o6fSKnHMsZDdlDyS13dL
X-Google-Smtp-Source: AGHT+IHFXaqkqUvJibSzS1JQRooC7jLomB5BmheUGAePTs8yM3pFtmiu+UW+F11F/cwtA4H1dqY/AA==
X-Received: by 2002:a17:907:3fa3:b0:b7d:406f:2d3d with SMTP id a640c23a62f3a-b84453fc81amr1073349766b.54.1767970946746;
        Fri, 09 Jan 2026 07:02:26 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a511546sm1132090766b.48.2026.01.09.07.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 07:02:26 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 09 Jan 2026 16:02:05 +0100
Subject: [PATCH 1/2] ASoC: codecs: aw88261: Remove AW88261_I2C_NAME macro
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-aw88261-dt-v1-1-45840c7632a3@fairphone.com>
References: <20260109-aw88261-dt-v1-0-45840c7632a3@fairphone.com>
In-Reply-To: <20260109-aw88261-dt-v1-0-45840c7632a3@fairphone.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bhushan Shah <bhushan.shah@machinesoul.in>, 
 Bharadwaj Raju <bharadwaj.raju@machinesoul.in>, 
 Alexandre Ferrieux <alexandre.ferrieux@orange.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767970945; l=1369;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=nCBqxP5sqd/ywO7hxySgo/z7MuNVnRmbeNezGsLL5DM=;
 b=wfZz4y2xYmwI3It8e/xiHU5Prd79hzi8oRx/wgI/iQUyo3PgzFLcrAkvZb/BG6o2zoOPYOnKw
 XjVtdh/c8I2B/Ee+rf87dF6zrHTATOMjd5ihmyaG7GBO6Oytrjr11Bd
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Replace the macro by its simple string value, to make the code less
unnecessarily complicated.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 sound/soc/codecs/aw88261.c | 4 ++--
 sound/soc/codecs/aw88261.h | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index 8f37bfb974ae..ceea0c8c60b1 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -1264,14 +1264,14 @@ static int aw88261_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id aw88261_i2c_id[] = {
-	{ AW88261_I2C_NAME },
+	{ "aw88261" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, aw88261_i2c_id);
 
 static struct i2c_driver aw88261_i2c_driver = {
 	.driver = {
-		.name = AW88261_I2C_NAME,
+		.name = "aw88261",
 	},
 	.probe = aw88261_i2c_probe,
 	.id_table = aw88261_i2c_id,
diff --git a/sound/soc/codecs/aw88261.h b/sound/soc/codecs/aw88261.h
index 734d0f93ced9..1fee589608d6 100644
--- a/sound/soc/codecs/aw88261.h
+++ b/sound/soc/codecs/aw88261.h
@@ -370,8 +370,6 @@
 #define AW88261_START_RETRIES		(5)
 #define AW88261_START_WORK_DELAY_MS	(0)
 
-#define AW88261_I2C_NAME		"aw88261"
-
 #define AW88261_RATES (SNDRV_PCM_RATE_8000_48000 | \
 			SNDRV_PCM_RATE_96000)
 #define AW88261_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | \

-- 
2.52.0

