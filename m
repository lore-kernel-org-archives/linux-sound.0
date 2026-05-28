Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A253321DC
	for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 18:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779994712; cv=none; b=lBkRW19WkMmtzylh+LlhzIkQV2RFh7AevQG85xPT58U0b5jVik5aMjWML+IVzShpm60b5Sd9ojEyySseZzocpMwqZ8E079hixija9CMycmGRCY6rOF/ru8kZSRNalHS4hYHtkHo7HmtKj2gNiK36kWM8BPM24Qj+cv44LtIvlBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779994712; c=relaxed/simple;
	bh=CXlj9K23mR8qPUX3PeSAShFKAdclQLFGUkSjy2wEbQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MKgcchKOYUVYjVcG+tWWzS+eGhFwYzEa5t8y99xeRWJ6p9zvY6tq8/B3f3thnGxF16YPL+9deQd0jEsPjeMOVPkv/T5eu8W3/N0z4dQFlEK1vZvdug35w6WeJ6cDL0lg6EVXQpjGqkuDexKs/JgDI4H7lD5opd2qlHh55R6GVwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BaJljEms; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h6XV/iG+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BaJljEms";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h6XV/iG+"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64SI52ZJ2794043
	for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 18:58:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LT5tF3xgMpv
	qZXrzTVKQeff3Id1ajAsfnsR/quIBRtw=; b=BaJljEmsdo483x8J22C/4LrS9Pp
	T4IPr/1ARn+M3RIw7ucrEOxcA/8i2cMRkBAk7YWvL316JOferUiJay4Y5ILHyZmY
	bR2ca6uj7uhlebcEx6HgNVj4Tt0jrZmc1YWwCOkNM4pzQpSI9C7oc6PCz2U5K2er
	a2/lrCz/jU2MoauKNRQ8jIWYwi5Me8o522vfmMM7lVxPtuLzfoT3cJRnsSrE1CwM
	Pzqxtx1uRGN4TF5bRNnKsIZ+6xUeIrcvEN5bcvf/Q/lVSmbKlMKbffcuCxLRi+3u
	uAoddxc3+ruXcZNfN7wrackR7T5c+v+UWjseSIb72ZcUziiFnJnFV610EEA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y1v9je-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 18:58:30 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-516ceea1984so141795991cf.1
        for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 11:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779994710; x=1780599510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LT5tF3xgMpvqZXrzTVKQeff3Id1ajAsfnsR/quIBRtw=;
        b=h6XV/iG+oNzQHQMJ7VqWtl7RHlbOZ2SgbQODqfM+fUdDtCcjk199aiqWi/7ZPOmgvk
         aSnOJltsR+9nfTJ0YdrtIq0LnZ70RYuTI01dibVTiWYxAWyFeLjfvC9d3WLkJjJGYEGo
         PgvLQa+z/daLfZ7Tk3gyZF94mv5PGwf85hokC/6qey9tTobZC3p0evL2LbJEYffHgwTM
         1C5AEzUvTTaEowgjFIsreNy7KYjX6yC4LtC+l3lMzhLdx/ZFrUCOKAImCOuqZSiIRXi/
         RnQKL1H3KoH/rLNiaX+SPWW5EviZ1vrhFuSav2QySEnLGq3ibYLiadLtxfA+OORAkq2P
         dttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779994710; x=1780599510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LT5tF3xgMpvqZXrzTVKQeff3Id1ajAsfnsR/quIBRtw=;
        b=E3Blc/BpYvPYCOmPG7+Jl5A70VMnQ/t79bn9gPDFabja88mtPT16Nr0QMHVBOSzIxB
         UB5Dojenyf0lDNa1pbbhLm0YHmmjMBegf7x1JL5mu4FnnkgZ3ORCNj7gWRSuBGWhtxMn
         1CczH43IC/cSES25ihrL9oV9u16cs34SqKb6WoiYAlHZiFbBb6177LqRYXuG6cUVn9xS
         LzVUYFSGtMgeJYvfhTPo+84AG9Xy32tpEXOH/PvorjjjnljKa/YSPvU6JwzS5HXuyrFd
         QiePYWxk7WgcdctVQIApdJTZ1RRJb2TIgycVBgczabSanepHPBX7axhd/UCtUjUQS5ju
         1Rfg==
