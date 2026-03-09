Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2110A399014
	for <linux-sound@vger.kernel.org>; Mon,  9 Mar 2026 11:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773054815; cv=none; b=MaPtQjzZHyUtqV+7d6TYQj7iQ2Zkux4fuBxquqTZFSgmLSO8vndG+Pi39vDC5tCPD50fNuFBElt6I/nOPe+4o1wxexMC5atreIlcstOnA5plef729Dpp3oBCN5sJyhanK9TkEdKZAa6e+RJJEmYMhs34SnO9ZQv3O9+/0malxLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773054815; c=relaxed/simple;
	bh=RD4c98jvLUyiYfBuTglyo98MzLCoqaUHXj1LQhon1Qo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A5U8UIN1ukFbh6Enm3DlQ3Am/fEvXpYOgGlId+1r8T961VULk2AIO59cAC5ip9/H8N84U2Lmi5iJ4oOF9T5z10MiL5OsKIj7/LyRVcPbP0UiuRcsjgEMyywHAevrAoR4dsgDIDy/lcpIc+1zQEeyPABN3SuHsT+D40BGled7C7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qs6cVRXg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KpWxWdHG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qs6cVRXg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KpWxWdHG"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62983rxK198538
	for <linux-sound@vger.kernel.org>; Mon, 9 Mar 2026 11:13:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LckKRZ+R520
	xGoLy9VPMIyB1+zTb2QRQ97fUKoxVTZw=; b=Qs6cVRXgsBB5DCwLtSqdyi838OR
	xvDbe+LfG6daMFWBIta/9toh6DKr1WViCZZqr4MHGFMb4MOE6XMPAQ5mky5LEp+y
	bVJnzJrcweV8eV8GULwMcXwEBbBnS/2ZTHSnZ80Ygn8Y1iH/qNIU2LAWJ54WxEgJ
	WAb21LnXsnnT0ONPfCWQl96c6H81+eW4KiI3ge5wQa8vbbuc5OC3+VVxJ49LscFk
	E00923DJaYl4rT+/Qoc2o2iFNpt+pc3RO3HCYLjOgY/d+g8kPqSso5dfW5hwf8Ky
	IW5m9/HuAfpWCJdeWnpja/gX+pUMwN9dTB4iEQwDzJelQ1R0iQhNIWaccwA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crc3vd4bg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 09 Mar 2026 11:13:33 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae6dd98043so53920175ad.3
        for <linux-sound@vger.kernel.org>; Mon, 09 Mar 2026 04:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773054812; x=1773659612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LckKRZ+R520xGoLy9VPMIyB1+zTb2QRQ97fUKoxVTZw=;
        b=KpWxWdHGQfAY03cA9tvC7PciAjF2Pc2hV1KNXvcwBP96+KAXyZE6XUoSQdpes7dGaw
         t08RYaAW/I7ZnW7agm8mZ68+amDwOx/QOglv9JXd+iFd0IMREJa5cDiIf8WZUH8Ipjty
         NdJgHRzvGX3FWUIfxOTAtWJd4/XBeVYyJVLDHNBZtMRq8D3+frdZju5jBQv3J8/0GIDx
         JNfJEst75IXcSfZC3SiKBt4EMCYNdDOYhzQLCnJtSlAx5FbDFLxa7WH39drr9ed03lAz
         Mqrq9TM4XzQ0gZcxZ8w10TgpqPZSsUkVylpoX4L5wu6KIZZwzB32HCGYXi48Bmnqr6oL
         5RwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773054812; x=1773659612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LckKRZ+R520xGoLy9VPMIyB1+zTb2QRQ97fUKoxVTZw=;
        b=MfAxd2SZWPc82juEwZs/g1SvhvBwZDtvk5nnwyEbh5L5xGOutwvBbEMH9vlRvOXAKW
         KIGiv4prkRxNNa+BCRyAxWodIQ/4PTT3wExuQRJcLE8F60b0x/Hf11qmCyGkHidOaGrY
         pZq1HUGQcRVPKCtaHhtCUHYuGGPRNpEOrH9hE/LiRHAH+D+P/M6Ri8pCO7FmOB2XJjuT
         tA+99F9gx57CYdR8tYy0C+yBSOa3AjN8ftZYYHWnCM+l0ISCDTG7PyvVkylxR0pqVapp
         jS3uy7qAkdSpQFNC6qQ1gbqgnmpO+OG/Ee2j6lbKCfBjF+4KIo/udJjL0/dv8+XC9IRI
         boJA==
