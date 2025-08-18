Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C1A31B107
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 11:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755516508; cv=none; b=n66u65ZZd3vtXi8NFhMoPPBh5DZdCJYV64uNkMtJqwAl12yuQc8FzdEoJlJN1fiwQaDS7Rj6DByxAdnxrsiGMuvwh5U9LvAWXh+FHyZ1IIn8xoQ30fOdAVcMnJVAOKlr722qp+JMdPDmqE6ihambMuCpeCc7TmUqtjXVgwyKCNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755516508; c=relaxed/simple;
	bh=kCCoJ5RwKQolBiAA1kQB5iFFOpCZeo+oFkwyg/N17Sc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AIgakmHLPHq4hdsgaPlRjvXsVPSKmUUWUBZ5orsILtRE++KQmy4Za2VDgLAqAOSdKBRae4slNr4m2faTllWPW5mZ1K+KaDErIQidxp/XZiMzaD8AfaHVWIzbwJJGH6NNk/MpP2zqZCtl2hD5j0bFxF4jsun0TCnVGphItLRDZxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IsJf6K3B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IsJf6K3B"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I8FC6E017547
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 11:28:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aEG/pSOILoj
	2TU1370f8on43zZiCQpPRxIAIX2faToc=; b=IsJf6K3B8XjZ+57NZHLNc5llHgi
	PUhrNITiWYmruBALhdGIOU1yr6CSxWMdpirfDdVHVcFW0GdTEDcqU2qbGs71qmHd
	pPTolNvT5M9KduDzgFauWV5JobE58U++mqLrs3btwkGOp6kGX/GogNxNMpE2d/Yy
	ByNhJgmidTgk9Os2yTog+0qPfgktWtoWKqhPG5bLqTcDvqwBq7BkiQwNgTPLSEDq
	k1C1b18p4O544STMFhKf+WwlBJVmaQ9VJpHZkZJuiapAWRsH2WAhccHe9AWea1cD
	Sfa9e0ubyccNXHi6kaWRs7pWTLSLSFnB4/zjkYKnCrNUC3opijkivSkHMDQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj744eku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 11:28:26 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70a88daeb18so92192676d6.0
        for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 04:28:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755516505; x=1756121305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aEG/pSOILoj2TU1370f8on43zZiCQpPRxIAIX2faToc=;
        b=PB5As3v7OEqOTcTiTNTsNJgxhXes+Q6N6lm8IaDRZ1EP6ADCWSBNmpnT4s3vgPstyU
         9y6Aw9hLLSwXhd+KqKVk1rIxptTXG7rJoCcMcb+yvjz5DcImkSsAcESr0FgwLbKZYWNm
         ByxzMSrjlw6A6sidPRpA+6xft785Uu4QjUUEegQ9J4vNM4SfFS3t8TNfqhXdTa0lcMcR
         TWXrO+Fz2siPQ+IV0scK7W4LOFIvlTh7vM9E14aIqd5e3ZdqEEB7gB41fneCQXIcIwqm
         IS6ISk7YGtnx/Rt6OGEdWF4bgpu+/zznJU1NzYW0V8Y8De04OUB2YXK8Zxdt6F9MeB+X
         q+Lg==
X-Forwarded-Encrypted: i=1; AJvYcCUuTGLwEyKPXqpbB34pl/hZq7Gx+Erx4WjQvXkHaZgz6ZntPad8rsr5Hy2BTs7H2z7jmPKkG853fi0pDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQU03HEW/tpHCiU3sbbshWT8i8Q98edjOoYj7p57EHH3sPpcyK
	zfervjB4jOkbAjRsqSl5qulG9nmmXezVnEQ681oxPfpa5sj0lVOKWnm/7ahtyIOBkYtGqzxLeru
	txfZB5oca5AZP4LCgCJ2BdWv+BAoYI3qFOF7ghAdjhUMQ83ibZcCoQUIvhaLbb2uoXg==
