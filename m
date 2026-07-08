Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A975548C8A1
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 14:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520434; cv=none; b=olmaNeawJ/5HmAQ3TZeRpPMfQFrzaVLZQxg3HB/CKFBgNE0fD4gmI8q9kkCAh4x+ltclznO6clv7Qa88wl6LVeUF3zIRq+Dkq7f+LJoXjbQJencs5aFZQTz/DRnxxo9UliIaMPjpaB7lnr8c6F/UdoaGWq9v41WQWql4e3StkmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520434; c=relaxed/simple;
	bh=JiDQaJ0zD6/ZCscbVOKmAWdNLeoxv2bO5m1HZEhDQpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jpjxeatt1h3vrgnziqhhe7gAVwhH0se0OldUL3QsAO+/npRnsrttYhywFC6zsO77Kq8ZQLXf9PFJRiuUKKIlSAAKwQD0bG2lcxB2hVr4l0q2RSzfRjSYm1Zrfv3PAUU7eHZiS/AJLeE6rAWufbBYLlmjDqnq3ZUaZ6pl3Vr7yL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qCJo+IYD; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qCJo+IYD"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-37e0a189b0bso652256a91.1
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 07:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520432; x=1784125232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cb8oag5ar6FqpWOnXZjHVza9DSOxnESBFSEvSLigZvU=;
        b=qCJo+IYDAsbWBdTe1a960JR5w5KGxnOB3FMB9UJuytP5FtmImUOZ+I9tQUIEmGmmn9
         ItyHfffU76MV9rdvBGp+1BUnxqwK5m97vUN1fHrYIWFOCaoPHxKmJ1D5qX7JUXoii6vM
         HrmvQu0to63Ck0yxi+Pkk9hAaLo+CS/40Uke1Y2N7y4pJFp1/aEQbF50OQ2JQZJ3uq2F
         6Ge7Knk9n2fs4hBgBUq1hSOANYMwq6NWUtDxgeWb0lk31Sqg6olWitfYceuv13XUpKJZ
         xHoQfhmYCc1nLpd2Q0KcfELJjZ/ExN/UfTiQmw1I2XYca0wX7kPT12tEWkqpFrd/+dmr
         0hKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520432; x=1784125232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cb8oag5ar6FqpWOnXZjHVza9DSOxnESBFSEvSLigZvU=;
        b=equ1awNQ7nzjO30LuPN7EE11B+f8FzTVGgU5jg7h5IPAAq/cwOFeoNq/3k5YQFap9b
         qUXY2tO6F4KHUCVZnWyxxp2MwOgpkBoxgn3tIfG+Phpfphh9GAstDOTDw2ykzgfHaPg+
         F3IfhL5j/uhCvMzJhsJKEyVIREFJftZvJXD6gg5eMgYFKruPF/G5GMi5sh2/Jso5/+4R
         djOdAtrHIxrSeM3adECLq/+ZVIjojYUvGmeidlPZWzgzkTKDbg/6+MU24kiAuEddlRTR
         q+032i4bnFHUZPUaunoqC4zVHmOaxNxr68zmYQzKKL8bzxAW7vSabR9S9AtGO3f6PwVg
         Tp2w==
X-Forwarded-Encrypted: i=1; AHgh+Rrq7AqFC+DQirSDHogHa1kkverAvKr1FbK4RZgA+k5BqeZ7JeCRsOLbWIjD/q2e0azzH+Bu9rePNXAepw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyO9gvdfYT4jxRTpXEYU5t40gTZ4mk4VvFCzX2oVzqdts7FOz6k
	O0BoIXp9Av/+okSE41Ws/6HH0Ky7nEPeyuRcoxR3cqL+VVNF2EW3wZun
