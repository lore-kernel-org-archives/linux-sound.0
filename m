Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD427366824
	for <linux-sound@vger.kernel.org>; Mon,  9 Mar 2026 06:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773039120; cv=none; b=gVX7KJ/jtjvX2mZR/pjrb3bUAh7VLuYiTtqY8DbyXc8t0jpjqg87Op10pp1oq011/+TbyogMjguRaPbsQ65VVJZ/Kl7ihqeUtk3W+5GUOtxNtxfYy6Fw8P/gn9fAJLMLVou0z9rtGu/P2gwnfkfg0zIPfpgqV77pJJGqBviYHrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773039120; c=relaxed/simple;
	bh=B8mb+C29aHmXpiZ0KkyuEWv+QuyMzs+RA8VA08jucnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MFwOu1vYZYakO8l34VK+0GHtuQ4N9++4ANbpUme2pFSNXn3p/lNWWXjzN4+ABeCuLHRnpGcsGe7vzUW1xLcSfhkPo5BO7TE53BTngyLfv+4gtHQi/gQihZIuyt6YruBqMLfGYdWENqGOCDU0mll1WkfD4uX7pnRqKqj2b7iuod0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N2d/YJuB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZcGvT+ee; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N2d/YJuB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZcGvT+ee"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628MxmMu3462729
	for <linux-sound@vger.kernel.org>; Mon, 9 Mar 2026 06:51:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aC+um2a762g
	fpLWPhHdIhYlAN3YczWO4vgnfj1X+hyE=; b=N2d/YJuBs56jlxVkNwleuMJSaYK
	NgP8IuYQ5GQOaXC2SDLhxAbfE8NMx5/EJzpk+FACga9WJcLVEdP30fEUenug2equ
	3hK8LwQze03kg7WqCQXlz2fOJAWJlAhT8ZstTjC11hb+ICYvSsmFI7+Mdt/nJ//9
	y4wxsTJfPNJh9a6UIrlDPtRRuI3wnTJbvuUn2Q4utXsDswCxZFlArD2wjjU2rOgc
	f6ZaLKOh8q8gQo+uNS9Iq3E0epKgdiyqMiOURoqaKazeuAS1BeGVXnXGu27OMsrq
	OGOuuq5j6pK3b21anaL+Yiou7C/75mPNCKlNZgtTFw5Royp3kdIR1uth9SQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crcd8c4ct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 09 Mar 2026 06:51:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd900cd3a7so42639285a.0
        for <linux-sound@vger.kernel.org>; Sun, 08 Mar 2026 23:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773039117; x=1773643917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aC+um2a762gfpLWPhHdIhYlAN3YczWO4vgnfj1X+hyE=;
        b=ZcGvT+eeaatu/EkhxaWG68MDV/ZcidHRRK9rCnxszfqc9e/86+0Blu96DT8/Sl6Ocb
         PDoi2+G07PSEZhMy9A9SbnOktmg5zEz2StzhRquFNhXu4wncetTZAkHawa3OsdWZ83TG
         wHru3kybis+c5mxSP22UE0hna1v+JDrRHj/kTMg0CR2z22grCLQyEbfGG5p7DYjydeyh
         7101ZrSD4XRgkBjPllJ2ydBpSxdI4VizW+a3KjSajn4ZpgLNH4/YD6JXkoaiRlGv8lc2
         L4n+Auhpw1jSiCJCrIZTnqFx/voiLqGcJKcpPWRiNE3d/tztxX2yxa7yp9GzffIKuZUR
         AvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773039117; x=1773643917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aC+um2a762gfpLWPhHdIhYlAN3YczWO4vgnfj1X+hyE=;
        b=S4mBsBsBXOMsk1Pr7aIAFH2ypvp4Y4bDv9sCwefxcYhiM3nKKLpNBiRuUz8uOoY6Fx
         VGt/LI0TjJoNwrmtYNlkXg+5xn01L8IevfIyx1LZekI4AmSzSTMDnyT7IaQUkIReZG5k
         fxTIIF7aYln4xTLTFK6el6dWU1vhOxoPVTmtxxJisIFW0zJWJjzalM3PatG17WJSWuXT
         2uVEhSX8eO2frFcO45axr4JadQvGnBeB6EwEV8gOUk1X8eHgeoO3EBe1WBsoZK9szCJt
         rJpoibJH1wp8L+j9FvA4xHXlat+AX/Bh1bfoz12/LJp9eIWVR6+HVYYfsTZQJvFnoO5t
         GKYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNjPssaLECODedT62IuxZxjjpsDXpUJsqImNdZz9h83n/AiFDninvNp03dk4QoxkIlGNpjQHfgPAXCzg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr4Aw5Qu6ep4eTFTXiTw7qdxInsukSuWUdzXNFsMYX79f4BHeu
	e65K5rhsMBghygVcgmkvMjE/hllqUXteHnZUSGvloZiqVIDQ2h3iLbTDGFRbNkTEKKWEraJ/9Eo
	iVKcKZ4Xb+ZuAHaxdwNbGG/w16ec2r6RgXXhIYYp7ew7ufciDfPG8znRaXcW37sj+8w==
