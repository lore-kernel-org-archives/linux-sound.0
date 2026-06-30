Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2563E834F
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 06:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782801319; cv=none; b=lXgZijov37XTlIzvMNrMeVwiRvZqgE61z65OXljPhD3BKy0YCG78kk46dLXF79pqscxmzLPIbiFllu6VOOvVf21gTL5e9k26L0noRJTPWPf1Qrsu68LoNDN9xauEhsHcxsiQcEYdRPDoDBZgvCptwfhew/fWNGcrZz/1Ch0sopM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782801319; c=relaxed/simple;
	bh=WOalQFBHar3NvkPew2YrsEq8h801FlbaMFuTGotQNTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BY435qg1pPaGfFzZF23HPUgOGto0NIF+vUbV6HkYi+Cjv3mB1HWvDZnROf47cmxmvm48BcV60TKLsvd4p/bm9p++dviAAyTc5oBBHfY5oWOSNFvevNcPU01RRk8NdiGo7uKTowCqMPFvVB1edZZYugA0KJVHgJIEsxb/OjJNP4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LzYskMNL; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LzYskMNL"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-845e363246aso1934311b3a.1
        for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 23:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801314; x=1783406114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i+E/hLMGoCFm2Bo6D9s4vrTO1A3cUntDy1XLWjBr550=;
        b=LzYskMNL+14eQ2tggYiPFWy3MWiugToAkC3ak9bANGJMMLaoA9xrI27y9PWHfR00aj
         Cc0m3nwz6XiMNCeUfepO5kCw9YlKuPnH41nLBZmFRM0Rn/Qfdt+fFkM4RBon9z2K8ajS
         7oxgp6+Dx7M/NQhVUgkEmJobK+1fY5tpVcyDkqh6HKdfFoTl1GY5LV2THDvTpcMhMpnH
         ZQxZvgUHUMuH/ijkO2i/c/LEm7LWs4+0A30WmP0PnQK0mvkLCY4NEvtbFkheFWrIgiGn
         LXJ+TjbDSoabZi9X8zZhu6PVK7gfCqLteAKKzLqqftgDfo1ZvYxJW4cwozEqbBvEu51V
         9ZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801314; x=1783406114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i+E/hLMGoCFm2Bo6D9s4vrTO1A3cUntDy1XLWjBr550=;
        b=MsmrpUjUwjojZZSHODVJnVUpBtKdqFHh6uXpAo1cI3I9hB6iVeOSlyeDFVtvqi7JM3
         Z4fB6Ql2w1eC3uTW7R9SvJXYNaI8gmA496IqRfOHnsqTW4SiQhE83hRJ2D1l4sPcCHUU
         r4HgCOcTevtFNsm3sCWlt2IIy8Se0xFF9XL81TbxBU8nyO05KIAE7h72jBXLnLuvUNoY
         /d38WXHkhqLIXSPAhatV5LmMfDTDfa8R8+q0Gd/wr8ktYiEDL6cHbM4JNWDuZip2s/76
         5XUssegVjoxjJkRzszMJleV1YNr+noZaMkNjr9bFS4sIbcyuLfdJQO/rnQNN9gi157nn
         EuZw==
X-Forwarded-Encrypted: i=1; AHgh+RpsSRn0ztCrEfc/z3ngGT3/R21DciHMQtbvewx+6DKH/2gMvL21Zug9EDItSFFjncF3fUQ0wiqUvdCAgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwW9Of9PPHvIYLUF26ZhJ6Mc7m+WORZryI11ezqQHV/CZ7qqKG
	I8K9V5CwpJkntL/sNRXnm4JO9RLgk/Nx3SQorbf91C+Ou9VbdSYvYX0h
X-Gm-Gg: AfdE7cmG8g+8mr7woznEQgRQG05Atehuqvu4BZWzlK3tO+fD8iLKSCK7IaGeDWjZ35E
	7yBQGHTbNTe2bL9ihbWyYkp4cLc0tA9eo9Vg4DAK5WfTAyQMkSiTBE6IggZh+pLaEk1FSZ6/tsN
	L4SBOXnx4TOXT6ZQaqwt4Bi5zyqNehHRPzq9o8QvS4JRTxWLPMXnjV0GXXQeMO+3F8y5uRQowlM
	bM1zEWcCSekxm8iufrdCzUwEtSNjtccqg/CJZEfQ/1xps4DkBxdjZQCxdSYzbn7rNKKCgbU5WgW
	rQoKefWo1q39ybqGKtXGF2roflNCLYVZ9V6GLD80yCUXmnEmIGzKhzVd9oI/NcoJ5xSY8Hfyzec
	mOjHj6vwpzkz4BrZZh4pv9b7R/Cck2GNC/vvnMbkQUDzoaYaDmrih9KVCj/RHxCKERxl1WmenB0
	dg8ssuw4NUQWK/M66gUSRXnQ2R3Zp2gk3vJ28tcV5HCFkmEAw=
X-Received: by 2002:aa7:9a83:0:b0:845:c694:5c48 with SMTP id d2e1a72fcca58-8479f27b317mr1885937b3a.28.1782801314552;
        Mon, 29 Jun 2026 23:35:14 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:35:14 -0700 (PDT)
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
Subject: [PATCH 01/27] ASoC: codecs: da7213: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:23 +0700
Message-ID: <20260630063449.503996-2-phucduc.bui@gmail.com>
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

