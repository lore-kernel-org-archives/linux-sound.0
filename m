Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6653C3E3D90
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 11:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177414; cv=none; b=MZF5ZghKthu4b0w7NIm65lvV49RF19lLlNKwQDF9eQKF1ilksU1fr0H6dcmYrhIiKX0nipnxXKwKkDadtTHy432AU9EzKJry3s+xMyH0Duxl/HQNbcl73/uwPnhKBwIw/EQn27S5tyeuMMKTrWP8olDQ7TMszPVOIrnHgC3dXPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177414; c=relaxed/simple;
	bh=JxydoAK4c/x7mitXawfZI4XQhQgJPPm7W+ijBGuaEZI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Acv6UrIY10dJdcnysNb2Bt7CtAXIhZ2lClyZH2aAMma33ClLTcdkRkb5ruf4ytOdzpshDbFgk9iEqij6Z+zOpgDbSu0wd+N+Y4LPdeBCWlCRcMliFwry/GIiddybhEVYk6o9yzwHTV4M8uQgwrPqrURpTHjq5GJOyRkyL6i5ofM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SoWBbeX8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JKRWQjZG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SoWBbeX8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JKRWQjZG"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9x5QV267506
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 11:30:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2ymPIOvipeO
	RT0yrOudYUfCdj8iM0kkI2XFwKKa8BQo=; b=SoWBbeX8lbujDAgZ74I0WDKQdVT
	hDSAFKQvm73YPrcLsecCpb+hDv4OBE0hKMf6GXlAHjY32J/Odq2mMfQKlBenzL8b
	wYMUP1yFXCpXlOXykaiQ+7JW45ErwyJsxYofMMsj6oq8+JFZNrtd6vnO9dZ3GEaZ
	haIginipou/bYdZBAkLq/lix3DzMZxZuqLkbEmKNXygwY5JJaogxUimsLVaU0DF3
	dbTkpOyIMrW/2n0RVcsWwJ5qOKr1G3qmCkL6pwf2l2coTo42zzIrY2SkMJ3zXsiO
	yiM3gnZd1u/9VqbipePGHsspKmSPx2c9CLh/GEgOm/KV6zVjZzO9Q+AHO0w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u35b1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 11:30:12 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8428384f31fso5707011b3a.3
        for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 04:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781177412; x=1781782212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ymPIOvipeORT0yrOudYUfCdj8iM0kkI2XFwKKa8BQo=;
        b=JKRWQjZGPqTro066yQQBPv00x9Lmteua5+5oJqPy+JylxJPR1+yXbZH9x+mRRdxQjP
         vV2Mk4NfaHR8GehyQvKVEg8o5txUDh7tcYbfWDwt4ccsTS2Gl21ZuO1CsVX0yls3MNyM
         5UMyX4N8+IpN0NMWpjroElBdXJyZ+PEtzIpTlk8lC+7GKKs+ICdj1lMWkT5b4ZmE6SLQ
         RfBpIpRgNn3joDMdybUwPUWqhskNGPEGNWkDVDAaZfatrv4dTLlirVpfWouJx9on7wik
         +QS8kZD304MgT+RL5Ed+eJyIHGq97vSnzbjs2TFJu6aYiZsQxTlTSCrHaDkkByILRTQ8
         DxFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781177412; x=1781782212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2ymPIOvipeORT0yrOudYUfCdj8iM0kkI2XFwKKa8BQo=;
        b=f5qkkrPrZPGJSqwfOkLUt/Y0HlqXcv+S0QV+1rK88Ar8BtfLZwgN12l29EsG+HvFCk
         E4sVetOdeNNKxE6kgJPMSk+SrBaa/tp8+tsuvNGL/J4WIn3994w60Eq3kWcQvJ5WEPjs
         xbQqnPsrDuaJ6L2RYHGN/Md7qlx8HNcNUoeK+M4HpUsMFSiW4hgZ2eG6faZp1pjX9XcD
         Bejk6D64jUKg3xkm/hiEy5Wx0zkTHLOUgbcE0i+xxLUaXmufkb/DImE+Z/w8aGto1zc0
         hUY/WRqdWN1IJUmfsMcGYLZVV44eY4HWpMUPQ6ywUh5YJx4j/TOJ4Px2BuTm6ZsfhMrV
         LPOw==
