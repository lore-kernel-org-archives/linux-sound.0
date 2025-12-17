Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37F024468C
	for <linux-sound@vger.kernel.org>; Wed, 17 Dec 2025 05:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765950453; cv=none; b=B8NG5M206rEWVgNycA+UZ0NVqIJTLtIISKXGDP2kT/qDKZzySxxJI7Yd2uKzQBd87JysDg/Vapfl8XxoeDrhHUK/yzZf7o1aubITxnWKkEbPlcOXglGMn5usx5LzEwhP4Dnlmi7JM5n2jJY+kqD9TdAWE/B0SQVvrfyGZ+rDgsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765950453; c=relaxed/simple;
	bh=Wqg2OkAwoAPvHpfzGdew9bAtWM4ALZqBy5yf/17p6Kw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N5AgKu413v/RDBDNrpIHl7KCqplpCzePFe0dhs5T55LgzL1DLDgxx1S3c0UPgLyWJuuRa7YJjdW5e/4M+pW9/0Id78nPYRTGd/rNhNF2jTenOVBSxtqPdYJkDHXgPmskWTcOWu1kGXzxuMqmDb4UL7G6f9MWi27kMineWUcq750=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A1eBVy2n; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A1eBVy2n"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso63677955e9.0
        for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 21:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765950448; x=1766555248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=78dFlraoKK894E/v95kDcWXupSqcG52RKepDqDlHiRM=;
        b=A1eBVy2njGSZtd7JRo0/71NjlN2MV6kY/eHDFnubOK8KJ2hLheLdnJKHPFOsbetbm8
         KW8ZDsIspNxpv6m2SptzlGEg5VYhvOf6WFdG1u241j4vZ/rZJ22vxK0947do8mBTXoAB
         mH7PkOURO0i3ZcTjeCAB0utZYZZ8SZm+JrNpAalox8sevhes+yeLUqQfu1LZt9NHrwrp
         3Qw6jUDEKb6cbqdEgmhjghbzJC6s+oiDVUpqhGttGRGRWoJR3Au5jw1wUNFnTxgfpA4+
         1khcRguXn0N9VyPEZ/W1XNZyRTTI4v71g+j76BnwfiPFvg5X9qLHRQGGnRdBFspWkGSb
         vuxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765950448; x=1766555248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=78dFlraoKK894E/v95kDcWXupSqcG52RKepDqDlHiRM=;
        b=ZFuY495e79VcH9Bvy9QaiTv6tp8hgSgt7PV1rubFBFay7sKoZ76peNECA2Km44lilT
         CfDGoGRSMAsKpq02krxqH0Wqj9XDwM9iPmelXMa8gTffRW1RnAoGOmPL4AM0zlZQIKFy
         4f52KEy3iQj29lGlsIPYuWk16N/8MM1r78GeZg4GfiCToS5ANAr1vdOhYQRNt5XE5NgS
         48aIt87CE1lXxbcxHeLF7p82090eJH0M0o33jcp+fvH1Cth1Js2Jw6YEk7UExEMs/TcR
         AXnnT6W3RuVNu33+D3elzrj+4DO1DhW4xBF/eiFLrD4bLWFh7YAvx9JNh63WBmLYOIiv
         p2ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBVGZ2bpSQWwsIL5PLRTD/6VGbunG3BnXer66B3Or/sVzxTpctWnmhPKJVjj+vXa3Ww5vo3phLyhyEuw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEk+OW0riPBTlcQO5ALswRJD+JdcMv2UQItAmUa//sv8SvFtOe
	HP8/9h2QFDRqaSe22KNgi2Od3hQLJhFEE2bUz/zNKci7pV0NnKyb3563
