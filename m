Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D657363C5E
	for <linux-sound@vger.kernel.org>; Mon,  9 Mar 2026 06:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773039114; cv=none; b=GR4BbMwfSHvNQo2syyzAYYezyib6KyyKD7iKGQYaB91xpihlAaEvem6xUP3SnmYKquDb3EohzvYY/pV9O0IA3Cxn8BhYAFjBSGTnKeYZWtHphIeI63hkU0Welvq6+5aWMzWiY0ZLEhpYZoL51YmDHZ/RHq5bDExSZA6m7tKpf0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773039114; c=relaxed/simple;
	bh=1AGWMMo+ZQ2MpMqgndQclqL9hoOIddPn00jRigW1KUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c2VueYcWBK2hmPvtvVik9Wskpi6OhFh+XBhlSvfUCd2vT1Pdi1Jdi4zGrPv15jNYRC3eIzJ/nWViKVKe7lqFee59mDqNeslEzLo9imb2TQGD95ernq3qlIS67dB0HyqKsWvl/d1ybNjibpKDf/HpPNNvx5V8uJdi/DAadKKtUUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g8L5DxLp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fk2jscVh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g8L5DxLp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fk2jscVh"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628N0pN03015890
	for <linux-sound@vger.kernel.org>; Mon, 9 Mar 2026 06:51:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2UA23pg+dGV
	Ambwz2ppXfyVdk6xlbVmq70z85L7JFXQ=; b=g8L5DxLp5yKatlPFxlc6ckn+uMd
	taFLoGQTsXy6fI/v6KAM3DSmCdlEF05Rrei7QrC3hL+iTVQTjO/Z9ShkA0L3r6Fr
	k0aR9xDeeyC107AIkj/sWgcik21YCRKyo88/xIfhr4m1v0OTBBbzy1OcmltQ6HOr
	iE1cXtsNk8J+bBaGLo87ocNPhhrJ8lGarj2e8w9KnLgn34cO5FVGYHhOQOzNx70/
	1WVJRmG3FlDnZzZ6zdpc81Srt9pjd4QxG5uRZJtjhVOI2kvl5p2hnxmHwD47XmTU
	/PotlNbJwlH0VbeEMndmQnENs8sI+EdsHZzPG3zuLH090hM64GH6Uuj9IgA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crbkxv80a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 09 Mar 2026 06:51:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd85e08fddso817534785a.1
        for <linux-sound@vger.kernel.org>; Sun, 08 Mar 2026 23:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773039111; x=1773643911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2UA23pg+dGVAmbwz2ppXfyVdk6xlbVmq70z85L7JFXQ=;
        b=fk2jscVhaEFS8qLs6w9ZIo0MZNXBRDtUIXMIX2VzXYJdjwzRNn5v5LheQst7GI/XOy
         z5IJ61dseTxrGZYQcLgvwvEhSN3yHULN35dDaV6Gcyg/q7tq0puj+ygRDgtJ6qwkRJBV
         lquSnDAR74k5oPmM9Qsr5wGzJo3SbBju/KmiggeJH+TDXzbH3rSVASBrsnGrR2r57QSm
         p3l4GnKbEs5UbzAlns+eQ0WbozjT71W++mOC5RL0DhJfht89byD1Cu2qNmkO5OrnGAdi
         nu5QVWl0ERFlr8fmL+Pb7unX/Q+uykcDTbFS/5YPQv7DR9S2NtMciVDhlEl1j1x5hrk8
         Zq5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773039111; x=1773643911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2UA23pg+dGVAmbwz2ppXfyVdk6xlbVmq70z85L7JFXQ=;
        b=I+l5RxRXK/cvTjeYJiaFCfVkMiXuP+3LTQ6fq863xbfzAsW31LLtr8saXCtZTmqCmH
         bslfgyeZFYM6dXFafy50huvnKw8GzU8SHUiuDW2VNfiF4A7RTcn5dE9qReFTfCcI1fFM
         6CDpgKv1IkaVw9IbWoaIjS5+R09u7YkJ9EAcp8TLenD3sAf7Np/THzKcLOJZuryNNNG9
         ycHTDcd/5q9oR+kV8KuHGZawVx34yHO9wBWKhIuKv43fYbpYUQlSYksOcUq4W3gudl3d
         +PpHSjyzEbKNCRwoKVK/ghPGuLt76VetlJPiqHNdi6J5dPjCN6lovNQTB4m6W2QuZkzF
         L/Mw==
