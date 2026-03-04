Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1317344DB9
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 13:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772629651; cv=none; b=bg9VYKeLuAGQnATUYE0Q/VUpFvlgkOC16bjLeHcdqRaNwTFmIBatFRS+cKi6byF9NxSHHDQu6Bc/DJa3KOE4cshACE/t/Ij5l4yHg52MFQuD2jLqMwYtaiI6BowZRW4Ny1uOh8z5Xp13rBvZ6LI/PCDSOrM4tpf06HGlF8QuYGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772629651; c=relaxed/simple;
	bh=1AGWMMo+ZQ2MpMqgndQclqL9hoOIddPn00jRigW1KUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZxdhGfAiYC0ZbuFZ5MS32MEpBQ7s49famvZ8VB8EHtrFSZng9s2eptuKfWthIhpklZEyOYViAe/QQIQIAMRBaC73Lzj+86QAWpztpywyrBICneK5aSqxAuI1wCixh95D0q3+m29vxO+LNYHpQU/uPrgzge2HhTI+l/zlA6lcLx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=STGiRzOy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CVnkTMHd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="STGiRzOy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CVnkTMHd"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6249spNG1213650
	for <linux-sound@vger.kernel.org>; Wed, 4 Mar 2026 13:07:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2UA23pg+dGV
	Ambwz2ppXfyVdk6xlbVmq70z85L7JFXQ=; b=STGiRzOyvXPiZkgPc8Msq9QtVaX
	HIDfmhqAJcNVwgb+hLc7IwLxX9pVGHVQMQUQGeSeOORBMkR6SjaoRPwnOPm2p5NQ
	Fpv88bBLCiJNbDWLRVpu5FY7ig67K/41Br31UPqI9HIuCvLpGAK+0UwIiBqKfs+m
	CEHIUbsWzDfP+9FvONbBcAX/LBj2oaizmgC6nellVQzjf6SpbpPn6GdKAW2vX09+
	IzTnSl7onFSIDGtlsktNgLjk2I6vWLmKM2zJ0ZQvP1ecoTJier6+zc+W6BCN+bZh
	V6n3kHFV+ZgLq9vFQHZynt762pFKH/JYaGBoHXh06aM0Xdbn4PIHa2KFTew==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpjh5rhp0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 04 Mar 2026 13:07:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70ab7f67fso71020685a.3
        for <linux-sound@vger.kernel.org>; Wed, 04 Mar 2026 05:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772629646; x=1773234446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2UA23pg+dGVAmbwz2ppXfyVdk6xlbVmq70z85L7JFXQ=;
        b=CVnkTMHdDV4D3suRmBRlsxEy+qgDmnSESrLm3oxXJZCcQNvQ4ZAwBHswjKATRfPnZR
         lGPsYt6xIG/AWxokUgWRAzQnzHhY46xkGXxBGXctHlaelUZu1Rk3ppimcAkY+W0eP8XR
         diN9eKTJTBsmoE+54PmI/YF5OfEAn0yClCvmtVjNIO3DFJIry6Wy9eHtAiRaONlZLTpH
         XBXrihCXBuo+P9HZxRjbuFTCg9UmRZwjq5ipTbuzcX0+kde3pGCMUOWDx96Z+WCDnzhO
         uY3kFGIFTY7coD1x8U3K578LBO6+2gZPe5QUBMnCM+jJssm9sUmKcJqz0vAow6tv4SHw
         TrtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772629646; x=1773234446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2UA23pg+dGVAmbwz2ppXfyVdk6xlbVmq70z85L7JFXQ=;
        b=A1O5yvW2nyoY1SxRt10wcMV/ycZX/hSLDf/wO8rZQ0FnxsEZLePKhJTYRuBWwWc4LS
         zK7oGs1T4H03prv0KdgQgOuLwx7XAWa9F0wQISoPXP1mehwCUUHSlwGEnwrmzTLEQRXD
         B8euM84C9nTgbs18pfjKIshaW2PGW3CEgOpd3i0vdjLZp/el/5vbx0GXRJtDcKT5jMGs
         aQsflglQxZIFxcljvHJw7IW/YLIlvL2L6EQMFyiqYPrDSszRWFnjlTYpZrLrfOTLQPMG
         UcrVzA+TlxXO+XgU4ja7Yod64ZMk7jWq6D914zOSfrzoZUVoxCEWdANuGLJwU7PKGZIB
         b6yw==
