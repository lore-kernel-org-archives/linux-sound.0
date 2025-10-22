Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BC534CFBE
	for <linux-sound@vger.kernel.org>; Wed, 22 Oct 2025 14:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761143649; cv=none; b=JPTeY15ik/OU3sTjJ1VLXyeAM3l6iKiPA3Oj8fPAYvqYsbpMJkbjqYlM/m5CBUJ0cP8tshMbySEuZfRpuIF8rbXYhOgBej1zVMZLOknhF7tThvnbsvgXOQgObqzQjcVK8IKv8/OngbIm8OcsVSu4Af7TJ+Zjc4AnL9rGQEYRp28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761143649; c=relaxed/simple;
	bh=Bz5dNjnWGJ72zU9lpe8lIcLxT6Mivkx50DoKVMYTicc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VZ1WWTqzfNSnlb7W3vv9yuJ0jmSxKk0rT5Zg6uRV1tguafneA2Z/KdbF4D7adyJzNsHhjFKDuUf+0lQDikFi/n5VouZ05KbyU8jGsOkIg5xwuVygH/yrcpGjfrtpml/FMp2w3Fjc5NnyA2YpdJdp25bRw3soGt6el0bfBOOMQAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=govKmZyy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="govKmZyy"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MAsljr024237
	for <linux-sound@vger.kernel.org>; Wed, 22 Oct 2025 14:34:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=faQIz8fSwdO
	oA7CWAkNGtjSmqzRzKQ9HbO9f6ZOpKX8=; b=govKmZyybdeQGQigfBY6KIPoEXT
	pvMs2zdjtmwwitWHXIWAlpJpgJ2zcn2u2lmB0cFVBE2B0a8m7l9GzB7eZmDgNQ/m
	NYr/2ZixueYVufsrA9V65Sgow5Nas/VZwky7SI6IFMQYlTReh1TXJ14eoziEeDrU
	ooG6FtSufXQC3rWcxguvhiyAcd0kp13InCN6N/Me+H5SDMpTDbAnhJSFhj2OhG71
	1Q4tSApkDvjavwti/vRaPsXQp40sLgdPjTcU6dA3r+UMt1wXByJEJHfx7qdkZz8D
	lqKXsu3pk6By/m/l5X54gQIY7zzR++Q5nlkTR7KZOe7R3Fybbtp7pUjXViQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w8508c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 22 Oct 2025 14:34:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e8bb76ee59so33481421cf.0
        for <linux-sound@vger.kernel.org>; Wed, 22 Oct 2025 07:34:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761143645; x=1761748445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=faQIz8fSwdOoA7CWAkNGtjSmqzRzKQ9HbO9f6ZOpKX8=;
        b=PMlr5s/ICpUg1+mPsWR3KF16f7olUVHVfiTrja0LtsBWn2YGz2iYFUUs/pYJXLPEQx
         s1rcD2V3Kcv90t4SaQsEDprIKOs2lVkoeHmqNzgUewXWjEK1Txx2/kbT3iTdx1SK4dyU
         K8XzeYlDAj/tJ7WrqeeLUko40BXEDcGIyl2x1kZ3QiVwgRQU0T7QKMGYHVlYLt+jnK/5
         FZqVWCr/Yi5z/gmeVqz1HMzTw5YVMY9sjgN8Nylq5yVA/7pZh3iwR6dAfPVKOaQ0vxw9
         63aPRoKUavlAUZe1SPYx6qNQPK4Q6/DoU+FVXaefa/SZdwxN+TvcsbxYjKFh68FU5edi
         jTYQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7OpkfEYGVbd0LJJEz80uZu7rvY16PwXmZQdBtjoP1rQv1Wh5yscW2WSGS4BQ9tWGWiU7aiVz32OcMqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrxVrMkytfrP6GfBtK4Yqx+QZebTJkSZTGxrGMr4a32QEN2zcY
	yN9qWPEB2LgQ2iYKsCr0wrAMJe06QMN+sQ1FtequGIVceE+bw5xeXO2Kyq6BX6ZukRoU935KVLF
	0bJAr6NTAluk9UezUTdCIiW/Tv5KqZFgoU3bL13G/46lcjT7IAmTLapT6pnVPP5f9tw==
