Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13C53932DA
	for <linux-sound@vger.kernel.org>; Fri,  6 Mar 2026 12:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772799746; cv=none; b=rlcnnbGu6FufgVrn3qWRWBsXjuflHXGYaVwjOWsNn7H/LxmLH7HZymoxiJtJVYRLbWtdnU6lNqDoKNllQDoHqGIbzwuqmXeq58bamN6rHdgE71wnFeu4o+jeTHGBcN9GgV9/IbVtuwfMGCpSpnMUeO6zMDUWTQoTKO/nrPglgUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772799746; c=relaxed/simple;
	bh=B8mb+C29aHmXpiZ0KkyuEWv+QuyMzs+RA8VA08jucnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U4oe+z4By/fzQii42GzYRf9IBhF0kYgnilEKeuCCwXWMxnA2Byn+1UqTKkCKqn5Fs5PDCKCqglAxEvvMtON2sxnUmq643ZMB+oSr4DLfkxgwyLnRwYEwmQKK49f0HzWwhM4HKRMWkuYTbLHBp2vMvn6iKL/kfXEMYiuNAe8rkNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h9zx2upK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XFL27lFw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h9zx2upK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XFL27lFw"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626BanD83406179
	for <linux-sound@vger.kernel.org>; Fri, 6 Mar 2026 12:22:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aC+um2a762g
	fpLWPhHdIhYlAN3YczWO4vgnfj1X+hyE=; b=h9zx2upKPzxJjheBIJqXNAqxAne
	AIJvmnyGUIHvD9i16GUHja2k1z4Nww2tTonNnWYr6hh74K0/S4RRkRm338A98Zlq
	uoge84oru11xNzKyBOVtjN+ls8PcEw1LETfgLQOwzELgSgZR7sPOMUDnSMgmW+Wq
	bPg6si9E37Z639DD+MdjyFgHpefk2gh1G1JdKfPyWRlkCZUmQst+35tLRodpEZar
	r23oXYCioSFf2LXzg7Cm3Dj8fGWXBHqn42Kcs9W9FcRo+ULrFRcu7LXk6uqoQGcW
	a/qP1Wm/8vlH/DzITpJI5Te7UgI90zKyXlbyfjarH8mhOE26ySxCW0llUaA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv9u8gq5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 06 Mar 2026 12:22:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb52a9c0eeso6768313385a.2
        for <linux-sound@vger.kernel.org>; Fri, 06 Mar 2026 04:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772799734; x=1773404534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aC+um2a762gfpLWPhHdIhYlAN3YczWO4vgnfj1X+hyE=;
        b=XFL27lFwzV/tY5/OFor8j/JNkUHrEAGITzKfOW+SPeizBURqumZY+7y/0nfuwFTPHt
         MB9TAHOB038mye/0esAXBEdb0FzxJT2Ucq9aL1s+Dk7ilCgVlaYn2Rvn8VGUlIH8Ql0s
         o+dUDTBtJAwQbGTEwBvMv0yTh/CHtXmeCE7OmTUvas88OXSsBtsN6Xd8tnzEp9SMHD2n
         iWq+YCn557ytcLxsR3YXoHiJMkFV/4qtu4uvqou59+6yGlVsJ6D7Ijh29PI1JJc9GCYs
         M3zX2+8D56V/wGlzA3DdIj6mE3J3ghr5uShQXUGyupRMS3GN3o0SJqTxQXkPvzYjHbIr
         UGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772799734; x=1773404534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aC+um2a762gfpLWPhHdIhYlAN3YczWO4vgnfj1X+hyE=;
        b=cXa0HP7RKF2+mJQAbmC+VG2TkUVSZ9rONgc+nKOmr9sgbywu4ql22xhW9zj8Q+5src
         PO24HoQD3GZcHk0pn6Ah1Oqqc6sapWcBP/ylItqys+nHyEfaN1aPe1jxqLzVOlA7ZaqK
         ybTsG457EIiQtkXeCqJgJjmueQcq4gvonMTYGeAx7MFc6g6SNp77UpQXR6+rxHCBHVeq
         O3onJdTvg12rwUKWz0UzgOpcB8IPGaVYvoscp0IygzZufjuDtBmiOwGSaCzOrhHwrSHd
         D3az8Luo2D83T0RvKlsGQMPeiGkJJ0EBq1hb/puT3E7cZ7tCe4uxHPAkeAH0ypTC02ez
         HvQg==
