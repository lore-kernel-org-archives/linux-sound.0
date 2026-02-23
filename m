Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFAB340D84
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 18:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771870092; cv=none; b=L2Buv1ErpOwARuv+xcL7Ep+XaQtGSdvDbQ6dWYY2gjo9Ql9cRjiJWY+s3QcFMWVOFF0JESVhPba2CxJ47TiIIx0x2rsXtjKeDub/QS2mCNOJwwJlPrgWelHluKXT/mSmA886ZetUq77IUg7hBSbrSJMiXvRtaB73y3JMcGwtYH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771870092; c=relaxed/simple;
	bh=of9TZhkCmOwqi8Av+ZalSsyqicycETefd2AuDqb8z5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iFSPfhumi1Lg+mI7yKq/r6t5OQC5ryVg1IW1ZYeMCp3abuMe4jGuilLbFJjS5J7r8ma4HxYpYAb2ZIgOHEjNcF/C+7ygSpaIHaw46HZ0YMbz2nUIm3z3u03YLnJ1fmE5D+safnlKhknuQGl3YwSDcTWDFRIG75RCg9RGzoLesSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LMn/BEuo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B7PFlQ0H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LMn/BEuo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B7PFlQ0H"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NHxmYa322212
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 18:08:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Fo61YxjbYF7
	2rFe/cKgeODqKXT2h3ZvNykR8OD9jyxM=; b=LMn/BEuoelk5HFYK0HYIghsC3MI
	uZfD3nom29430XxF7Sm1zNTXvu6kMrsdKKgN9n2RnwyY8mk3AAA/fHBCCRFzFbmY
	fNUhXQ5e4s/hG9oc+80p7q0ym3dS39ccegvVcbq5eaJaB01XU6JKSCkt1mZ8ADhp
	2htBu0cwDsqSHL9PJPdfpHb0Khal4N2pwzVN5JGi9Fu/Gyrd3N98XKS6FVKJ3wHn
	3hUgfjMT7XPswFVZSeDT+vyrGfA4dRKWAj5tpzQ6PNoq9YjGPJTIEpRfS8AzBsOG
	OGT0L0zq3ALk96RCRcKe+AsFAim7NWDNUWOPgNA18Wsyr3Gt2Tgb3e1IWAA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8y1e7p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 18:08:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c882774f0dso4187415285a.2
        for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 10:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771870089; x=1772474889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fo61YxjbYF72rFe/cKgeODqKXT2h3ZvNykR8OD9jyxM=;
        b=B7PFlQ0HBb6gQjQikXN0qCdKy0Y2WgwSNBVJYdfYULJKBTOawzZ+t5qZcDXx786bD3
         N35Ndk3yF096E+6gE4IrRhD+T9jgEMhMU64xH8Lpw9Ep9FgJ/IJBNk+RKcQ4qVdamIXP
         VmmQ6Cpw0TmWdt9VcxnaiJ6T8wlmNf2VjG9IZlyL+oYi+uKRTIpCtRGGHZTNbYccWfNV
         ZlHX3ZK1jHV8DnoM4alLTCSQjmP2rUCPKUjdOxSGFbVhkMj8M+sjGfFgy+6Rzr+G9NYR
         tXuA6qgQv6mPbasA3XUiv/3lwvP9DQv391k8s+JS3fxjanlpe2rjvEp1bcEgKFQJSf/3
         9RsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771870089; x=1772474889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fo61YxjbYF72rFe/cKgeODqKXT2h3ZvNykR8OD9jyxM=;
        b=KiZiGXXK2gz6R6LtZrN9S8XxZd4XXjm/SccNhG/DcBFGVoZIHzkgfwavwAn+KA+2xi
         bNj5guVNVp9NB/dJMvX57gM26WzZGLkNvnY1fIE8ey1JuoA1gfGNZ1iJotnAtAPg08nX
         cGUr+jMq2Wf8tUg7eSRTM+JFXwquw1K8etLJlZ/xuJSxao2acn2FfRtNJI2GrEgEXvtt
         T7I8/v6t8yumaxCsG4kecAioMw4pkU/oSrPGq3R22K5eduC8a3WcTP4eUu50nSYfjIuK
         PDbj1JGTdisKsu/Mrg9Jqvzh94X4qmr/G3H/+Z7Yrvc5oA2PLVbZ2/sitW5W2YqxiOO7
         8jjw==
