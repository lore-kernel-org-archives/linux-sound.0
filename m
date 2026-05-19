Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329E74DC549
	for <linux-sound@vger.kernel.org>; Tue, 19 May 2026 13:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779196540; cv=none; b=G3ox/ftqsdSENpa6JGR5l4LophQBvlQvI8Mmx/c+sT1tnJkgOAJXBt2141YvL8wtzABQPWfrzRo1cjCxw/rP9/jdL1hgPgBj3wZRiC8pkm0nKdiZljPc6VldzblEMZ0Pqg/cDrqx6q0qAQhHCzA1UI6pWaDK219Z2Cs1XiH7vOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779196540; c=relaxed/simple;
	bh=xzzL21LQ0JUCoqtli3nm8gu0EEyFSRN9RZAEojxLUxw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jT9lr5q23mywENAfRfC8YHbu3/mrwI/UD/JijOwEFOHd5Kr2Qjt7OQmBcWOa2zzhS4xGuRPgm2EifMJXHHhDkC6/+r0GZbJC9PYVIJ6R7bXdXlPSigYuTJgSf5EJmlweGY8/zx8zTnFlD7MO/ZixAQOHQO/C2PQJZefSFxg1ptE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CO/S+5jR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FKIxdPnt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CO/S+5jR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FKIxdPnt"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J9ll1F254433
	for <linux-sound@vger.kernel.org>; Tue, 19 May 2026 13:15:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mYev7kpgqkN
	DdJjz3ITaD4t3ttI5h9By3yLE/B2VHDM=; b=CO/S+5jRfpwx/lp2O9gCt+uvZJD
	BtLpcrtr1Byt6F8ZzWsThSMkDg2ZfvJ2qC+stzldEy9OQABssEqdojyo/vgJHj8a
	JopoydrrWfs2U9cBTL0qLX0BJIAUqlj6sTFg3Lnm7yJMLvA7YSu/W+wlT85SSxdc
	DtCIWvPs7GD3Hk16bdW4NZECstf/o+uK/lZGTa49ufQ7f/5Mk7vddNUWrssLzqU2
	LTrYCwA2Whp8ycw1ShA0veCwgeiuHA9OC6EFuIIQvNiwsa05qDzeMc3fL9qcEko4
	xe6VbSbebiBUxMEVqsu6TzJ2oSpdT0IuCxINe0ALzw0qkkMCZ4JI6MnoaUw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8h87t11g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 19 May 2026 13:15:35 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5751772dec6so7759342e0c.2
        for <linux-sound@vger.kernel.org>; Tue, 19 May 2026 06:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779196534; x=1779801334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mYev7kpgqkNDdJjz3ITaD4t3ttI5h9By3yLE/B2VHDM=;
        b=FKIxdPnt2AxaTKEl8PfBKNSrMH262uW3dYOVepLd7Q5Rc1dFDzbDOt8Gs4j48McnUo
         uZ3sch1AAm4j2gpQ/OPgaELAmx9MREj3Hs20zjrr2ZRpXDCzgvHOaeemK+2bJz3jyfBN
         6uc/UloxEG5ns00AgsXI9ZQhq2v0EIS3xWDxkYxG08WnIuaRsV4ERZaAH8+SmEl5QreM
         LtoQWz4sK2Ka/nQLE6WpBqiVYvBf6zNAy7hkjtdOz4XLLfIEkONM/UoKV2aqpZ5oCg5C
         FcAYujF9FGqRnXm+8Y23oKygum3wk6X86qkLF75dZ/addxBNuMxsI/XncdmdCnHMynfH
         mzSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779196534; x=1779801334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mYev7kpgqkNDdJjz3ITaD4t3ttI5h9By3yLE/B2VHDM=;
        b=mRf110XbFLgZd/5n56+4GyGH+MooPrO/8ABqEVlhmmt5qSHTDwRQ+uUDfOJk+esqux
         MkBDXY4DQDAn5hNsNnZSBnCmYt6LJcdz0ZES200UacI/hZPzlfs70D+3fyFxR5IdnRYT
         tEKaOZsdYDWXXnqGYSrmN47uLmDqfogUMulnSGrOzSWuf5Rdmtop1Ri0rYyEpaQ97sKV
         S00qrk8+mxqBIgPzn6sTO31odfGhKmRjoKkzt6lgye68gxwkZriVNnO53tLmPe1VIJOz
         0EWiVfRcFxX1Be7FiFmS4MPNWa2UIE7W6u/1xK5lF7vGg8tMz6IHsvkvq6d0qoMKfgvd
         0lUQ==
