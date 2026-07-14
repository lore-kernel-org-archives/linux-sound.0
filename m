Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009CE38C2AE
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 12:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784030521; cv=none; b=FGNRbQWYV21mJISU+p48Yoh37qrlROOeA4uilsk6sz8NwuyqoqupBU9qPjmm8thm4J89zqemQhH8XNH4JCXhkm2/MsH9fGcPcloHWJe1V1T74EVNl6+EuKA4gEa47yuJuyfhOz5TzqNhYID0i2Yf+/EjYe8D3guFcw8B79UUxCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784030521; c=relaxed/simple;
	bh=XWDzYN/QmDeP+BMWU96Wibo8K6xDaS1cOUFjBPJXQQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uMj33YSYYoTh0s4h1Z6/4F0AnANcO+8yKG6gcwV7768+aZjoM97MpO8CwUldwdjEIYX7TuNwckFh4gD2GS59LuFDGK2NQ2kinCbMWaS2HmcftZb86dP49LLPjcJAEWHaKxWBjyOD39pSxP/AUIT80h+gu/kv8GhO9pYKXoCrVzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ouusHWBs; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ouusHWBs"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so2859923a91.0
        for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 05:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784030519; x=1784635319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=06ntY9whyt2Zuo8Uv5yBesP3vRYcbp6uEAMZexttM1Q=;
        b=ouusHWBswmaecj71e2raeNOShvorAgvc96mxNOAX11kw7qXObLOORcHn6h4GwTHKCf
         XuHgXoIMtsCtlGzPHURjPtHPOnj7NY3xathGCaPQpMiriEHZ377ScgafqT2K8ubdHmbP
         ak8s9Vy3R+orYn0woJ/d4CALuot8Z4nLIxQaMrugY44+xwd1gtOyXxhzvc9E2UrMYxAN
         bujFdUnD+hCYvQ/rpMiyFt5bp+RnPhBmwPoY4P9WqYkczWKdV4lIIhFNhXHJjsYp1tE5
         RwVw3ZWvWQ2fnFAr3bZgVJjJiPqizEDAzCzJERnHZtTNY1M9eDdsmSq/ECCBavTGT059
         9wgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784030519; x=1784635319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=06ntY9whyt2Zuo8Uv5yBesP3vRYcbp6uEAMZexttM1Q=;
        b=sE9gSwXk9hl29Fx4ah23Pzz6kbjo9Wal5U/nTa3k3cpSdxexUJx8eyq8Vku6/Hkq8u
         JCXFIhrQ05PdTI8zQZ2TS8H9nIZkZm9YAB0iHZdoWtHGFEsoTrHGNI2EgHFbefvdREDE
         QXuZY6w16KlPq5Hqtl17EGtPA5ZMYCKB1NVkBxHCGJnfZYi0nbWGsxJao1b+CjzZysq2
         LFtQI/KIMh2L6QpE0vTOhH7E048KZDc21N1OSn6JEKnnmFQpNTTSXvuXZ1Od6yQh4rBm
         /ZmMMUbPNh2ofzRlX18Ci3zPx9CpXOKwFrYnHG0n15I7J0AmlIVb/N2iF7c8bQ07e+Fm
         9f9g==
X-Forwarded-Encrypted: i=1; AHgh+RqoZrQ9a1ejphNJX7fjY+QWou73RKolTdM6oNbiIGZmqS9gz7YE2NBquFY+e/AT5gVd3Ox34UzE+K61dg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNTic6LQIwInvUK56Znqyk147kdJofcJ8qeHp88PXOx4y7CgnI
	sERAtIf9UQPkZ6+8CJDpDsffLSEIhdsc6Qx6WLh5eousZihJwqiymUlL
X-Gm-Gg: AfdE7clVHi9xyywT0qNcQm1vuC6PBjKN962494oJ2UT58Tio+WHpcVyKSEPTLph1DEM
	uPM7rH9xcBktSFTEVYu9EQMh7hEFikBiS/EZrKRRsHyC+9l73zKDzcQ9Qd991HSS2ig4ZPPQVhS
	tuWDF2P9NLIB+UanphjmZvEk6LRqqdaEcU3avxqDfOc9Ay41cSHDmvEAfzIeVQJ9KVTZP0+mrw0
	68zqQVxsePW1mxq8zrQ69ysv1zGdz/MmqLvErlB30gH+tsQwiF/YrVH+ZW3qd+kNplOwRDLgA+d
	6SxhEqdGtFESZjWfvYbxbzBTHHszdRoNiR/lD48R4x6wNGJ0dZpW8zm2r4vzDIlM7fXopjqL170
	GdtiWE9DsPFRquCCZqeZXn6fzeKxpVUfOYhQmFUcsXw439Asvb9WxTFfWgxgJPJvXFCbsI0Th5Q
	zUdFIogNs8sZYWlxpmFGQ4PIj2h16dSBD+GYZgILtuKI+ljFg=
X-Received: by 2002:a17:90b:35c8:b0:387:e0cb:c8dc with SMTP id 98e67ed59e1d1-38e1b00c165mr2212750a91.37.1784030518918;
        Tue, 14 Jul 2026 05:01:58 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a583bcsm86725093eec.19.2026.07.14.05.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:01:58 -0700 (PDT)
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
Subject: [PATCH 07/10] ASoC: ti: omap-hdmi: Use dev_err_probe() for error handling
Date: Tue, 14 Jul 2026 19:00:39 +0700
Message-ID: <20260714120042.491712-8-phucduc.bui@gmail.com>
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

Replace dev_err() with dev_err_probe() when reporting
devm_snd_soc_register_card() failures. This suppresses
unnecessary log messages for deferred probe errors.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/ti/omap-hdmi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/ti/omap-hdmi.c b/sound/soc/ti/omap-hdmi.c
index e60f5b483fc5..72114965c37d 100644
--- a/sound/soc/ti/omap-hdmi.c
+++ b/sound/soc/ti/omap-hdmi.c
@@ -375,10 +375,8 @@ static int omap_hdmi_audio_probe(struct platform_device *pdev)
 	card->dev = dev;
 
 	ret = devm_snd_soc_register_card(dev, card);
-	if (ret) {
-		dev_err(dev, "snd_soc_register_card failed (%d)\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "snd_soc_register_card failed\n");
 
 	ad->card = card;
 	snd_soc_card_set_drvdata(card, ad);
-- 
2.43.0