X-Forwarded-Encrypted: i=1; AJvYcCWQR3NAwydqhoKHk/JWzXFyPZLGQXxVxLMJc7O9NSDH8y0xxRDvWQW8eYhzbDBotmU8h8JocGm1KKU0Rw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJqrS3xXFcvfN7iHEJwppodp4RPVIz5Eej/j4osB8sEGghsLxe
	mgI1bfWwqnHI+ed9zdcqt19eFbPhhZRkSMGruKey9A3eMj3vxexQD6Clde5PXEC6SBwB+aeinei
	9JRuotzRHD8/pnE2Q9sGthwuxaIwDhuqRHESG6fmcFyLoh7nM8ZeFgG1QDCAmxAnet/W+O2kCjw
	==
X-Gm-Gg: ATEYQzyLKgABCv+ogY+4TLLIPzMW3SprHuw9zkoNuVelF+1oS3lfvNJc/7OL049Dtum
	cEkPWzBXul5T9bls+/sHXnXfibtRTTKb66MDPax7n0kRF9++pfGfTMdXu0iWpQcvv/yLf/cE0I6
	KkOK4GdRSkfMF9JOFvLwecHhGMTcUhB8UUtI7Y/8kHKC6ySD1Gqci9I1Vzlzh5eSZzCH1VV1Od9
	Q9DiTHoLN7e9YPWEqYrAcGTSLBW5nwcZ3h3Qm0Rh1Sx8r0Pm2J0IsrRZvjFeM8q+hEXYrDo6JcN
	sYO3nsTxQR93/lkjqEKwTo2DdSEZyTvKKf/nDW9WyufQfjOTczO19hCRn/88g9g6QMgwayZHhVC
	WaVzAq0mX+zJlopJX++W2L1vlNdstV45B6q1DtCXdyFNJztPIoec13NE=
X-Received: by 2002:a05:620a:7017:b0:8c6:af59:5e28 with SMTP id af79cd13be357-8cd6d411a4fmr237571485a.22.1772799734468;
        Fri, 06 Mar 2026 04:22:14 -0800 (PST)
X-Received: by 2002:a05:620a:7017:b0:8c6:af59:5e28 with SMTP id af79cd13be357-8cd6d411a4fmr237568585a.22.1772799734049;
        Fri, 06 Mar 2026 04:22:14 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fa87e56sm111972395e9.0.2026.03.06.04.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 04:22:13 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 11/13] ASoC: qcom: q6apm-lpass-dai: move graph start to trigger
Date: Fri,  6 Mar 2026 12:21:13 +0000
Message-ID: <20260306122115.509705-12-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260306122115.509705-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260306122115.509705-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDExNyBTYWx0ZWRfX4sFEW0s9/mjt
 gmp2GDYxLMQ3qejl+AB6ylxLWxEQbl4akZVE9n5hkyau7h9fod73teg4loZCQDPjkmrhEYKRhUU
 lM26xEdjW+DuJMTvqXocCbbpvG/ojXpXgCDZvcThMQdiRZRPH6KCr3Wh4jYBAq4bVHle4BNH4/v
 dVYf2jKsGtzbX81HmtKzKWtwqRvf0lS3/oJnrlOccGLg+0yfQdc4JPvDf+ImXmGoapRzoIwdLIo
 qXQYDWNHZf8/wXmgjxeJpyUJbwv2kbG8IF+Ug0aQuCIYbcdj2WnwjsDdSc70Alczh4CH6erxoAl
 eOhGq5/IJ9/isvaVE6PGUB+tXIy6nMhDYGefhfFBQSiGIZBx1biM7liOjt4s9GslKd8p7WLCIvq
 nT09E+1Nvzu+55XoG6jJGtvc2AgMRieu1Oe86TqG03IJ7hxAXAGYtudPt6iIbiQY8dIZYbpaj+i
 fuIrG0h+jU46ul8+P9A==
X-Proofpoint-ORIG-GUID: SMfFVKnFi1xWeM6ePnyyJSM4cv2S_91n
X-Proofpoint-GUID: SMfFVKnFi1xWeM6ePnyyJSM4cv2S_91n
X-Authority-Analysis: v=2.4 cv=eJoeTXp1 c=1 sm=1 tr=0 ts=69aac6f7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=8udmP7N65bQo3KbB_RsA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060117

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

