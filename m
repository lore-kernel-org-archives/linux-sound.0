Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795418745;
	b=g9MBLfEihdyeUVFsPgriNP/4aI/6e0YwAhGKXePwFcG70fUpbubSGWF7IzbvKYjHjw9Q
	 tSFXCY+5Y4fXgQdHHA9obzeDECFwmosePrSsAjPyron0Q+DayH9QTT8zrM01pYlYpltgz
	 Z8upo/S+8gGrYhsdmxkC/z2Z32xSk764wna/6E0f+PRDevkRGuy0QcUwugdHYs37v4Kvb
	 KgFMzvrB6xCzfYIKbHEU4WIlFREo3BWwnjxaxIgk6t6IuX9XWlAwMfiouRr+7gR9l6cPb
	 o/LthjkLpf7gxJhomdQTToxqOflCl5YrGto3xL3dipFYDnpQtzxgw3FoFhBV9moHIzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795418745;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Reinject:X-QCInternal:X-QCInternal:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OyFTqOJB2iRnxWx+5n+T1BTlAJaThb5gzsT2IJLp3a4=;
	b=2alXInpDHs6NgQxrLWbjYAl6tEzAWRd98xjeYjB3CnV7FPqXSQxwcpFa1qswBYydlpmt
	 xgf8SIsb/gAvlnro9tg/WEjs9tMgAMqrn/H/1FjMS9dEHbaz1fG7qWNHJHQ5ht/kxancw
	 WHYJrwmCt6wVaEOq9DrxSdPQDIrxIwiRF1Zzjl77n6PCBg/A8ymR/ySvY81OOaZRKTIax
	 Erb8XgeJMhzLatyC8ny64omxGwZr1WBc7682DSB1IQqNYxnwO0MkxwBhu+gyN2ZBQ7CAX
	 0q0AYS5hOXiDjplEBxa+9iaTFsEq5NfzCOaoiwblOvxCXXBzs5X6psU1OdKL5rOHJmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Otjr2ij+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C695A606A32D;
	Mon, 23 Nov 2026 07:25:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C695A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Otjr2ij+
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN510NG1961029;
	Mon, 23 Nov 2026 07:25:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OyFTqOJB2iR
	nxWx+5n+T1BTlAJaThb5gzsT2IJLp3a4=; b=Otjr2ij+Gt4sdPZO2OKsknPiQCx
	HdSHQRhlYi6BJj7CNIfDMnBG8Ys4lPvSGf3WGw4dqRTgXFXyc43n6PiAeJfl0CB/
	vxs5+gnWKNHWQjauBe05p5IGw3JIbtc5xz1qmojdFX8EMYlWe+Rm6JHhet1MHwsd
	GGwSo2XFrro3Q+MKzqMBvYHOAc6QMXa3R5Q130tBzQjoP4VP2sHx/YC084VT58x5
	wPXW9Wn/45zLLzhpAhJh/Cx66Ad/4guNr9XmsWadEPEffVHNKuFrsj0YWu2bCLdD
	+Cd7aZcxPYSiX7u88tQwLWmdsnnDsDmpPNvYbskAQvlO8WmuP+IrJCB5rNQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32a6nrye-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 07:25:28 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN7PP8d1919474;
	Mon, 23 Nov 2026 07:25:25 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ks5-hyd.qualcomm.com [10.147.255.18])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6AN7PPUK1919450
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 07:25:25 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4763723)
	id 74CD6682; Mon, 23 Nov 2026 12:55:24 +0530 (+0530)
From: Karthik S <karthik.s@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Karthik S <karthik.s@oss.qualcomm.com>
Subject: [PATCH v1 1/2] ASoC: qcom: sc8280xp: Add support for lemans-draco-evk
Date: Mon, 23 Nov 2026 12:55:21 +0530
Message-Id: <20261123072522.2358819-2-karthik.s@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123072522.2358819-1-karthik.s@oss.qualcomm.com>
References: <20261123072522.2358819-1-karthik.s@oss.qualcomm.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: TCm4lGPlWATq-KYIhDYH5SvkQ08DiwkN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyOSBTYWx0ZWRfX8VHR01hqxhOj
 pmft2yTQ+C0cJ82aBuY9ncM9mZbS7BddLSo0Jvrn/6rOf4sq2EU5AjdXW/sIkGNkCg+CugQ24VX
 IzPftJS2nEF+Px+vfbexuq7xpD6TL8I=
