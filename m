Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC04278753
	for <linux-sound@vger.kernel.org>; Sun, 30 Nov 2025 09:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764495642; cv=none; b=I7dXL4DbnfbmYSP7SQFjup1PKiGtAmVf3N99rRsKZjnQA/K5wWCeSFXaEtUIdmhFpBglmdHYaOYMpbko2oqWQsRW5Bz1QNpGlrPNrj4RwR/fDda+SIYno2veJup66RWUC9Fam7eCJz/7KDkIGkTN9SlRZrErCIaNxqb9dLlnuKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764495642; c=relaxed/simple;
	bh=eEqg1+phgs6U320TCn+tVWykDOf0OmnD31WG+5KyRno=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YdNeN6jehyRoaFJhv1b1QXIxInfqJRt3HzDts3RDJeP0x7aPH2dZxyvJTieaFcRikr3A4GlSjJzs+qlUCoaRZkHzUmTl8hDtUv+aSk9zw3Ot9b/bzGzZi2ino4KX5EHhBiu5MG7LMluxyNk5/+LzkZo0fYoWDXDL41qZ8nuSAqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KLTWlXug; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oj0oqSCI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KLTWlXug";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oj0oqSCI"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AU5sn7Z1049490
	for <linux-sound@vger.kernel.org>; Sun, 30 Nov 2025 09:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4si5Ku7ae0XI6lLJKtqn54PXf6TC2YJqxM/TDKjqfMk=; b=KLTWlXug2c+JRdVJ
	EVrxEAlQO9wPl30LMupwan8IxGoqYx+LwaI6i9jV71QZz54+q+mjRJfIirD3OGQq
	h9I8+3FKlWjHPI5aPqIXDWz9hRpUo4WB5UpO4mgZL4EIfs56VNVMXa6iBW+ioxQu
	UA36LN2QNyRsP0aNgQKLB7zvrcd3SQKGNxTr22VoKf0V7/B8pARAPVTg9GXmeeM3
	Lx8Mx+ObYdbrfqlqgq5ZUyzFhPhCBSY9Q6Lou/4pjw44L6otcX9yJiJCeCCBnRwp
	a2GCNLLpCi4CF2MhVvmI0P/uaXRGCejD/4K6RI2mktxbuVCqwHUqM5eVt+NoDsUz
	vC0haQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqp6pj7r5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 30 Nov 2025 09:40:39 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8823c1345c0so32511766d6.2
        for <linux-sound@vger.kernel.org>; Sun, 30 Nov 2025 01:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764495639; x=1765100439; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4si5Ku7ae0XI6lLJKtqn54PXf6TC2YJqxM/TDKjqfMk=;
        b=Oj0oqSCIZbmscV2qmICtOzH0S78UHUM3nPj9Y0KrhluAbMcqbFRhG7RhJ2q+LDhzLZ
         8B8BYY582R3C8GViLgCqEcPQxgy8hSFyYd3Nc7z0wNoUG35i0ftH0NBx3zFEMq9Wx2W2
         lxjzfM/OV9gWmSJh2TN8l8xoF40jrMuo3Skq3AeFUwCN2HeIGpdTruny44wQEcFtaGtP
         6tr6YrTxGGY201UnTb1Y+/SrXOkfl0HaSDy6wardUs49jfCW9Xx/Lt7z0cpo2+DjDJyT
         eXYT2PteHLuX1S9rX4f2dXdAiNbuRTsXRzzFzHjVh9ZExmqWhDsyzA1ItRWWkRNX4OIz
         BHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764495639; x=1765100439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4si5Ku7ae0XI6lLJKtqn54PXf6TC2YJqxM/TDKjqfMk=;
        b=FflVwWbdCc7AbUUbBZse5SXwfpyXGZT4Dw0ehDIxgqSIdE7RU/si6NOT4p/5YMwh4E
         4S6xpgK62nBxcWsnOk9L+mkTXNFlNoqZEeZc8dCFOSPrzqwFzT6J90vvvLsYY9DwIbJ5
         8yEpWfUtl3ifiC5DJRK2g+8u2T03nMW7P9KbHLbR4W4TMuDcRP+6xvrNbz2gbi9rCttS
         0KVbYLWqSKhEbumOi9LgibNWCD6fu4Rgip0HN8CLsdu07ZxUfYbX6qXhYXwfHojqsi9a
         Pi0Fg92PdW2Ymc2EMSmltN9nvmKiqDhmKYWw6EEzO/eO7JrOa+JgPNjobnv2YQlB1Mh5
         IM4g==
X-Forwarded-Encrypted: i=1; AJvYcCVrZW+o9yShtz2IDQBNcmr8GR0LUudF3WkjSZ0deHJUwRyTcn++zKTuDn+IzdO0Knbv+uaU2S4GbnI8EA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk69HDACb4GLKyPYoDfxpf7lZ11uwzvB2vJ8LOrooFaRotwkPC
	ggbox5DMaoih6KxDQWiYPZWwRgrS/9OalAlX1AvMVy7SrDYpCoE2sRSLzr9G5edm9GzhKDtIJ9o
	0W1Xf3839NDVUQqvVn5Z71Zuudd7XYgblDDZeDBb48CBVriHWaxkh+Z6ZExrbnvsctwNz/h6fVg
	==
