Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5215A43DA33
	for <linux-sound@vger.kernel.org>; Thu,  5 Feb 2026 17:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770311670; cv=none; b=XwlTO3XpvPvxH3+4NbA/QB15/Ap9nv5p1NqFYFxQQe2hUwpqYQUY0spTXlgCWYvRBFehwxBrCuBFs2WhWmNRbqFCIDNw6i+UOfzGVopmXTJbb6fyoOgulrhseK7IhbljW3L+SBoEIcdRPGtUFoeePazpZQKoZKSGNwKd+k8GtbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770311670; c=relaxed/simple;
	bh=1o79ow1bIiOv5CRwM/ZPHhJrp0A3v74qMbYwG0K9OoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oXtVKr+kY6BRa1In+YUpSDx6ipNz0G2DJiW8LYFpY6/qNS3VnjivWlr9g4C9wAJlxeozG+e6iC/YPFh0EbYIw+eVLIXxYBQ2uogrnhGJPFHySRoH3yM/DpPRnib9MO26ioxQFT6CD8Klmy2dqJ3GUX+6WXVKtf2xy53/r8Zp5YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NL7Bf4zg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IcWHohMF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NL7Bf4zg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IcWHohMF"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615Chl1C4166976
	for <linux-sound@vger.kernel.org>; Thu, 5 Feb 2026 17:14:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fPI1A9ucPaM
	cjLIVgjdmicQQNCHcfLusgVWrHdAui+Y=; b=NL7Bf4zgPthI4xf7aaJE+w05KbJ
	a2iV5pS3NzXYpHumzJ/olqZ6T4GPgLtF7QN8XS0UIJPPnVieyzYVZB/V5Y18s8CT
	xw3ONXMwyhl4/LOabidCkAqmcM/mKJVeYb5e5JZIJQ5X5pOkkov1Q3MNpLJNwxkx
	ki5gaFTTwIJKtuqZPdabDbDnxLxrA1m2mHjd7PGlgOAgKLEZ6m9OWsX8PAP9ktwE
	moQaZDGzUyblNOnRt49Nqq/BlgjMsULnkawZegzQ85MotAH1sNVMKcMojgFnU38+
	Veg+8bfGR6/no35icUVXgKd35EmIe7ehSHuNp6PlQgA+CMBztv0Ey+x89Pw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4nega45k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 05 Feb 2026 17:14:29 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8947d47793fso82478546d6.2
        for <linux-sound@vger.kernel.org>; Thu, 05 Feb 2026 09:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770311669; x=1770916469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fPI1A9ucPaMcjLIVgjdmicQQNCHcfLusgVWrHdAui+Y=;
        b=IcWHohMFotV+7z0CYg9VbNb/dotm3VLbCf3FxLlToQSzR+xTmiTWFZax0oJQn4WkO9
         CoERCILqAsQxxDXfUgHBERuSYNW2xZboASDQ/afxBDMkQoj8tkD3uRIzXgshIZBfhZ6q
         jTRzu/UM5P+YtybSxHDt0OUoLYeT36oCYOOaEchJ9xSBIEPDCGDm/EZ/iG22k2RG9C5n
         eyQDBj86gfpLQZcRrBLkBxdpUV7pZXYxBYqLn87/A6WdDBmjo//bUsFaOXGl627HH6Vc
         cZSgHpcy/BeISa8CdBT7Pj5IIKcqoR8MxeQb18H/GJJBsOivQJ8FaoN0IgJWGsta/vb/
         3PtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770311669; x=1770916469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fPI1A9ucPaMcjLIVgjdmicQQNCHcfLusgVWrHdAui+Y=;
        b=Saj+OkgyEhlTytn5LWlmoopNqHLZG3L454ZJSPbGZH1BAcxbSau2m8lT+ShbhUgLNY
         pSF1kw5xzzE39OClhvQel/DdliVcXy4HIxkGSSqt6VS3t1csFMNlWTUmQsTL/A43vPz1
         d5bwamiSRoC4pxStCmHM9H83fprjfpcPRk76xx0WglaSK1pu/U3UtmgWTNeCj273hEQV
         XSjGWrm9bRkqMCI1+B/ztf5lsoVxhqT9Ui0Va1+9bplRGQ7EjPfvdXe6jS0ECKF5tvJ6
         5jHGDX83ovXJCOCDHRLQvLAwLbjkbD3e/Awss2qz0iB50L+yfEakPsYPjAcjd83m6Llr
         i+Ng==
