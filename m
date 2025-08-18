Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E23321442
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 12:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755519780; cv=none; b=oJcAd4E/Gj9a34kM07CBSN1AsisIdkUIFfWNnJxpwgiA6dbPi+Xu2LgLCc6CnUJCh05wXvPhrTZMeplN2CWp71u0n8kba4L5IdsHnuGdcQ+1B9yLzFy7sV+G0/JuIvXqnSlsAt441v8vK3g/tpTOuQ1nZTAv2dM0u5t4znG4z60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755519780; c=relaxed/simple;
	bh=H6GmVGgK5ll2SdWjCCALFf5iXA1TVZUoNq4CRHuxHNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RXRTMachUNT6GVLNZ9EOJqwfgIPTURPVVLmRcNk0+7Oy5eoDlw41p/7K9a0R9oMr9FR37xC01rO1QzAhOxILLlO+HPkTCTTa6/87VZvG3mXzoWpEqnS7R19JcQh5Ry975BHskPBMKtN/uAcC5Dh6JK9K/defcidlWuJFq5HjeUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FFClrAg9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FFClrAg9"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I7Vfdk005301
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 12:22:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZxJHrPhW4rJ
	jRlDgxhmie2TsrJx2Ufa63zRckQyMYdg=; b=FFClrAg91Sx5LTeXFhkO6gjnpU/
	P68ISsd4Wh8TOLrL662kM05eiL3SozsQdbehyOcFZSg31OjykYsn2ScF0xFO933S
	nD5GghX6+vtW81qlP7JMx61zmNxliPyNim4Q7G0pBcFY6IQ8nFUqP+WOh0teCVkD
	4yzIHS74eKnR6Kv715Xx7kMD7G0QcaHqucEY5STeImj/0qiEfF7ANkOQ0pqm/U0B
	Asnedfx7oID/2/kzFDp2TE7zqvXkoCXofv0Jn6QwKBiXguOyNhq5MOvJPMZFBeq9
	HGfc5+JU6fld26/2DwvysaPidLqq1ENDxAIQv6EVQ4yBMLzDNBDr+p2XrtA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48kyur8v7f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 12:22:57 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70a88dd1408so93053346d6.0
        for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 05:22:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755519776; x=1756124576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZxJHrPhW4rJjRlDgxhmie2TsrJx2Ufa63zRckQyMYdg=;
        b=drHhWE2KyJrKvgwS74zocgPItUy4L7fpKxhC9x147thRGOs50bPZTBZWOx+ksnTAKR
         ETTU++z3RjiMiLpfIbjRuh9G0as/N7ruTqH3Su/PYFbPYuQ/7SBE6z/CP+uWw9GZ69XK
         pLc7vDjDfbmTJ0+iB5iufMmNeNCCLYYqPWeqEphe58fbocZ+kSC+FeTElxRGBykVburt
         OACSXdcazhcOxTbcQUtZYjvAnMsCoTZ6MqyTBnxWma1bT4ttV4YbxzHDmpjePdqLsL+H
         63FUhBOhILcsGtEw+xzU48S3/rkcMgBvD8yEdOzV1UjrGMBEQSxJ48orf7ig8I7ffc09
         4R2w==
X-Forwarded-Encrypted: i=1; AJvYcCXwcMDR/1bmE2Tl01Bev0J1kSOQUHMKo5S5/Gp8V7UTQo+CMdP8qzLWwEM2UDZrgYwF2/hNUm+GwKaoVA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3FpfaPAGAbPRcJL9rzdg8C1BwWDrT7BXAtu51UO0m6MN0YNjQ
	VYQ/gfDT2TNJubp/nTCJrE/t9VJat9YX/wj+DBoRlNXe8t/OfHy+wZQprWq6WGfWUpejPbvm2Yc
	HCB3teiNOXwsDyJPpNau90rBItH+BSkwft09GSRljwXW7CJ+OnbsiCFCcGavb7io80Q==
