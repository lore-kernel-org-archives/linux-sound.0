Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B993CD8CE
	for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 14:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774018186; cv=none; b=RAPUNsGs6C5g8/tyDeEKzSSuf0CVZ9kiiYwdZeToH29L9CCA7rU9vr8CuiBvXoPCT58NdRxo92IY/6DvZnMJYo8czNXUOeXhJMz/1oekMXXQL0JB1jHBqbZINzqk2Zp4SMK6VFeciqp/xIF8dJn/xL6eLClzQyKOeyJ+sPkOQSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774018186; c=relaxed/simple;
	bh=HcBUaG07YHPkjw7AtCbbPauazCJLhtW0eS3T+3u2Oe8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g5in8XJVYOCkeog9gzdIkjCcrOvq9hUNCkhl0SUbJdxOQR5s4tVMIKEXsmbKt3F8DSKka0OWdrr9wREkp8AEFHZfa/R4rak9qQYLJejKQjlnGIPEv5c+4NOYI6zGt/gGugkev2Fa48BQyBJWgGbvF70mAOm6xALmX3HPS0943sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IqWS0ATE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LjBZHLKy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IqWS0ATE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LjBZHLKy"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62KEhL3i331930
	for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 14:49:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=K2FJHPPcvdd
	DuyFi5b9Enk3oj2KWR4s1Mi0JeIXu8dk=; b=IqWS0ATE2IIUT2Zo0bm+ufMAxEQ
	LYTadGvd493j/mY/tSJSsFolB6nnJyftoJ7wTBSqTDfViClsUL76F7s4Yc58Ulb2
	YKpRkjIYaDXS7UUavG4liHS+YF+Ng0E25y9DE71WD/sEqn7ng29brVKlRo1WbecD
	tT2J87vn1G07V4gaK8wD/zAhgUgvuUJsNQb9TidLocP64WEDwOF8UdWlqCkQwwym
	9ZIVTdMciP1/EAcEsk2USL3SRkA8dezPPo+lNF28EIspcJYlcbQK8PtlqHTR/07s
	vW6QekB0NsL3n/ESOM4WgZ8MoEBmroxuhrU+jYcxxO3RS33lb8otZeB+stA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0k083pca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 14:49:42 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5091ee9f1d8so175428701cf.0
        for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 07:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774018182; x=1774622982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K2FJHPPcvddDuyFi5b9Enk3oj2KWR4s1Mi0JeIXu8dk=;
        b=LjBZHLKyDqZgsyViT1jNc51noRRYu0dyAPHO337bYPG36bMlplkcs6KdOtglIxTB8i
         MKct4lo5BeAi9rPsqY+ZmtG3UYx8nVYK5c9uEu1ki1uiIFP057mlwFemK2lsxXDKF3XD
         fVPXO2zqKIMy/X5BM3BaW/0M6e7TD8ElbsrjZht6GwZCNGROTOSHo8oZT9wr+8PG/H/Y
         sh5+9TTZprMR1wehH4gLaSXgrfBVcGQ1+IVFGxaZ0KEnVBfFippocLUXlC3FIUM/pjyG
         Tidqwgc09e/tkshJCPqHPcwl5+h8IJTN49jHWkqNu0FNnSXnQ0Hgd+Cj6p4PvEDYBmll
         RmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774018182; x=1774622982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K2FJHPPcvddDuyFi5b9Enk3oj2KWR4s1Mi0JeIXu8dk=;
        b=S6R+Htu0NTNqfpE9Soyjgmr+cN+YfnD9ljo1ANfGzkvIi1hTNCaaZFwxIoAvALARob
         AqrJe7xnM2gMtrumRcBGYFnVuR0HqlRl5iytwP6IsCekY7dizCtXV7esnBMM7wiR6bZY
         khj+3cK+nW/LB6BoWYHKKSpshqlrxdEzq1Rz8y0T4M2PllhK3gjR1ntMCvobDf3CmuXb
         HyVcFAToGMI85dM0eWdDaWczH7szClxseHon/0lh8R9KbqqsHjvK/qnrCqS+m8ElMf3j
         tgIWxDCXZhiDw5q6AWirRNlExiv4t9oOBp0UDke37fYnAR/NUYGFWEP8oWjpaIvj58cO
         YlUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDuwGBWamfFYoMHxqd+Zkan+m1nPnWBO1pBaJNxaYYaFqZJbRejpnfA5vXUZ25VMDTDAAx0oo620gLDg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2PXCJXrOldfJ1cHGTwtWj1ARrdmLuAJ+RZpJGIMkRmp12y0lf
	Kz3njK3W4cNYQJCHo6biJAcgi3pN3pfnIyih+d21jEfM+8JTCftP+CFj7TidOH6niiXMAxy2dHb
	1nAqd2eX0DKfrnQW1N2tXaV9iSASulL+jG0AMtmuK6iZGYqgVU5cBIZx1rVzWVrc3nA==
