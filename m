Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A4032E75F
	for <linux-sound@vger.kernel.org>; Tue, 18 Nov 2025 10:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763460139; cv=none; b=CEyQ/vTjY7dGBR7AolCYANqzRSBVuK2CpguJpcL+33CG5UyHYWqhtLSKAcxlNWRZNslnYD09BLsu9PmRAcnUZ6ZTAe+/NIh32h9OTsJK9P3wYm+TRxuEalMN564qzWsp+fdxJOGoekEaQmKULmi8Qaf63iJLHEZfACZGhpeGZ8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763460139; c=relaxed/simple;
	bh=6PoO/YGb/fNtD2zisri6HddmB7PkFezmhqhZBvMmmD4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H+e4QeYfi/5BNdwyc4dS2kIXOf3VFkw4cpAtr8EXpudhUXmSGIjgKJOJjRqIc0ycNUjfwo7DjnDn3hagJTkR4qs0+iNhGuIIN+v46MkCV254dGHe6ubarED9+vaNwz8NQOcZra1y3ZVbXmj2S7XzuUtxkOIT1KzJzUsoP+3Ep6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eNSfmUoh reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eNSfmUoh"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI6fxmh2343970
	for <linux-sound@vger.kernel.org>; Tue, 18 Nov 2025 10:02:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=O13cKuwNtxt
	1AIq68CNYqjMUm5hN0y8zZFVwLx4dckc=; b=eNSfmUohupRwwcpV/WErMLfzkKp
	4HeB41dgMBDa+dFO/xrQEM4HrlPFTEVyiyRYSsPBlV1oUvilNUDbIGUWkNdtYx+/
	n1UlmbIaQZCfQMb0DhURNSr70dTGR1xihyPlUvLVyLHA7pxlTAn0nKzg4NBm1w1Z
	2+QmIXVeGeQVUFA7LzQrDaTTGHWECCcQNrT77Ge7g1GPs2eOTZh+ZToBipLoNeJt
	haPqHAh5q34kNZEgpQT1HI2QOUedx8Z2vyEEfFffkCy/LwkV42e15LMXbYzJF7CI
	Tb64p9ddxZjFyUqF+yj+3OO06fX/GVNABcv3HBigzoRZoqN2EZ86DpdfcRQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agkrn0m4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 18 Nov 2025 10:02:16 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b82c2c2ca2so8251494b3a.1
        for <linux-sound@vger.kernel.org>; Tue, 18 Nov 2025 02:02:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763460135; x=1764064935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O13cKuwNtxt1AIq68CNYqjMUm5hN0y8zZFVwLx4dckc=;
        b=UKUXBfrvucbbLw8JywbtosSMlMTYOSETzDJEJ6XV3wUOoSvldOJrY2pSlOFmnqnEvz
         1Csqe0TygqzRO22FtN3d2yVx7DcTPyHF6XtSBiI3xC5emwABAM30ytrQx57IQH/6XilC
         1yCdor5DEnVtVYlbFLE3udDHShzo3ut/FLhYO0VC6nlo/V6XjeMlO0Z2EzZj39lcxJIA
         zv0dyJzlE5Q0genda00HlR++Sv9FXJKnHfaeZv3JrOBaazuiiMhdTOFzn8ssJfjDp18J
         hjkAab7MEvCaCNY6YmYZWZJxbigEKpVyYFv5rKdFD4WtsdjzsZMJaVx++HI/17N+P0vY
         R44w==
X-Gm-Message-State: AOJu0Yw8z0sY1Sk5Fe2cN13HuSl6fQZJ/6qJLu6XbDvNhjzz7MARsfD7
	AER5j6yoJQK0d8fIHE5xNObZlLuKX9Wz6/VeDQ/qvKHKY2X6qe5eaqSBupNisHlCsqEhB8lGSBC
	JU2YJT2Bn5tTd6CznyLJO73b30EQAnXYK/LD+x+6hx0wGHi0eloMv/z8XvqkthL/Xvw==
X-Gm-Gg: ASbGnctq3TfVlmGE8xZP8NrGaqVkQhSBiaSs9PVnBUggaso+DlSI3LSbvfWjRsDdQNI
	BrI7S5XSVD+IeWNkM6AvGOOawf2IE6qZquThMXLsl2lETZjXjxkwIP83KmVY6xkZ+VyUp0QI7H9
	KOuEbeGcPvezD0SfG5ceaQl3Zjhzh+5NnmxEmtHfGIPEx75kPWcyRO8PgkAdaYCIOGXakkCbs+F
	QNs+RCCXikl4C2qGg9k9anvfLdx+1KLb5td1LwU/afe5XuKKtr31k1lW37/NW0Yy7fe/84CQGVt
	0vZHiHInLHyyS8LDg4zbYTRBotv7I+sxStpagMcmhAYu9OAK9E/ywLI/yEe4rV+uFMLTq1X65SI
	Xn6A=
