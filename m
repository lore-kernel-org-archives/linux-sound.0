Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C1B2D5C6E
	for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 08:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760691394; cv=none; b=eJyOBxMzQbuVANyHZjJAC8tLvP9ZYRifpupokGEDivIYJv/vGkE40TfZtFValZinNCWeH7JK+DYpU9zIWHOezX+jq2jN1JUoeuthOFtUnO0QdycCpFKAxdZb+DcDTO1Av8zXa1P7zOH2UiSIKuz2gIvo2g4ha43EKFIrlXtuj3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760691394; c=relaxed/simple;
	bh=oa+cWYTt9UzB1FyHIVERceVFvqBCWaXqS0POIoM+lKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mShStNs1tgAslQRjYcwdBMSqWFMTIUWQpCccWQV1MC7H/EO55CYyM8mERnYbvs6KpbRAVDWmTiVfJXHo2YEA0L4CyCdfQJ/vThUxYs4Dh5LlxqvI9bTZcJ+aTr5Q3+LD3SLS/fHLD4jipZI6Ezhw1zid+AMukFJwq/LnVTbT7Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L73rQIqO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L73rQIqO"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59H83jWc025383
	for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 08:56:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6pGATZVupHw
	4Czz1AViHliAMs8GpLruqkYCkicjIlBU=; b=L73rQIqOW6h0c8WpnpJiVMpF1+d
	bccnP4643vLZK63OtZxeqKxghqvVgQI/ybwVx9ww7lxQDSNwugootSLK71DcPzr7
	/H7/6RXSnWfZWUOBxHH5iPayukkX3DiHlJF6bTUVUdcZp0SgySzYCnM+iSDHy7dU
	GZyPZic61u/COLh+RZAbak08akMurMp0pnaLjK9kyVUSrs7HgIx8/GgKu+Du+l7g
	Wq5MnByNVhaB7pnaqCVydYHMeu2mG1mObVjZf1Ww5nwExDvJkuEYyBtWTQFZnkIq
	EvYXDZGHfSRf1VYUXpZWCxZHDwttUPFusNJiIazooV82L7BXfWhCPBUC5KA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdkkj5y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 08:56:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8908a248048so300922085a.0
        for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 01:56:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760691391; x=1761296191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6pGATZVupHw4Czz1AViHliAMs8GpLruqkYCkicjIlBU=;
        b=CizdsqTtsNElwCHQ1N2v2wQu1jNJF7vF/32s8+h+0bMdk8/iRScbvLrF3kRxMP2RdV
         kmbyJuE7KhkqOxXCePY13bkBqGyNMBIeO1IrnNdHIQnN/YI4yKEZSJFXC3pWRjk1u2rF
         s68i2qTs9OLgP8He333nNVqWYvubD7oZlJenOtn2Fj2euk0X0AbW1jsYtn7+e2tUhc8T
         PtPJR8ykAiapWS8ggmHtM8mda7VHYprbOMV7LOEwbAosc5zISMmhVU/h1zt0S2vqzCMn
         PRetz+dqyqqep3pnOGfJqEA6zvadUZfRhxCryujLX3G0B7ZHY5oneRzEDW5guaDBnDQq
         pWsg==
X-Forwarded-Encrypted: i=1; AJvYcCU9JftE+cgH7Trgw995NbPQEXxDzbWDRJJ4JL0ASaliOWsNpqw6xWdV2IJ8AHIKSmFppeR74SYvNKBNaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyPrTKghtpXVZWu7c8E0J/f+Wmuwy5hDMfkbdHy/GPfRXEqFSI
	2dGzpVJp2qVHTNMRRdA3v5h/i6nNyOmzsakmdcqcwmDo4lG9Xx7bXBPpQpXSPy3ZJS7O36fxXLq
	Pn1hfuQ45t2YynQdX1xnLDi5uWyvXjB2w8DsrdFwAFFFr9o1KfMQ6aH+kgjzSUObXeg==
