Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795419322;
	b=YcnXl9SXTyAwtb4F5Zgt0NXRTeeInegiwUC5I9JfXpxV0kEfavrwaHeBfjMm7KluI0iH
	 8mCVLb+kaztgN7OlJl32waxX+CxfkYU0lKjoVEgUmXK75a2MLRDFLr1S2iF76u+ag1ntB
	 9xMD3d8XsNxqtmBhL6MVMLR4+z2YIJkQvNOYcaQa3YZ8PD/5EvmnYzoc6xXXG9QNjIs/1
	 hZgYdOAzeGuxPkNIjKB6rmtb+1vkjkLnZ6mqHaQz31b9laUHbTufWdRIddulTq1mXtHGZ
	 sK+XJo2eRONIMGWxExQcc0zqe8oPoKdA77hahK3kU3S+KV9lH1WHF2BQSUD8t78CIgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795419322;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Reinject:X-QCInternal:X-QCInternal:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jZrpa43n3VLPqbMJqtrElNjhsPZTUj63X6oMLNFJhX0=;
	b=bvuOFLV0GqvVDM7XWba5hmVDK15JRKzHtaDX3jVuoT0xVs24C74pAFQZEVSUHMZTgyx/
	 fzALsTars9WuILA4+d/ViWFaH11u0W10zkPO2qczq/MwsYPNtGIbtqHDoBUF22ZeQ8CV2
	 aSAQcQNl3flAvkpEtrzZCHJazhNCkXkry5eHlNKPaalb50SpMq4EALfAdtcURyaJZ7kqo
	 DMJwssl9cGDa2UNarLph6KHgtiJHPG1AUsG8kdygaSuomev/0k9teAXiNk+c/pOYw9Xvz
	 hJddYU0/DU9EADa4XRhITvIrpRiZKzV8FLQ+tLFjRaiRGWphCTXNmR/6z8kMym+pRnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JggkpNwG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6010D606A321;
	Mon, 23 Nov 2026 07:35:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6010D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JggkpNwG
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN6832S1126608;
	Mon, 23 Nov 2026 07:35:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jZrpa43n3VL
	PqbMJqtrElNjhsPZTUj63X6oMLNFJhX0=; b=JggkpNwGv6zadLW5BEX3IW/KOBD
	nGitF/xcMVCMkeUcivikE682//7n0hMrxVx8loTm0U9HwebGBpHDd/m5jk0AwUnq
	YJFWgV44qwelkGjW54INDqAA+pj+K+suVH7IoEAIdxzuyI3zuInF3yShVfc/YZBp
	AdqxoZ0ionOI1b2ADFgLfOVckC6U8uOfIzygB/pz1AR+9G0A8Y/ZoRg2AltR5vZi
	4TcOQ1WFJuWVcGUVdtdxnoJgGBNPA96fZ7tsfV0NH+xxS2DR/8s0pT87/nRmz7y+
	qrQD/m/Ut+vzIvTGto45pVIYGX7Jae9lYV7Vek1EnTpktt3uzF+eLK29OoA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fy009p5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 07:35:05 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN7WYor1929369;
	Mon, 23 Nov 2026 07:35:02 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ks5-hyd.qualcomm.com [10.147.255.18])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6AN7Z2LA1934151
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 07:35:02 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4763723)
	id 44A8A682; Mon, 23 Nov 2026 13:05:01 +0530 (+0530)
From: Karthik S <karthik.s@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, Karthik S <karthik.s@oss.qualcomm.com>
Subject: [PATCH v1 1/2] ASoC: qcom: sc8280xp: add support for monaco-draco
Date: Mon, 23 Nov 2026 13:04:58 +0530
Message-Id: <20261123073459.2361169-2-karthik.s@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123073459.2361169-1-karthik.s@oss.qualcomm.com>
References: <20261123073459.2361169-1-karthik.s@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyOSBTYWx0ZWRfX3usRI7lYh5IG
 q9BW6EJuS6afY9GZ5jMbhrfm2fyVK5DTF3KB/aT5T5Do4JYLxk06UmFGFYBxC1RAWP/Qf1tmW17
 aAb0DpJASUzAg2EcRBXtJeMcolCDbhQ5vmyxIRrcB/3dCiwRassNQNVq/ZKB8Vwr7KW+RPxUw3Q
 SaNGNyXEYN115Eh9qGN0P7Mcc0fgrCgnkTTxXg2rjjq3Hk+/p3y3HEyeFK/o0Xv3exrLDwnuHFU
 YAurFQMaL8lE4VvBFEL8Hw+L7u6PGud4lhhYhPzsV7j4IEDee4xzJW96eLPeKDeEmJsnuPoNFNZ
 QRNl+0VeSGjxsRKzaIdB8dZyT2bTlrKpg4v1FSmQjQiP5vEE2XZAXQvt+i+JE1zfcKKjANt0BRn
 yCOA1+GUbZfej702/D4DPTv2e9wlIPVnSu4/mO2sES2eDErqe85oURbIv40u85rBlVe5K8bPrV1
 0SXgZL/Wa5O/h70kCdQ==
