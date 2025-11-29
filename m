Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A99F30F944
	for <linux-sound@vger.kernel.org>; Sat, 29 Nov 2025 13:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764422298; cv=none; b=h/QTUKgRtxprE0Qm2UueJej9iN6izc2+Jc612EbRlx96t5UIq+VBPLHJIHfZxcvAi9dokyQ64pVkgPFqfjif8FkYdIrV0VXX7NdEidwm+vIXzyuwJMKdfiyhy/Gbleu9YKkVD1c1k2+LGKNhUK64I54sRKfrEZgV7PdVb/dCUwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764422298; c=relaxed/simple;
	bh=lEl5AfceBGZX+HxER57Uao6Udayu95QrQVSkcBG5i/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cBYoCBEB00FXu9giTq7QwjKzuLneYEXSyW1Ch3FN2iVqh2xfd8nn3mw5MVhlFIr77Q9yoWX/QpPqZPr13imIMwODBOXtFblHB6qdkIkp2r6IHJ0MjpR69KqeQpzBviL7kp1Ar+miWfxPScZ45PDqjNWp0BokH8nKMdanFMnrbZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aednJi4g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VTKLaMAn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aednJi4g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VTKLaMAn"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AT7jtd42303923
	for <linux-sound@vger.kernel.org>; Sat, 29 Nov 2025 13:18:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YmoBoyPDVfYZ6/7/pVrq1G/5Jf2az1Lc/3dLpCPK8mg=; b=aednJi4gxhF1Opti
	oYz8rsrW+OCNKbF6XC1RseZoZSHRHM6XrsxFHJxIym7QXBkpTXDmYDxZ4pI3yeeE
	Yr0bft1e1wTVPOo8Ahkz4lxqN4TX86F1befICXtMqOC10WvYGWv5Xu4WIJbGVad9
	IkqFLljAMp6W2iUdp6/Op7DpG9aLJsl0h9XagefUrXS8yipcSIc5cdKV/eOTO6vD
	9gt3AVr3JQwu6klk7KnG2XTJCx1ShHormqQXyR/LwxH2l1MMoU5UlE3Are4avGTN
	MBl6Z+k6xdZ8UDH2GiunjiIG3HPr+bw9MoaJ9gEn/llCK0YPnyE+rLnONplZcpKE
	QEK/sg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqqsqgtea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sat, 29 Nov 2025 13:18:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b22d590227so279564485a.1
        for <linux-sound@vger.kernel.org>; Sat, 29 Nov 2025 05:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764422295; x=1765027095; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YmoBoyPDVfYZ6/7/pVrq1G/5Jf2az1Lc/3dLpCPK8mg=;
        b=VTKLaMAnNcEiOKLSTaWILnnRS5ipLYUZ3iBqIaavu0C1x1KZA4UcGQs9aNTanZ31e/
         elfYKybQ9nAT5hM6rqTueQ1J+cKepg098b378+xf4GoOWa15Zq7fAXWn6/hXoZoVwDQG
         WVG57bK1yysh4cLlMXJmA/hQKktHO8mILDnYK761++OVfr1C0iVCAu9NZIrhqa9RCTId
         kOeaK+KmixJ/d46rf91qACXNz+KeP7TWYTKAK94izYnvKhjzwNwTIvCDBWmrsiRs3xb6
         iL/vvp+oPT7kGBh6F9wUfAJ9JftP67s6EoTF7DljLWE+a0aFk7nZvEy3hW46ksVois0b
         6a2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764422295; x=1765027095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YmoBoyPDVfYZ6/7/pVrq1G/5Jf2az1Lc/3dLpCPK8mg=;
        b=qqz1cVziGxQjii/ZseknhxhL1Au21Kqtth/ijPPEKdezeLw/58g0PyVzMRY8OEpUgu
         Ue7U7Xqlu2B9sulyMofl9bUVG1NBGjgzMZFU7/u4pHmbnvCSifPZJIBP8SRI+ss6PIvt
         J4HXrF50KO5exlLwwAPn1aw735n/ohKWp+z6K/MkAieAMoj8ghnz6E8EuNoCEAhJMxSH
         CpeYOpq1PAN9e67UVtAd0FpxLjatc2lDgPKldAHRfncoHslfF/cgdd5K1R1h4zQ3LodK
         8gkDU03Z0YqC+X02zlBMSIKlCmpNRzuUYdbiWzVVuV75GrqI84kp/8aueBZS9EmKHvo8
         G85A==
