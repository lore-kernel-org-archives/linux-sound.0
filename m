Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC47E445AE5
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 17:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785433499; cv=none; b=T+a3X0K18+kpy2292NnmyeQgErQb/87WIGcUBrCT99hhREJyMV6PpI6WO6lDH2WGk9XZ+UCKHB31Z2spjZnJVu67FPm/6shbQOiwXLi3CVLvHwA/yq7St9qKHtoMPPLT3sYIThVJvQkLq31ZU1D8pBqipfQgG3YZ5W/KB7MiHXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785433499; c=relaxed/simple;
	bh=yPBiN2t1xLgV8+yggesYBRe1ZEPqmT38ZiLc7QyNnXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JKrL8hoXT2fGXh/tV8vzoSypKt5u/JNuw0QRmROl0Rw3S+JdWfNrAQl9xhULpPrnL8c6SzJkdAoZJ+weEjNa/YSxoi/ch0a1UOmeE+n+x7cLGniVTOufjuPlC8rBT1Ofo1STmGsBdAI1iBC9BFHyDhJvidFYrwfe+IacKQAWeuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CLJZSEKa; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CLJZSEKa"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-92e67555e24so7192885a.3
        for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 10:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785433497; x=1786038297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hFupwMuTfDFhyvQ+ZCo6JTL5ovd2CQAQ3darP1+tv4Q=;
        b=CLJZSEKaGhmvDYMqggDuwEf0OiWCc7q/rpvNBmU58nWwaRCJezVvkuXYezFeIkVxIu
         J8cGf4bJYJH3lAPyPS3S5LaPwPLtleFgAEdNuJZXPknsE9m+LvtuimqpdIo6AADUHDAT
         d4OGqLsZe9iAzpK/kd9IUG7thuqbbN9pA2Av5ftsimboqcCdlgLKI78IwOt04ctGKTR0
         VasZUHJmuTrCaKY7pwzLMOeRriDiU7wE58M8Fzxpm42xoZRYWk3IvNOcwLjVw5ry/+H+
         7eI1owpQ0M6PwJRHaMDrpFqouJ6rxEmQCCfZ9gbRyjtz75ROEIhKi6nKK/F/geg8JJct
         gTeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785433497; x=1786038297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hFupwMuTfDFhyvQ+ZCo6JTL5ovd2CQAQ3darP1+tv4Q=;
        b=r1PQNMohpmyKVn8qTubxFNdx29X/1kvXQpy+uqdtdwxuyWBvh6Ch3BUrQWS12HYGpO
         UWeSVum5OZJXUFqAudr5e2EkoJ1dawe+Mfy+RCDpLXMbM1CxIrlDs73Vas7mVkqqxpnj
         exkC4Ga4yLLW8SWyVxzcFTR1sdr+sRTU2v/fqzM8OJcwpC6kwRJq2RkgO/UZrc+XjzvA
         ev3misi8OYFckXFyqPW61Yte+P/LOMa08J/xu/Gz41j7xk+2i+nTfqXJ5kCcXZjSCBQ2
         sOQk8aWz9ti3C37UIh4c6uDLIzcnEMX+RtMTYTqgIk7UW2KMJDRHJzzLnwgcT6u/JzLz
         hu4A==
X-Forwarded-Encrypted: i=1; AHgh+Rqzm+WEo5b4AMR5Iz/noTeG6oDN6m/8tB8GebItjqRgXS0N0Yw9stCaPn8d0fDJTBqBPXYxZXr/2bjmFA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz91CVcywV6yOgYFSiG8cBL8G7ztCqAbnIDh4ZmkJNXrhcW8i3n
	mkKks2yYPAU31kvY7Lf6LvsIkYpiXrRqhWtYXWp9HC6led/RcPQ6VVhE
X-Gm-Gg: AR+sD12b7bD2Hk2l5gukNY83NmpTnh5Sqjq8EGwX/mHOtsMMB4BNRGnraheahYlTtu0
	XYye6KvO4hLXf91DEO9AS6YpSBxo4iEOABlsiNGM8j/5GmvXlxs3IOuW7Tj0n386uooC+nirHIL
	81+XjjYv8e2T0etX4M6vIwDz3HHlXRsXct1Q/WKRhFsTE9QH8IXAALDxkOpeTP5/SkeGbqZGqxw
	8HBJ//FVwiowgbtd0ZguZQ8xNlka8sovgOeUcipoLygNaJOWx+Bx4gzKEpVvl11cfkRVhHikMP/
	d1um+dLEXupVpzyZf8yj15aBN+bAmeyf878G8jnKhIx9ZqMsaP7jaWpVnYokpebZCUs+LPobata
	CrPeLNc9n5UKxN4LCIz+ZCV6vIFWJKVHJ4O2M6S+znliGfVHxCMW7cZjz00i3huXbJ6/M+SlXT/
	+B+QqTNc+RDpDa1r3uUG7gB9aS412rtXA9r4MKsBvyQfz4FMfwz3eoo/AK/gs=
X-Received: by 2002:a05:622a:2c3:b0:51b:efbb:fbf with SMTP id d75a77b69052e-52b385fe1b6mr35845161cf.18.1785433496752;
        Thu, 30 Jul 2026 10:44:56 -0700 (PDT)
