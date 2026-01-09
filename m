Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B56A312816
	for <linux-sound@vger.kernel.org>; Fri,  9 Jan 2026 15:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767970952; cv=none; b=nggBFChxooD4kCmtwEjLty5EDQwyOXxiXQ0BhqqHGe5OIYeduhei/JhhE9MRvzjZsPqvBrNIeJC5jQvPEinju3n6Ab98VVZo8tVZaimJOD9UV4XGZmnjFdfMxLEUnFUWTTL1KED6GxzaPrml5V3u9Y+ZN73IRHLImjShLCRPC6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767970952; c=relaxed/simple;
	bh=XltF23iU+jXeuJxhhps/NSwXwMI+UkoiIo8Coo6WoMo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MSsYDZsBLqTLBhz0ByCUFw8u0tPk6nAVw2AXlk+xtk1PsoGXRpHXEasFPX5TXh8dpIct+QLFf7hVqX5O3+daMOGv6qyudUIXAHkXbJWENyWDvsCS9AAksDqp04sY9c8gM4d+z6QwgqqNeXjaDg4r/RbDVFwN+s135T63RnQIiUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ceQM2pi9; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ceQM2pi9"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-64dfb22c7e4so5400692a12.1
        for <linux-sound@vger.kernel.org>; Fri, 09 Jan 2026 07:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1767970948; x=1768575748; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sF3ZcF4xUEC3JcJxQYqBchhCHAKMGuALG5ZGbk0glio=;
        b=ceQM2pi9AEtnn8PSLCTwjxZa3TSjk0X9eep/qzwqyOqQgBeUcLPFB7qva+mIQHw2v2
         anhhrzqtjiTfJhnzLAFUTFuJEEnet+Vye5WLm/6KzV5YyKokNGW7IrvOBZ0JRb6zZcXD
         b5ZjpZ3VVDwB6ar/61EKrGiwLSCVgkcf6v4oZCfVkQRvgaSN+teWkqGwcehlyVG57BDg
         6yLhhIa5kBduDH+5Wt4POOyT+xU98uDaZ4vseunqGvctnHvJTxa6ssIIv9QijkGB1ujZ
         LwLAgDqPTjjWTfQEPZe+zt9fo0PRKxBVFzp7gw9X+U59v7Kt6A+iWH9l87ADuwIFpsdy
         BljA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767970948; x=1768575748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sF3ZcF4xUEC3JcJxQYqBchhCHAKMGuALG5ZGbk0glio=;
        b=NxFfnvSSdVcU3mVpdrF0xaV3m7LVnrfh/wfYZ8ieT0GqVmXZ5fLV5TVthxgrNO83F9
         CqqxNPjA5LWA0iFf+fq8r0BOxWKhlhHmaWtB4RpStRJTkZP+QVpEg0OZLR2ZbdqD60Lr
         +kPxnJ2d7JKyvTY3iNFjAwkZfW5irCEiMwvDFIlGAQWx1Z5dGoVJL9X7/deAvWiqDDJf
         giOvRxA+iaR5vjUAiktVezdn40FvadFJwUzLBmN5kgzn+xd80B4aZgdqNUhag9hhCCSc
         G6t6zqDEooDXfBwjmZhowvaxG52uB6LNeiyo/Kh/Pom8PkGayyI+tyZMWNlhk4GlfWco
         Fs1g==
X-Forwarded-Encrypted: i=1; AJvYcCV7xHMHfyuyexr/DpDSHacMz7iGjI/UBD5Av7TMmyHZfolVQYLMy+64MTgFga7JpOkqr0ut4kYuwxB7mg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwY1wWEcyCnamaY4ojBP7xAAH0SGDNEbU31BCsZH3Z7BJaY8P0K
	9SizZ2nMbq78P/alEfrKYbjWrZitkCFHRNWqg2BFdO/7e9R2QbQvdgjNzLvme06CZFU=
X-Gm-Gg: AY/fxX4jEeeYY5pEYWdZDeRyr6prjGVrG++vKr+ODFHVKVqpBTozWoGNZ/bWG7xbSHf
	hnd4TprKP0xuuBDXrqMzDb3eHJYdbYNVu5HkRiP1SF6ZpJm3+QCz+1DDTeS6ADtgqcCtCnZD+e2
	HnPSCL99+yur3e5RutTuNTur4+sA+DI9lWImmzGKg9btDzPtMCQeeyKlXQ0kq+u0B/NKq3hOVJc
	PB9oowcGGUOPifOsrnjT+naa72RkywsflXqwAhV49336+ej7DacoGoKkZPsQYdzpdngussHGvMA
	hpX/y2ZvtXz5Ncgv6FIwOdFFHMDcf2Hr/t9WreT6zLdosuInaZ3X3YW6U8MFCvmVWKbPdC8mXvn
	s61Znxdpd9/7HFs6IpM4gEJQBvguE1oNTAMmEmy+cT8x8NNECpbtXkXkr6jAX3Jqhy2utIwdA6m
	zAfL3v4dmFScwzmT0l23Ew8n+RNn/zyKoo7Om+Mc4h4OSxH9xXxnYwL1/R8xE26Ob/
X-Google-Smtp-Source: AGHT+IG+cBf2hA0EYoyz1561smg916z9JZcPywz3ZjWA0KaifpQXg54JPVldJWWAs8yWfDRiVgymWw==
X-Received: by 2002:a17:906:d54c:b0:b79:ea1b:f13d with SMTP id a640c23a62f3a-b8444c59a0bmr1184074466b.2.1767970947548;
        Fri, 09 Jan 2026 07:02:27 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a511546sm1132090766b.48.2026.01.09.07.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 07:02:27 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 09 Jan 2026 16:02:06 +0100
Subject: [PATCH 2/2] ASoC: codecs: aw88261: Add devicetree support
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-aw88261-dt-v1-2-45840c7632a3@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767970945; l=932;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=XltF23iU+jXeuJxhhps/NSwXwMI+UkoiIo8Coo6WoMo=;
 b=WBreLQ7JD/q3X5WW8rScbuygxh3SSuRq/NmB+HrnSOGBNJH7w0KRgIVznecs638h8NThVewcN
 BrqQwxs3f6dAJ0sePKTIqEsu+b4Anwf9NiScFKuL0a+DxM41b98/X4K
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the compatible "awinic,aw88261" so that module autoloading will work
based on the compatible from devicetree.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 sound/soc/codecs/aw88261.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index ceea0c8c60b1..810c90f5e783 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -1269,9 +1269,16 @@ static const struct i2c_device_id aw88261_i2c_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, aw88261_i2c_id);
 
+static const struct of_device_id aw88261_of_table[] = {
+	{ .compatible = "awinic,aw88261" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, aw88261_of_table);
+
 static struct i2c_driver aw88261_i2c_driver = {
 	.driver = {
 		.name = "aw88261",
+		.of_match_table = aw88261_of_table,
 	},
 	.probe = aw88261_i2c_probe,
 	.id_table = aw88261_i2c_id,

-- 
2.52.0

