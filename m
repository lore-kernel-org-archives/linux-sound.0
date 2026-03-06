Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0D6391822
	for <linux-sound@vger.kernel.org>; Fri,  6 Mar 2026 12:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772799737; cv=none; b=q3ghl5zTpHClOZkpsaBV33fnRIvCcvg33qQZrrxEghvBWRnF7wAoSG4FHCLiuYbVmIqDVb5dl1mHIDsFVVdJHJA6w+OVOk/Jd21AMIlJdvhsM2PKKqt0o/Em1SZrGgR8KQybEgfV30et/pasiNqPYwEF7UJ7/Lg4Icgtnun1qIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772799737; c=relaxed/simple;
	bh=1AGWMMo+ZQ2MpMqgndQclqL9hoOIddPn00jRigW1KUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E2wOkzN+5VUe7VorjW2vbB0X7tgw8d3TymMj0RTxvVDZgp33zcEafZgCLEcwU73lHkvfsEcO1HgqZPbJj9Bf4Lm7IPxkPo2r37yO6LX+S+uPGOV4xfHPcnANFLC3hhCXvVvnZQxDA9N0qpq8WRsns+Qy8eBhNEjjNPGau9IJv24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZivXB+9s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aoPKQgjw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZivXB+9s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aoPKQgjw"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626BamMR3406146
	for <linux-sound@vger.kernel.org>; Fri, 6 Mar 2026 12:22:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2UA23pg+dGV
	Ambwz2ppXfyVdk6xlbVmq70z85L7JFXQ=; b=ZivXB+9sdb9jEnHianVoztRnL6C
	9BzXQPCnKFSF1TxmV+2qMxT42/p0f0DYYF9UyOkdlA4ekBbXM/RTRrFWc1cjq7B6
	NlPhpIgUf8b9E9d6lwriGDcB7K0H+lQWuCfteWePXNdFafxCgMGLaEMdAoDXtYLZ
	SPdaB2R3lyNy5lF4LMoNY5J1Trn709CxentL4JCpSSuFnZIeeyqjxRLAhsWlYkZ7
	Kl+274Jh2YvyIV7eBdVVgJmcb2Tum0ap/4xmd6ez5eXQXZrJCmKSfeXexisfzyGN
	eTPjBS/kxYMEsxxqc4+8JScgFWcdaeoz7RFhYsF6eRwxPjswfgdnXsIczKg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv9u8gpv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 06 Mar 2026 12:22:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb4e37a796so5085095085a.2
        for <linux-sound@vger.kernel.org>; Fri, 06 Mar 2026 04:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772799729; x=1773404529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2UA23pg+dGVAmbwz2ppXfyVdk6xlbVmq70z85L7JFXQ=;
        b=aoPKQgjwYtsn+EF3bdo8MKnFIBNalPawAFrnnoWTiBfVMRnjTSn9ysA1zixd00aF/r
         DBOEp7a/yV1fyOLbFVsJTVhP05y1cHfVvsNY7V7Crb690uI67Xox/ZEJwGqh/RefulLp
         8bIMdzxEJQNSpJ1QMMVbae7P8lp+Lota5U0kx++bAylEcIcv7ijujylvfn3Sm6rpquLd
         TZEGn2Gom45fCmDaBbY6SsX+B/u/AgNsGehOkXWBWxyYzVBpY6wuVReVztpQVOhFE4M0
         tT6N3wTFd3hBOF+6Mu5T+I6LqPU2nc+Fef5ahoefF5XXExcFc1pmRTd/GahBHeMRPjB8
         IDaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772799729; x=1773404529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2UA23pg+dGVAmbwz2ppXfyVdk6xlbVmq70z85L7JFXQ=;
        b=mNxSyabNOLewIpIS2ZCGe/tCyzDPfH5q3TZjyReleEAP44Y7iKTrdcsZjSrf/LfTOJ
         UaIU6+2ZrB4g1hb+iRQqI6kWA3O3jF8N4IWBw5MHUCQxB9P70K2EHNe5wlVzWBezw3jG
         4aevPSKZscqZXwF26A0UYewVV/Iifi1lcVPkt46i7V3fRZxIooFe3e45nkd4vS71GB+G
         bSPHLzgwacPOk5llCp6Qf9bfgktdtuPKBiby+7T8gMTP0i89LU4SLQdEu/T0C2AkeVfL
         rG8aJTnXbhzeEcA3irBUn9fussudkMGin+cyh8QnEsT8eEF2f/b2QH86i9JO3zrIifJZ
         R8Qg==
