Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAFB364EA9
	for <linux-sound@vger.kernel.org>; Fri,  6 Mar 2026 12:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772799748; cv=none; b=EPz9/NflYwMsZ9oZ291+Txn8DfZuC7iLvtQmJhQFVT1/bbdxd4MAyK2OVmZZg3XXUnJkCFBzXmgp7WBHjd+y98ci5I/TemPDL3Cl0dnvzA2qhScWU7fjNsIvfJzB6WfuU6qt/u+LQcTq9T/yAztmVVqrykJidvatr1fcfxxSVa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772799748; c=relaxed/simple;
	bh=VyhmcmdCocO/mXPDB+OqytJYIreg7wlJAag5CLmUSxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X9kJ9ZI63tzU3wb34sRYh2ohRY2KE86qwzzNfIlkHBe7r1D67SkDZS9fhKHrZqx0m6FKgNNk0MKvAAB5tOtfZhYgxqFB4SK0Gqb+V6Rx0/y0fbrKfcpoLvY9mN9nF30Fxk/6xzNp6qRVUeivwJQ1f8gAykNf+QUIuTTQ4JEi03g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gJ3B4V6l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MQa1AFYm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gJ3B4V6l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MQa1AFYm"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626BauHo864940
	for <linux-sound@vger.kernel.org>; Fri, 6 Mar 2026 12:22:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XJegSL9SyIW
	8NkmReRK6OuDLMZtYbsuyhgigi3fazVM=; b=gJ3B4V6lnRsRRx4g5VF149O2SUJ
	1TnxaAjq7VfhwN73j6o6Y1godNU7j0FUA+peuM+IW26qCZr+haCHi3AnrPfgKnOD
	NslmhSM+JA3OPd46R7Pov6F5iIsmQQipxdLmcehk1ewUuVFbZ8OgQy+4xY/gXDgv
	yJH7UeWJczwAbu/TIWq8T9ii35aG6eFjx4OOK7mZxcVvZlrnXYlVFI5JOcrOWBeK
	BMBRvwwDnuFbzRPQEb919j6oOsiX4xzYqu0ciMUrCaPEr5kvvsxD5uFlay3Rep9g
	bT/b1GMiGBQXQaqrmeBJ0SQOrpNXshDm6pSyvCPOGDjuuWYYvG0Zj+HzVZw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqrf5sc7w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 06 Mar 2026 12:22:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70fadd9a3so1242804585a.0
        for <linux-sound@vger.kernel.org>; Fri, 06 Mar 2026 04:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772799736; x=1773404536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XJegSL9SyIW8NkmReRK6OuDLMZtYbsuyhgigi3fazVM=;
        b=MQa1AFYmUg464/nLel07QQttFLgfd3TqA5oJRNEek17R5o5/8Qg+sUMPRFixiRvcqZ
         /hwYfNjO3CdwjooeRFp27W51R7wuuM4R3qHh4CYf6aUNZ/bE8b6vHny8E7buLRr6Z374
         gg2TBkToB6H/8B6wfeIvigZPc7txy6Gn5LYjft9zknJ7iOo6HiAzokMHuw+fcVSpmowa
         MjFaR18VbPmaaieNF3u/9aVPFKFGDdk8H/IGZEYfRJJoSIR1bvKz/g8HsDEsTp/UBxa1
         dMMhlAGLE64eS64UlazYp9HWSGkQLUhZ6Ei1odKGSEI+Qss3lyekiofIfeqh51DX1c9Y
         gQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772799736; x=1773404536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XJegSL9SyIW8NkmReRK6OuDLMZtYbsuyhgigi3fazVM=;
        b=RFRUhIAEX2KFESlxXTepS7hz1qDq1Tpq/EUmb3NJiN6PZIZoR42uI76Tsl9/fV7PQD
         FjT3rMPvt31BUZ1cT1AlHUeicSWdudf14++jXTxtWj5WOZE+lQT1XYQDqQWiJMKr0rMq
         nG5/rJwZeoNCmq4uz+TNGxI+o1HSVt48qGbROiW9jRDcG8Ru0NOHI/Et9kTIM/sFF9HC
         a2QCHFFTTybprTLdi25a8tz7uS4OFX9CNzpEs6gdFVSumEPGrCs0FH8XZI/u3yoYwJZa
         uKo702R5JMnU1OB0H3i6hWn/qAHu1lONOGHF7PuWmxAQH4iGNUbp5RQ7pIpcoQ600jgq
         HpNw==