X-Gm-Message-State: AOJu0YyPKHVl19ooH55fX79cDGB6iTtKMFcY5Ay4QRLk+2uVT35Qzqah
	v+6qSUnIm/mUrr6jddS6Y6lYaidaEffnHjE8LeWtNgv8YVR2QbSdG7pKBfMhFk0oMfm5zObhRwV
	d9Jp+5vfdHm7NmtA2M6zKgFzKZtlgxQqFkXq3Ph169rRoRhKz3pEGkb3vNVbKC628wA==
X-Gm-Gg: Acq92OGvXVuVlveqEvgg/hMln/vqTwiIVoKjHGLT6TtIXBgvpgeYw7Cru8WQGABQe04
	1cXdUuIz2yBl3a33yqPeFmSYEr/5X18z9PeMec5qHoDh+nFOKGR3XiR0yQUeOH56vmvVj2Fm0lK
	XsHp4IhToEMOymi1fh+DeC1uc2xd1NwOK6zCl8UlF9KCL8NG4PAJ0XmXF89F13maPNdg/Wsuy7X
	BPwa3LSZVkJ4lgyJORnx/LzyAWXpyejpFfHEf/gyTBSWiPxYtC8pxHrb3Sd5BalJUAvlnSro9Vo
	2u+9LoLMCdaOsK522SejPgpe1ruWlBHjlSMHMh5PE9wGa6NR6hwGTfi4qQu5QGsgWe9V3Aexhh4
	uu2ZElO1feQZ+EtewMVWLpewDQKNOD7YiWBQoev33NdvG5SN9byvjEMriycJw
X-Received: by 2002:a05:6a00:3e0d:b0:842:5bf3:c53c with SMTP id d2e1a72fcca58-843367eb6e4mr2783315b3a.2.1781177411959;
        Thu, 11 Jun 2026 04:30:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e0d:b0:842:5bf3:c53c with SMTP id d2e1a72fcca58-843367eb6e4mr2783265b3a.2.1781177411306;
        Thu, 11 Jun 2026 04:30:11 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337b8fcdesm1837301b3a.9.2026.06.11.04.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 04:30:10 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ajay.nandam@oss.qualcomm.com,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: [PATCH v1 2/2] ASoC: qcom: sc8280xp: add Shikra EVK machine variants
Date: Thu, 11 Jun 2026 16:59:46 +0530
Message-Id: <20260611112946.954172-3-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260611112946.954172-1-ajay.nandam@oss.qualcomm.com>
References: <20260611112946.954172-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: q7ZBSroJSvO8j9mwo6Zdz74VSIIhejLi
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExNSBTYWx0ZWRfX8iQW+OJ2cgXj
 /bw36fLdvNpRcOs4uacHKtMnQc9Z+avmPOU97WVRrzQsLXWuBD990SfiNmPGnK6njTRSnrpYS87
 mbne10tRMiQnoK3V12Khs86nwYoBtmY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExNSBTYWx0ZWRfX+9oUqXDW7VWl
 SoqDtuBYtVA/awhFQasBJ6LfezBN9PgO6C6ClEXNPR5UuNipRZSEBYcMwaqmuuCiSOjTbMOZKI3
 5XWFx2PQ5BmNck9s4XVME01FwO5tvKn69i+ZMSrKrJ0s/VvuuBxrOiD+l6syUXg9bI3Nai1aDCz
 mWsdDHpd/E0K7pYXbEa77GYyKCa6HKOmR6zyxBuxowV6diLCJR1UwXuSSEyWgAEX1vX38hYcj3z
 08/rUMeo2O/mka7KwbiL2hNs2JjQVIubmScGmk45bZD+0qWvRMCxh8KetrWYh5aTPnRTrgSivVJ
 MrFwdxN57thuG3bFsG8YmPcO3QzUuxssbqIqMykW9DJP11zNcWxcUFCpljs55Fb5HMiKPfFjbYk
 9GSA9USfUG9mcdTgQNKSsWBGHsBRMu5oIB6h3AISbpWj7w2/BF1Azv7qLx/g1p6sr9GZ7WNVld9
 cHgrMaJJps65TN7JuZA==
