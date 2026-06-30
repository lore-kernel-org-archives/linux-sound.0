Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE663EB7E4
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 06:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782801487; cv=none; b=f55yFlNvQSS+PVQvWKbFGvIJSZz1EjTCjgDJDlpnFqCeB3x/TwI26fVs9z7fIBs38QiRIbPJ1QddV2CbGw1OhbkY+aeEo6vxr+ATx1mu8w1a+SQdtwBcwy8epkG3uro7avr+GMJWcOB7ot0r5tV23vpBASBKu1rAY7n13lO5e60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782801487; c=relaxed/simple;
	bh=j1KzWxhp75swdsTYPJvVoYjcP8hTRieKELlWe5iEq2U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h1AiHJmCQTHvumB0WAhGLY1ID1epmLxfHkQGJPWKMA4QjK6t/ZQyxBkMdO0Pg78Zuv5k9LO40pjVdU4RcCDQ0ZtSTUlcIxuoKKZCviMl6+JK3U8I9kZFNkDYQaXxC33WO3nfdNopDh74dq3NApVuf7ZYqnGcxfyr7xxDykgJa8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ofFHTDYo; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ofFHTDYo"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-847a52edeb2so188360b3a.0
        for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 23:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801479; x=1783406279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=26LuwxXuYnG2tABKOgMVR7HJmLwQlsRPpHyBPQzuKoY=;
        b=ofFHTDYo/ZZUNmZI0K4HMH/2xZdjWuI9Ui0mYUF4wg80tGPQivlJXf/uhryGjh/fAe
         +42PQNVxQ+4HwF1AF4gc7j+JfOcUdFspWxzKZAtZ6Rb0fUmZGblvsoezuU5O6D3Py4To
         VpXj3DvPzKQvIjvaSMky+epKeAMfXbMrWuif+HfLZOZSs2XZqv9oPB6HBJVS9PD6xm/q
         l+7WAMvIQsWGMKEY8HZjD1Mg7w683DSun5wT9cnHe+JjdkzIe3DFEqYYFwBZJtZ8ZUG7
         wXFDzOt5KijxuMY/UTYwMSwvtsx2bs1UbvuF9nrO+N8zp8J4kKUDLHzu1TQWd2dLvxHf
         V9Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801479; x=1783406279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=26LuwxXuYnG2tABKOgMVR7HJmLwQlsRPpHyBPQzuKoY=;
        b=tObBeHkzoBwyMtKmV0YtKMqs+Dl7Z5NnE5z/B1yUcB/8TJvb97B83t4e90M7upKmFY
         UF+5DC3uZ8cva6K6FQkIw5YatMqBhtMiX8pkfwqpnGmkQcxjUrLmW8AykpQzl2AAOvP1
         rLkuh341E32GAlwOo0TqR956Se6e7DOyN7bOq2Qn3tHdUFx/Km9fPMtmmnSaNVXlFs/P
         BolhnlgMOBLIH4YUs7PQp+Exez5nNyLE1qftTsHGp2g2LXDbIlQNpqfwneMWeY/QkdC/
         jGJggG6a9fJ2PAtnMmv8A1X2qcv+hylcgwlCFh2Zjq0hC8Qc3+a5tSxFUjQSMAEzZ0d5
         is9w==
X-Forwarded-Encrypted: i=1; AHgh+RomOqS7ZSfsdzqazuiImJk/sz6zGHdpwnFYXAhlWve4LCXeJpg/44Ve/vlvpDmFFljwybcp/mYAokW9sg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmZ/YHs5uqdepZoCDpKawBIewKdParXBNGm3LeXpjccSsoXCcf
	6xcvE1yVHVEOekshAUOldo52VUmS9gA4o7Wv1xPT/gHE6NIwscD+FT5X
X-Gm-Gg: AfdE7ck/2P068e64OGi5gnf9ZW3gg1a4NHCfljqjmrKVof7YO8XAc8FFbEbQfzDQ3rQ
	S2fnA70l2H90ZFW96iPgncS+nQQcQ1IBwlQDkOnwVeoFBO5gJQWwQBZR9jvL9vvMK5fQrxvnWym
	hEMovuILK5MLjSXzqw5hNV0Mu9UJq8Sfnvwm07uH2glSZSWa4NHtGXf+8ABV7J6J56MwBvz1Gm5
	aKWbv5xYVJp54h8EPEswUuq7Kc/NpcCjZjYAcJvcyYhmOHJ8GImKu3CdNMkev3q/jV5xsjMc0o1
	jk8SgIjSgdXOnqk7nMi+M09dNtEusujfjmhgOMjv3rko2RC+wO1uJweUf8HaMnpe3IwJ7zzpMlY
	XiOjZ8wDwU5TZyQRWMcXFHqYIrP5dQ2i4Bd468DPwDA/xmSpDT4oNp0OpXH8NYlkJFOp/CuryD3
	/+00dpHyZaUlq0PwgQR0cJA9umZTlN5YLbnnFuuWcuzGxLHG0=
X-Received: by 2002:a05:6a00:94c3:b0:842:77ab:35c8 with SMTP id d2e1a72fcca58-8479f3fe486mr1817309b3a.44.1782801479404;
        Mon, 29 Jun 2026 23:37:59 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:37:59 -0700 (PDT)
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
Subject: [PATCH 20/27] ASoC: codecs: rt5668: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:42 +0700
Message-ID: <20260630063449.503996-21-phucduc.bui@gmail.com>
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

