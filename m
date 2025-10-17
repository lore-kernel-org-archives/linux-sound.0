Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41152BF01E
	for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 08:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760691387; cv=none; b=UbSNkD03N6Zz0xRydmA7I8n8iTRjawY4UDJRHpebcVE4KfuEEQNHdiPs3m+et1nC88ZjobjAy7x9DnIgn6mhWG5K8VZwNFz/1FjT4C5n80jLxNIL2IkfrNIigLFRkKv8V7x/O7oweA0AXF8MRJVfiirF0pDwG3FQhncVBlfvpk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760691387; c=relaxed/simple;
	bh=a6vR3cZrsa8eEPprG6ADmXlyyk7ZVWqf4VY8FOiCsl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bqjzxThDMsCYnIRkPZV/Eok7TWR1dUFAmXLN+CdYJYzq81xWSuqOODs+yTn1oFiKu+McuWhUVLcysEIo868e3Ry5tRW/3F0atSkTRjtnr99zIi/xqFh4NsTjbo1e7JUqi7USUMCkGeAsgFCsP+IIgDYdIYRfq2K4rcRHc+2ZsN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mcFTw8Sg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mcFTw8Sg"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59H7n1NJ028564
	for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 08:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uJLxaLL+Ort
	xu6N92+2HUswlxaL+eZtDPgykkLQ+IQI=; b=mcFTw8SgbydUEAP+OHcucuJo7S8
	gfzn+ouQ2X9GjeKbGSbsZ0Xalt1lrEhKkLbqxYcfu8IXkRKeycXKdLdcnHB0MhIv
	4WGCZbgdoCokMuOx4Xzyycu3Qh9wb82XFe8PvDWoIuGFO/9yk38KyTpj9EqmN5yM
	4P90jlY+XLwQOMhW7d6+1ADr2R/7Gp7dlvO4wsUmsQoUI8zYE4QsEtbyphs+vpwR
	mjTsuKhBO4jnecvMDjWj4zCDNSoarpYRtttLcRp+Gi5o/9LGGO3dGdYMwL2SYbk/
	NKUX069vyZu4ZFTeGyaduldMBQwPgjeXbDvmQTot0sW6HfL2jbwSnqOqDXQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49u1h0u717-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 08:56:24 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-818bf399f8aso79566806d6.2
        for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 01:56:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760691384; x=1761296184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uJLxaLL+Ortxu6N92+2HUswlxaL+eZtDPgykkLQ+IQI=;
        b=M9ZBeJfLof+nfvZs6r8heFFFLqsNGRFsMMP7y4z/cSYoTea58bEz/twU87FZreTfZ4
         xQhtJIHfx1b9f2h4M5iA/QADvmZCT6ICpeGfAMAmavy+deB7iy3BkWSTy9KjGF1aFjmq
         S9PcokjC/KBA9ovw9ykXw5Ip3zpCH1HOlQRgivg9908NAFnSVKX36mZ+nNRxj5Cejmos
         9YOhvOsOBH3ybNcTGW+5EF7KUHDK5nc3X57YQDNq2ExifK4at1839gkv4TlG+Xri0nEW
         jAdFQTd+iML1obFz3avc26pWnZrU3E1Jb+cFs38iD7qCUHtLETrlKxBcrZJqpoaNUaWS
         Alcg==
X-Forwarded-Encrypted: i=1; AJvYcCVQvzdmBhEAxSUaLZm3Rui9MAPWrtiv3Akt7f/CZ3w7BPSKCa1q1L08HdTTe1YDow5YoRIEtLlOgqXB9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbX23LnTT0Iv8O3FnHOaHxJQz3yMDSMTIssrL8UcFJisZIMq7C
	hGAjn6K/XfWFuHoyi8wGle5XgCH28PpItmqT8BJTFseFAKCSH96quvNm8xUbE7Elrfl1K1GYt/X
	NqxdPnVh/sgeonyXUDoa2lybcNkLGjRzxBTrwGc7h9bL/QXouiP1pXZiWmPonlOkPeA==
X-Gm-Gg: ASbGnctpQeNpFsuN4cRrDlAPAmHCLKZMb7HqS10+5UvdD7WDdf+OHV/hK1nz2Vfm78p
	sgIct0LV8OvYNbe1mM/JM4yxqbM/QEQXEiJJ/dgSuKPJxK1SQcofLPV1K/cII0x6Ni+JLDtEd93
	ljuG/0kLdyUILx9JQu7oSVu2svoXWQ99RGBJkOSeoF4AT7XHysAKfP4U5ncyapUnUBBvHGPdMF9
	x5vukT4VvRvdb/2Alkk1XG1Lgveq/aQIQDuj6lOQlxHUjCdWg+x8URILylkMFst3NJEjkGMTI5D
	Eeo62VZqia4c4epR/TtJHfHqtBYlHFkrss+/W7xgWvfufx2MAZ2PcIIJ6byHPzP83+YTZT4bAMi
	HnaI3/jXYRm0I
