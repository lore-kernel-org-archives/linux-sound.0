Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D293A5441
	for <linux-sound@vger.kernel.org>; Thu,  2 Apr 2026 08:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775117515; cv=none; b=iquYJeCLVnjDVdFWA+qqxjbKMAvV8Bpxp0HlM9mTzbHbJUg0WLA26PbmP4YuFvWN2pvE4N1CpzmA4xT+0B+zmxDFgm9weMFfRja4qFwmqplVtTnFZqc2bclcp5PC+2sogCdMsp1hhAu5Dq+Zu/CSO9MMl24o0uvYHJaofJYO35E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775117515; c=relaxed/simple;
	bh=1AGWMMo+ZQ2MpMqgndQclqL9hoOIddPn00jRigW1KUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NVu0DoB9FTYYWDo0haugEBPbdwWGmgx3OKki4MyX2uujHycSjcPXAbmAlz+0qh1tNdaGemcCH2E2H4WFmH3/iOxl/mojBpQeKJArW8IC93SK/wgaAQkvA/4Af3ABOiRELJRM6cNAX/qseHjnhbh0rOm78GXBBVG4xjfugwLTmRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MbP/Iwwk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XXo5RIFx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MbP/Iwwk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XXo5RIFx"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6326p2Cl2903829
	for <linux-sound@vger.kernel.org>; Thu, 2 Apr 2026 08:11:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2UA23pg+dGV
	Ambwz2ppXfyVdk6xlbVmq70z85L7JFXQ=; b=MbP/IwwkA5P/60aFd8tkjI+Wggg
	68f5Xrm5x+SEKkn0LU/wpgt+4NUM+f91z1TIPzo9kCj3cOstMHHCB6jXiKiUYbkq
	/NVKO9l+S06qVHNtd1Dm2D8Qt0j92y5Q2ZyQpS516JCUYvtDg0eLFZloTYszfOed
	T7Bkt8sCU4A0RV0jcrqa3ZEpLKkVmiruYYlFj+x/E4OJrwIkRJM9qHpEbW0USQvJ
	7P2WqFdAIe/molFcmYx/V4C14uHOq4/r73ZjZHOOzM0mv8rvs7XxwFinF/xmUfW0
	hhbEe6OR49yQeapdpKOkH9DircQ9gK6MQCTKJ5nQVF3dQBRHNRMlXnEQfTA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d954cbp12-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 02 Apr 2026 08:11:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5094ba09affso16097611cf.2
        for <linux-sound@vger.kernel.org>; Thu, 02 Apr 2026 01:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775117500; x=1775722300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2UA23pg+dGVAmbwz2ppXfyVdk6xlbVmq70z85L7JFXQ=;
        b=XXo5RIFxZLvbawLShlLl/h8R3xYBksbUucP9YQDzm+V+aoFgeQiA7FZ924MyZ9h586
         iG+CblDlP9UpZwoCM59UXvvbroDB7qh8bqCZEs0tpWeLMMuEHQFpu1IietR4IIDFbGvu
         dbaeC1M85D1TJ+pGtFJavG7kyEPG6E1BGIlGZsKOXTWgRieEMS4yNuHFpVtdKyach74D
         5U2g2VorMgaHRwuq9Ulkfab7Oq0Z0TOhqvqYcdbaB2c3zQwk6aTqdX1FXZXrmgf1Hg2M
         FLekyzgbe0EqXoMyJdA6ste3pJHLWFnJ7vhfjSCU6Q5Olr75ZZAUKQ1RjTdNKPzky2Xp
         A1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775117500; x=1775722300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2UA23pg+dGVAmbwz2ppXfyVdk6xlbVmq70z85L7JFXQ=;
        b=VXUHsbC37oHVo16dqzOIIYJos/LwZTyzTiVwq3Zp44XgylDo+SZgL1nLtcVfXUMVa3
         Vc5XpmAgKY+IxJUKRJi26yzruXBlTtjeJSmpFyP2Ew2U56DaA594wwW+2MpuqgwZufuL
         HjWKuggPLdZM8KfaBUmtvK+v2ltcLCatroZgH/G5X/ktD3S3uua6g5eYbnCmOjyF8A7s
         fSHGOhSfwCGnh5qeyhY0t806EasQFi/MyNWuu3dwZkg9du1d4V5/m33guxy4Qrb5FDlV
         xqeObXey0zRjWHTzxM5S8g+f9T4dWnHzfdw4jSM9kgCxaR1GzST+h+rfP+uspKYPU3J5
         vGdw==
