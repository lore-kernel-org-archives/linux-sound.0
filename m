Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A844744D6A1
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 14:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520507; cv=none; b=F6XTjSvV1T33iBoTu4Fc3JsuQ6X3QuEqEgSPxLR887Zp/nYF0EIn+mAM3dQPoD2WeZna9fEK3KwrtrzBNusZIv3KQ2sTdgwWPPhOfYwgy4xFlBqnQVH/l/l6gMYCxtZZcFuTnAMjXvleLntcazGgI+L0Sccvg9v67bDDwEblBss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520507; c=relaxed/simple;
	bh=j1KzWxhp75swdsTYPJvVoYjcP8hTRieKELlWe5iEq2U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FiWG/XXZFLzYnpk2JWzvsk2QSv19w0L6cQVn4T6Q+i+wzc2jpms/d6sL52tYOqiBI1MH9C0cAVvrix9xe/JFsozGhGzOhL2xi7alWkhEiIjCuK2qd6APr6jBKwdqjeCdylvh3dXCs8qQCwRlGzk/GzVmOv5pRxoJmkbPIh9cxPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D1mSDDXa; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D1mSDDXa"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cac59f8b64so8700565ad.0
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 07:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520506; x=1784125306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=26LuwxXuYnG2tABKOgMVR7HJmLwQlsRPpHyBPQzuKoY=;
        b=D1mSDDXaVpGNI0QKy+WApg67OlRFaGx23ASrI6Jpm6+OYkVNgZextzPljAP7EGA19a
         8c8+u+k82WA2LSUR2AWXLiNZil31AL8Zkqg26WqenK+3sqKo/gmRGtBAkI3IAv2pem0r
         qHQPAHp9qzJ3u0ymvpizyKwmSOfzx0ZI9sZa3ufSjyTDk+xpGSZFXIfuPWgItcDUeSkg
         cHNiNDVlPSTpNm1yT+x4ydrOliGryZD9uYzqmjAWztPtDfSMBfQkjpaw1Y9xiszhi5PN
         rCPIFh2rGRM0x4tShR8p9NuTqVBmCFf9oDYyFV/vhEmuGTYgpBC7tHsLWD8yzLfhpfWL
         2yKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520506; x=1784125306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=26LuwxXuYnG2tABKOgMVR7HJmLwQlsRPpHyBPQzuKoY=;
        b=q91wxE/S1Qb9yxCsCN74PL4Gg/P5Bv+aUsagnT2o8SdWOouUtSIM3exXUtZ+aO6ubQ
         LFJEmM7EuTvyWO6lwu4TnmztQw2ve32wMbWIcflrWFvv6hWCZ/8BJ0LQOSAZZJrUQiuu
         mOwzgACb2IL37nWteuLlo2QwigAlAidReLw4eufJ8vZXlSavfdfbu75KgMtzksLqfilG
         k7qsulPy3ohQX3G53VyYbrJgq1CexElx1eW7x6pNGWOv8LyKAIYxqqMvIc6emHkqO69r
         98ec644RV+Xbufl9FG/6U2iNalmcDKVBMgLeQuphpUMemx3sP3XdFPFIxF6FcsFrjdl2
         yllw==
X-Forwarded-Encrypted: i=1; AHgh+RrCpzF7qvrKihwxPyLIuTMKv7MgEp/XtxCt6bRshqTWYiPdnDSj/jNpcZ2C6ItRtZYB4nw7waVDAe1XZg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx3YexJuhTNt2j1GIQoVtGbQiJojEI15JLa0GHgXMFR7Uok0WF
	hWhUm8+3hOX/6snxtQwnjme6Kblm0a7XaNjr5ibZOJk88wFQcqAXmDzD
X-Gm-Gg: AfdE7cnLrnz7u7DEuJK5EWxN59vDVw7RJhaXsqJH0m4EGbWuiclPlLsxyOCxa4yLpI4
	QYJPn/5fyh0aOIq3pySRJa2YTgSupZJdTELihzqo542ZZzUrgOlaYBjURCqWiuLr+8ZgBOCSI+2
	kmLODkEoXGLuCb+lRObXT3rL+HmU0fjLBoJ/46kZ34tgEXwtvneyg11lER6h6FKCm2aMWrtt3/G
	Hw0lpNkILzvWI6Y9Yeogf5dIuFH2hr3fw8HIJEbEMH+BK9+tSK2G8O30xNy3SMrTCN4nPsg6Y/6
	f3HhlA0eE4DyrMiVAfwmFvfOFPnQ2a5btyBBE5Pr+6tl3g503Uw9oFEbLXQ/cHgh027/6H+v6PB
	XId73Dkd6Z/mMzSAo9ZKB2P9Y6l4UXWZyrScLsfhu6dACU9PcxjkTNwPf9JGnR2DpySk07E93fD
	vA9EW0fDUMFluBSRFwQTzdPjpUb1NNrKKo4DMDLadSiqSp8cw=
X-Received: by 2002:a17:903:2447:b0:2c9:97a8:afe7 with SMTP id d9443c01a7336-2ccea3cb09amr29387565ad.42.1783520506198;
        Wed, 08 Jul 2026 07:21:46 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:21:45 -0700 (PDT)
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
Subject: [PATCH v2 20/27] ASoC: codecs: rt5668: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:27 +0700
Message-ID: <20260708141734.578926-21-phucduc.bui@gmail.com>
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
 sound/soc/codecs/rt5668.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
index fed6de40b8c8..4154bad27610 100644
--- a/sound/soc/codecs/rt5668.c
+++ b/sound/soc/codecs/rt5668.c
@@ -6,6 +6,7 @@
  * Author: Bard Liao <bardliao@realtek.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
@@ -986,7 +987,7 @@ static void rt5668_jack_detect_handler(struct work_struct *work)
 		return;
 	}
 
-	mutex_lock(&rt5668->calibrate_mutex);
+	guard(mutex)(&rt5668->calibrate_mutex);
 
 	val = snd_soc_component_read(rt5668->component, RT5668_AJD1_CTRL)
 		& RT5668_JDH_RS_MASK;
@@ -1053,8 +1054,6 @@ static void rt5668_jack_detect_handler(struct work_struct *work)
 		schedule_delayed_work(&rt5668->jd_check_work, 0);
 	else
 		cancel_delayed_work_sync(&rt5668->jd_check_work);
-
-	mutex_unlock(&rt5668->calibrate_mutex);
 }
 
 static const struct snd_kcontrol_new rt5668_snd_controls[] = {
@@ -2356,7 +2355,7 @@ static void rt5668_calibrate(struct rt5668_priv *rt5668)
 {
 	int value, count;
 
-	mutex_lock(&rt5668->calibrate_mutex);
+	guard(mutex)(&rt5668->calibrate_mutex);
 
 	rt5668_reset(rt5668->regmap);
 	regmap_write(rt5668->regmap, RT5668_PWR_ANLG_1, 0xa2bf);
@@ -2400,9 +2399,6 @@ static void rt5668_calibrate(struct rt5668_priv *rt5668)
 	/* restore settings */
 	regmap_write(rt5668->regmap, RT5668_STO1_ADC_MIXER, 0xc0c4);
 	regmap_write(rt5668->regmap, RT5668_PWR_DIG_1, 0x0000);
-
-	mutex_unlock(&rt5668->calibrate_mutex);
-
 }
 
 static int rt5668_i2c_probe(struct i2c_client *i2c)
-- 
2.43.0

