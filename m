Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B143845DF
	for <linux-sound@vger.kernel.org>; Thu, 30 Apr 2026 15:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777563952; cv=none; b=GxlUdgnNupDQEvL+rZcJ96bni+ZgX4wzXr9oNevNk/3JW7BL0FevHk+sq3bxbhRUn/nD3Y7FTCrufJjXO3VUYqcSrTXbxN2W7TuWlVZnnnv4R0q/mkdwD93Lyn65/BwnJ/aiz+JUBmdhb2uLmrTF0PVM5PHW9gmVlV1mSqz/qTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777563952; c=relaxed/simple;
	bh=3O9MT2Slnp0w88m0Qz/m0Rx0qYMhWq63E5RfUVPUx3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AyGecozzwLtQfO+eN0DeutybFcqdLr0wPr84kIbn3edAH9Fz2ntJWQTu9rNXQZUF682BhO7kbYiPnb/iCeFnhXylBKh4Jygdy5KD63wW8IPfPHsH2/DA7dedkgS2eVN7Vvj/yb6z8iJaxqaSH2myh/5cHhRyJYZtuifC2xv4h5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=V+B/CU5O; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="V+B/CU5O"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso9588675e9.3
        for <linux-sound@vger.kernel.org>; Thu, 30 Apr 2026 08:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1777563944; x=1778168744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S0/CA2bDA7oDXiB9ySWJKkd5Cv50zdw+ycM6UMWFwA4=;
        b=V+B/CU5OfFSZ//Vh6oLZsDywNMhGMyEj1vqylru3zfXR0mC/2Gh5WxeSeu30xZSiIA
         c0PA7yhBvqk5iqt06LtTlBio6hKYBzAN/Eo4FV34hwZlSgvU6MQ5ZUwD+QQPUBWbMw6K
         MpE7F0+gE3CNaIxjqRDYJZR/jM3AEvDbOqg1l3z/T0OIVa0LHTKjVIB0URVYbOSEn+iM
         RtBiVsdpWBs1VUoZtP7kUEW6DbPTTDIWGnWzUv2GV7JowT3NawcoqtaThRKMseAaZ13O
         iK2sGajVugqQRFRZ9eHjpzCYYk1Nk3IT33QJhk1boHCY3rnKJkJvHtWrRd8fpfeDcAC7
         NbwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777563944; x=1778168744;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0/CA2bDA7oDXiB9ySWJKkd5Cv50zdw+ycM6UMWFwA4=;
        b=Ubs+mFw2oVXkMStfmL35ATiqoBYPKixeiIJKwAfq/roM2dutLO+L4whRRElbcivmqn
         qQGtdznyorkb9XbbOMFB61rncyqbG3b/buBH5vqQY+N/9r2XYdFLr3+mCERf4YgmFgi1
         A8Zb2r4oYKnZBV1+RB+rIYinCp9apEROO1WiKjr94dTliqLwZkXbOBAxUNSdpAUIHgBI
         mYcKckO6v9Lybo6eTadJGnwuRh05YJzR3lJkH0lKFsEmmKBKjPy2LzVpqKOqAykdukNL
         0wPd0s89rS+Z4eanYM7kWsZKqwLTtodQJ5JYAC2b2yAYlu3qylcTiPGUAfGp18Tsn0Cp
         WYjw==
X-Forwarded-Encrypted: i=1; AFNElJ9uhfCpp5W/y9nbQpPbN1cbNrkz19ALg1LM1jH71OT3WMCgJ4WULQHJERz1Sf9qqXLEOcqONap14w6cJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6GN64lFkxcE3iFwYmjrF5Ae/MOhr+ai6mopEcMMh0Zpk8VEDY
	Rp+fcyKKPlIMvecJAJ6UCcVpAJ4TMxiH2Mam8V9shf2jirSo/YYtnFDaiFF3JxRdgcE=
