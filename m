Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A68930E0D8
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 10:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761215177; cv=none; b=gFYxakketlAzBRI0ljBomi2Hkt22jCjXfACgM44LoF/6TlTU4RubBJOsB3TiiT/SV5keHJNfGAWbntikAKFbic0FgoMsSXfCiIJse5vQFoWmZtv3OY8VfEx1u/7AJgKJlSXSM+VYu0S8p3uV1ohsH/tyLN5MRDy4GeMX2EDTmXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761215177; c=relaxed/simple;
	bh=DqFc1lEyNlYSTnRSRWLFqbyGVZBJ7IJEhAOyAV3lF1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mT3UTc/BtD3f9zwR8RIxbmsNzXkOexYafJGXbxyjiLlRSbDvhasVuhs2YEsCElWwuSx2E9CjbVODTH0Z6in50FDC549CytJzsQaZJiARYXKa7Ark7Moc9Zxfi7EMx1YWP4QaZYuuNz6kiz6wdatsLu7lFlzLdALyhyW1ZWxur9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lDo5gsmq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lDo5gsmq"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N7iU8k022503
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 10:26:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1mabdmqX3eI
	X6g/fR4x0Rd7F3iIr79oESHYJTHYzAW4=; b=lDo5gsmqju6fplgcndLZxJE8T+d
	f3/hr0AHVs5i7IjMExNfUOWaBdjo69LLl3P3JV7SlYr8IcEx6vA91dQai/MZeSJo
	RGOPW7+8ge+1enQIg3a/PdkqlryFG7q4y+QUOcLJa51t+NA16XNgfcfC+LVTlkVO
	2+Ep5A2k1BvaoNLNTnxKIiRgKcj2jUs9vRn047OEcfCAhCzcdy+ULLgIqhFyRSoH
	KBp7BLgzizT60Qye3cpG2DA+ArP0zJoqAMl6/wsF3SBac6Xw4iVpA9ICBnmtPNLd
	wY55hLV2HzBazBInCP+Eo3uPyYhMxNh+Aeo2XnESJhA1IiJ/o/hR3FqdKUA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w8812m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 10:26:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e8a387d01bso26943561cf.3
        for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 03:26:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761215173; x=1761819973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1mabdmqX3eIX6g/fR4x0Rd7F3iIr79oESHYJTHYzAW4=;
        b=rFid5K/gK8TSZ2eggklfWQYiv/nZqT/UZhvAdeK9KA0UMpe6sT5ExA4J9xW/LQoWFs
         gooaQSAeUkNImQleODGwsduh9+8ESL2L9dTdEwqGqy26zhHiwdrg22/BnwRpTrjOGVPx
         SzqeH2lAp5SX/p/W8Y+hb3uGED5XaKSpTETLJqWlzeWVXQKXnGePkDQbUhRavskkhyz4
         5yvAZFEzosy/ZtOAXholEuVsbKYt8jzUb7GrVbKSDAq/zTg6sEWpbai0aREcXYbizPXn
         vQCq3YRhGMiaI1rNn+G7L2y+xnWZZHALatFN0g5KDoEq7Z9CL3+ZebMNB/wS78fdxeeO
         q7xg==
X-Forwarded-Encrypted: i=1; AJvYcCUL7lbpVX8dTRgxTR5RikL24QAYjMMLmmEvznOceFAR0/xvDr2f6+089Z+gPvu6jWQjWzIv9DX4OGiuvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQO+2Az2nLCFkwLKX2rO7p6DwOGsGSnfTw8uUZwPvaGaoZZc4B
	KuJ1aiO9WplmcQyOaWjljUJZOxH/fjw/LnIApKOeLhIfbJsqdEaukRft34FNPYPtS/1P0ilc+SW
	2mJ6DhU/bX/5Tk3vTEecQYC4jceYQtRUcSBh9K1w/4xCAmJmV7cspi0kpJmVYSggQPQ==
X-Gm-Gg: ASbGncuFxEbMZ8vaR5S42BGpsjUoiBiwh1TAgWZoZm16/6hfkoGmY6v0K83PmGd1Iuh
	wM4xOKIqQfdb0cl8g6IaZgHgYhftiRYF4zp5uAsLKh4jI7RZXjPSz+ZigdcOnCei6TELmgf2SYj
	cZUyjq0TgaYeFtlQv5jIk22gRAjyhTH+F2kJeks2D+QeCm3epq/CQiNL7E/3k8nvnNapBT1d6gS
	UCMkgFc7nEas0C/8w6ZSjnUMZ9xXTm7yNGjFUUtyeRQwWj/iUQnz4MniwwC3GVJYHVF6xGmjhaW
	jqiwPJdPAqOeYlNduJMaHR2EYH/EvqjmwbySmbC0ZtqG0vbWdxf4xBoPLOlbVWR4APwFROrpb1z
	1krFfT02TWZ/K
