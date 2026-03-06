Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8394224A05D
	for <linux-sound@vger.kernel.org>; Fri,  6 Mar 2026 12:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772799739; cv=none; b=fM4BTcKxUDiFGp2YKd9s9wI4rUVJBVKXqEacl909xkWcNH6gL4XQTpG3eqD71Rksg2pUzNoHVTiorw3PS6o5whEK3xBEii/gwThyg1TxZGdtCv4Jsebit4VoNlc3d7c59hohPulJ9DtbKpmDr9+efOfXgoOKv0qNbJf40i7NMNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772799739; c=relaxed/simple;
	bh=nhF962DJ35ZnGtg1Nyn29ALPxXwZIXyRUxas4dLT8SI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dvJNdTeJ26MSq/LDghh6Urli1Tt6tFKV3JPIdFsEOcx9AjvYjgRlwEvhuVldROtHmblj5nc+pYrgvFK4Bfio7o/lcW3WG8grRVjlBgGWWEv7gqTK6QDIu0QdP81cNwWNnpAPdeXD2xO0xqQKita9J+BQynk2Jj0YUT4eAyQO7Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SYG7LYwT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VsKCvxV4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SYG7LYwT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VsKCvxV4"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626BbKmH2022812
	for <linux-sound@vger.kernel.org>; Fri, 6 Mar 2026 12:22:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZsyVHtwoLDk
	/xLA/rwLKIW8JVwySpk++YyIKH0BTOlA=; b=SYG7LYwTvMNeKedfmhhi/4278Kw
	8g0kBwcfjG0Po7YrhUI0RSSRxH5ZnzIOaNQb4IEAOjn96mt40Xg9dTLLNNqhdcc9
	K9rQKdCIkGAALXfjHtgDWE6m2NEeDroBpUj32icU13HLb1muCtBMTmUtqc1J2NNQ
	2MP9tLby/heIeSdDGT12JY7RhISpDvOgXrHQim4v6HdjXbY34QsZMC6U246srnBw
	CGeQ3K3jOyu25me26N5n8aYJvKu3Hc15zQeZ9fKkbgF8SM0mCus7jLXLyI0vl9a/
	S8xz4g9eq3g5VVYTmCtp/C20lHi9uvgx+HTJljgRxZt3skawNt/4YIfcuug==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqfg6b3m1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 06 Mar 2026 12:22:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb52a9c0eeso6768286285a.2
        for <linux-sound@vger.kernel.org>; Fri, 06 Mar 2026 04:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772799731; x=1773404531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZsyVHtwoLDk/xLA/rwLKIW8JVwySpk++YyIKH0BTOlA=;
        b=VsKCvxV41uz+zHO17861Hijcnz0Ufcp7peFwN0UOSFJlvpQpvgtnWZkh1VToSAi82o
         iC9uMR3C0IiqM+2Uqge7kY4uz9QHZVS1b2iautulEXWuHyZWhcDosPkYS+qHa04XOGsc
         kQZxwKFluVVtfyczaZHZoaoU1AfAwqmswFbounQ18ARFfS6E0z7X2/vLVODhd2FeOzxx
         GgIDLl/1X6lB6TEtTS8T6OdDj448VaitovO6iRXPZAq51QCKaPPZLMwTTo9terZ+zgKh
         jA0DxGUbasN3h6lfL2qgg58Ba6TMGp+5rRPSyjH41exqf8/pSdNklC2RzWxPr1IEjMhF
         HVug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772799731; x=1773404531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZsyVHtwoLDk/xLA/rwLKIW8JVwySpk++YyIKH0BTOlA=;
        b=qfXm6EDKJ+XDe9UDgA63T3GnOBK6IRE8q8dYkgNYeW0uoOSwMdhQANs27hGwLkMGoN
         zPNCWiVSmoamshcLuBUJxFps/JbiAWWtE0gXmzjzOuw9NE5MLtVgECOOqbRC5UNlF4ag
         J1CLBoueVDc6M+z8dlI970x5QJi5iARoK4xD//mnv2FUXj2SCaHY67DzXSVbkMWAXt1R
         1dZfD3MRvWeDCRneq3S6iTuYAKBXPtV1j9k/2j55jwWwPEyq1nt04n7qmoTLIyQsKuIN
         M6YsV2Zl2SpMM3ohEVLgZuCoZxaffzYT52+0k8AtrA9IyP75vRWgJ16ynLOPu3plJ3oV
         sPGA==
