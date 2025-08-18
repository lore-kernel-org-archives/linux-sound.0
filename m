Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1371C31B13E
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 12:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755519776; cv=none; b=rIcWvfZTwtqMUVKOlWXs/eZqKVLUMF2/KW1k5fHaMvwtZxC0jER+OdKBqUdeGAZETsfUrfnPcYSjpnWAwgn4HRtZLj/5LfpQPKS3n06bpOXDjntSnvjTrRu0grzR7d9nGJQObuJwaB+stIXfQDckQGGlZfUYbArRw2mGfb/AijE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755519776; c=relaxed/simple;
	bh=0r9Hyf0nVDtZIhGlg9pnxUosjJ8q4m1DneRXJydATCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VG9B/BuHYGqBTKxxoy4qQ6Sl/qpI3tGQOcHqAwQYy04Q3vij/9YoXhkxXxVzt7gaLvp34E1r2DCWqqBPz7UFWwbYIf0BzLWEHO71ljuhlTZ0BgDCSNcUGdGscUZOAThsj/ml4KIDi+SBVpK1yrqyO0MGN21vGyXTE7cmOoep/zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NQqU+qG5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NQqU+qG5"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I7VTE6026740
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 12:22:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cxCH5jc9rps
	/mrQJQ1gQYWQ3StnbOOQ8G8DFqXSrAMI=; b=NQqU+qG5FXHYClKSYO4okcgO1L+
	y41z3kZdy2irxE/veyMuqNixo2xoaKMG/u3UWlzINpOIJcePQ+DA7IQtPbqkS6Yw
	M/1yMnY/9ggBKmp9wLBdJrEmcQ/RXzEFcS/7DNt+vOtKBvJkxrE5bZwxybtCBEqz
	k+f2l4wjnHQ8ndeOMtP2IE4xS7QC3N9GHFlZwDGYgHB6pMTSH0okImCH/MDk34lZ
	k3zff6RBqSBuu7VR/fRRXpBWGq17TAQZ+sg8XzksNhfq7RacPTWGCHJELbJcoB7Y
	7ZYOq07DsZ8nsL1y0c7Zq8fvZAlifehu+ToAQKJv6Ivbd903dru999+5eEg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48kyunrvg5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 12:22:53 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70a88dd0193so97085776d6.0
        for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 05:22:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755519773; x=1756124573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cxCH5jc9rps/mrQJQ1gQYWQ3StnbOOQ8G8DFqXSrAMI=;
        b=xBXZGB3mTYTRpNLR51D6ipwN3546ym+B0hymWfygLvlES8xFCnbRO/k+bBaq8x+fu2
         ODLn34sW5r3aCADAIEIwJ8xTsllx9ELh731xQEsTid3MryvS3BHZ931gu13btJqXO70i
         ELcX/nBuAfalh0G1NLchVag/i5n05K47zqo5ITV6cV2b3A7J0ylGIpKSspv3/3Xr9i2k
         twL3OZDVKDG1APLDQWzjYrVzgflQHA9pITnGevZzCd22Bc9TdSyrhLFBWNRFOE+oCB5d
         iYGrJoG3gS6qQKTbChsLcdOGunyQ0TXqM05bgsdzR0SwPevI+Qi37B8/Dqy2H4p+8nOQ
         T2XQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6ZunlHOKQrLPGu7sYhGYHIbKoMMzbEPOhj088+ZieuGF5KAcuES6T2CTZlC3No1qNYJPMspg2NGDsiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTP7+GbKfR4OUBoNIb62T7/Go84HtrTbUNLGbV+gcXRdf/6Unl
	t/NL8pXEr2yLRkufk36wnbw//avt4F0IZaeIQELM5ikqOyr62xohHohBE1n7QkP0MHCSodPM6Cc
	q1LtGRAqf5qf452hgO/+vOYh9LcYCtpbQP6IrZrFiIJwNG1BDXP2wq6BIGpM7CgzUmg==