X-Gm-Gg: AfdE7cl2KZfZ1dn8vULcFKl1mHBTy+f6YALa/+kUGI/EQxRH8A4DT+1ZOzQr2Dy54si
	l/izi+m10VODSpYX9GqPDzgn2298RreKZCzm+1kul6QzLXfpVMADUdtiN8A6UEJQoe+6kpLHt5v
	cxUej6hnpsaN7yGS26tAtiP29WBSklSlgwRwbnHUO6L7QjMYKpnetAnVPrmLVdPj0ZW8FWwip/d
	aLeCilVG01WUgXa1xJ7pWxQvYWPBNpNtEIcDJAfMVLZrzuKnKSAKYi04vMpHB2/jeLdoKElMFrc
	sidebPWrquteKOxI2VAlT+ocIl+aPp2Y2hFDfcT05Y6U2TYWHnUErHaeVaXDUKoVK4HwAN0KD9R
	yHJC8FiubPA1ptkr1Nf92A8ClkM5j1XBSRAodCA5srFUVlk5M/SLse1QPdAizFci3HqjY3hoHkN
	ViVDgS0AorlJm5t7CW0pJKtg/q7g6kM3/ZMR/5N3WG+zNU6r8=
X-Received: by 2002:a17:90b:1d51:b0:387:e0db:bc30 with SMTP id 98e67ed59e1d1-38942691945mr2587146a91.38.1783520431851;
        Wed, 08 Jul 2026 07:20:31 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:20:31 -0700 (PDT)
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
Subject: [PATCH v2 11/27] ASoC: codecs: madera: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:18 +0700
Message-ID: <20260708141734.578926-12-phucduc.bui@gmail.com>
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

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2: 
 - Add Reviewed-by tags from Charles
 - Remove the temporary `ret` variable and return directly in 
   madera_adsp_rate_put().

 sound/soc/codecs/madera.c | 39 +++++++++++++--------------------------
 1 file changed, 13 insertions(+), 26 deletions(-)

diff --git a/sound/soc/codecs/madera.c b/sound/soc/codecs/madera.c
index 98d72db599d8..55ea6950ca90 100644
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
@@ -893,7 +891,6 @@ static int madera_adsp_rate_put(struct snd_kcontrol *kcontrol,
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	const int adsp_num = e->shift_l;
 	const unsigned int item = ucontrol->value.enumerated.item[0];
-	int ret = 0;
 
 	if (item >= e->items)
 		return -EINVAL;
@@ -903,22 +900,20 @@ static int madera_adsp_rate_put(struct snd_kcontrol *kcontrol,
 	 * maintain consistent behaviour that rate domains cannot be changed
 	 * while in use since this is a hardware requirement
 	 */
-	mutex_lock(&priv->rate_lock);
+	guard(mutex)(&priv->rate_lock);
 
 	if (!madera_can_change_grp_rate(priv, priv->adsp[adsp_num].cs_dsp.base)) {
 		dev_warn(priv->madera->dev,
 			 "Cannot change '%s' while in use by active audio paths\n",
 			 kcontrol->id.name);
-		ret = -EBUSY;
+		return -EBUSY;
 	} else if (priv->adsp_rate_cache[adsp_num] != e->values[item]) {
 		/* Volatile register so defer until the codec is powered up */
 		priv->adsp_rate_cache[adsp_num] = e->values[item];
-		ret = 1;
+		return 1;
 	}
 
-	mutex_unlock(&priv->rate_lock);
-
-	return ret;
+	return 0;
 }
 
 static const struct soc_enum madera_adsp_rate_enum[] = {
@@ -1061,15 +1056,13 @@ int madera_rate_put(struct snd_kcontrol *kcontrol,
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
@@ -1082,8 +1075,6 @@ int madera_rate_put(struct snd_kcontrol *kcontrol,
 		ret = snd_soc_put_enum_double(kcontrol, ucontrol);
 		madera_spin_sysclk(priv);
 	}
-out:
-	mutex_unlock(&priv->rate_lock);
 
 	return ret;
 }
@@ -3041,12 +3032,11 @@ static int madera_hw_params_rate(struct snd_pcm_substream *substream,
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
@@ -3055,9 +3045,6 @@ static int madera_hw_params_rate(struct snd_pcm_substream *substream,
 				      MADERA_AIF1_RATE_MASK, tar);
 	madera_spin_sysclk(priv);
 
-out:
-	mutex_unlock(&priv->rate_lock);
-
 	return ret;
 }
 
-- 
2.43.0

