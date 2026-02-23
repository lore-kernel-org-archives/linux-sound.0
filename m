Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBC733A9CA
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 18:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771870088; cv=none; b=FOUAF0EXajzg/rB5z2ruDhdn7Lstz8zH8mb6i3qUkBJOwXOEG67wmgmP3+BbeQ9AMQpjox0PoCN3AUPVpRD64madRGlMRjhm8aRWSmhlrJqCy/z2+QYJnEVbSstSOH35G2Njx8cV7vho+WMiG3AzJ7bwPdkKr4dhtj5TDcG4uXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771870088; c=relaxed/simple;
	bh=1AGWMMo+ZQ2MpMqgndQclqL9hoOIddPn00jRigW1KUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IiZWHDdFwBQwcf5CIDnge8832eu2IHxhLZuvdijMlhYLLcEOtub6pdlp/eUs232xNogswykP/2r5OjBgNV8+gY+MuWa0hVdQ4/6j7eBLmtVuBD6xafcCkv5eUNZ6PVMrpo5UNmrON1Jk079z4TmOvmRAeGNvMkiTMmnycAycYCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VHs788gH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RGJEWjch; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VHs788gH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RGJEWjch"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAXVbO3700101
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 18:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2UA23pg+dGV
	Ambwz2ppXfyVdk6xlbVmq70z85L7JFXQ=; b=VHs788gHBLElUvHdyl49YXjfMgO
	poFeujaOurmAB7oXuAfO2ltjQ14p1pkLY+Gr3BNDPr+MjSUaDEDIKI7V+H/fp0O/
	26YdVr5OHDhEGLeOqzVpZ4JZ+Yvs/R8DtXCthvi6AsqF8RdF6f86PXExyMCY2EGu
	cRzWNOltytisSzvzzbXu2qXVaAgyOzEyjUNhkUO4dMaO+IQnerGTOQosMTM+VrQg
	O0XTwBIfqJfLUaeS+SmJNzEWBAt9xaXB9RDJ8eHInYOWdB008x2MIfMu+ixVZMVD
	AxG3ZaGHzb8wUaqRyR7VhgFJnUDj0eOvSrRU94u8D4geQ64E9EumDOug3Xg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn819eh2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 18:08:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8ca3ef536ddso5457076485a.0
        for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 10:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771870085; x=1772474885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2UA23pg+dGVAmbwz2ppXfyVdk6xlbVmq70z85L7JFXQ=;
        b=RGJEWjchbTIeGDYBFh6UuZJKNFcMXcd9fh4iGb2HscvGwRKCAAbQy9TWdm7RCjLKpa
         wZeN1UI5g4zBWMmLcJOr+Jd9T6nn41ofw6H53Ezn6JB4tsquo3XvSDpgiCewjV06xYsv
         BENCyoocvmlf+t9aYR6il9573PiR5b+SgXkVJU7HzTcYnY9UlC9vFDQZFu4bDUhmj+GQ
         vKDR8JqKFDLqtsReu4KoDP/pzkGe/8H9qmXp93SuQqpQfx/eFTe1DOJNHHKNfDvUoK8D
         StZQus2A8toR4JBLLHkI9maSNM/9hAbAxX5KOJoW/RnzZTZGo35hjdgm3Lfdux9OX349
         +MtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771870085; x=1772474885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2UA23pg+dGVAmbwz2ppXfyVdk6xlbVmq70z85L7JFXQ=;
        b=fBgDuYFiEWDeJnU/hzRCJfqzuVqg1s+H5s0VB+IQRIb/6tsZ1Kl1q91sDZ7D4F9Yzz
         yokWaDQdSUeBxL9SoeUlTXUA8/d6TPd3UaemqHV+OFb/+EU+FBch5Hcbe78sM5GNZbc7
         1/hbfKWSd9bQ8R4RCQb+JXMZeCMGklQTOwLUYnv+LLqRM1UFCHRJ80pH6oDhIsVKE4C2
         SvYl7uUYkcxEcwLRvIFXBOHOlrJjzX4WDDlG0x4FCMc5TNVFx5frTHVoYCmIwFeTNGAP
         qQ66VJH0ue9vt6zXAzBdg+cn3cJJ//SY7CwIQtPhAACF0Nu7KACnpxXndMNH2YMeSHUu
         3FmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXc9cKTJK2o0RyuMead468ON2Li+sAW1Mg2wgSTg+1lEyG5LIuLoOoEyhpNixAk0mJJlRO97rN0Oa0CpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkFSb5cgFREuIATLbBW6O6wSgBYC2lZuvMpvJBv5ZJTCVz3PD3
	Hu2YCdDaGZwTMsUMhRaclyc/UQoGcxolyJLB+5Dcbx8+rpFMD/utL497D8PLkXWBh84/skEgDFz
	S9cRuCD2zw53t3zQGDszl1/mzyG/eNECuqlXI7KfiHghYbpde2fDmZXBaxkm6/moHtg==