X-Authority-Analysis: v=2.4 cv=F5lnsKhN c=1 sm=1 tr=0 ts=6a2a9c44 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=t_tmAbmC07WJz_vCYN0A:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: q7ZBSroJSvO8j9mwo6Zdz74VSIIhejLi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110115

Add machine-driver support for Qualcomm Shikra EVK variants by matching
dedicated compatible strings and applying board-specific audio behavior.

Shikra platforms are available as CQM, CQS, and IQS variants with
different audio components and processing architectures:

- CQM/CQS use an I2S-based path with WSA885x amplifiers and
  PM4125 + Rouleur codec components.
- CQM runs in DSP-bypass mode, where the complete audio pipeline runs
  on CPU only and no DSP is involved.
- CQS uses modem-DSP based audio processing.
- IQS uses a third-party MAX98091 codec with modem-DSP support.

Introduce variant-specific handling so codec controls, DAPM widgets, and
clock programming match the board design and avoid invalid clock setup on
variants where it is not applicable.

Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/qcom/common.c   |  2 ++
 sound/soc/qcom/sc8280xp.c | 58 +++++++++++++++++++++++++++++++++++++--
 sound/soc/qcom/sdw.c      |  3 ++
 3 files changed, 61 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index f42c98ded..32d6c09b2 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -3,6 +3,7 @@
 // Copyright (c) 2018, The Linux Foundation. All rights reserved.
 
 #include <dt-bindings/sound/qcom,q6afe.h>
+#include <dt-bindings/sound/qcom,qaif.h>
 #include <linux/module.h>
 #include <sound/jack.h>
 #include <linux/input-event-codes.h>