X-Gm-Gg: ASbGncs7xHPtt8wgLYuevJ4VKZwmXLFOzY1Yge0TAOSQewSNc3Sstz6RARtrrO58JlR
	iihkg2k0mtvIGNJViTFHVHADkRNDLZM1j1o4GuIGRK7PYe00qwTIuO5IiV1D5Sol8ZSJ65Xf6hG
	4e15767kD9eLcPDD6seQsK8KySpxm+4uWgqT4Xj2M2z2S3MZ0O4ANlNZz8PGw52qxJPjcK6iS01
	c7xBYJx0Jex1JbN6cko7geNL/09pZDjyBsqusq0hR5F+5ysj6G2UIGAuwCjlVlP++zAQvEsm76j
	tD+wKXsNRTQhu2S/YnAyk2I39T3kDYik5lrdq0SeqRaOSd7R7AcpsA==
X-Received: by 2002:ad4:5c43:0:b0:707:5319:d3f1 with SMTP id 6a1803df08f44-70ba7bcd758mr132199146d6.32.1755519772821;
        Mon, 18 Aug 2025 05:22:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhUYdasV96pnAGAVB482zMVwB+ztPSFkdJL7AZgDt1OaA3hCb8rRc++U4kwgJmxmJWnSwk2g==
X-Received: by 2002:ad4:5c43:0:b0:707:5319:d3f1 with SMTP id 6a1803df08f44-70ba7bcd758mr132198696d6.32.1755519772199;
        Mon, 18 Aug 2025 05:22:52 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb653f657fsm12601563f8f.29.2025.08.18.05.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 05:22:51 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 3/6] ASoC: qcom: audioreach: add support for static calibration
Date: Mon, 18 Aug 2025 13:22:37 +0100
Message-ID: <20250818122240.1223535-4-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: U06lkoUsJ44vMOzsfY5PkbZhWiMF_Esc
X-Authority-Analysis: v=2.4 cv=N6UpF39B c=1 sm=1 tr=0 ts=68a31b1d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=FkCHEUkhfVKCBkrVOAQA:9
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDA3MSBTYWx0ZWRfX11v9PN7gs1z7
 PmVYYtDKca3EeTUDEXo+o/Sdig4lF626go4j7bH3JdcSxj00tlIOxaHvzWmwiNduiSInMj/LHkm
 1Y6VdykUX3URchPkaGlFpXGy2VhMir/B/UNnY1LDfHNoKn3+3V0hcepIj6npb109dD6Lt/YiK4h
 /Jymh+4G3XOgIFh8rR5GnMo4UXvggziiyzSMmz9DytxA4Kin/0MJsfYTAfnLwGQ8EndUSroM+dM
 5hQc9mgG3Z6C+yf3p7ifXWHga8i4ezUCqGGGKZQKn2HNqnoUEEocnz2zBfFdzeVMO9VgTolLkFu
 8mw9yosXCoEFM2mvTc43u7mFaGLk2XTd3o4soy+RJABZ84iTTdJq/l7c7/foqq2KBeeV5YFtEKv
 Ra910hBH
X-Proofpoint-ORIG-GUID: U06lkoUsJ44vMOzsfY5PkbZhWiMF_Esc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508180071

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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 include/uapi/sound/snd_ar_tokens.h | 12 ++++++++++--
 sound/soc/qcom/qdsp6/audioreach.h  |  2 ++
 sound/soc/qcom/qdsp6/topology.c    | 31 ++++++++++++++++++++++++++++++
 3 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/include/uapi/sound/snd_ar_tokens.h b/include/uapi/sound/snd_ar_tokens.h
index 3aa5f4928a2b..3e18442d383a 100644
--- a/include/uapi/sound/snd_ar_tokens.h
+++ b/include/uapi/sound/snd_ar_tokens.h
@@ -120,8 +120,8 @@ enum ar_event_types {
  *						LPAIF_AXI = 4
  * Possible values for MI2S
  *						I2S_INTF_TYPE_PRIMARY = 0,
- *						I2S_INTF_TYPE_SECOINDARY = 1,
- *						I2S_INTF_TYPE_TERTINARY = 2,
+ *						I2S_INTF_TYPE_SECONDARY = 1,
+ *						I2S_INTF_TYPE_TERTIARY = 2,
  *						I2S_INTF_TYPE_QUATERNARY = 3,
  *						I2S_INTF_TYPE_QUINARY = 4,
  *
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