X-Forwarded-Encrypted: i=1; AJvYcCVmEQg3srAVTb1Dos6FoqAvKUco5ZItsD9CRV0YleMIWL6xEM2nF/2sQ7aT77mFNCfre9HS44drEDJ4Mg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkeCpKrUHvoXvN3hjWOnEkpZx0KhIcAQBkGvcBK9QRmFa/GRMk
	iNF7y1nvnbgwQuiXIlHKxbyQJlNFSIYPbY6wZ/5bK/CjaQCWPud5pNPigqRT/UiNl7mVG90uQUC
	Fu00JZMcc/Hl2B37PP3uSu3VY/O0wxNv7TPnJFh/W+a+IUkSCWRBmov8wJzbVG3IupQ==
X-Gm-Gg: ATEYQzwveU4TjnDTUlKON30wZkiKFulkPpEocJmiGKQgc0nHhoODmAeJvDvFm/DzySV
	SSOdeXuY2j0Bw9F5b4rcEFFl5FDE6xKd/gVSCYa2IroI+Q4okKOnCX0AzuxzIq5SBmpTIkmbomG
	upVXC6xVO1pdWH9uoIENBvPFpzvpgtSIpwl9aFi0GnVru1Q5SJPBkd1Jy+R5MeMOuk2536x2XLg
	y3MQfVOXhXdh2VkJ1UdCQ2q9NqfeAndgDbSMFGErlj9lvd9snFDJI+RRmg3KfwwwQkZlvbbnFW4
	Ro7QL9lFJffFwpf2VCZzB9qy78B4KNyC+66G5W9FV88oCp8pF6Lby55iFdvBDpn+OTXI1301R0v
	AhLNK5oHTLujHunTUy1l9bNVfrCKfO/F/JXj5gyd9VUyfTyIMX72RWCs=
X-Received: by 2002:a05:620a:4723:b0:8ca:1107:1214 with SMTP id af79cd13be357-8cd6d3fb768mr236458985a.7.1772799735883;
        Fri, 06 Mar 2026 04:22:15 -0800 (PST)
X-Received: by 2002:a05:620a:4723:b0:8ca:1107:1214 with SMTP id af79cd13be357-8cd6d3fb768mr236454085a.7.1772799735361;
        Fri, 06 Mar 2026 04:22:15 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fa87e56sm111972395e9.0.2026.03.06.04.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 04:22:14 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 12/13] ASoC: qcom: qdsp6: remove search for module iid in hot path
Date: Fri,  6 Mar 2026 12:21:14 +0000
Message-ID: <20260306122115.509705-13-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260306122115.509705-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260306122115.509705-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: S7zfURl6XjZg-nrjhyuoUsP2qgKzmFSs
X-Proofpoint-GUID: S7zfURl6XjZg-nrjhyuoUsP2qgKzmFSs
X-Authority-Analysis: v=2.4 cv=L+oQguT8 c=1 sm=1 tr=0 ts=69aac6f8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Ll4dbTg5roZnn8cDlSAA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDExNyBTYWx0ZWRfX++7ScbkcleTd
 kv4rlulmXwxPPXiBBH0rtmdtd/UA0Mf23Mc25GI6QcAa6+9x3C3N1rI8ZYpql6szcjL6+8kGvsr
 l9QdmfzLZ1xnLO5RtzJdg3XLoEvHWFXmgskzRtNZzEFPVmgm/YXaR1ylhvmfV0NXODQv+9cRxSe
 XarH4kR/ikh8lMQJR6hTRKgk4i+n5Y+6KhStF2icL8J6MJlOY2TXzfoFZvwaGrxWTZ/e78uMwcA
 q1Cdx1ZmLfX9keg1SggRoGeHG/JzPzC/Vmp42AUVGcXIb3wea/PdCIoucvXaWmJ5TJckI3ljyMP
 k2Scx1MfOcKF1FfTA79h6N6pcECPULsMXs5zcFHJSp70xXLH51sv7mLK9znITZMS0axi7waRWRV
 AmZS0EP1ajIxB09NO4ZjCarmAcJWio+5jKeiylzYm+uf4mnlFKJFRyKENhCpAMtmuTiLxEY6guW
 Cl2UxoXwFcRlIyhFQ6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060117

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

