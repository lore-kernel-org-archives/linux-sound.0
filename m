Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB88133FE33
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 18:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771870090; cv=none; b=oHW4L6Wz/ZV5HJQam/69RwJRghSFTgXznVsJ0QC+heZBQP9C6Hh+E+MmeYuGOPCr4g4JnRNp+YegzaVt5KO+vUmImhkY8MaPlU6PgkqyDf0hBLPj6q4lNG4f7+LwHI2iPgmHn7cT98YXaf/PCfFLNh2XLvwYWNVHg14EOckP6CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771870090; c=relaxed/simple;
	bh=mDW997OLPhj9/cZiWF71LObptofAy2aHxMQZYNVrW5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oefRe37jLwUiDRHeflepvfMgbmm1HYYhmuQKcat3F8OPD7ZH52isS4jLSJmDWA1bEUphdD1JSmCSHLoW7uz0xCFRxOqr4ZvF/JdQ67gGPTf5rvsFMGUzjmjLN/bcqG96jfBLeJsxRsnMBcG40bGDJeCfRdckRjPffYJA+06JGSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L+hQOrXQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aLEI8HUL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L+hQOrXQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aLEI8HUL"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NGFJbE3936176
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 18:08:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TSmNTbeOuD+
	fL/CAookHlWTYOHGnEPMNf+RyYw4NXHs=; b=L+hQOrXQbXJniDzO4nBsFweSd3B
	olomAKEZwZKEIJsNpBTLPBoQdBs2Keg6WBe61e8MQrxQF9UmpBLNy09U/4XFW4AW
	+rdl3ycpSjAFWVH+mp7n+hzfYg8EZXgqut3zu9Oi3f42ElrZwM2AyhVGEXeB+nbY
	K6+Y03yuiZ6yR0BLbFX+n0B4Gbs8SsR0ng3hng9G9FHj1BpipH0vWyrq6SfERTAS
	GkXaXon/QUjXsmz8vFXSdwgqShvOB5rOSWs5IKOvLK8UNmGL3QsCz8YjlgpfzvDt
	Lg9Qk5aSbJ7hoX3Mm49+jSjIsRq69GDvw+hPRDtTEU39uGgsPr4coJxFrSQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgt8mgcj9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 18:08:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3a129cd2so5843943985a.0
        for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 10:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771870087; x=1772474887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TSmNTbeOuD+fL/CAookHlWTYOHGnEPMNf+RyYw4NXHs=;
        b=aLEI8HULI/gaz5RKeC7fKv3alYEmJ8Jp4TOGhgkMUqlLKEiNVJgSyxN6unILUXQfNt
         1sBr2+vyZnEvP/4JdaWTHuEHIc+uxM5zbRYycBZjMeeQUVt5tYVepIpNzJcEEAbyi1bN
         xPz4Sa6kEqHDdPJ/tupj6vLhpAYe8fhkdISVTz27E9QTsgb2gmxS/yGSFgYtIKRWyrjq
         3sCUkNzTtzLT0Yic/z6mYMpOfEiKmfBZcX1gc4S1VCozagQ0TXtnnU43NClImZgJ1QMX
         g1j913MxWKso/ewHeopJZO34ySxJFNh+Fi3YQaO9n1RfWaH6hu7aTTKgAxw2eBv+166h
         2Qtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771870087; x=1772474887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TSmNTbeOuD+fL/CAookHlWTYOHGnEPMNf+RyYw4NXHs=;
        b=VzGdQOlKwvgm+9mGPi0atQUb8KMx7Ma7fVe0Hc7NAKxeDI6u7CTCaEy61Ud4Gvv13n
         MODeFHcClTF9bBDOwQixjWKgoY4f/qxHcVwaS0IApoG18bsiaNtSKTA+jUMv7WwuXS65
         0VKDezjulsf2xNNfZhlZai8S/ENXMCyTscdFgbKoLy9VO+yu8F/kjR4S+ackHh7msZLY
         TgVqA/V9WfVDibFqUGErpI1t9mn8U7WfOOkK1KBdpWj0PfS72QMYHXQVEZql2xUbXD3O
         RE1h4/3BXXYNZDede+4NNIgCuIQZ+dLb2qAEUBv/t/rexe+1Gm+CPLAbdgla1Ljy4OPi
         Qt2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUwUu/B0DrVC9AELtpkvwdjR0v/sfRnV/F8CNfGSwhdT4mAMxWPC1hncsGqYtxS2sPVAF7bEie5tby1mw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIqgmx27TYYnXEVwney4ODZNJkB1n/W+0SGSlvtrUVNs/hau2x
	cm9DM7g8sR37Koz+B6Byaug71gUJK/FMvsGgGEJkCCdzRJxur5FMCU9dWzwqSC5JiT8PekTJkQL
	V4Q8d+V/QykZRYYWvbc5KOwr/IdKv0WU1JaBkj7pbkDzd6hD7ceN08e9ncZSrEzeUag==
