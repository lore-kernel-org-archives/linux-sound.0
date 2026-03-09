Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FCF367F4F
	for <linux-sound@vger.kernel.org>; Mon,  9 Mar 2026 06:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773039122; cv=none; b=ez0aOcL7cSw/rQQ/F2ldmCRiVJz8P82e6bB1J1ROgnJbeKulLy6jXE+L+1LZv8ngzanXPgxsqn6qe1dUFg0SD8ve/GYOsekbsNDyDcG71xgPTmRr7JpNei61d+JXa5+Xtg2NItjgudgsaEzlIp7RVEFcPSrUF58q2bcuR/G34v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773039122; c=relaxed/simple;
	bh=VyhmcmdCocO/mXPDB+OqytJYIreg7wlJAag5CLmUSxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BAZcqeNi/L0p4E92+so4a+7ahvyM6CEG9UGLwo3BOoz/uNqZkKhfAyRl4OZvh7RlTRxBnDRQEqmQ+/pPtrOQ4YQmP/r+np7ybo3MzyhkNkq1HykgvmWsgGRVITkcKB4mkOTuNqJs/6DG0u7/0BcuDaDOH1a7ARkuWH5gD2rtOEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A025RYo2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BAZGx46G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A025RYo2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BAZGx46G"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62964x6k2288470
	for <linux-sound@vger.kernel.org>; Mon, 9 Mar 2026 06:52:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XJegSL9SyIW
	8NkmReRK6OuDLMZtYbsuyhgigi3fazVM=; b=A025RYo20wiU44Z47IRq/8GebSp
	bogZwwLBMogFPxaQvJ89uGH7aWJ0MqmCBHqRln1dvFdA1cM1TQF+xSJ+49oPh1Tz
	bCvRN1lgETiYyZDTFU7PRIQRa/SRXsp/tBL9HH1TKW6pedWO9E50POb4A5gK7Meq
	Ei4KhxF0v72T6+0DNPdsfvoXdsR19WfTGwCAvIEx0W4waYV3Tcs8NdHcKdA2v83W
	xwnWFhZM2yKyKBzymD138yqmvmgrUnKWCoibfYlTo/zO8wyyoueU9ZparCILYP5+
	mOt+mzb8O24+bCCbFf0afq8aQKMMa1qewesXfaD2BmEX3wMD4ppnxOcaJ2A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crayrmbpp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 09 Mar 2026 06:51:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd8b37d4b2so368020785a.3
        for <linux-sound@vger.kernel.org>; Sun, 08 Mar 2026 23:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773039119; x=1773643919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XJegSL9SyIW8NkmReRK6OuDLMZtYbsuyhgigi3fazVM=;
        b=BAZGx46G63XSIqSEPicW9UVLazzF3iMTcygLGAYWAJhwvjBxQfjgqR4+uEDnAmYQAm
         KLnK+WVPmLSr4HA6UmArDst6NKgRq61WgLn2tXaS4MwiZ/Qsuyq0oInvkJuBaJcUsd7t
         E3QbmoQLiLcDNRbDR6HZY6oFZNk5RzedP1mPvU8pMBlFXv7Q1lmnlNe4Y6Muh5j+FfaM
         4+SqjG0jIjTra1LicmdwnaObrw0pGLV+epNyKF2HuXfPaJGzeCWdvm9QuZ8PR6wwcFTl
         7dsV3uhr5hAvcUoa5/p5rOyRBhoB0321PdoL14dG54G1vk7Z5C2xKaw2YVM+WU+FvVQV
         P5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773039119; x=1773643919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XJegSL9SyIW8NkmReRK6OuDLMZtYbsuyhgigi3fazVM=;
        b=wlniruu/yg6jVOxRDRptKR7YNMyUCqEECP+nSLk1EBfSC87tWT/7oiqmXH+EKMJCSK
         toJQB/9StRDo0fsIa3YgTmqYlG7hWSIXJKaBqHFOjAuRk57yqoDpuO9TyVjSqhAuNvgF
         HXzEuPjzHSz4FIrCWyFI/hDoO/220E9uwX/hUwdSnvV81H+CFCOJ8e+W3FIKU/EYC6hQ
         6ObjAF+rVRvCYawrtD6PhSybE2jMzlWCOezKmylGhL/lT5p+ccjbqG8lwbtsrUZXf6uu
         FKC+dyLSJFv0MprKVybl9rvBCxLx/094Zh4FPC1/pFui09wC6TrdmXhOMI12rfIpPIIb
         p/Ww==
X-Forwarded-Encrypted: i=1; AJvYcCWSTuJwWT7g+qlIy8hBJTxsDsE/a/7Nv2/yQXZ9VWhnc1ongD3bbu72D5uqYOeBtk2cMGMzuU+L6LzUxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSr+SBEo8rIFGH3ZtaV9qVaOTl53HG2to/m267T8tDODhJqf5w
	Y+Ao5mFeKqGmIgXTaXvtB6XcIPJc+xONfSGWLW/3P3WHnp7XzLkH6FWu90VXk3wPm3BzED1dWnE
	8n2irJppykD0Fz2LQEyksrCOQlUNFGM/NCd7pHWsbDL2Ooz2AAsDoAJymkawA1M6sRg==
