Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE3F3218A7
	for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 10:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755597731; cv=none; b=MLl8XoW05dcYkX4mvcdGtg3/jrTZIoBh7nPzf+7T2AhtzGXfdRm4zEkWhbskiWoDsgCc0bX9JMn5JxG7UmVFThbkFv/2ZDlsZRgnYKGSiVd3Np0KNuP5auxjuak4LYtrgU68EnC4zJk6ZVx4go/YYxaWE6jYIr2W+LHR2erVbcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755597731; c=relaxed/simple;
	bh=ZMDj79JNuxpPNuBtieYFiO7WSUV+XTuIRsLUot9Amxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FGiYJT5kvTZ7ByLwzRRNr2JmsJFmQkCEZLUH63l7662U+oMjzzFun0ePx3I/ZfZeNimhPkM4Mvh2N9/94rjQ6a6eLD2rxYgl3/TL1inzUBVm3D6uxlcmajVLTq3HTsImFTTnnzXIQvwHhK6IW7IZhsqF7t3WYEMZ2qyAfsI/b5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nES4S8Yd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nES4S8Yd"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90ckY031991
	for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 10:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7/8Lx/VqzWp
	eiHTffLhRucXrEdQ6j6on3fcQCwM7QKw=; b=nES4S8Ydz8XSEzazIWEdvJ9j75c
	JH5sCNrxH3NhpsNFIL2RNH8dNXaJUjusDsjIUf8XT3NMOxIYMj2IoPM3ztLbiOc0
	0Q7RHSKz4Nd9CQQioLPWgo6iBztBO2ARbuhcbcbxXvzINXxQeZ4ziinMegGJ7DJo
	z9gV1isaJGBgsP/1R8C8v0nHEKlIp6afwmxiRvp793TnmZ5utFzVZtPONwecjwIk
	tI+euaGa9iB4SVxQ4UVYK/w9J9FW1XppOTCUGAXUQAT7leUBrxyuP+x/e39d08G6
	v3rU2zW+tl3G1jgOnjVl8yBOrZ8xjGulexL1q6n5g0jQU0wL17rTvRC2Lvw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jgxtga57-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 10:02:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e87062832bso1551738385a.2
        for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 03:02:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755597727; x=1756202527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7/8Lx/VqzWpeiHTffLhRucXrEdQ6j6on3fcQCwM7QKw=;
        b=i9rE1V9qbosLbNhgu0K2PZ9fPU+dzUUNDl5GdVu/iEMXc2ZACZpDsTbVSTW6sWnw0H
         2cBmvdGpQBpDxMV9H+eAUFqjhLk35YIfnvACbMFpIg/d0+XlWyxu4yeN+QWX+69jfvWT
         2l844v5lCDRq/YNL50VOpF82a3JIOfh6AOBTwAb27fQWm/d5YatTgbWm+B/AkX/qgBNR
         eTnLKvUtOt1hwg6nrNZisW2FBoK6LBMTW1PBm6lfBwHLoRGHUmWyr3bpNWvn52fUzOm7
         WATdbXmTpUhCrq2ni2xQt4LbYSxYAwOFzS/WV0ZcUmWkk7HjoHFf93h0VFI+rpHbbW0p
         kGUA==
X-Forwarded-Encrypted: i=1; AJvYcCVEP3/vsZf/hzmuy090j/bTEB3cJx6dGlRKEe4UNXR8ryC1M1i+e6aDu6ES9SHiVx5C7QX2bOx0rGBYMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfG1TtjzyGirCReq6GPeqsk59Yx9YhjCSqAqB8qEZ2tdZx7p9o
	H83NF7n4y2x3+VLyh9ltNir3OA1Bu7mErPTeQcwAA7KqXAJZbeWhtnESiX2pBbHMyHKDhHkYl53
	fIeh9f5jFP75pKMEoxnLN7L5DEcWvZoZJkKkz9gdz8aFOBMh5stm3L9TirTs5rApPKg==
X-Gm-Gg: ASbGncvlZXigPNjrdRtYjfNmZUl7iGd5b4DsBEnzlYlUH3iUFKA3IpNJtDcSoJODdk4
	Qtiqui1RxJNp0qh5MemIQFS9PU1K/4m+8S23efNRIhuMGrgpm1DUH6EG1JYTcoLqcjCK3T/HqYf
	L7IbGXjqvLKEx5pJmdSeuwrLSpEOvsD7Gz5xygIX3YLVzlj4ZxyyyhpArE9lTbp/4JI8sFMPa+t
	lNgq14m2jwi5u4gJOuscZxJ1JY05hwXTUHiVA78ge8jEv/M8evTyuZ/4DIhCZ0i+p9ik5jLKsfb
	vvyusMDMDNwut9vUF2Tx2H41wlGU/8P25U3sP+7XrZY6C02k875kRg==
