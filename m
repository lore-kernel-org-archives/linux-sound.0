Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611373203A6
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 12:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755521469; cv=none; b=p6kYUnBGr4MgvlAdLXYMYdGMYo/tI/ej2Iov3P9KSCPNA9Cr3NkSrJsRBH/2/+PmVK5a9LvIsHxP7ro3E4pL/zDXwtPmL9n2mJjW2RVP7bSCp/v07o3Prh4/3oZzTgEWbmZJDQJENz8KqMkTj7wmOLn4/9Z+yPLla7eKw4sIzHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755521469; c=relaxed/simple;
	bh=hpGzTc0IFp4kxDa7L0DoR4eGGYq0Ed7d5aUx9Md288w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hw0Diww+grGmO6Et5xJI8+KhckaDnb/+AJaRqsmqquXCJ21Nv5nPlO8yvpsfiAwTqsFG81oO1e10v8wzC/ksGKdcIo5hutiXtnKYuyQtP4n9MqaImEKQkAiVh5i706fnfDxRH42p8Acd8fpxnCTOYAFUDZpgJA1XCSmuEL/vsig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eySm4jvd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eySm4jvd"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I7V4SF004123
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 12:51:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wM721AZ4mzS
	KZrE5a5VcC0lVzer8Uu47S0uTwNMIfYE=; b=eySm4jvdMvCNiwdvWVrd4dof1wN
	qBADJaaN7nwfOl5MPIMlb/w3m0nsUHlj6IHxuIouvJBoFo0Q/bEfjmWVvz0rNuSK
	VyxhdoFLrbMr9dWZkL0mhRLLBbFCUhAR5MUA62Ncln+Lw+qvxGhbl5lXxsRje+o6
	2XpAzOyiQJiiSbhJFYBlJx87AQTtTxpzqSHXqkvQ7VU/TRP2DKVu9AGy522TTmnL
	UirdXHtp5qG3l6MB3xQQ78x6WGt/dV+MoSgUl20qH09N9lQNRpDYxc44DzwCH2LZ
	vqrJz+H8FTFU/vHSsz0hzHnwZrlmIDsaX94f7KUYhdHoIHFs4KwRNUw7knw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48kyur8xp0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 12:51:00 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70a9384d33aso36617336d6.2
        for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 05:51:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755521459; x=1756126259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wM721AZ4mzSKZrE5a5VcC0lVzer8Uu47S0uTwNMIfYE=;
        b=KojvCRum+MXIPkbxKTRiEbgDlNEq41uMZegmpl1j1L2wpA5f6MiTBMKsz0gNipbLUs
         v4rV+HaQQ+vRjxQCAs6Vo3ZWXgYHk+wJZ+/ceeSXboYNIbt1AfKdXGHwwEl1Cp+TQ3uw
         Qsr2noX/r6WAslXqmh3MUplMdQntmPeo/sWjJ6iW0rmYI1EjATT30koXkB43W9sDUDL9
         NoipX/uNl1Lom/YPRFJNbAqljSNvwm+7Mb8i8VAwGdHqPoZlF+EPcOLmGeq/rwQsP+Kw
         WYWe9nQNbX/YERpqTrx7AJdPLZ47mSsgyo6gk42gAJaJKNg/XM8VuiY1T0MG3jE18N73
         Gu6A==
X-Forwarded-Encrypted: i=1; AJvYcCUzfh3mGEtN+r59omCEyhhPNJjBGAlrwEDYpIELFvqlWlfPd8dt9l9e7AveeUiQsmjLb5OJllSRbI1cNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzR42MK6HoZBARL1sNrDwi+hRps6eX5+fuG/c8OW9z4q0qUajKE
	0sxJf1wiMWpP9xydNLLTyzTeFk0dBnj4rD1wUutvp8H9LEyq+EVd7ADNxU9g3a7iR/zl7yr1UBG
	66lJrUczSclRfgQhW049xcz5mO+GeqA4MuNbVQlHfJ90Y6hBop4US3A0G1CASqX2suw==