X-Forwarded-Encrypted: i=1; AJvYcCU060n17iTDUrg780m4I/3+SVr/Lnlpu1XuoVXd7DrXw22x91/Uex9mggRIYfXvyOM8wqZ4wX7mUdEXnw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7mTXobADq5XiREoMeokQgXIk4qnmPi9u2MtFyoc658QZb94PB
	GqIepdEfYWbMzOkWpAFLGBecKAqzZ/pEwbIY8VGBg1+iJNA35GIYJa1P+Wjmg3TdgqZxUcIrbzo
	ULdukRga9suhY6gmP8h+ktb8WXzUAzMkGyNOkZ/1tkiGQOOpcyTRXwc8773JjGgSW+Q==
X-Gm-Gg: ATEYQzzrKVRhOpsi88l0X7HBvyafyM1sFcFeT7u4Ce5QnvLIM2coagyAtJiqbImNOLz
	DNKU/FehGBltameI3zVDz+U7K3YggfUwKMD5kZ+69GiusGcpCSD4265DDWLZ1KrPF/trr8SAh0d
	oxWaaTvtILX7QRL7zR7+B9IqpzJ3ZE9H8AroQ6CRBBh2GyT+i9KfxEVRTfo/bnnDsZpfEBfNQj/
	hAfkf4trMmEwcLX7kDH1HcGaSOJ7/3iE+XVGQKuNyeUWTjoJPE1ZS15SF1Ty+Z74L9s42RrihGq
	CMD6xLL/Tq0P1S9o3yfG0qv82pnLNapK3ujNnPcIjOD9/w4n4ADATlkacePJ8YT0UOcDJ11tXra
	Y0pTteKy0wSurLHdmVmCBY449jBPca9MwT/tEKYlgjaxHbxwUAHqpncE=
X-Received: by 2002:a05:620a:471f:b0:8c6:a034:9220 with SMTP id af79cd13be357-8cd6d44a501mr233124485a.25.1772799729240;
        Fri, 06 Mar 2026 04:22:09 -0800 (PST)
X-Received: by 2002:a05:620a:471f:b0:8c6:a034:9220 with SMTP id af79cd13be357-8cd6d44a501mr233121585a.25.1772799728800;
        Fri, 06 Mar 2026 04:22:08 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fa87e56sm111972395e9.0.2026.03.06.04.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 04:22:08 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 07/13] ASoC: qcom: qdsp6: lpass-ports: add support for LPASS LPI MI2S dais
Date: Fri,  6 Mar 2026 12:21:09 +0000
Message-ID: <20260306122115.509705-8-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDExNyBTYWx0ZWRfX1e4kla/vZAob
 hVSy1z1AN4AqMNSCZMuhlAeevdJPe3y2FY2unnG4YV8sUyNcCuEaaTlQ7kkE10KhwAxTVeZPqf6
 9Z0tMZn80pdFa3bPQRSRt3wKdFlVXtS9hUqrMfaCJcOF8+UJzkKqtqIGux/VqjXQwAy3mB8YAFk
 HqoUVmWZ0E4C3/C2JWpSmqe8lfjss5q0E8MrBFlzmnXg6ebVswl/bbwM3V2tUeLU60JtryBwcXg
 h9RLf6Lc/y2cTYEWT8P1qFyGQP5ITSm+YD8E1RDwrh6KhzIclK0RJFpq6E3fZRYfccrMhF5gKYo
 y2Ohb4mVzPAEAJGZwSJWotZFqHfFw5ipE9BfLgEYF5S5HJ9MWZnrxEcEtU1qbIS3msENq/t62KD
 7YiHy467JgMKWPuBT92iQKO7nOWgc9+VlKRk1yCnCcyUQCY8X7eQp+oRH/oTNij8tStOIkQDvKm
 p/9qdtchvPK2kzqfalQ==