X-Gm-Gg: ASbGnctJMmf52rTNXG53NnIECWAsxICi/fnBaDNW19FkJsjPRugsjnMdnGwXFyLLAMo
	7538soVLNd+Wt3MN+FmRS/OKuzoOgqa3lDLMbYNtv5h9fD/EgpW2M70Xe1mTp+wFa9HnvNVwEsB
	/PjwfX4Fvn7hbXDMvSPZTPZu93YTVRnZRbjXjKpfEctXMuaJdziU+zHqlE9woERSfti20GDJp2i
	jR6s6TaRdMvl+kD5gAh52DgOeBj9ET28ibO/dZ3t1juK3Xpc3Z00c5rEXEj8mgxRely8JfSjBjf
	A+HRlp26qTm7Z3pNfHE02vULWplhdMT55ILGs8FUzbL0U7tru7A34w==
X-Received: by 2002:a05:6214:1c46:b0:70b:9a89:c2d with SMTP id 6a1803df08f44-70ba7a9a7d1mr128986446d6.11.1755519775996;
        Mon, 18 Aug 2025 05:22:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzUJ6w0ICilwEQ42QLrmeuUoDXTHduQ9jES10B49TbGEQsDe6EUQYGwGMQAw+sADlCHw2VKg==
X-Received: by 2002:a05:6214:1c46:b0:70b:9a89:c2d with SMTP id 6a1803df08f44-70ba7a9a7d1mr128985986d6.11.1755519775271;
        Mon, 18 Aug 2025 05:22:55 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb653f657fsm12601563f8f.29.2025.08.18.05.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 05:22:54 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 6/6] ASoC: qcom: audioreach: add support for SMECNS module
Date: Mon, 18 Aug 2025 13:22:40 +0100
Message-ID: <20250818122240.1223535-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250818122240.1223535-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250818122240.1223535-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDA2OSBTYWx0ZWRfX6PcXgbkXMr7P
 Txr68pr+jBKm4hbI69A9NkjByk7Z/RgQR7ScjupHQBQUQh1OPZzqIhsIM+diV9TNxYZKODcsEhI
 sJ2gUbEgC2JH6jGtDp8XYn2267U3+mwMMv3f3tBR0Zwx6zTMTr3WKANKX4iMFJ3RzhXuIAH0IAt
 MyAuFPxDuHr6/BuQKWhR4wZnhdLQWqNpJ30qSvLeVTnnEhZtWpxfmj5X7WR1fEex0ZKe19s8ZYY
 Jc78KA6ncPlo6r8CBxsbDjRAHcdvGDEU9owCJ37dNfnPBm7efByaqmDM3pYYkwPIDMSIYuuXnMe
 DKMRyIszwwI/o7aCeSwljsYib/6Oz1Mdpj1TtbcynTg0n5NYPWA6C391+bpqly/OEL1cjANxjaa
 +668YVbZ
X-Proofpoint-ORIG-GUID: Z-UKCjyyiNtOY2pKbJoB7IxND2eCj7vm
X-Proofpoint-GUID: Z-UKCjyyiNtOY2pKbJoB7IxND2eCj7vm
X-Authority-Analysis: v=2.4 cv=YtIPR5YX c=1 sm=1 tr=0 ts=68a31b21 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=oi9uD5rjtjE88QS_ecgA:9
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 bulkscore=0 phishscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508180069

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

This patch adds support for Single Mic ECNS module, used for echo
cancellation. It also makes use of audioreach_set_module_config to load
the calibration data for this module from ASoC tplg file.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
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
index 790fba96e34d..cc45c94f023f 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -31,6 +31,7 @@ struct q6apm_graph;
 #define MODULE_ID_MP3_DECODE		0x0700103B
 #define MODULE_ID_GAPLESS		0x0700104D
 #define MODULE_ID_DISPLAY_PORT_SINK	0x07001069
+#define MODULE_ID_SMECNS_V2		0x07001031
 
 #define APM_CMD_GET_SPF_STATE		0x01001021
 #define APM_CMD_RSP_GET_SPF_STATE	0x02001007
-- 
2.50.0