X-Gm-Gg: ASbGncvJ6vYzLuNLHiCtCnBS0nGj4YXS9elsZ+yS1RkkEO6D1WGAy4TurWyZp9WjFui
	pclTOMEqpaWbU5m62CjOpyCg4vwlRUl3zOB0a9MaJTVDubpmXwbQCL6+xeDS12Ov3VR6G8nxf9e
	cVLetrp31laE7/WOVJtzH5SiZdUMgZAOL1slrvf1UdX7MDBo3/TGa8Xg9S0ORusnpDNIHmVFubS
	/yLpa4TJrX2OKaPmJmJP0X5Ohuoqxy2jsvQaUSMekYr2RtmbZT97CmXad7fN81pdMc+PkIQnuwx
	z2brprQuSLp+OaF9KzCuqUMv3V4lBL83mpVUsjlGKHWcNCJiGuJlFg==
X-Received: by 2002:ad4:5ecc:0:b0:709:65ec:834d with SMTP id 6a1803df08f44-70ba7c074c3mr137812836d6.30.1755521458796;
        Mon, 18 Aug 2025 05:50:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeBiZiWiyk62FtVrWZh4y+IKlDpVh+YIf7vQWzRL0BaK1P6yLQnxcA/7BsloB89i068HuBDw==
X-Received: by 2002:ad4:5ecc:0:b0:709:65ec:834d with SMTP id 6a1803df08f44-70ba7c074c3mr137812446d6.30.1755521458103;
        Mon, 18 Aug 2025 05:50:58 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676c9b27sm12537347f8f.44.2025.08.18.05.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 05:50:57 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 1/6] ASoC: qcom: audioreach: deprecate AR_TKN_U32_MODULE_[IN/OUT]_PORTS
Date: Mon, 18 Aug 2025 13:50:50 +0100
Message-ID: <20250818125055.1226708-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250818125055.1226708-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250818125055.1226708-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDA2OSBTYWx0ZWRfX+tSw+kN14grb
 CWAB//Zl4BtQ9rM9QmW0CBy6G3ef3Qz+vdnxAaSLPqes38EBobhO6lTP481SsX/6LfI0NLRMGNA
 mrpgsClgrqwLOAqQcEW3FxKZ3Q8joaayM2FCa1/3wnHoQ4uWVKMeqf14nwZjz94SCKEop02+YpT
 Ip5NDbauNYKc0DzpPb55zfYpPoHj9JYwGbU7CajVOFBz1VNO5KeeW31GMEIc47cavbR2cRDjzv7
 oXn/3gPEkViYKgzy/vtWgVc08SjMb1zLgyWITfP72Zhaodwzd0N6xo11ZmXjJvyqIxdtFfr2uOs
 XuRi4eH0+ZHINSnyRcFkdzu7dCqVwgCWNnecotq0y4zL68l5CQGGnuVMPEKff0hf7gA72g4zTUq
 DEFus0E5
X-Proofpoint-ORIG-GUID: bLq-QOjHdTCYGhaWuX5HtQ63dXVBUX3h
X-Proofpoint-GUID: bLq-QOjHdTCYGhaWuX5HtQ63dXVBUX3h
X-Authority-Analysis: v=2.4 cv=YtIPR5YX c=1 sm=1 tr=0 ts=68a321b4 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=zhxk0K_MHdi4n0KV9BwA:9
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 bulkscore=0 phishscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508180069

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Deprecate usage of AR_TKN_U32_MODULE_IN_PORTS and
AR_TKN_U32_MODULE_OUT_PORTS as the connectivity of modules is taken care
by AR_TKN_U32_MODULE_SRC_OP_PORT_ID* and AR_TKN_U32_MODULE_DST_IN_PORT_ID*