X-Forwarded-Encrypted: i=1; AFNElJ/ojbKqhDYmvl0IjSlD6N/vSEJfWYT5H7e/uF+6Pq0FGPzgSVQQ3JHWpiFsUHRHBvropTHXeDR/DUV17w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrJ6PEgvl0su0nGGjDDh+PEK4c4xyomJjXHSjccCRIVeLzmbeW
	oPw05x64BJ4hQdzgTbs+X59QJ5oWnL5AmLI6PL4cSchcaptk2B1BinrBKDxS7OYf8hn0cJywO9J
	cCFhkR5n/9OToBt7K0HcSrOEDu2Z0PFOFKyob8btv3KFC7TyJm6vFewcJr1UGTLuyMA==
X-Gm-Gg: Acq92OG8OFxY2y5a3F7mHVRu4MpCRHPcmM3SRNKSnP5sxDvtjMN0DctzCi1cEcAWXpp
	NsekTkTaXMoVzu8s451tQOjtA5fBkTuer+aPejyABn8X/KubJaHcm4qV8CffuVCqbR5HVvGpV9L
	9CHWa7YtI4DbVPZr75GR2sIj+rbHtpQfwXH1D4Np7aK6QR2d+UrzVP/E+y7+nv1vEVf77pyH/v6
	jB6TePSqgP4T8rpekzPCwtLQfSQcXJYItoo5b83aB3baVv6H0WOnQIbzbrMI5Gee4WSku9D4Gif
	7T83Fb3gGoY6/0R7Y058QG/uCP78ZXZDRzxl+dWQRmey/qTxKV+M4gBRnUEWhAwnYME7zXD7kTY
	H7QkZkoVSqSbgfqp3ujp0WghLXI7ZXkdIPfzbql1J6EBd9CQnsbsK/hLqv91RvVotfL+g5A==
X-Received: by 2002:a05:622a:6182:b0:516:e1d4:5541 with SMTP id d75a77b69052e-5172cc88c21mr847141cf.37.1779994709709;
        Thu, 28 May 2026 11:58:29 -0700 (PDT)
X-Received: by 2002:a05:622a:6182:b0:516:e1d4:5541 with SMTP id d75a77b69052e-5172cc88c21mr846761cf.37.1779994709314;
        Thu, 28 May 2026 11:58:29 -0700 (PDT)
