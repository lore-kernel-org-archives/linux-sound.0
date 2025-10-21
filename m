Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB892EE5F0
	for <linux-sound@vger.kernel.org>; Tue, 21 Oct 2025 10:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761043218; cv=none; b=ITZ566Dy1s4ruTqiyZF6KyihsetWOWe5dbKGEaMAhqpZ59IbG0Ld3vNdp+WxmWhHte6YWyk8NtQsErPrTdG6lwJhV0F4VoeO7mapupUN702w0HIFqDC5h8349kC1M8f2SXei+4OV1bCOX+Qx3vdTQqfI34Zs7cehsDKrWKVlKjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761043218; c=relaxed/simple;
	bh=UYyYRnQbXnCvAIlE1ZdNvY1IRbRxEMbOF2tV79AsSe0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TY5v3cexiJEM54NRXGrSojCjEsv7G40UbPO9zZ5bioIyD2tyNiNezlVc55hOmK599wH32hhXbQJAqoe+bDuSgnNB87tEfjeRHNrA5Qi9z/lLoGvHcbzC6wxX8xK+CEL/HuGz9bOIBwOQEWGRiIc1Un+hHnUdybnFj3jzH46F86I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tmxvpvew; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tmxvpvew"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59L8Deow030299
	for <linux-sound@vger.kernel.org>; Tue, 21 Oct 2025 10:40:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jNy+kcNV6c4
	PBhObCb2utKXHWJKznzQtqH7XbZIO9js=; b=Tmxvpvewo8LvbZOVtTldkjiOM67
	bzWL/BC0F9VycNUffsUgy3R5nbf05R/nN0yAiVA5o6mzid83Mw9s+zwpvpGEI3Ev
	ptON+BDbgCXZJ8XQsBtLgZzEFmmIBF4GINZ810qG6hEyTnyPHg2nPHl70ZWdge2W
	iIILGHaEHQHqjLTYE0T1ZVE97TGeBca9Xc9aFtPyZGIPx128VebLDDhWf7ryTWuC
	faJXufmOxrbETKLaevgxtWypJHnF+xtxXtVHQLA4rQ/dUnlCq+98/YfEbYJkvDwG
	hg1aKUGpPNEgnG4RhZT1aaQ9FV05G80IVKXg2KwaKYlwoNtqlpav6WKLE5w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49wswntrgx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 21 Oct 2025 10:40:15 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-87c1ed305b4so178401886d6.2
        for <linux-sound@vger.kernel.org>; Tue, 21 Oct 2025 03:40:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761043212; x=1761648012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jNy+kcNV6c4PBhObCb2utKXHWJKznzQtqH7XbZIO9js=;
        b=EKYTCII32eBFrz7XE/vizF2riYg432qtgzXb1zkKLi2F2Oq16c0UYkwiUibBiPnB+G
         DCFVvol6swBljmks6LfSMimioh3zml7py+DPKFduGmsOg+kPiSrKemvBNMxDF40ly6yn
         Em4u9EiUnapELhj3S9hpH84Dl8SD1Wss6Sq+pVZmhud9Oj33GmlKhC0eRKMs0q3uNbUg
         6OX24nP4QknlnM+puOIwbbiHxGJdD0qwkq8pof/VFszBmqXq51K2Md03d7Vu1z8/itsC
         TlAxNZDDZ9rEt4bs/+wV8faib/6o18YsK/YqHNL4CMau7dC20pAWqRI+zhEf5NNSoEFt
         GzLA==
X-Forwarded-Encrypted: i=1; AJvYcCUoHAbh0lSnJg3giMZfDO7dMU63ZLRc9HLcgfeO/+2mcdcNsFKH4dOrEt2tv3Sg4QXH789CfM3txlzHnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz85PFIhZ0ZFI/PqwFBFhuo8+UXyI0ZmyoT27F1RjoBsk0DBKrM
	IrFEQlnugWzrtRiX+7k7qSw90viR1uTQorJVRyAxzK2W3maXEy+HpWBpySq1QiHUowi7mMeVmcb
	cY0GD/60eF8lvMvy6HFA9DH4b1lFeY8XFnVdsWBxRxPGU3eYtRn2eM6+8JjZ4A7p2Hg==