X-Gm-Gg: ASbGnctqXecNh1zR52pMCNaKDL6814GZhDsY3QWf15ZaXR+6Bl5a69/62z14w/UMsMb
	KnJb5rkQqmCxawZLI9fG245T5biWcErpvRzu3F5Winn8A38aba3VxqV4dnMwdLoIFviRp4ogc/7
	8qErp98QuFCVOTOffXIEsnrJsTq9UH7l44qlRZaOK8j4ltI3VlZnzK+ahoNO7dNhPpku5NBxcxm
	5yw/bbFuLZs8W8LCqb+r1F2s3wSiA/WhwWd2ker/uVWpmU5V5uBNqPCLI4B8V9azxLT0CdVeOj9
	WWqf6b3o9CTSY4OCatX943N4MKSItZNyrreX+kEYQFmNqjiNDfd5GA==
X-Received: by 2002:ad4:5d42:0:b0:707:6302:90aa with SMTP id 6a1803df08f44-70ba7c0b327mr153413816d6.27.1755516504642;
        Mon, 18 Aug 2025 04:28:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoAaVCg7dtdc43vun4MXHoAIdJDtyb/wj94R1p37DqIMjS5Ciwuah0xG3L7hnzi3f02mBhig==
X-Received: by 2002:ad4:5d42:0:b0:707:6302:90aa with SMTP id 6a1803df08f44-70ba7c0b327mr153413286d6.27.1755516504156;
        Mon, 18 Aug 2025 04:28:24 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a22321985sm127555275e9.17.2025.08.18.04.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 04:28:23 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 3/4] ASoC: qcom: audioreach: add support for static calibration
Date: Mon, 18 Aug 2025 12:28:09 +0100
Message-ID: <20250818112810.1207033-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250818112810.1207033-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250818112810.1207033-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: RYTUzWP-43irA6qE9ocn4MckZBK2o_T3
X-Proofpoint-ORIG-GUID: RYTUzWP-43irA6qE9ocn4MckZBK2o_T3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMyBTYWx0ZWRfXyF4CCpx3vNZ7
 FeyY0sNaj5J85FV1XCUgVKRbH4sMbfx9Obqwsy5L8fMwyPTfWlj3m36EemXJD0+J8SU/5xDona4
 HsiTGJUbybl/gPPvfnj2odqC+GV4eTdcM9fEykdbl4k/ist4I9y8VEmJ3DnSd3PhD3BfUDinT0U
 s9pFNYm2/3O8SZKnRmoWFtxGaJaKlt2X70jZsdfimUPohQAgD99DtI7eRcdRE/PRRDNnBAjEcGl
 Btm5N9SWqW+k6v1O+tjAylNMpTVobQ/6WtzuU9dcbOhw6tTiHT5S8JS/6nK++8lLJhm3fqCG+/z
 p/ByFN7LZdDzgMgNPdZEF9UVcA189goze+UzOTZc0RGLjDYkVl5mTgf7ST4bfw1p9uUcM6BxKaw
 i4KfZgXn
X-Authority-Analysis: v=2.4 cv=MJtgmNZl c=1 sm=1 tr=0 ts=68a30e5a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=FkCHEUkhfVKCBkrVOAQA:9
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160033

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

This change adds support for static calibration data via ASoC topology
file. This static calibration data could include binary blob of data
that is required by specific module and is not part of topology tokens.

Reason for adding this support is to allow loading module specific data
that can not be part of the tplg tokens, example, Echo and Noise cancelling
module needs a blob of calibration data to function correctly.

This support is also one of the building block for adding speaker
protection support.

Tested this with Single Mic ECNS(Echo and Noise Cancellation).

tplg can now contain this calibration data like:

SectionWidget."stream2.SMECNS_V224" {
	...
	data [
		...
		"stream2.SMECNS_V224_cfg_data"
	]
}

SectionData."stream2.SMECNS_V224_cfg_data" {
	words "0x00000330, 0x01001006,0x00000000,0x00000000,
		0x00004145,0x08001026,0x00000004,0x00000000,
		..."
	}
}

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 include/uapi/sound/snd_ar_tokens.h |  8 ++++++++
 sound/soc/qcom/qdsp6/audioreach.h  |  2 ++
 sound/soc/qcom/qdsp6/topology.c    | 31 ++++++++++++++++++++++++++++++
 3 files changed, 41 insertions(+)