X-Gm-Gg: ATEYQzyU2Bmw9D7m68b6Qb29xyRATab1dgogWNmH0WDjKmcyRlhihhpeCbjTUFYLVW3
	iCD//vGS1NGMKNbU+yo6JgWuvSnv8HqsY/QRHOb0KPFroYc8sIeRXJCRZ9wxYWjpX1x2HofDLnp
	LhESbsFgaBUMRKq+2kH4WXZEqzqDXlmfODNaqNObDMStG72zKR9bC4J2ZNkWB+mzEaIP08oKzBN
	xJ/PolYp4gg4CMe7CMgvWMpHZTjUT+amcHQSsK02aennhuEkLk+aiSHtsZIbfk73EU2eGqqIcrL
	LIOnD+Abnpo8EOhdPi3NN0z3/GRg1b71zAYSz+ul9rSp8o+Ej6ppUeQINLIeGm0VxYb+SBT3qAf
	DWH8nM2ybLCDgWTcxFFkCiw3m9zZaXXlS3ZxtF/l1F7cGXKM0PzFu6Oo=
X-Received: by 2002:a05:620a:450f:b0:8cb:4cc2:c5d3 with SMTP id af79cd13be357-8cd6d52e388mr1248045985a.73.1773039118853;
        Sun, 08 Mar 2026 23:51:58 -0700 (PDT)
X-Received: by 2002:a05:620a:450f:b0:8cb:4cc2:c5d3 with SMTP id af79cd13be357-8cd6d52e388mr1248043985a.73.1773039118374;
        Sun, 08 Mar 2026 23:51:58 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48529f01997sm80449975e9.14.2026.03.08.23.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 23:51:57 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v5 12/13] ASoC: qcom: qdsp6: remove search for module iid in hot path
Date: Mon,  9 Mar 2026 06:51:36 +0000
Message-ID: <20260309065137.949053-13-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260309065137.949053-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260309065137.949053-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=U5qfzOru c=1 sm=1 tr=0 ts=69ae6e0f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Ll4dbTg5roZnn8cDlSAA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 6YqvJhCaiNciCV37dDNk-dIqKY-FB-9l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA2MSBTYWx0ZWRfX8uylXUoF6/cU
 i4lLv5huryybNyGWOtr7nG0qZMv1WJ246Vb0E0UAng3pwSjRjmpggOsLCQeTtHBCnR4NRVOQLTi
 DJKxxPpxQeYeuf7U4AU1U0RPVs1U+dZ+p60q4eaQUAUYpZoc/14RjwUhDmWCf0TkAna44dSTAus
 c3+Glh/Kzh5sPhvCfkmDxaPUWFkU6xBawM/z16vPZbzL5CCr4KqevSG5sdMJVQutjWaVf/wJrZ5
 9HJ+b1Horpt5N4PzevFp/KbeHO3DWKDqJSkrgijrcjW/LVFJDeCiN+QM/op3007XhbkXKsizgPp
 PvVwIUyYTheqzErQOX+w3eKhp4GW/qevr2THFCLb2oTCEv3kRnad+ifd74Yal7XfS8h/oTFkS0p
 2aF9ztS92yyD8C9a61uQfsenL1KpAOT3+OjJJuPEk+7zlddgReE1rM13j2f73fD0zs5eFAcM0Rn
 AhmpQ1SL6PVo56uVngA==
X-Proofpoint-GUID: 6YqvJhCaiNciCV37dDNk-dIqKY-FB-9l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090061

Remove searching for Shared Memory module instance id on every
read/write call, this is un-necessary if we can cache the shared
memory module instance id per PCM graph.