Received: from debian (71.248.69.85.rev.sfr.net. [85.69.248.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49099feef7esm3107165e9.0.2026.05.28.11.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 11:58:28 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@oss.qualcomm.com, alexey.klimov@linaro.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ravi.hothi@oss.qualcomm.com,
        mathieu.poirier@linaro.org, andersson@kernel.org, kees@kernel.org,
        verhaegen@google.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 3/6] ASoC: qcom: q6apm: remove shared memory IID helpers
Date: Thu, 28 May 2026 19:58:02 +0100
Message-ID: <20260528185806.6316-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260528185806.6316-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260528185806.6316-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DsNmPm/+ c=1 sm=1 tr=0 ts=6a189056 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=hLrqdhl2Yb02WBc7oxehMg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=j5C22CDG7AQ3G0DocvUA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: ejcSK2SUPa_vgzJdenWp0Z6Etn4ZH2rQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE5MSBTYWx0ZWRfXxY8EPcc/gudd
 7mEJZRw8fjYuvikzX+sI0JX5MgH45yWbmk4EXs5HI4KZ8JwakBIFZ/Jp/12YFh1shDCVxDyZ14c
 d69S81jhu2DmYTko5xTXjXCg2S9ac3YZCXPVxq0hRDIjIZGc7vDYnCOPqE5RKJ+h5+Zps6ebCrX
 Zsokz30dXynu+chI/0uvM6b28u+9nhG0vT1Mpx4YkN4R5nren2r4efxzUXcBEtStSvLEsfAtwWR
 DrHBlAxnPBTqsgwkt2SA1/BqQm4/2kIDSC9c7YcqTurCuPZzPoagjBDO9IfM+PjP0LQYarJBM4O
 SmzDRUdMoWQg7BdZeEVqbvi6zz37Gr1TgxZMqQ5vCn3DU0+opLZpcsxbxostGcwyVaeVYOX+rrp
 deYtA3eiac/hMqfr2ojrc/trQvoCpewCCfTuRpiR79ff2mQKJUibGRcpUv6G8GNbHabkV3N/t68
 oNeENj+2WtQ79luCOog==
X-Proofpoint-GUID: ejcSK2SUPa_vgzJdenWp0Z6Etn4ZH2rQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605280191

The shared memory module instance ID is now cached in graph->shm_iid when
the graph is opened. The old WR/RD shared memory IID helper functions are
no longer used.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 41 ++++++++++++------------------------
 sound/soc/qcom/qdsp6/q6apm.h |  2 --
 2 files changed, 14 insertions(+), 29 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 2cebeb767cd6..6ae7d1645dce 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -417,31 +417,6 @@ int q6apm_graph_media_format_pcm(struct q6apm_graph *graph, struct audioreach_mo
 }
 EXPORT_SYMBOL_GPL(q6apm_graph_media_format_pcm);
 
-static int q6apm_graph_get_tx_shmem_module_iid(struct q6apm_graph *graph)
-{
-	struct audioreach_module *module;
-
-	module = q6apm_find_module_by_mid(graph, MODULE_ID_RD_SHARED_MEM_EP);
-	if (!module)
-		return -ENODEV;
-
-	return module->instance_id;
-
-}
-
-int q6apm_graph_get_rx_shmem_module_iid(struct q6apm_graph *graph)
-{
-	struct audioreach_module *module;
-
-	module = q6apm_find_module_by_mid(graph, MODULE_ID_WR_SHARED_MEM_EP);
-	if (!module)
-		return -ENODEV;
-
-	return module->instance_id;
-
-}
-EXPORT_SYMBOL_GPL(q6apm_graph_get_rx_shmem_module_iid);
-
 int q6apm_write_async(struct q6apm_graph *graph, uint32_t len, uint32_t msw_ts,
 		      uint32_t lsw_ts, uint32_t wflags)
 {
@@ -614,6 +589,18 @@ static int graph_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 	return 0;
 }
 
+static int q6apm_graph_get_module_iid(struct q6apm_graph *graph, uint32_t mid)
+{
+	struct audioreach_module *module;
+
+	module = q6apm_find_module_by_mid(graph, mid);
+	if (!module)
+		return -ENODEV;
+
+	return module->instance_id;
+
+}
+
 struct q6apm_graph *q6apm_graph_open(struct device *dev, q6apm_cb cb,
 				     void *priv, int graph_id, int dir)
 {
@@ -643,9 +630,9 @@ struct q6apm_graph *q6apm_graph_open(struct device *dev, q6apm_cb cb,
 	graph->dev = dev;
 
 	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
-		graph->shm_iid = q6apm_graph_get_rx_shmem_module_iid(graph);
+		graph->shm_iid = q6apm_graph_get_module_iid(graph, MODULE_ID_WR_SHARED_MEM_EP);
 	else
-		graph->shm_iid = q6apm_graph_get_tx_shmem_module_iid(graph);
+		graph->shm_iid = q6apm_graph_get_module_iid(graph, MODULE_ID_RD_SHARED_MEM_EP);
 
 
 	mutex_init(&graph->lock);
diff --git a/sound/soc/qcom/qdsp6/q6apm.h b/sound/soc/qcom/qdsp6/q6apm.h
index 376a36700c53..8ea64085860f 100644
--- a/sound/soc/qcom/qdsp6/q6apm.h
+++ b/sound/soc/qcom/qdsp6/q6apm.h
@@ -148,8 +148,6 @@ int q6apm_send_cmd_sync(struct q6apm *apm, const struct gpr_pkt *pkt,
 /* Callback for graph specific */
 struct audioreach_module *q6apm_find_module_by_mid(struct q6apm_graph *graph,
 						    uint32_t mid);
-int q6apm_graph_get_rx_shmem_module_iid(struct q6apm_graph *graph);
-
 bool q6apm_is_adsp_ready(void);
 
 int q6apm_enable_compress_module(struct device *dev, struct q6apm_graph *graph, bool en);
-- 
2.53.0

