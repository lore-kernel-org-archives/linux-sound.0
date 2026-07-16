Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EEA3F9F48
	for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 09:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784192968; cv=none; b=piKxLG8e9rOyVml7h/TTO5QsU/lzkYocM0KFAH6lfVVaOHcoDECgTh91AHc6NXPp0gd8DWUoT57/vWVOT/POsO2J2jpSiV0Iz4OUDsdW+qCVH4PjFW2Tw0dIf1+LSiEhYrWrkwGhxWk7dp2Z+mduUQLV/NGO9PDQOE0zKREx8k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784192968; c=relaxed/simple;
	bh=jIfPIVoUyA/INjY1+gAHyG2GIm/f5J9x2F0XjC4jOCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B865MhX4HFRybQpMHOL06vjbSyv/9vl0inXpAb8CzqSohFU3a0rWLzpJvtjXhhtHV2xHUdCQKMMPRodp7w9j8Aaxw+8e1SiHU/MzC4mZ0VEeojdbgS4iJhz6Ap6JxwQwt+eqfMLThEwDaL+n7Flyw3n5DupoVzBmNcBq9x/I6rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iqjm+y45; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iqjm+y45"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-845c92bc464so2974549b3a.2
        for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 02:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784192963; x=1784797763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lw8PXA7wjdfb1NxXEkfmxp6s+NoOp/15t2UE0ixUT2w=;
        b=iqjm+y45yqLaYETrXoU7CWLav91rgBl9xAqdNzK1PHiyZ6Xu/9aAwpLCJkYU2DvgBb
         PKocRQFzFa0R2Hu3yc6Uxo1eCIubIacVozsqWhqzcD46A+pejWhCYhL3ovYA1cUrUKWj
         R+o0JsiI+aNIGGXxf+iPU/oBowW1Zbu5mf2R9w0XiXYCp9lzgS/0o8z4gfMemI+Gc0zV
         a329ICA9s/LjQK+eEU2droo45f6u3G4scWMjsMsiDgTV+WyZTJei/Wb0efI04e9ywl3N
         Oop/EJ8cBQprtQAifECb9ZB7AVpF8U1hvFkjW3duXLvnXbuUu2nFe0jeIEamN4LdYIRD
         kJuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784192963; x=1784797763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lw8PXA7wjdfb1NxXEkfmxp6s+NoOp/15t2UE0ixUT2w=;
        b=qZOR2cUsaYrWag9hxehZ6vz/A3pn+vXpQfpS2oiIpEFmG2XHdeKGMJNsFWbAfQcIEf
         bQYut/0YAe9bSVke7RqZszbOz+yjks20w98yTXeMB5W+3s/BfcjwLcgYIIp8X9Pf/e3f
         b423d62x6CciYgbhk/Q1EwWSO/EozAgp4O9yJ03yyeKeKHcz3EKWkLhFIWoa2+ENWTUV
         G5Iri3oY+dkd9Bag2tIAg7nAhlm0foMpRvostBnIuvAnv/TkY4eFSH/r+M31529c6OCj
         BGprcHktuxH0OyNJSsi3945avwO0TNfHjrScwhO4NDbyr3kI5xETgtu4riGodjM71xkv
         vXBg==
X-Forwarded-Encrypted: i=1; AHgh+Rqoph9cyGQQBAkLiEjgbxjN4OSYasSHdywnYEb5mNTAtyEoURihc01USR/t10wCzvgTRmWJQEY+7MpCwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhLpMDr/a9g2gDqPDykuNf3GD5rFNiBWvkl7+rPDa871MgrbQP
	UU+i+oFXrhxc3oQmrDfGMNzxN+mNZrgbUJKIB4AdoTmwVIMvc3BsjTS9
X-Gm-Gg: AfdE7clkvH81fN0sGKZKZ5E1JklSb0JJ3emla7LgEfSWBtWQZZKfXcpwmsoMbpB81zC
	+Z821LXMb91VLxE9Dz7raCDL8yIynOcvdYnEzdwgal3JtfVwg/74DBtYFbIw6sRjAiBOS8dX9MY
	/9OWb8bpsBod4MflvcmZ+vlFHb+bVhw4h04zuaHfRMaAGUfwU1VtQuxhd/qRhQd5PLWPJ2jfpmP
	0vQayFOvWgMBwENtHt4fGJKDKbq6gZC8OHDiKpPKEpr2T7+LmsoLih+BxVtPfT9MKOXn7rUz0Kv
	AQX/huoYpKbzQRjF8YWzDUDykvJC317SGoEkZdy+din6YsBYzqWafDdRbCWYJgxKKQKSeIrd069
	c5D9tKTupiy0wKPW9Y4Bi83rHYKgmxwaE9EQ0mJObXwXD6haNPSfqpd6+sRkslE0NwNAzg3zTbG
	r1/WZPNpuxeDGlhJBqv4OzcaSw0qRUHZES4jGaGsOVm6F4c38=
X-Received: by 2002:a05:6a00:27a5:b0:848:7f8a:8d0e with SMTP id d2e1a72fcca58-848896eda57mr18762333b3a.55.1784192963447;
        Thu, 16 Jul 2026 02:09:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f6bf5ecsm4511800b3a.29.2026.07.16.02.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 02:09:23 -0700 (PDT)
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
Subject: [PATCH v2 10/10] ASoC: ti: rx51: Use dev_err_probe() for error handling
Date: Thu, 16 Jul 2026 16:08:29 +0700
Message-ID: <20260716090829.72082-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716090829.72082-1-phucduc.bui@gmail.com>
References: <20260716090829.72082-1-phucduc.bui@gmail.com>
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

