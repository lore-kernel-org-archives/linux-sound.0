Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B578C50B42E
	for <linux-sound@vger.kernel.org>; Mon, 21 Sep 2026 19:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790017725; cv=none; b=AU4YbJ4yraK72EwDN33+SKckDiUg6/LxBVPx+n2XYB92n2QIQ8xz5/L2x+MLPY1p93lMxCFKtZUMCAIQwqnzqiIOsk405c2HYAE9jpzCjy2MiyoMHOMVzEfcuXGB0pf+XZZceX7gxb9/23j53r02kYc1+L6Xe4Ys0lw6OXQ7oOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790017725; c=relaxed/simple;
	bh=R6WhnRn3OYIVaQbRG/LcPLmBEV8zvrqFCWDo5EgDbKo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hgrzgSaw/jsGBSpdjBSA8sJ3e6mql6CU0CNUnrThfZGlD0DtYw6AkeXg1OuTfsu4pfpPTAGQbndSLgUE+q+PZFqjMqxQEL1hFYMrhLBdHs6enGJQ+7j7Kpr5DkRnCtXs2lhwm4Sm5fChDxpd3T5os1n8K/6ac9hXcpwNp6Ykwqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HbktcvE2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gHqZKb+A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HbktcvE2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gHqZKb+A"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LFApqw884990
	for <linux-sound@vger.kernel.org>; Mon, 21 Sep 2026 19:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	362TzmWCoKZ0VSlCRZr3hytW7UtSJaVQd8dVIrPrWIk=; b=HbktcvE2fHAPjFwp
	nVUbz5k8+jIXAewsojT+7BW4+AcMFvjuSWwsgyLG9+7M7zh4ScYnV3O3dtKWA8VV
	pkBo/X/pn1PJuSiqf5wQHGzndmmNPu3CqlY62eFVC1vT7EBDFpR17Zwyg6IEO9Sd
	x86VjYoJ1LvIYhCTM6H0nA4e+RLlANs0J6/TCq8jk7xgaGCXSJE/jY6iZ7+Fl2Fd
	5uxxh3DFvoII0Dk/qBTyos1tRx1tdXG4+u4Y+Jz3dxmwv1WL6ygz88U39yaVeWIA
	CMNUOMp8ARYci2/Eg8qvwsonQjdJRwDdZU3bj45v1o+CoUN9/3BrNTIlyoChbEhz
	cPo7QQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu0rj2rjg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 21 Sep 2026 19:08:42 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2dd667770efso1984655ad.0
        for <linux-sound@vger.kernel.org>; Mon, 21 Sep 2026 12:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790017722; x=1790622522; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=362TzmWCoKZ0VSlCRZr3hytW7UtSJaVQd8dVIrPrWIk=;
        b=gHqZKb+AvlZuGvGAF2rKw/oStUld0XM1wMxaiKt+SEJI6uGwSHAGUb40JyFsDxOgW+
         xvnCy6VH31kWVAoNjSR/X/TAL8EDSGoqHAeTsLYh2GZvwv+vv5tIKkTXECfdmLnimN09
         o1L0Ox9XHvVgrLs1knl/Ai4HFyoUcCtetfja/fg3Jfw6RFMA9woH2U3g9KRIRGNQUI46
         eDvjNOYCU5EhtehbK4o4MAywI65YrSpnAajLmUwk19RyQy+cFi0jDARMlcb9szHe0bcU
         GCtTsoXkBw2ZyQpkb7wTMOdh0TIfB20CQM3eBm4QLP7cP21XCRJuORUItu/oEQbt/M5n
         k9XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790017722; x=1790622522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=362TzmWCoKZ0VSlCRZr3hytW7UtSJaVQd8dVIrPrWIk=;
        b=idHxl6tsggwDh5tq4AMlfGBYdOgQa/JwOWkfMw/q37LN2zHZjl9JxHuxfQfjnMJu/x
         mqMkGvzPwi/p0mzNC7eQpQUFjJyv8zbJcMY5lkGYiaUeqPugF90MtVBOX/toR0ZiFXUP
         invrTNqbSI6JV+ewMPvHnNGbjLG+9ITnw9CloF1EYW659F8SK9C0EFe2VHqpAxxL6YyS
         D06YJ79WTjUig/VjLdnjnTOAedVV9+b2Wq13l0x7xd24nX8gf9A6LGPAhZQyux+YR/U8
         h4QUElovHFnIuIwX1Awk3i2lq/JjPt8Izvx6NYABaOkfOr5oZij04ekq7qW+zriusDoT
         bB8A==
