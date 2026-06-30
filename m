Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20ECF1E1E12
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 06:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782801422; cv=none; b=krlfg9aSSV59JC8tfXwsekVHHmy/mFeykuOriiCozviYxFMykftZBk6Zi0t/0Px+v4IPvwnXmKybqbMJbbMTktMACt/C2pP9jUimRWXGT00tFZRD/Np1aFVmKmApfEwmGxATu5ygEMnlHs/sx5SSNThWoyS9HaPbgBxKcM+V0J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782801422; c=relaxed/simple;
	bh=WwNjHw0SRNfo9aeoqwnXMQdjAxCjVTDeacaiflJQe6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dd+XInUMlRX0f16Hp2Xe2EETj6XIp8fqvLZ6Ll1454U6MyNlcFqcRK1e6LGnVB8afCX43Whh//EftuoWeatc4k6Wt8LMRCdK2BtqqpzfRx7r+T+diiMCqYYZJwhIfYRuqgkoOjAM3Rmm/h4URW28ePnf8qrdajuIAeZT/C82/Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XbHWHY+B; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XbHWHY+B"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-842338c18e0so2850187b3a.1
        for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 23:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801418; x=1783406218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AtVsXFH15IrgzMd0VFvy62roDSh+hKjqh257VzvTJMo=;
        b=XbHWHY+BLMmNOJtfW5rZ2d4xr1cy+xEwg0zXFMHavzAMPe4QTk6Na58eEe6TbVB69l
         vHXdw/zosLV/iV6Hc/nU4mDpXGrHb/2JHiT9hQ9U3h1DhbrQrKkPhGmbXtTRNSSC7Ix+
         tI8Wa/4H/AFGidx5IQfHGiHIuHw2j3igrDyfRx6V1buHqPIZq6NCbfLo0X+rVIV8Koqk
         1VnUjssuAnWtL5SaILrFDyIj70NeGONR9kq2TP/1EsSudqdi2Dyi/Tx9K1RFJ7YxtMEW
         nDIbr6SAm2W0J3zSVVRbbrkL9nxC1nrCuoAXoeOK2PmF/vt+x+fEwLfiFID7a7l9IIRV
         M7wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801418; x=1783406218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AtVsXFH15IrgzMd0VFvy62roDSh+hKjqh257VzvTJMo=;
        b=FBYZnzLwD+ZeWerFsFgIfadn3nNswDONNZmr4FqieDPJmS2oZohxz8/M+oC3NX4k9y
         UHzVQajdzlcPKdksVrSe6cwVp5E2qF+d97muAJPm5subNshMlLt1kOVfmJP2jCxgm1Ka
         AYqdjy3m8Q2Cy4jpyvZvqsDqLAFsQ2yycDG0eyIMG7b30JbrmkOnVJ4htEvs7SnypL0l
         3V0pv0pV8q1LjPQ0OCB3rWOycZef2j2FJ/QSRucH1DCPvSCSYwvbgHmFL8HiYLprv5pe
         v9xuaDcTvjK2alIq4p5yiOxMcdIDFaMqGAu7Iz/H1pKrIgQLmT/WvnQb53oWeDBFQ+7z
         Ot1g==
X-Forwarded-Encrypted: i=1; AHgh+RpECwr6b2Tog/9QQ1HSJeq27374FSaeXHDtZqvQ/R7rdWPFjk9nd9wtNUoDacN9eBsvh3b9ZaxRICGg2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdmPHYxJ0wy+fa0lS+DF8SpNnO1nULJ0hhY8pRrK9i4uq7cbKT
	oE/HPgslnW2C9bl1klRhz47HCi1JY3O/EzriMHbX9rUFk31J/l419Ntv
X-Gm-Gg: AfdE7cmItTP1yVJGSYVArOiMFUD9B03c8ERNam7PpSuk0X0UUY4WE1Crr+27g09WdpQ
	sfwNhzBTPSlxqlbWcRk3FfH38M9Zr/dRbP7wwL5tatFy8DYYxP1cfh1ZASR8VLeSVQ6yDwqfspn
	SkCdzmPHB5LAn1Nih4akvPunKLHd87nrJsWyshHgfrBFZvADMUDNHF9TonKtR48EiWL5ZS/Tuku
	lECsVwv/YqP3Vd3Zd74uaZhtVE+2ZrDit9SSieu7bA5628lx/SEQFurEVCTWuzqdhx4Ck8XEEEH
	UR0Oi7rszUDezFDNbeUKbwWHPS94QMhF+yIfpv8TW94Sw7C2TepjFkAJMLeshQDa9dRoOp2zbdA
	1DE8fB2oL/ipVtUpK7ivenON/boELH0HgFtQbUU9OZewfFW3CZa4nFp6Ku+SdQ99QBhvshY1oCj
	IU1c8B1npD64KOU1IyMBuq30BiVYPTaWywSuE1VcNfFtYzIC4=
