Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91ECC3DD537
	for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 19:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776799917; cv=none; b=glP13DZHfmx5HQ6wxiJwt+YHLCdkrC4ESJiIncZtlRGwEe+Mz/DtCKn3sc0VJ7SINIh9KsXO4oSioPb2WtW0ezEnbA2U3c3Xurlt3VhuuTnrzB0KT/vdqxDflJlrQuh2KsMBLx7gSsg80E1UzETxUyl8gh29miCrBJYG5azKN6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776799917; c=relaxed/simple;
	bh=j2An0cAyZ+elilC78eztC0JaKBVF34imDqpIowfIT3E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GXsogs9UzERclcvRtnvyTTmJXFebgRj/IXJ2jDKomixM3Bm98kj9nKClLRH8cP0Iu5krHvcAMzeq2vQBFfw7MYQRdEvvZyl2+9+vpLsXcC+pMGObW/1ddZDqO4RRIEA+BsVLv+WPY3FtFW84twXIbMpqeyUkh9Hmr+6DHlXtmRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br; spf=pass smtp.mailfrom=usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=ZhdWnhsy; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=usp.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="ZhdWnhsy"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-12c8f9846c8so3405495c88.0
        for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 12:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1776799913; x=1777404713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BnyzOjAbGINIFwzFjrQgr+TpUxRpisGZhsHzj0vzqJg=;
        b=ZhdWnhsy8GZXgNFkqYAN3V/xj3pJI7YCRXRPZQyFDtgx0P2cBQfwwVoiOrUp0EbsTl
         L7zu5FTCOz8H5xjpHJXjAIjJo7Q5dk/F4cYKZSnaCOKeBs6GMjK2s45d7i+hxpca5f5a
         GwYsrqhpGfysa+worZmXPrz8yUdONdFsqeUyoGNf7MvT0LYsEFR7SaKMxDhy2XsFm6kG
         V15QXCSXslgqn3hM0Gzut9AKd4Fb4PERuXMe7KVThTkS+FMzg56slPMkrWN3hjrnEocw
         9x3I18hRZfx46MYXLA4iFOmQKF+8eYHZHnppaCpe4ulLkJ2Gr5GoKIrQArlmpqfB9SF1
         wBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776799913; x=1777404713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BnyzOjAbGINIFwzFjrQgr+TpUxRpisGZhsHzj0vzqJg=;
        b=HJuOTiTghScIuofhHk63sOe9muFiX5/0THYNfbjzlWAOR4EoIFr9fUs6Sy/v0H/ydg
         gDJ+enXi4ZUY9seN3udR4UzQHF8+Fn/oCmHURZInqcdYLMXk78YIj37rsPM9Lcm3AzAM
         HwAQwvBNu67jZWARE8o4rWXXSVIlRFjm67uS6RI8JCLf0hQ9VHBzLpOMeHJLU+2aH2NR
         mKmaGjLjF1zhlV3lqw8fjZsy02Pbk2nYq8Ib8ZkEnIyiigsWc204EbMlw3Si267cFnjG
         QQd4KVTI6HK8jnuBr/4XtAdYwcEOnZZPDgAgnGpyFR55tYiECl6CFXVlTGuiCrEX9hjS
         FAJQ==
X-Forwarded-Encrypted: i=1; AFNElJ/a22QbKSoQT2YLXbnIaz0ZFmcdQxP5q9xZtOXas8u43ODanlJ70VUOH7mhAenb/xgqXXprFLhyRYPx3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRBmbFVd6JYBX+RdyMhrqWNEX0oVeYFE+jEE4IXA5YktMQTpnH
	0qq58sFu13HrzlcLHQAtoqMSY+0SFip+YSG3Ke0hFjhc6j6k22t/io8DILWOKLCUyrI=
X-Gm-Gg: AeBDiev/ip2QPI0ovOJOq+ziU9wmABkwTFTuTJ5GTUsXpVpKLadoyqmB/nbyo3d7pT6
	MtUG9+kIq69fUddA8oVDR6SXszSBMSTcrSa6IvjS5xZ8VRNPo/5tfLvnqj21YPgM1gltAXbJOqx
	o1+DoughG43PucFDCDmlnKMldlIiuhP8XeG9retjDvTtl16gVlp7QcJLQFP7mc2KxekSNY3m6RB
	hG1ohpIihKJuzBhC4aLxOEQYWZ3dvRXiXfr0ctMGfu9kSs9jmhiMGSmM/kq5cEwtLDwgc8qSVQQ
	E6eB0xTsuIxaQXSsScWeZ++BTISajGlWe5HL2M8N8qc2e3XCIZ8orglD6e9WGamZmdsSKFfx9oN
	0LpCK3ccgfVnylmN1STzhTPGanr6A2/8tUmBSyv/06SlCcGazYAglHZ9Nt7O9RC6yUvCV0qKDvV
	Pa1ZRxwyL0d/+rueOp0FqEOY+AYESPHMDi0KkWvnz+/g==
X-Received: by 2002:a05:7022:6627:b0:12c:8b9:7200 with SMTP id a92af1059eb24-12c73f95211mr10548058c88.17.1776799912582;
        Tue, 21 Apr 2026 12:31:52 -0700 (PDT)
