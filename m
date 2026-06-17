Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12273481643
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 10:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692711; cv=none; b=MQW/xiX7RxIaDIRyumWHyXSSzgG0e+LpSNm6B/rAqNq/IaJOMZEMrK0INWPN25xXzqQblcUmCmUYhuTQXVRza8/SRGwfk+zZeHLJQb2HH5uBKqDpGA1UnHroC8E2iJNA6MRlC/61JzJTkDqVGmE0TfRjsgLhNdyZ69ORFChUrWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692711; c=relaxed/simple;
	bh=0JhvFKNYeb49RLF6bYiTwSAs/DtlSFc2jfqE8DFfeig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WUx1Wehr70bDNdRdJpqIfIUUFi124PhEnpnKK3seRHrW13RE2zpqOrqSdIr90z/LMzKGVD3nsBiTtFVPSEsS5Gc6E7svWtfprL5YH9IJTz5el0fOUUVEJGtzJAW7iN9GRkj4MWu+6gfrr/KCoMYu8gjEPx3bZIFhASSaBa3wzqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jh/l4rwq; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jh/l4rwq"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-30b6dad2382so6294663eec.0
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 03:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692705; x=1782297505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MkZBCMurUYtbXlyM1bHHJ4jat4Djw6dn8DDEDOcRodM=;
        b=Jh/l4rwqMEXSULgwXJcwlJs2AxjTyjKt1ulZvQGn7b9v7gOgV7KW7YF/bjaQmXDEiS
         DpgD7d87o1vr7xnbNxtCnRSVyePFP7ffIkZ7eSB0Xa1jGBAEcNsjAOdhBrP7XrdGDZ/J
         EtzDGC2HDK/zYMFFr8pkxRa9tmFi7kL5Z+rQ/TE6wW8bPkaSHKBcRS6AyZEUT36VpZ3L
         sshcVuHBGDOseiMiraOnpGKk+IREL5CbtdtU5dt4+oGC1FI9Hdxu+TD7W5xNy7I9+qCc
         4c88zcmNveXBuek/I6Eb2RpyU3m2UD5UvNUfwULMf/1W9pz49iQryYIxImehASGj8wqG
         JGWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692705; x=1782297505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MkZBCMurUYtbXlyM1bHHJ4jat4Djw6dn8DDEDOcRodM=;
        b=TLmIMjus0XFtsLn7mBfBvtxjETOQI5fHJwi4xS99F99uUVwonoOwMh0wjHLfntsPvR
         6/6DiqftRcx2zqoymSGmrchMrebWpEtT9smVqHaaQZpux2iwLQLCo5CCHlNYH3/BcNhZ
         Pwic2sZuIJKKicqbNP/qXXkabDKOOwJ5A3PgfK60gOl8O/ogeG+uQXB7BjXwTuPnn9oa
         h11w/WpyXK/t+ZwseQ/X5Fkv9JddLA9778zUDIPrBO783c+lP2zKmfG9dn2qMkBVpwvh
         1dxWVh+p5WDa8Zmo1uAWKce7TCjS59XDtQ9SO8IgiGYcNkSFHRZEQv/U8IlYX8/AYhoL
         w/XA==
X-Forwarded-Encrypted: i=1; AFNElJ9EQzRaNd1/Ihmv+ovgG38x43ZNvRsvjaxnjSlwiDZDvxLKk48wNPwkVEs9L7ipO1nIDTL7t0KzvNa9aw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo+dpa8cCa0oR2du7pCxGEdMxPkpnYclgveZTU5w5yM9+T4ari
	V6Q9qDbL7jt/R4b8X8L5B8hnZcVtWDhI2dAuEIUrHCNzB9XahcUZeXbv
X-Gm-Gg: AfdE7ck5a6u7UdDZO/wSMCSOKqXmqSJav+SnQ7sxwwZZf+1hRlQiIzjwAERxzlWgiNi
	MXjZ3EkGpgSG6huTwNXhl+zBmneQSwO+9x6UDW5SKUNVj4PakFhYXTQGOxGcafGLBfOm/UTmbMS
	TiYSlw8Q0tpapDKtlNZlc/N+c7u97juSJhA0LVsFnT4eeRVJqWOOMw6JH5jODA9+jOETEgMLhXa
	lCsTG8k+xiroAYJlz8Tzu0+3217sanKgNtMr5IygKMeX5NGlyqYpFcEBAyuGsFDNMavV2gsks2r
	wxaM8HvbGE2mb82BWUoz6jeEZw9An2K8nhcQb/FSa4RnB5G8TXVk2A/bN7NBBhvMSkV+6IC02G0
	MZp8E2R8g3av9qw2nnMZmXQ7c8X6n4iMP4U2IscmA2qxZszBIlF2eNFxW1bPdi/QStqB34CYHb4
	7q0LLRUQ04bbYLmLGW+w7A8NeK6pRBJgz6J3qoUjsD/Ytxw8I=
X-Received: by 2002:a05:7300:2153:b0:30b:8860:94c1 with SMTP id 5a478bee46e88-30bcae21d20mr1491165eec.23.1781692705015;
        Wed, 17 Jun 2026 03:38:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:38:24 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 35/78] ASoC: codecs: madera: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:52 +0700
Message-ID: <20260617103235.449609-36-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/madera.c | 31 +++++++++----------------------
 1 file changed, 9 insertions(+), 22 deletions(-)

diff --git a/sound/soc/codecs/madera.c b/sound/soc/codecs/madera.c
index 98d72db599d8..03bb1ed70b29 100644
--- a/sound/soc/codecs/madera.c
+++ b/sound/soc/codecs/madera.c
@@ -513,7 +513,7 @@ int madera_domain_clk_ev(struct snd_soc_dapm_widget *w,
 	 * We can't rely on the DAPM mutex for locking because we need a lock
 	 * that can safely be called in hw_params
 	 */
-	mutex_lock(&priv->rate_lock);
+	guard(mutex)(&priv->rate_lock);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -532,8 +532,6 @@ int madera_domain_clk_ev(struct snd_soc_dapm_widget *w,
 
 	madera_debug_dump_domain_groups(priv);
 
-	mutex_unlock(&priv->rate_lock);
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(madera_domain_clk_ev);
@@ -875,9 +873,8 @@ static int madera_adsp_rate_get(struct snd_kcontrol *kcontrol,
 	const int adsp_num = e->shift_l;
 	int item;
 
-	mutex_lock(&priv->rate_lock);
-	cached_rate = priv->adsp_rate_cache[adsp_num];
-	mutex_unlock(&priv->rate_lock);
+	scoped_guard(mutex, &priv->rate_lock)
+		cached_rate = priv->adsp_rate_cache[adsp_num];
 
 	item = snd_soc_enum_val_to_item(e, cached_rate);
 	ucontrol->value.enumerated.item[0] = item;
@@ -903,7 +900,7 @@ static int madera_adsp_rate_put(struct snd_kcontrol *kcontrol,
 	 * maintain consistent behaviour that rate domains cannot be changed
 	 * while in use since this is a hardware requirement
 	 */
-	mutex_lock(&priv->rate_lock);
+	guard(mutex)(&priv->rate_lock);
 
 	if (!madera_can_change_grp_rate(priv, priv->adsp[adsp_num].cs_dsp.base)) {
 		dev_warn(priv->madera->dev,
@@ -916,8 +913,6 @@ static int madera_adsp_rate_put(struct snd_kcontrol *kcontrol,
 		ret = 1;
 	}
 
-	mutex_unlock(&priv->rate_lock);
-
 	return ret;
 }
 
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

