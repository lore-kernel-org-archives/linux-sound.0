Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C033CFF70
	for <linux-sound@vger.kernel.org>; Fri,  1 May 2026 15:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649577; cv=none; b=IVslLPwEfpJz1PTTrMu2lTD+kudSRWUl59cldPgIF5aLF1PnvDmM/YdRCNSL6FQoLirRvqKa2fj3aTPkQDfMlK0wi4LYZ/zzXKU0hUj+TBs0HkBo8eFKofV3T6odZhKygtP/FcsvpAfyUQDVv8vKYWBAh8A2lRCp1EG0PRARw/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649577; c=relaxed/simple;
	bh=kWzw/voZgkZ9F987lwcQbashORT/zBgp+puHFaAHgP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nLr3XzfJVhzCv1I/JWb6RhBWjv4vjbHa9dU9GLBi17LjiSq2/ov3zwbvZY1OelHD/sB4XtpEMhjEqkhAjOnxmIBqcSxxEbK9fbsfPd9U431Aa+uvtjRRkLQmN4nUfbdGpcWlIBmIdzZV5rVObjsDX2QzZlsBjv0vnqlV+Fw7aU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nLT9S2Qs; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nLT9S2Qs"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8d933da14f0so215245285a.2
        for <linux-sound@vger.kernel.org>; Fri, 01 May 2026 08:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777649575; x=1778254375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pPPYmlM0l3hrpJwW2jPS8aUg+kvVKXo2i1UV0uK9TUI=;
        b=nLT9S2QsRmIhRR7rHy4H41XXnhJomDU4h16q847ruLzGxMcDkI+eWvNQAuIRy3b9t7
         fTYXglOX0zD1PnMvL5jPwaDYtWdPHFAJkwdqsfYkGrQyT0q7FjYiHrZeoA4vpFJe4ABE
         rE5N7y0Bscmk21WZdL7dBD/plyH+/CZdfCoN9flE/cFF5CsudOCXBnB+37njgJ80RoX9
         U6tYLEYWD2wv2j/xVHQsu6QGDlNUfo8F53oYFdojq3/p+mlLhuDcNl8IZzatLVYvIc5/
         zRP4GUmNi2UnEd8pDhNa72pJ0lFLZcSw/yzNeUsnOCawr3P/1zhx1aMU9Q7tV9Az0v+8
         u8dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777649575; x=1778254375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pPPYmlM0l3hrpJwW2jPS8aUg+kvVKXo2i1UV0uK9TUI=;
        b=BaHuSpCPzZUcIquSkMe5SbmvHf+6aFM+J0ng8VljQlvvZqqvnJhXMWY2vpT+gXYdiL
         /dZdUo83bs/dSG18ugkVgjg/wNfylihWrdTVysUlNearTNw6jgmskOBu6Y2eHdiftqtr
         w8WPX8THFAyKgNZbdxruOoVq3yXCs90y0892FJvriDxRZYA3yUCbS2nIJ8EaIMLpIY6E
         8EZC/f5km9PHdatjC5XYqLYdibS/0pvhwkO15hnzx2KklpAXiz2ay1qqyPv7N1TKhnV7
         5B31n3MVW+hPIKlaGoYae6TM0zbIozIMULP/yeaAQsWfquzoWmRkvdRGsTurWBtzJWr/
         UJHA==
X-Forwarded-Encrypted: i=1; AFNElJ8shtM+m5VKJDGSZwPx44H04M5KmSxd2nFBcdbst7eHpNtHj11UTjSXICmMfQaRkZiVeT0si+w6jQjq0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJaMlJqI+cH0P6Orn0i9GSVFJTe96WP1zIeb0VcHJPUUssHVdV
	n2mREoGeVrX1Thdi/y9BhzaTbR7FQGvQ4fs0usw5jRjeIkCR/6swz9k0
