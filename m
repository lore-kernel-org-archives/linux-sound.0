Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B684EA395
	for <linux-sound@vger.kernel.org>; Tue, 19 May 2026 16:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779209517; cv=none; b=Ktp43syk0mYQb8Rg29uD07OEyGTjZpvTrXS5LvJZSUWLob8AOKPOLd39iI3RGjLuwhySNL+r/djdaqdogumzFr15AHUcEZu91j5KbSLlf6oOqjSogCpifs3XuEJprMtd7veNZp67D4QhPEz+Yvz4PuwcdFlKVKBL3IAbN2BOHQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779209517; c=relaxed/simple;
	bh=xs6LB5hFZ20MJjoK7zKOeih3SSoTrt0ZWFA5mHOlqPA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SJfjdlTK0nBlZfutTKxM4gsfBeJG8U7mgFHVF4xnev4/qe+AQvwB1KRNEFN9QTxBCw5VbOl5BSawInzPIrwciUUsS0Tno8qaoLMAY+mzlxi5YVfWnplZDn26nzC6B2SGrXCZqXLXYPa7hys8bqkdrO2S0cEBOErVy4xev/391vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SYFrJupk; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SYFrJupk"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1309f4ee97fso4276883c88.1
        for <linux-sound@vger.kernel.org>; Tue, 19 May 2026 09:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779209515; x=1779814315; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5Jo+gSsn+SZYVigoskmViLe50pMEYHpvZm8JroYRhQA=;
        b=SYFrJupkI71WGfLY1p9RFOEKLq4OstexAx5uLz9xb/k4OWKn3bahX2xQuMrGl2kmKB
         k3McBOJRJ2dSIws+4yipcpZfmPchmzNlfrtCaoQrQJWilsZ4F62qau6urIB4zhUji9rH
         G1jUJS0cFHq618C0PvuofZVzRIg0esTJqmMtAQc50baiTWHTqD1uorAknxe7Fls2MI0j
         fdYG0daw1oiKpoEismMK0gQQJiuYq0Jc6qJLlE8oOsEt3uP3VzL3vOikHz4sX1NBLVS7
         wKpddId4GFNau8cJGx3Uba/QRNOSagJ54+AFDdFX8nVpqP2BBrxwKHMOm7rpXHHpamDJ
         oe2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779209515; x=1779814315;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Jo+gSsn+SZYVigoskmViLe50pMEYHpvZm8JroYRhQA=;
        b=U7xSQheaDrk6cmPRhxQbp2SER6NH4jLLmQbKvL/UwLawjt3wFHYyT1LjB4F/A+OeKL
         qD8GbyafeuAZ0YlSGUj+m5DU+yOfFa1nFUfMkq6oZBriyGbvoU3BdbiU66pljXMDp4l8
         dXaM3EQf2HoMmOv1+J1HdZzq9/gWRkGLVMm01TAQ5c/gb5PKIsG71KIFPwVIp/Vw5hT7
         ltGdZRAKTF9lfsCnDbkF0sHlJ9AafSUIJf2/TheIrgJA5smRZlOXXQkbmOnBFi3VlEKh
         Jq2P/PKXl8QNlZPNegjpz9QMW0UloJTAnSoRZCwQmMnTLRh10HNvmAMyx4oYmxFseqDj
         x43A==
X-Gm-Message-State: AOJu0Yx/5w40LI/s6GQ7Jc1VrLbwWt40DpbQc0D3c6REBJnbOaMN0Bjb
	vw+q19tOWyxePKmWqeHZPNG+4sghc+xR3R7VkA+wzcJ7d92wQtCbdqaTH+8ZsJzs
X-Gm-Gg: Acq92OEY7H9x3GxcKeztyEDyJxYrlWKuwT2X1/xtc7+Pmb+T+/FU0DDjpQ1oDBhkl6a
	9Z3xmnO/HWJTOb9Vfh5kLthQIAqoym6konTFWK/wXQ43/jJfvNCS9UfjL1lCOTATUGIAghXB3Hy
	jv+VuEVtBjeTQrHKpo0pBkqur9gZLWzFVpx5JxOzBCl1mAvBJ/KIZ6oSrPrURxmAOvaJt6be3Ih
	ED8FIH3Wjsamb7oKRmzudtYl2DhL7KHIQTzX9qbH4otVyyr49ef5CoYXRHq88yRZbwnZZs17+5W
	1a0M5pv1X3sISRmOWxnaEsgjuyFbsIr8DIf892OHvh9X1mgyMS3tVMESNPeAmj2et+H4Zci0EOp
	ttjH+3rnOq8Mcngr/neSrlfFXNx6wFIw+ZrGj/cZEsNQXnoDM0O8hcY5xNaduLRP32V9Ix0axuE
	+Mo1y200mT3Afkr5a0l2KReUAFkjiKHN8b+PW+sFj4xA9Vz7ojOBffAO0DaRAkRwlWnQZROtirW
	w==
X-Received: by 2002:a05:7300:fd16:b0:2f2:6dde:df66 with SMTP id 5a478bee46e88-3039868c86cmr10136905eec.22.1779209514761;
        Tue, 19 May 2026 09:51:54 -0700 (PDT)