X-Gm-Gg: ASbGncuztNwjL6iqWgqT0y81tlRCwCU/BL4L3WUq3XQDHJ+dphEtQVyPUaKPIjdCjgY
	NyJqDAolp2gw+CjqTslEQH2KZzlbkrmzlc5NXCxzXy/mrKliyHL+zcJwp+PMLX5avgXi7aB26vk
	DY4ZFS2YtEMt85pvWV8qv3G3TD7eL+JRcjFKpbcponGjeUyJ/6AdHk41pJbPeGYlGmmAQhgK9Fe
	5y9cUq+pw4D7YsUqMIQGIEhCUD+XyDs3EHvSbQGOeNYeZfE/dFACTtV593CjG1QnWEwD5S2ay4c
	9u4NR+lP8O1OLkAopzFD69rUiPWI5PQd2iiwaJzP5o79X2kzSctjjLN3F9AckKO3tqX9PGKy2qP
	UZ6Voxy29Z6RX
X-Received: by 2002:ac8:7e88:0:b0:4eb:7669:6b91 with SMTP id d75a77b69052e-4eb76697856mr32465991cf.16.1761143645335;
        Wed, 22 Oct 2025 07:34:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDK7D29Zp1dC9C3t8n2L6JThatH0XLulfavnkHZNj4oocbfOoVQymObbxt5nwrjNWlrqFgpA==
X-Received: by 2002:ac8:7e88:0:b0:4eb:7669:6b91 with SMTP id d75a77b69052e-4eb76697856mr32465241cf.16.1761143644735;
        Wed, 22 Oct 2025 07:34:04 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a993sm25544910f8f.24.2025.10.22.07.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:34:04 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Steev Klimaszewski <threeway@gmail.com>
Subject: [PATCH v3 4/4] ASoC: qcom: sc7280: make use of common helpers
Date: Wed, 22 Oct 2025 15:33:49 +0100
Message-ID: <20251022143349.1081513-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251022143349.1081513-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251022143349.1081513-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfX5ed2WBXcZDBH
 1MiHkvo5HVuaMzBMXZXNlrt+OB60dLhw0BTIt0O1/r7Oc7wg1/DCmw43WwajXsnJsARH4f5Okgc
 VRva1DV5kpHWW6R7Yusnyb0oRiK1C6sTWEmjtIecwUo67fiD7yow/CdeieFXvV446IFLEduGnLc
 8PLQiBHHrGiIhHhjpVcBrFBgo/oFhBa00me3pEBzCLZ9NQrIADnkyb0sIh8DPve0lUStyfV0DTd
 N3QY6qnK4PoMcYtxZzPb8kHRgyblfOcxeSaua4VZXUOxh1rJrMxL0WuJoGCoWPhfnsNP2OLIpAM
 TuDIincP85uwpy9ot5e1QRYfZI9+vWGRjgWuNs5I93hwZXBq5cTvPkFuAxZqPqF+lRuA4w1LPF3
 8ES8CJ2Gcfb3Z0AcbGD8Z6B018IVHg==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68f8eb5e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=xzVSZQTBi2W_vW4HIIQA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 67jmHij9lGJSzESaZsavVjJfHTQgznnz
X-Proofpoint-ORIG-GUID: 67jmHij9lGJSzESaZsavVjJfHTQgznnz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015

sc7280 machine driver can make use of common sdw functions to do most of
the soundwire related operations. Remove such redundant code from sc7280
driver.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Tested-by: Steev Klimaszewski <threeway@gmail.com> # Thinkpad X13s
---
 sound/soc/qcom/sc7280.c | 67 ++---------------------------------------
 sound/soc/qcom/sdw.c    | 11 +++++++
 2 files changed, 14 insertions(+), 64 deletions(-)

diff --git a/sound/soc/qcom/sc7280.c b/sound/soc/qcom/sc7280.c
index c444dae563c7..abdd58c1d0a4 100644
--- a/sound/soc/qcom/sc7280.c
+++ b/sound/soc/qcom/sc7280.c
@@ -31,7 +31,6 @@
 
 struct sc7280_snd_data {
 	struct snd_soc_card card;
-	struct sdw_stream_runtime *sruntime[LPASS_MAX_PORTS];
 	u32 pri_mi2s_clk_count;
 	struct snd_soc_jack hs_jack;
 	struct snd_soc_jack hdmi_jack;
@@ -207,32 +206,12 @@ static int sc7280_snd_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai;
-	const struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	struct sc7280_snd_data *pdata = snd_soc_card_get_drvdata(rtd->card);
-	struct sdw_stream_runtime *sruntime;
-	int i;
 
 	if (!rtd->dai_link->no_pcm) {
 		snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_CHANNELS, 2, 2);
 		snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_RATE, 48000, 48000);
 	}
 