X-Forwarded-Encrypted: i=1; AFNElJ/hyHXDzTXnRT+7hAtv3AM2+HrCHuhYvnCnrIMxwbO6ylVu/+xwONBjHrHo9rqMDyn0NdWylLDQxioGXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHIiu/KLBoriAjspeaByANx8HewCRcQXVWUTzTiuznEZZ0GNZy
	MSipEuUlx+aWl5vvKmBq/NoBdx/K8vRBSr0DsZrc3EqwoigDtZ8WrrNjzdYrQzPTTnK64+bMGJ1
	yim/gm0oglCg9/JzKuz+kgqNBq0GnYQGWi3bN80aEYHbOW5ipmaZZu1iElanyRDKi6w==
X-Gm-Gg: Acq92OFZJAn87Fxvloc/Cjz8pxHxIAS/HZ/E7cAjYklt+k3zYxGCHuR7gYUiFHsbah3
	XtLGAaRGs+EXMQz/6e5NAnza9lHXfstvu0FV3EHHtn6mE2xy366Vy/ZwU2VfG/3Q2AUlcZDL4Lb
	X/DuYHfLeQnZyGuvBdWfa3YhOCmvKn9e1sMIanTcZJ/QNi/bed+t35BWmNWBEMFtbezeJagtHd8
	p6OL8Cr4lH4OOt+WI7QySekNqNFOdcc+R7Vl+3QZH9YIHJdiHveBcsxo0uUKDiHqrP0ISyMX4qb
	US62kI2z5Mf/Eyq4iOk7SJk852gs1CMrWiBS0miHPS8bMVfHEZPkmDxXAG5RRTsm+60hGTJh/UY
	9t+odZ1LupvQUZtYPTTENBGx9ksPhMZrLLvJhNyMH7i3XEs966JTlJNQ=
X-Received: by 2002:a05:6122:6b8e:10b0:577:51e4:ef20 with SMTP id 71dfb90a1353d-57751e4f011mr3849581e0c.10.1779196534540;
        Tue, 19 May 2026 06:15:34 -0700 (PDT)
X-Received: by 2002:a05:6122:6b8e:10b0:577:51e4:ef20 with SMTP id 71dfb90a1353d-57751e4f011mr3849493e0c.10.1779196534073;
        Tue, 19 May 2026 06:15:34 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1aeafsm48018609f8f.23.2026.05.19.06.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 06:15:33 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: srini@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        mohammad.rafi.shaik@oss.qualcomm.com, alexey.klimov@linaro.org,
        ravi.hothi@oss.qualcomm.com, mathieu.poirier@linaro.org,
        verhaegen@google.com, andersson@kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 3/6] ASoC: qcom: q6apm: remove shared memory IID helpers
Date: Tue, 19 May 2026 13:15:24 +0000
Message-ID: <20260519131527.4002526-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260519131527.4002526-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260519131527.4002526-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: fq2YsT9UyP3yt2oEe9PlBb5MPD95YRei
X-Proofpoint-ORIG-GUID: fq2YsT9UyP3yt2oEe9PlBb5MPD95YRei
X-Authority-Analysis: v=2.4 cv=a9sAM0SF c=1 sm=1 tr=0 ts=6a0c6277 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=j5C22CDG7AQ3G0DocvUA:9 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEzMSBTYWx0ZWRfX4PLKw/83saUl
 jqKc/Zhsj0BJHTi+S/i28V2gx6twfcH4f+K47D3AqhtwGj6Q/dBYygTigaDp121YeVloOQXMkOu
 KJ1o/Y/QMKBrgzQlFRquGUt6E7ufgeq+ctQ8ezJRvNZl6jk3AFXlveSql5YuBw3WKvBakfx2f3a
 aOPeejnlLEm3oi2X6o9N7bOPDoQidHctvYNtoX2OsLH0z9Y54fV359MqlbczYs/HoyylirwCEF1
 04Q119fupTAP7MRdy3GD2jxVNqWl+3/eM4CfU/JBzzS65M+TGiI1p3ScRZ3DYbpuWx02CD1IZDe
 NOexl5DQ4rCqhdyCMFWFH7+6w8jaLIMn2AhX+Ri3gxue5HiygFLZIywcgzxXcJXUmFTfrI6wPdD
 2XcDdZqOKXYbjecIe9rGoNK7U+s6LcoQTZzatud1ZTk6mJGtZzNYWZthzQIW/7DGZ4jyWL2Bzg7
 iP+v1CSW8GuIMNwvkYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190131

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
2.47.3