X-Gm-Gg: ASbGncvkkRrHQfHAugIH8BoMwrNa0WsZ8El7ldr7bODJyVOwyA/z0R98s2lY/INM2XC
	FKVWXcAmAavLHnOk1mQJsteFNUN0b+K3X1E3w06Or2UsTMlEHhgkQPfblJguQLmngsXhyGI9gzS
	Ecm9alvX0yMec0foPnd+oQmujmUqLXFZtspHBObwy1vf8Ie2Qo36kPo1ZO7HRgXjI0ZbDfLveng
	EAWZ56R3dhb+83/3I/7LGD8wD9720rZrpsewH2RIQJYT1PqTzAO2bdsJAfsWaRGsaK2SYUFC3ZE
	riscGHobnnlbGq/APlpWA5w5IidYnFHnUmfnUhdrmo7W+BZirjWITcAYUb/deEkDCURS2RXWrCA
	RLxT+o5fhbQ7j
X-Received: by 2002:a05:620a:1921:b0:88e:9874:8257 with SMTP id af79cd13be357-8906e3c5df2mr376984485a.9.1760691390947;
        Fri, 17 Oct 2025 01:56:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF63Px5DUNh0yn/CzHTzSEIo2j7JYidNDTp4SUTpCfSz2vNCoH3277zcAVyU6QLytHJjF8tfw==
X-Received: by 2002:a05:620a:1921:b0:88e:9874:8257 with SMTP id af79cd13be357-8906e3c5df2mr376982085a.9.1760691390423;
        Fri, 17 Oct 2025 01:56:30 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4711444d919sm70764985e9.14.2025.10.17.01.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 01:56:30 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 06/12] ASoc: qcom: q6apm: Use automatic cleanup of kfree()
Date: Fri, 17 Oct 2025 09:53:01 +0100
Message-ID: <20251017085307.4325-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017085307.4325-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251017085307.4325-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _tb5y-fm9Dn---QnYkcergQDGRDl-zOX
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68f204bf cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=ORCg8BdZNXsK9r0PxOcA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: _tb5y-fm9Dn---QnYkcergQDGRDl-zOX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXxScCCcF7bFn3
 VwH6Rdl0Nuei/NzCyPRVAMzvxPe72KSzwmgUg9CUB9J84Uqz9j2zbBqHnhlo9wQYFi+4eqBHbwQ
 8MfRKWl1SytZGLexJC0iDWMzFYy7FtP7CEJBWR+NJQsMjfAfARW8EL6XMfCnGAoxVX2iO3k/bZJ
 5szSFWiKYiFhlJPClUCDYUpcEzboXShHzVoP/mkmJ4pxtYXHA4TQMe+foNTrawV/2aKGQuRekBc
 ldJseqSSME05XGYhrzVRNQyEFw6GD0EvJH7N6X/dyRpZiy8g7foxWY1iVjfIyg1MVcLvNQkDSUB
 uKTOpDJVTYOnD9dC1S2tWIJfT0c30SrlmtdILyzipVbKrdbUZYYo0oGOA2GowVneUpFnfNTfc6L
 E7odcJdzSirElZ46rrsQTnBmuGs4rA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

Its common pattern in q6dsp code to allocate temporary buffer
to send gpr/apr packets and free at the function exit.
Now this can be simplified via __free(kfree) mechanism.

No functional changes.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 57 +++++++++++-------------------------
 1 file changed, 17 insertions(+), 40 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 0e667a7eb546..7a7d7195d990 100644
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
+		       			DATA_CMD_WR_SH_MEM_EP_DATA_BUFFER_V2,
+     					graph->rx_data.dsp_buf | (len << APM_WRITE_TOKEN_LEN_SHIFT),
+     					graph->port->id, iid);
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
+		       			DATA_CMD_RD_SH_MEM_EP_DATA_BUFFER_V2,
+     					graph->tx_data.dsp_buf, graph->port->id, iid);
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

