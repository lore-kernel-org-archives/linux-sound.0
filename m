Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71D9381AE9
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 22:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774305552; cv=none; b=SoU46ZNRHpxLsOJFblBQCHZ+2j4/zrfZ3q70KqxmlOPIVflNFbYg+HPFBmy/XE56egEApkCZtEMlaEVV+njXEqNdIPtz+rrfkazR68Azjf42lnjM898fFM0HyjW7CGGGOMjbeiDB4CWPQ9RtCJNEhkD8NK4bskiU31dGgfB5ZkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774305552; c=relaxed/simple;
	bh=1AGWMMo+ZQ2MpMqgndQclqL9hoOIddPn00jRigW1KUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c3aTgMa/xXAMfjzR+9mQBpSng+xVXbxTarbv8Sv0kQp3Dx9pZE1+jWPGhEbPpIGBSMWExwNg7h9xsxEYqF/rZcc10KUqwh0+eS/YTnrn+8A7I4Pq6PbzLBbo8RNIfll4gnC4b8fj321D7D+nc8fuGMUhqcvP4E6eLZ79FreeNLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dq2fpmPG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i8xtVjUI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dq2fpmPG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i8xtVjUI"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqcgV943589
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 22:39:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2UA23pg+dGV
	Ambwz2ppXfyVdk6xlbVmq70z85L7JFXQ=; b=Dq2fpmPGHg+XusYXLCZhkgCSRfn
	kvjCg0IXB+NQdAA7kMA+Aee/E/2oNxlbSXEuDXaLGCYPaXqEOEBxroblOLvrpCIx
	vGu/WQjXhDTxO7+iBHLABOgIQFqDPtnSoCktXyKYFzrN7dON0MxnCpCHmejZBbPN
	paDTbsLyGctmT/8TvKZ5GzQ+QH7xGM76i8KtToMv/3yKminwlNDQwHkytnOkg6Wn
	2CC/o6NXtJzdZjAKuT5R1UN0BNfbQc7xSu7g6uMiCQC9J9ffIHIY3E97zf3Mx37u
	bZgXx+s95ELkg3k10ANG9hJh97qSUBnUH793Q72ESaQXu5iNeSdstptg7HA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d34vkt57k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 22:39:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb706313beso97389685a.3
        for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 15:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774305549; x=1774910349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2UA23pg+dGVAmbwz2ppXfyVdk6xlbVmq70z85L7JFXQ=;
        b=i8xtVjUI1yoEZ2akBMOmS7JN5PSlNhqZktDb9RVa50WImxvnva2eblp9a88+LWVx5M
         2Tu1DWtFuNRJyGuvvPJVBK6J+8hWaiFCFn27QYFDgQFo5heoVne3WNt4QFoZvoz30/ZE
         KluOvRB/o9R8nHDarFL8TD2ffxfKx5L+BbomJFh4zSpHj100Ui0qI+1f1pGYz4QOmQMS
         XcsTVbAim5rVCivnEnKC6qzxErovGZBX7rKlIgPz+eu9fED2D20zIqy3FHTgB7yBxhIV
         Pc1Dy1ap2K7UFzWpKUhRfGhPxR/BPNd1pYmd/oJOA8JAOot5hTu/izn0jM6GoqIjNfoF
         DmAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774305549; x=1774910349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2UA23pg+dGVAmbwz2ppXfyVdk6xlbVmq70z85L7JFXQ=;
        b=mk4Hr2zE5SZ1mZR7bRpfZpC1vlpDu7m1PrPOF+w636JZ+atb6Gkr8eiD4M1yRtFLwd
         Oigb1iUhIy+rTpxPnru4yc9hUzubU0DnqQ83dRXkK+G3so7NN5BXYtH7pv0M48m9ZKvT
         0fbvjgSdUHGuLniH5+RkAxuC9pveLVMXBWiX9cIGufingie6VrDdZCOtent26w/BJpa1
         fx+h0g9RL4BtuwyDt/iNDAsZpmUcjYHqV8tRuT313rVx7KehoASlpyLTh4E8oK4NJY1l
         NrZoGahO/pKedLdMQ9ATCqO9+J9UePJQt4dxYQkpH8M0MPAtwL19K+BMtOHcxudhOiTU
         1uCA==