X-Forwarded-Encrypted: i=1; AJvYcCV/uSbjQg9i0cfng0bzMriFN43KfYHm9W2+/BR2p4sQ1P26F+Z/sksCEJkUs2qBUV3ZXWxwzMIMVD0IzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YymkIEUjqCb0AvjY/l4D6BSBSm+zKdCGEDg8kG7muTPECXwobFS
	+bGLakU5BvumcXCHMZf7xFKr8HfrhDMdI+PDkO+zfuNCQCfT2Zg+syvHvFfElUJZUSQlj39GiYB
	58ZkWubnfez+9IAFkZ93LrLB5lAe5UUcLaL4BOnZVraQV9fFE8CGsGc8fv95uv4kmkQ==
X-Gm-Gg: AZuq6aIsg6bk42qRgnrA47OOIHIraD/35eWeO1b4eBlJC5PPhcOoSHpHPd7O/MuVIvJ
	NdqrRPJfeXOP3BNcdZgRfAaU3e96Afm4mLrq0LRo8MXbozh8poV+J2B35M2m9HYMiVfKoaUmjSG
	e+35vPqvWuRIxhqtdQ3GjaSmleDD+qRgkG/f1nc9CER3b6PiC784F9w4bYMOtF7xIKRcrduurzM
	ys7p+uXDFltB2K7uduxJaFHGAPar2BKJhFBDwae0sq14dAwX5Cg6nl2WE7y1qiZWZ1kPnBynyGU
	VwFYL5nU1y8PKhv1FxN58TsHwx+2SNwEgQ9sd3/intRAEoNi89IszSVipibZOjUS4Pjq7GLUL5V
	MjL3hhssGXGA1pTJqXo4x4mqp+8PrQT5NZgTboD8Lmqpj1xOc8mfd8+s=
X-Received: by 2002:a05:620a:1a07:b0:8c5:4e48:c908 with SMTP id af79cd13be357-8cb8ca02f8cmr1203871685a.27.1771870089275;
        Mon, 23 Feb 2026 10:08:09 -0800 (PST)
X-Received: by 2002:a05:620a:1a07:b0:8c5:4e48:c908 with SMTP id af79cd13be357-8cb8ca02f8cmr1203866485a.27.1771870088753;
        Mon, 23 Feb 2026 10:08:08 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d401aasm20458574f8f.23.2026.02.23.10.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 10:08:08 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 12/14] ASoC: qcom: q6apm-lpass-dai: move graph start to trigger
Date: Mon, 23 Feb 2026 18:07:38 +0000
Message-ID: <20260223180740.444311-13-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE1NiBTYWx0ZWRfX3ljkvgbodpzj
 3tBKd7gkeHl01WtDrUG6WTHOEpCbYRq9fK7B7wlsqt83t4u5el201C3zRt3i8oXU5AUO9ae771V
 F0+GBNW6U0VjEDSwrHSwUBKyTUP6ZeHeKrYELxIv5F6H4wRAcyAjA9a0yyKZQR9iCPoSy1zvoPN
 wWcn6Y8X0gPG4btnikCdkEdbHsSotJ1lPw9Y0N5uaoROAE1gRRS2+uwifQK/DUcFwscKOa6G7Ez
 OMHGmNSKiYbc0aRp/uDU0feXQyWgCAM3EubXIOzEpUBfzuQDBcW3IaRz93q/m/C36CjWCVZIYJR
 J2Qm0dgFh0Y0ln57d/POeXUQrT0G52nwq6M6dIJ77sAFm2GCHRVKGDJoColXHWcIw5IOI/YABC3
 XBqsJrycM+UTjmET0ARrTqWoG1pC4VeCiJ3w0FtekrwemCFh5/QKArnRoCqthjtRFokmVDaoC8T
 xHiaW+hjNms6ABYsk1Q==
