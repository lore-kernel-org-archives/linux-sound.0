Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678B243D4F5
	for <linux-sound@vger.kernel.org>; Thu,  5 Feb 2026 17:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770311664; cv=none; b=OYpaQJrpnA0WbFbsp33IX1bA8vgpyPgfAs4zZwK7tOmB0yZdoJdq5k5+mPF5CPn7q04wNnjvsMWuSSZLtX88qu/D7jz0ml5txMw6/R6xO33ZjT3Eex7aLLN1JALoYNbRcwYlINepJG/Drhov+nkAjBUUEqJvaoJCHhFws98Qs10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770311664; c=relaxed/simple;
	bh=r5N8Z8hPz59oN0RNuGapAQnXLzTPhHdzsNfJMM8N9DQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sZ8c00pQFKyO/d2QMjOvfJHRWinEe1y3oktJ+PvaPWvjdOWtJf2LwnmfD7m8H90MS69mtB+QI8+lF6babiiwNBRA60f5cmb4yJO4SmUcqhPGAm2RdpiDiARpILeVmW0vQt29yeTs/bN9Pty3nA8+x8fvYTazqY5Hh/sCya6hlkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zsm+aa+l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AnVMsGyX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zsm+aa+l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AnVMsGyX"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615B3tpn176860
	for <linux-sound@vger.kernel.org>; Thu, 5 Feb 2026 17:14:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wuA8VwYWX47
	mki1E5cO8ixPzJqRo9fgaXlZKqhxVW2w=; b=Zsm+aa+lqpY14jxn+95qMxfd2uk
	FeLzesTaQhhGrD3cOPU0I1WtzuJz2R5SDap2mpV558ESToe8jTe0KIKSWj0Z9QVn
	oAZgxRFkyGluZLAu62IO49naW+3sXSqu47HKp0a5ZTlRS7ksKdRkVz9tt+pFLNUP
	3tIUX9tk6KzBixQp3zf6BB8k9zLivc1EtQWwZm/XZvw6CrTB1aKirJhlRODO0EED
	ONMAIccduZyxnAvcyMzDBccP5kBYfcRKnmMbFcGP8/7NJwJ1+b/dQ9HDXy2KpOny
	TsuJ+fBcyWq3s5EGMlsV8WWFIvoXAbNDT4WyV7DAYJUTCLCSPLXTGOzGpeA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4t0p153p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 05 Feb 2026 17:14:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c52d3be24cso181518685a.0
        for <linux-sound@vger.kernel.org>; Thu, 05 Feb 2026 09:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770311663; x=1770916463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wuA8VwYWX47mki1E5cO8ixPzJqRo9fgaXlZKqhxVW2w=;
        b=AnVMsGyXJKdeVvygcGyrLjYudnYhpbAkQucQ16Sni6pVMPpMfs0Uxb47cyzqRuulpO
         aGiwL9dNNem/8SwrRPk/oWJ5FraJaf6wEoxuh3uw2sdphebhp62d09aMBcZPQxyy3zfP
         GgTWVN6uGZkgcv8d7dI8dGxj0hcZOjkrNrKYX8WhmILyuNyBdqdBJfzGKWixcWiAXaHG
         r0uLSKS/rG/pe5zm3i8/N+g58Zy/ZQ4AihzWz3Su771c7OHe6qNj1enTLJ2DtIG6QGfD
         QLTTN3SuGHrDZuOhpL0Gnz5gfBC2TsMIF3J7PNqdgucnEvlsrIvg8VssoVSuAJLN/PX/
         uAYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770311663; x=1770916463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wuA8VwYWX47mki1E5cO8ixPzJqRo9fgaXlZKqhxVW2w=;
        b=DZVk+UUix8VOeyX7aAUwl5WBkv1tgytiBUangWobXeJAgyJja0QVY79Jr4XC0PmgLr
         ij13FSoN3VWzxJwfmh6KwzHbXDcRZIJpBAaVWWz+az/S3aXRNgkSk+pvWzc8kyq92Om2
         vVlJcfpcDLNprJbypzK4NNTR2G38Yog+6QJDgWQL/BIBkH7Zc4EChehdBD+XJQi/tATx
         CdzRciAFnQ7ProTr2NyVngpQnpiE6QbcAKyccZVzYOM9lT0JUn4uAEEmiUn/kmqgUKx2
         o2vALUI/+76RulhAEDEAV4qesY4iimSt4CGQIeu7cJSyRYk6c0WW9khZIyVlRXFON+OW
         L3sw==
X-Forwarded-Encrypted: i=1; AJvYcCUs/KRdNnxX+haFU7vFsrm0CLK41nIAsqkczXj4t2vIQL+AqDJF4Vm4q38c9xVreg36U0rXS4aA7iJV2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YytBwFUEVNVSRM7H/Aq5N5px6s/9Z46KRK8M/G+pSc4SudxlIav
	ptY5eu9OcDeeBkynplczpm68XFrWT7BmVLUHACzWTsjX6toBXBFhr+3gUuyzbajotoyMZJvduAr
	M9am25pPrxp61p+2h87wr+SjQlOtRsF/HFqh2N3hIB2BjXTQan2JHUJM9oS2TbV9yUg==