X-Forwarded-Encrypted: i=1; AJvYcCWi2dtxurb6iVl1x2Lm51kcm+zkKfGWsQEU4RFbUTOHCz8nBchgtwBE0z2Us3t3+8jlkeMgMjoRAAq4OQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmKBA9j210uLCRDzufQUYzQsbKXDOPzTXElSA7rWKQYsgUqAzZ
	SkWrVORXPjV2mbzoNZYqE/o6+B6EJF1V5mAis+nKkqAjsTZNdhdKH2MHfI4M64vuJKNN8xkPGKW
	8Qkl2/dNa9tb7XL1mIXMvcjyyG6PqYs6YiLWQHhKtG+pclTOPneuhTnGZOBFaBh62ag==
X-Gm-Gg: ATEYQzzVQnsvjEXx8tU0yW9a1iK1JBh0gfMLNLsYY33/FFN+LIwNC8Nw9DXB3qQcerE
	pUVwwTI1Hcyiztre4F1/lgAf6mWTMAWrI5Ix3nbxrZ5kRDHcb7KhsMwFRxXo1ldTg0xxtO+kwax
	zuGMu+OhXEFsE0ghAVCPqPWLB9LPJX+yaVeCF+DMDwbeXB0yB8xXjAGqb+OSazjZDK5Ud6OiQgG
	jCXSZgqP2oCr3uxwnt+gaCCXswiJp889Tg73hTbzhzwVvDs07HvACsXbQAoA8K5plkG+SiyqktJ
	1MtG4cvNyOJ1nH7Io/nXyZGVMTmZaDnOukM2SwlCLV1giZR0/cSZXKVg90gjhrvrn/G6E/CFrjf
	+OkkeGMiFd2n36r9fHIMAhg6HmuzWRnuJCU0w9Bf01/6taPXW0Vi3h3Y=
X-Received: by 2002:a05:622a:8a08:b0:50b:7113:7170 with SMTP id d75a77b69052e-50d3bd858ebmr76936491cf.39.1775117500556;
        Thu, 02 Apr 2026 01:11:40 -0700 (PDT)
X-Received: by 2002:a05:622a:8a08:b0:50b:7113:7170 with SMTP id d75a77b69052e-50d3bd858ebmr76936211cf.39.1775117499905;
        Thu, 02 Apr 2026 01:11:39 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c3a01sm5712604f8f.12.2026.04.02.01.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 01:11:39 -0700 (PDT)
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
Subject: [PATCH v9 08/13] ASoC: qcom: qdsp6: lpass-ports: add support for LPASS LPI MI2S dais
Date: Thu,  2 Apr 2026 08:11:13 +0000
Message-ID: <20260402081118.348071-9-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WMlyn3sR c=1 sm=1 tr=0 ts=69ce24bd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=nvRDalaNTaWZAukup-IA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 9yb8yzeVp0oD_jyHg8geN1NK1FxBlk0d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA3MiBTYWx0ZWRfX/rbiaTDRjcSN
 Fdq3U2KzAOhDy/stvHAirrfej4K+NVR9gsqjjdnKtKK+GhRbI+81t+hNgfpHpaitEwR1iuqC3rG
 azcV5mbh4ZEVfexWoouBWDTn+H4G554+TCXJIw22dGOPN60ZrMWFpMkbEj7oMr5V8CWgnU7lyRb
 RDM+3akfm7Q5Qa40Hsso1YKpsI4ATLmNzsPcgJTLAAsHv1R1zNPlMNHlKs4va/OncSP71xLiH6E
 147UbML90K+hB8fUnFfIsaPgtp0EWlOst94Y6GveM/9iFbPIGiNLfDwb4I++EoH36BEZuTsLj3O
 ZzmY1HYq0dxaSkOkTzlu40xfHvBtDHb32TO59NCOI/svKNO+8lN3/4ScAD2PrLU41gTUBPA3tJ6
 7tVmEC3q/55bcckHBgiAZOG/g20ViCYGDOru3bhUHQ1OSwE/FyqKc/w4nwOsUC3vDavPi4J8S+u
 4LU3ro1iubytqQoT2jA==
X-Proofpoint-ORIG-GUID: 9yb8yzeVp0oD_jyHg8geN1NK1FxBlk0d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020072

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