X-Forwarded-Encrypted: i=1; AJvYcCXLYQP8caILgavN3qq82iBg0SPoseJDL0oRDfnhMoEBfId/AO5MBgyg0RBqf/TlRqUWTxi1PJvkN39RPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxQtHPzTbmjbciML3lwsU6xsLk1hrAyQpuIDnhgIhE1otCQQXQ
	GomdYH6zNdWdZX65a+9WbgFA82seRMISExeS0q3sqo9sN3lhNkv4NrC7oxQxI0JJwABMzmmhwz2
	GzNsBV/8+xT3zeop4Y88YDF3P7BMbRNBkJ1FI6egkp5Q2uQBpfLqpsUC8vrtKN14pSw==
X-Gm-Gg: ATEYQzxXDHu125UHcX4F/sJwVBweBBDbRxGHBd0dhqJUJ2QJHpCd93aDDbWYZKZST2l
	KhoaD/4HEpQIGCmLuqb6GKSdTzGxXfu8YJ4D+A0UtFO2uIuxd1rqV/gbiOoL8LeCaW/Ob01ry4W
	H984vZD2bPIlH/6p82x+USH3OPrKfmkxkgkDd+LZngLOxapkt1UbqDxfRQ/hkB/9PZO3H+XGvwg
	rU07mhTjht9jhcwHEJsjGDUqp/40rm4yXYFdgPQQH6NOL6XLMdL0KvxDxgUWszq+Mhr3lw8EH0w
	QIvpG7pG6fsZEJIIIPDle935SbddCbN0Kyg5tEk75z4OV5HlTVYFlsKyAO/29dsYvsj+jiCrEc/
	4PCrhBjOwWrQCxa6HHk9Gar2DsJX5WaIyL18ZRtNYa68Gki/bxr2vuRMgYw==
X-Received: by 2002:a17:902:e803:b0:2ae:5442:45cf with SMTP id d9443c01a7336-2ae82431065mr121349115ad.33.1773054812163;
        Mon, 09 Mar 2026 04:13:32 -0700 (PDT)
X-Received: by 2002:a17:902:e803:b0:2ae:5442:45cf with SMTP id d9443c01a7336-2ae82431065mr121348795ad.33.1773054811645;
        Mon, 09 Mar 2026 04:13:31 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840c9967sm145405925ad.90.2026.03.09.04.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:13:31 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/4] ASoC: qcom: sc8280xp: ASoC: qcom: sc8280xp: enhance machine driver for board-specific config
Date: Mon,  9 Mar 2026 16:43:00 +0530
Message-Id: <20260309111300.2484262-5-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260309111300.2484262-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260309111300.2484262-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: szgabdlotC-i7fk7sJckVllK9RWmwIXF
X-Proofpoint-GUID: szgabdlotC-i7fk7sJckVllK9RWmwIXF
X-Authority-Analysis: v=2.4 cv=OOQqHCaB c=1 sm=1 tr=0 ts=69aeab5d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=YQSOK7UB-Gan8rnKjwIA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwMyBTYWx0ZWRfXz1dHHdWu5CAx
 SiFwUgmt0/m8Zt6qY1edoFpVRd95cJQdOwmIX6DIRt0ZS1uTMBso5vys6uEynwVASlSGiW+UJsj
 CEfzsnHC8IFYnLtptl8eiingwsJ+jOhO0T2x1iWSjTf662Fdjgze3xMnWKSPARX500c1RVQdT31
 QZryyM2QWmkCTPTrz5nC3hiMzPcSkqbpzxj94/xgbhFHfPPhNtTaRQLyKXFRHEvi2fdRFMe9Xaa
 ENXKfS8fdspFGxzce7I0MGvrWhZvhd2/X2UqEd+WiC5wBViqRxJvHyLgCOP8LQo+jPJodiv+m11
 ET32iL3QdmehvDu19dz+s119SY8jBFAtadhiFTzR4trqY7z6IrmSTHZ1tqeLYPez6tCYBdDK2ma
 B542LqbDr2SaM6zTEWZ+KOi21IowLKk/ZgiG16bIsf0brC67Zi3f/ZamizIMzLGcSXS/ST45f3l
 QuoCqX9iSsyB8HxGiaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090103

The sc8280xp machine driver is currently written with a largely
SoC-centric view and assumes a uniform audio topology across all boards.
In practice, multiple products based on the same SoC use different board
designs and external audio components, which require board-specific
configuration to function correctly.

Several Qualcomm platforms like talos integrate third-party audio codecs
or use different external audio paths. These designs often require
additional configuration such as explicit MI2S MCLK settings for audio
to work.

