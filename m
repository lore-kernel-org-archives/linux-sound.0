Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C4643E9D1
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 10:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692522; cv=none; b=SJEXJYeRzGLm3LvmzQ+/Qv6FyY786f0CLq4Grl+El2FcBM2oLmtfwrmvkStIt1rG+RlCCj8FNf1oCCzrRObClDKwcnF+vtOolAk/URw0jPIcYmGvfQiLQq5IPn1UlcwdZeLMSLBNmwNz48V2mEYh+Ty3630fWpdRobHWyamDmfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692522; c=relaxed/simple;
	bh=M1AXoaCuL8pjqNql9MYUGjojDAFzwdkOmfsJJ+5uCN0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FtMe3J1lqz6rHEW8c1nlppkLK9NOac+OtBjIhCYN2DI7ebfVBPXL2N26vUBjIOgSKTr7RJ4frjoJ2W0fNz/6ASk3YT8w4mjwaBblWF0AFvSy9YN5MT9GDn9j4Ui8PQ4RSkqLRokBHQj6pHqWt8lPFV4TYXCGOTzDCzCJDXuoILk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PsFZ2eq+; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PsFZ2eq+"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-30b6dad2382so6290873eec.0
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 03:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692520; x=1782297320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZtDDrpvFiW9v2e0+BVdUVB419JMabOyntlf8qyBQjjg=;
        b=PsFZ2eq+3pXEoGjElsnP6fBOATbPSIbSrK3hQrQ/7q5OrAqKhDbobuvnVCIyk+IZI9
         QmlFw+qEHCHiarbA+J7uHDc6LWeKcdwgqKZamx82o9zs153KKSoj6x34Yo+R/6nUD7kf
         FWbzXxUfCKuuz12c44obpXYZVtB5F5cOX1DLL2F4cB/jEcGkd34oA7ysGt/8jvFHTQMX
         WO6wGtoL/R54hk6J7j+2UV12QOKlqjfwrMfSY24zhQwtAHQQiljKsbvGxPXGahV2JiXO
         KTkcZkUKSVz6vjCskAqEOTkAe96ffN3rZeXl/4iHJgTUhe+7vsc3bmAu2X/KzlW7cau+
         hHyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692520; x=1782297320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZtDDrpvFiW9v2e0+BVdUVB419JMabOyntlf8qyBQjjg=;
        b=ceNmtPcNIkKHFgpTMdbMieJkiwXkrVAGBqQe9CftcDW/RGmUFzh7RGGMWrAfB1Mssa
         km5h8Vx4qWtvERpJgHXyVdie24yh5IX6Q5aZ5h2SB2G5SdtczvAhiT+5m2kOnA+g3JWT
         Kwe2GnCvVBq4L+jL7QEuStf03mHk+JBzAOQnO+kmpLVTu0K6wTJ6RfdhaBGVxIG1yJS/
         VuehwFgf4j1O6mZnooMUKB5r2GQhbCQpriQ1R3IcbzbR/3Y0uOMTY8q0zFKtxhhodCS3
         v193r68/OYa3NxKKAQPiFiAtHgN0876dgD7Yi2nnAA2pHOx1ZF7p8mN7VHf2mQAUgTe7
         EX0Q==
X-Forwarded-Encrypted: i=1; AFNElJ9UA42kWNnq8i+riFSyxFXKADY6UePHdC2P1uoOxRThEDq5PZbzRBvagKVPnna5li9etwHhkXF6WBsfOA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp+kwA313i01if3F7pgAleLeKjGZal2kY5kHH42V8ShkVclmWX
	2dGe+FmSPXo1eijampv/q7iOkjl02NdP+lL245xH/baZq9d0E8isjNA1
