Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4499383C93
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 22:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774305554; cv=none; b=mCN6o7h6Ixd33VinaB8tdtxa5TX8lQ7uYmwSXtuITbZd1RuWJbLj+L19DHQjMJBCH0YbO31JuS0RaA7VctO2oERtKnuvUAmzW95KwU2PpE1p1tB9Iox+x9oCpGI/wgAqfZ7OGSSfY/Cc3UcX3NURjk3hWujrPpl5m1Wpf8H7RlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774305554; c=relaxed/simple;
	bh=DWuvTD8Cw0DUhqpHbWAOgp0+9q9ilBF02Exs71eghWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BaVtnTQ791fI9AwbNAOnsfnX2N5GSDycPn9TXZyivR6HmDED9F1ot+0PSsHp+bOXfZ4gBB1j2cQX3ch0DrgRoVQs8zR08uiLrwQ+QtQs5SX8RqJKb0S8v1TLSp2qLnOsbcflSoCFwaTaewNjd7p6Gc3jeu5CpQQ2RdGaWvVDO2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pHJr0Beu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B9asEZTi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pHJr0Beu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B9asEZTi"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqk6i1762295
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 22:39:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VHHn5cWjpEy
	VxsTN9vGBX+/Npp0nx1w8ZRbazvG1gDU=; b=pHJr0BeuPYXMRg9lnFuQiAUL16f
	gfKlO35Jj6uKbRuil5/siv1mUc2UFGDvpULfouRDvzVfAeHfMGaF42+FZRSF6ZDk
	qbHG2rXKNhKfAaiHNgSjXoL5eJt9A7OdfHs5A8i58VR7yhV5MZsKIuRUsWyyGOK6
	7EHGSsQQtIkzI7PtWWJpYT9ja3b7Ar01KCREbAqIEfk5TivtXKK2VjT3z49QZDhK
	1qurH4PrKrqpddgq5S9V3stDbEctIprnGrSkgYqrOae/QAWBdlmLkuRLzfYTpWk7
	0w4O5H0L7LiU7rvQh9HSwuGllneVYoL8rgkePnIqIUQjsMbStSyMnxjtJ0A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d36f09sgk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 22:39:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5093a985e21so358280221cf.3
        for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 15:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774305550; x=1774910350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VHHn5cWjpEyVxsTN9vGBX+/Npp0nx1w8ZRbazvG1gDU=;
        b=B9asEZTiwgOxkTFSnqAlxLluwPhtr6CUSUptHS5X9B7HoFvLpj3pa0CmG8bh1xMOPw
         erbJwH4DuT1oqQxY5UHiR4PVw80nk5MFean0HAhecT3wq7NWTmTrUONGM5D5TuS9DcFM
         E4ZJ2VgD3I6yc3lnoYmgC38FQQClZdm6xjDsZvxmlpVYF7NfFoQX7DJ8bU0I/MCxNPrx
         wPNQsERkG1nm4jaoZq+Bs7u8U+x4rw31nICcyRRWYFX9nRhCKLw4zggedhlMkQjGLb+o
         S1udlYxDJ7tu7AAXpJTZw6bX4YAvEo9v+Zj+P7Y7IfYpFEPXBAQlAv/5B/EJF5O3CDHO
         VYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774305550; x=1774910350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VHHn5cWjpEyVxsTN9vGBX+/Npp0nx1w8ZRbazvG1gDU=;
        b=sb6Ul0LQFUOVLJNeApyRDVOsSuAlRqwF3tyK2Bp7tMD9Olz7OvZryFqR0XNIBesVEj
         7yN4bRrqQKV4nknO8c8muGFCZgMl9kFuTwi1dFxDiS0YctwsWqVUAAAjiM9j3d2iWRj9
         69/PBBfg1ZEkBqJySWOK7LDDmYMc/FmEmY2tykTY3il6BXJn/eBisptooQsOpTM6lXeM
         I4kGYB4bcM4viK+wXoTr2gdS6tT2JgA5MNPvYEkc3wbLe7auUU5JdxBQ72I8KirkYEqH
         eT/0Uf9dJ48plNVKXAj3fEjWjL9gTTwCoxDqH45Ingop4x4BaBpI7aJoMYXIKTamBcX1
         Y3cQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEe0IFz3HqAHQEINZwIB9hwwOpkVnLzlu6AnLZzk4L2STzvyYg97UUiWA+I5BYwh+Y/OD7M1ptnGKXLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ1g6jP2MavLp0ARXuGacqQ543vaY9iBeFfEOOYRcwkML0PKWt
	cqj6CfapRdx3VgStEUQyqiOQ1dKv6fWMdwb7jTV+teChSBKlkV1aw6lBdgOWs+9EUQ2bhoAJ2dC
	BPV1RoAADbsOluDM+OjcYr2pNBNHSOhtleuSYA9ob3kFrYVm8YVzeJgcKc0z8zoKBPQ==
