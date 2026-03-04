Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF253914F7
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 13:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772629659; cv=none; b=WOpUeTjODLxm8qvL2IP+z1MZfNyKBd7baj/nk3GIdGrIdV/6I6l+21Mfs8nytYAa1R1UueLBkJL5A6+7KZgo9QcY4pRWKAvEUDwZYV1G1mgvWhk4bMRSrzkobHEKIz7ezwGFwvUJISmASEkpSq1J1YITNpXUcdgEw8rgYSfrWss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772629659; c=relaxed/simple;
	bh=VyhmcmdCocO/mXPDB+OqytJYIreg7wlJAag5CLmUSxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hXyZzZwIxDbVKeTzgvlbPYP4G7BF84pUzPv0yQG3BKPq20EO2PQPI4XQyI9ZBbGIDsVekhOTntWeHCPbpHTl52hk7QFRLUM3dJRtBJVPGBF5/C88kPuhUjzyWQU29OMzWcEC/g3myWPiA76sZSmbAzkbhFe930aJXHc4lCoGGNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F/SaP/W2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gt2aVQCB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F/SaP/W2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gt2aVQCB"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624Cxd69957613
	for <linux-sound@vger.kernel.org>; Wed, 4 Mar 2026 13:07:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XJegSL9SyIW
	8NkmReRK6OuDLMZtYbsuyhgigi3fazVM=; b=F/SaP/W28w6nfKb1AW+JcTbv0bn
	zLI/5PE1pqdGw+LTKTmuODoDAXq5iO4Kl0kWyd6JkhjgDObOcyDEwMkI1a1JSA9Z
	qY2UNPGWcShbiJUBLM3eYvfgCqlTUgPDWwSyhiFWYXG4gDrs1oKa88BFiUFzyDgF
	WJeypmJXw4lg1mo8bq1v9emyO89ITzuOPDcwzFHUnayqOPjmxSUB+RPuStT5xP8Y
	97YIpTx+0B1bdWBzUU2dP5ad2LtFxrSeA/aEXfkslM04iW+m33CKGGXQ77PZUN6t
	WYktLSypYHLwEbNU6WRHsC+cBXnNeuNefueB0jobll0p9l8/UlbLTZDuiXw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp6qgaxcy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 04 Mar 2026 13:07:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cbb8040f48so4776832385a.0
        for <linux-sound@vger.kernel.org>; Wed, 04 Mar 2026 05:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772629653; x=1773234453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XJegSL9SyIW8NkmReRK6OuDLMZtYbsuyhgigi3fazVM=;
        b=Gt2aVQCBXdWAD3bMRsOoisZlT9WQQirKFhegnNYIc1pbfPQLowYirt6dQTjJKvjM+D
         ByKb6rAeZF7gBVk1Xu7NkujU3DGEqZdyy2L8VwiNz+eD9gZNy5K+sQofdPMpsLyZqnf3
         u5VHorNcU8yrvqokkfILw1Bez512Z7Rw2OC0VAXTkJL+fXj+Y+nn/H8/iqyYsNXvXcAN
         ucilmR33mR6Ulv5Xy0aGf5NxshvVkzSgUq9sdnfmsL5UEGpCFetWIVFnXVt06hgekHmH
         X2ULhDusE2rurUdJ5w3RRaCPrNj3Q7UnM/Fo0hYGHDqBC8wA5h/x8zEIaFS+U9KafLYQ
         v7wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772629653; x=1773234453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XJegSL9SyIW8NkmReRK6OuDLMZtYbsuyhgigi3fazVM=;
        b=F3q0fz5AszMWAcUYM3o40Avanvh+Hrdd2RKLBK0zTPTmctC2abcVeSdgSboVxEBL/F
         tg7YiE8M2tKMI+5WodsMmbdIk0BV5rr9SL0PDmqHKo467ZJ//v9F1dvCDByDfoWK1WdH
         wwqc52GoWKDsljk8nan10D1D1K0K8Osq1vFqGgaq45DLYUpiZ7kdjex7+VIZzGp9hVZ+
         aCMEvQsMLplq2IHIC5vZSrWuHZOky6PzcLYCI7Iu5Q8zlUCJ6iW0lobrXsZRtxCPSu2F
         h8qn4ceCD3u6jwkaiN3rhBzMOMhicbFbr8fYZurJSA6YkO0+xdj3sm6G2L5IjEGyLJZw
         vc0A==
