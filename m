Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660513783D5
	for <linux-sound@vger.kernel.org>; Sun, 26 Jul 2026 01:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785027934; cv=none; b=ZvJLWWQnTFqw2ve1N1PqPxkwtIBKZEVoJbMrJqAFOLvpf4Ki+81gGNSnZ16gNU8B6EZQfMc/Zdijr32NrgAKKRngZK47pNWYHFVRBFVMMYhSYxhNcKpW0N8sQVOjQTVYvH7NjbpTDGbS8pzoB0q0+8DHadf14TEZ0YFHG/mcjkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785027934; c=relaxed/simple;
	bh=tt1hF9x8YIJQuNz1FLxZU1SwvAvQ0EScsEQTuLikerQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hq3nX5L/zCyIGgoronyuxYtosiwB9EAWVy4kZE5AHcLh9cUrOm2uwlVBz1wSb4JisbEQlxK4FhT3JSXt0xuhfBIILW87WrfEZaIKdQSscCI92wS1GEAbiuAaKxCX+BzPwcWOlwMN/XmrMaz4BYJZaElygIa+fclaYk+8MissSwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i77EubcZ; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i77EubcZ"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-ca00f126b7eso963058a12.2
        for <linux-sound@vger.kernel.org>; Sat, 25 Jul 2026 18:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785027933; x=1785632733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GJto3qEnIoSM/svFrg/nJAdNW+Wss/lv5ze0NLn7NOk=;
        b=i77EubcZgHfNck9ccPHQPQwp3Etc2T+6zOh+orCBjWWYJDGEaWSXlW0kEDdANEREDd
         1xT/r3au64wAiUlHsgmL4++9QJrTJIfr9JXe35QRIPqib2zdo+Z45u0l2bhjAS56ieh7
         QzFOJk7bEDrHzchl/AlVsE+h38JBLPOmOlp5s5IUhF7fWMoC1gDR7XJpeupeTd216Dj5
         d/n0X95Fa5Y1lS5ALqirWUJbMRjpZBzKr/vCYQNpdalfGlHOQOiuRFrAtRa+8lMQUprl
         oWsB1up2EmneLtuOqXQeZ1nh1G/qftPqzQ7WxUU9ilDcQ2eemjhu2s3P/0H/hFeRRLLi
         M/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785027933; x=1785632733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GJto3qEnIoSM/svFrg/nJAdNW+Wss/lv5ze0NLn7NOk=;
        b=CpKb3RuQ0wFQC9NN1GWlebbvjWhgEge0d3mjwou7mSNimIMwtVZS1DnCu1WZHfkba7
         +Orl/Ps+T8M+Bsx570P5HrAJnUX3NwXNrHffENGg+B8TT/t18NO8gYr8QcLWkZHSFjMC
         Wwv0fZBzwxrlBCHyGZ69o3tiyoQqLy2lACrw13t85roByedHX5Loz2GsQ0PN1d1w5emq
         BqrQvGrMf9rDxBEH7myfHkl/bYB4MxWva4c2jdSLApJK19L/EpadPlLaHSY7VZ0pLPfx
         PGbyc154xiH2aB8Nhlqv9WWdxgjY5bQukXRHSPNhRICxKvRyxc3Q5mmRrM0GaH83NopA
         j1tw==
X-Forwarded-Encrypted: i=1; AHgh+RoGWxqTymptpwEwt3GLdWiiNdkoT1igGL43uy0pV/mfe926QF8J/FlHiUtfApl8JIV9/2l2UYEKExKVng==@vger.kernel.org
X-Gm-Message-State: AOJu0YynzbOituj1Mi3yyG/93ug5LP5cTlukmJ/jp2nNvL2j0mZbB8r6
	ZvzWqQ/QjzQ/ONVGp1IhTn+hBP3LNc7bbwXuK+tC5c8MHpLYCrieQe0q
X-Gm-Gg: AR+sD10xxJhsIUPSLlUn/PqtOSRmA96j6H4AfJanzJ+K63l/INc38L7Ooal30yvySfB
	i+HGmJGc5xaECXyctP6X4QJwX5DdaP6+LlZEE+lzbf8+vAwE/vicMC73Kx7ze72mUyXhv1utHN/
	/8NXomSEFwL12AsXEfz60srsNwv5ErFA4s4TwYPrGFihNk+lAPPIQHSfE+0ERwPM1L7HaVXj9QD
	MSZq1fh1RVOZ66TbSVpmWIAgCJRgytFSy0kuJ+MISXSliX/U1myjU0mbGCPzBC+3oyQ+4Nuj6Yl
	hkAwvKUqPaTAbdU3ZlXIKGWfvWkJw4f4074/qNJd7xIWCABe3ijnibs88knu0Gw+XOvKQoJFn6+
	ERGI0tGyukIc2SGTYhqgLz4ichb0xYtyJznX69cVOaaOtYlfUnPt5Ch5lkXe3MvA96tSJu25AW6
	e3sMqHIETjh6xcr3BRUXDpeLzCaZj2nx0ehXc7aSmlxMyrFYWCOvTVKaq15ETCmZxOOw==