X-Forwarded-Encrypted: i=1; AJvYcCX23DMBlazVcormynXvU5ozGANPmRPpm8alehNyxMblLATYhJuSx/VJTiEGUigJ3bUitH/6pkEgM6uJWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkPH4ncYS0qmHJllHwIk2pkJxqQbhU6nFqWJxZnrm57IblIR7I
	jbSIKfwGy7RoR8m2hjCHVC0YmPCeBng3nAO17JaZRcyDGBV+QuRhdBJYsVROJ055Nz+dAY4vxU8
	SB1eVCl/xY16taEwDO7m06rrxb44lACFzIFMeESmsf9/bHMH80reo9tOLeGJ8s0xknlqmpxry/A
	==
X-Gm-Gg: ATEYQzxsGWjK0EtFOV/1kbrb2ZUzP7F9cbX8IiHea8NjtRtSdE/2nIUn43x2r4L2lop
	7Zzk9xznVWdI2jlTrTsOo0RueAxKRn9ES6CbYSE8tbhIlECA4b62Zc1PUaS/d9xHBxChMqr2PSF
	azcF9ODEJZg8GoD5sQ2Iw1Ps7K8hw1iGKRc5JPGSkRbI2XfGaRTd8QprvPt46zNbC5O7PaNZriL
	++570rjkYZCEHkqAXSxmsN4z0rykMK5vrwq0s7FNDWjD/63mw4ECewtQcPaHE0AVGLqoY0J8CsD
	MWye3sZrwe70S5ZGVysHiRu5rHURH/HYXfk9EnCmMdPS+GuzMo2hgdPLH3RjUwzduDTsZwOzfdC
	MbVUdAJRWcvnNYAB6TJVKQjaxd/VrtYhztBaZXnutluCIfTtl7IlteYE=
X-Received: by 2002:ac8:5f52:0:b0:50b:6a80:ec17 with SMTP id d75a77b69052e-50b6a80ef20mr43577871cf.40.1774305548808;
        Mon, 23 Mar 2026 15:39:08 -0700 (PDT)
X-Received: by 2002:ac8:5f52:0:b0:50b:6a80:ec17 with SMTP id d75a77b69052e-50b6a80ef20mr43577571cf.40.1774305548257;
        Mon, 23 Mar 2026 15:39:08 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64715539sm33320351f8f.33.2026.03.23.15.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 15:39:06 -0700 (PDT)
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
Subject: [PATCH v7 07/13] ASoC: qcom: qdsp6: lpass-ports: add support for LPASS LPI MI2S dais
Date: Mon, 23 Mar 2026 22:38:39 +0000
Message-ID: <20260323223845.2126142-8-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE2NyBTYWx0ZWRfXykFvzl4sIrVg
 bra2jy9q9dZAheh2SgKw3lxFxhVri2KVbAPmbev6adviwF0ZC5t9F2IjQhSQJgH9vfIq6KJrR1/
 fHrs5TObUGeVB4sj81BsO7tzTpTqXluuIKy/ofJIkpX33IfgFwIhTuyrLv2KatlUF3EFrvn3zlx
 7xorgGTTctu/WMcfP4xAA2u5yLnfqKWa/8FlCx776OogljBfB6viVwx2EfDjFsXvlVbfy+6XT0q
 lav+s3yqUWvRTjv3n09621jzOX2+LRZr+peERRAVOBfM07yokinyHTxeNe8FrvK/Mo24KHGREeT
 1+/B4oJy7QEIw5ls+SB04cnWfPE3ONoYk+am5EtTCLdU0f/LDBJoCGkjFeIb9Uz6CTaCcxZftIb
 VVxoHuZtc8NPY3/tlD8ggl+wFmuM4CE5G6RURDtZO2y1flTqCKgXLWGzVLzNplwHj/PvVPGgFiC
 1fzkgRoMEavn0ewlzqA==
X-Authority-Analysis: v=2.4 cv=eMoeTXp1 c=1 sm=1 tr=0 ts=69c1c10d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=nvRDalaNTaWZAukup-IA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: iLHYUs2CNsQ53ha8TulfO7vQlkazknFR
X-Proofpoint-ORIG-GUID: iLHYUs2CNsQ53ha8TulfO7vQlkazknFR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230167

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