X-Gm-Gg: ATEYQzyyfMZfSd0efloy++0El4r74SkgQnTFxacBZucT9XQ+EXdrKTsRwu/IZSx7Yj6
	uXYV4t8ZSkcUdB9ZFl9cDEfTgURxG5BX9KSn1eBTMwKLQ+hBH2TehBRn7IYb4fm+k1IV20+CVrK
	R6v47wVz8Fk+p7EsMBuY7iAVBlXt/4O/r9ifrvnAaY+ff1Yh1i5+Pnywn9ccFlpbO+RctaSNzTs
	jGEvS25DQNLBQW3SYOItOShpWjuIyHFdQSG2WeMGK8ZBsABeNhpJr9/t6PR7NYdXQDWPdjshmmw
	LEE6tMEeFPxp2f3fasSKOqmskjqULh1Lzb1tTHBe+ogZM0d5TaqeFa9D4/+Jqpq6PKsItP9hdml
	CZEA1jVu1pJlczcMvQOhEo2lS7TmGI01WmZAHJJrlVvuVhydexWQAPIY=
X-Received: by 2002:a05:620a:444f:b0:8cd:8cb8:6ff9 with SMTP id af79cd13be357-8cd8cb87302mr150324885a.34.1773039117230;
        Sun, 08 Mar 2026 23:51:57 -0700 (PDT)
X-Received: by 2002:a05:620a:444f:b0:8cd:8cb8:6ff9 with SMTP id af79cd13be357-8cd8cb87302mr150322885a.34.1773039116846;
        Sun, 08 Mar 2026 23:51:56 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48529f01997sm80449975e9.14.2026.03.08.23.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 23:51:56 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v5 11/13] ASoC: qcom: q6apm-lpass-dai: move graph start to trigger
Date: Mon,  9 Mar 2026 06:51:35 +0000
Message-ID: <20260309065137.949053-12-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260309065137.949053-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260309065137.949053-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -zdFq4gpuRfhQBrfkK8Uw8qQttS6QkZu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA2MSBTYWx0ZWRfX4QU61G9WLvAg
 +K+L7U30NocyBCBkN9dIPlXk9W5PyXQwj259a0y9eUPudw1h/4p3edDO2DVnGAeLbEa9TTYkqmw
 MVlWon6M3SrGwRZBbki8Xx0UyEioeYQ+MbyB/uVwR3JlnCD5mUKcRohjqYjKndG9rh4la8VKEm6
 muYK1hLC4EEQJ0DuyAfIicKOrkjNgzv6eFsqdMJ5uihIMAOTnJfw83av8X6gyivvakQ2Xmno1iG
 SqmrqidbiF8Co0d6xYGxQZGecUn/gquc/tqqCMAanaoOQaroxBjVA6g3dDd2iZdG7Nl7Km+0IsO
 +PWxTs+dKt5u9lUdj7mTjEz5Xw87W42dQW7z/0AiiyX28bxeOdN1cEbeTS5yTMwQwFFgZLf9stP
 BzlPmJX8Bwco1Ugr2u1W/oDE0DiHdCVtYxLvuw+4REFZnOz/gPsUYyhW6OBgHfcxIIpfXCGeOhs
 PYny8nO+qpUwtLL39DQ==
X-Authority-Analysis: v=2.4 cv=O/w0fR9W c=1 sm=1 tr=0 ts=69ae6e0d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=8udmP7N65bQo3KbB_RsA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: -zdFq4gpuRfhQBrfkK8Uw8qQttS6QkZu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090061

Start the graph at trigger callback. Staring the graph at prepare does
not make sense as there is no data transfer at this point.
Moving this to trigger will also help cope situation where pipewire
is not happy if display port is not connected during start.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 40 +++++++++++++++++--------
 1 file changed, 28 insertions(+), 12 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index 472b2114c81e..70e283671f43 100644
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

