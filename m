Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB1A391E72
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 20:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788208163; cv=none; b=ekI2bmOa0lOe+Fn9+l64jI1mVEf4rx8Zx3dEI1VSatdBtp8E6wBSXM5p/8/QkV9Et+dnQExjqbR5RmSHdPFxIRCPfuNtF9q1yBQXNDs2Y0eGg5HXSm8wvcOytfazVCSV7tvg77pQ0SrWrEkdn4jex8y2/EYdkSgD9MQOdzGwR/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788208163; c=relaxed/simple;
	bh=ep7lgS+78hnzKJmVL7fY4GrYBFtk3UCTOyuyYxMgy2c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KRs/8vAi+PHQ+YjWz1iSO8QMuEFy9LCz/tauM0WY/6fMwKTKViSogcE+Y+wFbslZWrh1ANjGOwp8X0sp/Z9qRPx9XIX9hQISdnEjZZN01+RwcVkJrFnpwOB3LlKx2HQe1CxGY3AVwxhDkQp4MD+Rjbwn4MWgyEvgjNCvrGoqglM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fbiRaqwZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fbiRaqwZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD84A1F00A3E;
	Mon, 31 Aug 2026 20:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788208162;
	bh=gn0iMewA8/k1cTTSyo3q1pvwbvrXKR4yMeib6LoUUxc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=fbiRaqwZCyy1MIbND4XGXtfgBxBX5OAdgo1UvM2QXwzW9PTmMnTDGuvbcPYKFvaLr
	 b+gEVjDFyziu31PQXxecLMnUPtguzVLlgj3bZafCwltye3QvcmrTEPN52UMrt0vMLq
	 cefVNkTN6yklLhzmYlhObASVd/v5N5uY5Rj+KbFpPAxLX1wIk5lKIn1buZKJtUTpag
	 S3h1E+jQFBw/1iSjdD4t1JuemrIZQYR4nSvIuDdOOyMsXh+nEvaUvWcQLZXaeixg0r
	 GU02tY3p9g45FbhhmQenFDPsXE2MwL7xPCc1gvTjP8N8fqQhZeAr9twzGaiAXCRooX
	 aLJFJ09UaMYsQ==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 31 Aug 2026 22:29:10 +0200
Subject: [PATCH 5/6] ASoC: ab8500: Remove the nonfunctional sidetone apply
 control
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-ab8500-codec-fixes-v1-5-f85024e717e3@kernel.org>
References: <20260831-ab8500-codec-fixes-v1-0-f85024e717e3@kernel.org>
In-Reply-To: <20260831-ab8500-codec-fixes-v1-0-f85024e717e3@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: linux-sound@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

After the coefficient controls were removed, writing "Apply FIR"
programs 128 zero coefficients and reports that the sidetone filter is
configured. The associated ANC configuration DAPM pins are also now
unreachable dead infrastructure.

Remove the misleading status/apply control, its private state, and the
obsolete configuration-only DAPM pins. Keep the direct sidetone reset
and remaining hardware controls.

Fixes: e366ce8b22ec ("ASoC: codecs: ab8500: Remove suspicious code")
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 sound/soc/codecs/ab8500-codec.c | 114 ----------------------------------------
 1 file changed, 114 deletions(-)

diff --git a/sound/soc/codecs/ab8500-codec.c b/sound/soc/codecs/ab8500-codec.c
index 167f021c7ecb..11142d15df45 100644
--- a/sound/soc/codecs/ab8500-codec.c
+++ b/sound/soc/codecs/ab8500-codec.c
@@ -14,17 +14,14 @@
  *         for ST-Ericsson.
  */
 
-#include <linux/cleanup.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/device.h>
 #include <linux/slab.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
-#include <linux/delay.h>
 #include <linux/pm.h>
 #include <linux/platform_device.h>