X-Received: by 2002:a05:622a:8346:b0:4e8:9dab:2737 with SMTP id d75a77b69052e-4e89dab27cemr239049361cf.56.1761215172993;
        Thu, 23 Oct 2025 03:26:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1r2cQ1Xs6iSILRFVoCL4m3+fRdthOPcOcxyZZCeCH/t6SKBhUh9GZCJ5uRTz69qelDUFttg==
X-Received: by 2002:a05:622a:8346:b0:4e8:9dab:2737 with SMTP id d75a77b69052e-4e89dab27cemr239049071cf.56.1761215172400;
        Thu, 23 Oct 2025 03:26:12 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c427f77bsm92220685e9.3.2025.10.23.03.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 03:26:11 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 14/20] ASoc: qcom: q6apm: Use automatic cleanup of kfree()
Date: Thu, 23 Oct 2025 11:24:38 +0100
Message-ID: <20251023102444.88158-15-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023102444.88158-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251023102444.88158-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfX83md0MgxoZJo
 EfYq81WUtMzzgCYG7tSqy5vOn2SHLqVHwnfg7evXgh+oQw7S0kC6B+yHZn84WQxOHQ6HgmHqVVA
 e9P1bZFhhjX5nEdIaTXRCE9bP8yOwSBtEOwskeUqDeZ4M3ZmFojgs35NlR7vSCgMYwt92ijflmF
 8Sj66xEIdIJnvja4MvC9ne3qImJpTRYWfm/xBQZU2o9RHtvC+/UPizqVYhAiwVTaMuy1yHl0n/h
 yPSMZMxSaK6tX2iBlbVNPQ+Gf8LPC5P/C8UaGfhSdYvLZ9lb5DPUgP7FpeY8IJCgCqoJ6cG+5XD
 Hklv4g3exaKnoTwZYif8kj+jFx9A+mWWlIa0zOR5ktAR1Vmg227hbO3VXiieICb0muwEaMgfFyV
 iFvurrfvUHCyXt6V8HxWYrdHexCE6Q==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68fa02c6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=ORCg8BdZNXsK9r0PxOcA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: F-_o707MwYIkH6ukaUCkrE-Zx-79m_2n
X-Proofpoint-ORIG-GUID: F-_o707MwYIkH6ukaUCkrE-Zx-79m_2n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015

Its common pattern in q6dsp code to allocate temporary buffer
to send gpr/apr packets and free at the function exit.
Now this can be simplified via __free(kfree) mechanism.

