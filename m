Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F8137DABD
	for <linux-sound@vger.kernel.org>; Tue, 25 Aug 2026 18:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787683257; cv=none; b=FrFAoiZgVcYTHavyaEsIBNdSZPyU5qu2dnLzdrE7ynOemU5wNiPp+64CtsI6nT7Egn0CZF3jrwXaZ08V2cgQpFm/RlLIuJGSzlRfRjAtDKpGZSslYAKMIZey6f73kW+JrJtJPjr3hyCzP4RGD4qqICRFDQDxv4yMqoM6hVi7fos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787683257; c=relaxed/simple;
	bh=9Tt4Zd7WmKIRLDwDs0hp3ydCtcayUg1HXRZS0NYCZ8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ph6kcux45BRcQJk0hXKB+s5zFveaiL+gKHsleFJHJTLUwqwVuK0wjaI6ZILu6kk+P0P4G9q4froho2yneAsb/3SYtugKB8KWkkbTxXnMDFtiL+5DbJ/KsSWgUjvdsaQHiygWdaa6dSRzb4SMB7NPp3Vf8y91GuBRMDce+SkT78g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nEvZ6P4a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GWlW96J0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nEvZ6P4a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GWlW96J0"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PHdBti3672836
	for <linux-sound@vger.kernel.org>; Tue, 25 Aug 2026 18:40:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MftIDWqEjgh/I748USFVrQISChM77tFt9i/qUuxkS6M=; b=nEvZ6P4aRRMgH3e8
	4/uAAEnwlxQ0D/KCmjJa0/x3hmIneaGWdRRLpZ3FK6rsH9Lj0hPj6n37hQEVwgRd
	RdefdA+9fX5QFT1paoHq7q/OxVnMwFU1g6p3K5pbCy0q86O6QHftD+GWtewiG8FK
	yPDgyCg0Sf4Wgr9z1KiOde/CzcYo27ePO7tEl40/ecJ93lC/a27c2YHzc6tUX6P+
	7hQ6zUBKt+RsT9HtKcFru5QU+GkeDvDlVeYM35/AuRgugdozj/9fQ9pkzvcAF7T6
	761C8FJ9hd5gkiiqMJ7LqFwRUXWYoGMFPEJ33a/tbYSEkz3lL98ePDR9Il2Z8/vF
	3Oe5rg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9bnj9gu9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 25 Aug 2026 18:40:52 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8485b7e18b4so211319b3a.1
        for <linux-sound@vger.kernel.org>; Tue, 25 Aug 2026 11:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787683252; x=1788288052; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MftIDWqEjgh/I748USFVrQISChM77tFt9i/qUuxkS6M=;
        b=GWlW96J0FJoigZgHqQk4jDSp9XVK37Wqs46Fihaf+Y6SNzEAHLeKAQmS4Fj1yQ1Wkr
         LZzxKWtQ+u8Fx1nzxEUcCgF0xhFM7WLiPoaIj6hNvpf6lcdiyxAlTcPfSM3u/yzKeEmc
         DJGHDtvqMb1HckrXTfi+OyZt0ING+z5+gswVbMLaV1BRdet8BwC4YAUtB6VQJwMFce7b
         TMSapijrY1gwUxPLphwAhvtFHnvpp4rGxjYL4cFCUM6NXnNXzNp/Cwgj5vBf733aQGK0
         sz+bVB7TbmpUkQQDa5XiD8tFlsQOpInJLTPdkvGd6aSEApxs+YYO8ZycWnp4ieVenjeZ
         KmJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787683252; x=1788288052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MftIDWqEjgh/I748USFVrQISChM77tFt9i/qUuxkS6M=;
        b=pgZGmDFiInDbkXfU91/Uz4DfMYcWSa6L3yMVekSPYubJG47bc7kXz2/KdPg7XYALbO
         30JT8ACdnycG/yZQINCnNmYcmS94kUx9US/4rcXBsQBM4bVfAaIPvvzntzmjPAylVqGK
         JWPcVFqzOwKG98jY/rFLddBjDQpkCBX9teweQXszh/lZRkMbYnj/ykuJ7A+lSt9Yk7ow
         h6S4G9GCpSqD3ve/VLVyEJs9VwRYItICt4VHz1954CsjnqEqCegOi3MWi85S+m8XPB8b
         PuhNc3TcDumPojMfa6m5Ta+1CgKiE+BuJzh7UfZ3GPLR76KNbMTfGmsC7aFwxDn6VGYk
         KBoA==
X-Gm-Message-State: AFuF++n6pS0MTH4bNPmGj5vpQAmLjju18JIqD5XaM4Oe7dg//Z1qulE0
	rHxnMQZQQ6vMbkoOjLVbt+pvcK42oiL1zJlgrVoIKiMP48yjBUYxX0eK1d9Qhhty+WT/cEZrjmC
	aNUwqcFty8ChO+wSip47vFiMUE2kq15HtgAsPOUBzWR0z5B1TcuI8ulWnT+esPUyycg==