X-Gm-Gg: AeBDieulSW3lVphgqQwpdrCQ5CF2mg5vSxs8LTsHQEzx1eKG+TZak0yG4c2o/tNNKG4
	zrMrw+j+tB//0U5jbyODMpxH63111qU6LESqu4vXGCPSxscV4TsMySTTMx+fojUNEHiBJeLb8qv
	Kpyp2cXvoE9Oi+ZCXSrwZiDuxd2kR69DESYADHBODxQBHQ87SoaqWlwxQpzwNC/OLdmvfq1QFJQ
	NkGDDXNWesEcAcppaqFbeBUzUfYxWXS68rwdwGNR8vUQxlWIKFYJRNzysIKVxXkKfQlfCWj/RYG
	mmkrHOQQ8grcQT73IrsAYruBvKjeHVNrJjBteMrPOlf2Rwrv4SEwrD8WsYuxv6TtHYYvzc4usz4
	IL+EmrwGGPqVSUuah4Gl6VrC/vUQTHrv8pY2FZG/8UvUkkJEMFVor6QtrgQhYhkY2JQn4AudKQ4
	jWd1/3w12cHYRdwbPdlDZiz4JJigwSodZun6z8jLO8DtB8b//rEq1rzsvWstQyDGD16jnx8iQw8
	HFNZpukm63BMMTwPsEviMC7PQ==
X-Received: by 2002:a05:620a:46aa:b0:8f2:a656:1d8c with SMTP id af79cd13be357-8fbf3174795mr468381385a.38.1777649575114;
        Fri, 01 May 2026 08:32:55 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc29a7f9c6sm206704685a.14.2026.05.01.08.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 08:32:54 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 13/15] ASoC: msm8916-wcd-analog: add pm8950 codec
Date: Fri,  1 May 2026 11:31:26 -0400
Message-ID: <20260501153128.8152-14-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501153128.8152-1-mailingradian@gmail.com>
References: <20260501153128.8152-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Adam Skladowski <a39.skl@gmail.com>

Add regs overrides for PM8950 codec and implement matching reg overrides
via compatible.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/codecs/msm8916-wcd-analog.c | 52 ++++++++++++++++++++++++---
 1 file changed, 48 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/msm8916-wcd-analog.c b/sound/soc/codecs/msm8916-wcd-analog.c
index 9ca381812975..13df60409857 100644
--- a/sound/soc/codecs/msm8916-wcd-analog.c
+++ b/sound/soc/codecs/msm8916-wcd-analog.c
@@ -232,6 +232,8 @@
 #define RX_EAR_CTL_PA_SEL_MASK			BIT(7)
 #define RX_EAR_CTL_PA_SEL			BIT(7)
 
+#define CDC_A_RX_EAR_STATUS		(0xf1A1)
+
 #define CDC_A_SPKR_DAC_CTL		(0xf1B0)
 #define SPKR_DAC_CTL_DAC_RESET_MASK	BIT(4)
 #define SPKR_DAC_CTL_DAC_RESET_NORMAL	0
@@ -250,6 +252,7 @@
 		SPKR_DRV_CAL_EN | SPKR_DRV_SETTLE_EN | \
 		SPKR_DRV_FW_EN | SPKR_DRV_BOOST_SET | \
 		SPKR_DRV_CMFB_SET | SPKR_DRV_GAIN_SET)
+#define CDC_A_SPKR_ANA_BIAS_SET		(0xf1B3)
 #define CDC_A_SPKR_OCP_CTL		(0xf1B4)
 #define CDC_A_SPKR_PWRSTG_CTL		(0xf1B5)
 #define SPKR_PWRSTG_CTL_DAC_EN_MASK	BIT(0)
@@ -264,6 +267,7 @@
 
 #define CDC_A_SPKR_DRV_DBG		(0xf1B7)
 #define CDC_A_CURRENT_LIMIT		(0xf1C0)
+#define CDC_A_BYPASS_MODE		(0xf1C2)
 #define CDC_A_BOOST_EN_CTL		(0xf1C3)
 #define CDC_A_SLOPE_COMP_IP_ZERO	(0xf1C4)
 #define CDC_A_SEC_ACCESS		(0xf1D0)