X-Forwarded-Encrypted: i=1; AJvYcCWXnTKWET1H0ubTolcyDgodAFC7JlZ+By/BHzysNYcXrOiVJbD8oLa1JlXibr7X8gNW5KMJGf9PvdINoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg4Ral3QBKnsyoyE7d3+B85TRW9XOsHuKdw7XC2U9Gk1yxxdO6
	v5SSHus3p4cx/rYj43KpZGrBmxJQN3+010GesJH2YEgYXKxnub6XQ0u26OQVBfu6KQmLikmmql/
	7GFdQZK0yG63KMVa4KonhKrU4h8zmI/mk8OVH/MyX3l0prOqGlueBebOycGxrtd735w==
X-Gm-Gg: ATEYQzxxzp302JkapFKvQIxJ7wGyP5ALnp9wDcrVnSiuwgWwsTCjBBNN68hoOvZjnwQ
	gvLoA1ADk38PYT92XB3LhDW1pT5bBM3a1JqX1toI82fcz49ryfujT5beuCKGUQ8tWJTyzjDsE7R
	oB/xkltyYPo40GZY40vtsuDXjXAXoN5qfGi5vlUcB9HbCY2wrTQ5+/41sPabdKkKwgbIN+xeAbu
	qmOJi0Ctck1LcPEl+wzT8u1RIRAiqz89SqLuW6HhQh0D90fyfZj5Cg0v6iRpOPayuGb9+EzblrL
	ye00RQd9uuaq3euPSCCwIPJ9cN6koBPg6dQZykFBo7aKR8NEPQEplJSAFRq/56/UuueUfWL0bLT
	NWMqbnDW+BlhaP8Iz4xZN8ZBAEY3wZj04xHhnV50KCv+xdY+323mLThI=
X-Received: by 2002:a05:620a:1a8b:b0:8cd:88c7:9f96 with SMTP id af79cd13be357-8cd88c7a3dfmr333894185a.67.1773039111511;
        Sun, 08 Mar 2026 23:51:51 -0700 (PDT)
X-Received: by 2002:a05:620a:1a8b:b0:8cd:88c7:9f96 with SMTP id af79cd13be357-8cd88c7a3dfmr333891985a.67.1773039111115;
        Sun, 08 Mar 2026 23:51:51 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48529f01997sm80449975e9.14.2026.03.08.23.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 23:51:49 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v5 07/13] ASoC: qcom: qdsp6: lpass-ports: add support for LPASS LPI MI2S dais
Date: Mon,  9 Mar 2026 06:51:31 +0000
Message-ID: <20260309065137.949053-8-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260309065137.949053-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260309065137.949053-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA2MSBTYWx0ZWRfX8X5X+cti9Ela
 l12Fx5YvKMfzTZWcSB03DBEgUKL1MyQiZnBtKAHR03sX/v+U0a5gkpUPxnUGtLww2JtXAc+28s8
 bGg7fEshzkn8z6gHmegSVxCkgv28Wio0USxtHmJhJf215X8QnLxrESSUJd/7paoW0fxiT1sQ0+M
 hcET23LmXVK6R67JZO7z9nk6LBN5hzlxKnQ6HceIwZkk04qK9YBzb096o+vHJ0PezY5hp8/lhBP
 1E+57HOs2el6+AzmwUvK1nzM+b9lbX0DIdyNNS24LDeQOHi1ZCZtAaGbP6GlqI5MOUO3YxQhqJ+
 gKsOT2AuFf0/3dUz9pJCpgAUwppyiWpYj6h25fN5ZIkcOxQDW5A4Lnn2rT9+KrBOIYe6hH9Fkuz
 PP+xEelOU5WM2V7QY4yDSjI/IAZAoVF2sv7tPrVm7cFg1bX2fkOPhQJ+SZru8krplrV7ZEgR9UP
 Yar1Hy3wi91iS/exSOw==
X-Proofpoint-ORIG-GUID: dMTOkyCa7yOATiAuazXWtrMw8JS-rbqE
X-Proofpoint-GUID: dMTOkyCa7yOATiAuazXWtrMw8JS-rbqE
X-Authority-Analysis: v=2.4 cv=LOprgZW9 c=1 sm=1 tr=0 ts=69ae6e08 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=nvRDalaNTaWZAukup-IA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090061

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