Received: from localhost ([70.54.57.80])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-529e2b181b1sm45736801cf.6.2026.07.30.10.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 10:44:56 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v6 15/15] ASoC: msm8916-wcd-analog: add quirk for cajon 2.0
Date: Thu, 30 Jul 2026 13:43:53 -0400
Message-ID: <20260730174353.108023-16-mailingradian@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260730174353.108023-1-mailingradian@gmail.com>
References: <20260730174353.108023-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The codec version CAJON_2_0 on the Snapdragon 670 requires touching the
HPH test registers. Add the quirk so this driver can also support
SDM670.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/codecs/msm8916-wcd-analog.c | 63 ++++++++++++++++++++++++++-
 1 file changed, 61 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/msm8916-wcd-analog.c b/sound/soc/codecs/msm8916-wcd-analog.c
index b9325290c28d..87f8a47cc293 100644
--- a/sound/soc/codecs/msm8916-wcd-analog.c
+++ b/sound/soc/codecs/msm8916-wcd-analog.c
@@ -217,9 +217,11 @@
 #define CDC_A_RX_HPH_BIAS_LDO_OCP	(0xf195)
 #define CDC_A_RX_HPH_BIAS_CNP		(0xf196)
 #define CDC_A_RX_HPH_CNP_EN		(0xf197)
+#define CDC_A_RX_HPH_L_TEST		(0xf19A)
 #define CDC_A_RX_HPH_L_PA_DAC_CTL	(0xf19B)
 #define RX_HPA_L_PA_DAC_CTL_DATA_RESET_MASK	BIT(1)
 #define RX_HPA_L_PA_DAC_CTL_DATA_RESET_RESET	BIT(1)
+#define CDC_A_RX_HPH_R_TEST		(0xf19C)
 #define CDC_A_RX_HPH_R_PA_DAC_CTL	(0xf19D)
 #define RX_HPH_R_PA_DAC_CTL_DATA_RESET	BIT(1)
 #define RX_HPH_R_PA_DAC_CTL_DATA_RESET_MASK BIT(1)
@@ -705,6 +707,59 @@ static int pm8916_wcd_analog_enable_ear_pa(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
+static int pm8916_wcd_analog_enable_hphl_pa(struct snd_soc_dapm_widget *w,
+					    struct snd_kcontrol *kcontrol,
+					    int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct pm8916_wcd_analog_priv *priv = dev_get_drvdata(component->dev);
+
+	/* This quirk is not required for revisions prior to CAJON_2_0 */
+	if (priv->codec_version < 4)
+		return 0;
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		usleep_range(7000, 7100);
+		snd_soc_component_update_bits(component, CDC_A_RX_HPH_L_TEST,
+				0x04, 0x04);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		/* wait 20 ms after the digital codec has powered down */
+		msleep(20);
+		snd_soc_component_update_bits(component, CDC_A_RX_HPH_L_TEST,
+				0x04, 0x00);
+		break;
+	}
+	return 0;
+}
+
+static int pm8916_wcd_analog_enable_hphr_pa(struct snd_soc_dapm_widget *w,
+					    struct snd_kcontrol *kcontrol,
+					    int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct pm8916_wcd_analog_priv *priv = dev_get_drvdata(component->dev);
+
+	/* This quirk is not required for revisions prior to CAJON_2_0 */
+	if (priv->codec_version < 4)
+		return 0;
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		usleep_range(7000, 7100);
+		snd_soc_component_update_bits(component, CDC_A_RX_HPH_R_TEST,
+				0x04, 0x04);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		msleep(20);
+		snd_soc_component_update_bits(component, CDC_A_RX_HPH_R_TEST,
+				0x04, 0x00);
+		break;
+	}
+	return 0;
+}
+
 static const struct reg_default wcd_reg_defaults_2_0[] = {
 	{CDC_A_RX_COM_OCP_CTL, 0xD1},
 	{CDC_A_RX_COM_OCP_COUNT, 0xFF},
@@ -954,11 +1009,15 @@ static const struct snd_soc_dapm_widget pm8916_wcd_analog_dapm_widgets[] = {
 	SND_SOC_DAPM_MUX("EAR_S", SND_SOC_NOPM, 0, 0, &ear_mux),
 	SND_SOC_DAPM_SUPPLY("EAR CP", CDC_A_NCP_EN, 4, 0, NULL, 0),
 
-	SND_SOC_DAPM_PGA("HPHL PA", CDC_A_RX_HPH_CNP_EN, 5, 0, NULL, 0),
+	SND_SOC_DAPM_PGA_E("HPHL PA", CDC_A_RX_HPH_CNP_EN, 5, 0, NULL, 0,
+			   pm8916_wcd_analog_enable_hphl_pa,
+			   SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
 	SND_SOC_DAPM_MUX("HPHL", SND_SOC_NOPM, 0, 0, &hphl_mux),
 	SND_SOC_DAPM_MIXER("HPHL DAC", CDC_A_RX_HPH_L_PA_DAC_CTL, 3, 0, NULL,
 			   0),
-	SND_SOC_DAPM_PGA("HPHR PA", CDC_A_RX_HPH_CNP_EN, 4, 0, NULL, 0),
+	SND_SOC_DAPM_PGA_E("HPHR PA", CDC_A_RX_HPH_CNP_EN, 4, 0, NULL, 0,
+			   pm8916_wcd_analog_enable_hphr_pa,
+			   SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
 	SND_SOC_DAPM_MUX("HPHR", SND_SOC_NOPM, 0, 0, &hphr_mux),
 	SND_SOC_DAPM_MIXER("HPHR DAC", CDC_A_RX_HPH_R_PA_DAC_CTL, 3, 0, NULL,
 			   0),
-- 
2.55.0

