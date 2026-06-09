Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79113B8BC4
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 16:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022205; cv=none; b=tzNSWthakCPa6ovgUUEpKNcYxKdC4pA55kjgI4eGrlTbN4RKOrz0axonUKmGHoPR4l5uOaHWit/pG8+606twa0N0ZIlOpHufOQQMGYArOURgvI2ygLRaP1B5VNuxRMMrh9BRiksgZRZgmxl+reYyC0Sv+Dh1g42yEM7VIJ+QwzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022205; c=relaxed/simple;
	bh=lSUFMq9Iap1rdJNlT3oDAV2LcIWyyogUVtvmIuYB+vA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EbztANLSQnMIq3gxZL2NHKtipubuXo5+bG8JzHq/jXIRjbjm0oKaRu09Uvm7VXUxV0KPWTORveUw6hjpIq05Tt9Z4pTKuXcIl04oE7G1NIw0tT32dlMVbDJMt/DTHNEW6fQpLCeXbGzNvzJ5/ZI8HvxxxIjC0Q6ipRtT6S8GvN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J8/RfBDt; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J8/RfBDt"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5176b9c476aso43311271cf.3
        for <linux-sound@vger.kernel.org>; Tue, 09 Jun 2026 09:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781022203; x=1781627003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZQauIJKMkpkl88TicZuiGE6oI1IQBcGG5Fit1zxYJvY=;
        b=J8/RfBDtJnRt7LHHPpAJtzHjTLTX2s+6DDH10xLhE8B0vMBCz05NNucl/zUSBQprJ7
         x/HWxMFgdCcUUEuDZEq80j0AJksjCG9C7I93QdHEC7WJrDaQmNEPgEa/0op0jCbP0LuW
         PL6EoIEfUywYied4qcCbqAfur/rAeZFUlKPfybw0LmZFm2RuZpiW+4/BpculZkKPCIAo
         NYs6IqXiLp4sBmp924hutpVOqS2X1EGTmwXlwdJdgh4h7032GVgLq+RZmNVCAadJWlGQ
         xOtcUV1J/NsRT33aPfLq/QItermPYBvN8rkHgbT6zuoiXikX6gS/eCW3uOORa50qCR1p
         SVIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781022203; x=1781627003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZQauIJKMkpkl88TicZuiGE6oI1IQBcGG5Fit1zxYJvY=;
        b=MPYk85qS5AI8udOhy7G63SzdhLhfhqmuFfXqQfuwE8vrugHY3NfX6AnE0UNeakKIhC
         85CjV4OL+/hWCMrotoSpclr1lK7DvgcIZWjKou3WRG6QiJL+keN5KsV+6/24E/AMjblD
         tUeUtv2Z4j+WnTdNjZZefXmHpJLKGbtr0gpKx6YZ8wkghbksnuWGEIS1JDqUoPvw91s2
         Gbev+HblReAIV6rGqeWS0e2YciCnHEHgD6QbmvDsrB0Tbuj5q9O4krhO+de3C1GP/yT6
         uUsWWD8WeGefsU8UYVTU1ndBL3MUs7wcd1K2hllZjL2Aj73ceNJ1jJ3kOPq5ehzJmW5p
         8akg==
X-Forwarded-Encrypted: i=1; AFNElJ9NHL+4PISI+wTW9zs+M4NwjV73qAVaQ2ThZSzEvM9aQhXNhqblzFSfeCBRPXhcXlxSyJWr+2XUhpKKHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLoD+z3aS2AdCkTUY3XgRNQcBriYdNi3s3LewNh2fJI7V7L8J8
	i/TIDTjK85oMk0aZC2gcYwHS6RWHrD6q4KCgf6Wi4w8cp7xtbRfFMHfA
X-Gm-Gg: Acq92OHyajNeLVyHOihZ6scnvC43W8IdP+EJ1lZPPqzGK0ACXz1hSE/Nag5GMWSnQdZ
	mAflNFvXYPmH2w0cjEcwszPfpd9amLnFYFfkOxEJZLx1yiPe0BgfXIsUZeer5Rfy1SKVyzeR+yw
	yiIbuIOrHWrDTlIPuXcJtlz4DbjcdT7xReRVoQ4dzO2jc9Wtlrr1zHaLfJY2SjwaIN9/8Mq16fx
	u5m1pstxAi8ajZ74m6iHqv0wstpgV1KRe2VTVx+qAs2WpbpIjAiSxQXuTL7+2QDDcKfD77u0r0+
	Nc0rjNsP6yDEv/yyPYIDNr5II7WtVcMufD5lmg3CUAlZ9QcQR1To17YGxckPi/ymRDZNgKhvomB
	eiR+IUO9jJ1l99NgTJQN3T0vgKHOPG9P0N9Nb1LV+bTgsZcdq/sfuycgXwpDMMGNL00V+EPsfzG
	giNQVL+86z6mGK9DZyaqajPBbaRzz7B/4kk7Ziqw==
X-Received: by 2002:a05:622a:4cd:b0:517:79f0:ae3d with SMTP id d75a77b69052e-51795a42fd9mr300851311cf.21.1781022202696;
        Tue, 09 Jun 2026 09:23:22 -0700 (PDT)
Received: from localhost ([142.181.163.192])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775c07eb0sm208386171cf.5.2026.06.09.09.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:23:21 -0700 (PDT)
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
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v5 15/15] ASoC: msm8916-wcd-analog: add quirk for cajon 2.0
Date: Tue,  9 Jun 2026 12:22:55 -0400
Message-ID: <20260609162255.31074-16-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609162255.31074-1-mailingradian@gmail.com>
References: <20260609162255.31074-1-mailingradian@gmail.com>
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
2.54.0