-	switch (cpu_dai->id) {
-	case LPASS_CDC_DMA_TX3:
-	case LPASS_CDC_DMA_RX0:
-	case RX_CODEC_DMA_RX_0:
-	case SECONDARY_MI2S_RX:
-	case TX_CODEC_DMA_TX_3:
-	case VA_CODEC_DMA_TX_0:
-		for_each_rtd_codec_dais(rtd, i, codec_dai) {
-			sruntime = snd_soc_dai_get_stream(codec_dai, substream->stream);
-			if (sruntime != ERR_PTR(-ENOTSUPP))
-				pdata->sruntime[cpu_dai->id] = sruntime;
-		}
-		break;
-	}
-
 	return 0;
 }
 
@@ -241,30 +220,8 @@ static int sc7280_snd_swr_prepare(struct snd_pcm_substream *substream)
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	const struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sc7280_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
-	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
-	int ret;
 
-	if (!sruntime)
-		return 0;
-
-	if (data->stream_prepared[cpu_dai->id]) {
-		sdw_disable_stream(sruntime);
-		sdw_deprepare_stream(sruntime);
-		data->stream_prepared[cpu_dai->id] = false;
-	}
-
-	ret = sdw_prepare_stream(sruntime);
-	if (ret)
-		return ret;
-
-	ret = sdw_enable_stream(sruntime);
-	if (ret) {
-		sdw_deprepare_stream(sruntime);
-		return ret;
-	}
-	data->stream_prepared[cpu_dai->id] = true;
-
-	return ret;
+	return qcom_snd_sdw_prepare(substream, &data->stream_prepared[cpu_dai->id]);
 }
 
 static int sc7280_snd_prepare(struct snd_pcm_substream *substream)
@@ -291,24 +248,8 @@ static int sc7280_snd_hw_free(struct snd_pcm_substream *substream)
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sc7280_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 	const struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
 
-	switch (cpu_dai->id) {
-	case LPASS_CDC_DMA_RX0:
-	case LPASS_CDC_DMA_TX3:
-	case RX_CODEC_DMA_RX_0:
-	case TX_CODEC_DMA_TX_3:
-	case VA_CODEC_DMA_TX_0:
-		if (sruntime && data->stream_prepared[cpu_dai->id]) {
-			sdw_disable_stream(sruntime);
-			sdw_deprepare_stream(sruntime);
-			data->stream_prepared[cpu_dai->id] = false;
-		}
-		break;
-	default:
-		break;
-	}
-	return 0;
+	return qcom_snd_sdw_hw_free(substream, &data->stream_prepared[cpu_dai->id]);
 }
 
 static void sc7280_snd_shutdown(struct snd_pcm_substream *substream)
@@ -317,7 +258,6 @@ static void sc7280_snd_shutdown(struct snd_pcm_substream *substream)
 	struct snd_soc_card *card = rtd->card;
 	struct sc7280_snd_data *data = snd_soc_card_get_drvdata(card);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	struct sdw_stream_runtime *sruntime = qcom_snd_sdw_get_stream(substream);
 
 	switch (cpu_dai->id) {
 	case MI2S_PRIMARY:
@@ -336,8 +276,7 @@ static void sc7280_snd_shutdown(struct snd_pcm_substream *substream)
 		break;
 	}
 
-	data->sruntime[cpu_dai->id] = NULL;
-	sdw_release_stream(sruntime);
+	qcom_snd_sdw_shutdown(substream);
 }
 
 static int sc7280_snd_startup(struct snd_pcm_substream *substream)
diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
index c44659deea01..6576b47a4c8c 100644
--- a/sound/soc/qcom/sdw.c
+++ b/sound/soc/qcom/sdw.c
@@ -2,6 +2,7 @@
 // Copyright (c) 2018-2023, Linaro Limited.
 // Copyright (c) 2018, The Linux Foundation. All rights reserved.
 
+#include <dt-bindings/sound/qcom,lpass.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <linux/module.h>
 #include <sound/soc.h>
@@ -35,6 +36,16 @@ static bool qcom_snd_is_sdw_dai(int id)
 		break;
 	}
 
+	/* DSP Bypass usecase, cpu dai index overlaps with DSP dai ids,
+	 * DO NOT MERGE into top switch case */
+	switch (id) {
+	case LPASS_CDC_DMA_TX3:
+	case LPASS_CDC_DMA_RX0:
+		return true;
+	default:
+		break;
+	}
+
 	return false;
 }
 
-- 
2.51.0

