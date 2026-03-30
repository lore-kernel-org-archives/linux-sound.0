Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D3D3B3896
	for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 08:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774858915; cv=none; b=DyqaevXa91G0EZb+TnNrdaU5KnEUd/Wy3Cyv6NxCELAXvPoUkEpYlS4CCz/EbYqzp16xE68AqxoBc47GvJ2FsLmfMxnYHXZtlo0eqYycY5/As/2I4FuiYJh+/0RPs8tMgyVezWLriOKtxCf+WlWIYDUlKtM7nMr4mcquqvb0c1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774858915; c=relaxed/simple;
	bh=HcBUaG07YHPkjw7AtCbbPauazCJLhtW0eS3T+3u2Oe8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZIQomJtYFgpH0o+/+vMow/5ASwKQxYeiExg+2D4NcrRtL6osXPZS6hWp9VCNlGK7uG6X62GhwApSIZpT+6qw30eauM7wm+Rkvelp+ZhtDAoA/mAeVzQSQPWSTzOQMBcKwpZzscNizOZhsvgUrFv+COzZJ5gFNh3ZJVIQi7IOEqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DVa1vPa9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gKHsbLkk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DVa1vPa9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gKHsbLkk"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U3n4Jj2953401
	for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 08:21:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=K2FJHPPcvdd
	DuyFi5b9Enk3oj2KWR4s1Mi0JeIXu8dk=; b=DVa1vPa9Y4wBlOhXCMKHzVMAzBY
	Kz7vtZNCLU2TDiWtpr97zM4Q5yxljodCNoF2LvtMNP6g4AkOOaLFas04H0j0x89q
	/0Egm/ctAkOX8sa7qeoJ7bfcrjNzOSQL2ckCfFEiGJzVZDpdDfpX7Df6WgyvhSIr
	DoNMhmk+VEm/CfM0XiOG6WB3BDB/fri1Q3xsc+cvquVUVJ6+JMjxzTH2TQoVoKEw
	Bxn7qO5S9x7egH/hwWi2Hx8QPkWXY5qIgut1iZHwsNH8eL2LSUDvy8vym5ygpx2c
	GSK0bU9L+Zhy3TVswmmQnvay4E5eheAlB9AEpWkUZMpFlPcFDxudJkeVi8g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6wqek2g0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 08:21:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4987c698so72078671cf.0
        for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 01:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774858912; x=1775463712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K2FJHPPcvddDuyFi5b9Enk3oj2KWR4s1Mi0JeIXu8dk=;
        b=gKHsbLkkn3WCJHWEvbQIYufHSGlyQr7jq3p1LK2TuwE0MWbXGJZ6Wh+GAjYDJfiy/O
         PUvLBXlttrn1PteDIpJi/YZolE85Psgat46KchGFoVAgfRD2vtswBgW16OD08M5rsBUq
         8bf6krjwNHd05RIEZBwKftp9MjZ1fPttXMTzQ7U1iZIE8Zl7mQLKBTbW0hUokayNF8SY
         7u8dNRWXvX4589mreHEkGPWmqtXtjhXJeX7eixgDtzQAYZUhyABwMiyaXb5kpCGuLGCM
         X7evHBAddigVHQQ3ouaguzRr9AhE8tp6XXtRuMnto+yilII94l0Wd4r53FYFKhSc94hT
         yuaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774858912; x=1775463712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K2FJHPPcvddDuyFi5b9Enk3oj2KWR4s1Mi0JeIXu8dk=;
        b=ksRwm3Uhru3YpAT394+9ro78RQlqDUf+SFZWSzy/lTriw/KxYRBK+vF5iB8Ioc3ldq
         I3/L2n8eiuihRYtkFmZO+sQQp4ovtLVEp8LVsoB1YN9MGphPCEX3jDT83nA+SrtNrQBw
         rQQ+iN6jR25RbyliZWyqxjP429Ucu5RQ7W04r+oGEZx5cNN6uwlSZZM+qoE+8WWgaB/j
         JFhIWDr4TXhbuSztZ1jPAzH9ZeZMpzBZfzabUEpyirdolR4JuWL0nophhSOreTuLgJYl
         ytwj6upZ+6pgthKZd+utKE9VROX0zJqHwBg9glDoyBS1Ya5FY5Aw2URKlkUuTphkMe5S
         0J/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXbBX6TXCLXKXaOwiVwoD30FPmyLNX38DLPLqs7wEe5MZdj8floohVCau5RqeYROTHEBCkpn6SRA47e6g==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv9lqY5yjhBrihejJJldVDUApF1zimFR7URKfMLr5YCUL083+u
	nwhlF4oc4f76IPPJi1caEKj93BRSeQKYLZczApa0URnhcdwCBC44EIIAn7GDYdIZELwGTUJOkxC
	9twTmR6byYd0gb00EAT/qLjc1XVvlGWb840KolTMLZd/3w/46q9ASNE5qEHw9RLqwXQ==