X-Received: by 2002:a05:6a00:cc9:b0:7aa:d7dd:b7dc with SMTP id d2e1a72fcca58-7ba3ca62f1cmr20389042b3a.31.1763460135093;
        Tue, 18 Nov 2025 02:02:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMwe4yCZpEIS9Im0zeQqJNAXo/u0jFJIed6UJrlvHv6FAFp24D2lmOFiUKNuoRHJAlxoOJBA==
X-Received: by 2002:a05:6a00:cc9:b0:7aa:d7dd:b7dc with SMTP id d2e1a72fcca58-7ba3ca62f1cmr20389002b3a.31.1763460134586;
        Tue, 18 Nov 2025 02:02:14 -0800 (PST)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9256b9283sm16120030b3a.33.2025.11.18.02.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 02:02:13 -0800 (PST)
From: Ravi.Hothi.ravi.hothi@oss.qualcomm.com
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
Subject: [PATCH v1 1/2] ASoC: qcom: q6dsp-lpass-ports: Add support for multiple sampling rates
Date: Tue, 18 Nov 2025 15:32:02 +0530
Message-Id: <20251118100203.2751955-2-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251118100203.2751955-1-ravi.hothi@oss.qualcomm.com>
References: <20251118100203.2751955-1-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: r3JemHy4SdQKr5P4Mzn7vUFJIVuKlQAa
X-Proofpoint-ORIG-GUID: r3JemHy4SdQKr5P4Mzn7vUFJIVuKlQAa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA3OSBTYWx0ZWRfX2LpcnSMKfINx
 Q3EyYmFMye/PmdghM70FHt5w44Ms9CisEiepGLPP35goC0u7u5o8KwZks3hNQAHow/iQuJQmXiO
 dBV0KwB+cdio8lC7NMWnE81b3+Abuu7cVx4n1id7Gl5p1kzl5wyiqRMnTTsydyYO59YdwN70FzB
 u8FTjjq+I9VWLo1fmy7p5VxJnIumL57erhtNe+ZuZnyx5HZpOPvCxuXY1XoJiFnMMCkUoq2TMe9
 ZzjNGhKewxW93iFmg4k5fAcovUWAKTlGeLh583e6es+cYeS/cXuQ56s3F0RBkrDixIAF/tHYHN8
 nPbeYU8sCxdD2AdDj4RO7Mp9vOawZP+LpK/YHGLitHbUM0FwBBzgtVwgL/2d/rg4dELc3fd1cW8
 I5ZmDBp3NgJZE7PC8WFZqxEsaBE/WA==
X-Authority-Analysis: v=2.4 cv=L+kQguT8 c=1 sm=1 tr=0 ts=691c4428 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=wbo3agcGWv7YO2hpoMUA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1011 bulkscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180079

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

Extend the q6dsp-lpass-ports driver to support a wider range of sampling
rates, from 8000 Hz to 192000 Hz. This improves compatibility with
diverse audio hardware and enables better flexibility for audio stream
configurations.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c | 73 +++++++++---------------
 1 file changed, 27 insertions(+), 46 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
index 4eed54b071a5..76421adb5afa 100644
--- a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
+++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
@@ -10,16 +10,14 @@
 #define Q6AFE_TDM_PB_DAI(pre, num, did) {				\
 		.playback = {						\
 			.stream_name = pre" TDM"#num" Playback",	\
-			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
-				SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_48000 |\
-				SNDRV_PCM_RATE_176400,			\
+			.rates = SNDRV_PCM_RATE_8000_192000,		\
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |		\
 				   SNDRV_PCM_FMTBIT_S24_LE |		\
 				   SNDRV_PCM_FMTBIT_S32_LE,		\
 			.channels_min = 1,				\
 			.channels_max = 8,				\
 			.rate_min = 8000,				\
-			.rate_max = 176400,				\
+			.rate_max = 192000,				\
 		},							\
 		.name = #did,						\
 		.id = did,						\
@@ -28,16 +26,14 @@
 #define Q6AFE_TDM_CAP_DAI(pre, num, did) {				\
 		.capture = {						\
 			.stream_name = pre" TDM"#num" Capture",		\
-			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
-				SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_48000 |\
-				SNDRV_PCM_RATE_176400,			\
+			.rates = SNDRV_PCM_RATE_8000_192000,		\
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |		\
 				   SNDRV_PCM_FMTBIT_S24_LE |		\
 				   SNDRV_PCM_FMTBIT_S32_LE,		\
 			.channels_min = 1,				\
 			.channels_max = 8,				\
 			.rate_min = 8000,				\
-			.rate_max = 176400,				\
+			.rate_max = 192000,				\
 		},							\
 		.name = #did,						\
 		.id = did,						\
