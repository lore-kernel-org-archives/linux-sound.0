Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B2C397352
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 12:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784030533; cv=none; b=FHxTZl+16717Sz2YTPvxegVnbAdirlLFllQkwhFRE+XHQtqxe6NLAl5qYgbE22eQ7KwIy/nimC1MjGgSaf+7VsCBkop1Gbj0zC6WnvyHtF94Unlpgi10xxFgB7W13paws8/A7mVbHwyLhEf8oMbJoWcEhCGk3K38VCHT5L+Q7YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784030533; c=relaxed/simple;
	bh=jIfPIVoUyA/INjY1+gAHyG2GIm/f5J9x2F0XjC4jOCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mQDuPMb3y3/3xsTTfbrncNLKzgkiu+ftgPF3JdcjVq3Ble01yfLs0Fev5O/sOlhW81tp/IEEVGIj+uXXTf3mZeU1Igyr4hqkm24LxCplcRReUPu0ZDM2hWxQJ9Uzv+j3rPqx8HMcjk0Mwp/1fTHkrHEimwQeF/LoaTbej0i0tH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jc0ypmdV; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jc0ypmdV"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so4372437a91.3
        for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 05:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784030530; x=1784635330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lw8PXA7wjdfb1NxXEkfmxp6s+NoOp/15t2UE0ixUT2w=;
        b=jc0ypmdVzkntjQQrxMAgQ1BsHLLIbMhbZWIRa2w9f2Emx7tpng6+k57A10OICM05lE
         7U+TLB7MUTFz/o2qNYS44HbfwPZzvkkuC4uweof+MmqIskki1wPWkWWI7ng73EUfRbFR
         yQ3IntEHjYardwWdpiQIvbhJCETvbzMJTDWBryspNVAx4aMM5oy4R1EgZRIThisWA6kw
         zhqvIvSZPowdJ5vtULreX5nmz5zWx0ktn1jhuj8hN9cwMeW1/vFnptEotlil4D1W+uWK
         S0rAm7Qj6bohXgpq35NjL4RoBIfcx0WamKjFB+ZC3yWKuyomihs0JStX13/D+7sgatV1
         Zu3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784030530; x=1784635330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lw8PXA7wjdfb1NxXEkfmxp6s+NoOp/15t2UE0ixUT2w=;
        b=RFWlf9deisglcMZlTj9oS3GXuf54UgLLaPrKONrWvTYXuBcpz2t4dgxoGeVdeltTC6
         0knJG1WdG4S/PUT5JX1MRdrhrRV5azqs6DVz/6iXx/gpnNAYvsBFYhMuwFxOZmBTY2Zi
         C3P+h+axeiZSF3otn1pE9Q5vp3Nk/vQlITMaygCAV4s8rOZ0S5L9GUmI1e3ueGPw2/EJ
         7i2i6/Aay1Gei/uiPC60hQvsdlTd4oNDuqQbPY2+truTniq1kCGARkl+umENSHsA7kf6
         kAEG365uALTUdsEMAsPCGgk5zlgGm0I9xAD7Yxib7z4Hp/9E5WysovBycv9Iwoog4y6N
         iAVA==
X-Forwarded-Encrypted: i=1; AHgh+RrcwL9Drw5ssSqxlwG1VyIPKF0jeHY3YPThZI1bUAFzrkFa+untcFOW7qLNiKhqvIrTEclqAAwyDoGJag==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPJ550kvdAkKbEMYcpiVmSzb8XESGdOMLtCT5Ts9uqZSbEBL4O
	9TPOlfaZdi1YXPctZqO2OuSpkI2TwQfZF0Raj2wcundLKxPeiKy9G1rl