X-Gm-Gg: AY/fxX7gIave0DXNBRJ56hjqRmjvVHfmeVvfCHYFnjCDH/Oy9AIYmS4oNd3F46aBPx8
	UnjmfaRjT6dxsSaJRDRycYDzcN3grgFKwpUSO3Q0ITUzbTxERCw9jQ4FgC1wg0yGZHUxa8C3u5k
	ugjnd2qDi8AqdbhPqxxZU/uxMgTyOSlQIh01SU2f/z+dCgjSBsZUuOmJlKIEntGT1LZrTwHLoF7
	aodTBUjT5ci7+Q8OZR7WT/vsON2FkLHPRZi4keCsXzDr985r9MoNHn5AuOL/HXlUZgSVRL1/H1R
	bCYGjbvIdjU0MblK0TNYAFlWV02YlXrp8nJCIyu5WgmqwSMfSDK2YVZtBQrllJnySuuNh+S8KOd
	kC7ehpaITHt5hehJZS2LKyZGLtZGLDQXetEK3RcQjMs3lmak3qS8K9/R/KSdQ4nnQPbPYPntAHS
	VgoxwNGzGymK5f1g==
X-Google-Smtp-Source: AGHT+IEJnQD+wtWuoMRDLkZscCdThtw8fDQbJjJHtIPtXKe8FCUM54PfYp3g7xZABjP755Na+v9/mw==
X-Received: by 2002:a05:600c:8b62:b0:477:abea:901c with SMTP id 5b1f17b1804b1-47a953da53fmr134204355e9.11.1765950447932;
        Tue, 16 Dec 2025 21:47:27 -0800 (PST)
Received: from gmail.com ([136.226.167.107])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47bdc1e6ca3sm20611325e9.12.2025.12.16.21.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 21:47:27 -0800 (PST)
From: hariconscious@gmail.com
To: oder_chiou@realtek.com,
	lgirdwood@gmail.com,
	broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	khalid@kernel.org,
	shuah@kernel.org,
	david.hunter.linux@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HariKrishna Sagala <hariconscious@gmail.com>
Subject: [PATCH] ASoC: codec: rt286: Use devm_request_threaded_irq to manage IRQ lifetime and fix smatch warning
Date: Wed, 17 Dec 2025 11:14:59 +0530
Message-ID: <20251217054458.38257-2-hariconscious@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: HariKrishna Sagala <hariconscious@gmail.com>

Replace manual "request_threaded_irq()" with the device managed
"devm_request_threaded_irq" to manage the IRQ lifetime and also
it removes the smatch reported warning.
Remove the manual "free_irq()" in the "remove" function as free_irq
is tied to device teardown.

Signed-off-by: HariKrishna Sagala <hariconscious@gmail.com>
---
This patch replaces the manual management of IRQ with the device
managed IRQ API. Also, it removes the smatch reported warning.

sound/soc/codecs/rt286.c:1252 rt286_i2c_probe() warn: 'rt286->i2c->irq'
from request_threaded_irq() not released on lines: 1252.

Removed the "remove" function as IRQ is managed automatically.

Thank you.

 sound/soc/codecs/rt286.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/sound/soc/codecs/rt286.c b/sound/soc/codecs/rt286.c
index 2fbb5860c421..195658f626cc 100644
--- a/sound/soc/codecs/rt286.c
+++ b/sound/soc/codecs/rt286.c
@@ -1236,7 +1236,7 @@ static int rt286_i2c_probe(struct i2c_client *i2c)
 	}
 
 	if (rt286->i2c->irq) {
-		ret = request_threaded_irq(rt286->i2c->irq, NULL, rt286_irq,
+		ret = devm_request_threaded_irq(&rt286->i2c->dev, rt286->i2c->irq, NULL, rt286_irq,
 			IRQF_TRIGGER_HIGH | IRQF_ONESHOT, "rt286", rt286);
 		if (ret != 0) {
 			dev_err(&i2c->dev,
@@ -1252,22 +1252,12 @@ static int rt286_i2c_probe(struct i2c_client *i2c)
 	return ret;
 }
 
-static void rt286_i2c_remove(struct i2c_client *i2c)
-{
-	struct rt286_priv *rt286 = i2c_get_clientdata(i2c);
-
-	if (i2c->irq)
-		free_irq(i2c->irq, rt286);
-}
-
-
 static struct i2c_driver rt286_i2c_driver = {
 	.driver = {
 		   .name = "rt286",
 		   .acpi_match_table = ACPI_PTR(rt286_acpi_match),
 		   },
 	.probe = rt286_i2c_probe,
-	.remove = rt286_i2c_remove,
 	.id_table = rt286_i2c_id,
 };
 

base-commit: ea1013c1539270e372fc99854bc6e4d94eaeff66
-- 
2.43.0