X-Gm-Message-State: AOJu0YyiGSedJyuzQqEAF2mhAnV5wbPCZ5rzhDdpOj1WHrsNM44B0EVj
	OVk0XiC1Y6YdB8Ci50uUZewH9crqDtGOunF/FLee/sBhBQCx/VcYd03sfrHhItqx0QHr47d/5Gz
	ZWUohIMTCwrRzPjE/iSpGhYrS0Yh8Wih8Vtd+qhXB5g2LDliEi62LGnzyYI0yJsYpRQ==
X-Gm-Gg: ASbGncuKWgzqg2oGlI3AnWQx90FspWA2DFvqj7B3sxHjUToU62WpEpT4ean2xWXrZU1
	WaZmO6XYDhYNWcP503Tbg97LKyIMYgPF+slA8+/tn3pdwyXjMdPhvkN9grqK7M1FNcgc5q1leXL
	rwPaSZXeN9ECD6rIL/UzQ+UZRTguymnQU4dZQzMvTKiKgh6PAZbtgU7emPoIZ3NtBiV964MPsVX
	XlrjIoPzrHCfQIHx8H21DNV7pJTCiRbSuKC7EwvptodzDpDvxZlsS94q8aANnszCElrHbjK26Hi
	OGuOE8vy/pi8aHw03G+0QjMgcC87JXpTN0nbnZWg5VS3YR0rr83W0Ee7UWFwTImbd4h3/ADZb2E
	6G4ZUskrpnBK5ITOw5lVApZCJfUNJufwDUw==
X-Received: by 2002:a05:620a:f13:b0:890:2e24:a543 with SMTP id af79cd13be357-8b4ebd5222amr2597672585a.34.1764422294686;
        Sat, 29 Nov 2025 05:18:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHwB2ZsqjrZ1cg/dSMojh3TNaKk7rHGvIc2Ok6VnMYy75j6yUens7DnZyaeusqapfrrEtEXpg==
X-Received: by 2002:a05:620a:f13:b0:890:2e24:a543 with SMTP id af79cd13be357-8b4ebd5222amr2597667685a.34.1764422294171;
        Sat, 29 Nov 2025 05:18:14 -0800 (PST)