X-Gm-Gg: AeBDietHI8f5REMCeNi1w5sGuBKSlXHPcgp+AagpRznVvqDofg3hcUjM6QPOW6DR7v/
	9Drfi4HrmaRk1f6/cPKQMivcallVNxftakBRBZB2ROd2/GsBs8q+fsMWxCjzWSq5wvI6ZfcJXcm
	46mnBdvRAJpRRI42dIhGJLqD8RMo6tWIsvIZCmQDXu7TBFmBMJ38XLneoCYRqTMmlWgFmZgKqwh
	YwBwtOX68N0MsBZeg9e/EF6M8WsFhHG9Xv2sl9PFxL3jxafpsdSDJo8EMC+0MZ7sxk9/D3vRynd
	8xYpekgY5IqEBT0m5kzVvgm7KSsFhqWvjIi1maUOX1NHTPwtaqn0Qa/ROnrj4JIFBkmFuLY6QqZ
	E3AYSa0JqaFmoTILlHpahdDB9s7/OnXKMEjv0Z9HAemrqDJkEa7lsny1XRFXCT+nJt6BPWb8L9t
	4/TzH3ijsUkdB3CBlYoKNqgkeJKv0V1cDCz6OlD/wuqVEmjQk3WNJUquYbrGCYeDyrYsr+ciWwV
	KPPyHmNoAC7aw8lAOJTUeBWZVhnNW+JrZw=
X-Received: by 2002:a05:600c:4f50:b0:48a:6fd4:d3d3 with SMTP id 5b1f17b1804b1-48a8444bb67mr68487805e9.20.1777563943335;
        Thu, 30 Apr 2026 08:45:43 -0700 (PDT)
Received: from localhost (p200300f65f114e081177085aa618d19b.dip0.t-ipconnect.de. [2003:f6:5f11:4e08:1177:85a:a618:d19b])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48a81ed6b65sm120851675e9.3.2026.04.30.08.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 08:45:42 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Ola Lilja <ola.o.lilja@stericsson.com>
Cc: "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	linux-sound@vger.kernel.org
Subject: [PATCH v2] ASoC: codecs: ab8500: Remove suspicious code
Date: Thu, 30 Apr 2026 17:45:24 +0200
Message-ID: <20260430154524.338912-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=14999; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=3O9MT2Slnp0w88m0Qz/m0Rx0qYMhWq63E5RfUVPUx3Q=; b=owGbwMvMwMXY3/A7olbonx/jabUkhszPlSLaAvxzfieE/15/eyFHW67ZgVVLZKe+j9oaos/8c dZRVqnATkZjFgZGLgZZMUUW+8Y1mVZVcpGda/9dhhnEygQyhYGLUwAm8kKF/Tf71KiCbpUovult oeEtWjMkLk6+nX2Z+ZPHCePq723HxARfrvX+27WF75aJ6Fuvy4/1fuqfLtXnTPt34vsDs2n3d3q mWHP2HX4yg89ASs6eXWbpvnQdsZ3VOSsnGDIpOoma5fQZ/quNSTS+XnO6J5E1g9daW3lzUmO+9L opZWq+cyw27Vg7t8RQMltzdU5cnLmyXahaoEqFC99W9VWrrt7mubLpwJHLnkwx3V56yrl/r6fHF tsY9h+U+hzyqFtG56yVnEnVIstj7zjXmG06u2LW1dOp76/1Oxfq9v00KDeI67+Xw+PySd9FNS5k qXfh7i2aZxX1L12o3NixxdpgCoep5Vtuz79rw1Rfnp8JAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

anc_configure() passed values from drvdata->anc_fir_values[],
drvdata->anc_iir_values[] and drvdata->sid_fir_values[] as register
offset to snd_soc_component_read(). The content of these arrays are user
controllable via the component controls "ANC FIR Coefficients", "ANC
IIR Coefficients" and "Sidetone FIR Coefficients" which I assume are
supposed to hold register values, not register offsets.

Without a datasheet for that component and given that before commit
a201aef1a88b ("ASoC: codecs: ab8500: Fix casting of private data") the
arrays overlapped with driver control structures and thus didn't work
properly since 2012, drop that functionality and let someone repair it
who has an actual need for it.

With the core functionally removed several code parts become essentially
unused and are removed, too.

Reported-by: Sashiko (gemini/gemini-3.1-pro-preview)
Link: https://sashiko.dev/#/patchset/20260428192255.2294705-2-u.kleine-koenig%40baylibre.com
Fixes: 679d7abdc754 ("ASoC: codecs: Add AB8500 codec-driver")
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
Hello,

changes since (implicit) v1[1] are that a similar issue for
sid_fir_values[] is also removed and the dead code removal.

Best regards
Uwe

[1] https://lore.kernel.org/all/20260429080810.2375150-2-u.kleine-koenig@baylibre.com

 sound/soc/codecs/ab8500-codec.c | 304 +-------------------------------
 1 file changed, 3 insertions(+), 301 deletions(-)

