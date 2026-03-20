Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFE83CA481
	for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 14:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774018177; cv=none; b=hmcS0cZyfO7yUjJw7Ad7Nql5lbBdFpAwwYW5rtFG3H43l0AZ+YJ8DaHJ31DgcsHgRIMlOzkaA0+//Hwd1OkKi/gGAyfBZfIYxL5JXN9rdUqqE25VXkM83A4o4tcJ48IbO+ysNslYgubDITeefwp4QdFZG25Jwm36IF6cpJNTjLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774018177; c=relaxed/simple;
	bh=1AGWMMo+ZQ2MpMqgndQclqL9hoOIddPn00jRigW1KUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fa28EhdDuymRJWWdnZCJ3Rt2Va4Q8Ay98+5PLonjS+OqqnKaOI7XfZXU1dydYSNRV6rGnWRcMwHwLtgf3suIpmRE325P1+XE9Ivw+bfYUjuZybMMtn/EsbwCSPpV+GtaKCQ7xsQfJanvUIeCHa0defoQZZxe16kPT/oOYDA0Uy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eMj0TbLW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cfQ9BrjQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eMj0TbLW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cfQ9BrjQ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62K94UZT700891
	for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 14:49:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2UA23pg+dGV
	Ambwz2ppXfyVdk6xlbVmq70z85L7JFXQ=; b=eMj0TbLW9TnwZv5eZisp6ltT93f
	vKBIFuNjscoJjw2nSmLYL/4m4adRbZiST4b9ChS+by6MRry98Ni0Uox2Uy0Z6Rth
	P5ks/Cn6R9yGWpganhME7VmcZJ48o/4KN2cNhdZpxljKNl072KwyIZglLcyyJkuu
	ArNipY5IbFt+x4SzNWk0Ff1hPPYjWtbGaW5NaQqaYzyvD7FbDD/rxWNslJinjG/c
	E0ogYkaQ6Lj+YYy5armXA9lcWl5WAHbcVqz0RI3ZRBtNzhxFJjilc3n6H4jU7Wv8
	U4Do1zqZAqBbr6qzA+PIRoeO5gXBx51bKeLLsnuMAVQImvCcvZjskNCEt0g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d139q0sx6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 14:49:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b31cff27fso4958561cf.3
        for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 07:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774018175; x=1774622975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2UA23pg+dGVAmbwz2ppXfyVdk6xlbVmq70z85L7JFXQ=;
        b=cfQ9BrjQwmVRJG7acdG7rck9IEifG0j5ZL8/zQIs0BdC6Ze+nhm+LtqYTTJgmshGrR
         hkCUbh68hTt3AK/09VVIMHMVVMQ3BJBbLuKXTF+sjzMKW2oO4tJuBt//gZfuGJHEJxuM
         8SDVgB9gdClYVljbv/Cey/qrZ2sGk+mUn9gNBD7ylxw3wAusoo9PMmIIN+vhHizBvSb9
         UHeLe4P+F+Tq/U2HFNwe+3DrLfNkNY/EIseDogsbPQ7rxqjwMARDlWp6GhVclj3RVX0m
         OQg0v/ecG+ThMwDwkcj5UdR13EPzXhMWRU05zn276xQW23EUvElT0Ro5jGmKksh9KNzr
         /o6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774018175; x=1774622975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2UA23pg+dGVAmbwz2ppXfyVdk6xlbVmq70z85L7JFXQ=;
        b=eqg/eKhqspX3dBkQ0JnJnjdIMPgh5m9r+Vh748EoChHml2toCqV5c83c1+YLqcK9Gk
         anVM4trl8wB40mPYH33EDYlLcR0CYl9fz9u6pR+9ziHTPipoOB1v2LZ7sKjtVyKTRZGl
         VFggI6rfH179AiRQpt/fyM+OdozDDPBd9HPKfAZdr+4EEnHhkDzKHhmFUPEqCGcfe8A/
         I+pKBKbjZWpqkk3s+sfcwuMlivwrb618ie1nJEfJggF+352rS/BRBMJLLWAHX633qeRk
         lVPqL5BK2V7kQJyedYbNpgFyxfsZMA+eHGamH9LAu9Hk0nsvtCEGdwj/VZElO6uoBfsZ
         l90A==