Received: from [127.0.1.1] ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5163903sm723233866b.7.2025.11.29.05.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 05:18:13 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 29 Nov 2025 14:17:58 +0100
Subject: [PATCH 6/6] ASoC: qcom: Minor readability improve with new lines
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251129-asoc-wrong-cleanup-h-can-people-stop-sending-this-without-reading-docs-v1-6-c38b06884e39@oss.qualcomm.com>
References: <20251129-asoc-wrong-cleanup-h-can-people-stop-sending-this-without-reading-docs-v1-0-c38b06884e39@oss.qualcomm.com>
In-Reply-To: <20251129-asoc-wrong-cleanup-h-can-people-stop-sending-this-without-reading-docs-v1-0-c38b06884e39@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=11019;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=lEl5AfceBGZX+HxER57Uao6Udayu95QrQVSkcBG5i/Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpKvKKZ9xsIEG5D5JNvWwceDCjBVXr5ypcnmOGY
 zldZ2wrvRCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSryigAKCRDBN2bmhouD
 19O/D/43cb2Iiw5c5+5yDUqrdsED4Ro5IfM+1bIItJtmp1lBQ4eYcAp0wD9WtLmP+ZY6Yj7qvNg
 PGYYfF7Q1xPz3J5Zp0qFMVRj8abxzinbJaG2/DBFGOXl4igFE1PVIPm0MpibJUw4lf05ExaQbWd
 BkFd56kSy6BV3aVGlkwxzQXxEhUGKhZDB9Coam8jQSNo8CSApfaZBifos/aexAyPRcVY4Y09mGg
 tOZ0gM8AHnW1RMikqERul3bk0ZqsRKkaTjr5LQbFuBvpb7OEKGUVCJoIL6CZ18uVAQuQiba2tF8
 HeD1S0+pocwckIyosYV5hvXP9qLyU6iBgQJqJnGgE+VZykFYF945SAdnVTEfu0cFPSqr/FJxvLR
 B8wpz1Nl/5LbvUIEAiYbA7zeprtNWVwy2uFi9LQPpcvDBzDjo/Oqa6iNMMHPbaNf45hRrNqk+ME
 VWXOtNZNFPzUcjaqbnh6e5MDi6nUN1kW5wQkt6ozl6HJ6W13P1XEjNFmZUkdEtfC86HDWalpkUD
 Aa7hEW90jA0jQfp5OIjseJQR9HAa96Y9WQDJJZwXcaKBEjBDZY+Lx/bDUFevZEq51NTT3srdWoj
 7O5oHPQIRy1esuc08dR4gyEL/riyhLQVBUabS8B2tXRG4qYD7I82+ljOFfH2US13CnfSS0s5GH5
 346Cf6DSinZGyhw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=UqVu9uwB c=1 sm=1 tr=0 ts=692af297 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=91d8KASzpMfN8u1-4qoA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 6QXIlbrBHne6SfZWBmblFjVt_O9ZbWIT
X-Proofpoint-GUID: 6QXIlbrBHne6SfZWBmblFjVt_O9ZbWIT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDEwNiBTYWx0ZWRfX/L7Ks+q82MYC
 rOd9/2iB5CkXnRqTJQ4GmGm/TLP7NH7+28cA+voeyB6PZ08KZXH4i+5hEuaCMiq1A43Ss4Cx24D
 pEtsLbLQpn0Vjaf0gEN6cfy8Up9IkzvMtygeX9kMCzBxrgXoCTKy7UGR3sIVkr/daG664O1Dwrs
 5F4mqyh0CFc/CwbXE/juUS7gNdKtGQ9VFA2J0qeEvvlw17vzOJrYNMi0CiMVbSYuogkPg1C7Dv3
 ojrK9Yn1CRykIAvyPAQKr12Fw3ur7VLLG3wshGQfTkYbgKfFIbk8tu183KID4jhn0RBYUKZGcSo
 lS0EfGtNwQyqHkvWEU7+CtgZ2oHc86jmEbn+A+e+JWp+iTyMxB69ZicqdB+z6B5kpbSrRASfVPy
 ff4hUJlCa5z+EY/4YZc0wX/hcYRvWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511290106

Variables with automatic cleanup are special because they do not follow
standard rules of declaration at top of function (see cleanup.h), but on
the other hand we always expect line break between top-function
declarations and first instructions.