X-Gm-Gg: ASbGncsfDI7pbiBDC4xlb3ut9KM3RJ/voEDG9nBkoSzTL61WiZGO/WqKfGyqPPgZUrq
	IajZyeu9BFDrvp1vDefH83KyVbFgnWUtRGjpGyi5WhuRlSoZ1GXVB20HrgSg4PUuLKp/uZWO032
	z0BOI70YCsjhf0lC3Z1nRfNTR4zJi3BcJ03Sp1F5L3Kkz4B8mCidm8YfjRh5/cOm65CTMFhpH0u
	PZ9gndgCoQqkd8Sczrynle4GdW4Pzi9dW5RPHYZN9FRsD2+XgmhpsX4B9qmkRuWoRGDnR5L34u8
	JWjyhE42DBtHGEoRfZDFU2prHH7H9cqHNxQJJwnT8Uo2HaphRDQf9Pfrp1QoLdYX+mUdkuGFvvL
	Q4xtMT8tfLWTf3H0hKksoUbXb7Bntx/C85w==
X-Received: by 2002:a05:622a:610:b0:4ec:f2a4:f27e with SMTP id d75a77b69052e-4efbda904c1mr243299191cf.51.1764495638604;
        Sun, 30 Nov 2025 01:40:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF60NCtETdQgE0nRxSw0dPRUhYK1ejtqPUVSei/Aay4OgrxJwZwbEMFuPpbrZl9i5dHEvsHIg==
X-Received: by 2002:a05:622a:610:b0:4ec:f2a4:f27e with SMTP id d75a77b69052e-4efbda904c1mr243299011cf.51.1764495638158;
        Sun, 30 Nov 2025 01:40:38 -0800 (PST)
Received: from [127.0.1.1] ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5a4b762sm906138566b.67.2025.11.30.01.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 01:40:37 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 30 Nov 2025 10:40:25 +0100
Subject: [PATCH 3/4] ASoC: qcom: Constify GPR callback response data
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251130-asoc-apr-const-v1-3-d0833f3ed423@oss.qualcomm.com>
References: <20251130-asoc-apr-const-v1-0-d0833f3ed423@oss.qualcomm.com>
In-Reply-To: <20251130-asoc-apr-const-v1-0-d0833f3ed423@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3288;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=eEqg1+phgs6U320TCn+tVWykDOf0OmnD31WG+5KyRno=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpLBEOqv+D1KBbZU47aPwxQ88RXdrj7WGPpsuZP
 YCX1fpQEBSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSwRDgAKCRDBN2bmhouD
 10s6D/9Xwyj6W0kNcdxFFVcPlPdWVGjn1omwqAzMpUO5Zn46FsvmGSDcuZVp5slBQxLLMYLHhUG
 /vxGr5nCQCLDtdVSKTa8BI5fq6/3An4QgaWqSBGe63QMqRlMeOfZQ6t2YltbtDt2jLX7GtRQYJ0
 q3e8CudSKiAcGBR9+nyW1EMDPeIYuCcOPtLdG8AnWTuySvuKcDPHw0DeJsf1ZwLnczY9w+ejV1k
 jwRQUaYPnhkA0HzQFGObEXZQIbrYvfH2/WDb2cB2agk65sB/g0RvABy0DlwclnsXVmVulzN4Awp
 HPbE9FjEnmNoJxS1+lyUi8VSLlTKBbUmfpNzpU1UhBEHh3ep8caTUJQWY8VHk5ejRwaBT3o/L7y
 g6yGA28lLVzJ3dqWiZMaBrxwXgD5M5+TuhROErxX4m3TBC64t6hHNgMCP4hRjIuF0hZqkaZWrAJ
 YVhTzr3mKg/273pGyrYaE3JIURg0rSXNMcN0NWq3BAttRhg4lXPVDZvxsKtcky1enDhdhar574X
 8uVwmEoyyQ0StMhtdDATyTDuiL+hDkQYrgu9ll/Z/RLBOrW8N7cHTdMGPbEIRF5+QF+TB6siiHd
 LiAZ5XI+sS/R1Gfe4nM/Bb+F6ltC+5geYKwflZTOliRn+Y5SPrPNrtpK8GlWCklNHp/Tz5KlDH9
 k7tqUQRxwomozFg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: nwHbI-RDBSNbdOoZZC3VFnLYs-lsXSVy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTMwMDA4MSBTYWx0ZWRfX/DAjBDZHxbjD
 PaTtknkhxP3PoNnJAv7FBeic4Idh1pAta+nr27G1T293XOgNA7UcXifYlmIpzhR5n2Jy7Cmy1+D
 TFyZ9njBpbrkKrE4D4CCxIRXkXp/Af9PEqpfIA4nsodfYtMaguJGm4K8tgA+aBvP7s/Oq6lkqvM
 CCVw2U3PpaTnb2k38CknaVN/uoJz3kRKM7jKUrgGbnx8feazEB1bqKFHscsNCTvDjJDnk97fZ/F
 NTfQMTA+iD7cYlvdMJ4+jHNH0fKFVHZakZr7rC7s/FhY5FJzKbXf5qswVQEzzg5lMnFxpTALIUm
 aMVpjI22HaPh3i/2K3MjVj77Iif+StGqWXBkk4etB2OgUjcSDLZP2yPf9fzBx5fpOnmnPSVjggS
 I6aAuO2n5KQhkrLmx4e3jGZnS09SPA==