X-Forwarded-Encrypted: i=1; AJvYcCUeHG6P9wxJJilo1hYcjHgobThAZHwG07C6izWabpisfWahsiDyWOFsB0uQBof02oP+Ochf5CyCd/f22g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt7g4SrMVNRP2NABR+0rT9UNLqQ5QykT06AFN6M9IMvpXspB0g
	YOvc7vUVCLR8oagQ/SOYkJ9LFBomtrHOUQhgYEU8m9KJSK64ygmrrZCb0v1QRf2Lkm39SoZWvMU
	mPpll7TXz5yS3rOAJr9pRodJ1u3F9NpvUNdEqUvhzUoOS5wzjIVM3EFiNIi9WwGIC5A==
X-Gm-Gg: ATEYQzyEvIXA3ABVOIjlXQRu6X5FDkpNocxXRYycPipaoEXQBJVKmmHMt3lUpLQQ8V9
	XAU4cm8uol9Ms3nf2Zg0sZM9JMucl8O8em09Xm8qWqwRWnltfjX7Se/zY8H2Q24fwQeFSF7jd6Y
	hoTPl+e9YbYfYE55io3V5YSKInz/+M/bqBnZNAAmflYxVc8QnzlhG1kU87JNkAf//ZMH0jgMxqc
	V3WVfWa6BlY2JCa3/qkpWA5S/rBg3/a7eeRJZMXfGlT9vXQfqR9+1jexMbYlKkdeG27ARoWQIAP
	XOh9PDWe48sXXyWpDZ5CH+Jg+u9Ds5DiMM8IqhqPCIsniT4Tr31RZIKIJ/EmsxWsqIREVJBlNU8
	nZGLV7okwriOmBACyzDvUejhlbowp6F2kP7gWvcWtHl+GJuf6XRCm+NY=
X-Received: by 2002:a05:622a:cd:b0:50b:4051:2cab with SMTP id d75a77b69052e-50b40513540mr22009421cf.58.1774018174930;
        Fri, 20 Mar 2026 07:49:34 -0700 (PDT)
X-Received: by 2002:a05:622a:cd:b0:50b:4051:2cab with SMTP id d75a77b69052e-50b40513540mr22009001cf.58.1774018174465;
        Fri, 20 Mar 2026 07:49:34 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff109b95sm47906825e9.1.2026.03.20.07.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 07:49:33 -0700 (PDT)
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
Subject: [PATCH v6 07/13] ASoC: qcom: qdsp6: lpass-ports: add support for LPASS LPI MI2S dais
Date: Fri, 20 Mar 2026 14:49:12 +0000
Message-ID: <20260320144918.1685838-8-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260320144918.1685838-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260320144918.1685838-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDExOCBTYWx0ZWRfXzf1XrJAdEM6L
 gWlq+oe3HGRylM/9thWXHTkU0K+AbIF26xUEBG9anbOAO9c4q0BdlUBdtm8rLDkTWs9xKaVhRlA
 7CKuJNiyXHZeGa04I/K4zLpBfIeVLL+XUCi7zOwuG6l/3cqoWBdhfyg60AZS5brN/W4RSiAE7hU
 0vs3cfvFSfdbYTA2vJZZdj1tskPgr9oEsDkIq6sv9i6hyreUkNirs2uwp7eceprNOZRoFLkQ2vb
 fVX/piOrsGto75K9fQZ99iFh7gi8UiWFASsu9gZUFsvunLJ0IgIMn0hYEv/Ee/hL2crtitCGxhN
 Zc4vd+zaQk2PXd8caKxFcckIllvNdbQpJzllWfo2z6PiwAoZF8aKdjKzVu7LuBVPQNT7oGXmWKa
 mokr+SLAGcuBi83Gw2H4Ct11yTUdewDEf/Dd0ExWTWzascwO8GB31K3aP0mcBxhHdSD3O7eedSQ
 2u10OYn9JOy+fWlEBPw==
X-Authority-Analysis: v=2.4 cv=FOAWBuos c=1 sm=1 tr=0 ts=69bd5e7f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=nvRDalaNTaWZAukup-IA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: TExKlcPz8TucDTceXAogMWdIn253jmMR
X-Proofpoint-ORIG-GUID: TExKlcPz8TucDTceXAogMWdIn253jmMR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-20_02,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200118

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