This change enhances the sc8280xp machine driver to support board-specific
configuration such as allowing each board variant to provide its own DAPM
widgets and routes, reflecting the actual audio components and connectors
present and enabling MI2S MCLK programming for boards that use external
codecs requiring a stable master clock.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 180 ++++++++++++++++++++++++++++++++++----
 1 file changed, 162 insertions(+), 18 deletions(-)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 7925aa3f6..c2e9323df 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -12,17 +12,62 @@
 #include <sound/jack.h>
 #include <linux/input-event-codes.h>
 #include "qdsp6/q6afe.h"
+#include "qdsp6/q6apm.h"
+#include "qdsp6/q6prm.h"
 #include "common.h"
 #include "sdw.h"
 
+#define MCLK_FREQ		12288000
+#define MCLK_NATIVE_FREQ	11289600
+
+static struct snd_soc_dapm_widget sc8280xp_dapm_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+	SND_SOC_DAPM_MIC("Mic Jack", NULL),
+	SND_SOC_DAPM_SPK("DP0 Jack", NULL),
+	SND_SOC_DAPM_SPK("DP1 Jack", NULL),
+	SND_SOC_DAPM_SPK("DP2 Jack", NULL),
+	SND_SOC_DAPM_SPK("DP3 Jack", NULL),
+	SND_SOC_DAPM_SPK("DP4 Jack", NULL),
+	SND_SOC_DAPM_SPK("DP5 Jack", NULL),
+	SND_SOC_DAPM_SPK("DP6 Jack", NULL),
+	SND_SOC_DAPM_SPK("DP7 Jack", NULL),
+};
+
+struct snd_soc_common {
+	char *driver_name;
+	const struct snd_soc_dapm_widget *dapm_widgets;
+	int num_dapm_widgets;
+	const struct snd_soc_dapm_route *dapm_routes;
+	int num_dapm_routes;
+	bool mi2s_mclk_enable;
+};
+
 struct sc8280xp_snd_data {
 	bool stream_prepared[AFE_PORT_MAX];
 	struct snd_soc_card *card;
 	struct snd_soc_jack jack;
 	struct snd_soc_jack dp_jack[8];
+	struct snd_soc_common *snd_soc_common_priv;
 	bool jack_setup;
 };
 
+static inline int sc8280xp_get_mclk_feq(unsigned int rate)
+{
+	int freq = MCLK_FREQ;
+
+	switch (rate) {
+	case SNDRV_PCM_RATE_11025:
+	case SNDRV_PCM_RATE_44100:
+	case SNDRV_PCM_RATE_88200:
+		freq = MCLK_NATIVE_FREQ;
+		break;
+	default:
+		break;
+	}
+
+	return freq;
+}
+
 static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
@@ -32,10 +77,6 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 	int dp_pcm_id = 0;
 
 	switch (cpu_dai->id) {
-	case PRIMARY_MI2S_RX...QUATERNARY_MI2S_TX:
-	case QUINARY_MI2S_RX...QUINARY_MI2S_TX:
-		snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
-		break;
 	case WSA_CODEC_DMA_RX_0:
 	case WSA_CODEC_DMA_RX_1:
 		/*
@@ -96,6 +137,31 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 	return 0;
 }
 
+static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
+				  struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	int mclk_freq = sc8280xp_get_mclk_feq(params_rate(params));
+
+	switch (cpu_dai->id) {
+	case PRIMARY_MI2S_RX...QUATERNARY_MI2S_TX:
+	case QUINARY_MI2S_RX...QUINARY_MI2S_TX:
+		snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
+
+		if (data->snd_soc_common_priv->mi2s_mclk_enable)
+			snd_soc_dai_set_sysclk(cpu_dai,
+					       LPAIF_MI2S_MCLK, mclk_freq,
+					       SND_SOC_CLOCK_IN);
+		break;
+	default:
+		break;
+	};
+
+	return 0;
+}
+
 static int sc8280xp_snd_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
@@ -117,6 +183,7 @@ static int sc8280xp_snd_hw_free(struct snd_pcm_substream *substream)
 static const struct snd_soc_ops sc8280xp_be_ops = {
 	.startup = qcom_snd_sdw_startup,
 	.shutdown = qcom_snd_sdw_shutdown,
+	.hw_params = sc8280xp_snd_hw_params,
 	.hw_free = sc8280xp_snd_hw_free,
 	.prepare = sc8280xp_snd_prepare,
 };
@@ -145,37 +212,114 @@ static int sc8280xp_platform_probe(struct platform_device *pdev)
 	card = devm_kzalloc(dev, sizeof(*card), GFP_KERNEL);
 	if (!card)
 		return -ENOMEM;
-	card->owner = THIS_MODULE;
+
 	/* Allocate the private data */
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
+	data->snd_soc_common_priv = (struct snd_soc_common *)of_device_get_match_data(dev);
+	if (!data->snd_soc_common_priv)
+		return -ENOMEM;
+
+	card->owner = THIS_MODULE;
 	card->dev = dev;
 	dev_set_drvdata(dev, card);
 	snd_soc_card_set_drvdata(card, data);
+	card->dapm_widgets = data->snd_soc_common_priv->dapm_widgets;
+	card->num_dapm_widgets = data->snd_soc_common_priv->num_dapm_widgets;
+	card->dapm_routes = data->snd_soc_common_priv->dapm_routes;
+	card->num_dapm_routes = data->snd_soc_common_priv->num_dapm_routes;
+
 	ret = qcom_snd_parse_of(card);
 	if (ret)
 		return ret;
 
-	card->driver_name = of_device_get_match_data(dev);
+	card->driver_name = data->snd_soc_common_priv->driver_name;
 	sc8280xp_add_be_ops(card);
 	return devm_snd_soc_register_card(dev, card);
 }
 
