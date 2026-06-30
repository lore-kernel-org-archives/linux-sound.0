Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BA3368D68
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 06:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782801412; cv=none; b=hLnF5bVKbBQ0besBNlpcydAaQ6JCvTIq2aMzt54RvNrAhElPqs6tDz6dqvdSmR/AwF6IsjEN03nUtvQ7tfUbb0kFbfqVJc/Bd90VEEcFQMf9wiscWYi8TfKVKiTOlbRZm7z+gxYcyppikamKylisoQiXeyWuTy3aNjh69eignq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782801412; c=relaxed/simple;
	bh=TEYJkvRe5/OOwfypH35ZsEZJDxuBLCMuhd0Ef49Jq6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lX/RbQI1EUXAYqxlCC6CmzbLIPXpmXZFcX+Rz9anQ4W9p536PfIsRRSf/W5DiABni/kc4w+C9GgqYqH7pUWpPr8s41mHvO0gRCGvwKQQL8aHzT+NOSnA7m+HCTuPryDDipaUgO8sJnvpOVo8yv1JFRKnccI1XdiyraVdTIepKOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QXTWNZGh; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QXTWNZGh"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c858961a8efso1554939a12.2
        for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 23:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801410; x=1783406210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oFPEhR4KdzvrM3sAID4Cucf366Ob4IDS2zrn5wLPtbs=;
        b=QXTWNZGhxhRhH6By2GNt9lq5gIdUYDKbjklfHoOp3FZoKUUUNGXnuRJgGUHUPS0acX
         TpSzRUCChU8lSqzt8sbc8DlA1RVRPCzkW0r0wkECcBTZtzXZiaYysKsl6WrJE0F7PBQY
         2ET/eUe7GSQMPvknrE+/BCnjnKMv/rrm80LJg8Vdo7gBrPFpt9VexVSYHrAaTtI9zue+
         9Hyr+3mK/Wlu+6wT6d/rEz+svuhclbdo0S3L+uVTDx5Mlf4ftyqOKrst9T6Fy21IhnR4
         7yK5jEidB/ICq8gwfFCFIDHRgRY4ks11AmccgXyCQilbW4ulUyTQg3VZmPG2IQa6K+ns
         DTXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801410; x=1783406210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oFPEhR4KdzvrM3sAID4Cucf366Ob4IDS2zrn5wLPtbs=;
        b=TtQKGFnx3raCkyy3lWKQNq3rpRR+0JqV/jsklobmbWskfxhq3RBAF8RT5nWC6CIczo
         G7p5eDY9FlIW3teuetzJ4ujrGgMa/Wb3hQTNU/f7vAa+DUUcR+8rtk4KQjFUFgy60izd
         AQ9MhZYEKocrQ7CnbwNSHnAWzQ0kq/QfqtoA5CWloiqKToAMBv2ccKiw0IEAHfG/dACl
         qM9Cy01CIY1LR8gj7W4UbUMgY50LQps9L7/ygvNL+kZyCgQMjvwOCBhkbRs284EVsffD
         CRJgs4aXt4YBA9GabaJIVa2/GGLrLeopGeeZKZiZ5hh8SgqhMqkWDGiIhtsR60bBeJSq
         aSSg==
X-Forwarded-Encrypted: i=1; AHgh+RpJmm11ZB/3Rflmr79WHgkCH3vw6tElC8Tle07zNua3ZRyB/nOTZ72DQAwLUUvJWtNlGIm1cA4UOdROzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwP9g56yjJ7TBTYlL5LlznMWizHdWjO6G+r30Oko/oj7gUgY7tb
	QPqSzG42gfkrTP2Mp60JfSGksjzVvCCvInX17e8CYSYVc4BX2ICGbx9u
X-Gm-Gg: AfdE7cmMOwAndGK9Jno39Rf+cHdnoO4fQn9ivWMFmTs1jT4CsDmAXEqkRGiJwoVAz+D
	vlsyjki/vTJYBIDB+mFm0LlloK02oxcXasuTtcnJghKt34b41QTBpiJxOp7Ls3V7i2uKPzYQzFV
	MfDQzCNLFLBM2PUEMuQwLkqoYQ9uXItnTJyAbMf8NTq8PmdeciVJ1vIR9t0qa6TnBofgxFGp65T
	oBZgyDMlWecp9zqmKy6TiWR9ezomvdVZed/8tCXuR+2Mr/wStBhNEQmpvssh/EygeqZb3RgMPfk
	Jsn3FokOMR9XNoORwUnW5Dt4tCjvyA9f0peHheft3fgxuCIEaApQpajUN7I1dajobJrfhKOR0a4
	9tlTtty6dkcVfmrAuBJGKHsZTBicVoaYNomnArQ0o+E2FBNnquoKarpC79hLt1bKI5kqg6OYuFf
	PBfWC3NniAgr0dnz4GhjHLT9Hhw0afGXpRMbQUOgwzUMwYJjk=