-#include <linux/mutex.h>
 #include <linux/mfd/abx500/ab8500.h>
 #include <linux/mfd/abx500.h>
 #include <linux/mfd/abx500/ab8500-sysctrl.h>
@@ -54,32 +51,9 @@
 /* Macrocell register definitions */
 #define AB8500_GPIO_DIR4_REG			0x13 /* Bank AB8500_MISC */
 
-/* Nr of FIR/IIR-coeff banks in ANC-block */
-#define AB8500_NR_OF_ANC_COEFF_BANKS		2
-
-/* Minimum duration to keep ANC IIR Init bit high or
-low before proceeding with the configuration sequence */
-#define AB8500_ANC_SM_DELAY			2000
-
-/* Sidetone states */
-static const char * const enum_sid_state[] = {
-	"Unconfigured",
-	"Apply FIR",
-	"FIR is configured",
-};
-enum sid_state {
-	SID_UNCONFIGURED = 0,
-	SID_APPLY_FIR = 1,
-	SID_FIR_CONFIGURED = 2,
-};
-
 /* Private data for AB8500 device-driver */
 struct ab8500_codec_drvdata {
 	struct regmap *regmap;
-	struct mutex ctrl_lock;
-
-	/* Sidetone */
-	enum sid_state sid_status;
 };
 
 static inline const char *amic_micbias_str(enum amic_micbias micbias)
@@ -642,9 +616,6 @@ static const struct snd_soc_dapm_widget ab8500_dapm_widgets[] = {
 			NULL, 0),
 	/* Acoustical Noise Cancellation path */
 
-	SND_SOC_DAPM_INPUT("ANC Configure Input"),
-	SND_SOC_DAPM_OUTPUT("ANC Configure Output"),
-
 	SND_SOC_DAPM_MUX("ANC Source",
 			SND_SOC_NOPM, 0, 0,
 			dapm_anc_in_select),
@@ -687,10 +658,6 @@ static const struct snd_soc_dapm_route ab8500_dapm_routes[] = {
 	{"Main Supply", NULL, "Audio Power"},
 	{"Main Supply", NULL, "Audio Analog Power"},
 
-	/* ANC Configure */
-	{"ANC Configure Input", NULL, "Main Supply"},
-	{"ANC Configure Output", NULL, "ANC Configure Input"},
-
 	/* Powerup charge pump if DA1/2 is in use */
 
 	{"DA_IN1", NULL, "ab8500_0p"},
@@ -972,75 +939,6 @@ static const struct snd_soc_dapm_route ab8500_dapm_routes_mic2_vamicx[] = {
 	{"MIC2 V-AMICx Enable", NULL, "V-AMIC2"},
 };
 
-/*
- * Control-events
- */
-
-static int sid_status_control_get(struct snd_kcontrol *kcontrol,
-		struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct ab8500_codec_drvdata *drvdata = dev_get_drvdata(component->dev);
-
-	guard(mutex)(&drvdata->ctrl_lock);
-	ucontrol->value.enumerated.item[0] = drvdata->sid_status;
-
-	return 0;
-}
-
-/* Write sidetone FIR-coefficients configuration sequence */
-static int sid_status_control_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct ab8500_codec_drvdata *drvdata = dev_get_drvdata(component->dev);
-	unsigned int param, sidconf;
-	int status = 1;
-
-	dev_dbg(component->dev, "%s: Enter\n", __func__);
-
-	if (ucontrol->value.enumerated.item[0] != SID_APPLY_FIR) {
-		dev_err(component->dev,
-			"%s: ERROR: This control supports '%s' only!\n",
-			__func__, enum_sid_state[SID_APPLY_FIR]);
-		return -EIO;
-	}
-
-	guard(mutex)(&drvdata->ctrl_lock);
-
-	sidconf = snd_soc_component_read(component, AB8500_SIDFIRCONF);
-	if (((sidconf & BIT(AB8500_SIDFIRCONF_FIRSIDBUSY)) != 0)) {
-		if ((sidconf & BIT(AB8500_SIDFIRCONF_ENFIRSIDS)) == 0) {
-			dev_err(component->dev, "%s: Sidetone busy while off!\n",
-				__func__);
-			status = -EPERM;
-		} else {
-			status = -EBUSY;
-		}
-		dev_dbg(component->dev, "%s: Exit\n", __func__);
-		return status;
-	}
-
-	snd_soc_component_write(component, AB8500_SIDFIRADR, 0);
-
-	for (param = 0; param < AB8500_SID_FIR_COEFFS; param++) {
-		snd_soc_component_write(component, AB8500_SIDFIRCOEF1, 0);
-		snd_soc_component_write(component, AB8500_SIDFIRCOEF2, 0);
-	}
-
-	snd_soc_component_update_bits(component, AB8500_SIDFIRADR,
-		BIT(AB8500_SIDFIRADR_FIRSIDSET),
-		BIT(AB8500_SIDFIRADR_FIRSIDSET));
-	snd_soc_component_update_bits(component, AB8500_SIDFIRADR,
-		BIT(AB8500_SIDFIRADR_FIRSIDSET), 0);
-
-	drvdata->sid_status = SID_FIR_CONFIGURED;
-
-	dev_dbg(component->dev, "%s: Exit\n", __func__);
-
-	return status;
-}
-
 /*
  * Controls - Non-DAPM ASoC
  */