X-Received: by 2002:a05:6a20:94ce:b0:3c0:9c19:659e with SMTP id adf61e73a8af0-3c67e00cac0mr3242673637.70.1785027932606;
        Sat, 25 Jul 2026 18:05:32 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:e2c2:1f24:32d5:9d51])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e0f4a039asm11821445c88.9.2026.07.25.18.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 18:05:31 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] ASoC: tlv320aic32x4: factor out rate configuration helper
Date: Sat, 25 Jul 2026 18:05:16 -0700
Message-ID: <20260726010519.117805-6-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260726010519.117805-1-dmitry.torokhov@gmail.com>
References: <20260726010519.117805-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Factor out sample-rate dependent parameter setup and processing block
configuration into a separate helper function aic32x4_configure_rate.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 sound/soc/codecs/tlv320aic32x4.c | 75 +++++++++++++++++++-------------
 1 file changed, 44 insertions(+), 31 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index 690acfc005c2..8d3f2d5c6128 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -703,6 +703,45 @@ static int aic32x4_set_processing_blocks(struct snd_soc_component *component,
 	return 0;
 }
 
+static int aic32x4_configure_rate(struct snd_soc_component *component,
+				  unsigned int rate, u8 *aosr, u8 *adc_rc,
+				  u8 *dac_rc, u8 *dosr_inc)
+{
+	struct aic32x4_priv *aic32x4 = snd_soc_component_get_drvdata(component);
+	u8 prb_rx, prb_tx;
+
+	if (rate <= 48000) {
+		*aosr = 128;
+		*adc_rc = 6;
+		*dac_rc = 8;
+		*dosr_inc = 8;
+		prb_rx = 1;
+		prb_tx = 1;
+	} else if (rate <= 96000) {
+		*aosr = 64;
+		*adc_rc = 6;
+		*dac_rc = 8;
+		*dosr_inc = 4;
+		prb_rx = 1;
+		prb_tx = (aic32x4->type == AIC32X4_TYPE_TAS2505) ? 1 : 9;
+	} else if (rate == 192000) {
+		*aosr = 32;
+		*adc_rc = 3;
+		*dac_rc = 4;
+		*dosr_inc = 2;
+		prb_rx = 13;
+		prb_tx = (aic32x4->type == AIC32X4_TYPE_TAS2505) ? 1 : 19;
+	} else {
+		dev_err(component->dev, "Sampling rate %u not supported\n", rate);
+		return -EINVAL;
+	}
+
+	if (aic32x4->type == AIC32X4_TYPE_TAS2505)
+		prb_rx = 0;
+
+	return aic32x4_set_processing_blocks(component, prb_rx, prb_tx);
+}
+
 static int aic32x4_setup_clocks(struct snd_soc_component *component,
 				unsigned int sample_rate, unsigned int channels,
 				unsigned int bit_depth)
@@ -729,37 +768,11 @@ static int aic32x4_setup_clocks(struct snd_soc_component *component,
 	if (ret)
 		return ret;
 
-	if (sample_rate <= 48000) {
-		aosr = 128;
-		adc_resource_class = 6;
-		dac_resource_class = 8;
-		dosr_increment = 8;
-		if (aic32x4->type == AIC32X4_TYPE_TAS2505)
-			aic32x4_set_processing_blocks(component, 0, 1);
-		else
-			aic32x4_set_processing_blocks(component, 1, 1);
-	} else if (sample_rate <= 96000) {
-		aosr = 64;
-		adc_resource_class = 6;
-		dac_resource_class = 8;
-		dosr_increment = 4;
-		if (aic32x4->type == AIC32X4_TYPE_TAS2505)
-			aic32x4_set_processing_blocks(component, 0, 1);
-		else
-			aic32x4_set_processing_blocks(component, 1, 9);
-	} else if (sample_rate == 192000) {
-		aosr = 32;
-		adc_resource_class = 3;
-		dac_resource_class = 4;
-		dosr_increment = 2;
-		if (aic32x4->type == AIC32X4_TYPE_TAS2505)
-			aic32x4_set_processing_blocks(component, 0, 1);
-		else
-			aic32x4_set_processing_blocks(component, 13, 19);
-	} else {
-		dev_err(component->dev, "Sampling rate not supported\n");
-		return -EINVAL;
-	}
+	ret = aic32x4_configure_rate(component, sample_rate, &aosr,
+				     &adc_resource_class, &dac_resource_class,
+				     &dosr_increment);
+	if (ret)
+		return ret;
 
 	/* PCM over I2S is always 2-channel */
 	if ((aic32x4->fmt & SND_SOC_DAIFMT_FORMAT_MASK) == SND_SOC_DAIFMT_I2S)
-- 
2.55.0.229.g6434b31f56-goog