X-Received: by 2002:a05:6a00:2912:b0:847:98b2:5a13 with SMTP id d2e1a72fcca58-8479f29c1cdmr1995338b3a.51.1782801418236;
        Mon, 29 Jun 2026 23:36:58 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:36:57 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com,
	Zhang Yi <zhangyi@everest-semi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>,
	HyeongJun An <sammiee5311@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 12/27] ASoC: codecs: max98095: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:34 +0700
Message-ID: <20260630063449.503996-13-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630063449.503996-1-phucduc.bui@gmail.com>
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/max98095.c | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/max98095.c b/sound/soc/codecs/max98095.c
index ced9bd4d94da..c47bfa2378b8 100644
--- a/sound/soc/codecs/max98095.c
+++ b/sound/soc/codecs/max98095.c
@@ -5,6 +5,7 @@
  * Copyright 2011 Maxim Integrated Products
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
@@ -1532,15 +1533,17 @@ static int max98095_put_eq_enum(struct snd_kcontrol *kcontrol,
 	regsave = snd_soc_component_read(component, M98095_088_CFG_LEVEL);
 	snd_soc_component_update_bits(component, M98095_088_CFG_LEVEL, regmask, 0);
 
-	mutex_lock(&max98095->lock);
-	snd_soc_component_update_bits(component, M98095_00F_HOST_CFG, M98095_SEG, M98095_SEG);
-	m98095_eq_band(component, channel, 0, coef_set->band1);
-	m98095_eq_band(component, channel, 1, coef_set->band2);
-	m98095_eq_band(component, channel, 2, coef_set->band3);
-	m98095_eq_band(component, channel, 3, coef_set->band4);
-	m98095_eq_band(component, channel, 4, coef_set->band5);
-	snd_soc_component_update_bits(component, M98095_00F_HOST_CFG, M98095_SEG, 0);
-	mutex_unlock(&max98095->lock);
+	scoped_guard(mutex, &max98095->lock) {
+		snd_soc_component_update_bits(component, M98095_00F_HOST_CFG,
+					      M98095_SEG, M98095_SEG);
+		m98095_eq_band(component, channel, 0, coef_set->band1);
+		m98095_eq_band(component, channel, 1, coef_set->band2);
+		m98095_eq_band(component, channel, 2, coef_set->band3);
+		m98095_eq_band(component, channel, 3, coef_set->band4);
+		m98095_eq_band(component, channel, 4, coef_set->band5);
+		snd_soc_component_update_bits(component, M98095_00F_HOST_CFG,
+					      M98095_SEG, 0);
+	}
 
 	/* Restore the original on/off state */
 	snd_soc_component_update_bits(component, M98095_088_CFG_LEVEL, regmask, regsave);
@@ -1683,12 +1686,14 @@ static int max98095_put_bq_enum(struct snd_kcontrol *kcontrol,
 	regsave = snd_soc_component_read(component, M98095_088_CFG_LEVEL);
 	snd_soc_component_update_bits(component, M98095_088_CFG_LEVEL, regmask, 0);
 
-	mutex_lock(&max98095->lock);
-	snd_soc_component_update_bits(component, M98095_00F_HOST_CFG, M98095_SEG, M98095_SEG);
-	m98095_biquad_band(component, channel, 0, coef_set->band1);
-	m98095_biquad_band(component, channel, 1, coef_set->band2);
-	snd_soc_component_update_bits(component, M98095_00F_HOST_CFG, M98095_SEG, 0);
-	mutex_unlock(&max98095->lock);
+	scoped_guard(mutex, &max98095->lock) {
+		snd_soc_component_update_bits(component, M98095_00F_HOST_CFG,
+					      M98095_SEG, M98095_SEG);
+		m98095_biquad_band(component, channel, 0, coef_set->band1);
+		m98095_biquad_band(component, channel, 1, coef_set->band2);
+		snd_soc_component_update_bits(component, M98095_00F_HOST_CFG,
+					      M98095_SEG, 0);
+	}
 
 	/* Restore the original on/off state */
 	snd_soc_component_update_bits(component, M98095_088_CFG_LEVEL, regmask, regsave);
-- 
2.43.0