diff --git a/include/uapi/sound/snd_ar_tokens.h b/include/uapi/sound/snd_ar_tokens.h
index 3aa5f4928a2b..4896d8f02165 100644
--- a/include/uapi/sound/snd_ar_tokens.h
+++ b/include/uapi/sound/snd_ar_tokens.h
@@ -238,4 +238,12 @@ enum ar_event_types {
 #define AR_TKN_U32_MODULE_LOG_TAP_POINT_ID	260
 #define AR_TKN_U32_MODULE_LOG_MODE		261
 
+#define SND_SOC_AR_TPLG_MODULE_CFG_TYPE 0x01001006
+struct audioreach_module_priv_data {
+	__le32 size;	/* size in bytes of the array, including all elements */
+	__le32 type;	/* SND_SOC_AR_TPLG_MODULE_CFG_TYPE */
+	__le32 priv[2];	/* Private data for future expansion */
+	__le32 data[0];	/* config data */
+};
+
 #endif /* __SND_AR_TOKENS_H__ */
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 9b30177463e6..617bda051cf8 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -4,6 +4,7 @@
 #define __AUDIOREACH_H__
 #include <linux/types.h>
 #include <linux/soc/qcom/apr.h>
+#include <uapi/sound/snd_ar_tokens.h>
 #include <sound/soc.h>
 struct q6apm;
 struct q6apm_graph;
@@ -742,6 +743,7 @@ struct audioreach_module {
 	struct list_head node;
 	struct audioreach_container *container;
 	struct snd_soc_dapm_widget *widget;
+	struct audioreach_module_priv_data *data;
 };
 
 struct audioreach_module_config {
diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index a3b0f558260c..ec51fabd98cb 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -305,6 +305,34 @@ static struct snd_soc_tplg_vendor_array *audioreach_get_module_array(
 	return NULL;
 }
 
+static struct audioreach_module_priv_data *audioreach_get_module_priv_data(
+		struct snd_soc_tplg_private *private)
+{
+	int sz;
+
+	for (sz = 0; sz < le32_to_cpu(private->size); ) {
+		struct snd_soc_tplg_vendor_array *mod_array;
+
+		mod_array = (struct snd_soc_tplg_vendor_array *)((u8 *)private->array + sz);
+		if (mod_array->type == SND_SOC_AR_TPLG_MODULE_CFG_TYPE) {
+			struct audioreach_module_priv_data *pdata;
+
+			pdata = kzalloc(struct_size(pdata, data, le32_to_cpu(mod_array->size)),
+				       GFP_KERNEL);
+			if (!pdata)
+				return ERR_PTR(-ENOMEM);
+
+			memcpy(pdata, ((u8 *)private->data + sz), struct_size(pdata, data,
+						le32_to_cpu(mod_array->size)));
+			return pdata;
+		}
+
+		sz = sz + le32_to_cpu(mod_array->size);
+	}
+
+	return NULL;
+}
+
 static struct audioreach_sub_graph *audioreach_parse_sg_tokens(struct q6apm *apm,
 						       struct snd_soc_tplg_private *private)
 {
@@ -582,6 +610,8 @@ static int audioreach_widget_load_module_common(struct snd_soc_component *compon
 	if (IS_ERR(mod))
 		return PTR_ERR(mod);
 
+	mod->data = audioreach_get_module_priv_data(&tplg_w->priv);
+
 	dobj = &w->dobj;
 	dobj->private = mod;
 
@@ -939,6 +969,7 @@ static int audioreach_widget_unload(struct snd_soc_component *scomp,
 	cont->num_modules--;
 
 	list_del(&mod->node);
+	kfree(mod->data);
 	kfree(mod);
 	/* Graph Info has N sub-graphs, sub-graph has N containers, Container has N Modules */
 	if (list_empty(&cont->modules_list)) { /* if no modules in the container then remove it */
-- 
2.50.0

