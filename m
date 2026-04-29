Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A1927A462
	for <linux-sound@vger.kernel.org>; Wed, 29 Apr 2026 08:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777450103; cv=none; b=lCXJvK37AY96h3gCvTluLh3O4uPcgXZ2dP+yINPi91Lj8ThFEoPYA36OzAdl4AKuOiTmEC7UY8XoZ4KkTZHmMrhly8FufbY+5S5DQ7vWmBVlNR88acFflVSAYIObJE0HYi2ETLCmr56yqcO/J69oHKe/GvJOu3A+G/ul+lI2jes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777450103; c=relaxed/simple;
	bh=+BYJPQiuCzmOqiob3xTFlfVSuDOzbUQsMt+LLYhBnWk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GWZFBvD+UsBt+s45/vh4umPDnVXY+c7sJVFCDxeUcEPU+XNPzFGgUIvI3236J9J6rDY2eRz9X3i2HvGAGiOjHAQo5iZh/nzWlSEFdzIOxmWknPwBRe5Ixt90dYO9dkZkM4GGqH9SYh/+RXmiEkvausIkgw1RrwvageKS+mjmAxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=bQIPmLrh; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="bQIPmLrh"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43fe608cb92so8242329f8f.2
        for <linux-sound@vger.kernel.org>; Wed, 29 Apr 2026 01:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1777450098; x=1778054898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2ONFJdrYYuLcJ6XgW9XnPonQm+jY5QTJOrZ1U+L6n6k=;
        b=bQIPmLrhgqtMyCZHDfBfOEaTUNpORX6OZVdGo6UockOv8658ekADYF5oGhsne/XgRX
         /1B+g72hSEYg4LYvfxvIRQNUQQutKYOcPCceQIUHVb8IGO/CrSMoVLuuFxUSw/a0/Dis
         WMh24QKYZqQ7uFmkGBOnLqqmSj99XyZQfZrV85v1IVMX9t2wSYmAKG59vj9ccRQWF+6V
         MOEjL0qKms0rc9PLiA7UMWRXPMs2Cd/gdf7+buC/+Mhv4ZCJExQgX82i6MDCyp6Ek0rf
         jo4zw4/a6HeSgPOiHsBEGwxVy83l71lN95U1RqCuiHhdBd4X/C+HDuq3bQSNp7/g+AMA
         IDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777450098; x=1778054898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ONFJdrYYuLcJ6XgW9XnPonQm+jY5QTJOrZ1U+L6n6k=;
        b=Ss32AEUXVnpzV4sEzJGmauFpdhLU4L+pbWuPCp7DZfawwO+LzsafRSZgpzt9vGMk32
         M4JND9BhjSzchbR2twysqNytraa+aEwX1axEW/yoZtkz45LTd2ISQ3WzN39cS1vrsifn
         Kdr4tRXsu2z+GkQiJlZUVivNDx6E1jnIwcRSlVuiyniyv68BVEyT8uVW0wo59RJhbOKs
         Jp0iKBsCZIJiVSFnyl+jGc2YEsfBsT+7Uh+37VpQEYWU8GVMun49/NtobQH0v3cK23aS
         lXg5M354AWBbj0fkQSookRJQFdDotyIPY9/LEnIQjWMqhPzy/cVtpanMaDqy8bk6Fsu3
         xa8Q==
X-Forwarded-Encrypted: i=1; AFNElJ93nqh+fGUOj8240OMPpGA66t9DI6ZQ69GHGwObZeA59XPgKDR/Y40JWezXEMssIsx0cDxoAiY7h/xFxg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx58ERALsAGeL3K7vzsFNJz3VDDxYZXfiWQSUGnnfV0sjgkjZ/m
	rNUX713oDMH15ZrmYzR/XsXclKrg/p1G4mBOln5eejqr9j4m0+OqzGbHZ9e8Z6aCCDk=
X-Gm-Gg: AeBDietSbuwAKgi81X0NO1D2dmOli5MO0eBFGtWrKGEV0/GauikbPFJwvIt3N0ie2Pm
	mObb8AU0Rv8z6LNVLUqO1deW5UtwcsA+4j2LdoF/Pf9yG4sNQjvwjVFBNPs4tfNGOAerWSD08Pg
	dFfryhHKVZlEtZwqTz0BsoUhwCY42gT8jntqIKb2JgJw29sSS+Ftgrf4obLugEW9IQLwQdGbFtO
	jCvG9VftGZdDll6jsMSq9iRG9x2+/wxwLAFw4AV6OblD+7EyiNEuOE7rMyxgZ5UG92v8WdRy/Nb
	KFPoL5w2BQYS0/yYA+3A06LiV6+5KI5snzahnhsvT2WD6LBGiIxL+8QiqzkGP+76J+kdDSgn/ua
	iiSa6hmX0ckBlqeqbRDUkyzAs0tsrHKII+y6CfdYX0BO/5dY3h6rHFgkWA4nAhQ8TUbKZLs83so
	ArhmJ+eElC+oXm9+AHvxOcmynSrUjzr5+4Wd1TMGrbofGW88yBJjSHiY9TgI53XhAckoyo035lv
	QXPcj6xrRfej9uvfka172oUHw==