Received: from localhost.localdomain ([191.181.59.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e539fa3ce1sm19288921eec.4.2026.04.21.12.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 12:31:52 -0700 (PDT)
From: Gabriel Jacob Perin <gabrieljp@usp.br>
To: claudiu.beznea@tuxon.dev,
	andrei.simion@microchip.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com
Cc: carlos.albmr@usp.br,
	Gabriel Jacob Perin <gabrieljp@usp.br>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] Change manual bitfield manipulation to use FIELD_PREP()
Date: Tue, 21 Apr 2026 16:31:13 -0300
Message-Id: <20260421193113.1060213-1-gabrieljp@usp.br>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Co-developed-by: Carlos Alberto Marques Rabelo <carlos.albmr@usp.br>
Signed-off-by: Carlos Alberto Marques Rabelo <carlos.albmr@usp.br>
Signed-off-by: Gabriel Jacob Perin <gabrieljp@usp.br>
---
 sound/soc/atmel/atmel-classd.c | 41 ++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/sound/soc/atmel/atmel-classd.c b/sound/soc/atmel/atmel-classd.c
index 1f8c60d2d..6693bdcbb 100644
--- a/sound/soc/atmel/atmel-classd.c
+++ b/sound/soc/atmel/atmel-classd.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/bitfield.h>
 #include <linux/string_choices.h>
 #include <sound/core.h>
 #include <sound/dmaengine_pcm.h>
@@ -236,34 +237,34 @@ static int atmel_classd_component_probe(struct snd_soc_component *component)
 	u32 mask, val;
 
 	mask = CLASSD_MR_PWMTYP_MASK;
-	val = pdata->pwm_type << CLASSD_MR_PWMTYP_SHIFT;
+	val = FIELD_PREP(CLASSD_MR_PWMTYP_MASK, pdata->pwm_type);
 
 	mask |= CLASSD_MR_NON_OVERLAP_MASK;
 	if (pdata->non_overlap_enable) {
-		val |= (CLASSD_MR_NON_OVERLAP_EN
-			<< CLASSD_MR_NON_OVERLAP_SHIFT);
+		val |= FIELD_PREP(CLASSD_MR_NON_OVERLAP_MASK,
+				CLASSD_MR_NON_OVERLAP_EN);
 
 		mask |= CLASSD_MR_NOVR_VAL_MASK;
 		switch (pdata->non_overlap_time) {
 		case 5:
-			val |= (CLASSD_MR_NOVR_VAL_5NS
-				<< CLASSD_MR_NOVR_VAL_SHIFT);
+			val |= FIELD_PREP(CLASSD_MR_NOVR_VAL_MASK,
+					CLASSD_MR_NOVR_VAL_5NS);
 			break;
 		case 10:
-			val |= (CLASSD_MR_NOVR_VAL_10NS
-				<< CLASSD_MR_NOVR_VAL_SHIFT);
+			val |= FIELD_PREP(CLASSD_MR_NOVR_VAL_MASK,
+					CLASSD_MR_NOVR_VAL_10NS);
 			break;
 		case 15:
-			val |= (CLASSD_MR_NOVR_VAL_15NS
-				<< CLASSD_MR_NOVR_VAL_SHIFT);
+			val |= FIELD_PREP(CLASSD_MR_NOVR_VAL_MASK,
+					CLASSD_MR_NOVR_VAL_15NS);
 			break;
 		case 20:
-			val |= (CLASSD_MR_NOVR_VAL_20NS
-				<< CLASSD_MR_NOVR_VAL_SHIFT);
+			val |= FIELD_PREP(CLASSD_MR_NOVR_VAL_MASK,
+					CLASSD_MR_NOVR_VAL_20NS);
 			break;
 		default:
-			val |= (CLASSD_MR_NOVR_VAL_10NS
-				<< CLASSD_MR_NOVR_VAL_SHIFT);
+			val |= FIELD_PREP(CLASSD_MR_NOVR_VAL_MASK,
+					CLASSD_MR_NOVR_VAL_10NS);
 			dev_warn(component->dev,
 				"non-overlapping value %d is invalid, the default value 10 is specified\n",
 				pdata->non_overlap_time);
@@ -370,8 +371,10 @@ atmel_classd_cpu_dai_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 
 	mask = CLASSD_INTPMR_DSP_CLK_FREQ_MASK | CLASSD_INTPMR_FRAME_MASK;
-	val = (sample_rates[best].dsp_clk << CLASSD_INTPMR_DSP_CLK_FREQ_SHIFT)
-	| (sample_rates[best].sample_rate << CLASSD_INTPMR_FRAME_SHIFT);
+	val = FIELD_PREP(CLASSD_INTPMR_DSP_CLK_FREQ_MASK,
+			sample_rates[best].dsp_clk) |
+		FIELD_PREP(CLASSD_INTPMR_FRAME_MASK,
+			sample_rates[best].sample_rate);
 
 	snd_soc_component_update_bits(component, CLASSD_INTPMR, mask, val);
 
@@ -395,8 +398,8 @@ static int atmel_classd_cpu_dai_prepare(struct snd_pcm_substream *substream,
 
 	snd_soc_component_update_bits(component, CLASSD_MR,
 				CLASSD_MR_LEN_MASK | CLASSD_MR_REN_MASK,
-				(CLASSD_MR_LEN_DIS << CLASSD_MR_LEN_SHIFT)
-				|(CLASSD_MR_REN_DIS << CLASSD_MR_REN_SHIFT));
+				FIELD_PREP(CLASSD_MR_LEN_MASK, CLASSD_MR_LEN_DIS) |
+				FIELD_PREP(CLASSD_MR_REN_MASK, CLASSD_MR_REN_DIS));
 
 	return 0;
 }
@@ -418,8 +421,8 @@ static int atmel_classd_cpu_dai_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		val = (CLASSD_MR_LEN_DIS << CLASSD_MR_LEN_SHIFT)
-			| (CLASSD_MR_REN_DIS << CLASSD_MR_REN_SHIFT);
+		val = FIELD_PREP(CLASSD_MR_LEN_MASK, CLASSD_MR_LEN_DIS) |
+			FIELD_PREP(CLASSD_MR_REN_MASK, CLASSD_MR_REN_DIS);
 		break;
 	default:
 		return -EINVAL;
-- 
2.25.1