X-Gm-Gg: AZuq6aIVYVdSL50YILp4bV66YzqqMSbHWunJx9HUqDL9BXtwrhAHHLsEad5JyWRcsRw
	0U8l7vD4AiS57jQm4xhs9JflqeVtFU6hSjDL4fwZGgJtJ+RfRWGUAw6OtAPA9NH37zpX6UKKy1x
	+9Cx9fNwF/vALjDBONs8BCpjR/F0Gr/Rw5oJx4rfmovfqQTXpG2FHVVdm4OczYd3EGFQ5pUbjlB
	4N9cN7177dQ0soe5SWlO+M92XZPFXWpX8WQ05ES4pu/kxKKjuswVV5fSbkYIjsGcqNR3V85+iJW
	aBPTfaseerS7oeGqQquJzy/YgYfublcQgxS28SzJvPrkhV0YmUcEQceKBVq6NS9EpYpErG/Fzvj
	azV6ZBnrN3UPpTLEgxY/h1yz4YvzVeRbN1OordthLrtY2z45T+b+Plws=
X-Received: by 2002:a05:620a:4150:b0:8c0:d16b:b0a7 with SMTP id af79cd13be357-8cb8c9cda80mr1154633585a.2.1771870084881;
        Mon, 23 Feb 2026 10:08:04 -0800 (PST)
X-Received: by 2002:a05:620a:4150:b0:8c0:d16b:b0a7 with SMTP id af79cd13be357-8cb8c9cda80mr1154628085a.2.1771870084439;
        Mon, 23 Feb 2026 10:08:04 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d401aasm20458574f8f.23.2026.02.23.10.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 10:08:03 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 08/14] ASoC: qcom: qdsp6: lpass-ports: add support for LPASS LPI MI2S dais
Date: Mon, 23 Feb 2026 18:07:34 +0000
Message-ID: <20260223180740.444311-9-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: Q--Hzn-E321JDkcQ11St5suW8Ej-RFcJ
X-Proofpoint-ORIG-GUID: Q--Hzn-E321JDkcQ11St5suW8Ej-RFcJ
X-Authority-Analysis: v=2.4 cv=CbsFJbrl c=1 sm=1 tr=0 ts=699c9785 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=nvRDalaNTaWZAukup-IA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE1NiBTYWx0ZWRfX+5S4eILtTTPM
 WcixuQSTsXYe4XsZkN6rK3ZaTEMTBtC2I7x4KaT66dvmU8wJovBaW49PkXR/CFwDrONuYniS+/i
 F+w5CigrbP4zW867ueoJRnyL2evFuSffAGjmVsITWiicJivCrUv8S9MY4UPzfItpUq8AL4AvNy7
 t8WcL/f7+ayXwlTLdf8IlPknH3yA4V5CrzZ0gKFOItkElMIhlpbUtQnGnmPe4DM733zZl1RHue+
 mZdseHyH76Y6PQqXgDF3muj4ydAT/e1UUD2Vk/zWOejoBhFZG9QQlI1ppWXUtukWB+aEYV754Gf
 lr9ec6N03693dSw5tVHwCeKS+IhNpr/2PPHk+pII7rQOI6bGMHWK/f3SNH+5PcMVs3/XH3T/MrF
 0qJQqmBAKxUTl3mYt4PPZTgKOlBM/RgTc8G5K/J/ItsF/6uWka45444gOYkjsxovyuBr2LIDQtL
 M7OpGrX9dmvCv0ySr7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230156

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