diff --git a/sound/soc/codecs/ab8500-codec.c b/sound/soc/codecs/ab8500-codec.c
index 8ab2e60f80b4..6e8ef9cd1b31 100644
--- a/sound/soc/codecs/ab8500-codec.c
+++ b/sound/soc/codecs/ab8500-codec.c
@@ -60,19 +60,6 @@
 low before proceeding with the configuration sequence */
 #define AB8500_ANC_SM_DELAY			2000
 
-#define AB8500_FILTER_CONTROL(xname, xcount, xmin, xmax) \
-{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname), \
-	.info = filter_control_info, \
-	.get = filter_control_get, .put = filter_control_put, \
-	.private_value = (unsigned long)&(struct filter_control) \
-		{.count = xcount, .min = xmin, .max = xmax} }
-
-struct filter_control {
-	long min, max;
-	unsigned int count;
-	long value[128];
-};
-
 /* Sidetone states */
 static const char * const enum_sid_state[] = {
 	"Unconfigured",
@@ -85,45 +72,13 @@ enum sid_state {
 	SID_FIR_CONFIGURED = 2,
 };
 
-static const char * const enum_anc_state[] = {
-	"Unconfigured",
-	"Apply FIR and IIR",
-	"FIR and IIR are configured",
-	"Apply FIR",
-	"FIR is configured",
-	"Apply IIR",
-	"IIR is configured"
-};
-enum anc_state {
-	ANC_UNCONFIGURED = 0,
-	ANC_APPLY_FIR_IIR = 1,
-	ANC_FIR_IIR_CONFIGURED = 2,
-	ANC_APPLY_FIR = 3,
-	ANC_FIR_CONFIGURED = 4,
-	ANC_APPLY_IIR = 5,
-	ANC_IIR_CONFIGURED = 6
-};
-
-/* Analog microphones */
-enum amic_idx {
-	AMIC_IDX_1A,
-	AMIC_IDX_1B,
-	AMIC_IDX_2
-};
-
 /* Private data for AB8500 device-driver */
 struct ab8500_codec_drvdata {
 	struct regmap *regmap;
 	struct mutex ctrl_lock;
 
 	/* Sidetone */
-	long *sid_fir_values;
 	enum sid_state sid_status;
-
-	/* ANC */
-	long *anc_fir_values;
-	long *anc_iir_values;
-	enum anc_state anc_status;
 };
 
 static inline const char *amic_micbias_str(enum amic_micbias micbias)
@@ -1024,89 +979,6 @@ static const struct snd_soc_dapm_route ab8500_dapm_routes_mic2_vamicx[] = {
 	{"MIC2 V-AMICx Enable", NULL, "V-AMIC2"},
 };
 
-/* ANC FIR-coefficients configuration sequence */
-static void anc_fir(struct snd_soc_component *component,
-		unsigned int bnk, unsigned int par, unsigned int val)
-{
-	if (par == 0 && bnk == 0)
-		snd_soc_component_update_bits(component, AB8500_ANCCONF1,
-			BIT(AB8500_ANCCONF1_ANCFIRUPDATE),
-			BIT(AB8500_ANCCONF1_ANCFIRUPDATE));
-
-	snd_soc_component_write(component, AB8500_ANCCONF5, val >> 8 & 0xff);
-	snd_soc_component_write(component, AB8500_ANCCONF6, val &  0xff);
-
-	if (par == AB8500_ANC_FIR_COEFFS - 1 && bnk == 1)
-		snd_soc_component_update_bits(component, AB8500_ANCCONF1,
-			BIT(AB8500_ANCCONF1_ANCFIRUPDATE), 0);
-}
-
-/* ANC IIR-coefficients configuration sequence */
-static void anc_iir(struct snd_soc_component *component, unsigned int bnk,
-		unsigned int par, unsigned int val)
-{
-	if (par == 0) {
-		if (bnk == 0) {
-			snd_soc_component_update_bits(component, AB8500_ANCCONF1,
-					BIT(AB8500_ANCCONF1_ANCIIRINIT),
-					BIT(AB8500_ANCCONF1_ANCIIRINIT));
-			usleep_range(AB8500_ANC_SM_DELAY, AB8500_ANC_SM_DELAY*2);
-			snd_soc_component_update_bits(component, AB8500_ANCCONF1,
-					BIT(AB8500_ANCCONF1_ANCIIRINIT), 0);
-			usleep_range(AB8500_ANC_SM_DELAY, AB8500_ANC_SM_DELAY*2);
-		} else {
-			snd_soc_component_update_bits(component, AB8500_ANCCONF1,
-					BIT(AB8500_ANCCONF1_ANCIIRUPDATE),
-					BIT(AB8500_ANCCONF1_ANCIIRUPDATE));
-		}
-	} else if (par > 3) {
-		snd_soc_component_write(component, AB8500_ANCCONF7, 0);
-		snd_soc_component_write(component, AB8500_ANCCONF8, val >> 16 & 0xff);
-	}
-
-	snd_soc_component_write(component, AB8500_ANCCONF7, val >> 8 & 0xff);
-	snd_soc_component_write(component, AB8500_ANCCONF8, val & 0xff);
-
-	if (par == AB8500_ANC_IIR_COEFFS - 1 && bnk == 1)
-		snd_soc_component_update_bits(component, AB8500_ANCCONF1,
-			BIT(AB8500_ANCCONF1_ANCIIRUPDATE), 0);
-}
-
-/* ANC IIR-/FIR-coefficients configuration sequence */
-static void anc_configure(struct snd_soc_component *component,
-			bool apply_fir, bool apply_iir)
-{
-	struct ab8500_codec_drvdata *drvdata = dev_get_drvdata(component->dev);
-	unsigned int bnk, par, val;
-
-	dev_dbg(component->dev, "%s: Enter.\n", __func__);
-
-	if (apply_fir)
-		snd_soc_component_update_bits(component, AB8500_ANCCONF1,
-			BIT(AB8500_ANCCONF1_ENANC), 0);
-
-	snd_soc_component_update_bits(component, AB8500_ANCCONF1,
-		BIT(AB8500_ANCCONF1_ENANC), BIT(AB8500_ANCCONF1_ENANC));
-
-	if (apply_fir)
-		for (bnk = 0; bnk < AB8500_NR_OF_ANC_COEFF_BANKS; bnk++)
-			for (par = 0; par < AB8500_ANC_FIR_COEFFS; par++) {
-				val = snd_soc_component_read(component,
-						drvdata->anc_fir_values[par]);
-				anc_fir(component, bnk, par, val);
-			}
-
-	if (apply_iir)
-		for (bnk = 0; bnk < AB8500_NR_OF_ANC_COEFF_BANKS; bnk++)
-			for (par = 0; par < AB8500_ANC_IIR_COEFFS; par++) {
-				val = snd_soc_component_read(component,
-						drvdata->anc_iir_values[par]);
-				anc_iir(component, bnk, par, val);
-			}
-
-	dev_dbg(component->dev, "%s: Exit.\n", __func__);
-}
-
 /*
  * Control-events
  */
@@ -1130,7 +1002,7 @@ static int sid_status_control_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct ab8500_codec_drvdata *drvdata = dev_get_drvdata(component->dev);
-	unsigned int param, sidconf, val;
+	unsigned int param, sidconf;
 	int status = 1;
 
 	dev_dbg(component->dev, "%s: Enter\n", __func__);
@@ -1159,9 +1031,8 @@ static int sid_status_control_put(struct snd_kcontrol *kcontrol,
 	snd_soc_component_write(component, AB8500_SIDFIRADR, 0);
 
 	for (param = 0; param < AB8500_SID_FIR_COEFFS; param++) {
-		val = snd_soc_component_read(component, drvdata->sid_fir_values[param]);
-		snd_soc_component_write(component, AB8500_SIDFIRCOEF1, val >> 8 & 0xff);
-		snd_soc_component_write(component, AB8500_SIDFIRCOEF2, val & 0xff);
+		snd_soc_component_write(component, AB8500_SIDFIRCOEF1, 0);
+		snd_soc_component_write(component, AB8500_SIDFIRCOEF2, 0);
 	}
 
 	snd_soc_component_update_bits(component, AB8500_SIDFIRADR,
@@ -1180,136 +1051,6 @@ static int sid_status_control_put(struct snd_kcontrol *kcontrol,
 	return status;
 }
 
-static int anc_status_control_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct ab8500_codec_drvdata *drvdata = dev_get_drvdata(component->dev);
-
-	mutex_lock(&drvdata->ctrl_lock);
-	ucontrol->value.enumerated.item[0] = drvdata->anc_status;
-	mutex_unlock(&drvdata->ctrl_lock);
-
-	return 0;
-}
-
-static int anc_status_control_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
-	struct ab8500_codec_drvdata *drvdata = dev_get_drvdata(component->dev);
-	struct device *dev = component->dev;
-	bool apply_fir, apply_iir;
-	unsigned int req;
-	int status;
-
-	dev_dbg(dev, "%s: Enter.\n", __func__);
-
-	mutex_lock(&drvdata->ctrl_lock);
-
-	req = ucontrol->value.enumerated.item[0];
-	if (req >= ARRAY_SIZE(enum_anc_state)) {
-		status = -EINVAL;
-		goto cleanup;
-	}
-	if (req != ANC_APPLY_FIR_IIR && req != ANC_APPLY_FIR &&
-		req != ANC_APPLY_IIR) {
-		dev_err(dev, "%s: ERROR: Unsupported status to set '%s'!\n",
-			__func__, enum_anc_state[req]);
-		status = -EINVAL;
-		goto cleanup;
-	}
-	apply_fir = req == ANC_APPLY_FIR || req == ANC_APPLY_FIR_IIR;
-	apply_iir = req == ANC_APPLY_IIR || req == ANC_APPLY_FIR_IIR;
-
-	status = snd_soc_dapm_force_enable_pin(dapm, "ANC Configure Input");
-	if (status < 0) {
-		dev_err(dev,
-			"%s: ERROR: Failed to enable power (status = %d)!\n",
-			__func__, status);
-		goto cleanup;
-	}
-	snd_soc_dapm_sync(dapm);
-
-	anc_configure(component, apply_fir, apply_iir);
-
-	if (apply_fir) {
-		if (drvdata->anc_status == ANC_IIR_CONFIGURED)
-			drvdata->anc_status = ANC_FIR_IIR_CONFIGURED;
-		else if (drvdata->anc_status != ANC_FIR_IIR_CONFIGURED)
-			drvdata->anc_status =  ANC_FIR_CONFIGURED;
-	}
-	if (apply_iir) {
-		if (drvdata->anc_status == ANC_FIR_CONFIGURED)
-			drvdata->anc_status = ANC_FIR_IIR_CONFIGURED;
-		else if (drvdata->anc_status != ANC_FIR_IIR_CONFIGURED)
-			drvdata->anc_status =  ANC_IIR_CONFIGURED;
-	}
-
-	status = snd_soc_dapm_disable_pin(dapm, "ANC Configure Input");
-	snd_soc_dapm_sync(dapm);
-
-cleanup:
-	mutex_unlock(&drvdata->ctrl_lock);
-
-	if (status < 0)
-		dev_err(dev, "%s: Unable to configure ANC! (status = %d)\n",
-			__func__, status);
-
-	dev_dbg(dev, "%s: Exit.\n", __func__);
-
-	return (status < 0) ? status : 1;
-}
-
-static int filter_control_info(struct snd_kcontrol *kcontrol,
-			struct snd_ctl_elem_info *uinfo)
-{
-	struct filter_control *fc =
-			(struct filter_control *)kcontrol->private_value;
-
-	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
-	uinfo->count = fc->count;
-	uinfo->value.integer.min = fc->min;
-	uinfo->value.integer.max = fc->max;
-
-	return 0;
-}
-
-static int filter_control_get(struct snd_kcontrol *kcontrol,
-			struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct ab8500_codec_drvdata *drvdata = snd_soc_component_get_drvdata(component);
-	struct filter_control *fc =
-			(struct filter_control *)kcontrol->private_value;
-	unsigned int i;
-
-	mutex_lock(&drvdata->ctrl_lock);
-	for (i = 0; i < fc->count; i++)
-		ucontrol->value.integer.value[i] = fc->value[i];
-	mutex_unlock(&drvdata->ctrl_lock);
-
-	return 0;
-}
-
-static int filter_control_put(struct snd_kcontrol *kcontrol,
-		struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct ab8500_codec_drvdata *drvdata = snd_soc_component_get_drvdata(component);
-	struct filter_control *fc =
-			(struct filter_control *)kcontrol->private_value;
-	unsigned int i;
-
-	mutex_lock(&drvdata->ctrl_lock);
-	for (i = 0; i < fc->count; i++)
-		fc->value[i] = ucontrol->value.integer.value[i];
-	mutex_unlock(&drvdata->ctrl_lock);
-
-	return 0;
-}
-
 /*
  * Controls - Non-DAPM ASoC
  */
@@ -1597,7 +1338,6 @@ static SOC_ENUM_SINGLE_DECL(soc_enum_bfifomast,
 static SOC_ENUM_SINGLE_EXT_DECL(soc_enum_sidstate, enum_sid_state);
 
 /* ANC */
-static SOC_ENUM_SINGLE_EXT_DECL(soc_enum_ancstate, enum_anc_state);
 
 static struct snd_kcontrol_new ab8500_ctrls[] = {
 	/* Charge pump */
@@ -1873,8 +1613,6 @@ static struct snd_kcontrol_new ab8500_ctrls[] = {
 		AB8500_FIFOCONF6_BFIFOSAMPLE_MAX, 0),
 
 	/* ANC */
-	SOC_ENUM_EXT("ANC Status", soc_enum_ancstate,
-		anc_status_control_get, anc_status_control_put),
 	SOC_SINGLE_XR_SX("ANC Warp Delay Shift",
 		AB8500_ANCCONF2, 1, AB8500_ANCCONF2_SHIFT,
 		AB8500_ANCCONF2_MIN, AB8500_ANCCONF2_MAX, 0),
@@ -1895,21 +1633,6 @@ static struct snd_kcontrol_new ab8500_ctrls[] = {
 		AB8500_SIDFIRADR, AB8500_SIDFIRADR_FIRSIDSET, 0),
 };
 
-static struct snd_kcontrol_new ab8500_filter_controls[] = {
-	AB8500_FILTER_CONTROL("ANC FIR Coefficients", AB8500_ANC_FIR_COEFFS,
-		AB8500_ANC_FIR_COEFF_MIN, AB8500_ANC_FIR_COEFF_MAX),
-	AB8500_FILTER_CONTROL("ANC IIR Coefficients", AB8500_ANC_IIR_COEFFS,
-		AB8500_ANC_IIR_COEFF_MIN, AB8500_ANC_IIR_COEFF_MAX),
-	AB8500_FILTER_CONTROL("Sidetone FIR Coefficients",
-			AB8500_SID_FIR_COEFFS, AB8500_SID_FIR_COEFF_MIN,
-			AB8500_SID_FIR_COEFF_MAX)
-};
-enum ab8500_filter {
-	AB8500_FILTER_ANC_FIR = 0,
-	AB8500_FILTER_ANC_IIR = 1,
-	AB8500_FILTER_SID_FIR = 2,
-};
-
 /*
  * Extended interface for codec-driver
  */
@@ -2454,7 +2177,6 @@ static int ab8500_codec_probe(struct snd_soc_component *component)
 	struct device_node *np = dev->of_node;
 	struct ab8500_codec_drvdata *drvdata = dev_get_drvdata(dev);
 	struct ab8500_codec_platform_data codec_pdata;
-	struct filter_control *fc;
 	int status;
 
 	dev_dbg(dev, "%s: Enter.\n", __func__);
@@ -2486,25 +2208,6 @@ static int ab8500_codec_probe(struct snd_soc_component *component)
 	snd_soc_component_write(component, AB8500_SHORTCIRCONF,
 		      BIT(AB8500_SHORTCIRCONF_HSZCDDIS));
 
-	/* Add filter controls */
-	status = snd_soc_add_component_controls(component, ab8500_filter_controls,
-				ARRAY_SIZE(ab8500_filter_controls));
-	if (status < 0) {
-		dev_err(dev,
-			"%s: failed to add ab8500 filter controls (%d).\n",
-			__func__, status);
-		return status;
-	}
-	fc = (struct filter_control *)
-		ab8500_filter_controls[AB8500_FILTER_ANC_FIR].private_value;
-	drvdata->anc_fir_values = (long *)fc->value;
-	fc = (struct filter_control *)
-		ab8500_filter_controls[AB8500_FILTER_ANC_IIR].private_value;
-	drvdata->anc_iir_values = (long *)fc->value;
-	fc = (struct filter_control *)
-		ab8500_filter_controls[AB8500_FILTER_SID_FIR].private_value;
-	drvdata->sid_fir_values = (long *)fc->value;
-
 	snd_soc_dapm_disable_pin(dapm, "ANC Configure Input");
 
 	mutex_init(&drvdata->ctrl_lock);
@@ -2538,7 +2241,6 @@ static int ab8500_codec_driver_probe(struct platform_device *pdev)
 	if (!drvdata)
 		return -ENOMEM;
 	drvdata->sid_status = SID_UNCONFIGURED;
-	drvdata->anc_status = ANC_UNCONFIGURED;
 	dev_set_drvdata(&pdev->dev, drvdata);
 
 	drvdata->regmap = devm_regmap_init(&pdev->dev, NULL, &pdev->dev,

base-commit: a201aef1a88b675e9eb8487e27d14e2eef3cef80
-- 
2.47.3