@@ -1324,9 +1222,6 @@ static SOC_ENUM_SINGLE_DECL(soc_enum_bfifomast,
 			AB8500_FIFOCONF3, AB8500_FIFOCONF3_BFIFOMAST_SHIFT,
 			enum_slavemaster);
 
-/* Sidetone */
-static SOC_ENUM_SINGLE_EXT_DECL(soc_enum_sidstate, enum_sid_state);
-
 /* ANC */
 
 static struct snd_kcontrol_new ab8500_ctrls[] = {
@@ -1617,8 +1512,6 @@ static struct snd_kcontrol_new ab8500_ctrls[] = {
 		AB8500_ANC_WARP_DELAY_MIN, AB8500_ANC_WARP_DELAY_MAX, 0),
 
 	/* Sidetone */
-	SOC_ENUM_EXT("Sidetone Status", soc_enum_sidstate,
-		sid_status_control_get, sid_status_control_put),
 	SOC_SINGLE_STROBE("Sidetone Reset",
 		AB8500_SIDFIRADR, AB8500_SIDFIRADR_FIRSIDSET, 0),
 };
@@ -2145,10 +2038,8 @@ static void ab8500_codec_of_probe(struct device *dev, struct device_node *np,
 
 static int ab8500_codec_probe(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct device *dev = component->dev;
 	struct device_node *np = dev->of_node;
-	struct ab8500_codec_drvdata *drvdata = dev_get_drvdata(dev);
 	struct ab8500_codec_platform_data codec_pdata;
 	int status;
 
@@ -2181,10 +2072,6 @@ static int ab8500_codec_probe(struct snd_soc_component *component)
 	snd_soc_component_write(component, AB8500_SHORTCIRCONF,
 		      BIT(AB8500_SHORTCIRCONF_HSZCDDIS));
 
-	snd_soc_dapm_disable_pin(dapm, "ANC Configure Input");
-
-	mutex_init(&drvdata->ctrl_lock);
-
 	return status;
 }
 
@@ -2213,7 +2100,6 @@ static int ab8500_codec_driver_probe(struct platform_device *pdev)
 			GFP_KERNEL);
 	if (!drvdata)
 		return -ENOMEM;
-	drvdata->sid_status = SID_UNCONFIGURED;
 	dev_set_drvdata(&pdev->dev, drvdata);
 
 	drvdata->regmap = devm_regmap_init(&pdev->dev, NULL, &pdev->dev,

-- 
2.55.0

