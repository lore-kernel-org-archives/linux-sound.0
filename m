Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6D3366DB9
	for <linux-sound@vger.kernel.org>; Thu,  4 Jun 2026 20:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780605435; cv=none; b=TPspojBTu3Lnnf965iNmGxzVq3vBFZ3k8vB9XKwlZ8D6AAx44v0Fj74OIGuaIV4R/WeuVCIkqMoJkks3PMNKNGv0auyeLFVdlT5tPXu2JEPCHL9cgtEEcIbujLN00OAneE3XMH5+v+gSTJHMDmH8lortPIW+aljkRq4xdaWQzQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780605435; c=relaxed/simple;
	bh=sFAg+UnNZFsqoEmOnCOLpobCREe/dQvTzc8AGSIGq2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uudfAyprn4ukPwHahjvKZDel5l86huahaUXEuev3TTbhUvWv5bCnLHLImuH6yw8uCXxjBV8+nG+j41JE8xVGkz7z2H4vg+x0tE0YfRFxBbdlqFiHc/lnQ/E0dw4EOWeL3OffyOyBtsAMKZ9/gZbmSYsK0RctdDm+PHnZE/TTy0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WlVOiXZ0; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WlVOiXZ0"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84230ab8857so535082b3a.1
        for <linux-sound@vger.kernel.org>; Thu, 04 Jun 2026 13:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780605432; x=1781210232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6RDOJWyZ5/u9ipkjQCKV4Mf6ByGXtSeoznwE7qqlAc4=;
        b=WlVOiXZ0DD4y4B+nIszZnsiu+0T1TXF+d2Xw5IEsNrUTEJ+6BubaoTQXfD4X12odW4
         HaGgaG3LWhyS/B9I/K1ZWqD1ugsErOlr2BNyCGWJ7b2U6fXKGiipKdIBbgYBOL/yV/rN
         BX/wDdzQMknYVeKv9YNtLQW6/o4czpT+JnOmw9kyxffxxOulvLsbKfjSbIq/DyRr9tJl
         TEb7CdpKEGvRLA4W4aOY8zD2QDycGufCPspWmhHy1TK/bEvv5PeB85DGHupKifqIcAYh
         hGj3SwrqDFIYsy3Qv7j6M+XqFIBYmCaEJT3F2dlGA6cEAmQjHfkzGP16XO9yufqXYu8X
         LjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780605432; x=1781210232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6RDOJWyZ5/u9ipkjQCKV4Mf6ByGXtSeoznwE7qqlAc4=;
        b=nJvEZgO1hVTKDHUCTXh5dihDRwgYT4QPwkF3Nqqhy1OuOM02/6FpZs6TIpxyffHXna
         EtCXVrw1ZckKJY36ptWU3poD0DROvqnSiYPpQAmYOWIe4/aDyuXosmlk7UVLcMOBqeYx
         /3V8rotAvLR9jdOrQpTO61Z+Jrl3GUZ3SMIz9WtTbn1Co2EPLfDsfyMe+dAMJkGmXG6E
         5QYZ1jFbNZ6KGNZer2kM48Fb+SFLjPtf7LlhLfrKjd+bMLpMBoQTjyV6gTi3gXJGEbbg
         yv/tlo1b3E6cEkf6P3f5h8V82+zX9uQxayqnb06Fz1pXLWReYESvVjMvQ345RWXS4A+u
         S1ng==
X-Gm-Message-State: AOJu0YxnUHG6JDZ2Zid3cf3BaRwrwHhjS9rtLDGkES+oZV5avoSuc7T3
	CeKh/EGBt7FuNBoG4JtpB0OhJ4JpzFDlG+vz2C0UBIx68D2LtXCv0MY8