@@ -286,6 +290,11 @@ static const char * const supply_names[] = {
 
 #define MBHC_MAX_BUTTONS	(5)
 
+struct wcd_reg_seq {
+	const struct reg_default *seq;
+	int seq_size;
+};
+
 struct pm8916_wcd_analog_priv {
 	u16 pmic_rev;
 	u16 codec_version;
@@ -715,9 +724,41 @@ static const struct reg_default wcd_reg_defaults_2_0[] = {
 	{CDC_A_MASTER_BIAS_CTL, 0x30},
 };
 
+static const struct wcd_reg_seq pm8916_data = {
+	.seq = wcd_reg_defaults_2_0,
+	.seq_size = ARRAY_SIZE(wcd_reg_defaults_2_0),
+};
+
+static const struct reg_default wcd_reg_defaults_pm8950[] = {
+	{CDC_A_RX_COM_OCP_CTL, 0xd1},
+	{CDC_A_RX_COM_OCP_COUNT, 0xff},
+	{CDC_D_SEC_ACCESS, 0xa5},
+	{CDC_D_PERPH_RESET_CTL3, 0x0f},
+	{CDC_A_TX_1_2_OPAMP_BIAS, 0x4c},
+	{CDC_A_NCP_FBCTRL, 0xa8},
+	{CDC_A_NCP_VCTRL, 0xa4},
+	{CDC_A_SPKR_DRV_CTL, 0x69},
+	{CDC_A_SPKR_DRV_DBG, 0x01},
+	{CDC_A_SEC_ACCESS, 0xa5},
+	{CDC_A_PERPH_RESET_CTL3, 0x0f},
+	{CDC_A_CURRENT_LIMIT, 0x82},
+	{CDC_A_SPKR_ANA_BIAS_SET, 0x41},
+	{CDC_A_SPKR_DAC_CTL, 0x03},
+	{CDC_A_SPKR_OCP_CTL, 0xe1},
+	{CDC_A_RX_HPH_BIAS_PA, 0xfa},
+	{CDC_A_MASTER_BIAS_CTL, 0x30},
+	{CDC_A_MICB_1_INT_RBIAS, 0x00},
+};
+
+static const struct wcd_reg_seq pm8950_data = {
+	.seq = wcd_reg_defaults_pm8950,
+	.seq_size = ARRAY_SIZE(wcd_reg_defaults_pm8950),
+};
+
 static int pm8916_wcd_analog_probe(struct snd_soc_component *component)
 {
 	struct pm8916_wcd_analog_priv *priv = dev_get_drvdata(component->dev);
+	const struct wcd_reg_seq *wcd_reg_init_data;
 	int err, reg;
 
 	err = regulator_bulk_enable(ARRAY_SIZE(priv->supplies), priv->supplies);
@@ -738,9 +779,11 @@ static int pm8916_wcd_analog_probe(struct snd_soc_component *component)
 	snd_soc_component_write(component, CDC_D_PERPH_RESET_CTL4, 0x01);
 	snd_soc_component_write(component, CDC_A_PERPH_RESET_CTL4, 0x01);
 
-	for (reg = 0; reg < ARRAY_SIZE(wcd_reg_defaults_2_0); reg++)
-		snd_soc_component_write(component, wcd_reg_defaults_2_0[reg].reg,
-			      wcd_reg_defaults_2_0[reg].def);
+	wcd_reg_init_data = of_device_get_match_data(component->dev);
+
+	for (reg = 0; reg < wcd_reg_init_data->seq_size; reg++)
+		snd_soc_component_write(component, wcd_reg_init_data->seq[reg].reg,
+					wcd_reg_init_data->seq[reg].def);
 
 	priv->component = component;
 
@@ -1259,7 +1302,8 @@ static int pm8916_wcd_analog_spmi_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id pm8916_wcd_analog_spmi_match_table[] = {
-	{ .compatible = "qcom,pm8916-wcd-analog-codec", },
+	{ .compatible = "qcom,pm8916-wcd-analog-codec", .data = &pm8916_data },
+	{ .compatible = "qcom,pm8950-wcd-analog-codec", .data = &pm8950_data },
 	{ }
 };
 
-- 
2.54.0