X-Forwarded-Encrypted: i=1; AJvYcCUa1CN/DVs7VMuXJ9e4rw85qz+q5Y8SybuZgHSffC/ZmDFy+fp3ni6YjY4ZsZ7tmcgpqaBKLDjlj4fTnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeYj6tQqGROVVDejtj9un1ZjKNLDjsoth32TZksYXNp36r5+zo
	OVORSlZsS4c4kny8RPYMkh7YbSLraNDFV9MvfbA4IgM+j0haewkhbgRNrecNISDlnOgW5LiPSCv
	13sZ8N2DTL0Udhj+eMQ6bFYbyNt+uxID2XFMca6wXc+UVNROZ0ap9tt97QgeFPzX/ZQ==
X-Gm-Gg: ATEYQzyYhihqjp4bavtrl2DKFlzYwsv5Bx9IpKhwCNucKwKlqptI6k1TgV7YdRb4z/6
	qeFmtG2rBQc5yTP22yz4Szbo5CPHFWjb9/VO+jlWCXVwOgts1PzKUhRSf/7iQ07X1tySHsse66O
	6AENERynJIRISNWxTZJJxRhn3bWGoaxHz+3qrtQSJEZUHK4s7U4+mS3yW7GoMYdfjcJWfg3fnkL
	+FZD2gZA4RRWMdNMoisgCCa+brhdn1llzv92O54dJYZFCJuGhWWoP30WtZmxJbXm2SNMnEp8lZV
	sf0j2H7O356nRUAmdUyN7LNLhA35Q5RfVuJi+Bi0u9GF71V438eDJXisJTmR8+B5KgmN6dmAQ+9
	/v8fHNABN3hMtwSJ/BmhXWf9CPksFPkrQGXLqa5gPBs8pWTuK1Gi7pGY=
X-Received: by 2002:a05:620a:2a05:b0:8b2:2066:ffca with SMTP id af79cd13be357-8cd5afe90e4mr174418085a.82.1772629653391;
        Wed, 04 Mar 2026 05:07:33 -0800 (PST)
X-Received: by 2002:a05:620a:2a05:b0:8b2:2066:ffca with SMTP id af79cd13be357-8cd5afe90e4mr174412685a.82.1772629652898;
        Wed, 04 Mar 2026 05:07:32 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485188122a6sm49969745e9.12.2026.03.04.05.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 05:07:32 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 13/14] ASoC: qcom: qdsp6: remove search for module iid in hot path
Date: Wed,  4 Mar 2026 13:07:11 +0000
Message-ID: <20260304130712.222246-14-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260304130712.222246-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260304130712.222246-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEwNSBTYWx0ZWRfX4X8Hg23l0bf/
 fc2V0yZEWWJIQpVoBhS13vzWvpuYlNtTAch16Blmv7f7lRkEU22vG5nD65tIL6GsKStMbipuFkc
 Gx0piTx0iSROIQmAjVNcDXgQ66rxO0pJ24bzudCZrQmtk5Au37gmLAmtzZcAS9Ijz9WD9RoTEqW
 AsapTyP+qU3ia84rnlowe3OdzPYmOhGJT2ALBbgX6SPd0OeXaHLo3dWUBNsh6dkM3HlD/DKK5Bg
 VTF5nep5FwyW6tGSyvllBUJzof7UnjKcriyUdegLGfYIYymyCAc7VBCbCusOZCARNDOM+PRNLGd
 m8TMW0nVDHw3v882ksrcX5YWuCp+Z/gDOvlyHpKVCatUN/jgWi4Q+2mfOasCwgpqyNaw+31wlmw
 n9KkbEEgEW9fnygZ8DHGNGy07OzdRuR4EF9RO1XbiQDEym/VF8aNBPlHNXZOqBdmvgSygSNy8iD
 epSrjqpdfO+eR6fkLkA==
X-Authority-Analysis: v=2.4 cv=UJ3Q3Sfy c=1 sm=1 tr=0 ts=69a82e96 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=Ll4dbTg5roZnn8cDlSAA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: eY5f6l3Xa5idW2cNs_CSoW2VdmV9tUts
X-Proofpoint-GUID: eY5f6l3Xa5idW2cNs_CSoW2VdmV9tUts
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040105

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