X-Gm-Gg: Acq92OFklYk6m4nC84ePsuO++yo1nPVzzvRTMaPD9DKk4yScf1FDP35etdV7mpifUsi
	Fb2dLflFngriYDJ5IXwdmrjuK77i9oxQXL7aVA0niyMwcc7a8WFIYT3GnxOBP+Okt7wNYRkHkcP
	gb0WGwOqPa2ogcCiReIGj577f6ly6aqdN0CK3qmY7vZ44Qb3EHs0WjZhE5DDY+I3GkWsMVHRzdg
	hb428h6Agc5elXsBNGauAOgMYFxQ/1GoY1J0bBhW8eVzE59JFHV0kAs/8NEqVIflzqn3QQb2OXe
	6NL94Er5YUnrFfcOQpdneJZGy4BxlA3RhmFq87Uqmof214HM0OnFpFwwtr1jCV+RfFNeB39Vx7U
	UHtTtqPghbJPwHWp1WVNtkG5KIzkzn0j9C1ps2k7hanqlYmmr9ZZlsS95sNo8tBgtf5Oiwws66P
	rUTFeQz3TII1dBgks2WHALDddlYCJpNs/lsmsqe9exOQSVW+eJaloLIH38FE3IFNsRAZDuS4PVg
	TzU
X-Received: by 2002:a05:6a00:9292:b0:842:688f:307f with SMTP id d2e1a72fcca58-842b0f51a52mr276902b3a.28.1780605432407;
        Thu, 04 Jun 2026 13:37:12 -0700 (PDT)
Received: from Ubuntu.. ([49.37.171.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828fe634sm7118257b3a.52.2026.06.04.13.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 13:37:11 -0700 (PDT)
From: Manish Baing <manishbaing2789@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	manishbaing2789@gmail.com,
	Sashiko AI <sashiko-bot@kernel.org>
Subject: [RFC PATCH 2/2] ASoC: atmel: ac97c: Fix use-after-free on driver teardown
Date: Thu,  4 Jun 2026 20:36:23 +0000
Message-ID: <20260604203623.162640-3-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604203623.162640-1-manishbaing2789@gmail.com>
References: <20260604203623.162640-1-manishbaing2789@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In atmel_ac97c_remove() and the probe error path, the driver disables
clocks and unmaps memory before freeing the IRQ. If a stray interrupt
fires during this window, the handler will attempt to access unmapped
memory or unclocked hardware, resulting in a kernel panic.

Reorder the teardown sequence to call free_irq() first, adhering to
the standard reverse-initialization order.

Running make W=1 returns no errors. I was unable to test the patch
because I do not have the hardware.The issue was flagged by the
Sashiko AI bot.

Link: https://sashiko.dev/#/patchset/20260530052812.115994-1-manishbaing2789@gmail.com?part=1
Reported-by: Sashiko AI <sashiko-bot@kernel.org>
Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
---
 sound/atmel/ac97c.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/atmel/ac97c.c b/sound/atmel/ac97c.c
index cd74395dd222..b9280b644f26 100644
--- a/sound/atmel/ac97c.c
+++ b/sound/atmel/ac97c.c
@@ -790,7 +790,7 @@ static int atmel_ac97c_probe(struct platform_device *pdev)
 	retval = snd_card_register(card);
 	if (retval) {
 		dev_dbg(&pdev->dev, "could not register sound card\n");
-		goto err_ac97_bus;
+		goto err_snd_card_register;
 	}
 
 	platform_set_drvdata(pdev, card);
@@ -800,11 +800,12 @@ static int atmel_ac97c_probe(struct platform_device *pdev)
 
 	return 0;
 
+err_snd_card_register:
+	free_irq(irq, chip);
 err_ac97_bus:
+err_request_irq:
 	iounmap(chip->regs);
 err_ioremap:
-	free_irq(irq, chip);
-err_request_irq:
 	snd_card_free(card);
 err_snd_card_new:
 	clk_disable_unprepare(pclk);
@@ -842,10 +843,10 @@ static void atmel_ac97c_remove(struct platform_device *pdev)
 	ac97c_writel(chip, COMR, 0);
 	ac97c_writel(chip, MR,   0);
 
+	free_irq(chip->irq, chip);
 	clk_disable_unprepare(chip->pclk);
 	clk_put(chip->pclk);
 	iounmap(chip->regs);
-	free_irq(chip->irq, chip);
 
 	snd_card_free(card);
 }
-- 
2.43.0