@@ -430,6 +431,7 @@ int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 	}
 
 	switch (cpu_dai->id) {
+	case QAIF_CDC_DMA_RX0:
 	case TX_CODEC_DMA_TX_0:
 	case TX_CODEC_DMA_TX_1:
 	case TX_CODEC_DMA_TX_2:
diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index e5d23e244..4c985f81c 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -37,6 +37,25 @@ static struct snd_soc_dapm_widget sc8280xp_dapm_widgets[] = {
 	SND_SOC_DAPM_SPK("DP7 Jack", NULL),
 };
 
+static struct snd_soc_dapm_widget shikra_cqm_dapm_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+	SND_SOC_DAPM_MIC("Mic Jack", NULL),
+};
+
+static const struct snd_soc_dapm_widget shikra_iqs_dapm_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+	SND_SOC_DAPM_MIC("Int Mic", NULL),
+	SND_SOC_DAPM_SPK("Speaker", NULL),
+};
+
+static const struct snd_kcontrol_new shikra_iqs_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+	SOC_DAPM_PIN_SWITCH("Headphone"),
+	SOC_DAPM_PIN_SWITCH("Int Mic"),
+	SOC_DAPM_PIN_SWITCH("Speaker"),
+};
+
 struct snd_soc_common {
 	const char *driver_name;
 	const struct snd_soc_dapm_widget *dapm_widgets;
@@ -49,6 +68,7 @@ struct snd_soc_common {
 	bool codec_sysclk_set;
 	bool mi2s_mclk_enable;
 	bool mi2s_bclk_enable;
+	bool dsp_bypass;
 };
 
 struct sc8280xp_snd_data {
@@ -219,6 +239,10 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 	int mclk_freq = sc8280xp_get_mclk_freq(params);
 	int bclk_freq = sc8280xp_get_bclk_freq(params);
 
+    /* Skip DSP configuration when operating in CPU-only (bypass) mode */
+	if (data->snd_soc_common_priv->dsp_bypass)
+		return 0;
+
 	switch (cpu_dai->id) {
 	case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
 	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
@@ -239,7 +263,7 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 					       SND_SOC_CLOCK_IN);
 
 		if (data->snd_soc_common_priv->codec_sysclk_set)
-			snd_soc_dai_set_sysclk(cpu_dai,
+			snd_soc_dai_set_sysclk(codec_dai,
 					       0, mclk_freq,
 					       SND_SOC_CLOCK_IN);
 		break;
@@ -284,7 +308,7 @@ static void sc8280xp_add_be_ops(struct snd_soc_card *card)
 	int i;
 
 	for_each_card_prelinks(card, i, link) {
-		if (link->no_pcm == 1) {
+		if (link->no_pcm == 1 || link->num_codecs > 0) {
 			link->init = sc8280xp_snd_init;
 			link->be_hw_params_fixup = sc8280xp_be_hw_params_fixup;
 			link->ops = &sc8280xp_be_ops;
@@ -375,6 +399,33 @@ static struct snd_soc_common sc8280xp_priv_data = {
 	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
 };
 
+static const struct snd_soc_common shikra_cqm_priv_data = {
+	.driver_name = "shikra",
+	.dapm_widgets = shikra_cqm_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(shikra_cqm_dapm_widgets),
+	.dsp_bypass = true,
+};
+
+static const struct snd_soc_common shikra_cqs_priv_data = {
+	.driver_name = "shikra",
+	.dapm_widgets = shikra_cqm_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(shikra_cqm_dapm_widgets),
+	.mi2s_bclk_enable = true,
+	.codec_sysclk_set = true,
+};
+
+static const struct snd_soc_common shikra_iqs_priv_data = {
+	.driver_name = "shikra",
+	.dapm_widgets = shikra_iqs_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(shikra_iqs_dapm_widgets),
+	.controls = shikra_iqs_controls,
+	.num_controls = ARRAY_SIZE(shikra_iqs_controls),
+	.codec_dai_fmt = SND_SOC_DAIFMT_CBP_CFP |
+			 SND_SOC_DAIFMT_NB_NF |
+			 SND_SOC_DAIFMT_I2S,
+	.codec_sysclk_set = true,
+	.mi2s_bclk_enable = true,
+};
+
 static struct snd_soc_common sm8450_priv_data = {
 	.driver_name = "sm8450",
 	.dapm_widgets = sc8280xp_dapm_widgets,
@@ -408,6 +459,9 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{.compatible = "qcom,qcs9075-sndcard", .data = &qcs9100_priv_data},
 	{.compatible = "qcom,qcs9100-sndcard", .data = &qcs9100_priv_data},
 	{.compatible = "qcom,sc8280xp-sndcard", .data = &sc8280xp_priv_data},
+	{.compatible = "qcom,shikra-cqm-sndcard", .data = &shikra_cqm_priv_data},
+	{.compatible = "qcom,shikra-cqs-sndcard", .data = &shikra_cqs_priv_data},
+	{.compatible = "qcom,shikra-iqs-sndcard", .data = &shikra_iqs_priv_data},
 	{.compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data},
 	{.compatible = "qcom,sm8550-sndcard", .data = &sm8550_priv_data},
 	{.compatible = "qcom,sm8650-sndcard", .data = &sm8650_priv_data},
diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
index 6576b47a4..0be743cec 100644
--- a/sound/soc/qcom/sdw.c
+++ b/sound/soc/qcom/sdw.c
@@ -4,6 +4,7 @@
 
 #include <dt-bindings/sound/qcom,lpass.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
+#include <dt-bindings/sound/qcom,qaif.h>
 #include <linux/module.h>
 #include <sound/soc.h>
 #include "sdw.h"
@@ -41,6 +42,8 @@ static bool qcom_snd_is_sdw_dai(int id)
 	switch (id) {
 	case LPASS_CDC_DMA_TX3:
 	case LPASS_CDC_DMA_RX0:
+	case QAIF_CDC_DMA_VA_TX0:
+	case QAIF_CDC_DMA_RX0:
 		return true;
 	default:
 		break;
-- 
2.34.1