X-Gm-Gg: AfdE7cny6BdEKyTln/1BGL/4EVWEayTuCDyKhH39iKTv3Ald+i8WGu2ZlJ9YxFV6v5E
	NePtVJdNrkgoEvKeFNLddrc0rCbyCKfxVUhumliHUAaWAjdNKygESl5mvBgBumBcinavWdmWAJu
	Ef9qU50SJpeGoc/7thOmmhn7BpJP4K7+J1pnDHFnV6GMv7UujDiNu91xrDMjgpCaeojAMR3g+7K
	tQgPgrqWdisFZ15yladVWdHUaYgT8crYnf9VAWTUAY7unrtlBqEcPojG6r/fZvz42/dPwZR1ebZ
	IpR7ieZonYZjQpGjb3A97onoJkJBlAicXZbsArqPOVc6ivUVC3pMenigv8jkWuDK7YtNisc6gbW
	FmwLmDdFqI/v6AjX2o5fmEDZhL/v5lro4ibYITiVi3BaKRTRB2/mTLo6cKe4XLqPtRaGLuTgWrF
	mTtz6KoFWseTHy4pQulPsDHqNovJ0FrqJIS9pUqBc7gEOMzfI=
X-Received: by 2002:a05:693c:639b:20b0:30b:e4a3:44d2 with SMTP id 5a478bee46e88-30be4a363f6mr103693eec.8.1781692519548;
        Wed, 17 Jun 2026 03:35:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:35:19 -0700 (PDT)
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
Subject: [PATCH 15/78] ASoC: codecs: cs42l43: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:32 +0700
Message-ID: <20260617103235.449609-16-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs42l43-jack.c | 57 +++++++++++++--------------------
 sound/soc/codecs/cs42l43.c      | 16 +++------
 2 files changed, 27 insertions(+), 46 deletions(-)

diff --git a/sound/soc/codecs/cs42l43-jack.c b/sound/soc/codecs/cs42l43-jack.c
index 934666295ee3..d6c0f5139792 100644
--- a/sound/soc/codecs/cs42l43-jack.c
+++ b/sound/soc/codecs/cs42l43-jack.c
@@ -445,20 +445,18 @@ irqreturn_t cs42l43_button_release(int irq, void *data)
 		return iret;
 	}
 
-	mutex_lock(&priv->jack_lock);
-
-	if (priv->button_detect_running) {
-		dev_dbg(priv->dev, "Button release IRQ\n");
+	scoped_guard(mutex, &priv->jack_lock) {
+		if (priv->button_detect_running) {
+			dev_dbg(priv->dev, "Button release IRQ\n");
 
-		snd_soc_jack_report(priv->jack_hp, 0, CS42L43_JACK_BUTTONS);
+			snd_soc_jack_report(priv->jack_hp, 0, CS42L43_JACK_BUTTONS);
 
-		iret = IRQ_HANDLED;
-	} else {
-		dev_dbg(priv->dev, "Spurious button release IRQ\n");
+			iret = IRQ_HANDLED;
+		} else {
+			dev_dbg(priv->dev, "Spurious button release IRQ\n");
+		}
 	}
 
-	mutex_unlock(&priv->jack_lock);
-
 	pm_runtime_put_autosuspend(priv->dev);
 
 	return iret;
@@ -477,22 +475,20 @@ void cs42l43_bias_sense_timeout(struct work_struct *work)
 		return;
 	}
 
-	mutex_lock(&priv->jack_lock);
-
-	if (cs42l43_jack_present(priv) && priv->button_detect_running) {
-		dev_dbg(priv->dev, "Bias sense timeout out, restore bias\n");
+	scoped_guard(mutex, &priv->jack_lock) {
+		if (cs42l43_jack_present(priv) && priv->button_detect_running) {
+			dev_dbg(priv->dev, "Bias sense timeout out, restore bias\n");
 
-		regmap_update_bits(cs42l43->regmap,
-				   CS42L43_HS_BIAS_SENSE_AND_CLAMP_AUTOCONTROL,
-				   CS42L43_AUTO_HSBIAS_CLAMP_EN_MASK, 0);
-		regmap_update_bits(cs42l43->regmap,
-				   CS42L43_HS_BIAS_SENSE_AND_CLAMP_AUTOCONTROL,
-				   CS42L43_AUTO_HSBIAS_CLAMP_EN_MASK,
-				   CS42L43_AUTO_HSBIAS_CLAMP_EN_MASK);
+			regmap_update_bits(cs42l43->regmap,
+					   CS42L43_HS_BIAS_SENSE_AND_CLAMP_AUTOCONTROL,
+					   CS42L43_AUTO_HSBIAS_CLAMP_EN_MASK, 0);
+			regmap_update_bits(cs42l43->regmap,
+					   CS42L43_HS_BIAS_SENSE_AND_CLAMP_AUTOCONTROL,
+					   CS42L43_AUTO_HSBIAS_CLAMP_EN_MASK,
+					   CS42L43_AUTO_HSBIAS_CLAMP_EN_MASK);
+		}
 	}
 
-	mutex_unlock(&priv->jack_lock);
-
 	pm_runtime_put_autosuspend(priv->dev);
 }
 