Received: from [192.168.1.18] (177-4-162-74.user3p.v-tal.net.br. [177.4.162.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302973bbd50sm16378452eec.20.2026.05.19.09.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 09:51:54 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Tue, 19 May 2026 13:51:47 -0300
Subject: [PATCH] ASoC: Intel: bytcht_es8316: Fix MCLK leak on init errors
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260519-asoc-bytcht-es8316-mclk-leak-v1-1-b4a11cdc2afd@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ6CMAwA0F8hPduElYDTXzEeRqlSQSDrNBrCv
 zv1+C5vBZOoYnAsVojyVNN5ynC7ArgP01VQu2ygkpqydoTBZsb2nbhPKOYr1+CdxwFHCQNSV7P
 f+3CoiCAXS5SLvn796fy3PdqbcPqesG0f6wLQm4AAAAA=
X-Change-ID: 20260512-asoc-bytcht-es8316-mclk-leak-2d5c878a9322
To: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
 Jaroslav Kysela <perex@perex.cz>, David Yang <yangxiaohua@everest-semi.com>, 
 Daniel Drake <drake@endlessm.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3431;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=xs6LB5hFZ20MJjoK7zKOeih3SSoTrt0ZWFA5mHOlqPA=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFk8U9WY9G8cWZ+w9ikbY1jQuaDH12wqTSujjZNMkiquG
 PDVKZV2lLIwiHExyIopsqxOWmS5p+vB1fq4FR4wc1iZQIYwcHEKwESi3Bn+e7vsuNiQnxeVJcCq
 3ygwI3qD++kXH58fcrr59vk+y/MchxkZ1ooneJryiLQlrbL/I+/iaxjqlnq777PH3dvaBY+r+LP
 5AA==
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

byt_cht_es8316_init() enables MCLK before configuring the codec sysclk
and creating the headset jack. If either of those later steps fails, the
function returns without disabling MCLK, leaving the clock enabled after
card registration fails.

Track whether this driver enabled MCLK and disable it on the init error
paths. Add the matching DAI link exit callback so the same clock enable
is also balanced when ASoC cleans up a successfully initialized link.

Fixes: a03bdaa565cb ("ASoC: Intel: add machine driver for BYT/CHT + ES8316")
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/soc/intel/boards/bytcht_es8316.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index 192e2a394ff3..ea387dc74273 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -40,6 +40,7 @@ struct byt_cht_es8316_private {
 	struct gpio_desc *speaker_en_gpio;
 	struct device *codec_dev;
 	bool speaker_en;
+	bool mclk_enabled;
 };
 
 enum {
@@ -170,6 +171,15 @@ static struct snd_soc_jack_pin byt_cht_es8316_jack_pins[] = {
 	},
 };
 
+static void byt_cht_es8316_disable_mclk(struct byt_cht_es8316_private *priv)
+{
+	if (!priv->mclk_enabled)
+		return;
+
+	clk_disable_unprepare(priv->mclk);
+	priv->mclk_enabled = false;
+}
+
 static int byt_cht_es8316_init(struct snd_soc_pcm_runtime *runtime)
 {
 	struct snd_soc_component *codec = snd_soc_rtd_to_codec(runtime, 0)->component;
@@ -227,12 +237,14 @@ static int byt_cht_es8316_init(struct snd_soc_pcm_runtime *runtime)
 	ret = clk_prepare_enable(priv->mclk);
 	if (ret)
 		dev_err(card->dev, "unable to enable MCLK\n");
+	else
+		priv->mclk_enabled = true;
 
 	ret = snd_soc_dai_set_sysclk(snd_soc_rtd_to_codec(runtime, 0), 0, 19200000,
 				     SND_SOC_CLOCK_IN);
 	if (ret < 0) {
 		dev_err(card->dev, "can't set codec clock %d\n", ret);
-		return ret;
+		goto err_disable_mclk;
 	}
 
 	ret = snd_soc_card_jack_new_pins(card, "Headset",
@@ -241,13 +253,25 @@ static int byt_cht_es8316_init(struct snd_soc_pcm_runtime *runtime)
 					 ARRAY_SIZE(byt_cht_es8316_jack_pins));
 	if (ret) {
 		dev_err(card->dev, "jack creation failed %d\n", ret);
-		return ret;
+		goto err_disable_mclk;
 	}
 
 	snd_jack_set_key(priv->jack.jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
 	snd_soc_component_set_jack(codec, &priv->jack, NULL);
 
 	return 0;
+
+err_disable_mclk:
+	byt_cht_es8316_disable_mclk(priv);
+	return ret;
+}
+
+static void byt_cht_es8316_exit(struct snd_soc_pcm_runtime *runtime)
+{
+	struct snd_soc_card *card = runtime->card;
+	struct byt_cht_es8316_private *priv = snd_soc_card_get_drvdata(card);
+
+	byt_cht_es8316_disable_mclk(priv);
 }
 
 static int byt_cht_es8316_codec_fixup(struct snd_soc_pcm_runtime *rtd,
@@ -353,6 +377,7 @@ static struct snd_soc_dai_link byt_cht_es8316_dais[] = {
 						| SND_SOC_DAIFMT_CBC_CFC,
 		.be_hw_params_fixup = byt_cht_es8316_codec_fixup,
 		.init = byt_cht_es8316_init,
+		.exit = byt_cht_es8316_exit,
 		SND_SOC_DAILINK_REG(ssp2_port, ssp2_codec, platform),
 	},
 };

---
base-commit: 4ad5b674ca5f0f0bb7db547acc2491fadcf8c51a
change-id: 20260512-asoc-bytcht-es8316-mclk-leak-2d5c878a9322

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