X-Received: by 2002:a05:6a00:2c89:b0:845:ba94:a56 with SMTP id d2e1a72fcca58-8479eed0fa5mr1777284b3a.5.1782801410446;
        Mon, 29 Jun 2026 23:36:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:36:50 -0700 (PDT)
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
Subject: [PATCH 11/27] ASoC: codecs: madera: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:33 +0700
Message-ID: <20260630063449.503996-12-phucduc.bui@gmail.com>
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
 sound/soc/codecs/madera.c | 32 ++++++++++----------------------
 1 file changed, 10 insertions(+), 22 deletions(-)

diff --git a/sound/soc/codecs/madera.c b/sound/soc/codecs/madera.c
index 98d72db599d8..7f1db2a7e703 100644
--- a/sound/soc/codecs/madera.c
+++ b/sound/soc/codecs/madera.c
@@ -6,6 +6,7 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/gcd.h>
 #include <linux/module.h>
@@ -513,7 +514,7 @@ int madera_domain_clk_ev(struct snd_soc_dapm_widget *w,
 	 * We can't rely on the DAPM mutex for locking because we need a lock
 	 * that can safely be called in hw_params
 	 */
-	mutex_lock(&priv->rate_lock);
+	guard(mutex)(&priv->rate_lock);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -532,8 +533,6 @@ int madera_domain_clk_ev(struct snd_soc_dapm_widget *w,
 
 	madera_debug_dump_domain_groups(priv);
 
-	mutex_unlock(&priv->rate_lock);
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(madera_domain_clk_ev);
@@ -875,9 +874,8 @@ static int madera_adsp_rate_get(struct snd_kcontrol *kcontrol,
 	const int adsp_num = e->shift_l;
 	int item;
 
-	mutex_lock(&priv->rate_lock);
-	cached_rate = priv->adsp_rate_cache[adsp_num];
-	mutex_unlock(&priv->rate_lock);
+	scoped_guard(mutex, &priv->rate_lock)
+		cached_rate = priv->adsp_rate_cache[adsp_num];
 
 	item = snd_soc_enum_val_to_item(e, cached_rate);
 	ucontrol->value.enumerated.item[0] = item;
@@ -903,7 +901,7 @@ static int madera_adsp_rate_put(struct snd_kcontrol *kcontrol,
 	 * maintain consistent behaviour that rate domains cannot be changed
 	 * while in use since this is a hardware requirement
 	 */
-	mutex_lock(&priv->rate_lock);
+	guard(mutex)(&priv->rate_lock);
 
 	if (!madera_can_change_grp_rate(priv, priv->adsp[adsp_num].cs_dsp.base)) {
 		dev_warn(priv->madera->dev,
@@ -916,8 +914,6 @@ static int madera_adsp_rate_put(struct snd_kcontrol *kcontrol,
 		ret = 1;
 	}
 
-	mutex_unlock(&priv->rate_lock);
-
 	return ret;
 }
 
@@ -1061,15 +1057,13 @@ int madera_rate_put(struct snd_kcontrol *kcontrol,
 	 * Prevent the domain powering up while we're checking whether it's
 	 * safe to change rate domain
 	 */
-	mutex_lock(&priv->rate_lock);
+	guard(mutex)(&priv->rate_lock);
 
 	val = snd_soc_component_read(component, e->reg);
 	val >>= e->shift_l;
 	val &= e->mask;
-	if (snd_soc_enum_item_to_val(e, item) == val) {
-		ret = 0;
-		goto out;
-	}
+	if (snd_soc_enum_item_to_val(e, item) == val)
+		return 0;
 
 	if (!madera_can_change_grp_rate(priv, e->reg)) {
 		dev_warn(priv->madera->dev,
@@ -1082,8 +1076,6 @@ int madera_rate_put(struct snd_kcontrol *kcontrol,
 		ret = snd_soc_put_enum_double(kcontrol, ucontrol);
 		madera_spin_sysclk(priv);
 	}
-out:
-	mutex_unlock(&priv->rate_lock);
 
 	return ret;
 }
@@ -3041,12 +3033,11 @@ static int madera_hw_params_rate(struct snd_pcm_substream *substream,
 	if ((cur & MADERA_AIF1_RATE_MASK) == (tar & MADERA_AIF1_RATE_MASK))
 		return 0;
 
-	mutex_lock(&priv->rate_lock);
+	guard(mutex)(&priv->rate_lock);
 
 	if (!madera_can_change_grp_rate(priv, base + MADERA_AIF_RATE_CTRL)) {
 		madera_aif_warn(dai, "Cannot change rate while active\n");
-		ret = -EBUSY;
-		goto out;
+		return -EBUSY;
 	}
 
 	/* Guard the rate change with SYSCLK cycles */
@@ -3055,9 +3046,6 @@ static int madera_hw_params_rate(struct snd_pcm_substream *substream,
 				      MADERA_AIF1_RATE_MASK, tar);
 	madera_spin_sysclk(priv);
 
-out:
-	mutex_unlock(&priv->rate_lock);
-
 	return ret;
 }
 
-- 
2.43.0

