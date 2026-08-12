Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454CD3ACEFE
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 08:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786524216; cv=none; b=EEp9QC7mvWAn7PFfKi/drNMYqAV+eJHsQoqZ4V1SJmYlACnL68Gpum2lk3/FJGVpD6jcmaZHouVheaH0Pq7q/NWuSAq56oFN2Wtmv1uoqJvUoaxfOUCy3dycK840+VouMYyqEbogkegkNlUH/o/Afe2/+VBDKjHPfqEiW0d0Ez8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786524216; c=relaxed/simple;
	bh=qRA8nU3QBEIJyUeDCOiR5PgzRnwIy1bxCgtg2DwWK9k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Km05FID4QFjMeORvAjHr1d5v1LTTO7tfcazcI31f4g/+IZ1HDVySE55lffS20qsbU8kfo9Z6DSsyAV1XgIHiow4RTymt9G9dx0IRnJbF+NxvGWutVneViHVn8Mf2kb3HZpl1Dd36gvEh482Xhor/AlJCAyEfYBY6EFX6fWNyG+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gRXZIc68; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gRXZIc68"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84874b52eabso994328b3a.0
        for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 01:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786524214; x=1787129014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cyfKdctycKARmAaj+/avYhghhHnWLQqSBVG4F5RrJyg=;
        b=gRXZIc68aMFJPMR68O1qcblZ7sdiyIdvB0IVcEUMZn9p7ojaBxBm32OM9bkkdnGrPv
         pxuLucEQxomtZBCfygL4wsBcWXpQrr4DnMbQpEKYp5FgPbTxk6aFOLEGOvK+XXWwRMc/
         WSUWWjdh9Ghz89l/zAZ+HlLhDJrrychB5LuIuPs8OTyWJH91w/TsyaCHntfpYd1p3Zm/
         5cK7DIDg1JjfiQsdZxdEu++L6OLq37hn3uaEY52D5pL7w6GsMJ3pdgsYXhRuoaM6ri+w
         q3FFAgVQYrXcFPby2p6QPqnkUjHuKZ3n861/kekEu+44CEfgpY9+Tg63VI2D9mHZ6+ly
         IB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786524214; x=1787129014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cyfKdctycKARmAaj+/avYhghhHnWLQqSBVG4F5RrJyg=;
        b=Ta6o+6x0yTt0FXLUXW05kccXLsdiC5IreRWEAmxFR2CAYf/ASy9h2OdUtPCmj2phmZ
         qJJwRcASXqJPXj179FpBeOtAhOzqTVJsMmzY748Xf8vJBByESen+ciKKttF9jDFqa8Fk
         klW+h/Gh5yJhJ9LI36GuUDkIXLFnx7mogML7e3OgQVCbYd0p/c/iJSAeA0ZhDuRStXsa
         10+DpoAos6zHVWXK2kmxev2f7HijeUkryZHpKnCgH2aEDIWaVeaOhZBX25/RuKLJmu/l
         RUYgPBNIe0bqL7/0ddOh3qFZbImOfce0bYNULtUZapLrqn5jPiwyZ7ceN49zhmeL+1gA
         hctw==
X-Forwarded-Encrypted: i=1; AHgh+RqrBtf2Tm0ib6wByjEUc/8X8H3HNz92lODSMItQikbsW9KMxECcjmmP7ic3UTDDzIYvyE2RybP/5BmGqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOo0iq0uXpBJVE4a7ksrw/PTRlGBvHG6QUAlH9lzKkAc1NtywS
	svUTqYKqD65INVAeW6c6tfwczOBwnMw9VWdu04IQ6omzXiVykyMJ0eaY
X-Gm-Gg: AR+sD13Ss3pWQMC6oVFAc/vFAAdHm+CePBdapOagMFgcv8Q4Oi2VdJgS3OtfAGCqvZ6
	FtQoEWhOFqV8to3zH/NxS1W9H/c/3RqjgnmQAUBt0hMc2yp1g9ZhiYnTzqeddkchSpbGsYxvvH7
	CrhmYp6lkGh7a0I929osU+fja1eS//o2e61JORnAFkcJvPpsfRh3DRgJv4tRCIiyubPi8SbZQHR
	pHM4iosUnEIXysJG5VbU3PJinsYSnzUsa33M3ewiDUGySNIAzOTzI6gx2MYcBqprJe6je8fTduH
	PS8f1kRp11mbEQQdukoIwYzSUiYlDndPjmSARR4ZbL34fsQ+IMjgSLEyfG/T7JzqvqIcdDc220c
	JT0/uyzzXuC4zVAH4NNsjvzgAc8lJNdKoapjE/9WDoqaub/exbS06LkGHzwMcXoSlm0XKZaP8jk
	+Lf8+Pe3/0cHN8WSZr1aa//uAasxnXaheBqrpvuAdgXBO6I4ZWleWxGjbXxp2VQgAasTSYfTeKn
	3nDtGILUlxUvv08YtgXv1lpleFphQHVHhQ36n3KY4HSbZLMbL1ilOFzAXYZ3VjEh4WxbgF9/lMS
	NUtN
X-Received: by 2002:a05:6a00:b48:b0:843:49f0:f5a0 with SMTP id d2e1a72fcca58-84fb5548cccmr3663158b3a.32.1786524214525;
        Wed, 12 Aug 2026 01:43:34 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbee7d52d4dsm350174a12.31.2026.08.12.01.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 01:43:34 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Daniel Mack <daniel@zonque.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ASoC: pxa: Drop redundant probe error messages
Date: Wed, 12 Aug 2026 15:43:11 +0700
Message-ID: <20260812084311.29188-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

devm_platform_ioremap_resource() does not report the error itself,
but the error is already reported deeper in the call chain,
so the dev_err() calls are redundant and can be removed.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/pxa/pxa2xx-ac97-lib.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/pxa/pxa2xx-ac97-lib.c b/sound/soc/pxa/pxa2xx-ac97-lib.c
index d9c3935636da..d7f720431afb 100644
--- a/sound/soc/pxa/pxa2xx-ac97-lib.c
+++ b/sound/soc/pxa/pxa2xx-ac97-lib.c
@@ -316,10 +316,8 @@ int pxa2xx_ac97_hw_probe(struct platform_device *dev)
 	int irq;
 
 	ac97_reg_base = devm_platform_ioremap_resource(dev, 0);
-	if (IS_ERR(ac97_reg_base)) {
-		dev_err(&dev->dev, "Missing MMIO resource\n");
+	if (IS_ERR(ac97_reg_base))
 		return PTR_ERR(ac97_reg_base);
-	}
 
 	if (cpu_is_pxa27x()) {
 		/* Assert reset using GPIOD_OUT_HIGH, because reset is GPIO_ACTIVE_LOW */
-- 
2.43.0