X-Received: by 2002:a05:622a:244:b0:4e8:846d:a980 with SMTP id d75a77b69052e-4e89d2a387cmr37124641cf.33.1760691383678;
        Fri, 17 Oct 2025 01:56:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3eUE2elVtUpnZhtWXHz+4MlB+o7mcQ28YYahGYwUYCKw2V2KCoMwky9rkXFdFcShMWPjcVQ==
X-Received: by 2002:a05:622a:244:b0:4e8:846d:a980 with SMTP id d75a77b69052e-4e89d2a387cmr37124471cf.33.1760691383258;
        Fri, 17 Oct 2025 01:56:23 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4711444d919sm70764985e9.14.2025.10.17.01.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 01:56:22 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 02/12] ASoc: qcom: audioreach: remove unused variables
Date: Fri, 17 Oct 2025 09:52:57 +0100
Message-ID: <20251017085307.4325-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017085307.4325-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251017085307.4325-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=esXSD4pX c=1 sm=1 tr=0 ts=68f204b8 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=s8dh861zfECFqLDNse4A:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: sJKUcmmZ2X1mbq_erSCTrPJ4zFK9tqWo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE2MDA5OSBTYWx0ZWRfX0zWYS0VjlsiC
 mQHvkt1fTpcpZB8ufrTyQGMgYZE/bZlo64z78U/5kg/1coDY/noDktxjUkBACtTIOPQEZcrLRwE
 ZeSgdOJRJeOVdgPBFeLDpqthX5o29S/HNfKZdp/Row3x6vzsH5+Vdrgw2e87eRmMnxR8y2X3x9b
 PJZfsZP1vUWSbHwOawKncyx3GQAsNQD/IfTcS2YJrpOpUb9rvsPRe9wqsU2gg5ZnBdiVmN1mAGz
 /Ib1A0InIHqBhjKXVR9pCKCSM5FmHzZjfGzh/4OB4/eadyjKYEzbqu+i26EHd4Q+ytbqSs4oqrE
 JfvE9zUXS1rpI/2IGE00QwvAbp9JyzBnrxkT0ysDnnl9JkdZxE1VobBavbWBwFU3+MjKjfCGWp8
 Ma1/qG29KBHraskh3A26CgO5Fpd4Zw==
X-Proofpoint-ORIG-GUID: sJKUcmmZ2X1mbq_erSCTrPJ4zFK9tqWo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510160099

remove unused variables in some of the audioreach functions.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 2365424a9b42..0456d4689034 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -612,7 +612,7 @@ static int audioreach_display_port_set_media_format(struct q6apm_graph *graph,
 	struct apm_module_frame_size_factor_cfg *fs_cfg;
 	struct apm_module_param_data *param_data;
 	struct apm_module_hw_ep_mf_cfg *hw_cfg;
-	int ic_sz, ep_sz, fs_sz, dl_sz;
+	int ic_sz, ep_sz, fs_sz;
 	int rc, payload_size;
 	struct gpr_pkt *pkt;
 	void *p;
@@ -620,9 +620,8 @@ static int audioreach_display_port_set_media_format(struct q6apm_graph *graph,
 	ic_sz = APM_DP_INTF_CFG_PSIZE;
 	ep_sz = APM_HW_EP_CFG_PSIZE;
 	fs_sz = APM_FS_CFG_PSIZE;
-	dl_sz = 0;
 
-	payload_size = ic_sz + ep_sz + fs_sz + dl_sz;
+	payload_size = ic_sz + ep_sz + fs_sz;
 
 	pkt = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
 	if (IS_ERR(pkt))
@@ -680,7 +679,7 @@ static int audioreach_codec_dma_set_media_format(struct q6apm_graph *graph,
 	struct apm_module_hw_ep_power_mode_cfg *pm_cfg;
 	struct apm_module_param_data *param_data;
 	struct apm_module_hw_ep_mf_cfg *hw_cfg;
-	int ic_sz, ep_sz, fs_sz, pm_sz, dl_sz;
+	int ic_sz, ep_sz, fs_sz, pm_sz;
 	int rc, payload_size;
 	struct gpr_pkt *pkt;
 	void *p;
@@ -689,9 +688,8 @@ static int audioreach_codec_dma_set_media_format(struct q6apm_graph *graph,
 	ep_sz = APM_HW_EP_CFG_PSIZE;
 	fs_sz = APM_FS_CFG_PSIZE;
 	pm_sz = APM_HW_EP_PMODE_CFG_PSIZE;
-	dl_sz = 0;
 
-	payload_size = ic_sz + ep_sz + fs_sz + pm_sz + dl_sz;
+	payload_size = ic_sz + ep_sz + fs_sz + pm_sz;
 
 	pkt = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
 	if (IS_ERR(pkt))
-- 
2.51.0