X-Gm-Gg: ATEYQzwr1GDv+htsNTcRQD1cIRaf8W05TvJprNkNBWNOndHU/OOfvdlxe+cSthgxmjw
	IEnNA67q+FKfTtcisJ3ONXM+mSGhwWe7d4JPPk0Sj0i75+PIagJKXsT/GJBQdTL/3c1EmYwETZk
	h7hD/khRGDxEhx5L3YB5uNxvm9ALFcnZx8bxg1Tw8HrBlY2F8+M1ryRc25Fle30MWU23qUtNbzb
	gyNlpPmq/x8kU29nH1x0lg7MBI1L4H/lX3HvEFWdczXr4lVmgoMydGKJhhjMGI6VjGejwjEZ07l
	eN60YaWEmi2pFTXGZbVJ6SgN7Hgdej2nQ8VOgK/6zTmDYhFXzjw66JrwOh04OUWeYxpgavosxKe
	71XrLJCwBypFWKEPSsVfEKKBhyB93q5k5Yj4bVEX89On6SgvMTrUENE4=
X-Received: by 2002:a05:622a:130c:b0:509:202f:f03 with SMTP id d75a77b69052e-50b247ad184mr105792221cf.38.1774018182334;
        Fri, 20 Mar 2026 07:49:42 -0700 (PDT)
X-Received: by 2002:a05:622a:130c:b0:509:202f:f03 with SMTP id d75a77b69052e-50b247ad184mr105791611cf.38.1774018181640;
        Fri, 20 Mar 2026 07:49:41 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff109b95sm47906825e9.1.2026.03.20.07.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 07:49:40 -0700 (PDT)
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
Subject: [PATCH v6 11/13] ASoC: qcom: q6apm-lpass-dai: move graph start to trigger
Date: Fri, 20 Mar 2026 14:49:16 +0000
Message-ID: <20260320144918.1685838-12-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=MYhhep/f c=1 sm=1 tr=0 ts=69bd5e86 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=8udmP7N65bQo3KbB_RsA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: z_j-INcNUjf_hMbKrlpMW8K7w6qqzTIe
X-Proofpoint-GUID: z_j-INcNUjf_hMbKrlpMW8K7w6qqzTIe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDExOCBTYWx0ZWRfXxs9q+/GD7X+3
 V0qy61sBuxAjaApHk0loTyF+k6tvlwzKLoxHga0wZI1+677x9OIAVHxdAUxtuOMGGNyAwHjXb/a
 YTG2RGgII5NeBhBYGpdpTxv63ryrFGpesERin/3TT74QswTApSMxOTsNn9ezqEomMWreP3UScWo
 rfeMiO6qqvhkgWut50JDIcRXQBUwr1cjcJ7BwQiObMLgWXA1hoQUDgcbPCTycKrPNf1ZYJClINY
 QFtdqramgQ2UVJZDvhOSr+/Akgm3QIHtMTnIOOUnfsYjhEyyWGginr4BN3bXEpdvHpLlpSAMiQ5
 q7j2Bg0vPia2N6gR5jINsqPwmL/JvuekjZ1TKpXUtrpiDwRjvhc1kX79GdwwTq3uga405hxwcey
 MY2lrshMvPwSnRkClhOFiRm9/iEStHbtMIMPtIgdslMiYx1it0uJ1OFujd8MhBK9qNjOXSU01UV
 L85CAnk4eux9NJbx+lQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-20_02,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200118

Start the graph at trigger callback. Staring the graph at prepare does
not make sense as there is no data transfer at this point.
Moving this to trigger will also help cope situation where pipewire
is not happy if display port is not connected during start.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 40 +++++++++++++++++--------
 1 file changed, 28 insertions(+), 12 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index 87f6db12003e..e904066484d5 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -159,6 +159,31 @@ static void q6apm_lpass_dai_shutdown(struct snd_pcm_substream *substream, struct
 	}
 }
 
+static int q6apm_lpass_dai_trigger(struct snd_pcm_substream *substream, int cmd,
+				   struct snd_soc_dai *dai)
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
@@ -171,10 +196,6 @@ static int q6apm_lpass_dai_prepare(struct snd_pcm_substream *substream, struct s
 		q6apm_graph_stop(dai_data->graph[dai->id]);
 		dai_data->is_port_started[dai->id] = false;
 
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-			q6apm_graph_close(dai_data->graph[dai->id]);
-			dai_data->graph[dai->id] = NULL;
-		}
 	}
 
 	/**
@@ -203,14 +224,6 @@ static int q6apm_lpass_dai_prepare(struct snd_pcm_substream *substream, struct s
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
@@ -254,6 +267,7 @@ static const struct snd_soc_dai_ops q6dma_ops = {
 	.shutdown	= q6apm_lpass_dai_shutdown,
 	.set_channel_map  = q6dma_set_channel_map,
 	.hw_params        = q6dma_hw_params,
+	.trigger	= q6apm_lpass_dai_trigger,
 };
 
 static const struct snd_soc_dai_ops q6i2s_ops = {
@@ -263,6 +277,7 @@ static const struct snd_soc_dai_ops q6i2s_ops = {
 	.set_channel_map  = q6dma_set_channel_map,
 	.hw_params        = q6dma_hw_params,
 	.set_fmt	= q6i2s_set_fmt,
+	.trigger	= q6apm_lpass_dai_trigger,
 };
 
 static const struct snd_soc_dai_ops q6hdmi_ops = {
@@ -271,6 +286,7 @@ static const struct snd_soc_dai_ops q6hdmi_ops = {
 	.shutdown	= q6apm_lpass_dai_shutdown,
 	.hw_params	= q6hdmi_hw_params,
 	.set_fmt	= q6i2s_set_fmt,
+	.trigger	= q6apm_lpass_dai_trigger,
 };
 
 static const struct snd_soc_component_driver q6apm_lpass_dai_component = {
-- 
2.47.3

