Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B2E40B36C
	for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 10:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784198409; cv=none; b=mAOevYBy9/mPmTBiSMGzkFxkrQMb61b9RR9VWQhu5pe/drEdST6tnvGuxjw259psjUMbLVqkRWKEzguVi06sif6gHx3xkoTz7UgGJzpff9IWsV+PeSNpJDTIEOImVkALZkHARV9S9XWrh1whyJzNPxTvf0shlm4OduYcYdGL9cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784198409; c=relaxed/simple;
	bh=Kfdef2IapxrDty2M4zzD9vVHpmOkiH3XpVrKCSLWpf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LJJkoBxS0EySldOrWJUHcYys2Bm6ss+EbzfEC1pRmcEuHuzACuuJhOxADij43ipRjud0/krHxfLoZLBGr/PLam5UUSjyWmpxEjwgy3larnmk7HRYzXu7lj1R2T7RZPmQrMNhVXxj1Woui2DOf2F0GynSU56x5ZU9ZtB+4g5bW+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jJ58XpYp; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jJ58XpYp"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8487214ad2bso4387711b3a.1
        for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 03:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784198406; x=1784803206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k28JGgDZy/pa1XIDw5BvJYQMqTQLHyZS9gnbAcvARGw=;
        b=jJ58XpYpNKetm12/uxB5oN7ZAnctptzVNTMjY8Ggqea1reMw/2GihlT53rJUshO0tP
         K6yxc5RcHY2/n07D5v6klVbwOoURTf4hYUdl0V2smgw7sT5gAJTwhrGhrbDAgWhbuE0Z
         sVuLhuCrWpmXzmtOIHUtd5towjAO6kuL/0pN+Vkc51QdymlQrMjBlPuncaEhNE/+yP+C
         g7qy69iM/W4jDbAc+r1SB9JEWe37OBNoSPVI3KmTi0Cg2bF+zWHKHO2qxekskHA/bkgx
         zqAdMvfvIncegOVvPG1Zsb4w3obK6Vfbyu6FeIJFkSEAOqQXjQ4bS36YW1gpVvRHQZDf
         PA9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784198406; x=1784803206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k28JGgDZy/pa1XIDw5BvJYQMqTQLHyZS9gnbAcvARGw=;
        b=NVjI3SgqMwd+pHS0Cu5Vk5lqYFobilCX/j8PNPb7ZJKR4he7t/P2Ig7APkSikATwUZ
         ouAGHYHEzi7hOJi5jp2xAIaK/4UCMKBwwrVDde2+dHtW946WFEeCWOsPLZqYoP/ncbNT
         7dTN2WZMkG8BD4PRPL4xd2kDFnROvJH0hzMwMuFhRAyshUTYo/Rl7P3ydyCJFnOgKstD
         mpmSJd3XOu5Lu7Y7XcDTnOhJZ/yvYxcpBZh2ZfFeD9lvxo/Zo9EC+ON2z/QAF800ZgdJ
         gj6p/2yj7ck9QcZTjBR5R5l829P3AabISq1dl/lOEkqf2ZoCQ0Mhc+xObfjqof9Shs1+
         ew6g==
X-Forwarded-Encrypted: i=1; AHgh+RpV33/zZTEyRRAHmLcffSQ1oBGZzcT9HDDdbKhUigbhb/DmNMmJkRHdsmqPYjdOIYd5x5WzpwuZXTOzMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFTH6xFAP7QGnBmW4BvK2RExE9Fo23497hoQ6Y/LeIi5zSBn5J
	3ADuYb5X7/slQa2QRNK8SXQyFYdq2est+aT1G6DrXS5lgtpieUy2FPQP
X-Gm-Gg: AfdE7cnLwfneh/zoiNA9OVWodHPIhHOkdfAFDEVa/2ASR1a0zxHInxwWKkOsfOcRrKd
	9CL2RZO8ez2IwlfFp5Ysnwcj988W9llBsdwpJiLi6UhYQKtiiNZheEyJixAVPotS/Lgj1sXOEe9
	VaGL0XfVfv8Xrw1BbCJEw64Z6tBE6yv6+DVmjTEPLqz4M3Cw5RGl7araTIL5jUbhowIkmCMEt4Q
	NsY3F9AYqTtYgMBuaCYUXicyMOFE5CC46RWsTYo7I8FLG+j0CQ5x6J820aUjyzjz+TvPGAB6STl
	MX9qBjzgXwID1g2Gp4nQr3amHe95N/twX6Az785pI3Kc2aIXv8PwB0TChN2IY2ge9t3MFrCRdsE
	IxAJHEVRgfuhQXQ1XS/4bi6pQyguq9sKFKkzZyIHcR5Ba0JMtYMWAiJtR5XdNQKmfz6CApUFoiN
	3jLsZoI9aIDRI7qnb0j2fih3Xxgi+tCkhT1493tXUBKl7aoaQ=
X-Received: by 2002:a05:6a00:3005:b0:848:76af:db34 with SMTP id d2e1a72fcca58-848897b575dmr21214485b3a.76.1784198406500;
        Thu, 16 Jul 2026 03:40:06 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f266724sm4757331b3a.15.2026.07.16.03.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 03:40:06 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 10/10] ASoC: ti: rx51: Use dev_err_probe() for error handling
Date: Thu, 16 Jul 2026 17:39:11 +0700
Message-ID: <20260716103911.77652-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716103911.77652-1-phucduc.bui@gmail.com>
References: <20260716103911.77652-1-phucduc.bui@gmail.com>
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

Changes in v3:
 - Add the remaining missing parentheses to `snd_soc_register_card()` 
   (Cezary).

 sound/soc/ti/rx51.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/sound/soc/ti/rx51.c b/sound/soc/ti/rx51.c
index cfc23e0838c2..b13faf162c75 100644
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
+				     "snd_soc_register_card() failed\n");
 
 	return 0;
 }
-- 
2.43.0