X-Gm-Gg: AZuq6aJk2xvSgNenEkrfQF7nnlnmMjgfOgz7cNjC5S+a5st6Ga6RWZyXgSOwGOWqcL9
	ii5VHVRarwi8lWyKEZVdB7FbfZt+Xg9PlaTXbCDuoClyFFrkuX1cjFODdUmk843UqMM9fjYUkXf
	qLzI/I9E0eC23uraQ2gl2w1I2/gR1z4fbzx9pIX56wnUB59ixEnM7GDkKC9HizGOUkJQ2UpCJS8
	dbRwiFDcxqm/yPqWQ75v2A96zJKTQM7nu82oApQn9VBJlW7jTGxDc1gaDTyHNxRXeBPJGUNKH99
	r+8nhregwJS3WFvhn13k6+5K1rkr0vzvKwx5bZftCSusrMxWyuD1nfmfmU4Y3ZXukaQe694Wwvj
	Y7lC3Eufs8cYGhPRS2u3lw69pbkf/ahigFjWe5zx1w+0PP6IWQKqL3W4=
X-Received: by 2002:a05:620a:7084:b0:8cb:5c90:dd6f with SMTP id af79cd13be357-8cb7bfe78d2mr1905587685a.32.1771870087147;
        Mon, 23 Feb 2026 10:08:07 -0800 (PST)
X-Received: by 2002:a05:620a:7084:b0:8cb:5c90:dd6f with SMTP id af79cd13be357-8cb7bfe78d2mr1905581185a.32.1771870086629;
        Mon, 23 Feb 2026 10:08:06 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d401aasm20458574f8f.23.2026.02.23.10.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 10:08:06 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 10/14] ASoC: qcom: q6dsp: Add Senary MI2S audio interface support
Date: Mon, 23 Feb 2026 18:07:36 +0000
Message-ID: <20260223180740.444311-11-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223180740.444311-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260223180740.444311-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=J/unLQnS c=1 sm=1 tr=0 ts=699c9787 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=aBFzMgE2VLA-TvnT3JMA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 4zEAidALBltT9m4jlc9ZVm6x9tN9Fff-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE1NiBTYWx0ZWRfXy3S0qBLe/t0A
 v66iWq/LhBo0iLRNeSRItlzEOckKsCcyrLUmjdayMo7Ow0SWZPf9/prvKfBXmcKXa9rk0AaVxL+
 TF8d4DuLyYMLGo8huZ2ZX+ADNzeEy0eKIkgWvRmFXfHOCD7b99pBv75LWxWUR+IAjDNYfp6cxvS
 xtP0Zc2H+lPDDU55wBMQdw7UqD+52JP2++O6yk9bht4Laf+RmVy/4wQgfY5c9V8KEqWrhIlWPa+
 wwZmTvnw2Cveknx9CQpoxXoMwbKnH6CKth7cq1HNSP3QOKSQNkKoqo//SRnWPcnmuTJ8on0RBur
 OdSyXWzBMAoAFBHe3WSLYjQ93jcdroYkuKWs3uOGBcGVzpkR17JdZONJCa4doyBt6aFqoYHCCAQ
 juMRX76ZGQ7hgfxW6PnNDQXCwdgV6jWdtOyZMICznok+87HemGZG31zsmehEBj5H9rcDuj1b38c
 WfxsbVpBnAGNyJM1j7Q==
X-Proofpoint-GUID: 4zEAidALBltT9m4jlc9ZVm6x9tN9Fff-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230156

From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Introduces support for the Senary MI2S audio interface in the Qualcomm
q6dsp. Add new AFE port IDs for Senary MI2S RX and TX and include the
necessary mappings in the port configuration  to allow audio routing
over the Senary MI2S interface.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6afe-dai.c         |  6 +++++
 sound/soc/qcom/qdsp6/q6afe.c             |  6 +++++
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c | 29 ++++++++++++++++++++++++
 3 files changed, 41 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