X-Forwarded-Encrypted: i=1; AJvYcCXIrvDGh7gHOnPEsp8RxSjX+w10iZqhtfcTPWJ2B1c/+PnCGzeF/dRcyI4dOnydT5GvztY8qBWKekcm0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkPX3P9IGPSHuUmmVmHdoq/Zq0eevzUU4OXdQmvp85cYVD7W1g
	8lTxzsxWqmZOQCLBvi0rOGcOmqhaBNfp2LYZzcGbsw1f+i/DRnYDc20+m8NDY/fuOOS5vuzvaO+
	ePK4LYGwOpMca292MzYwfgw0ybjfn2zWh0ugahgvaq+jrdvT134DhOuqi55Kkjef1HA==
X-Gm-Gg: AZuq6aIEyY1e1vELGGNaJNfU3581gYT3tZMDneYlN2e+kr/a9avqx4rTXry0aWe+F/e
	oUvy0KfXN88BBzR2M307tMUMY6+r6HUwWhAfjfy1164Jkl3bRALUGOXE855TKansAe4cwSCv3Dw
	SrzTJNcEKxNbMvP01esPrxq4GUMrelNGwKhm9jIRDmOIaw5Xx90IALmz8XDLLIRzPfAzxMuO+La
	rQ9l5X7sAPVfvIkxLHq3f0+zxwYaLzZ+1VUFa6JyAND8IoJfCx0gM4OgckF+VbqgTezIaFPTa19
	nlNYm3VdOLUCQHIJCn7T1bJJhZRDDT6Ss6vm/mlT4JD4cDqPGhXB6cILEEg+YWr0BlZyLz/hiC3
	QaVyEhKZnKpqA8WRSGO3CFQATKfc4bnjQ5D4wQOg47oM=
X-Received: by 2002:a05:620a:4056:b0:8ca:3c67:891c with SMTP id af79cd13be357-8ca3c679845mr595855685a.71.1770311668543;
        Thu, 05 Feb 2026 09:14:28 -0800 (PST)
X-Received: by 2002:a05:620a:4056:b0:8ca:3c67:891c with SMTP id af79cd13be357-8ca3c679845mr595850485a.71.1770311667932;
        Thu, 05 Feb 2026 09:14:27 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43618057f87sm14802849f8f.21.2026.02.05.09.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 09:14:27 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
        cnor+dt@kernel.org, srini@kernel.org, perex@perex.cz, tiwai@suse.com,
        alexey.klimov@linaro.org, mohammad.rafi.shaik@oss.qualcomm.com,
        quic_wcheng@quicinc.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 09/10] ASoC: qcom: qdsp6: remove search for module iid in hot path
