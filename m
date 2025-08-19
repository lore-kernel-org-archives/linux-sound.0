Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDDD17996
	for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 10:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755597726; cv=none; b=CUSCh9Uta1BRKj4rznQ/MY8fOOi1a5ZHqGWhqAOnx1bM/raqsH4kWAUaPrZJQ/usVwx9F9pnOURl0tb2aOOhyeZju8dwimz90VDvouDhRNq5Yhk7sgQJAvE6B94m6Jo36iVjtHriChAIGquYXHa4MAkBbHPH2mllNmzP2h0oZ4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755597726; c=relaxed/simple;
	bh=hpGzTc0IFp4kxDa7L0DoR4eGGYq0Ed7d5aUx9Md288w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k2mkUbpjEOoG8AAqhxOcRl9eg8XeEXM0Lh6Itjbr1K8m/H9W+NSSNGQt2m9EqOvBW68KOYCe/z9qVOKGfYalkbqxkLoSkp/p828JR2ZsntApFztxzXuMfwtfO+qfIx8Z8a8+o8CK34GiyHnNYFFhGHr6waty46mi3+3ckpEkbnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hjYcx/TU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hjYcx/TU"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90Yql018016
	for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 10:02:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wM721AZ4mzS
	KZrE5a5VcC0lVzer8Uu47S0uTwNMIfYE=; b=hjYcx/TUMXvNSqDtniaz/Kx7eHk
	JkSc9zrai0/p3Nz2VFPzF+rgRWwFEbcuRddDLRVmdnlqhdM1RKh5APHTGG7RK/O3
	8TvfXHpMppRzkYkazUyWIppFwYodUt4EaLhR+VnA9cHKtBKG0OJeuTDm4FG1Fnol
	B3QJWLYkihQVEFoiQ+dJly7aDeGZs6CTalI+9gthFM8Dho5Lbu39U9REcncZuo3X
	4u0eMuqdBXpc1KKGORdfeGMTt2gyZtqTcrZY5AfP8snkLKtp+2eBarxM/gh0tBJ1
	/dY5piKu3+4SRAAd2UY7f7xMhA2oV5asxtr90sgoXRCijJlWQZRpcmXJNiQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhah01fk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 10:02:02 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70a9f636685so172690016d6.3
        for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 03:02:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755597722; x=1756202522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wM721AZ4mzSKZrE5a5VcC0lVzer8Uu47S0uTwNMIfYE=;
        b=Kpj0Yd5KuA+9ZXDoCVlhYcgYQ4oQrQO8bzpDy9fPFiVBuKy9IpdufAlXDCLRX4WXua
         9PMbC70awMWXb8k52uNohGWeklxCQXmTg4+qxvhRnR02rlKa7kuPEAeD9O06HbQJbNZm
         m2MKDsz2KRjLl3q7PHW4IqDfMQylgCloeSvmtkfwhhw8aZtClLBVBlnu7pgHf4KFF5ex
         VfeA/1FAwm6U0S+gROS0lbhGzJrMYw7LkoORbC27AhsvqYE8Y1zQ/f/EIGri7wixeBgX
         dzFIwgNEFxvgQxEFoFKk8WrGV23zH43GjbzfDCdwa7ke2LYdukRyEiA34ODYCVF64n1c
         BpBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtzKp2qVIvIzuoOJoSBYIqGcKag+ACWLINv9nhN7fy1Waha2VNTHuJ6YoicaeylP2q4FPZjkqIEH9g8w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0xcSvwDQp7pPIYuxWGkzRw0pWce4GVr5w5L3AgahRxTPqDuYz
	NQJy4ydoPAE41QVD7tnJ8dg6U0Fh/rBrH7Kvl/rUU6/fHscZDIAComx7Ww8IeLHmy/l4lcjs7JW
	WzxzAnhVZzattvb0xJoTTR03G8uWqkyrWqZns+UXevXcOgPiVtVZ1eWKcot8wgAFNnQ==
X-Gm-Gg: ASbGncuNTbcDLmZzMi5EHSNsvsN9vDA1OVHlFx36Qxpdo/4eWs9X4Cbl7Sf96v1ocy5
	cLrTDVObrwzICzLKhbFaLitH4xbvC2NZMFnNRSkhVc2c9avZ0W9C/+q8TBcaUGc5waxtWMQAhS/
	yXENiweFAI9artx+BqMsC+y1OjdzHi2oKHXkczdX78RglJ07Cr6/F+cwEzKb1SmL4CdTSiYglGc
	ASTPW0PH80szIoytukmVdNUjR4JWXaet+OJfrtWwxeBNnnwAx2helVYpgXZT3xYljSVW66NxOna
	3MOXZIF16PYPX59lO4m5CFKMcuByFbHH2zMMA8GG4Rw6QpCW0Yg0bw==
X-Received: by 2002:a05:6214:401a:b0:70b:7058:4746 with SMTP id 6a1803df08f44-70c35b97b10mr17744296d6.37.1755597721896;
        Tue, 19 Aug 2025 03:02:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNFvk99moeiVgwrJWZ2vKTW8+g3BP4ueZLIORhlPbQjQBhgufuANqDaWSbk/5MT7fJn2X//Q==
X-Received: by 2002:a05:6214:401a:b0:70b:7058:4746 with SMTP id 6a1803df08f44-70c35b97b10mr17743836d6.37.1755597721420;
        Tue, 19 Aug 2025 03:02:01 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c78b410sm216169635e9.24.2025.08.19.03.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 03:02:01 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RESEND PATCH v4 1/6] ASoC: qcom: audioreach: deprecate AR_TKN_U32_MODULE_[IN/OUT]_PORTS
Date: Tue, 19 Aug 2025 11:01:46 +0100
Message-ID: <20250819100151.1294047-2-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=D9xHKuRj c=1 sm=1 tr=0 ts=68a44b9a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=zhxk0K_MHdi4n0KV9BwA:9
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 5K9l3j0KABxIjEuJctAjhm9bzxUQXaJf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyNCBTYWx0ZWRfXwRXwdg4lJHOn
 jeG5900vJkmjz203qnqEOJUac9TK204vQAVds+d+43Zf6+yhQbO0wv2deN4OvYElMverEQXVu84
 wzezltwL9UQIp6T8XWFThLrBGZU9DA0ND5DrZpa3mKb9o9zXYE9zkDQe3h3oH5FVVz2IZ1RhCtv
 J8GTwKkxR8kTGxKXkF27mjM0WSErWEqvYrbm3fZObfthUvz++1h4y/RUqXaRXBS6q8WPshvalH5
 fTLnoKW2ha1AuXBU624kSSZTdiPrFlyEqwlbFqNKg0MozqjnLimIM3o4p0+37iCVUcTdrragrbc
 Aw2dKDZRK6ZXCKPTUg9hx/AEe2MhjWj32RcD05/Ww/QFSvbvn6BbGEPK0mpA29pRxAn1fAyAjso
 w9hwPOro
X-Proofpoint-GUID: 5K9l3j0KABxIjEuJctAjhm9bzxUQXaJf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160024

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