index 0f47aadaabe1..a0d21034a626 100644
--- a/sound/soc/qcom/qdsp6/q6afe-dai.c
+++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
@@ -409,6 +409,7 @@ static int q6afe_dai_prepare(struct snd_pcm_substream *substream,
 		q6afe_slim_port_prepare(dai_data->port[dai->id],
 					&dai_data->port_config[dai->id].slim);
 		break;
+	case SENARY_MI2S_RX ... SENARY_MI2S_TX:
 	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 	case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
 		rc = q6afe_i2s_port_prepare(dai_data->port[dai->id],
@@ -540,6 +541,7 @@ static const struct snd_soc_dapm_route q6afe_dapm_routes[] = {
 	{"Tertiary MI2S Playback", NULL, "TERT_MI2S_RX"},
 	{"Quaternary MI2S Playback", NULL, "QUAT_MI2S_RX"},
 	{"Quinary MI2S Playback", NULL, "QUIN_MI2S_RX"},
+	{"Senary MI2S Playback", NULL, "SEN_MI2S_RX"},
 
 	{"Primary TDM0 Playback", NULL, "PRIMARY_TDM_RX_0"},
 	{"Primary TDM1 Playback", NULL, "PRIMARY_TDM_RX_1"},
@@ -636,6 +638,7 @@ static const struct snd_soc_dapm_route q6afe_dapm_routes[] = {
 	{"SEC_MI2S_TX", NULL, "Secondary MI2S Capture"},
 	{"QUAT_MI2S_TX", NULL, "Quaternary MI2S Capture"},
 	{"QUIN_MI2S_TX", NULL, "Quinary MI2S Capture"},
+	{"SEN_MI2S_TX", NULL, "Senary MI2S Capture"},
 
 	{"WSA_CODEC_DMA_RX_0 Playback", NULL, "WSA_CODEC_DMA_RX_0"},
 	{"WSA_CODEC_DMA_TX_0", NULL, "WSA_CODEC_DMA_TX_0 Capture"},
@@ -770,6 +773,8 @@ static const struct snd_soc_dapm_widget q6afe_dai_widgets[] = {
 	SND_SOC_DAPM_AIF_OUT("SLIMBUS_4_TX", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("SLIMBUS_5_TX", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("SLIMBUS_6_TX", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("SEN_MI2S_RX", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("SEN_MI2S_TX", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("QUIN_MI2S_RX", NULL,
 						0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("QUIN_MI2S_TX", NULL,
@@ -1037,6 +1042,7 @@ static void of_q6afe_parse_dai_data(struct device *dev,
 
 		switch (id) {
 		/* MI2S specific properties */
+		case SENARY_MI2S_RX ... SENARY_MI2S_TX:
 		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
 			priv = &data->priv[id];
diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index 76e14fc1b2b5..037a281d6f61 100644
--- a/sound/soc/qcom/qdsp6/q6afe.c
+++ b/sound/soc/qcom/qdsp6/q6afe.c
@@ -130,6 +130,8 @@
 #define AFE_PORT_ID_QUATERNARY_MI2S_TX      0x1007
 #define AFE_PORT_ID_QUINARY_MI2S_RX	    0x1016
 #define AFE_PORT_ID_QUINARY_MI2S_TX	    0x1017
+#define AFE_PORT_ID_SENARY_MI2S_RX          0x1018
+#define AFE_PORT_ID_SENARY_MI2S_TX          0x1019
 
 /* Start of the range of port IDs for TDM devices. */
 #define AFE_PORT_ID_TDM_PORT_RANGE_START	0x9000
@@ -718,6 +720,10 @@ static struct afe_port_map port_maps[AFE_PORT_MAX] = {
 				QUINARY_MI2S_RX, 1, 1},
 	[QUINARY_MI2S_TX] =   { AFE_PORT_ID_QUINARY_MI2S_TX,
 				QUINARY_MI2S_TX, 0, 1},
+	[SENARY_MI2S_RX]  =  { AFE_PORT_ID_SENARY_MI2S_RX,
+				SENARY_MI2S_RX, 1, 1},
+	[SENARY_MI2S_TX] =   { AFE_PORT_ID_SENARY_MI2S_TX,
+				SENARY_MI2S_TX, 0, 1},
 	[PRIMARY_TDM_RX_0] =  { AFE_PORT_ID_PRIMARY_TDM_RX,
 				PRIMARY_TDM_RX_0, 1, 1},
 	[PRIMARY_TDM_TX_0] =  { AFE_PORT_ID_PRIMARY_TDM_TX,
diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
index d31388ed3ccf..e5cd82f77b55 100644
--- a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
+++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
@@ -519,6 +519,34 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 		},
 		.id = QUINARY_MI2S_TX,
 		.name = "QUIN_MI2S_TX",
+	}, {
+		.playback = {
+			.stream_name = "Senary MI2S Playback",
+			.rates = SNDRV_PCM_RATE_8000_192000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
+			.channels_min = 1,
+			.channels_max = 8,
+			.rate_min =     8000,
+			.rate_max =     192000,
+		},
+		.id = SENARY_MI2S_RX,
+		.name = "SEN_MI2S_RX",
+	}, {
+		.capture = {
+			.stream_name = "Senary MI2S Capture",
+			.rates = SNDRV_PCM_RATE_8000_192000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
+			.channels_min = 1,
+			.channels_max = 8,
+			.rate_min =     8000,
+			.rate_max =     192000,
+		},
+		.id = SENARY_MI2S_TX,
+		.name = "SEN_MI2S_TX",
 	},
 	Q6AFE_MI2S_RX_DAI("LPI RX0", LPI_MI2S_RX_0),
 	Q6AFE_MI2S_RX_DAI("LPI RX1", LPI_MI2S_RX_1),
@@ -680,6 +708,7 @@ struct snd_soc_dai_driver *q6dsp_audio_ports_set_config(struct device *dev,
 		case SLIMBUS_0_RX ... SLIMBUS_6_TX:
 			q6dsp_audio_fe_dais[i].ops = cfg->q6slim_ops;
 			break;
+		case SENARY_MI2S_RX ... SENARY_MI2S_TX:
 		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
 		case LPI_MI2S_RX_0 ... LPI_MI2S_TX_4:
-- 
2.47.3