X-Received: by 2002:a05:6000:250c:b0:43d:184:8aa2 with SMTP id ffacd0b85a97d-44647dd17ddmr11825067f8f.16.1777450098307;
        Wed, 29 Apr 2026 01:08:18 -0700 (PDT)
Received: from localhost (p200300f65f114e08936c55da887fa426.dip0.t-ipconnect.de. [2003:f6:5f11:4e08:936c:55da:887f:a426])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-447b7217c2asm3713713f8f.19.2026.04.29.01.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 01:08:17 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Ola Lilja <ola.o.lilja@stericsson.com>
Cc: "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: codecs: ab8500: Remove suspicious code
Date: Wed, 29 Apr 2026 10:08:08 +0200
Message-ID: <20260429080810.2375150-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=7834; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=+BYJPQiuCzmOqiob3xTFlfVSuDOzbUQsMt+LLYhBnWk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBp8bxqtQ6pmfTiB9fBh92Tosnl2RhdTSXryJpGh s07/c+M3GuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCafG8agAKCRCPgPtYfRL+ TsMCCAC1MI+9MLN0DJGv/01Izf+R8Kb20PfwWJRnUzpkoppDLOkqjumTDWrTC6qLE37GtAU95Lq DkWE+YiY5EaxwctwVdTB+WTUHXG9ULdYVBWdMvzhVx56aY1hpC2oflGphZsgPBEj1tf0bNm5GG/ vuX4cmPM+mfYEWPgh4JVk4bfz3GOGNAoWOlm0ap9b+x+EpV64SnBggpY18Ior9ZxJN9xadb5Qlm ytAXi7zWxWNIAi2vA1RRs2bkcGjygKqeHijI9FTApF94fhgGIGM13VeHQsOdV7pCBSTRxR2j94X l7mTqh38S1SD5BB13nhkbyS+w8fxnMai/pxOM3l//ccDQ3Z1
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

anc_configure() passed values from drvdata->anc_fir_values[] and
drvdata->anc_iir_values[] as register offset to
snd_soc_component_read(). The content of these arrays are user
controllable via the component controls "ANC FIR Coefficients" and "ANC
IIR Coefficients" which I assume are supposed to hold register values,
not register offsets.

Without a datasheet for that component and given that before commit
a201aef1a88b ("ASoC: codecs: ab8500: Fix casting of private data") the
arrays overlapped with driver control structures and thus didn't work
properly since 2012, drop that functionality and let someone repair it
who has an actual need for it.

Reported-by: Sashiko (gemini/gemini-3.1-pro-preview)
Link: https://sashiko.dev/#/patchset/20260428192255.2294705-2-u.kleine-koenig%40baylibre.com
Fixes: 679d7abdc754 ("ASoC: codecs: Add AB8500 codec-driver")
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 sound/soc/codecs/ab8500-codec.c | 167 --------------------------------
 1 file changed, 167 deletions(-)

diff --git a/sound/soc/codecs/ab8500-codec.c b/sound/soc/codecs/ab8500-codec.c
index 8ab2e60f80b4..3f8eaec54852 100644
--- a/sound/soc/codecs/ab8500-codec.c
+++ b/sound/soc/codecs/ab8500-codec.c
@@ -1024,89 +1024,6 @@ static const struct snd_soc_dapm_route ab8500_dapm_routes_mic2_vamicx[] = {
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
@@ -1180,88 +1097,6 @@ static int sid_status_control_put(struct snd_kcontrol *kcontrol,
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
 static int filter_control_info(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_info *uinfo)
 {
@@ -1873,8 +1708,6 @@ static struct snd_kcontrol_new ab8500_ctrls[] = {
 		AB8500_FIFOCONF6_BFIFOSAMPLE_MAX, 0),
 
 	/* ANC */
-	SOC_ENUM_EXT("ANC Status", soc_enum_ancstate,
-		anc_status_control_get, anc_status_control_put),
 	SOC_SINGLE_XR_SX("ANC Warp Delay Shift",
 		AB8500_ANCCONF2, 1, AB8500_ANCCONF2_SHIFT,
 		AB8500_ANCCONF2_MIN, AB8500_ANCCONF2_MAX, 0),

base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
prerequisite-patch-id: aa612b591cdf6dedf55a8ca7e09014cb464dd11c
-- 
2.47.3

