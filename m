Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B18C31A04E
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 11:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755516509; cv=none; b=jRUe3N7LLbTxByZvf+p+HxhqsNcICahZeiYbanoyB3yn8tbNC/4mdx7QAnK7ruCpWGu2arBlb4bvuQH5X8/EHDdn8aMSxBjJZxv08UcEAE7jwj0CwtBnjr/42/sMSXyAb0Y1yGCEkhb4FCZv95ORskf4qAJNNIG2e2qpSG3W6Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755516509; c=relaxed/simple;
	bh=7YHepwuhOJY63DTXiXG877/iFdeDIgw0g0diALJOzrw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gCtdvuqqEEVI4hl7D91xpWWT/0pskhl1PlBocXR1A5sPzW6MnfeWuoJUI186EdKnehaSFiKOOPLeLvNnGDXqZzjV0PBq0NcLjqVBbO/rNcPHqyaFnORtGi+er2MeeElfLU5TatB2qndjUpc9VSfSovcdY6IglhKlaVBsP2JTZJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dF6Ojwep; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dF6Ojwep"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I7V71G004165
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 11:28:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4+wFXC1bMsd
	mzWY8JLHSnVTpvfhHOd2YnF+XgmDrNUE=; b=dF6OjwepdyGx1dXEVufFycOnKb/
	ItyIxgcs1w7GpEbg7vF5ezZdLy19lZbOwoZoYaWaWcie3h4P4Zy/YTsC6nh8xmjv
	H8YqoUa7CPUWm7ljtjFVU2qFCnAXgVWh7vsGn8kK0YV45FRAGBriknmIhap1k7V2
	odFIu0W6YMaEfphTLlKI5kvCzOMdL/oozLKIE29Ic3LJJpXyDH9uObOVvgZVStcS
	bOISN+m+9wzZBqa29Nn9cqeYOwRgJyqNl9RvXtocptUex7TGavfAFA4+so3FTQIk
	hNeATWqXiftr8LFV3BgE4sDMACaE8TmtgdzKX8Y4mkMGg2wFuDzUcMGP1Hg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48kyur8nty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 11:28:27 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70a88dae248so88280606d6.0
        for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 04:28:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755516506; x=1756121306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4+wFXC1bMsdmzWY8JLHSnVTpvfhHOd2YnF+XgmDrNUE=;
        b=NMKIJhpRQTLm6P72t6GpJAXENzLQH6PEGDMosZ1ix4+9VzjV7vMAmlCCRfZoLHkuIb
         eHOcxY7IqB6p/DPNwWuaNz3H+PCys5D8JxGB5Jb3Ix5nQ7MNzLZW04zYM8WmDAOSDW96
         i/qlC4F/dn8snz522x9Mm+qrFzAmMAX85yx7vdGjN9pOY7CMAP0UlIYOFlpZLjLv5haT
         1j4ArhZUK15zkN5XWZ7woLH68rmMMWHOqLHuJxVvpdV+l4wbdBhgS1f09XTFqGXfakzi
         CNefZhJoMdLCUOh6/7Eydt3fT4aveYEUB0UwsvVmhWgXd4fY9kk3zvFVwROgmO7GtQUK
         dIIA==
X-Forwarded-Encrypted: i=1; AJvYcCWZaJzp48StEnoceomRx8nEOsQgdWqlWz8o5h5LHiY6tqridkesQi2jKVrUm6sCsWhYo/Uvva2NyUTgNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwD3QAGW8oQxyL68Lg69CuFQKb/32OYyRmQN9hyqtSVwdpiXeiV
	RNado//NArQqdBiNhaLsb6O12SxwEcbdwRfjJC8bXyHX+LFsMR02cIZh6vCWh2W1P5vRVJ5tAPd
	G5pj9wcnJkOOk3pdXw/Lw0XTCn4konC3RyQDZqQIjLkG5mLz7P7Om3DJcqO6ZnzvyDA==