X-Proofpoint-ORIG-GUID: k90H7zOkAaU58tkzmmwhXn8s-YlUBrRw
X-Authority-Analysis: v=2.4 cv=QrXLTlyd c=1 sm=1 tr=0 ts=6b03eca9 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=5wlQ8WN9U6JOc18lOXEA:9
X-Proofpoint-GUID: k90H7zOkAaU58tkzmmwhXn8s-YlUBrRw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyOSBTYWx0ZWRfXzfSl2HSsgeby
 hmaol3rZPvt1PsRgg0zpq++xr3uOjsd+6LUmfkx9PSBUiEO4qzoN2zDvQm9aHoohc/fucWg0Yk3
 oyIHyQ8ss7aTLn2mBfspaeHH2X2J5aI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230029

add machine driver support for monaco-draco platform
which includes routes for playback and capture over
max98091 and capture over va_macro Codec DMA.

Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 38 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index e136407c56bf..2b1804f3870c 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -44,8 +44,9 @@ static struct snd_soc_dapm_widget sc8280xp_dapm_widgets[] = {
 
 static const struct snd_kcontrol_new max98090_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headset Mic12"),
-	SOC_DAPM_PIN_SWITCH("Headphone"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic34"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic56"),
+	SOC_DAPM_PIN_SWITCH("Headphone"),
 	SOC_DAPM_PIN_SWITCH("Speaker"),
 	SOC_DAPM_PIN_SWITCH("Receiver"),
 	SOC_DAPM_PIN_SWITCH("Int Mic"),
@@ -56,12 +57,34 @@ static const struct snd_soc_dapm_widget max98090_dapm_widgets[] = {
 	SND_SOC_DAPM_MIC("Mic Jack", NULL),
 	SND_SOC_DAPM_HP("Headphone", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic12", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic34", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic56", NULL),
 	SND_SOC_DAPM_MIC("Int Mic", NULL),
 	SND_SOC_DAPM_SPK("Receiver", NULL),
 	SND_SOC_DAPM_SPK("Speaker", NULL),
 };
 
+static const struct snd_soc_dapm_route draco_monaco_dapm_routes[] = {
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
 enum sc8280xp_jack_setup {
 	SC8280XP_JACK_SETUP_NONE,
 	SC8280XP_JACK_SETUP_CODEC,
@@ -617,6 +640,18 @@ static const struct qcom_snd_soc_common qcs9100_priv_data = {
 	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
 };
 
+static const struct qcom_snd_soc_common draco_monaco_priv_data = {
+	.driver_name = "qcs8300",
+	.dapm_widgets = max98090_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(max98090_dapm_widgets),
+	.dapm_routes = draco_monaco_dapm_routes,
+	.num_dapm_routes = ARRAY_SIZE(draco_monaco_dapm_routes),
+	.controls = max98090_controls,
+	.num_controls = ARRAY_SIZE(max98090_controls),
+	.codec_dai_fmt = SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_BC_FC,
+	.codec_sysclk_set = true,
+};
+
 static const struct qcom_snd_soc_common qcs615_priv_data = {
 	.driver_name = "qcs615",
 	.dapm_widgets = sc8280xp_dapm_widgets,
@@ -742,6 +777,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{ .compatible = "qcom,qcs6490-rb3gen2-sndcard", .data = &qcs6490_priv_data },
 	{ .compatible = "thundercomm,qcs6490-rubikpi3-sndcard", .data = &rubikpi3_priv_data },
 	{ .compatible = "qcom,qcs8275-sndcard", .data = &qcs8275_priv_data },
+	{ .compatible = "qcom,qcs8300-draco-sndcard", .data = &draco_monaco_priv_data },
 	{ .compatible = "qcom,qcs9075-sndcard", .data = &qcs9100_priv_data },
 	{ .compatible = "qcom,qcs9100-sndcard", .data = &qcs9100_priv_data },
 	{ .compatible = "qcom,sc8280xp-sndcard", .data = &sc8280xp_priv_data },
-- 
2.34.1