X-Gm-Gg: AR+sD11vZ+tOLDwuOVzMgbjrcb/yRgNIINq2pWpjx/JS/LPvjSbBh6/eYWw3sZ5eOrO
	6H457NY/xaDr3H6xdBe/dOhv6qfkevQNjwNj5d9MMxraaMagd1mxXzknfvcofxsJPeMjMwyK6o1
	Wg4q31Un8Og0HFbgMYqn8hNJgkKLfapvpo2vxfXoT8crVsaW+vw+JJNmlBzK5GpWQPXizMIoh8f
	R4xsEsAdcIYbY7E2L/1jC+6ZCn2Sz1Wj66cEQKG/gcLC7zSiNLP+yu+EtXlwqXxZGPm6UuHvt76
	5K+bV77uxquMoiUMQDt5Di+bzLnQTEhCSh0t8FDNG0PJA9Wx2hg2BSxvoZJ8of/iOcGZSBnZzM1
	Q66Lato9M/19vkqE/Wb2Qr6GE4d1c
X-Received: by 2002:a05:6a21:6e43:b0:3b4:605c:2163 with SMTP id adf61e73a8af0-3cf74e42efdmr1135038637.4.1787683250666;
        Tue, 25 Aug 2026 11:40:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e43:b0:3b4:605c:2163 with SMTP id adf61e73a8af0-3cf74e42efdmr1134941637.4.1787683250197;
        Tue, 25 Aug 2026 11:40:50 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283fa89e8fsm256117eec.8.2026.08.25.11.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 11:40:49 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 00:10:14 +0530
Subject: [PATCH v2 3/3] ASoC: qcom: qdsp6: generalize GPR service domain
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-a2a-shikra-vmid-v5-v2-3-c3dc62354eee@oss.qualcomm.com>
References: <20260826-a2a-shikra-vmid-v5-v2-0-c3dc62354eee@oss.qualcomm.com>
In-Reply-To: <20260826-a2a-shikra-vmid-v5-v2-0-c3dc62354eee@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pratyush Meduri <mpratyus@qti.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-GUID: 1DlEhZt1yu-aj90GTeYskXKiFqCDW8WU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDE1OCBTYWx0ZWRfX9+abi9OD83jA
 g+I5uoQ4SJdqtKOlh3xp6u/fZstqJxVw/ZLLthAltYPJvWbv09mwDMnrTwE/PEKbGJRH33YF+1c
 EmsMyjeW7HEMgTzIx1+LjDZB+yeIIyJg3tJ7w+Btz9QxwC6hfW2VVZzbTpOeciLJnS5jDPibNCT
 RufliAKKR2eQc8Zv8CkGeTYjf4XPvPKGwbZ0YMmcsiIKfFKTFb7G57RRFo+WrZ2KULu4yslsI+r
 6MsUsvwH2QO4Y8WXonozvmyTwY3yfUB+1HBfoBL68fw7povM0cr39jZc8IKiL3YrVX93MkObBMc
 PsWDfAo3hZdoqWAc8XhgdOr6+pO8IrfLjj8lhpNizSJ2+tVfPfcD6yqr/16NnryE+JzkjECWP31
 adOuCmq1pbUu6nXt/p9DBSRTL/gFHIrGtHL0U24v5XbWKGAJpJLIuemTixMUZOzykBP/1rBOBzG
 yRELBS9uJONDCuEb/3A==
X-Authority-Analysis: v=2.4 cv=ZuHd7d7G c=1 sm=1 tr=0 ts=6a8de1b4 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=06UwNDcAWG1pVACfRQkA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDE1OCBTYWx0ZWRfX8sHgnRghRiFy
 hByduyFSO2A/KH9UV3QInaCuq3Cnn/t3G9FY8yiIqPEQhtp1/xUXtkeuB5fMandKidMHqF9K0pg
 4T3sJD2Xh4w801k5Gm28ajBvHSqraPg=
X-Proofpoint-ORIG-GUID: 1DlEhZt1yu-aj90GTeYskXKiFqCDW8WU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_05,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250158

AudioReach builds APM and PRM command packets with the GPR destination
domain hardcoded to GPR_DOMAIN_ID_ADSP. This assumes audio is always
served by the ADSP, which is true for all currently supported targets.

On platforms such as Qualcomm Shikra, audio is served by the modem DSP
(mDSP) instead. The GPR node in DT already describes which DSP backs
the service via its qcom,domain property (e.g. GPR_DOMAIN_ID_MODEM),
and the GPR core exposes it as gdev->domain_id. But the AudioReach
packet builders ignore this and always target the ADSP, so every
APM/PRM command is routed to the wrong DSP on mDSP targets and audio
does not function.

