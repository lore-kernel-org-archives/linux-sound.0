Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B4D2F531F
	for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 02:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770775429; cv=none; b=KKO0siKaMlr7/CfqesBdwP1JKv4T2VnwEjPKzoVOjm8JP+BmLVtwM9DumNAqCwSRjmag9soCVw3gMeXl7Q+VE4bQSHAb04yLBLBjvV+qeSW+OpJmQD/eVbEYK1pdZZDLpVFSFV6M7uQqZY1GrVE/3zrrJeovvEXaDruVHfJQy0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770775429; c=relaxed/simple;
	bh=8/f4hdOSdwYHmvZUxaFmVQurWRhk7GDQgpmiggd0Y9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qA9U5qRv0e//aPLZ8EzTvstKp1ilY4bE/dn8celtK2PAOLdA6JIfCUqYeADj9WswXGWF1AuWREAojGExl2OytD157MB2sqmcdHexbMxA9py9gxhu8XlqBukCmXxSyiNQR+8zTtn5KZS16TasIcqyrBT8msfxLhl539RM7v8l4eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AVf2KCa2; arc=none smtp.client-ip=209.85.222.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AVf2KCa2"
Received: by mail-qk1-f193.google.com with SMTP id af79cd13be357-8c7199e7f79so668705385a.0
        for <linux-sound@vger.kernel.org>; Tue, 10 Feb 2026 18:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770775427; x=1771380227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8TOsv1PGUXfFuGxG5SQQqgTLrZyW8alSpUKXMJIOho4=;
        b=AVf2KCa2tSmsDui1ZEcFqUcfjOcfdd6onU07nHgyYepPfC+2uTUAmeJwvpucgM1cNv
         C0wKZ1jJY6g6SFW/vxtFUlNiI6k/CFKBwp//PeZBjJFXeifgKl/B31FRK/TdD4DfMUhb
         CuNZjI0BjqaIISxIJxgVVyeAAzMm6Jz/DMb0FY8+YldCGgkEYHthK2Q1vbRC01dLBoF6
         uEXzac5WpBivfgwq0ZGTyag4D3ycCpk77RspHZUMDL78GhMQY89ApRWApmIJcoAOJ8Qt
         wPBXQoNhe6/6BZHz9qb7eH0Z0FsP82WTjq3tCT/M7F7ZFSmOXzeb/oYz0qM2Dg56Zz0d
         G+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770775427; x=1771380227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8TOsv1PGUXfFuGxG5SQQqgTLrZyW8alSpUKXMJIOho4=;
        b=wS7TZfw70u0Z5coy7ULiuuc+mUFPMWTv/ZfXPA7zSB0LPiM3qtP3A9udY+tohbRfc+
         tQSsiLDOuvwQ/O9lZDf4PrLg2Spmgq1g7CoAvCN2TWAiCTwT5mTkJesxwFsgeC9D6fzm
         q0PYime+GVDxm7MzjSHbybnlMyhogYWJmO92RKyozxKmpdgR7oFKQ3XMv/p6onnaLfc+
         FYzrweWrjwkt48rNIP/o68G14WCYs3WRvM0pYp+CXFea6GQCSaJQN+HG1MIdVGxStM5x
         LfPp4qJFpHzaAhrAqDY1WEHSwHoY0VLhocLHqqYRm1LvFl3+x6hLSsUodaJQqUqSmuHb
         6Qtw==
X-Forwarded-Encrypted: i=1; AJvYcCVMno5oUxJwsOdj3NRKipPxe8PR+mXZBD+4nTCKtCdslPoqTdZV+IRZ8z+QInfMtCtEJdI10L3KTL+/rg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKdOKXO1zkEWIWRIXq6Wd6BSXRiN4V1hQFaZUNb27tLhTtWw71
	0/5tB3Ihr7NelQIsZMZOC04VewubFQgx7I0+rlTloxSW39xv67cv5ij0
X-Gm-Gg: AZuq6aJRntSmlQO3Ba1FKDDkevE4dyOIoCQkGMiQpkGrOEh5DnE9+8QsuJHwP1mY7lc
	Tt87a0+HyFQmDXdETAYalRyzlpV3wAoGx4Jqt7RCtT5EiuUnCNVvpQw8a8vPHt4Pb507Sn/lXrt
	FHxzSWRmMqkK8Q3WDG2yEOMawyLpFidNFIa6cm6nS8NcE/kz+Waq8cgOC4HAgvcClvhE7GJF7Si
	ggwP5lBPAD9iqjh/8tLLJWqJXmZ5iC9kMl8EZEH09m/QUCtrnU1BFuagKATQURqGCEdfbOUgiAv
	9Av/7Asb0zAnRTsYPFEXRZcaY6E7/z/QCZBbFS6s9efj310qCJrtVSWYLl3GDV7/v+oiyz0IM1n
	b1HtmJ2dfCmc+QvyH7wx73qXx+Nt6gBTYEOcWqisAOpYKy+pkL8i6Y/q6Ydbizr/A1el/44O6SH
	0Vyga0/kkwYTqwe5N0663V+fmhNkcdIGXB+Qw2WvPpVJSFpg3xpJmgeFNBlhFtPklLWeRrGjKyo
	Vq8ac4cJMfLYgs=
X-Received: by 2002:a05:620a:408c:b0:8c6:a539:55d4 with SMTP id af79cd13be357-8cb28041932mr174538085a.48.1770775426955;
        Tue, 10 Feb 2026 18:03:46 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb2b20f5desm9522785a.41.2026.02.10.18.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 18:03:46 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Johan Hovold <johan@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 10/10] ASoC: msm8916-wcd-analog: add quirk for cajon 2.0
Date: Tue, 10 Feb 2026 21:03:02 -0500
Message-ID: <20260211020302.2674-11-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260211020302.2674-1-mailingradian@gmail.com>
References: <20260211020302.2674-1-mailingradian@gmail.com>
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