X-Forwarded-Encrypted: i=1; AJvYcCW36k46mdHeWPAAz752V2FRiy3DouAd1M9SS6q8lCrBepoh/PDeXNO7J8eEoTgMgZmBNE4zNM+MfRTxpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ1sMvx6wxoZn6SPMzzEr9dTJRZIbL6Kcx0zF2LLpZJYAE6uN7
	vQLiV7TJ4Jw5mBY4590CYJe7bXJSauu+x/Ws1MbHBxwzvxR1tXYwXM4Zh4fg9M4HfglDMQKNwDJ
	ReWkafKXvzPnj/WQjnGhPvHtpvzsRY0ehNx95On70C/PFkJCcIGTAxrHYM/4aJyVF3g==
X-Gm-Gg: ATEYQzzvQ7z4KwhVQXf9Onq2iT4vG2QQ/UyGLjQNqqrD6Uzgqtr4xGKMES1Xui5D20R
	dcVquhZa7ABuipj4Oas43dHqX/YIK2W9hyqWfGd9USURLDT9t4DnVyWkN54aSciq8yL1LDEQVbX
	5ZZijNb1JgHct1KpfaUHU67F5WHLuB56G5zhHbNTN5t3IupvKzM7lrzN4g/rrVI9Dcip96JMeLp
	U59YHHHiZWbQcNJwTR4U6fMSmswERMahL+PCDY0DKhMkBVK+FLQD4fRkycLfi+F9jJ1S2njtG1I
	WJd00qE+Ik59+aIHYKoPEDj2A1hdAo7gPmJxPBsAA+HSNAkfJmr+/zLlGKYn8lWx+BVGl59hoxx
	FbWVGCu0R4dvmKu7nzUZ9/Ya8wZxJUz06Lq155jhJf+ySMyH4lKRady4=
X-Received: by 2002:a05:620a:460e:b0:8c6:b4c9:aa86 with SMTP id af79cd13be357-8cd5af1b3a5mr218503785a.36.1772629645959;
        Wed, 04 Mar 2026 05:07:25 -0800 (PST)
X-Received: by 2002:a05:620a:460e:b0:8c6:b4c9:aa86 with SMTP id af79cd13be357-8cd5af1b3a5mr218500685a.36.1772629645556;
        Wed, 04 Mar 2026 05:07:25 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485188122a6sm49969745e9.12.2026.03.04.05.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 05:07:24 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 07/14] ASoC: qcom: qdsp6: lpass-ports: add support for LPASS LPI MI2S dais
Date: Wed,  4 Mar 2026 13:07:05 +0000
Message-ID: <20260304130712.222246-8-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260304130712.222246-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260304130712.222246-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: U1qdnefpHXOzNtyk_nxmW4ZuHJWt8egK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEwNSBTYWx0ZWRfXxfxNtOWJMwQV
 LEA70WHd1l+6PtV87JdjGx50kqddRfXaG3JZaPxZRiUujBp5tZY3msqRJX0lTzFbkspjpouLZX8
 NGLMLmKGE5k8v2MUGJgODSEIcV+AADQzbS/DUVa9g/7tseibNRNnSLMCZLxX+Th87fjMkps4FUP
 OTRZdDiR43yDISOge0uKrK1wXRZ+tVt6LNNwWivEJz/9fGE9pP3GKeK73Crl1N7Mp35DIn4yVpS
 VB1M3yKMgMV1fZZ9KK4wY+L/25RN+zcCJLXxibaFwlwKhehdPonblou/F1YAltm87oERQDMMqaX
 GGuR1DVYh05GYLpDSBg+cXIkp9iWuhgdP8QLH4vZoknKSC+g9tuwESq6TM4SpGtgXCFwuR8oZTM
 iIZUbUwkIjjOqAnPDHTtbnELROybtjlEGj+UlsrX86PX9pguDM5e4n0bbAg6VUX4mLKWSsR5Y3V
 G2AZkkkDGBGMQ/YOAiA==
X-Authority-Analysis: v=2.4 cv=JK82csKb c=1 sm=1 tr=0 ts=69a82e8e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=nvRDalaNTaWZAukup-IA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: U1qdnefpHXOzNtyk_nxmW4ZuHJWt8egK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040105

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