X-Authority-Analysis: v=2.4 cv=edYwvrEH c=1 sm=1 tr=0 ts=699c9789 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=6WiqhGXfW3rOkMpHEiIA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: t45I26_vV4d_E08sfufgXId1ZCSlzOoU
X-Proofpoint-ORIG-GUID: t45I26_vV4d_E08sfufgXId1ZCSlzOoU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230156

Start the graph at trigger callback. Staring the graph at prepare does
not make sense as there is no data transfer at this point.
Moving this to trigger will also help cope situation where pipewire is not happy
if display port is not connected during start.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 39 +++++++++++++++++--------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index fc246485e326..21624a2803a6 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -159,6 +159,30 @@ static void q6apm_lpass_dai_shutdown(struct snd_pcm_substream *substream, struct
 	}
 }
 
+static int q6apm_lpass_dai_trigger(struct snd_pcm_substream *substream, int cmd, struct snd_soc_dai *dai)
+{
+	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
+	int ret = 0;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		if (!dai_data->is_port_started[dai->id]) {
+			ret = q6apm_graph_start(dai_data->graph[dai->id]);
+			if (ret < 0)
+				dev_err(dai->dev, "Failed to start APM port %d\n", dai->id);
+			else
+				dai_data->is_port_started[dai->id] = true;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return ret;
+}
+
 static int q6apm_lpass_dai_prepare(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
 	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
@@ -171,10 +195,6 @@ static int q6apm_lpass_dai_prepare(struct snd_pcm_substream *substream, struct s
 		q6apm_graph_stop(dai_data->graph[dai->id]);
 		dai_data->is_port_started[dai->id] = false;
 
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-			q6apm_graph_close(dai_data->graph[dai->id]);
-			dai_data->graph[dai->id] = NULL;
-		}
 	}
 
 	/**
@@ -203,14 +223,6 @@ static int q6apm_lpass_dai_prepare(struct snd_pcm_substream *substream, struct s
 		dev_err(dai->dev, "Failed to prepare Graph %d\n", rc);
 		goto err;
 	}
-
-	rc = q6apm_graph_start(dai_data->graph[dai->id]);
-	if (rc < 0) {
-		dev_err(dai->dev, "Failed to start APM port %d\n", dai->id);
-		goto err;
-	}
-	dai_data->is_port_started[dai->id] = true;
-
 	return 0;
 err:
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
@@ -254,6 +266,7 @@ static const struct snd_soc_dai_ops q6dma_ops = {
 	.shutdown	= q6apm_lpass_dai_shutdown,
 	.set_channel_map  = q6dma_set_channel_map,
 	.hw_params        = q6dma_hw_params,
+	.trigger	= q6apm_lpass_dai_trigger,
 };
 
 static const struct snd_soc_dai_ops q6i2s_ops = {
@@ -263,6 +276,7 @@ static const struct snd_soc_dai_ops q6i2s_ops = {
 	.set_channel_map  = q6dma_set_channel_map,
 	.hw_params        = q6dma_hw_params,
 	.set_fmt	= q6i2s_set_fmt,
+	.trigger	= q6apm_lpass_dai_trigger,
 };
 
 static const struct snd_soc_dai_ops q6hdmi_ops = {
@@ -271,6 +285,7 @@ static const struct snd_soc_dai_ops q6hdmi_ops = {
 	.shutdown	= q6apm_lpass_dai_shutdown,
 	.hw_params	= q6hdmi_hw_params,
 	.set_fmt	= q6i2s_set_fmt,
+	.trigger	= q6apm_lpass_dai_trigger,
 };
 
 static const struct snd_soc_component_driver q6apm_lpass_dai_component = {
-- 
2.47.3