X-Proofpoint-GUID: nwHbI-RDBSNbdOoZZC3VFnLYs-lsXSVy
X-Authority-Analysis: v=2.4 cv=KIpXzVFo c=1 sm=1 tr=0 ts=692c1117 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=hTGvNw3IVCQ4KxXpkFYA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0 suspectscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511300081

GPR bus driver calls each GPR client callback with pointer to the GPR
response packet.  The callbacks are not suppose to modify that response
packet, so make it a pointer to const to document that expectation
explicitly.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 include/linux/soc/qcom/apr.h | 2 +-
 sound/soc/qcom/qdsp6/q6apm.c | 8 ++++----
 sound/soc/qcom/qdsp6/q6prm.c | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/soc/qcom/apr.h b/include/linux/soc/qcom/apr.h
index b16530f319ad..6e1b1202e818 100644
--- a/include/linux/soc/qcom/apr.h
+++ b/include/linux/soc/qcom/apr.h
@@ -122,7 +122,7 @@ struct gpr_ibasic_rsp_accepted_t {
 #define APR_SVC_MAJOR_VERSION(v)	((v >> 16) & 0xFF)
 #define APR_SVC_MINOR_VERSION(v)	(v & 0xFF)
 
-typedef int (*gpr_port_cb) (struct gpr_resp_pkt *d, void *priv, int op);
+typedef int (*gpr_port_cb) (const struct gpr_resp_pkt *d, void *priv, int op);
 struct packet_router;
 struct pkt_router_svc {
 	struct device *dev;
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 94cc6376a367..cec135c53b99 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -487,14 +487,14 @@ int q6apm_get_hw_pointer(struct q6apm_graph *graph, int dir)
 }
 EXPORT_SYMBOL_GPL(q6apm_get_hw_pointer);
 
-static int graph_callback(struct gpr_resp_pkt *data, void *priv, int op)
+static int graph_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 {
 	struct data_cmd_rsp_rd_sh_mem_ep_data_buffer_done_v2 *rd_done;
 	struct data_cmd_rsp_wr_sh_mem_ep_data_buffer_done_v2 *done;
 	struct apm_cmd_rsp_shared_mem_map_regions *rsp;
 	struct gpr_ibasic_rsp_result_t *result;
 	struct q6apm_graph *graph = priv;
-	struct gpr_hdr *hdr = &data->hdr;
+	const struct gpr_hdr *hdr = &data->hdr;
 	struct device *dev = graph->dev;
 	uint32_t client_event;
 	phys_addr_t phys;
@@ -761,13 +761,13 @@ struct audioreach_module *q6apm_find_module_by_mid(struct q6apm_graph *graph, ui
 
 }
 
-static int apm_callback(struct gpr_resp_pkt *data, void *priv, int op)
+static int apm_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 {
 	gpr_device_t *gdev = priv;
 	struct q6apm *apm = dev_get_drvdata(&gdev->dev);
 	struct device *dev = &gdev->dev;
 	struct gpr_ibasic_rsp_result_t *result;
-	struct gpr_hdr *hdr = &data->hdr;
+	const struct gpr_hdr *hdr = &data->hdr;
 
 	result = data->payload;
 
diff --git a/sound/soc/qcom/qdsp6/q6prm.c b/sound/soc/qcom/qdsp6/q6prm.c
index 0b8fad0bc832..eaec6d211cf8 100644
--- a/sound/soc/qcom/qdsp6/q6prm.c
+++ b/sound/soc/qcom/qdsp6/q6prm.c
@@ -175,12 +175,12 @@ int q6prm_set_lpass_clock(struct device *dev, int clk_id, int clk_attr, int clk_
 }
 EXPORT_SYMBOL_GPL(q6prm_set_lpass_clock);
 
-static int prm_callback(struct gpr_resp_pkt *data, void *priv, int op)
+static int prm_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 {
 	gpr_device_t *gdev = priv;
 	struct q6prm *prm = dev_get_drvdata(&gdev->dev);
 	struct gpr_ibasic_rsp_result_t *result;
-	struct gpr_hdr *hdr = &data->hdr;
+	const struct gpr_hdr *hdr = &data->hdr;
 
 	switch (hdr->opcode) {
 	case PRM_CMD_RSP_REQUEST_HW_RSC:

-- 
2.48.1