X-Gm-Gg: AZuq6aJ0atGn2oxI7psYVhjKey8qMChSEohtNnL6mmCM46PCjEJaz+1sQQvOnlMCedu
	blDvouW6O7+dp3gBeiwLElA+fTdSPM89/Nef1xvqJPfgqDsDlztqShlVuTM870f7pkMtKkMBqDu
	MyzH5LjRhL9QINIbJo1MyowsiJSauOSXmftypbqqtCkxBKbFXLWbzpZbmUJ8BXkxFrjk9sq6sw7
	HgzKgHNbR0PAr4U0iwp87Q9LUpAoAlADpdYO7j7BU7rtZ7RS5AvctOXo4QZ4UHGfG9zphruZ6KY
	+RFQdAWuevI+gdroGl10Oo3LQFHCkje3w/LGjhjZHCJvA7SIfrfCA12C2NPtVuuMpWKuvF9fKG0
	hZ0ybN/RREk9A1yI+2hgf42CHiEbwoZp8SCyU65dBOiw=
X-Received: by 2002:a05:620a:4892:b0:8ca:105a:298e with SMTP id af79cd13be357-8ca2f9d98cfmr913456785a.63.1770311662481;
        Thu, 05 Feb 2026 09:14:22 -0800 (PST)
X-Received: by 2002:a05:620a:4892:b0:8ca:105a:298e with SMTP id af79cd13be357-8ca2f9d98cfmr913451285a.63.1770311661978;
        Thu, 05 Feb 2026 09:14:21 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43618057f87sm14802849f8f.21.2026.02.05.09.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 09:14:21 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
        cnor+dt@kernel.org, srini@kernel.org, perex@perex.cz, tiwai@suse.com,
        alexey.klimov@linaro.org, mohammad.rafi.shaik@oss.qualcomm.com,
        quic_wcheng@quicinc.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 05/10] ASoC: qcom: q6dsp: add support for LPASS LPI MI2S dais
Date: Thu,  5 Feb 2026 12:14:06 -0500
Message-ID: <20260205171411.34908-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260205171411.34908-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260205171411.34908-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ItITsb/g c=1 sm=1 tr=0 ts=6984cfef cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=NNISMICuKrt3OvTWregA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: QxjD2gnA9DJTsAg5ONmoJZvCXku_qbLk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDEzMCBTYWx0ZWRfXyU7MRPQQFigl
 WczbYQ7xgcfSf4iwKpxzRofmKfA6jzCtit92tH0xO53x1CpcHfsd9lNC8NfSduWn6zH4XfKDupO
 I+BqcbtVWArFb5mxCRNfczNYWUzRhTefLiB5nv1dt033beKfjOUrD1tnziD5c/DC1hQGBHcGskI
 d1/2yY/xwp6K6UCNaibjnE46DDJXOkxvk3q4LsjkF844xC4oseVp332uYsysKKhuGrRjO9jk/UJ
 /F2U/m3s/rxrJ7px4QM1Cb2RGKiX8ChvOIU/FS1K1cwQQUzxyF5DtYa+OWxZtwiUdE2UrAwU/2a
 adzIAavuAGFhm3xp2gK4ZqDSP8k+7+WmPDT0k1rLmGSx7BHxRJiQ/CYjdUMk6yGZvFSJDODeu0j
 GyE6B1vmX4vFMNabMTQKOA0bg/Khu8DxMtiT9cwO4dicoBMa0ohyaIDdqarqK6QzQphAfMtAE6r
 yAZf5BW0EK1MWmShHnQ==
X-Proofpoint-GUID: QxjD2gnA9DJTsAg5ONmoJZvCXku_qbLk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_04,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050130

Add new dai ids and dai driver entries ior LPASS LPI MI2S lines

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../sound/qcom,q6dsp-lpass-ports.h            | 12 ++++-
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c      | 47 +++++++++++++++++++
 2 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
index 609bc278f726..0febc641f351 100644
--- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
+++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
@@ -140,7 +140,17 @@
 #define DISPLAY_PORT_RX_6	134
 #define DISPLAY_PORT_RX_7	135
 #define USB_RX			136
-#define LPASS_MAX_PORT		(USB_RX + 1)
+#define	LPI_MI2S_RX_0		137
+#define	LPI_MI2S_TX_0		138
+#define	LPI_MI2S_RX_1		139
+#define	LPI_MI2S_TX_1		140
+#define	LPI_MI2S_RX_2		141
+#define	LPI_MI2S_TX_2		142
+#define	LPI_MI2S_RX_3		143
+#define	LPI_MI2S_TX_3		144
+#define	LPI_MI2S_RX_4		145
+#define	LPI_MI2S_TX_4		146
+#define	LPASS_MAX_PORT		(LPI_MI2S_TX_4 + 1)
 
 #define LPASS_CLK_ID_PRI_MI2S_IBIT	1
 #define LPASS_CLK_ID_PRI_MI2S_EBIT	2
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