Date: Thu,  5 Feb 2026 12:14:10 -0500
Message-ID: <20260205171411.34908-10-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260205171411.34908-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260205171411.34908-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDEzMCBTYWx0ZWRfX/JmqbtRWDHFf
 oCo/033PRfoNCMMU9OC7orI3bJblJazOwum3YTchWp++XN85Sn+M7zgV2XP0N1FsFoTaEtW+wPk
 O2jOgciJYqXjXf9FfdkkJBigAVMoouCYXrUE4xzDS78zknyVgiO3CubX3CAsj+9JQBuXl0iJTXy
 Mnbz4jgdg+Z/0VKuZNuoD7XzRzkEFMSh1c/XeUnyB0qAAYBuDL6cYKGzhMEStkbQzxkbp/8/N95
 0ELoWEwulen2xkPF/8sLJdIK49+KIoEB6ahufzGf3DhucwcJGK/dwW6WEzpbRayxU9uIA9uefaZ
 GC0phRLh0vmtt3Qf6ihAgd4ZERButdf81u13sG1aqblILsWfQEyhRaTrFLZuQBq7l0XM8PjH0Xm
 PpO5jwFL6JOQojHV5MkAr5x2niA99+B46/IftxYVudCPiFPrSReB1/W76xEBhiRgJdc6dBKhKP7
 BGZAimPkjm+ANObfVkw==
X-Authority-Analysis: v=2.4 cv=ZITaWH7b c=1 sm=1 tr=0 ts=6984cff5 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Ll4dbTg5roZnn8cDlSAA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: wooLUiZrVKT5uqfRJb-T_EVA3CrHpSFr
X-Proofpoint-GUID: wooLUiZrVKT5uqfRJb-T_EVA3CrHpSFr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_04,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602050130

Remove searching for Shared Memory module instance id on every
read/write call, this is ineffecient and becomes un-necessary
if we can cache the shared memory module instance id per PCM graph.

Add new member to graph struct to store sharedmemory module instance id
to avoid searching for this in hot path.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c        |  5 +++--
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c |  4 ++--
 sound/soc/qcom/qdsp6/q6apm.c            | 14 +++++++++-----
 sound/soc/qcom/qdsp6/q6apm.h            |  3 ++-
 4 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 87e4474d680a..94066b69b5b5 100644
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
index 21624a2803a6..569ba1991992 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -202,7 +202,7 @@ static int q6apm_lpass_dai_prepare(struct snd_pcm_substream *substream, struct s
 	 * graph, so sequence for playback and capture will be different
 	 */
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK && dai_data->graph[dai->id] == NULL) {
-		graph = q6apm_graph_open(dai->dev, NULL, dai->dev, graph_id);
+		graph = q6apm_graph_open(dai->dev, NULL, dai->dev, graph_id, substream->stream);
 		if (IS_ERR(graph)) {
 			dev_err(dai->dev, "Failed to open graph (%d)\n", graph_id);
 			rc = PTR_ERR(graph);
@@ -239,7 +239,7 @@ static int q6apm_lpass_dai_startup(struct snd_pcm_substream *substream, struct s
 	int graph_id = dai->id;
 
 	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
-		graph = q6apm_graph_open(dai->dev, NULL, dai->dev, graph_id);
+		graph = q6apm_graph_open(dai->dev, NULL, dai->dev, graph_id, substream->stream);
 		if (IS_ERR(graph)) {
 			dev_err(dai->dev, "Failed to open graph (%d)\n", graph_id);
 			return PTR_ERR(graph);
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 2cfebd622be2..282ba22938e7 100644
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
index 189ed8a1a60d..19e223635edf 100644
--- a/sound/soc/qcom/qdsp6/q6apm.h
+++ b/sound/soc/qcom/qdsp6/q6apm.h
@@ -98,6 +98,7 @@ struct q6apm_graph {
 	void *priv;
 	q6apm_cb cb;
 	uint32_t id;
+	uint32_t shm_iid;
 	struct device *dev;
 	struct q6apm *apm;
 	gpr_port_t *port;
@@ -112,7 +113,7 @@ struct q6apm_graph {
 
 /* Graph Operations */
 struct q6apm_graph *q6apm_graph_open(struct device *dev, q6apm_cb cb,
-				     void *priv, int graph_id);
+				     void *priv, int graph_id, int dir);
 int q6apm_graph_close(struct q6apm_graph *graph);
 int q6apm_graph_prepare(struct q6apm_graph *graph);
 int q6apm_graph_start(struct q6apm_graph *graph);
-- 
2.47.3

