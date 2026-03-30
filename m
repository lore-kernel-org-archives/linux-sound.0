Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170C63B52FD
	for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 08:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774858919; cv=none; b=SPrFlxKyihsTnEAWpGOvHbkWj60pN4QXjhcwmpi68ohLxweqa+iXXwG+nu4dpu61oQoh8cw77sQpVHbRTDCFv1iVgGIwg2kVR5133TNWGWV+QMoxaFb7ZAzfzP5s17Iqp48TUD06iAUExfdLFb6DzK7URhlrOTjb5UeWvEb94tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774858919; c=relaxed/simple;
	bh=yI8y5H5KZTFd5wtjajjW87TuV177g83B3ulDFxmlrMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kB2KkAtjD/MFblsIs7iU1uzuPUBkk0oztwGL/3rcteCXHxC1KibU5AoqukAre4IEhJnrW7ffvtI82RF/WSIfkcbu1zxXRdraWocOVJTqdc2ejJzQGmJPROECcI0zDeprU/Q3oWeJNIaTsrzWtfvZ4l3eI7DjVbOQYYHAuvKuRm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jHl622PK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=adEfV74D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jHl622PK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="adEfV74D"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U3n4Jk2953401
	for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 08:21:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=545I+melqtX
	Nw9nJsJgkHp9iu1OPnpZFeiceKqWUeqc=; b=jHl622PKIcyoA1ed7XOufQCCKYh
	8X9w/2pIqxGZf/DKXUViTuAbD7ZwAgipct4Te2WtwgUYrCuO0nw7XK2BE/j8X7jK
	fNjjlbMoYEgSGCqojQ2LgV0uPrMNes5W29ieBZNBt4vf+kRvqL7BMS2QSn84xeQ4
	XwLsv1laGdBXkTmP0RLcdZGXO8PTNGQ88NmZiO5/mIvGUKKTyGrBuVKTD/DNu4vZ
	54ckUvuigwYVuu0qYW6HiYuUTXxv8FzhiK8idgA01zTpJlH4FJCEJYfZvhOv/M4V
	Ljss3H2JMkuYffS34gWRGEVP1R7jkvPBvaK3+YBvSrm35LvygbU3LyWERWQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6wqek2gd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 08:21:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b274f94f8so52946391cf.1
        for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 01:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774858915; x=1775463715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=545I+melqtXNw9nJsJgkHp9iu1OPnpZFeiceKqWUeqc=;
        b=adEfV74D2XfusdGrb0OZJP2jtpAa84V6XpjD61VoKFVMuk2xxbGoYMTdYIsu11ba5w
         c8+23qovpMINZ7VeCJXS8ceT2l25QNr4hXtGhjlaPo+v9+LdOqSJcjJMCGmLjy/pikn5
         tmdIMxRpvUB+9KMriM/EdaDc5UxL4M4rrgofbRbNTGsLuqxwiyaRQru/Xsh6X36kKb3+
         AVNDM434sGo8jdB5fhAh/0G/HGxd02G0Ab817lvV0UZBlp6EiTWCGlErJ5LvnbORdp/9
         vlY9Gs2Ce6HlK/4bzMUCaaW2B6gYaK8K0rm/hOBzxJem9sBN581JPWGRHRSDRNYJvTrZ
         Iz6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774858915; x=1775463715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=545I+melqtXNw9nJsJgkHp9iu1OPnpZFeiceKqWUeqc=;
        b=XArPtlp1I+FUJegPMNmFqncyoT6mTwX9rzu2AQYlHD6YPb+tPEuMrL4Z5IIioKjjlB
         UruHupXoDVeeK4sVvpcvJc+mSYBSK9eoTSoA4tlbC5rM9ywahrUG//1oH6NDdDNDbqSX
         lHG3UrpVMEYnWjuosoSNbesI8a+29cug4iPbxiMjz2C740eIBzai6zu8wjC72VbDPpeT
         Wi2Zww/CaRV5uHH/WBiqXmXlxmWjsLE2qtDxoaItfDatoTEoMMP9DmOpO7Pxl7WO+WMq
         PfmQa4mPBTXjxULZu6wyhIkGu8Xj09FAERJOk1JGXPElZVZ1p+esbM8dwGrZJ4vYdAMG
         aH8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUF+eJNPAT4bYEwuYFiAuN00NZaOH+Cp0X9N3XMX7kUzyYNZwefZqsGOSOK3//FU0Mmav8pLrHWD3Lxsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFqVvWuPbewxJps6wxN1emfHwhio7Xuuwak/99xFSt/5qjGx1g
	YA33BlTTI0eWtkLHnleqpxy3amt7Y4gHaEgj+M1JNeY9jxOkPkUWpKvut0OzQol0g1ypkBzBLb+
	ddsi5gKhnpAvRGj6E8xeqHHfHk17lRsQb3DMapTm7+X1pHv5wmUqNxyCnGX0VPw8kSg==