No functional changes.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 57 +++++++++++-------------------------
 1 file changed, 17 insertions(+), 40 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 0e667a7eb546..94cc6376a367 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -99,12 +99,8 @@ static int audioreach_graph_mgmt_cmd(struct audioreach_graph *graph, uint32_t op
 	struct apm_graph_mgmt_cmd *mgmt_cmd;
 	struct audioreach_sub_graph *sg;
 	struct q6apm *apm = graph->apm;
-	int i = 0, rc, payload_size;
-	struct gpr_pkt *pkt;
-
-	payload_size = APM_GRAPH_MGMT_PSIZE(mgmt_cmd, num_sub_graphs);
-
-	pkt = audioreach_alloc_apm_cmd_pkt(payload_size, opcode, 0);
+	int i = 0, payload_size = APM_GRAPH_MGMT_PSIZE(mgmt_cmd, num_sub_graphs);
+	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(payload_size, opcode, 0);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
@@ -120,11 +116,7 @@ static int audioreach_graph_mgmt_cmd(struct audioreach_graph *graph, uint32_t op
 	list_for_each_entry(sg, &info->sg_list, node)
 		mgmt_cmd->sub_graph_id_list[i++] = sg->sub_graph_id;
 
-	rc = q6apm_send_cmd_sync(apm, pkt, 0);
-
-	kfree(pkt);
-
-	return rc;
+	return q6apm_send_cmd_sync(apm, pkt, 0);
 }
 
 static void q6apm_put_audioreach_graph(struct kref *ref)
@@ -148,16 +140,13 @@ static void q6apm_put_audioreach_graph(struct kref *ref)
 
 static int q6apm_get_apm_state(struct q6apm *apm)
 {
-	struct gpr_pkt *pkt;
-
-	pkt = audioreach_alloc_apm_cmd_pkt(0, APM_CMD_GET_SPF_STATE, 0);
+	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(0,
+								APM_CMD_GET_SPF_STATE, 0);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
 	q6apm_send_cmd_sync(apm, pkt, APM_CMD_RSP_GET_SPF_STATE);
 
-	kfree(pkt);
-
 	return apm->state;
 }
 
@@ -270,7 +259,7 @@ int q6apm_unmap_memory_regions(struct q6apm_graph *graph, unsigned int dir)
 {
 	struct apm_cmd_shared_mem_unmap_regions *cmd;
 	struct audioreach_graph_data *data;
-	struct gpr_pkt *pkt;
+	struct gpr_pkt *pkt __free(kfree) = NULL;
 	int rc;
 
 	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
@@ -290,7 +279,6 @@ int q6apm_unmap_memory_regions(struct q6apm_graph *graph, unsigned int dir)
 	cmd->mem_map_handle = data->mem_map_handle;
 
 	rc = audioreach_graph_send_cmd_sync(graph, pkt, APM_CMD_SHARED_MEM_UNMAP_REGIONS);
-	kfree(pkt);
 
 	audioreach_graph_free_buf(graph);
 
@@ -420,13 +408,11 @@ int q6apm_write_async(struct q6apm_graph *graph, uint32_t len, uint32_t msw_ts,
 {
 	struct apm_data_cmd_wr_sh_mem_ep_data_buffer_v2 *write_buffer;
 	struct audio_buffer *ab;
-	struct gpr_pkt *pkt;
-	int rc, iid;
-
-	iid = q6apm_graph_get_rx_shmem_module_iid(graph);
-	pkt = audioreach_alloc_pkt(sizeof(*write_buffer), DATA_CMD_WR_SH_MEM_EP_DATA_BUFFER_V2,
-				   graph->rx_data.dsp_buf | (len << APM_WRITE_TOKEN_LEN_SHIFT),
-				   graph->port->id, iid);
+	int iid = q6apm_graph_get_rx_shmem_module_iid(graph);
+	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_pkt(sizeof(*write_buffer),
+					DATA_CMD_WR_SH_MEM_EP_DATA_BUFFER_V2,
+					graph->rx_data.dsp_buf | (len << APM_WRITE_TOKEN_LEN_SHIFT),
+					graph->port->id, iid);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
@@ -450,11 +436,7 @@ int q6apm_write_async(struct q6apm_graph *graph, uint32_t len, uint32_t msw_ts,
 
 	mutex_unlock(&graph->lock);
 
-	rc = gpr_send_port_pkt(graph->port, pkt);
-
-	kfree(pkt);
-
-	return rc;
+	return gpr_send_port_pkt(graph->port, pkt);
 }
 EXPORT_SYMBOL_GPL(q6apm_write_async);
 
@@ -463,12 +445,10 @@ int q6apm_read(struct q6apm_graph *graph)
 	struct data_cmd_rd_sh_mem_ep_data_buffer_v2 *read_buffer;
 	struct audioreach_graph_data *port;
 	struct audio_buffer *ab;
-	struct gpr_pkt *pkt;
-	int rc, iid;
-
-	iid = q6apm_graph_get_tx_shmem_module_iid(graph);
-	pkt = audioreach_alloc_pkt(sizeof(*read_buffer), DATA_CMD_RD_SH_MEM_EP_DATA_BUFFER_V2,
-				   graph->tx_data.dsp_buf, graph->port->id, iid);
+	int iid = q6apm_graph_get_tx_shmem_module_iid(graph);
+	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_pkt(sizeof(*read_buffer),
+					DATA_CMD_RD_SH_MEM_EP_DATA_BUFFER_V2,
+					graph->tx_data.dsp_buf, graph->port->id, iid);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
@@ -490,10 +470,7 @@ int q6apm_read(struct q6apm_graph *graph)
 
 	mutex_unlock(&graph->lock);
 
-	rc = gpr_send_port_pkt(graph->port, pkt);
-	kfree(pkt);
-
-	return rc;
+	return gpr_send_port_pkt(graph->port, pkt);
 }
 EXPORT_SYMBOL_GPL(q6apm_read);
 
-- 
2.51.0