X-Received: by 2002:a05:6214:5194:b0:70d:6df3:9a7d with SMTP id 6a1803df08f44-70d6df39d8cmr4692296d6.61.1755597727361;
        Tue, 19 Aug 2025 03:02:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWh5qhTWgsqfNEZP+cI13i59i9FkibSaIL6ON7kG82mV1vAsa6wXLKX/gdx47IIO4me3XByw==
X-Received: by 2002:a05:6214:5194:b0:70d:6df3:9a7d with SMTP id 6a1803df08f44-70d6df39d8cmr4691766d6.61.1755597726583;
        Tue, 19 Aug 2025 03:02:06 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c78b410sm216169635e9.24.2025.08.19.03.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 03:02:06 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RESEND PATCH v4 6/6] ASoC: qcom: audioreach: add support for SMECNS module
Date: Tue, 19 Aug 2025 11:01:51 +0100
Message-ID: <20250819100151.1294047-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250819100151.1294047-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250819100151.1294047-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lVKaS50btdEhMaZRNJYxImV5v3-lw7j5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfX7+yjVvGW3dQM
 Uz6V4hefqerM88XES8jWXgy2QTSC8cImoiBblpah3bjOKiuf5PpW93aykcf3ADWBOJDcvd488Ir
 t/G9ebGYmA6jhQU5Qe3nvQdH8WcrextpnW8D3xml6KdKkqUQ7ohWJCWO2UBcfyzN2vIgkWG7qX2
 nk5lwDWKHV0vkb81Aw5nXt1sWXMYVgG364fbHC1o0GNFFiHPy5LcRztIAi9PM/5zUBHW5WkjLnF
 lfad4gLWmfBMa4hE+sleOFJMF2o6tq9uY8kx8FFaPF8ot97+lvOVs8NeOxuu5qfaBCs1pOOhBVH
 XfRQ3f66MVsyDMcuC+z+yE9TfkUFVva4KfHDTcWHFnrREP96DoN08QgTfD9CRyp3Srk1egbDMaM
 h7hLZf0A
X-Proofpoint-GUID: lVKaS50btdEhMaZRNJYxImV5v3-lw7j5
X-Authority-Analysis: v=2.4 cv=V7B90fni c=1 sm=1 tr=0 ts=68a44ba0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=oi9uD5rjtjE88QS_ecgA:9
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160020

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

This patch adds support for Single Mic ECNS module, used for echo
cancellation. It also makes use of audioreach_set_module_config to load
the calibration data for this module from ASoC tplg file.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/qcom/qdsp6/audioreach.c | 27 +++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h |  1 +
 2 files changed, 28 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 4ebaaf736fb9..f4c53e84b4dc 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -811,6 +811,30 @@ static int audioreach_gapless_set_media_format(struct q6apm_graph *graph,
 					 EARLY_EOS_DELAY_MS);
 }
 
+static int audioreach_set_module_config(struct q6apm_graph *graph,
+					struct audioreach_module *module,
+					struct audioreach_module_config *cfg)
+{
+	int payload_size = module->data->size;
+	struct gpr_pkt *pkt;
+	int rc;
+	void *p;
+
+	pkt = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
+	if (IS_ERR(pkt))
+		return PTR_ERR(pkt);
+
+	p = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
+
+	memcpy(p, module->data->data, payload_size);
+
+	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
+
+	kfree(pkt);
+
+	return rc;
+}
+
 static int audioreach_mfc_set_media_format(struct q6apm_graph *graph,
 					   struct audioreach_module *module,
 					   struct audioreach_module_config *cfg)
@@ -1247,6 +1271,9 @@ int audioreach_set_media_format(struct q6apm_graph *graph, struct audioreach_mod
 	case MODULE_ID_DISPLAY_PORT_SINK:
 		rc = audioreach_display_port_set_media_format(graph, module, cfg);
 		break;
+	case  MODULE_ID_SMECNS_V2:
+		rc = audioreach_set_module_config(graph, module, cfg);
+		break;
 	case MODULE_ID_I2S_SOURCE:
 	case MODULE_ID_I2S_SINK:
 		rc = audioreach_i2s_set_media_format(graph, module, cfg);
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index e4babf9a44ff..790fba96e34d 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -27,6 +27,7 @@ struct q6apm_graph;
 #define MODULE_ID_CODEC_DMA_SINK	0x07001023
 #define MODULE_ID_CODEC_DMA_SOURCE	0x07001024
 #define MODULE_ID_FLAC_DEC		0x0700102F
+#define MODULE_ID_SMECNS_V2		0x07001031
 #define MODULE_ID_MP3_DECODE		0x0700103B
 #define MODULE_ID_GAPLESS		0x0700104D
 #define MODULE_ID_DISPLAY_PORT_SINK	0x07001069
-- 
2.50.0