X-Forwarded-Encrypted: i=1; AJvYcCXc1UM5BuORfoqmZ3pXc5gKcnUNt/fspgGBcbiMoBQWTFzdlm2o4UmzvC8LAy5TqB5ezPSUEiZFtp/D3A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw/ezJT3Cc5EGc1UUrjyX17/bTFmJsnLrJ+ITguCw8QfyimEA9
	8u57ws40PV0VSeEDjBSeMPAkk+c2HB7UlWy1bX3cM/qUN2P+mKAP4SdTHCtmjZx0ae111qZaJ4u
	+CmSQV6XobTZqzV3dVRzQ3klwc07LX1AhPcn8sGuOlt3orH3iycTiQq6uZ4KQ4jduYg==
X-Gm-Gg: ATEYQzxxuRCJUbRKDMZl3uLbdH2DCqbD7mzdSvEVLbUbmDHbLxjoGI1yTOEncL5lANo
	rk6HqJg8wbPUSI995Rx46fvCXonyHfCgnoSefZ8qpxoIyuuAPcdEM4bRn3xS7L2OHc9VDGQtPJ5
	y9D1SVddo+MBqEdJAb1t1n7a/mF/qPGBxEOOZ61naZMatjLp4ul0jOH7hT3DUCMhKT1DmAsUdus
	KIZSSPTZx5Dul3W+y81hwcljJ+XTY/fgcBIdATlEle7aUtWmhsItftWcVgzo5764eME94q1cYgv
	BjfuC17NRMlddBo27GHQfnNKnhLbVLV0a3uu87eNTL/B1DN1hZhyuOcXNBEpEjFhC8NT4njEVI5
	3143iQzVDoP8KpRRLG6N/ReMabYjOBHJ3JKTksMuxv1V0Q+KV4dN0CJY=
X-Received: by 2002:a05:620a:4093:b0:8cb:3505:443c with SMTP id af79cd13be357-8cd6d4b4e32mr241283985a.44.1772799730538;
        Fri, 06 Mar 2026 04:22:10 -0800 (PST)
X-Received: by 2002:a05:620a:4093:b0:8cb:3505:443c with SMTP id af79cd13be357-8cd6d4b4e32mr241280085a.44.1772799730112;
        Fri, 06 Mar 2026 04:22:10 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fa87e56sm111972395e9.0.2026.03.06.04.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 04:22:09 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 08/13] ASoC: qcom: q6dsp: Add Senary MI2S audio interface support
Date: Fri,  6 Mar 2026 12:21:10 +0000
Message-ID: <20260306122115.509705-9-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260306122115.509705-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260306122115.509705-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: w-tL_5-KX7MUkBsYTvR1NB4I1Oy21UUQ
X-Proofpoint-ORIG-GUID: w-tL_5-KX7MUkBsYTvR1NB4I1Oy21UUQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDExNyBTYWx0ZWRfXz0KXhfi0HHRi
 3xMWomROUxLsfA8mgXmvAnY3zveg3HNGDy6cS14lkSV2XuuTNvQ1t4dAX9MFOec+f7+P6JujFyI
 Hn+xWyvCE4xZeURbiz7zfJBKgERmDLS5/qvH48KvQn/KVuBrwf4mOZXPqq2EDJX7CBRmnSncQM1
 tFSkE0TgZJL5VtjdF0rdOlGD2EFcz6CpxDSCMMpyix6SqZqc4o2/L+YU9B9bwHmMlZJ8+AokvSK
 /9Y1O2h7ZOwHbUCmecwnZqgaZg6GhRLIeRAQ0ydtuxc06j9xOflPmrbyAnNJkn8QHdMRcTzyCtc
 +pSQq6ym4i5+t3m7yifEVIqDLdbvvvS7PNXtCcxs6HMf9KBl8bSh1xr4s+FbKqW87kXEU37gtUg
 jHZkG+iL7hQTg3m8scgF16PDWjHf5Tx54KMd9BvqASGkmbJZWCYDKxYsm2lrrKLZAq0GcWk/4j5
 YLEWex63OrWUkQcg5rA==
X-Authority-Analysis: v=2.4 cv=XKg9iAhE c=1 sm=1 tr=0 ts=69aac6f3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=aBFzMgE2VLA-TvnT3JMA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060117

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
index 43d877322bae..7bd40e32f758 100644
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

