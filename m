Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16833DFC7E
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 19:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772654398; cv=none; b=oK2yJyQcQs2BuR+Wmy2uP2tneX4L6VhHe41+w10QXMO+bso5rhSPSPcxR60x7uQBzDNK52dKVt2QFJHhhAQSIROUGgUr/0+X36LP7FEZwI058Hz+r0Dl5dyNfX8RkgrY8ldVVj2aWQfZ1VgzR2ARf7LfmMAONNvlq2umq+5Aaoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772654398; c=relaxed/simple;
	bh=8/f4hdOSdwYHmvZUxaFmVQurWRhk7GDQgpmiggd0Y9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=irEtVIQR7Y2/WSja8BK3TmXuZ82xOtIPdlkIUIrJrhhIAiBVHFE4GkeDtv0XpJAD4SjgVB5X087R4mAW0nm7RY6AWTeiKTU//DMTuNcq+IAKaw0TWbBikgLBO2JuQwKZUykLTWENjHeHRAtr9UfVlrNbLr6G3vHHBFgfz4WBU0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d4OKRsw1; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d4OKRsw1"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-89a0b376fedso15553416d6.0
        for <linux-sound@vger.kernel.org>; Wed, 04 Mar 2026 11:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772654397; x=1773259197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8TOsv1PGUXfFuGxG5SQQqgTLrZyW8alSpUKXMJIOho4=;
        b=d4OKRsw1GObVqE4eFja2CZKSLEsEq3xKWH1c9o4VK3lFnpve6Xq85cG1JGVFgeoNAL
         4wWfM8xu/ho/Sse+YpskUkK4nKsuaAzteY/B5v7tQuzk6YdF07mrRtQtNlE3jASRkki1
         k0B59ArPjcp0n+dR4S7MUjOcMNmQXYaCLf882Frg6A4FMoOlfcwzhsH3mw7vSzJqmgOt
         8qRKbzuIrljC7ZQJIWLvhrvwvGt8+RsZfW01DhklZq1ee8htaDocMBcDfK045p3qDMT6
         pU4QJp/H2Z90IG/ReOYd5pFicIK5/ccAcnksBdi7W+zYTgxOy2hlXkHCM2l/4qcXo20R
         ir9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772654397; x=1773259197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8TOsv1PGUXfFuGxG5SQQqgTLrZyW8alSpUKXMJIOho4=;
        b=Xp3X3ar4JX2yTnV6VA0vVXYj8m3LsvFT9uxA36dDjE7ECvzXKTY5ngBhn4HW/XXT8n
         VSh8BP0UzfdVZWVgEOR/Hu73RZ1B6FLN+zsJlZxPXVYD/9UNbLhMiUHZR7sM0gTX4Qfn
         aD/oirEXYoKy/C7jmxEVH176aRpWc79EV1OrVL17cGtY+lhDd6jlS/BURY8oK6I/GukV
         7Fie/7K6DMboSqkdwtafod9AMg0DrzI8f63V7jfT6Dx+F4Jq9j3EqhdDzZwMN9Vm2ulA
         kHEGf0yNrhK9/J74mKZaUx7Nmi1tb0rQSNvMbOi1Cb0bCydRssJ13BAS8ZsR9J8ND1XS
         Vm0w==
X-Forwarded-Encrypted: i=1; AJvYcCU0KsQo9irBPVH6HbaUV8ZsTJabycozOgYFMS119KCSJSCFEE4js9NVT2sGycU/5Hx40f2JddcRNLBZTg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn5E04BmcQkS7WGA3AZrHGA9C1f2vH48qKa02OGiB+kpoMNd8T
	ttKWTXkoaO7Ww6wF3v5YRjCpzHpbQuZzu7uw4cdiafMKb/ny3zEj0aVZe1YStQ==
X-Gm-Gg: ATEYQzzHEsAtzYTYV3V/TvMR3bT9RqSSoAbGILJGwlAqojOvpjw4O+sP50pXMxIAFVI
	YcUGdQGyEbF0oXtOS6CO3k9rIpcdc7VRFmg2TFIEYGpOjzdcbga40qndNFAZ+fwBTCwUaBRo3fN
	tzyXP9GShGmAKs+h9NQa3cuWWtUMyME0zYzbtg4pG/3s89OxRE0oI/jGT5M/ITthGskAcvz30Vq
	+aFDq1tUSKJzqj4aSA4r6dpKWthmbL01pnZpMTCv02W84ViKJbxy/4MCCaqHzlZcPWJ3YZHQ2CH
	fEew0eEIOeONQ1ffUBWduXn8ebC8KLkUnQUX9lhZ11rHvn+E+8wFCByLEG+2H4pGCEvjL9a9lyp
	UflT16hO94i79Iyy8awaXtT7tlrGQfS+GZgjK0RpGqNRdQTH1BSeC9uTqBe77x1a0HVrNK7rWhI
	6kg5BrBkY9uXmGhE6xH06jzP5StKpxER1nNnA8
X-Received: by 2002:a05:6214:21ce:b0:89a:b94:3cb6 with SMTP id 6a1803df08f44-89a199967b1mr43265516d6.1.1772654396693;
        Wed, 04 Mar 2026 11:59:56 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899eab5cf2asm100369486d6.13.2026.03.04.11.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 11:59:56 -0800 (PST)
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
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 11/11] ASoC: msm8916-wcd-analog: add quirk for cajon 2.0
Date: Wed,  4 Mar 2026 14:58:15 -0500
Message-ID: <20260304195815.52347-12-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304195815.52347-1-mailingradian@gmail.com>
References: <20260304195815.52347-1-mailingradian@gmail.com>
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
index 9ca381812975..6fe111e6d686 100644
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
@@ -696,6 +698,59 @@ static int pm8916_wcd_analog_enable_ear_pa(struct snd_soc_dapm_widget *w,
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
@@ -883,11 +938,15 @@ static const struct snd_soc_dapm_widget pm8916_wcd_analog_dapm_widgets[] = {
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
2.53.0