X-Gm-Gg: AfdE7cksXHk/CcvtG/DlkkLY93tHoFJ6/bcuExDXwGX1JA3Tn3bAYKU66ekRzEjO0Lz
	zl/C1Cx5z0E8wXNtAb/7Hbz4S3eKcc5wHF4z/gL7UQpYYaWrjoXz0TpBctCZdU8VNPnfnNPUnVx
	HcZUGOASIW10vXxW/YWOKuhMw+TuzPVnidOqDOuZ+Quhta6byyYCcdsdfql2QsHx34gU4daRjbT
	M3nlbosXklXhFHD/zLj0C0pavHHOPIS2FDizSFPrpS1c7MFggW7DtnWyD+q9PVPtp7lxwTyUHMX
	qyM1YppBgoclMx1U6YGNX41pv28bvpNoMzCQGQpX6ukB2MTpcNJpse6KfXUE8gGpV139RaRLftZ
	/FW5zL43JiRc9nKcBDjsF6kX7xbjOA+3R2Pdxb5WUtl+ffJzwoZUpfx3VfDAHrPKlw2O/dh0qe2
	Lzx5sERd/86bkt25UNuJ4ff0Y5+IvH5DY2r35enX4UjdFJJ6s=
X-Received: by 2002:a17:90b:33c8:b0:387:e0db:3d8f with SMTP id 98e67ed59e1d1-38dc77c7e06mr11751817a91.42.1784030530297;
        Tue, 14 Jul 2026 05:02:10 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a583bcsm86725093eec.19.2026.07.14.05.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:02:09 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 10/10] ASoC: ti: rx51: Use dev_err_probe() for error handling
Date: Tue, 14 Jul 2026 19:00:42 +0700
Message-ID: <20260714120042.491712-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714120042.491712-1-phucduc.bui@gmail.com>
References: <20260714120042.491712-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Replace dev_err() with dev_err_probe() when reporting probe
failures. This preserves the original error code and suppresses
unnecessary log messages for deferred probe errors.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/ti/rx51.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/sound/soc/ti/rx51.c b/sound/soc/ti/rx51.c
index cfc23e0838c2..46053b8f3202 100644
--- a/sound/soc/ti/rx51.c
+++ b/sound/soc/ti/rx51.c
@@ -418,31 +418,27 @@ static int rx51_soc_probe(struct platform_device *pdev)
 	pdata->tvout_selection_gpio = devm_gpiod_get(card->dev,
 						     "tvout-selection",
 						     GPIOD_OUT_LOW);
-	if (IS_ERR(pdata->tvout_selection_gpio)) {
-		dev_err(card->dev, "could not get tvout selection gpio\n");
-		return PTR_ERR(pdata->tvout_selection_gpio);
-	}
+	if (IS_ERR(pdata->tvout_selection_gpio))
+		return dev_err_probe(card->dev, PTR_ERR(pdata->tvout_selection_gpio),
+				     "could not get tvout selection gpio\n");
 
 	pdata->eci_sw_gpio = devm_gpiod_get(card->dev, "eci-switch",
 					    GPIOD_OUT_HIGH);
-	if (IS_ERR(pdata->eci_sw_gpio)) {
-		dev_err(card->dev, "could not get eci switch gpio\n");
-		return PTR_ERR(pdata->eci_sw_gpio);
-	}
+	if (IS_ERR(pdata->eci_sw_gpio))
+		return dev_err_probe(card->dev, PTR_ERR(pdata->eci_sw_gpio),
+				     "could not get eci switch gpio\n");
 
 	pdata->speaker_amp_gpio = devm_gpiod_get(card->dev,
 						 "speaker-amplifier",
 						 GPIOD_OUT_LOW);
-	if (IS_ERR(pdata->speaker_amp_gpio)) {
-		dev_err(card->dev, "could not get speaker enable gpio\n");
-		return PTR_ERR(pdata->speaker_amp_gpio);
-	}
+	if (IS_ERR(pdata->speaker_amp_gpio))
+		return dev_err_probe(card->dev, PTR_ERR(pdata->speaker_amp_gpio),
+				     "could not get speaker enable gpio\n");
 
 	err = devm_snd_soc_register_card(card->dev, card);
-	if (err) {
-		dev_err(card->dev, "snd_soc_register_card failed (%d)\n", err);
-		return err;
-	}
+	if (err)
+		return dev_err_probe(card->dev, err,
+				     "snd_soc_register_card failed\n");
 
 	return 0;
 }
-- 
2.43.0