X-Forwarded-Encrypted: i=1; AKwUvByUQ8ontgE2AkXn9Z6RRLGq0QkBjEngH7JM3brk6XXfuSN0JUhbhoTHbtYB+axt0xQCRDLU2FKyAtHCnw==@vger.kernel.org
X-Gm-Message-State: AFuF++maopdAzmbORFguCvtOwjJwhkwdiA+8kjKHjCS9Hj4pcV8j9OMv
	ZEN2MG1wAmf3DSFby3yTdnibvSPV2vGZZ3DhAMdJ+nEiDHEsro3I1V/h04iQiKl2z1f8bliV5Dv
	nWZ+io+hgirVA39HEQOtlSyHaHTF4l5gZPvofPY5lUE8hg3BwAT/iCtaSYjOlYWruag==
X-Gm-Gg: AYBFou3S3Ab5sr49mGee5ZgFwtv45uILIhh9rMPLTIaiYgEeAraYcnpgTbIVzoNPOu+
	8gsiI8FOFaqquoyBZsa4KdR67c+2tVU84S4sbvXJq0baZEPMbZ0stiU0qg4xwM1SjVX/HQyOFKn
	EpsHT4oQansarghxl1hNKCteJb6m3SvizBta0Tj18gqB2zjji4EEph0Oi0gm40qw5etrSIodHJZ
	mobK1cSm25Lsb3h90+XKQt8FPzezdjuzEvI8s4LpNzHSYlghvchAXp7F60vELd3pZcCl48E1MAo
	QGALc0/v6CulK/UYxeHNDYHuxqfS6ECLHNbsQ332HN+QLTv+gYK3ZtHCSG7aOdSr3BH4v6k5P5t
	tXJghTigf5xKtFSeG5HkuZJ+j4arV
X-Received: by 2002:a17:902:f68a:b0:2dd:4438:4290 with SMTP id d9443c01a7336-2df5968c9aemr4408255ad.3.1790017721509;
        Mon, 21 Sep 2026 12:08:41 -0700 (PDT)
X-Received: by 2002:a17:902:f68a:b0:2dd:4438:4290 with SMTP id d9443c01a7336-2df5968c9aemr4407895ad.3.1790017720832;
        Mon, 21 Sep 2026 12:08:40 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e5ec6ea45sm25855eec.30.2026.09.21.12.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 12:08:40 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 00:38:10 +0530
Subject: [PATCH v5 2/4] ASoC: qcom: qdsp6: generalize GPR service domain
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-vmid-v4-v5-2-e79cfd7af5b3@oss.qualcomm.com>
References: <20260922-vmid-v4-v5-0-e79cfd7af5b3@oss.qualcomm.com>
In-Reply-To: <20260922-vmid-v4-v5-0-e79cfd7af5b3@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ajay.nandam@oss.qualcomm.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Pratyush Meduri <mpratyus@qti.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI3OSBTYWx0ZWRfX0Ltnio1R+nie
 jaUf5AaPleu0MZVdFVn8xzQgUewmE6STi0rAGdMoTxQxqhjvn2eFsMfW8tDuWCyO2wm1wVnw6hM
 3M/WMwp1Kx4N5ruvicsJ1aeCgzN4BaE=
X-Authority-Analysis: v=2.4 cv=AsR7T+9P c=1 sm=1 tr=0 ts=6ab180ba cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=06UwNDcAWG1pVACfRQkA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: nHvpvPLoD-BMoSTgly8lpElCdReGIGvA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI3OSBTYWx0ZWRfX48ejaPgcVtNP
 4SqCwKL72uJ1ymFScDnf0QzkJUxxaDx+mfbi2qLK6maHVUyBxYtenc3yEQbaTKXlLSgJ5fsYYwe
 JMkb+Yi6p52b0DF/8Zaw+ul/t76KudDCKZzQN3oZWRM7DZPf+xTCo0Yr1T3nAtE7Bo0A1x4/sSi
 OOLJaQxc3IHVPEY4J7QhD+XKOgveBJdKbiddPXHMVJN3hVBrJN2ej69KSaYySFpuTkz8q8vRZzv
 VTNx3zKzw24s0MmAgzPVh7XnQAtXT1O7M7wY7t9otZjbNbSqr7ivDD+y5VkRPAgoieXSQ5NfZ/c
 PlEaENkX1Q+ZDxMAzLfAXfyxxcJO+n8E18HdNJAKJMF5IUEzUutxYwakWu41x7AOUrdwENBChNL
 Fcg26KAiFMIh4r92JbCToa2TYCxsesi5m9mRclxAOIYdbTs8CGPskW9gg2Jus+kB/pSUwZpLGUy
 k0D8X7TTf07mWeGxqNw==
X-Proofpoint-ORIG-GUID: nHvpvPLoD-BMoSTgly8lpElCdReGIGvA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210279

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
index 12c6dfe4c58e..1845eb7b5739 100644
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