X-Gm-Gg: ASbGncusqZMOLLeLKIv+YU9qg/LkKGGUY8f+fB0JZ2I8z+UvacbcL4zgnZdP46+p1YW
	ozOy5RNi4mrPBNEiCJCP6xdcGR9q/Zc+jEkR1PnFfexjiUZDENjNwbfyNl31wulCJm6WtkI6WoM
	oByKv0w6NZxl1Iv31AZHjh7c2ahTRyTrGhMNbnjqSVGD7cGp/qmRTZu+EsKja8khGNtRQ8bvwkt
	GNk9pJqyeRKFz40uKfSp1b8eCpsLlV/0rk1KdS5XW+RbII0nYxPOXbETWFzpNQmO8hJQSFm6+N2
	5Db6Mfc4xI5K7S85rYu2K/SS55KMLFeWgwPQcYgWM7WEvYnPC3xdzQ==
X-Received: by 2002:a05:6214:1c0c:b0:6fd:3963:7a7b with SMTP id 6a1803df08f44-70b97d16604mr204923666d6.1.1755516505540;
        Mon, 18 Aug 2025 04:28:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHP+KiptgfDG6xcoSSl5xxCTWMuHxndUXFTpZBE9EQe2O3f18HVCgRA/uELxALMM5far3YWvA==
X-Received: by 2002:a05:6214:1c0c:b0:6fd:3963:7a7b with SMTP id 6a1803df08f44-70b97d16604mr204923406d6.1.1755516505120;
        Mon, 18 Aug 2025 04:28:25 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a22321985sm127555275e9.17.2025.08.18.04.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 04:28:24 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 4/4] ASoC: qcom: audioreach: add support for SMECNS module
Date: Mon, 18 Aug 2025 12:28:10 +0100
Message-ID: <20250818112810.1207033-5-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDA2OSBTYWx0ZWRfXyaougUNWsut9
 ooETBnc96J+j7T3zMo9oTw3VLFeOv2phu/X4vZTf6gQHx28//4dHAZ4XkbzMELr3xPWsRm+btAB
 bW5XQGpRn085i4Wl6De9YNaXOl1bQ4ZuksO6li/eIf48LRIlafXgqTtHVD67h1Ye9w9poQ7v2s1
 yXOwwdgNv/rTHCECLmuzXGjAGxU+GJ8cWCPZFS5PnN5GOdHrWnRHuK/vdslSA6hDGgzxb9wiUA4
 7MPY94cLLKp0y5Wiv7xv5EQoqngeonFQpvHfuumm7NNovwYHCnl1oqQqMHU9attrQXqj/SsFlUd
 EDoerMgw8CC5QfNl04MJ9yKWd82C+h5wcJSv1fch0d+DG8ALaAHcvevevXFCeyy07GjhufqzAg+
 EE1QVGME
X-Proofpoint-ORIG-GUID: atE3Qi7kYFQcZifYe5QHy-4h1HLxx98n
X-Proofpoint-GUID: atE3Qi7kYFQcZifYe5QHy-4h1HLxx98n
X-Authority-Analysis: v=2.4 cv=YtIPR5YX c=1 sm=1 tr=0 ts=68a30e5b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=oi9uD5rjtjE88QS_ecgA:9
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_04,2025-08-14_01,2025-03-28_01
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
index 617bda051cf8..2ae6420f4b6a 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -30,6 +30,7 @@ struct q6apm_graph;
 #define MODULE_ID_MP3_DECODE		0x0700103B
 #define MODULE_ID_GAPLESS		0x0700104D
 #define MODULE_ID_DISPLAY_PORT_SINK	0x07001069
+#define MODULE_ID_SMECNS_V2		0x07001031
 
 #define APM_CMD_GET_SPF_STATE		0x01001021
 #define APM_CMD_RSP_GET_SPF_STATE	0x02001007
-- 
2.50.0