@@ -895,9 +891,8 @@ int cs42l43_jack_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *u
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct cs42l43_codec *priv = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&priv->jack_lock);
+	guard(mutex)(&priv->jack_lock);
 	ucontrol->value.integer.value[0] = priv->jack_override;
-	mutex_unlock(&priv->jack_lock);
 
 	return 0;
 }
@@ -913,17 +908,13 @@ int cs42l43_jack_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *u
 	if (override >= e->items)
 		return -EINVAL;
 
-	mutex_lock(&priv->jack_lock);
+	guard(mutex)(&priv->jack_lock);
 
-	if (!cs42l43_jack_present(priv)) {
-		mutex_unlock(&priv->jack_lock);
+	if (!cs42l43_jack_present(priv))
 		return -EBUSY;
-	}
 
-	if (override == priv->jack_override) {
-		mutex_unlock(&priv->jack_lock);
+	if (override == priv->jack_override)
 		return 0;
-	}
 
 	priv->jack_override = override;
 
@@ -983,7 +974,5 @@ int cs42l43_jack_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *u
 				    cs42l43_jack_override_modes[override].report);
 	}
 
-	mutex_unlock(&priv->jack_lock);
-
 	return 1;
 }
diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index f0d6ff0b2976..72c5c0340c48 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -1208,14 +1208,12 @@ static void cs42l43_spk_vu_sync(struct cs42l43_codec *priv)
 {
 	struct cs42l43 *cs42l43 = priv->core;
 
-	mutex_lock(&priv->spk_vu_lock);
+	guard(mutex)(&priv->spk_vu_lock);
 
 	regmap_update_bits(cs42l43->regmap, CS42L43_INTP_VOLUME_CTRL1,
 			   CS42L43_AMP1_2_VU_MASK, CS42L43_AMP1_2_VU_MASK);
 	regmap_update_bits(cs42l43->regmap, CS42L43_INTP_VOLUME_CTRL1,
 			   CS42L43_AMP1_2_VU_MASK, 0);
-
-	mutex_unlock(&priv->spk_vu_lock);
 }
 
 static int cs42l43_shutter_get(struct cs42l43_codec *priv, unsigned int shift)
@@ -1602,7 +1600,7 @@ static int cs42l43_pll_ev(struct snd_soc_dapm_widget *w,
 	struct cs42l43 *cs42l43 = priv->core;
 	int ret;
 
-	mutex_lock(&cs42l43->pll_lock);
+	guard(mutex)(&cs42l43->pll_lock);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -1627,8 +1625,6 @@ static int cs42l43_pll_ev(struct snd_soc_dapm_widget *w,
 		break;
 	}
 
-	mutex_unlock(&cs42l43->pll_lock);
-
 	return ret;
 }
 
@@ -2566,13 +2562,9 @@ static int cs42l43_set_sysclk(struct snd_soc_component *component, int clk_id,
 {
 	struct cs42l43_codec *priv = snd_soc_component_get_drvdata(component);
 	struct cs42l43 *cs42l43 = priv->core;
-	int ret;
 
-	mutex_lock(&cs42l43->pll_lock);
-	ret = cs42l43_set_pll(priv, src, freq);
-	mutex_unlock(&cs42l43->pll_lock);
-
-	return ret;
+	guard(mutex)(&cs42l43->pll_lock);
+	return cs42l43_set_pll(priv, src, freq);
 }
 
 static int cs42l43_component_probe(struct snd_soc_component *component)
-- 
2.43.0

