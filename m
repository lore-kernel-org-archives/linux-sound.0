Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B170D3DFC6B
	for <linux-sound@vger.kernel.org>; Mon, 17 Aug 2026 10:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786963792; cv=none; b=WCJUY9s6S4WhFrUb9bdO7P8rVf/duAD5EqeynHp5jfhIn3bBAzQInj6oHRaXslyF18iS54pV65P6Ym4d3f+4Q+V8Zhwbg9RgCj4NjV+11QwRQzbq+oClN2J+hQVNJ+djXsg/atFWxqhB+BwVs6aACz3Iq45Bl/pJq0DLGAzZ1kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786963792; c=relaxed/simple;
	bh=N3B3zMuQcKRQ97ubce9fj+1zpqAhN3fKNwvgk80pmBE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UKD3CwwcawcWpJ5uMUXFpCSRhBs2FRfAwpADO/9rVpLKqvk/+en+e4aYoz8mF3cLJI3h8ThPD7H4FTFlQ5V4KeXGC6GjN4/7I8TVad+WEO4JWEyGEZ66FCOwifQdL82H3lEIe0p7diqajSpd1Sls7cfRXU4cn2f0b1VB6ctfL8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yk+zXudm; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yk+zXudm"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ceb096e675so36569855ad.0
        for <linux-sound@vger.kernel.org>; Mon, 17 Aug 2026 03:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786963787; x=1787568587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cadsahqjLazEcjVBRLHoTynOryS0XWoHrk5/taG4WUA=;
        b=Yk+zXudm8Q6+zK3Hxtc7kqv3LjZnURGymFzvG7LOZ4MU0Hs1zJ8Z6VyKjeXcFTHiAX
         iNGZmmh+tohplLSuytrJlz3P3/QtzI+7TdxKJpbfrBbOD3YLdhOrEPaUuJGfZ/Igl2DR
         HpYEB1OTlHKrTa0Xzyw8+CCqTdWLJM7q5QE1mj2QQbAYSl6tPd61bAfex3rS0DoZoCgl
         Ea6e4DOhv/W2ItiVzAXGc3quSIr3uYLTeXUzltXdEgQBFCRWObRHmq7i1xX7ERbEdEHf
         RqwIEsYkFqBEIj0EWyJQjjbatkPXP+ydnPHWL8Phbf251zoxTy+bX6QX3s0rpFVuwM+w
         oGhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786963787; x=1787568587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cadsahqjLazEcjVBRLHoTynOryS0XWoHrk5/taG4WUA=;
        b=IOjMbvQpx4HmgCkfxwVcYBXvdoGfAmXXiHtIulLuTBme6Qh4utrheo1qV6MciSI6NE
         sjjDdPUj7BwbK/eJXkT0lE7xHPCnmAfdJU95qQtkzNf9WmnSsAbrLCOETm9o7kzqaNkm
         LzlnK/x9swvxnanTo7mEfxHSKR6XbEWeSOAPCuPvOwxOZvgwojD43o5EMSkdZO78jDu5
         DjxRZokzc0K5qm2IIglnIMz9eiTFQ708KnX3V23T0BpbKD3mWspglu72UVmBUy58XNfb
         1HVjqSEC170qUDAlBOXtaXBb9c/xFFPkS/tyVGvqUz3ogyGt/kZAt2XkaW39OKBZIowd
         18+w==
X-Forwarded-Encrypted: i=1; AHgh+RpT0BebPFwOn/hXGTl8+C5jRJy7IdNMEX8qZMj9ZoGY7bnYMEvrngCep6OH8uZZ74CXjUc+gpAoT+h2VA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6c0WzNC/hpXKCFl1J8rrTOLW7lgJI5KPV+eXZ7DlRzhH4wOru
	sWZWzYk0NVw//rA7db6UYOpN2BVtEIkEKyhQoE+AmJ1G4Y7M65s7YUyG
X-Gm-Gg: AR+sD12vEDOwmmHrhdp3lMAVOGV0HLIPtELE0uPn26H7WU5icYAfc4xoeMNsqK7556H
	AVU3CyEqMKYTA7EQwPdtp8JNowhfic9EtMoTHkd8tgbUv/aVpHSDM0A15eA/D2QTB4WYf+bY+0p
	n6QR32Sj95gJgjM2LxiA/RfeTcfbzD+tngPFpv7OX9k+dG/1ufJ9wk78QyUx5LyzoA2aFnNY1iM
	UG6NeDiEscQwIlzAMV1JpPaofly/dU2tEzGfhh8taibfyyCLkmXhAHkDdXXauOlKBHVaZLDm90X
	FFUeuWPFXvWgACtrGLJHoTzB7mC4bBG47ET8ehZ8AW9Kf2j/uicjrfcuDTz4vMd5rzOL0U0iE4N
	OcExZcHpN9ZB1o1d2Hmj7dfsXAw4lHyX8w8dS7gY5zZTFaM8Rrurc0EXYw51VBJMJY4vL5ma5FQ
	d/DlC2oqD9/FdlP6zNlSJZ3+dhoiR2pgKSqiDTObM0xgEYAwvmmSsDzuTRJ6epe2hM8fHlnPw1Z
	wVW2d+MH+Zpgfu0flzflXwjoxleOslTO7D9g88A81hqxdUCh0Hil4BiH6c64TfI2zNM2DcO+wce
	yPHR
X-Received: by 2002:a17:90b:39b0:b0:38e:659b:f366 with SMTP id 98e67ed59e1d1-3933b500d17mr23620416a91.0.1786963787161;
        Mon, 17 Aug 2026 03:49:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d38bd51sm1885413a91.12.2026.08.17.03.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 03:49:46 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Rosen Penev <rosenp@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/3] ASoC: mediatek: mt2701: Use devm_clk_get_optional() for audio_mrgif_pd
Date: Mon, 17 Aug 2026 17:49:27 +0700
Message-ID: <20260817104929.63152-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The audio_mrgif_pd clock is optional as some platforms may support the
BT path while others do not. Use devm_clk_get_optional() to reflect
this.

Propagate other errors to the caller.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c b/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c
index d217f9320ad2..18f0f27bd8c0 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c
@@ -89,13 +89,9 @@ int mt2701_init_clock(struct mtk_base_afe *afe)
 	}
 
 	/* Some platforms may support BT path */
-	afe_priv->mrgif_ck = devm_clk_get(afe->dev, "audio_mrgif_pd");
-	if (IS_ERR(afe_priv->mrgif_ck)) {
-		if (PTR_ERR(afe_priv->mrgif_ck) == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-
-		afe_priv->mrgif_ck = NULL;
-	}
+	afe_priv->mrgif_ck = devm_clk_get_optional(afe->dev, "audio_mrgif_pd");
+	if (IS_ERR(afe_priv->mrgif_ck))
+		return PTR_ERR(afe_priv->mrgif_ck);
 
 	/*
 	 * Optional HDMI audio clocks. Platforms that do not wire up the
-- 
2.43.0