+static struct snd_soc_common kaanapali_priv_data = {
+	.driver_name = "kaanapali",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+};
+
+static struct snd_soc_common qcs9100_priv_data = {
+	.driver_name = "sa8775p",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+};
+
+static struct snd_soc_common qcs615_priv_data = {
+	.driver_name = "qcs615",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.mi2s_mclk_enable = true,
+};
+
+static struct snd_soc_common qcm6490_priv_data = {
+	.driver_name = "qcm6490",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+};
+
+static struct snd_soc_common qcs6490_priv_data = {
+	.driver_name = "qcs6490",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+};
+
+static struct snd_soc_common qcs8275_priv_data = {
+	.driver_name = "qcs8300",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+};
+
+static struct snd_soc_common sc8280xp_priv_data = {
+	.driver_name = "sc8280xp",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+};
+
+static struct snd_soc_common sm8450_priv_data = {
+	.driver_name = "sm8450",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+};
+
+static struct snd_soc_common sm8550_priv_data = {
+	.driver_name = "sm8550",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+};
+
+static struct snd_soc_common sm8650_priv_data = {
+	.driver_name = "sm8650",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+};
+
+static struct snd_soc_common sm8750_priv_data = {
+	.driver_name = "sm8750",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+};
+
 static const struct of_device_id snd_sc8280xp_dt_match[] = {
-	{.compatible = "qcom,kaanapali-sndcard", "kaanapali"},
-	{.compatible = "qcom,qcm6490-idp-sndcard", "qcm6490"},
-	{.compatible = "qcom,qcs615-sndcard", "qcs615"},
-	{.compatible = "qcom,qcs6490-rb3gen2-sndcard", "qcs6490"},
-	{.compatible = "qcom,qcs8275-sndcard", "qcs8300"},
-	{.compatible = "qcom,qcs9075-sndcard", "sa8775p"},
-	{.compatible = "qcom,qcs9100-sndcard", "sa8775p"},
-	{.compatible = "qcom,sc8280xp-sndcard", "sc8280xp"},
-	{.compatible = "qcom,sm8450-sndcard", "sm8450"},
-	{.compatible = "qcom,sm8550-sndcard", "sm8550"},
-	{.compatible = "qcom,sm8650-sndcard", "sm8650"},
-	{.compatible = "qcom,sm8750-sndcard", "sm8750"},
+	{.compatible = "qcom,kaanapali-sndcard", .data = &kaanapali_priv_data},
+	{.compatible = "qcom,qcm6490-idp-sndcard", .data = &qcm6490_priv_data},
+	{.compatible = "qcom,qcs615-sndcard", .data = &qcs615_priv_data},
+	{.compatible = "qcom,qcs6490-rb3gen2-sndcard", .data = &qcs6490_priv_data},
+	{.compatible = "qcom,qcs8275-sndcard", .data = &qcs8275_priv_data},
+	{.compatible = "qcom,qcs9075-sndcard", .data = &qcs9100_priv_data},
+	{.compatible = "qcom,qcs9100-sndcard", .data = &qcs9100_priv_data},
+	{.compatible = "qcom,sc8280xp-sndcard", .data = &sc8280xp_priv_data},
+	{.compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data},
+	{.compatible = "qcom,sm8550-sndcard", .data = &sm8550_priv_data},
+	{.compatible = "qcom,sm8650-sndcard", .data = &sm8650_priv_data},
+	{.compatible = "qcom,sm8750-sndcard", .data = &sm8750_priv_data},
 	{}
 };
 
-- 
2.34.1