Add new member to graph struct to store shared memory module
instance id to avoid searching for this in hot path.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c        |  5 +++--
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c |  4 ++--
 sound/soc/qcom/qdsp6/q6apm.c            | 14 +++++++++-----
 sound/soc/qcom/qdsp6/q6apm.h            |  3 ++-
 4 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 3eff45b241c9..bdd4cc458acd 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -355,7 +355,7 @@ static int q6apm_dai_open(struct snd_soc_component *component,
 
 	spin_lock_init(&prtd->lock);
 	prtd->substream = substream;
-	prtd->graph = q6apm_graph_open(dev, event_handler, prtd, graph_id);
+	prtd->graph = q6apm_graph_open(dev, event_handler, prtd, graph_id, substream->stream);
 	if (IS_ERR(prtd->graph)) {
 		dev_err(dev, "%s: Could not allocate memory\n", __func__);
 		ret = PTR_ERR(prtd->graph);
@@ -496,7 +496,8 @@ static int q6apm_dai_compr_open(struct snd_soc_component *component,
 		return -ENOMEM;
 
 	prtd->cstream = stream;
-	prtd->graph = q6apm_graph_open(dev, event_handler_compr, prtd, graph_id);
+	prtd->graph = q6apm_graph_open(dev, event_handler_compr, prtd, graph_id,
+					SNDRV_PCM_STREAM_PLAYBACK);
 	if (IS_ERR(prtd->graph)) {
 		ret = PTR_ERR(prtd->graph);
 		kfree(prtd);
diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index 70e283671f43..aceb2ac9bac8 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -203,7 +203,7 @@ static int q6apm_lpass_dai_prepare(struct snd_pcm_substream *substream, struct s
 	 * graph, so sequence for playback and capture will be different
 	 */
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK && dai_data->graph[dai->id] == NULL) {
-		graph = q6apm_graph_open(dai->dev, NULL, dai->dev, graph_id);
+		graph = q6apm_graph_open(dai->dev, NULL, dai->dev, graph_id, substream->stream);
 		if (IS_ERR(graph)) {
 			dev_err(dai->dev, "Failed to open graph (%d)\n", graph_id);
 			rc = PTR_ERR(graph);
@@ -240,7 +240,7 @@ static int q6apm_lpass_dai_startup(struct snd_pcm_substream *substream, struct s
 	int graph_id = dai->id;
 
 	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
-		graph = q6apm_graph_open(dai->dev, NULL, dai->dev, graph_id);
+		graph = q6apm_graph_open(dai->dev, NULL, dai->dev, graph_id, substream->stream);
 		if (IS_ERR(graph)) {
 			dev_err(dai->dev, "Failed to open graph (%d)\n", graph_id);
 			return PTR_ERR(graph);
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index f190ad5e912a..7ef6ae0b1759 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -411,12 +411,11 @@ int q6apm_write_async(struct q6apm_graph *graph, uint32_t len, uint32_t msw_ts,
 {
 	struct apm_data_cmd_wr_sh_mem_ep_data_buffer_v2 *write_buffer;
 	struct audio_buffer *ab;
-	int iid = q6apm_graph_get_rx_shmem_module_iid(graph);
 
 	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_pkt(sizeof(*write_buffer),
 					DATA_CMD_WR_SH_MEM_EP_DATA_BUFFER_V2,
 					graph->rx_data.dsp_buf | (len << APM_WRITE_TOKEN_LEN_SHIFT),
-					graph->port->id, iid);
+					graph->port->id, graph->shm_iid);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
@@ -449,11 +448,10 @@ int q6apm_read(struct q6apm_graph *graph)
 	struct data_cmd_rd_sh_mem_ep_data_buffer_v2 *read_buffer;
 	struct audioreach_graph_data *port;
 	struct audio_buffer *ab;
-	int iid = q6apm_graph_get_tx_shmem_module_iid(graph);
 
 	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_pkt(sizeof(*read_buffer),
 					DATA_CMD_RD_SH_MEM_EP_DATA_BUFFER_V2,
-					graph->tx_data.dsp_buf, graph->port->id, iid);
+					graph->tx_data.dsp_buf, graph->port->id, graph->shm_iid);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
@@ -604,7 +602,7 @@ static int graph_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 }
 
 struct q6apm_graph *q6apm_graph_open(struct device *dev, q6apm_cb cb,
-				     void *priv, int graph_id)
+				     void *priv, int graph_id, int dir)
 {
 	struct q6apm *apm = dev_get_drvdata(dev->parent);
 	struct audioreach_graph *ar_graph;
@@ -631,6 +629,12 @@ struct q6apm_graph *q6apm_graph_open(struct device *dev, q6apm_cb cb,
 	graph->id = ar_graph->id;
 	graph->dev = dev;
 
+	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
+		graph->shm_iid = q6apm_graph_get_rx_shmem_module_iid(graph);
+	else
+		graph->shm_iid = q6apm_graph_get_tx_shmem_module_iid(graph);
+
+
 	mutex_init(&graph->lock);
 	init_waitqueue_head(&graph->cmd_wait);
 
diff --git a/sound/soc/qcom/qdsp6/q6apm.h b/sound/soc/qcom/qdsp6/q6apm.h
index 5cf538397841..7c646ffcf956 100644
--- a/sound/soc/qcom/qdsp6/q6apm.h
+++ b/sound/soc/qcom/qdsp6/q6apm.h
@@ -99,6 +99,7 @@ struct q6apm_graph {
 	void *priv;
 	q6apm_cb cb;
 	uint32_t id;
+	uint32_t shm_iid;
 	struct device *dev;
 	struct q6apm *apm;
 	gpr_port_t *port;
@@ -113,7 +114,7 @@ struct q6apm_graph {
 
 /* Graph Operations */
 struct q6apm_graph *q6apm_graph_open(struct device *dev, q6apm_cb cb,
-				     void *priv, int graph_id);
+				     void *priv, int graph_id, int dir);
 int q6apm_graph_close(struct q6apm_graph *graph);
 int q6apm_graph_prepare(struct q6apm_graph *graph);
 int q6apm_graph_start(struct q6apm_graph *graph);
-- 
2.47.3