X-Gm-Gg: ATEYQzzBusIl436sRhEl14x941RNw3o5GrM/Au5yEwAIAutACjm6zMJlwlFqQhk5VFh
	T/sxPbokyAVJkHuvlbgmynaryDcdQ8xcoK4CTMjd6kJbB1uBoBLRe1NvrjUtgc8N/p7FCLF7BYn
	OiF+yopuJ3zOGEwUZZ1jzHnwn4bv+1FrTZK3ngjX+EaN/joPpPLbC4x039EJ4T77YFHTEzoQcT0
	9ADY5Dn+CuD949Cs0ngRnlNBTcblIe40rFV77pkXHEeyQIULKu4NyfE1gp3TqpFBMLgQmnOdA7c
	jN3m8CG86IXv5cRzaNg8Pix9iUDRx0rUbtJA+JcNFc+Am2nw7zbFLBEt75+goUdT0wXEnpY1n2D
	lLKr2awrvubXz+mSJVnxFDgAg1G2mw4m9PVq1q/Y4aIfUQGJzNNFkTW0=
X-Received: by 2002:ac8:5a46:0:b0:50b:41ec:5e85 with SMTP id d75a77b69052e-50b993de828mr186876741cf.11.1774858912010;
        Mon, 30 Mar 2026 01:21:52 -0700 (PDT)
X-Received: by 2002:ac8:5a46:0:b0:50b:41ec:5e85 with SMTP id d75a77b69052e-50b993de828mr186876431cf.11.1774858911593;
        Mon, 30 Mar 2026 01:21:51 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf1db08e6sm26244773f8f.0.2026.03.30.01.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:21:50 -0700 (PDT)
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
Subject: [PATCH v8 11/13] ASoC: qcom: q6apm-lpass-dai: move graph start to trigger
Date: Mon, 30 Mar 2026 08:21:03 +0000
Message-ID: <20260330082105.278055-12-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260330082105.278055-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260330082105.278055-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Jo78bc4C c=1 sm=1 tr=0 ts=69ca32a1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=8udmP7N65bQo3KbB_RsA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: sm78mnwIxqsecSUOSxmX_FoK9I0Ln0Gl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2NSBTYWx0ZWRfX0SCsq+7xuHqt
 0bVGznW4o/dnyU+zmZOD2H9A3KAkT5VlyPA+dqrjY0TLtzZJdJ3yvtreOiQyO+OykNzVTi5dDyP
 jj2/mx7W14jtHwsXQ0PWmusnFP37x97eRWZSw7aR934Z8wjXjHtltgxcBVljdEJTdi047DcR0EG
 6eflazW7q8IHJFUv0A4jJrYUdcg22tz4vVCbtfN0ksqNuPtcLACrGk6r1uQMj5GNLCMB+Ws3+hn
 QTKqjGotbkibLUI7gMpxQZ47D0DkswUGAV4HTk4zodPsQRgCo0NfVtr7AvGk08eminx/oaUnsZG
 xvt0OyTaY3HGoJuxKP36kauXurLNc6iG0ksbv+PcwkJAOurYBRZRTomsl5hRPls1dazfMfUrkmF
 jDFB8R+1ppP8Cs4IN9aJI95N5h/BwxnFS0Gv1LJQzpyGZwCjLgr9j+qtf5Tuu0qn1gol58B5FCJ
 UqZDzwVaWuHcRE3nUZQ==
X-Proofpoint-ORIG-GUID: sm78mnwIxqsecSUOSxmX_FoK9I0Ln0Gl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300065

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