X-Proofpoint-ORIG-GUID: c_jU-fP80GiaiWYYVavGsoxJjzctYDQO
X-Proofpoint-GUID: c_jU-fP80GiaiWYYVavGsoxJjzctYDQO
X-Authority-Analysis: v=2.4 cv=eJoeTXp1 c=1 sm=1 tr=0 ts=69aac6f1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=nvRDalaNTaWZAukup-IA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060117

Add support for LPASS LPI MI2S dais in the dai-driver, these dais are
used in Monaco based platform devices.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c | 47 ++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
index 4eed54b071a5..d31388ed3ccf 100644
--- a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
+++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
@@ -96,6 +96,42 @@
 		.id = did,						\
 	}
 
+#define Q6AFE_MI2S_RX_DAI(pre, did) {				\
+		.playback = {						\
+			.stream_name = pre" MI2S Playback",	\
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
+				SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_48000 |\
+				SNDRV_PCM_RATE_176400,			\
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |		\
+				   SNDRV_PCM_FMTBIT_S24_LE |		\
+				   SNDRV_PCM_FMTBIT_S32_LE,		\
+			.channels_min = 1,				\
+			.channels_max = 8,				\
+			.rate_min = 8000,				\
+			.rate_max = 176400,				\
+		},							\
+		.name = #did,						\
+		.id = did,						\
+	}
+
+#define Q6AFE_MI2S_TX_DAI(pre, did) {				\
+		.capture = {						\
+			.stream_name = pre" MI2S Capture",	\
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
+				SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_48000 |\
+				SNDRV_PCM_RATE_176400,			\
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |		\
+				   SNDRV_PCM_FMTBIT_S24_LE |		\
+				   SNDRV_PCM_FMTBIT_S32_LE,		\
+			.channels_min = 1,				\
+			.channels_max = 8,				\
+			.rate_min = 8000,				\
+			.rate_max = 176400,				\
+		},							\
+		.name = #did,						\
+		.id = did,						\
+	}
+
 static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 	{
 		.playback = {
@@ -484,6 +520,16 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 		.id = QUINARY_MI2S_TX,
 		.name = "QUIN_MI2S_TX",
 	},
+	Q6AFE_MI2S_RX_DAI("LPI RX0", LPI_MI2S_RX_0),
+	Q6AFE_MI2S_RX_DAI("LPI RX1", LPI_MI2S_RX_1),
+	Q6AFE_MI2S_RX_DAI("LPI RX2", LPI_MI2S_RX_2),
+	Q6AFE_MI2S_RX_DAI("LPI RX3", LPI_MI2S_RX_3),
+	Q6AFE_MI2S_RX_DAI("LPI RX4", LPI_MI2S_RX_4),
+	Q6AFE_MI2S_TX_DAI("LPI TX0", LPI_MI2S_TX_0),
+	Q6AFE_MI2S_TX_DAI("LPI TX1", LPI_MI2S_TX_1),
+	Q6AFE_MI2S_TX_DAI("LPI TX2", LPI_MI2S_TX_2),
+	Q6AFE_MI2S_TX_DAI("LPI TX3", LPI_MI2S_TX_3),
+	Q6AFE_MI2S_TX_DAI("LPI TX4", LPI_MI2S_TX_4),
 	Q6AFE_TDM_PB_DAI("Primary", 0, PRIMARY_TDM_RX_0),
 	Q6AFE_TDM_PB_DAI("Primary", 1, PRIMARY_TDM_RX_1),
 	Q6AFE_TDM_PB_DAI("Primary", 2, PRIMARY_TDM_RX_2),
@@ -636,6 +682,7 @@ struct snd_soc_dai_driver *q6dsp_audio_ports_set_config(struct device *dev,
 			break;
 		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
+		case LPI_MI2S_RX_0 ... LPI_MI2S_TX_4:
 			q6dsp_audio_fe_dais[i].ops = cfg->q6i2s_ops;
 			break;
 		case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
-- 
2.47.3