X-Gm-Gg: ATEYQzxqFy+fugHQo0K6lDVNO9UJsVFWG+bOAQJ1nkT3y6yVTHT8bML4wBOe6cjIITW
	PXJlJnE9lTq7rNSPJnUtqTwF3dKc1WvOtLcYEe1XQGdCfRVDfHay7KAFvn1UPLKcNU2JcvD90Qp
	dj6swwl2HZjgZQ9BPQTcVD7RRp67Fv3fe7BjO9aDFWLPpFyeHE76CYRxNC1fc88kUN3bQpbXtzu
	pgaE5+VOJj2Z+byZ9qafl4WVl/1CY2Iw4LivGVBuST9FBJUdkySpC9nd99/gv0yXyy4Z9UQq9u0
	eS9RGTybGpRu1E6Zd+QM8krGH35onIitjJWfUpNbmSlrGn9qeI0dVkInMeTuV7md5fjCTVOxaA8
	3+WDQd522JkTqROTvEgkJVE6JOaYlajXsf5BplGPduT9TUK063uNVviE=
X-Received: by 2002:a05:622a:1f8a:b0:50b:534f:4292 with SMTP id d75a77b69052e-50b534f4a60mr103772741cf.35.1774305550111;
        Mon, 23 Mar 2026 15:39:10 -0700 (PDT)
X-Received: by 2002:a05:622a:1f8a:b0:50b:534f:4292 with SMTP id d75a77b69052e-50b534f4a60mr103772411cf.35.1774305549649;
        Mon, 23 Mar 2026 15:39:09 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64715539sm33320351f8f.33.2026.03.23.15.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 15:39:09 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v7 08/13] ASoC: qcom: q6dsp: Add Senary MI2S audio interface support
Date: Mon, 23 Mar 2026 22:38:40 +0000
Message-ID: <20260323223845.2126142-9-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=b+q/I9Gx c=1 sm=1 tr=0 ts=69c1c10e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=yvctMs8w4tAFySAdhFMA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 7QAPnD5kiX29FtYUvx4XGEsBCnEx9C_a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE2NyBTYWx0ZWRfX3wsZjNiyPi6j
 3EVgCGsUbN5iVaBQMISGF1zkkbUeukNciw3neKxCP5rRe/QUDgqbrhtg68KhFouv4ut/A/DAYob
 dzYMKfN00xCFXX5x4C9YpHcBrivlmZAmoR/8KenciwIfAxQPAOJhmKMKGhNrcVwD9xXeTcmIPXA
 /ynLs8u0Db8o36v/5uRkrwB8UfOLuUPSt21UalaMAKVJPc70LodnaGH5AF6C4U/e8shRsxzvCb4
 /IawYVHKVZK9+2puGl4qIgK5dr26UO2dMRWZ3zicKqJhC4WCN9HRwzw94Q2JX9qjWUB4qpriIjk
 RDHYD6Zc0akt5POLBYK04GsWewV8kIzB1Xt3hMboL0MUtrCa+s8joliWleJrR0cZ8AqMZKBheC4
 I3XV0ZMK2At4MdudtWQGRW0+dMr2Z+bWI6U9nAE0g2XdUpktkgGcGqTADE7NPdr6De8kaYGhZ+y
 QrZG6P86lo8pMDMGbrQ==
X-Proofpoint-GUID: 7QAPnD5kiX29FtYUvx4XGEsBCnEx9C_a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230167

From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Introduces support for the Senary MI2S audio interface in the Qualcomm
q6dsp. Add new AFE port IDs for Senary MI2S RX and TX and include the
necessary mappings in the port configuration  to allow audio routing
over the Senary MI2S interface.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Tested-by: Val Packett <val@packett.cool> # sm7325-motorola-dubai
---
 sound/soc/qcom/qdsp6/q6afe-dai.c         |  6 +++++
 sound/soc/qcom/qdsp6/q6afe.c             |  8 +++++++
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c | 29 ++++++++++++++++++++++++
 3 files changed, 43 insertions(+)

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
index 43d877322bae..40237267fda0 100644
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
@@ -1777,6 +1783,8 @@ struct q6afe_port *q6afe_port_get_from_id(struct device *dev, int id)
 	case AFE_PORT_ID_QUATERNARY_MI2S_TX:
 	case AFE_PORT_ID_QUINARY_MI2S_RX:
 	case AFE_PORT_ID_QUINARY_MI2S_TX:
+	case AFE_PORT_ID_SENARY_MI2S_RX:
+	case AFE_PORT_ID_SENARY_MI2S_TX:
 		cfg_type = AFE_PARAM_ID_I2S_CONFIG;
 		break;
 	case AFE_PORT_ID_PRIMARY_TDM_RX ... AFE_PORT_ID_QUINARY_TDM_TX_7:
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