X-Gm-Gg: ATEYQzwpRq3/sTbfY76FD97JmmDHMYhtDWpnLvy1v5slFWt/H4IpZDxtoUMF1BeWfuG
	H2QjjQHqi8nwIIB7HFHnNqtTipydPaNGjF85zy9wFyIkVqBMos917tK7jrszM3i7Qgo6t6tN71R
	+go6jomz2qIlK71ACrkRkFPS4iek9GEF34EYCzlNaOJUII8x7YTZZIsZ/7UvuD6KaJQUxN6auEu
	FlkBGMf5zGNULFF576ip+wwTtXTTFKqxb1yBSdVadTs9/qiT3Y1kNGk4Y65DRam+ezSwK6ju3Nu
	kOodNDc6TQMBPoVdraD3qgBwAOBfNMrUn+4K/g20IN2rRX77b8A7KromTrpxNX9E7JVQCm9RS+B
	hjI0Ora6lFXfTz+dnCIj7tKmCjjvb6NulDihgODHqpMPD4Txmjf+xgrI=
X-Received: by 2002:a05:622a:312:b0:50b:3ef9:7985 with SMTP id d75a77b69052e-50b994a4a8dmr170789801cf.26.1774858915077;
        Mon, 30 Mar 2026 01:21:55 -0700 (PDT)
X-Received: by 2002:a05:622a:312:b0:50b:3ef9:7985 with SMTP id d75a77b69052e-50b994a4a8dmr170789521cf.26.1774858914509;
        Mon, 30 Mar 2026 01:21:54 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf1db08e6sm26244773f8f.0.2026.03.30.01.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:21:53 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v8 13/13] ASoC: qcom: q6apm: Add support for early buffer mapping on DSP
Date: Mon, 30 Mar 2026 08:21:05 +0000
Message-ID: <20260330082105.278055-14-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260330082105.278055-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260330082105.278055-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Jo78bc4C c=1 sm=1 tr=0 ts=69ca32a4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=Lmls0Cg-LgRrrh2KKlkA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: TTkirEMcxuRHJL_7A2Cpns7HeBdnfVHa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2NSBTYWx0ZWRfX7yz2a/FvsL3J
 LgBjA1wTcLYrEWImmLKGTuqjkhhUXMKaBiVgsd2Okuq9Ot1ZKLEb9N9sol8ACXVZlizBCkPyv/3
 DEpspOfxjH2qRC8CspALDdR0mjLs+/hPNBC9XB+T1bGmYax+K20pLSJRBPx0csz44azofL8mlw6
 SozkATo3NrGrgLk8l0l2tFMKEW9M/wH8aJAUhs6ypX/RXccqVCJkd959QejuYUvSWk7p1hM3eeW
 Pufs/nFlW7Ofbl8whAm4ZIZUeuT9L0FJqXPyqC5gJlfKA5KxolByRciiV2dIUDxPR8YKdNQVkk/
 YOW0+vx6y+sFquWq1xN/EMg+nkN6DJEDV5WsMp4b//yzg/pEmMW0TeBNGDi9i5HWmCTm/VKMyhu
 O/MobkxerzpTBda1MVRdfdvcHDKtjJ3D30SMwBWxwGpFR6oqz5b54ueOl8zAaS9jxeHSXzZWtTZ
 /Gl/aU2R32osR5+LXVw==