@@ -46,16 +42,14 @@
 #define Q6AFE_CDC_DMA_RX_DAI(did) {				\
 		.playback = {						\
 			.stream_name = #did" Playback",	\
-			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
-				SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_48000 |\
-				SNDRV_PCM_RATE_176400,			\
+			.rates = SNDRV_PCM_RATE_8000_192000,		\
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |		\
 				   SNDRV_PCM_FMTBIT_S24_LE |		\
 				   SNDRV_PCM_FMTBIT_S32_LE,		\
 			.channels_min = 1,				\
 			.channels_max = 8,				\
 			.rate_min = 8000,				\
-			.rate_max = 176400,				\
+			.rate_max = 192000,				\
 		},							\
 		.name = #did,						\
 		.id = did,						\
@@ -64,16 +58,14 @@
 #define Q6AFE_CDC_DMA_TX_DAI(did) {				\
 		.capture = {						\
 			.stream_name = #did" Capture",		\
-			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
-				SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_48000 |\
-				SNDRV_PCM_RATE_176400,			\
+			.rates = SNDRV_PCM_RATE_8000_192000,		\
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |		\
 				   SNDRV_PCM_FMTBIT_S24_LE |		\
 				   SNDRV_PCM_FMTBIT_S32_LE,		\
 			.channels_min = 1,				\
 			.channels_max = 8,				\
 			.rate_min = 8000,				\
-			.rate_max = 176400,				\
+			.rate_max = 192000,				\
 		},							\
 		.name = #did,						\
 		.id = did,						\
@@ -350,118 +342,108 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 	}, {
 		.playback = {
 			.stream_name = "Primary MI2S Playback",
-			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
-				 SNDRV_PCM_RATE_16000,
+			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |
 				   SNDRV_PCM_FMTBIT_S24_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
-			.rate_max =     48000,
+			.rate_max =     192000,
 		},
 		.id = PRIMARY_MI2S_RX,
 		.name = "PRI_MI2S_RX",
 	}, {
 		.capture = {
 			.stream_name = "Primary MI2S Capture",
-			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
-				 SNDRV_PCM_RATE_16000,
+			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |
 				   SNDRV_PCM_FMTBIT_S24_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
-			.rate_max =     48000,
+			.rate_max =     192000,
 		},
 		.id = PRIMARY_MI2S_TX,
 		.name = "PRI_MI2S_TX",
 	}, {
 		.playback = {
 			.stream_name = "Secondary MI2S Playback",
-			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
-				 SNDRV_PCM_RATE_16000,
+			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
-			.rate_max =     48000,
+			.rate_max =     192000,
 		},
 		.name = "SEC_MI2S_RX",
 		.id = SECONDARY_MI2S_RX,
 	}, {
 		.capture = {
 			.stream_name = "Secondary MI2S Capture",
-			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
-				 SNDRV_PCM_RATE_16000,
+			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |
 				   SNDRV_PCM_FMTBIT_S24_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
-			.rate_max =     48000,
+			.rate_max =     192000,
 		},
 		.id = SECONDARY_MI2S_TX,
 		.name = "SEC_MI2S_TX",
 	}, {
 		.playback = {
 			.stream_name = "Tertiary MI2S Playback",
-			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
-				 SNDRV_PCM_RATE_16000,
+			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
-			.rate_max =     48000,
+			.rate_max =     192000,
 		},
 		.name = "TERT_MI2S_RX",
 		.id = TERTIARY_MI2S_RX,
 	}, {
 		.capture = {
 			.stream_name = "Tertiary MI2S Capture",
-			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
-				 SNDRV_PCM_RATE_16000,
+			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |
 				   SNDRV_PCM_FMTBIT_S24_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
-			.rate_max =     48000,
+			.rate_max =     192000,
 		},
 		.id = TERTIARY_MI2S_TX,
 		.name = "TERT_MI2S_TX",
 	}, {
 		.playback = {
 			.stream_name = "Quaternary MI2S Playback",
-			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
-				 SNDRV_PCM_RATE_16000,
+			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
-			.rate_max =     48000,
+			.rate_max =     192000,
 		},
 		.name = "QUAT_MI2S_RX",
 		.id = QUATERNARY_MI2S_RX,
 	}, {
 		.capture = {
 			.stream_name = "Quaternary MI2S Capture",
-			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
-				 SNDRV_PCM_RATE_16000,
+			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |
 				   SNDRV_PCM_FMTBIT_S24_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
-			.rate_max =     48000,
+			.rate_max =     192000,
 		},
 		.id = QUATERNARY_MI2S_TX,
 		.name = "QUAT_MI2S_TX",
 	}, {
 		.playback = {
 			.stream_name = "Quinary MI2S Playback",
-			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
-			SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_96000 |
-			SNDRV_PCM_RATE_192000,
+			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE,
 			.channels_min = 1,
 			.channels_max = 8,
@@ -473,13 +455,12 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 	}, {
 		.capture = {
 			.stream_name = "Quinary MI2S Capture",
-			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
-				 SNDRV_PCM_RATE_16000,
+			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
-			.rate_max =     48000,
+			.rate_max =     192000,
 		},
 		.id = QUINARY_MI2S_TX,
 		.name = "QUIN_MI2S_TX",
-- 
2.34.1

