Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451F437B41B
	for <linux-sound@vger.kernel.org>; Thu,  9 Jul 2026 04:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783573192; cv=none; b=CbJcz18g0mgSww4ksO9NZOwoxtBBFSpny5SIipixpSOtEb0OTBAeth53M/838lG4h7iz93RvsWBYuiOb+AlHX85UVtNN5PoA5AoOYIsPmZcx7v1nauPGhq0XCIzBvWD3CFpQSs2uGLJoNMM4C2T5g4gRsJGFJeO9rQzLrbOTOvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783573192; c=relaxed/simple;
	bh=WOalQFBHar3NvkPew2YrsEq8h801FlbaMFuTGotQNTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oSqKrbHX438kFhEECep0MTAR+swjNoUwxwBkSFbYBuAa4qWqai/lNMjfqQ2hbfgsSVkpnLhF6yfvk1BK/fpPeCvh5O6Bfb7CG9JCCkxEe+3X5y93NQ0Cb5RUoQT5K6DSzyLHUVzlFKkiAWyzP0Hl45db1RCZ2L790RYvlZXjuv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EK3O2pxa; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EK3O2pxa"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-388b404ea89so540920a91.0
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 21:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783573191; x=1784177991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i+E/hLMGoCFm2Bo6D9s4vrTO1A3cUntDy1XLWjBr550=;
        b=EK3O2pxaQpcJzg2dxGFTknKXK7v3foJVIHn3XNQc0SMKt9tx34orugL4SzM/VQnsZ4
         tQEOMUoH20jHMD77N+6jPA7BkJldHa9S5wh5P6yuUj0tuSDSjF4CSi06XcFa666rmzjw
         gn1t71glOUWtw9gt1KXtT/M4nuxMAXyr81vVkH1Q+bjuCNt+IwaTYxw38mAZLxtTHTNe
         Iz/MEV1rSm1unPiksIMcLGDyYbt0Y9q7NfSRRxEok+FiPQO9Avr2gEUJTyJ6oBa6PgbR
         6nqU9J2SNLkiNGbzoRNGij8/KV3ZRhBrDyTGrFEx0EADviqkgsyp0RhaMBJc14JT2cRl
         u8QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783573191; x=1784177991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i+E/hLMGoCFm2Bo6D9s4vrTO1A3cUntDy1XLWjBr550=;
        b=naMch/WCBSEHygW+VXVTStxXVJNQZ9P22tNWl0yKWoVWeWKc+wPqUFDQaWk88IypBp
         ZmRoOA/6pzJMLGdd4j02bYoXNEu7pKmaFTJa/pnA7d3dnboMgUPCFu2cSxrXuBmgL+fA
         ungQP6F3e0s7tiajrocVllMgk1dm7uKH7HchtZyZFzVcy+Ag6VhdmmWoJE0g5bSBZfwC
         V9LyQ5dMbAWFNYNvs0NfiRYTEqROmFt+ZVDjHrBgCQNdqL+Hc9UVefao32+5ZNWZQwEk
         FD0QGsmm8vqPeRfeXEiq6J7vfAjDECc0JLS9AOBWGc0kGJVGgQFaY2/ZMIukElIF5ua7
         tOoQ==
X-Forwarded-Encrypted: i=1; AHgh+RqgRjSR5gcVb1nU7GvgMJaAHVu/bu5YH4+6eiR6VF+/MiG7fnHvmLSkF/kg1JG3u9Q8vFNQ2Cgx55fO5A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+OejvWGHdN2Z4LSxidjDu1TQa8oFMty+AqKGWBtwDs1GXwTva
	xuK2WtKwosfnUgw47LjUwzspSVYFTPZfRPQAsraPyURNG4GuBABWTEfb
X-Gm-Gg: AfdE7ckI8UxOTpRO0AnfA/dLj06yRPyCXumS2+xTZABExn+SYpCmmS33fB6ANeNkLAu
	UUdKna8eB2kbOg8yAj8AJD4HU9uehz9DL/jaL9XCMae1gcHUSrPgHKPQlbe3kDlmIP2vzTaNuGv
	HbsVhFgp2nR9h32Zi/ZXjxuECtwZOmoAEgtnEqmLDSej+CB4a1qMgBBbcIfel3/sR3B0HWlTPYe
	/hIPUOAxG3QppnAg4bk2QRN6qWkt5Bxay9bWgw2hLxKldlZrOnMNlCpNkMzcRN28b/tSyQHPewb
	NPDdDAj8pj2px7DBfssxC+biJHQHvSJe6KCJOSs8BmSTCfPocEWGsZif2plUGcvkU1amay4rlnu
	R/TcoFIATlKgrtvV85M283s6naIFeMVTOuDnP+6En19UH1db6gun+FIclXFjvaa/qHSRbxUbSst
	2zpW0C649KCbDIr620RgiwYX4l4Jiw7AuVIxKSK1/Y3qI8Wvs=