X-Proofpoint-ORIG-GUID: TTkirEMcxuRHJL_7A2Cpns7HeBdnfVHa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300065

Buffers are allocated on pcm_new and mapped in the dsp on every
prepare call, which is inefficient and unnecessary.

Add new functions q6apm_[un]map_memory_fixed_region to map it on
to dsp only once after allocation.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c |  60 ------------
 sound/soc/qcom/qdsp6/audioreach.h |   5 +-
 sound/soc/qcom/qdsp6/q6apm-dai.c  | 107 ++++++++++++++++++---
 sound/soc/qcom/qdsp6/q6apm.c      | 151 +++++++++++++++++++-----------
 sound/soc/qcom/qdsp6/q6apm.h      |  14 +--
 5 files changed, 202 insertions(+), 135 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 241c3b4479c6..b2975eebab71 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -1396,66 +1396,6 @@ void audioreach_graph_free_buf(struct q6apm_graph *graph)
 }
 EXPORT_SYMBOL_GPL(audioreach_graph_free_buf);
 
-int audioreach_map_memory_regions(struct q6apm_graph *graph, unsigned int dir, size_t period_sz,
-				  unsigned int periods, bool is_contiguous)
-{
-	struct apm_shared_map_region_payload *mregions;
-	struct apm_cmd_shared_mem_map_regions *cmd;
-	uint32_t num_regions, buf_sz, payload_size;
-	struct audioreach_graph_data *data;
-	struct gpr_pkt *pkt __free(kfree) = NULL;
-	void *p;
-	int i;
-
-	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
-		data = &graph->rx_data;
-	else
-		data = &graph->tx_data;
-
-	if (is_contiguous) {
-		num_regions = 1;
-		buf_sz = period_sz * periods;
-	} else {
-		buf_sz = period_sz;
-		num_regions = periods;
-	}
-
-	/* DSP expects size should be aligned to 4K */
-	buf_sz = ALIGN(buf_sz, 4096);
-
-	payload_size = sizeof(*cmd) + (sizeof(*mregions) * num_regions);
-
-	pkt = audioreach_alloc_apm_pkt(payload_size, APM_CMD_SHARED_MEM_MAP_REGIONS, dir,
-				     graph->port->id);
-	if (IS_ERR(pkt))
-		return PTR_ERR(pkt);
-
-	p = (void *)pkt + GPR_HDR_SIZE;
-	cmd = p;
-	cmd->mem_pool_id = APM_MEMORY_MAP_SHMEM8_4K_POOL;
-	cmd->num_regions = num_regions;
-
-	cmd->property_flag = 0x0;
-
-	mregions = p + sizeof(*cmd);
-
-	mutex_lock(&graph->lock);
-
-	for (i = 0; i < num_regions; i++) {
-		struct audio_buffer *ab;
-
-		ab = &data->buf[i];
-		mregions->shm_addr_lsw = lower_32_bits(ab->phys);
-		mregions->shm_addr_msw = upper_32_bits(ab->phys);
-		mregions->mem_size_bytes = buf_sz;
-		++mregions;
-	}
-	mutex_unlock(&graph->lock);
-
-	return audioreach_graph_send_cmd_sync(graph, pkt, APM_CMD_RSP_SHARED_MEM_MAP_REGIONS);
-}
-EXPORT_SYMBOL_GPL(audioreach_map_memory_regions);
-
 int audioreach_shared_memory_send_eos(struct q6apm_graph *graph)
 {
 	struct data_cmd_wr_sh_mem_ep_eos *eos;
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 89f172aab8c0..6ddc287f0fb4 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -722,6 +722,7 @@ struct audioreach_connection {
 
 struct audioreach_graph_info {
 	int id;
+	uint32_t mem_map_handle;
 	uint32_t num_sub_graphs;
 	struct list_head sg_list;
 	/* DPCM connection from FE Graph to BE graph */
@@ -838,10 +839,6 @@ int audioreach_tplg_init(struct snd_soc_component *component);
 
 /* Module specific */
 void audioreach_graph_free_buf(struct q6apm_graph *graph);
-int audioreach_map_memory_regions(struct q6apm_graph *graph,
-				  unsigned int dir, size_t period_sz,
-				  unsigned int periods,
-				  bool is_contiguous);
 int audioreach_send_cmd_sync(struct device *dev, gpr_device_t *gdev, struct gpr_ibasic_rsp_result_t *result,
 			     struct mutex *cmd_lock, gpr_port_t *port, wait_queue_head_t *cmd_wait,
 			     struct gpr_pkt *pkt, uint32_t rsp_opcode);
diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 86d6438bd9fd..ede19fdea6e9 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -228,11 +228,10 @@ static int q6apm_dai_prepare(struct snd_soc_component *component,
 	cfg.bit_width = prtd->bits_per_sample;
 	cfg.fmt = SND_AUDIOCODEC_PCM;
 	audioreach_set_default_channel_mapping(cfg.channel_map, runtime->channels);
-
 	if (prtd->state) {
 		/* clear the previous setup if any  */
 		q6apm_graph_stop(prtd->graph);
-		q6apm_unmap_memory_regions(prtd->graph, substream->stream);
+		q6apm_free_fragments(prtd->graph, substream->stream);
 	}
 
 	prtd->pcm_count = snd_pcm_lib_period_bytes(substream);
@@ -247,8 +246,8 @@ static int q6apm_dai_prepare(struct snd_soc_component *component,
 	if (ret < 0)
 		dev_err(dev, "%s: CMD Format block failed\n", __func__);
 
-	ret = q6apm_map_memory_regions(prtd->graph, substream->stream, prtd->phys,
-				       (prtd->pcm_size / prtd->periods), prtd->periods);
+	ret = q6apm_alloc_fragments(prtd->graph, substream->stream, prtd->phys,
+				(prtd->pcm_size / prtd->periods), prtd->periods);
 
 	if (ret < 0) {
 		dev_err(dev, "Audio Start: Buffer Allocation failed rc = %d\n",	ret);
@@ -416,9 +415,10 @@ static int q6apm_dai_close(struct snd_soc_component *component,
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct q6apm_dai_rtd *prtd = runtime->private_data;
 
-	if (prtd->state) { /* only stop graph that is started */
+	if (prtd->state) {
+		/* only stop graph that is started */
 		q6apm_graph_stop(prtd->graph);
-		q6apm_unmap_memory_regions(prtd->graph, substream->stream);
+		q6apm_free_fragments(prtd->graph, substream->stream);
 	}
 
 	q6apm_graph_close(prtd->graph);
@@ -467,11 +467,94 @@ static int q6apm_dai_hw_params(struct snd_soc_component *component,
 	return 0;
 }
 
+static int q6apm_dai_memory_map(struct snd_soc_component *component,
+				struct snd_pcm_substream *substream, int graph_id)
+{
+	struct q6apm_dai_data *pdata;
+	struct device *dev = component->dev;
+	phys_addr_t phys;
+	int ret;
+
+	pdata = snd_soc_component_get_drvdata(component);
+	if (!pdata) {
+		dev_err(component->dev, "Drv data not found ..\n");
+		return -EINVAL;
+	}
+
+	if (pdata->sid < 0)
+		phys = substream->dma_buffer.addr;
+	else
+		phys = substream->dma_buffer.addr | (pdata->sid << 32);
+
+	ret = q6apm_map_memory_fixed_region(dev, graph_id, phys, BUFFER_BYTES_MAX);
+	if (ret < 0)
+		dev_err(dev, "Audio Start: Buffer Allocation failed rc = %d\n",	ret);
+
+	return ret;
+}
+
 static int q6apm_dai_pcm_new(struct snd_soc_component *component, struct snd_soc_pcm_runtime *rtd)
 {
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_pcm *pcm = rtd->pcm;
 	int size = BUFFER_BYTES_MAX;
+	int graph_id, ret;
+	struct snd_pcm_substream *substream;
+
+	graph_id = cpu_dai->driver->id;
+
+	ret = snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, component->dev, size);
+	if (ret)
+		return ret;
+
+	/* Note: DSP backend dais are uni-directional ONLY(either playback or capture) */
+	if (pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream) {
+		substream = pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
+		ret = q6apm_dai_memory_map(component, substream, graph_id);
+		if (ret)
+			return ret;
+	}
+
+	if (pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream) {
+		substream = pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream;
+		ret = q6apm_dai_memory_map(component, substream, graph_id);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static void q6apm_dai_memory_unmap(struct snd_soc_component *component,
+				   struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *soc_prtd;
+	struct snd_soc_dai *cpu_dai;
+	int graph_id;
+
+	soc_prtd = snd_soc_substream_to_rtd(substream);
+	if (!soc_prtd)
+		return;
+
+	cpu_dai = snd_soc_rtd_to_cpu(soc_prtd, 0);
+	if (!cpu_dai)
+		return;
+
+	graph_id = cpu_dai->driver->id;
+	q6apm_unmap_memory_fixed_region(component->dev, graph_id);
+}
+
+static void q6apm_dai_pcm_free(struct snd_soc_component *component, struct snd_pcm *pcm)
+{
+	struct snd_pcm_substream *substream;
+
+	substream = pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream;
+	if (substream)
+		q6apm_dai_memory_unmap(component, substream);
 
-	return snd_pcm_set_fixed_buffer_all(rtd->pcm, SNDRV_DMA_TYPE_DEV, component->dev, size);
+	substream = pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
+	if (substream)
+		q6apm_dai_memory_unmap(component, substream);
 }
 
 static int q6apm_dai_compr_open(struct snd_soc_component *component,
@@ -530,7 +613,8 @@ static int q6apm_dai_compr_free(struct snd_soc_component *component,
 	struct q6apm_dai_rtd *prtd = runtime->private_data;
 
 	q6apm_graph_stop(prtd->graph);
-	q6apm_unmap_memory_regions(prtd->graph, SNDRV_PCM_STREAM_PLAYBACK);
+	q6apm_free_fragments(prtd->graph, SNDRV_PCM_STREAM_PLAYBACK);
+	q6apm_unmap_memory_fixed_region(component->dev, prtd->graph->id);
 	q6apm_graph_close(prtd->graph);
 	snd_dma_free_pages(&prtd->dma_buffer);
 	prtd->graph = NULL;
@@ -679,9 +763,9 @@ static int q6apm_dai_compr_set_params(struct snd_soc_component *component,
 		if (ret)
 			return ret;
 
-		ret = q6apm_map_memory_regions(prtd->graph, SNDRV_PCM_STREAM_PLAYBACK,
-					       prtd->phys, (prtd->pcm_size / prtd->periods),
-					       prtd->periods);
+		ret = q6apm_alloc_fragments(prtd->graph, SNDRV_PCM_STREAM_PLAYBACK,
+					prtd->phys, (prtd->pcm_size / prtd->periods),
+					prtd->periods);
 		if (ret < 0)
 			return -ENOMEM;
 
@@ -834,6 +918,7 @@ static const struct snd_soc_component_driver q6apm_fe_dai_component = {
 	.close		= q6apm_dai_close,
 	.prepare	= q6apm_dai_prepare,
 	.pcm_new	= q6apm_dai_pcm_new,
+	.pcm_free	= q6apm_dai_pcm_free,
 	.hw_params	= q6apm_dai_hw_params,
 	.pointer	= q6apm_dai_pointer,
 	.trigger	= q6apm_dai_trigger,
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 6a3942a1ed28..3c119a6132e4 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -200,13 +200,53 @@ int q6apm_graph_media_format_shmem(struct q6apm_graph *graph,
 }
 EXPORT_SYMBOL_GPL(q6apm_graph_media_format_shmem);
 
-int q6apm_map_memory_regions(struct q6apm_graph *graph, unsigned int dir, phys_addr_t phys,
-			     size_t period_sz, unsigned int periods)
+int q6apm_map_memory_fixed_region(struct device *dev, unsigned int graph_id, phys_addr_t phys,
+				  size_t sz)
+{
+	struct audioreach_graph_info *info;
+	struct q6apm *apm = dev_get_drvdata(dev->parent);
+	struct apm_shared_map_region_payload *mregions;
+	struct apm_cmd_shared_mem_map_regions *cmd;
+	int payload_size = sizeof(*cmd) + (sizeof(*mregions));
+	uint32_t buf_sz;
+	void *p;
+	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(payload_size,
+						APM_CMD_SHARED_MEM_MAP_REGIONS, graph_id);
+	if (IS_ERR(pkt))
+		return PTR_ERR(pkt);
+
+	info = idr_find(&apm->graph_info_idr, graph_id);
+	if (!info)
+		return -ENODEV;
+
+	if (info->mem_map_handle)
+		return 0;
+
+	/* DSP expects size should be aligned to 4K */
+	buf_sz = ALIGN(sz, 4096);
+
+	p = (void *)pkt + GPR_HDR_SIZE;
+	cmd = p;
+	cmd->mem_pool_id = APM_MEMORY_MAP_SHMEM8_4K_POOL;
+	cmd->num_regions = 1;
+	cmd->property_flag = 0x0;
+
+	mregions = p + sizeof(*cmd);
+
+	mregions->shm_addr_lsw = lower_32_bits(phys);
+	mregions->shm_addr_msw = upper_32_bits(phys);
+	mregions->mem_size_bytes = buf_sz;
+
+	return q6apm_send_cmd_sync(apm, pkt, APM_CMD_RSP_SHARED_MEM_MAP_REGIONS);
+}
+EXPORT_SYMBOL_GPL(q6apm_map_memory_fixed_region);
+
+int q6apm_alloc_fragments(struct q6apm_graph *graph, unsigned int dir, phys_addr_t phys,
+				size_t period_sz, unsigned int periods)
 {
 	struct audioreach_graph_data *data;
 	struct audio_buffer *buf;
 	int cnt;
-	int rc;
 
 	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
 		data = &graph->rx_data;
@@ -248,46 +288,41 @@ int q6apm_map_memory_regions(struct q6apm_graph *graph, unsigned int dir, phys_a
 
 	mutex_unlock(&graph->lock);
 
-	rc = audioreach_map_memory_regions(graph, dir, period_sz, periods, 1);
-	if (rc < 0) {
-		dev_err(graph->dev, "Memory_map_regions failed\n");
-		audioreach_graph_free_buf(graph);
-	}
-
-	return rc;
+	return 0;
 }
-EXPORT_SYMBOL_GPL(q6apm_map_memory_regions);
+EXPORT_SYMBOL_GPL(q6apm_alloc_fragments);
 
-int q6apm_unmap_memory_regions(struct q6apm_graph *graph, unsigned int dir)
+int q6apm_unmap_memory_fixed_region(struct device *dev, unsigned int graph_id)
 {
 	struct apm_cmd_shared_mem_unmap_regions *cmd;
-	struct audioreach_graph_data *data;
-	int rc;
+	struct q6apm *apm = dev_get_drvdata(dev->parent);
+	struct audioreach_graph_info *info;
+	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(sizeof(*cmd),
+						APM_CMD_SHARED_MEM_UNMAP_REGIONS, graph_id);
+	if (IS_ERR(pkt))
+		return PTR_ERR(pkt);
 
-	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
-		data = &graph->rx_data;
-	else
-		data = &graph->tx_data;
+	info = idr_find(&apm->graph_info_idr, graph_id);
+	if (!info)
+		return -ENODEV;
 
-	if (!data->mem_map_handle)
+	if (!info->mem_map_handle)
 		return 0;
 
-	struct gpr_pkt *pkt __free(kfree) =
-		audioreach_alloc_apm_pkt(sizeof(*cmd), APM_CMD_SHARED_MEM_UNMAP_REGIONS,
-					 dir, graph->port->id);
-	if (IS_ERR(pkt))
-		return PTR_ERR(pkt);
-
 	cmd = (void *)pkt + GPR_HDR_SIZE;
-	cmd->mem_map_handle = data->mem_map_handle;
+	cmd->mem_map_handle = info->mem_map_handle;
 
-	rc = audioreach_graph_send_cmd_sync(graph, pkt, APM_CMD_SHARED_MEM_UNMAP_REGIONS);
+	return q6apm_send_cmd_sync(apm, pkt, APM_CMD_SHARED_MEM_UNMAP_REGIONS);
+}
+EXPORT_SYMBOL_GPL(q6apm_unmap_memory_fixed_region);
 
+int q6apm_free_fragments(struct q6apm_graph *graph, unsigned int dir)
+{
 	audioreach_graph_free_buf(graph);
 
-	return rc;
+	return 0;
 }
-EXPORT_SYMBOL_GPL(q6apm_unmap_memory_regions);
+EXPORT_SYMBOL_GPL(q6apm_free_fragments);
 
 int q6apm_remove_initial_silence(struct device *dev, struct q6apm_graph *graph, uint32_t samples)
 {
@@ -429,7 +464,7 @@ int q6apm_write_async(struct q6apm_graph *graph, uint32_t len, uint32_t msw_ts,
 	write_buffer->buf_size = len;
 	write_buffer->timestamp_lsw = lsw_ts;
 	write_buffer->timestamp_msw = msw_ts;
-	write_buffer->mem_map_handle = graph->rx_data.mem_map_handle;
+	write_buffer->mem_map_handle = graph->info->mem_map_handle;
 	write_buffer->flags = wflags;
 
 	graph->rx_data.dsp_buf++;
@@ -463,7 +498,7 @@ int q6apm_read(struct q6apm_graph *graph)
 
 	read_buffer->buf_addr_lsw = lower_32_bits(ab->phys);
 	read_buffer->buf_addr_msw = upper_32_bits(ab->phys);
-	read_buffer->mem_map_handle = port->mem_map_handle;
+	read_buffer->mem_map_handle = graph->info->mem_map_handle;
 	read_buffer->buf_size = ab->size;
 
 	port->dsp_buf++;
@@ -494,7 +529,6 @@ static int graph_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 {
 	struct data_cmd_rsp_rd_sh_mem_ep_data_buffer_done_v2 *rd_done;
 	struct data_cmd_rsp_wr_sh_mem_ep_data_buffer_done_v2 *done;
-	struct apm_cmd_rsp_shared_mem_map_regions *rsp;
 	const struct gpr_ibasic_rsp_result_t *result;
 	struct q6apm_graph *graph = priv;
 	const struct gpr_hdr *hdr = &data->hdr;
@@ -529,18 +563,6 @@ static int graph_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 				done->buf_addr_msw);
 		}
 
-		break;
-	case APM_CMD_RSP_SHARED_MEM_MAP_REGIONS:
-		graph->result.opcode = hdr->opcode;
-		graph->result.status = 0;
-		rsp = data->payload;
-
-		if (hdr->token == SNDRV_PCM_STREAM_PLAYBACK)
-			graph->rx_data.mem_map_handle = rsp->mem_map_handle;
-		else
-			graph->tx_data.mem_map_handle = rsp->mem_map_handle;
-
-		wake_up(&graph->cmd_wait);
 		break;
 	case DATA_CMD_RSP_RD_SH_MEM_EP_DATA_BUFFER_V2:
 		if (!graph->ar_graph)
@@ -571,16 +593,6 @@ static int graph_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 		break;
 	case GPR_BASIC_RSP_RESULT:
 		switch (result->opcode) {
-		case APM_CMD_SHARED_MEM_UNMAP_REGIONS:
-			graph->result.opcode = result->opcode;
-			graph->result.status = 0;
-			if (hdr->token == SNDRV_PCM_STREAM_PLAYBACK)
-				graph->rx_data.mem_map_handle = 0;
-			else
-				graph->tx_data.mem_map_handle = 0;
-
-			wake_up(&graph->cmd_wait);
-			break;
 		case APM_CMD_SHARED_MEM_MAP_REGIONS:
 		case DATA_CMD_WR_SH_MEM_EP_MEDIA_FORMAT:
 		case APM_CMD_SET_CFG:
@@ -784,7 +796,9 @@ struct audioreach_module *q6apm_find_module_by_mid(struct q6apm_graph *graph, ui
 static int apm_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 {
 	gpr_device_t *gdev = priv;
+	struct audioreach_graph_info *info;
 	struct q6apm *apm = dev_get_drvdata(&gdev->dev);
+	struct apm_cmd_rsp_shared_mem_map_regions *rsp;
 	struct device *dev = &gdev->dev;
 	struct gpr_ibasic_rsp_result_t *result;
 	const struct gpr_hdr *hdr = &data->hdr;
@@ -801,6 +815,7 @@ static int apm_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 		break;
 	case GPR_BASIC_RSP_RESULT:
 		switch (result->opcode) {
+		case APM_CMD_SHARED_MEM_MAP_REGIONS:
 		case APM_CMD_GRAPH_START:
 		case APM_CMD_GRAPH_OPEN:
 		case APM_CMD_GRAPH_PREPARE:
@@ -815,10 +830,38 @@ static int apm_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 					result->opcode);
 			wake_up(&apm->wait);
 			break;
+		case APM_CMD_SHARED_MEM_UNMAP_REGIONS:
+			apm->result.opcode = hdr->opcode;
+			apm->result.status = 0;
+			rsp = data->payload;
+
+			info = idr_find(&apm->graph_info_idr, hdr->token);
+			if (info)
+				info->mem_map_handle = 0;
+			else
+				dev_err(dev, "Error (%d) Processing 0x%08x cmd\n", result->status,
+					result->opcode);
+
+			wake_up(&apm->wait);
+			break;
 		default:
 			break;
 		}
 		break;
+	case APM_CMD_RSP_SHARED_MEM_MAP_REGIONS:
+		apm->result.opcode = hdr->opcode;
+		apm->result.status = 0;
+		rsp = data->payload;
+
+		info = idr_find(&apm->graph_info_idr, hdr->token);
+		if (info)
+			info->mem_map_handle = rsp->mem_map_handle;
+		else
+			dev_err(dev, "Error (%d) Processing 0x%08x cmd\n", result->status,
+				result->opcode);
+
+		wake_up(&apm->wait);
+		break;
 	default:
 		break;
 	}
diff --git a/sound/soc/qcom/qdsp6/q6apm.h b/sound/soc/qcom/qdsp6/q6apm.h
index 7c646ffcf956..909fc337fd28 100644
--- a/sound/soc/qcom/qdsp6/q6apm.h
+++ b/sound/soc/qcom/qdsp6/q6apm.h
@@ -78,7 +78,6 @@ struct audioreach_graph_data {
 	struct audio_buffer *buf;
 	uint32_t num_periods;
 	uint32_t dsp_buf;
-	uint32_t mem_map_handle;
 	atomic_t hw_ptr;
 };
 
@@ -134,11 +133,14 @@ int q6apm_write_async(struct q6apm_graph *graph, uint32_t len, uint32_t msw_ts,
 		      uint32_t lsw_ts, uint32_t wflags);
 
 /* Memory Map related */
-int q6apm_map_memory_regions(struct q6apm_graph *graph,
-			     unsigned int dir, phys_addr_t phys,
-			     size_t period_sz, unsigned int periods);
-int q6apm_unmap_memory_regions(struct q6apm_graph *graph,
-			       unsigned int dir);
+int q6apm_map_memory_fixed_region(struct device *dev,
+			     unsigned int graph_id, phys_addr_t phys,
+			     size_t sz);
+int q6apm_alloc_fragments(struct q6apm_graph *graph,
+			unsigned int dir, phys_addr_t phys,
+			size_t period_sz, unsigned int periods);
+int q6apm_free_fragments(struct q6apm_graph *graph, unsigned int dir);
+int q6apm_unmap_memory_fixed_region(struct device *dev, unsigned int graph_id);
 /* Helpers */
 int q6apm_send_cmd_sync(struct q6apm *apm, struct gpr_pkt *pkt,
 			uint32_t rsp_opcode);
-- 
2.47.3