Fix this by reading the GPR destination domain from gdev->domain_id
and stamping it in the send helpers (q6apm_send_cmd_sync,
audioreach_graph_send_cmd_sync, q6prm_send_cmd_sync) just before
dispatch. This centralizes the domain decision at the send layer
rather than threading it through every packet-allocation call site.
For the small number of async data-path sends that bypass the sync
helpers (write, read, compr, EOS), the domain is stamped inline
before gpr_send_port_pkt(). When no domain is available the helper
falls back to GPR_DOMAIN_ID_ADSP, so all existing ADSP targets
remain unchanged.

Co-developed-by: Pratyush Meduri <mpratyus@qti.qualcomm.com>
Signed-off-by: Pratyush Meduri <mpratyus@qti.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 12 +++++++++---
 sound/soc/qcom/qdsp6/audioreach.h | 22 +++++++++++++++-------
 sound/soc/qcom/qdsp6/q6apm.c      |  8 +++++++-
 sound/soc/qcom/qdsp6/q6apm.h      |  2 +-
 sound/soc/qcom/qdsp6/q6prm.c      |  2 ++
 5 files changed, 34 insertions(+), 12 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index e6e9eb2e85aa..f7ae6d0db7e7 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -579,10 +579,10 @@ EXPORT_SYMBOL_GPL(audioreach_alloc_graph_pkt);
 int audioreach_send_cmd_sync(struct device *dev, gpr_device_t *gdev,
 			     struct gpr_ibasic_rsp_result_t *result, struct mutex *cmd_lock,
 			     gpr_port_t *port, wait_queue_head_t *cmd_wait,
-			     const struct gpr_pkt *pkt, uint32_t rsp_opcode)
+			     struct gpr_pkt *pkt, uint32_t rsp_opcode)
 {
 
-	const struct gpr_hdr *hdr = &pkt->hdr;
+	struct gpr_hdr *hdr = &pkt->hdr;
 	int rc;
 
 	mutex_lock(cmd_lock);
@@ -622,10 +622,12 @@ int audioreach_send_cmd_sync(struct device *dev, gpr_device_t *gdev,
 }
 EXPORT_SYMBOL_GPL(audioreach_send_cmd_sync);
 
-int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph, const struct gpr_pkt *pkt,
+int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph, struct gpr_pkt *pkt,
 				   uint32_t rsp_opcode)
 {
 
+	pkt->hdr.dest_domain = audioreach_gpr_dest_domain(graph->apm->gdev);
+
 	return audioreach_send_cmd_sync(graph->dev, NULL,  &graph->result, &graph->lock,
 					graph->port, &graph->cmd_wait, pkt, rsp_opcode);
 }
@@ -970,6 +972,8 @@ int audioreach_compr_set_param(struct q6apm_graph *graph,
 	if (rc)
 		return rc;
 
+	pkt->hdr.dest_domain = audioreach_gpr_dest_domain(graph->apm->gdev);
+
 	return gpr_send_port_pkt(graph->port, pkt);
 }
 EXPORT_SYMBOL_GPL(audioreach_compr_set_param);
@@ -1489,6 +1493,8 @@ int audioreach_shared_memory_send_eos(struct q6apm_graph *graph)
 
 	eos->policy = WR_SH_MEM_EP_EOS_POLICY_LAST;
 
+	pkt->hdr.dest_domain = audioreach_gpr_dest_domain(graph->apm->gdev);
+
 	return gpr_send_port_pkt(graph->port, pkt);
 }
 EXPORT_SYMBOL_GPL(audioreach_shared_memory_send_eos);
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 62a2fd79bbcb..2ae7b402a137 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -912,14 +912,19 @@ struct audioreach_module_config {
 };
 
 /* Packet Allocation routines */
-void *audioreach_alloc_apm_cmd_pkt(int pkt_size, uint32_t opcode, uint32_t
-				    token);
+static inline u16 audioreach_gpr_dest_domain(gpr_device_t *gdev)
+{
+	return gdev && gdev->domain_id ? gdev->domain_id : GPR_DOMAIN_ID_ADSP;
+}
+
+void *audioreach_alloc_apm_cmd_pkt(int pkt_size, uint32_t opcode,
+				   uint32_t token);
 void audioreach_set_default_channel_mapping(u8 *ch_map, int num_channels);
 void *audioreach_alloc_cmd_pkt(int payload_size, uint32_t opcode,
 			       uint32_t token, uint32_t src_port,
 			       uint32_t dest_port);
 void *audioreach_alloc_apm_pkt(int pkt_size, uint32_t opcode, uint32_t token,
-				uint32_t src_port);
+			       uint32_t src_port);
 void *audioreach_alloc_pkt(int payload_size, uint32_t opcode,
 			   uint32_t token, uint32_t src_port,
 			   uint32_t dest_port);
