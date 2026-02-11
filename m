Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC6E1F419F
	for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 00:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770769404; cv=none; b=pmH4e8bLHgV3dzymHG/bvSjR+xQWBQkI0Em5PQUHtfzTdj60cWx6nX3KpWA91LZa7ykoU/f+lnpYtz6afiLSgsxhpE95SUXausbCeWUGa+4Ohar9Aunjxk01c7I/OnFUUxtLw6qR+nb1VtmFwQvdFMNwHw60OpKlam93pSxvLWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770769404; c=relaxed/simple;
	bh=zjnSdqVkVaoHQrO03XCxlVruAUnMFOShINCIrN8MR9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y95aUZijSFdQTJ+ojN1IwEiowOu5oas+7jV/356GIioaXkqVMsG32lwwpoeR4gz1ZVNrcMKYxlxZDwc44hHhTSq+33+rh+SHalDCjgRfDDRPnyPLtAzbuqqVWafa4PzIggpwGm9LUHE/gmw1Xak51xFJB8OAqjZSyAztnwf7nLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fefft5mk; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fefft5mk"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b885e8c679bso651426866b.1
        for <linux-sound@vger.kernel.org>; Tue, 10 Feb 2026 16:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770769401; x=1771374201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QVUmABIw9GwPlMCIzNfdjfNTotzrtAIlHX0zrtN6WRc=;
        b=Fefft5mkLS8OMMyHlDKhU5OskD/iYww7GyVPfarBD5tMWN8IPgS2IMtlzikHwdoie+
         vX+rdEo+1FtVdNQbSngwIAEJifTYDeaO6u+FIsNbV600trdsAowwA6YX0jBpJX2KRrbp
         HvNfO4DuqnfaXnOYWxVv0GCaZ4xYbUehnPH7v4wDJtK31/Zny+bDwgJOlV6yx0UkP8EV
         udvHJOL24Pt/2yeAGho0hriBmzUiGJIVr2wior21wMzQZSxBnUxw9qhPnoIjQYW8P6Hj
         Iz3N9/iCwX5OjIuUP6eQVxXahQ3iA2XnvYsJdSHty7TOCgCqIpNK+Ps0FY48bZMe4lB0
         BdDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770769401; x=1771374201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QVUmABIw9GwPlMCIzNfdjfNTotzrtAIlHX0zrtN6WRc=;
        b=pmgJJMf+c5LgEa0g51zwNsvFpI8KvFOzxRhDdvm5WdDNVVxBQoonH3tWCvJoB77Xaj
         8jRJxt5xVpHaguxciRpK5ahr+nZFNy/PoGX2S9ocAgIdg0avQRGCZDilKeQWp2xahJ5i
         QPjG+RjJR3CIWsyBhfwPVYvwPn/4Ki4iP8dIrtoleLPM4zYHaw1FldxFazVuLsll/7qP
         HD9axEmhjUjq3c70eu7hGnE1QHvKl29Ctct13Fg9MdAp9r7Zj6CJs0JxE0vycQnXm27a
         dT2nQUcKmYkw8UhI7tjDJtlpTm/N7sJbTPEuyER96kwMi+lTfB63hYsxTudTeRG24Bv9
         YL2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVBec51sTqFwH1O9UjDRBH3q90Q88YGbIRvwDtOXPjHG5q0hyVBh3Gu6BcW+glhMrHXQagFxw9/EkEOZw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/Qr/IthmK7XoaS0dhE8B3MSmAPC2kiUEKx02dzH93+vi4EerG
	bza2o9hLr8KowHrhDMg7B6/jVwU9pUb4AU88NjB3zIcnSnp3mDhaCCLOm9w5Zw==
X-Gm-Gg: AZuq6aITiuBLWIu4XZlShO4dk4oy1SPnCW//cgyE0HjIFkrBolgxDH2AHf5oyPxWzbE
	J2PVgTyVOwRzZFdThbU7tR52QKqxGBXNwPdh/0wi1wHrg0bdolAaqiWHK8SS2s8UXc/izT5sPLO
	83jAUWpBOxmmcMtj47/6V9yqP92mFAs3GiG/lay5wzDrYKLhcXEuaENjgEtLqsSp+DQBhJ58ZTD
	kYsRGEV1ZfyMmCoDoes+7KmFcwZynTJYyPbxKD7ANVEvwGrF6EZhGMSG4JVK7GPTd8kWtUWIHqP
	QjeVIGBySACb5YpuRMHdm4RBuRU/6ll42XWi50KQIiBwmKk1Iu6ipAUHZqgaOpKB8tZfe/27laz
	U7lRx1SJsJkG3Udxm2pWQyeklDL4bAA6NwgmQa5iLEksR7yaC1QQaDQmPid5U32jToM4oejJN4v
	samhXAZEEVJjBFGWh2xEn5tk85
X-Received: by 2002:a17:907:9449:b0:b88:48ba:cdd with SMTP id a640c23a62f3a-b8f6ae33146mr61763666b.43.1770769401310;
        Tue, 10 Feb 2026 16:23:21 -0800 (PST)
Received: from jekhomev ([46.251.53.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6ec1db0bsm9992866b.46.2026.02.10.16.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 16:23:21 -0800 (PST)
From: Yauhen Kharuzhy <jekhor@gmail.com>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	Yauhen Kharuzhy <jekhor@gmail.com>
Subject: [PATCH 7/7] ASoC: rt5677-spi: Add SPI device ID matching table
Date: Wed, 11 Feb 2026 02:18:39 +0200
Message-ID: <20260211002255.4090440-8-jekhor@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260211002255.4090440-1-jekhor@gmail.com>
References: <20260211002255.4090440-1-jekhor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To allow defining a device in board-specific drivers, add 'rt5677'
as a supported SPI device ID.

Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
---
 sound/soc/codecs/rt5677-spi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/codecs/rt5677-spi.c b/sound/soc/codecs/rt5677-spi.c
index 885edcf0a3a5..548180ec5762 100644
--- a/sound/soc/codecs/rt5677-spi.c
+++ b/sound/soc/codecs/rt5677-spi.c
@@ -624,12 +624,19 @@ static const struct acpi_device_id rt5677_spi_acpi_id[] = {
 MODULE_DEVICE_TABLE(acpi, rt5677_spi_acpi_id);
 #endif
 
+static const struct spi_device_id rt5677_spi_ids[] = {
+	{ "rt5677", 0 },
+	{ },
+};
+MODULE_DEVICE_TABLE(spi, rt5677_spi_ids);
+
 static struct spi_driver rt5677_spi_driver = {
 	.driver = {
 		.name = DRV_NAME,
 		.acpi_match_table = ACPI_PTR(rt5677_spi_acpi_id),
 	},
 	.probe = rt5677_spi_probe,
+	.id_table = rt5677_spi_ids,
 };
 module_spi_driver(rt5677_spi_driver);
 
-- 
2.51.0