Don't pretend automatic cleanup variables are part of top-level
declaration to improve readability when variable is followed by nun-NULL
check.  No functional impact, only style.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c |  8 +++++++-
 sound/soc/qcom/qdsp6/q6adm.c      |  2 ++
 sound/soc/qcom/qdsp6/q6afe.c      |  4 ++++
 sound/soc/qcom/qdsp6/q6apm.c      |  3 +++
 sound/soc/qcom/qdsp6/q6asm.c      | 13 +++++++++++++
 5 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 329d916779f0..f3fa0a5b4095 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -617,6 +617,7 @@ static int audioreach_display_port_set_media_format(struct q6apm_graph *graph,
 	int fs_sz = APM_FS_CFG_PSIZE;
 	int size = ic_sz + ep_sz + fs_sz;
 	void *p;
+
 	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(size, APM_CMD_SET_CFG, 0);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
@@ -675,6 +676,7 @@ static int audioreach_codec_dma_set_media_format(struct q6apm_graph *graph,
 	int pm_sz = APM_HW_EP_PMODE_CFG_PSIZE;
 	int size = ic_sz + ep_sz + fs_sz + pm_sz;
 	void *p;
+
 	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(size, APM_CMD_SET_CFG, 0);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
@@ -788,6 +790,7 @@ static int audioreach_set_module_config(struct q6apm_graph *graph,
 {
 	int size = le32_to_cpu(module->data->size);
 	void *p;
+
 	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(size, APM_CMD_SET_CFG, 0);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
@@ -810,6 +813,7 @@ static int audioreach_mfc_set_media_format(struct q6apm_graph *graph,
 				APM_MODULE_PARAM_DATA_SIZE;
 	int i;
 	void *p;
+
 	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
@@ -922,13 +926,13 @@ int audioreach_compr_set_param(struct q6apm_graph *graph, struct audioreach_modu
 	void *p;
 	int iid = q6apm_graph_get_rx_shmem_module_iid(graph);
 	int payload_size = sizeof(struct apm_sh_module_media_fmt_cmd);
+
 	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_cmd_pkt(payload_size,
 					DATA_CMD_WR_SH_MEM_EP_MEDIA_FORMAT,
 					0, graph->port->id, iid);
 	if (IS_ERR(pkt))
 		return -ENOMEM;
 
-
 	p = (void *)pkt + GPR_HDR_SIZE;
 	header = p;
 	rc = audioreach_set_compr_media_format(header, p, mcfg);
@@ -952,6 +956,7 @@ static int audioreach_i2s_set_media_format(struct q6apm_graph *graph,
 	int fs_sz = APM_FS_CFG_PSIZE;
 	int size = ic_sz + ep_sz + fs_sz;
 	void *p;
+
 	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(size, APM_CMD_SET_CFG, 0);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
@@ -1013,6 +1018,7 @@ static int audioreach_logging_set_media_format(struct q6apm_graph *graph,
 	struct data_logging_config *cfg;
 	int size = sizeof(*cfg) + APM_MODULE_PARAM_DATA_SIZE;
 	void *p;
+
 	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(size, APM_CMD_SET_CFG, 0);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
diff --git a/sound/soc/qcom/qdsp6/q6adm.c b/sound/soc/qcom/qdsp6/q6adm.c
index 0b8d06ec8b26..bbe986293ec3 100644
--- a/sound/soc/qcom/qdsp6/q6adm.c
+++ b/sound/soc/qcom/qdsp6/q6adm.c
@@ -331,6 +331,7 @@ static int q6adm_device_open(struct q6adm *adm, struct q6copp *copp,
 	int afe_port = q6afe_get_port_id(port_id);
 	struct apr_pkt *pkt;
 	int ret, pkt_size = APR_HDR_SIZE + sizeof(*open);
+
 	void *p __free(kfree) = kzalloc(pkt_size, GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
@@ -466,6 +467,7 @@ int q6adm_matrix_map(struct device *dev, int path,
 	struct q6copp *copp;
 	int pkt_size = (APR_HDR_SIZE + sizeof(*route) +  sizeof(*node) +
 		    (sizeof(uint32_t) * payload_map.num_copps));
+
 	void *matrix_map __free(kfree) = kzalloc(pkt_size, GFP_KERNEL);
 	if (!matrix_map)
 		return -ENOMEM;
diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index c9fdd53492e0..0cf6aebe498c 100644
--- a/sound/soc/qcom/qdsp6/q6afe.c
+++ b/sound/soc/qcom/qdsp6/q6afe.c
@@ -1077,6 +1077,7 @@ static int q6afe_set_param(struct q6afe *afe, struct q6afe_port *port,
 	struct apr_pkt *pkt;
 	int ret, pkt_size = APR_HDR_SIZE + sizeof(*param) + sizeof(*pdata) + psize;
 	void *pl;
+
 	void *p __free(kfree) = kzalloc(pkt_size, GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
@@ -1128,6 +1129,7 @@ static int q6afe_port_set_param_v2(struct q6afe_port *port, void *data,
 	u16 port_id = port->id;
 	int ret, pkt_size = APR_HDR_SIZE + sizeof(*param) + sizeof(*pdata) + psize;
 	void *pl;
+
 	void *p __free(kfree) = kzalloc(pkt_size, GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
@@ -1832,6 +1834,7 @@ int q6afe_unvote_lpass_core_hw(struct device *dev, uint32_t hw_block_id,
 	struct apr_pkt *pkt;
 	int ret = 0;
 	int pkt_size = APR_HDR_SIZE + sizeof(*vote_cfg);
+
 	void *p __free(kfree) = kzalloc(pkt_size, GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
@@ -1866,6 +1869,7 @@ int q6afe_vote_lpass_core_hw(struct device *dev, uint32_t hw_block_id,
 	struct apr_pkt *pkt;
 	int ret = 0;
 	int pkt_size = APR_HDR_SIZE + sizeof(*vote_cfg);
+
 	void *p __free(kfree) = kzalloc(pkt_size, GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 4e5ad04ece50..e30f8648ae15 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -100,6 +100,7 @@ static int audioreach_graph_mgmt_cmd(struct audioreach_graph *graph, uint32_t op
 	struct audioreach_sub_graph *sg;
 	struct q6apm *apm = graph->apm;
 	int i = 0, payload_size = APM_GRAPH_MGMT_PSIZE(mgmt_cmd, num_sub_graphs);
+
 	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(payload_size, opcode, 0);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
@@ -409,6 +410,7 @@ int q6apm_write_async(struct q6apm_graph *graph, uint32_t len, uint32_t msw_ts,
 	struct apm_data_cmd_wr_sh_mem_ep_data_buffer_v2 *write_buffer;
 	struct audio_buffer *ab;
 	int iid = q6apm_graph_get_rx_shmem_module_iid(graph);
+
 	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_pkt(sizeof(*write_buffer),
 					DATA_CMD_WR_SH_MEM_EP_DATA_BUFFER_V2,
 					graph->rx_data.dsp_buf | (len << APM_WRITE_TOKEN_LEN_SHIFT),
@@ -446,6 +448,7 @@ int q6apm_read(struct q6apm_graph *graph)
 	struct audioreach_graph_data *port;
 	struct audio_buffer *ab;
 	int iid = q6apm_graph_get_tx_shmem_module_iid(graph);
+
 	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_pkt(sizeof(*read_buffer),
 					DATA_CMD_RD_SH_MEM_EP_DATA_BUFFER_V2,
 					graph->tx_data.dsp_buf, graph->port->id, iid);
diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
index 890a1f786627..420176f80ffe 100644
--- a/sound/soc/qcom/qdsp6/q6asm.c
+++ b/sound/soc/qcom/qdsp6/q6asm.c
@@ -928,6 +928,7 @@ int q6asm_open_write(struct audio_client *ac, uint32_t stream_id,
 	struct asm_stream_cmd_open_write_v3 *open;
 	struct apr_pkt *pkt;
 	int rc, pkt_size = APR_HDR_SIZE + sizeof(*open);
+
 	void *p __free(kfree) = kzalloc(pkt_size, GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
@@ -1005,6 +1006,7 @@ static int __q6asm_run(struct audio_client *ac, uint32_t stream_id,
 	struct asm_session_cmd_run_v2 *run;
 	struct apr_pkt *pkt;
 	int rc, pkt_size = APR_HDR_SIZE + sizeof(*run);
+
 	void *p __free(kfree) = kzalloc(pkt_size, GFP_ATOMIC);
 	if (!p)
 		return -ENOMEM;
@@ -1087,6 +1089,7 @@ int q6asm_media_format_block_multi_ch_pcm(struct audio_client *ac,
 	struct apr_pkt *pkt;
 	u8 *channel_mapping;
 	int pkt_size = APR_HDR_SIZE + sizeof(*fmt);
+
 	void *p __free(kfree) = kzalloc(pkt_size, GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
@@ -1125,6 +1128,7 @@ int q6asm_stream_media_format_block_flac(struct audio_client *ac,
 	struct asm_flac_fmt_blk_v2 *fmt;
 	struct apr_pkt *pkt;
 	int pkt_size = APR_HDR_SIZE + sizeof(*fmt);
+
 	void *p __free(kfree) = kzalloc(pkt_size, GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
@@ -1156,6 +1160,7 @@ int q6asm_stream_media_format_block_wma_v9(struct audio_client *ac,
 	struct asm_wmastdv9_fmt_blk_v2 *fmt;
 	struct apr_pkt *pkt;
 	int pkt_size = APR_HDR_SIZE + sizeof(*fmt);
+
 	void *p __free(kfree) = kzalloc(pkt_size, GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
@@ -1188,6 +1193,7 @@ int q6asm_stream_media_format_block_wma_v10(struct audio_client *ac,
 	struct asm_wmaprov10_fmt_blk_v2 *fmt;
 	struct apr_pkt *pkt;
 	int pkt_size = APR_HDR_SIZE + sizeof(*fmt);
+
 	void *p __free(kfree) = kzalloc(pkt_size, GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
@@ -1221,6 +1227,7 @@ int q6asm_stream_media_format_block_alac(struct audio_client *ac,
 	struct asm_alac_fmt_blk_v2 *fmt;
 	struct apr_pkt *pkt;
 	int pkt_size = APR_HDR_SIZE + sizeof(*fmt);
+
 	void *p __free(kfree) = kzalloc(pkt_size, GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
@@ -1257,6 +1264,7 @@ int q6asm_stream_media_format_block_ape(struct audio_client *ac,
 	struct asm_ape_fmt_blk_v2 *fmt;
 	struct apr_pkt *pkt;
 	int pkt_size = APR_HDR_SIZE + sizeof(*fmt);
+
 	void *p __free(kfree) = kzalloc(pkt_size, GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
@@ -1291,6 +1299,7 @@ static int q6asm_stream_remove_silence(struct audio_client *ac, uint32_t stream_
 	uint32_t *samples;
 	struct apr_pkt *pkt;
 	int rc, pkt_size = APR_HDR_SIZE + sizeof(uint32_t);
+
 	void *p __free(kfree) = kzalloc(pkt_size, GFP_ATOMIC);
 	if (!p)
 		return -ENOMEM;
@@ -1349,6 +1358,7 @@ int q6asm_enc_cfg_blk_pcm_format_support(struct audio_client *ac,
 	u8 *channel_mapping;
 	u32 frames_per_buf = 0;
 	int pkt_size = APR_HDR_SIZE + sizeof(*enc_cfg);
+
 	void *p __free(kfree) = kzalloc(pkt_size, GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
@@ -1395,6 +1405,7 @@ int q6asm_read(struct audio_client *ac, uint32_t stream_id)
 	unsigned long flags;
 	int pkt_size = APR_HDR_SIZE + sizeof(*read);
 	int rc = 0;
+
 	void *p __free(kfree) = kzalloc(pkt_size, GFP_ATOMIC);
 	if (!p)
 		return -ENOMEM;
@@ -1437,6 +1448,7 @@ static int __q6asm_open_read(struct audio_client *ac, uint32_t stream_id,
 	struct asm_stream_cmd_open_read_v3 *open;
 	struct apr_pkt *pkt;
 	int pkt_size = APR_HDR_SIZE + sizeof(*open);
+
 	void *p __free(kfree) = kzalloc(pkt_size, GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
@@ -1507,6 +1519,7 @@ int q6asm_write_async(struct audio_client *ac, uint32_t stream_id, uint32_t len,
 	struct apr_pkt *pkt;
 	int pkt_size = APR_HDR_SIZE + sizeof(*write);
 	int rc = 0;
+
 	void *p __free(kfree) = kzalloc(pkt_size, GFP_ATOMIC);
 	if (!p)
 		return -ENOMEM;

-- 
2.48.1