X-Proofpoint-ORIG-GUID: TCm4lGPlWATq-KYIhDYH5SvkQ08DiwkN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyOSBTYWx0ZWRfX4gztjG600nKD
 zCzVHTB3NVKsYpxEQtG+MbdIg6cSlSFfrJJCCDaUBVFJP4CCIbOcQ+ID60SxS3wcxd9ZG4Xg7Ku
 K/e2hIHdp4T/emNWbW/jYf4vi+f+heg/mZVucaFJt6mXAWQhjn5YckPXNKR+OeisaAPfOUWiS+Y
 uvY/Z+nnEUm8DpKzfdU//yfWi6IF+eYXh9qlSapkrxzX1Dtqz48dYer9rHU27/Ycrsu9M8xqB/9
 kwSf88Il8biXGbHFRKXFvYNug3aGR/lTwqUgQId+3kJttnxXlMKAX4zzrtnCt128U1CasNKI4CD
 z/BiYjCCWUrDEhfb2b61+bQuFu/igvbXyw4wR2FMws62+G5DQxVPoBX+PQMEW99TXb+dQKK/6p3
 b4yBhtZb6lHTfUQ4rJtqXn/u7NKkD3bivbpiTJNADSdcpPinK2hRN/LLrr/QbkvHS7xPWbKcu/v
 5h03EMAqiYL4aiqyx1A==
X-Authority-Analysis: v=2.4 cv=UbHE26SN c=1 sm=1 tr=0 ts=6b03ea68 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=X8jTy9TBCMc15QLqjB4A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230029

Add routes and controls for max98091 and va_macro for playback
and capture. Add mclk enablement and codec dai format enablement
for playback support on lemans-draco-evk.

Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 38 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index e136407c56bf..2a542699a51b 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -44,18 +44,41 @@ static struct snd_soc_dapm_widget sc8280xp_dapm_widgets[] = {
 
 static const struct snd_kcontrol_new max98090_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headset Mic12"),
-	SOC_DAPM_PIN_SWITCH("Headphone"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic34"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic56"),
+	SOC_DAPM_PIN_SWITCH("Headphone"),
 	SOC_DAPM_PIN_SWITCH("Speaker"),
 	SOC_DAPM_PIN_SWITCH("Receiver"),
 	SOC_DAPM_PIN_SWITCH("Int Mic"),
 };
 
+static const struct snd_soc_dapm_route draco_lemans_dapm_routes[] = {
+	{"IN12", NULL, "Headset Mic12"},
+	{"Headset Mic12", NULL, "MICBIAS"},
+	{"IN34", NULL, "Headset Mic34"},
+	{"Headset Mic34", NULL, "MICBIAS"},
+	{"IN56", NULL, "Headset Mic56"},
+	{"Headset Mic56", NULL, "MICBIAS"},
+	{"Headphone", NULL, "HPL"},
+	{"Headphone", NULL, "HPR"},
+	{"Receiver", NULL, "RCVL"},
+	{"Receiver", NULL, "RCVR"},
+	{"Speaker", NULL, "SPKL"},
+	{"Speaker", NULL, "SPKR"},
+	{"VA DMIC0", NULL, "vdd-micb"},
+	{"VA DMIC1", NULL, "vdd-micb"},
+	{"VA DMIC2", NULL, "vdd-micb"},
+	{"VA DMIC3", NULL, "vdd-micb"},
+	{"VA DMIC4", NULL, "vdd-micb"},
+	{"VA DMIC5", NULL, "vdd-micb"},
+};
+
 static const struct snd_soc_dapm_widget max98090_dapm_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone Jack", NULL),
 	SND_SOC_DAPM_MIC("Mic Jack", NULL),
 	SND_SOC_DAPM_HP("Headphone", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic12", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic34", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic56", NULL),
 	SND_SOC_DAPM_MIC("Int Mic", NULL),
 	SND_SOC_DAPM_SPK("Receiver", NULL),
@@ -617,6 +640,18 @@ static const struct qcom_snd_soc_common qcs9100_priv_data = {
 	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
 };
 
+static const struct qcom_snd_soc_common draco_lemans_priv_data = {
+	.driver_name = "sa8775p",
+	.dapm_widgets = max98090_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(max98090_dapm_widgets),
+	.dapm_routes = draco_lemans_dapm_routes,
+	.num_dapm_routes = ARRAY_SIZE(draco_lemans_dapm_routes),
+	.controls = max98090_controls,
+	.num_controls = ARRAY_SIZE(max98090_controls),
+	.codec_dai_fmt = SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_BC_FC,
+	.codec_sysclk_set = true,
+};
+
 static const struct qcom_snd_soc_common qcs615_priv_data = {
 	.driver_name = "qcs615",
 	.dapm_widgets = sc8280xp_dapm_widgets,
@@ -743,6 +778,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{ .compatible = "thundercomm,qcs6490-rubikpi3-sndcard", .data = &rubikpi3_priv_data },
 	{ .compatible = "qcom,qcs8275-sndcard", .data = &qcs8275_priv_data },
 	{ .compatible = "qcom,qcs9075-sndcard", .data = &qcs9100_priv_data },
+	{ .compatible = "qcom,qcs9100-draco-sndcard", .data = &draco_lemans_priv_data },
 	{ .compatible = "qcom,qcs9100-sndcard", .data = &qcs9100_priv_data },
 	{ .compatible = "qcom,sc8280xp-sndcard", .data = &sc8280xp_priv_data },
 	{ .compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data },
-- 
2.34.1