X-Received: by 2002:a17:90b:274d:b0:385:39ac:fe4b with SMTP id 98e67ed59e1d1-38b75528c91mr1355508a91.17.1783573190664;
        Wed, 08 Jul 2026 21:59:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5506b47esm490481a91.3.2026.07.08.21.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:59:50 -0700 (PDT)
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
Subject: [PATCH v3 01/27] ASoC: codecs: da7213: Use guard() for mutex locks
Date: Thu,  9 Jul 2026 11:58:36 +0700
Message-ID: <20260709045902.498848-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709045902.498848-1-phucduc.bui@gmail.com>
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/da7213.c | 37 ++++++++++++-------------------------
 1 file changed, 12 insertions(+), 25 deletions(-)

diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
index 4bf91ab2553a..923b997efbc4 100644
--- a/sound/soc/codecs/da7213.c
+++ b/sound/soc/codecs/da7213.c
@@ -11,6 +11,7 @@
 #include <linux/acpi.h>
 #include <linux/of.h>
 #include <linux/property.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
@@ -216,13 +217,10 @@ static int da7213_volsw_locked_get(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7213_priv *da7213 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7213->ctrl_lock);
-	ret = snd_soc_get_volsw(kcontrol, ucontrol);
-	mutex_unlock(&da7213->ctrl_lock);
+	guard(mutex)(&da7213->ctrl_lock);
 
-	return ret;
+	return snd_soc_get_volsw(kcontrol, ucontrol);
 }
 
 static int da7213_volsw_locked_put(struct snd_kcontrol *kcontrol,
@@ -230,13 +228,10 @@ static int da7213_volsw_locked_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7213_priv *da7213 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7213->ctrl_lock);
-	ret = snd_soc_put_volsw(kcontrol, ucontrol);
-	mutex_unlock(&da7213->ctrl_lock);
+	guard(mutex)(&da7213->ctrl_lock);
 
-	return ret;
+	return snd_soc_put_volsw(kcontrol, ucontrol);
 }
 
 static int da7213_enum_locked_get(struct snd_kcontrol *kcontrol,
@@ -244,13 +239,10 @@ static int da7213_enum_locked_get(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7213_priv *da7213 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7213->ctrl_lock);
-	ret = snd_soc_get_enum_double(kcontrol, ucontrol);
-	mutex_unlock(&da7213->ctrl_lock);
+	guard(mutex)(&da7213->ctrl_lock);
 
-	return ret;
+	return snd_soc_get_enum_double(kcontrol, ucontrol);
 }
 
 static int da7213_enum_locked_put(struct snd_kcontrol *kcontrol,
@@ -258,13 +250,10 @@ static int da7213_enum_locked_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7213_priv *da7213 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7213->ctrl_lock);
-	ret = snd_soc_put_enum_double(kcontrol, ucontrol);
-	mutex_unlock(&da7213->ctrl_lock);
+	guard(mutex)(&da7213->ctrl_lock);
 
-	return ret;
+	return snd_soc_put_enum_double(kcontrol, ucontrol);
 }
 
 /* ALC */
@@ -465,9 +454,8 @@ static int da7213_tonegen_freq_get(struct snd_kcontrol *kcontrol,
 	__le16 val;
 	int ret;
 
-	mutex_lock(&da7213->ctrl_lock);
-	ret = regmap_raw_read(da7213->regmap, reg, &val, sizeof(val));
-	mutex_unlock(&da7213->ctrl_lock);
+	scoped_guard(mutex, &da7213->ctrl_lock)
+		ret = regmap_raw_read(da7213->regmap, reg, &val, sizeof(val));
 
 	if (ret)
 		return ret;
@@ -499,12 +487,11 @@ static int da7213_tonegen_freq_put(struct snd_kcontrol *kcontrol,
 	 */
 	val_new = cpu_to_le16(ucontrol->value.integer.value[0]);
 
-	mutex_lock(&da7213->ctrl_lock);
+	guard(mutex)(&da7213->ctrl_lock);
 	ret = regmap_raw_read(da7213->regmap, reg, &val_old, sizeof(val_old));
 	if (ret == 0 && (val_old != val_new))
 		ret = regmap_raw_write(da7213->regmap, reg,
 				&val_new, sizeof(val_new));
-	mutex_unlock(&da7213->ctrl_lock);
 
 	if (ret < 0)
 		return ret;
-- 
2.43.0