@@ -930,10 +935,13 @@ int audioreach_tplg_init(struct snd_soc_component *component);
 
 /* Module specific */
 void audioreach_graph_free_buf(struct q6apm_graph *graph);
-int audioreach_send_cmd_sync(struct device *dev, gpr_device_t *gdev, struct gpr_ibasic_rsp_result_t *result,
-			     struct mutex *cmd_lock, gpr_port_t *port, wait_queue_head_t *cmd_wait,
-			     const struct gpr_pkt *pkt, uint32_t rsp_opcode);
-int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph, const struct gpr_pkt *pkt,
+int audioreach_send_cmd_sync(struct device *dev, gpr_device_t *gdev,
+			     struct gpr_ibasic_rsp_result_t *result,
+			     struct mutex *cmd_lock, gpr_port_t *port,
+			     wait_queue_head_t *cmd_wait,
+			     struct gpr_pkt *pkt, uint32_t rsp_opcode);
+int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph,
+				   struct gpr_pkt *pkt,
 				   uint32_t rsp_opcode);
 int audioreach_set_media_format(struct q6apm_graph *graph,
 				const struct audioreach_module *module,
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 641d6d243229..e5563014fa5b 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -29,11 +29,13 @@ struct apm_graph_mgmt_cmd {
 
 static struct q6apm *g_apm;
 
-int q6apm_send_cmd_sync(struct q6apm *apm, const struct gpr_pkt *pkt,
+int q6apm_send_cmd_sync(struct q6apm *apm, struct gpr_pkt *pkt,
 			uint32_t rsp_opcode)
 {
 	gpr_device_t *gdev = apm->gdev;
 
+	pkt->hdr.dest_domain = audioreach_gpr_dest_domain(gdev);
+
 	return audioreach_send_cmd_sync(&gdev->dev, gdev, &apm->result, &apm->lock,
 					NULL, &apm->wait, pkt, rsp_opcode);
 }
@@ -502,6 +504,8 @@ int q6apm_write_async(struct q6apm_graph *graph, uint32_t len, uint32_t msw_ts,
 
 	mutex_unlock(&graph->lock);
 
+	pkt->hdr.dest_domain = audioreach_gpr_dest_domain(graph->apm->gdev);
+
 	return gpr_send_port_pkt(graph->port, pkt);
 }
 EXPORT_SYMBOL_GPL(q6apm_write_async);
@@ -536,6 +540,8 @@ int q6apm_read(struct q6apm_graph *graph)
 
 	mutex_unlock(&graph->lock);
 
+	pkt->hdr.dest_domain = audioreach_gpr_dest_domain(graph->apm->gdev);
+
 	return gpr_send_port_pkt(graph->port, pkt);
 }
 EXPORT_SYMBOL_GPL(q6apm_read);
diff --git a/sound/soc/qcom/qdsp6/q6apm.h b/sound/soc/qcom/qdsp6/q6apm.h
index 5cb51ca491dc..9092359ccf90 100644
--- a/sound/soc/qcom/qdsp6/q6apm.h
+++ b/sound/soc/qcom/qdsp6/q6apm.h
@@ -147,7 +147,7 @@ int q6apm_alloc_fragments(struct q6apm_graph *graph,
 int q6apm_free_fragments(struct q6apm_graph *graph, unsigned int dir);
 int q6apm_unmap_memory_fixed_region(struct device *dev, unsigned int graph_id);
 /* Helpers */
-int q6apm_send_cmd_sync(struct q6apm *apm, const struct gpr_pkt *pkt,
+int q6apm_send_cmd_sync(struct q6apm *apm, struct gpr_pkt *pkt,
 			uint32_t rsp_opcode);
 
 /* Callback for graph specific */
diff --git a/sound/soc/qcom/qdsp6/q6prm.c b/sound/soc/qcom/qdsp6/q6prm.c
index 04892fb4423f..f93383078eb1 100644
--- a/sound/soc/qcom/qdsp6/q6prm.c
+++ b/sound/soc/qcom/qdsp6/q6prm.c
@@ -51,6 +51,8 @@ struct prm_cmd_release_rsc {
 
 static int q6prm_send_cmd_sync(struct q6prm *prm, struct gpr_pkt *pkt, uint32_t rsp_opcode)
 {
+	pkt->hdr.dest_domain = audioreach_gpr_dest_domain(prm->gdev);
+
 	return audioreach_send_cmd_sync(prm->dev, prm->gdev, &prm->result, &prm->lock,
 					NULL, &prm->wait, pkt, rsp_opcode);
 }

-- 
2.34.1

