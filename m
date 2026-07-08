Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01944611CF
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 14:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520353; cv=none; b=kgXB8x1rnLQCtiu0Jy60/BOLDqjJ4LasCub4KQaXdWgXqCQ/EF6aYC4GyA3tv2OaxCfZK/p2GY1zHsop6GrU83PQ6GDTWbAWQGxRIkuCux+WS7+SHJ2vNTiTsi+y+SZysh1J2yxXRDruzOFnDEZFZ4uFb5nmMlwtZjyeSqPoGnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520353; c=relaxed/simple;
	bh=WOalQFBHar3NvkPew2YrsEq8h801FlbaMFuTGotQNTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UuPp0vIFc5sec6z6kCGYk2LHSvmsTxQnjqCD0JK4453quBq3BjCXR9LvHUJAvVFS/tcZIRsJhqWoLWaPCwdIQ2E6jBeY+y792OoJ6BmdUKY9g8QuCxLMRnpbMHjdIvG19Sx3S47DsVZGJDOV7uF3Ki+/NXWe0Yod2BwnEXEX6Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PFLtRF49; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PFLtRF49"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cace91f112so8233045ad.0
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 07:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520351; x=1784125151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i+E/hLMGoCFm2Bo6D9s4vrTO1A3cUntDy1XLWjBr550=;
        b=PFLtRF49z6RnaKPh+ycuFCxr4iTTNU0r8lVzjN5ZsxxaTx+0kQ/6H9le3kdJAV03YH
         AUDAHvBSNUISYHC5Zcju/SFJhElyZCv2I/Te9EI2QTMWfKxqApRFl7HlkNo+XvqHXuQy
         qwNyL2T/uwT+s027qzIS55n9AkmjI5OB60r2+C87GFVj8RUIXWJ6IWV4Vg1EX/6qFX8c
         gipPUyVVY9lqmmoOnepwCxVWck/kz+zCcIpMa8ZgTEEEFD9O9wx2vk16K09JiN58QcAg
         9A4uBye1Skwpk2jzVYzPp/oZDGrwk8W6WxpynxYg2TFCwbUWhPs/Xf1PeiFwItg9YA7H
         jy3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520351; x=1784125151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i+E/hLMGoCFm2Bo6D9s4vrTO1A3cUntDy1XLWjBr550=;
        b=eEBmhwwLWq1Y5NToT2HFZ8mj2dELR9DtP0vpHVaDjNKch7z0RoF7gcryGCI+7W+Ugr
         P+VsDK5H+hHDoSJBFtg6B/7Du0C4NBUnn5E4FZiBx4YjrikDVtQ/LjLn1dmQAeGgG3kN
         nTywTvpB7xrUyFOtbPa1kemaqIDJHjOGkAsEWbAxwAnaUqaQe+4q2+j7fQGI8r8Lw8oH
         PR28DhT/hCCAduSB1azIRJmBWQMVMxVm8MBZYPiwT6mqF5Q9x3GPgrY696XaLqO46jCR
         Mw3F89SyFE9whLSuuJ3FmNPIUd3dW+hmLKpczQZprcUMMTONG5fXX+yybHoXLr8LP4bj
         DWuw==
X-Forwarded-Encrypted: i=1; AHgh+RoeqvZoHs/sTtuSrEuCQAkz22mU6INgK7YY5CSIiQKJGdRxdSntFHkr3lM32YLWFmkf31rZIAUNy1LufQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2bKloN9HCSXLrTDtu7iUpED4nTLGDbShCz4xUhyo21aaCbv2+
	o/X3Fp6jtNhpgRFFmW3CWAJ5OPmFoAiAwtgIsvrlv6U8JfN4dZAQV6/5
X-Gm-Gg: AfdE7cnoT/DfhEljUzqRSOiJsOxzAFTQ8ZZ84toAsMaS0/Jt6fHWyAqt2BJppFJvR1h
	H+ym+Aha9XFM66ZjrDxFBpQHeSTZHOTabLS7dqsQnOWzJizJfaIyQh3QqAaQujS8TrJn33K+ZkB
	HQnfrVRW3gUQ/0IbtzINeW2K4quzbdGm9QSzLQPM4DRtMiWPGLYgWbor/LkK5yEzj8gGTBdBjrh
	zQo4K7ErlX0/fXi7CTj7J0Ag69EqSMo0f72nhymhHLrcLE8FlXohiwbHrQSigUfJBWGVqhbelvB
	YoYhWCXKmjVk2mAF9jpawtPN3g6b63QEBUZ5gvUQOZmQRcQhMzrqK93GL2iK2WiCs6ZgxbDOTiL
	AM2Cxgfx/t4CUqKbBfzGylcfBDE7l3FtmbNw4YJ/dSpDMiPgOoxSLi/r83NTUowb289ZW/A/0mx
	fWIUTiTOjJ60Wb/FRcbvjSzIBY7nM9WMEuDJV/4NgBtXYfkvw=
X-Received: by 2002:a17:902:f64d:b0:2ca:b8d:e65e with SMTP id d9443c01a7336-2ccea48bc51mr27117655ad.37.1783520351057;
        Wed, 08 Jul 2026 07:19:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:19:10 -0700 (PDT)
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
Subject: [PATCH v2 01/27] ASoC: codecs: da7213: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:08 +0700
Message-ID: <20260708141734.578926-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
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