X-Gm-Gg: ASbGncut59NiGPYM7TdU+hV/URoHgjFEANQQ0S3Fjvr/eHxi8EDIvHDESvdip8DjoZh
	nwW5ghn+qExHGpptSa9frS7+utatObUkpSGuqw2jjmyq7gsCEmLJFvJv0anVKTRMCG8VujkPoI2
	pauwHtFlE4vLF7bZiqyC6l6C2ZBSie4LCR0shixqG6NxUeA4aqKNLFily5EFZgj0FprzonN5Ar2
	KtNVNFPaU1Wm9jrbH10v59X9I5NQAwm17CE6bik03hbA3NEf713R4lIxEXfSGCx3iRFqZux7LKs
	oUxv1hWA/VFgey5uzJRaQVpV1xANpDeXjAkv6cVxPbK5M61+YQvGnx9a3H1sT1uqGpm6UjX4gvH
	CdNw6V19EXe34
X-Received: by 2002:ac8:5a88:0:b0:4b7:9506:efd1 with SMTP id d75a77b69052e-4e89d1fa8f4mr160054641cf.15.1761043212081;
        Tue, 21 Oct 2025 03:40:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNwpGr5uC6St5tQQjzTYAMWepTpl6VdBTuEO/ILCKO7RvOLdLTGwCCKckadeZvFJxgQmGWJA==
X-Received: by 2002:ac8:5a88:0:b0:4b7:9506:efd1 with SMTP id d75a77b69052e-4e89d1fa8f4mr160054401cf.15.1761043211552;
        Tue, 21 Oct 2025 03:40:11 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a976sm20087938f8f.32.2025.10.21.03.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 03:40:10 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 4/4] ASoC: qcom: sc7280: make use of common helpers
Date: Tue, 21 Oct 2025 11:40:02 +0100
Message-ID: <20251021104002.249745-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021104002.249745-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251021104002.249745-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: QPL6IW7reV5K9Yv4HCawftI2SdFFtEyQ
X-Authority-Analysis: v=2.4 cv=Maxhep/f c=1 sm=1 tr=0 ts=68f7630f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=xzVSZQTBi2W_vW4HIIQA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: QPL6IW7reV5K9Yv4HCawftI2SdFFtEyQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDE0OCBTYWx0ZWRfX7E57PHwpvxdV
 3S7kwmOJq4AIA4fW6DIUkXIMW2kH4R+ArG9/0ELTjsLhHzj3L0uAlSTqINNXJR6KfrtJwD9Th/T
 oED2Zecq7kfRUcLkUAG/7GG3RrdT44TZl2/MNDXXA2VNmAOv+s4SRuj5f0SWAE2oqLJoLtrsQhc
 ExtxWzawyZciEqpTJN/ZNaO0ST0YrAzGr+yNfHvLkb/703i/lfcVufKgOeXfJfRHlqWArKOmQXl
 cQ08LcAgCf3nGf563/+5lytz0W/v7DfltnFWinqujWZSmRGVomXI1wBbb+beoSgOojgoyWYIUdT
 C8XQ9uSwSQvh0Mo5cT81yoPLFGnVZtImM9QankrZZCgNBa0zlf7C6OYGluGqoi3od4UmBN7iVe6
 /zLY38TU4X7Np16WeFLQ7ow45OxD5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-21_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510200148

sc7280 machine driver can make use of common sdw functions to do most of
the soundwire related operations. Remove such redundant code from sc7280
driver.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/sc7280.c | 67 ++---------------------------------------
 sound/soc/qcom/sdw.c    | 10 ++++++
 2 files changed, 13 insertions(+), 64 deletions(-)

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
index c44659deea01..16bf09db29f5 100644
--- a/sound/soc/qcom/sdw.c
+++ b/sound/soc/qcom/sdw.c
@@ -2,6 +2,7 @@
 // Copyright (c) 2018-2023, Linaro Limited.
 // Copyright (c) 2018, The Linux Foundation. All rights reserved.
 
+#include <dt-bindings/sound/qcom,lpass.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <linux/module.h>
 #include <sound/soc.h>
@@ -30,6 +31,15 @@ static bool qcom_snd_is_sdw_dai(int id)
 	case RX_CODEC_DMA_RX_6:
 	case RX_CODEC_DMA_RX_7:
 	case SLIMBUS_0_RX...SLIMBUS_6_TX:
+	default:
+		break;
+	}
+
+	/* DSP Bypass usecase, cpu dai index overlaps with DSP dai ids,
+	 * DO NOT MERGE into top switch case */
+	switch (id) {
+	case LPASS_CDC_DMA_TX3:
+	case LPASS_CDC_DMA_RX0:
 		return true;
 	default:
 		break;
-- 
2.51.0