Also this property is never used in the drivers.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 include/uapi/sound/snd_ar_tokens.h |  4 ++--
 sound/soc/qcom/qdsp6/audioreach.h  |  3 ---
 sound/soc/qcom/qdsp6/topology.c    | 10 +---------
 3 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/include/uapi/sound/snd_ar_tokens.h b/include/uapi/sound/snd_ar_tokens.h
index b9b9093b4396..bc0b1bede00c 100644
--- a/include/uapi/sound/snd_ar_tokens.h
+++ b/include/uapi/sound/snd_ar_tokens.h
@@ -184,8 +184,8 @@ enum ar_event_types {
 #define AR_TKN_U32_MODULE_INSTANCE_ID		201
 #define AR_TKN_U32_MODULE_MAX_IP_PORTS		202
 #define AR_TKN_U32_MODULE_MAX_OP_PORTS		203
-#define AR_TKN_U32_MODULE_IN_PORTS		204
-#define AR_TKN_U32_MODULE_OUT_PORTS		205
+#define AR_TKN_U32_MODULE_IN_PORTS		204 /* deprecated */
+#define AR_TKN_U32_MODULE_OUT_PORTS		205 /* deprecated */
 #define AR_TKN_U32_MODULE_SRC_OP_PORT_ID	206
 #define AR_TKN_U32_MODULE_DST_IN_PORT_ID	207
 #define AR_TKN_U32_MODULE_SRC_INSTANCE_ID	208
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 61a69df4f50f..9b30177463e6 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -707,9 +707,6 @@ struct audioreach_module {
 	uint32_t max_ip_port;
 	uint32_t max_op_port;
 
-	uint32_t in_port;
-	uint32_t out_port;
-
 	uint32_t num_connections;
 	/* Connections */
 	uint32_t src_mod_inst_id;
diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index 83319a928f29..a3b0f558260c 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -412,7 +412,7 @@ static struct audioreach_module *audioreach_parse_common_tokens(struct q6apm *ap
 							struct snd_soc_tplg_private *private,
 							struct snd_soc_dapm_widget *w)
 {
-	uint32_t max_ip_port = 0, max_op_port = 0, in_port = 0, out_port = 0;
+	uint32_t max_ip_port = 0, max_op_port = 0;
 	uint32_t src_mod_op_port_id[AR_MAX_MOD_LINKS] = { 0, };
 	uint32_t dst_mod_inst_id[AR_MAX_MOD_LINKS] = { 0, };
 	uint32_t dst_mod_ip_port_id[AR_MAX_MOD_LINKS] = { 0, };
@@ -455,12 +455,6 @@ static struct audioreach_module *audioreach_parse_common_tokens(struct q6apm *ap
 		case AR_TKN_U32_MODULE_MAX_OP_PORTS:
 			max_op_port = le32_to_cpu(mod_elem->value);
 			break;
-		case AR_TKN_U32_MODULE_IN_PORTS:
-			in_port = le32_to_cpu(mod_elem->value);
-			break;
-		case AR_TKN_U32_MODULE_OUT_PORTS:
-			out_port = le32_to_cpu(mod_elem->value);
-			break;
 		case AR_TKN_U32_MODULE_SRC_INSTANCE_ID:
 			src_mod_inst_id = le32_to_cpu(mod_elem->value);
 			break;
@@ -550,8 +544,6 @@ static struct audioreach_module *audioreach_parse_common_tokens(struct q6apm *ap
 		mod->module_id = module_id;
 		mod->max_ip_port = max_ip_port;
 		mod->max_op_port = max_op_port;
-		mod->in_port = in_port;
-		mod->out_port = out_port;
 		mod->src_mod_inst_id = src_mod_inst_id;
 		for (pn = 0; pn < mod->max_op_port; pn++) {
 			if (src_mod_op_port_id[pn] && dst_mod_inst_id[pn] &&
-- 
2.50.0

