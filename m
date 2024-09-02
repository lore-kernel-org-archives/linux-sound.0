Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CFD1865EF
	for <linux-sound@vger.kernel.org>; Mon,  2 Sep 2024 20:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725310696; cv=none; b=eoJUBVh496OtZ+AuzFsqkBsorCj29l3wEPDfCMH5bFjGEwEhG1cf8a9ubpPC+NtAFkYiFpIJNULw4Tzqn/Loe8lwct4yBtDUlXpRSQmZFWV29eLwvvVq5SNEGgHrR8FrHpVHOle7i/j3Z8GZ/wIBVoye4xekt6lpEzM58OKlefU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725310696; c=relaxed/simple;
	bh=Y9NoihnXbhyEDsggtq3HmKs7YbxRFud3+UJiun+1zrw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ubbpd3QsMmz9HB1SVmAd/Fl3GG5UxltysfcT8D/rjBUzS3PCFhFhJvWE0fpVUB4+k5nQTUHL9ay3LaLZdlmpLQB8cKFD2npIkkrIUQb+IDeLVf8RUe5/nRN6IKKysTCKF8fykyFZIkGVi+fdUV1ghgXPyTC5aScxOOXR/XZ/l/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C5KgKZbC; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C5KgKZbC"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-70943713472so1948932a34.2
        for <linux-sound@vger.kernel.org>; Mon, 02 Sep 2024 13:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725310694; x=1725915494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4zw99bq/N2BFfLeqZEocVsrgpO/DJTgOwgHDfuN5f8o=;
        b=C5KgKZbCUiJuHsdMjoWiunWAuUjM1zjMt+fG1Ds8djPq9ATVofGLnHLIs5xBfN925C
         ETI9UMEFXcIYuadR5ilTDFH3Fzg7uHPRu5A2+MXuA3Hhd8Cwl6tt4SoPNCRWnBKnsNVH
         Bbt/vlPtOW7+LCx2gHv/rk5yFVO1M5i9js/0Lt8D+I/P4rPAYGxwA+XqvZ24F8J2ITo5
         mHnDpio8NUQ58SKNC+aaGyRFA0q3xfL8ceptGcT8hkFq/QJbwVOYjfYjqNq7Spn5G/6s
         cr9VsqG2xLr7N2vidgSrVg79BYR1Rto1px03l+GU2CipeDkaUXPts/UGb+h0vt9J6eAY
         9Cww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725310694; x=1725915494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4zw99bq/N2BFfLeqZEocVsrgpO/DJTgOwgHDfuN5f8o=;
        b=vP8U/ZRVG9Kg9zhzargKHt3kE1g1QkCsBljO0X/P5QkwrUsJ3f/VOyk/VilUeTOK72
         cIYGGHk5ZI70qsUN1bP86zDqf0LglQ8dPdiYgIVOU0+IH2fbMWB/D0aH3AvPibI46OB+
         iCp4AEm8bIMpoxhsjd/ZMC5wEebgZ4edkCKWgfOxpBHOV9hX9yBlR2fPmGSGiGBNStEF
         cHYmXotrUciIvJ7dfqaxUK5d975Pf+y972cvAg0fNz/+KGTa9I6v33uLV42KPnsnZvsA
         nzzQ17LA90GLu4VDLlm5D7AZfZx2R1BZ8it6bbPKEaDIzBKP2Z+LWQmfZnk3WTtCqLCa
         wH6Q==
X-Gm-Message-State: AOJu0Yxl129u1oX2/zWF/0aXyFPyzUSHTYquxkSXFKM1HTfKdYD3IWwY
	fUSRGNCsz0ZIC6lpsWCpcFOX8Gj3kIUULZJ6X+mgFBda38JY9R/8IvunXw==
X-Google-Smtp-Source: AGHT+IEXSDRcSgtmli2S+HsVy4N/V2qTgONv5kMZqSn8WFzebvyuBi9s5XrGNrruVWUYV8ZiVSEWsw==
X-Received: by 2002:a05:6830:2693:b0:704:2748:5ab6 with SMTP id 46e09a7af769-70f5c3a9941mr16184100a34.20.1725310693754;
        Mon, 02 Sep 2024 13:58:13 -0700 (PDT)
Received: from victus.. ([2607:fb91:eba:13c1:5e02:c9f6:8fb6:52e7])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-6c340ca56f5sm45415566d6.106.2024.09.02.13.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 13:58:13 -0700 (PDT)
From: Adam Queler <queler@gmail.com>
X-Google-Original-From: Adam Queler <queler+k@gmail.com>
To: linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: Adam Queler <queler+k@gmail.com>
Subject: [PATCH] Enable Mute Led for HP Victus 15-fb1xxx
Date: Mon,  2 Sep 2024 16:57:55 -0400
Message-ID: <20240902205755.22233-1-queler+k@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mute led is controlled by ALC245. This patch enables the already existing quirk for this device.
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index af3111d618fa..0288b3669564 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10300,6 +10300,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8c16, "HP Spectre 16", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8c17, "HP Spectre 16", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8c21, "HP Pavilion Plus Laptop 14-ey0XXX", ALC245_FIXUP_HP_X360_MUTE_LEDS),
+	SND_PCI_QUIRK(0x103c, 0x8c30, "HP Victus 15-fb1xxx", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8c46, "HP EliteBook 830 G11", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8c47, "HP EliteBook 840 G11", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8c48, "HP EliteBook 860 G11", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
-- 
2.43.0

