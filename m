Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9472B2D9EF3
	for <linux-sound@vger.kernel.org>; Mon, 25 Aug 2025 10:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756116783; cv=none; b=mq7zbhlzHfPZPvHlQxVHwdhPlmOzP9MiTZ/yVq7xcFAPPsf54KtOArnTrk992nDmQxBN0dG/RW9mvpBPThP5Vg6bN2NcmIPTTLTNDvMInVRilp6elBaFbOTjVInZQlIU3p6Wo26auapK1J3+zKSYFKOmMr+uUMcpLzAMr4YgInY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756116783; c=relaxed/simple;
	bh=4jbF4aF8Fyi80mVx2EMaOXjSBRT1sA2h5/KbZLp74h0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PGmwDd9WK15aPJrE6QEzbP0n0IPUyV/+1qW+kt6KxqJRbwouwS1YY4GZIjeTMWObbyHbZudvB1w2FN5yb2VcUOTrzOISQc3ZemYA3PcqOlT4KslASeuT6e+gv4eLLdQeKqS9xd1FnEm67PAj2JzijkVR0vZYvrf7r1r0LWRLzJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CgBreqjn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CgBreqjn"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P7iqfC030813
	for <linux-sound@vger.kernel.org>; Mon, 25 Aug 2025 10:13:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kSGpgoMKAE4
	/OLKOS3q3sOnQ0DxnfDEvngbBHIulXJU=; b=CgBreqjnqvyLnPdjIEgF35V2jTD
	nmTpB8vwPs1vJW16L7LKsp2h7ZFliiESzj/+uPQx3VqH/5w95M1v47ItE8WK619o
	7vJR6p52uIFSKFDL4XiCnr+8U98H06Gr8DeNtyjDclGx1XLkMyts4t9sR8sFoN/t
	jaGaLW3wmjb968IvgvNSJRzVx08havTquhSYg83GWnc0XVkSSup82Kv0u0JYYCpG
	sBhST9hnFiQkFDCFb7EomHzD+2A2FuqaH3rOsK0TmmHXcf/Yg3Z2fU9QQpp0cqy+
	ilcgoDr+qkqUq9Z1NvrItPvdT1jY4w7DgNSd9vwtGQFwxVjRGe/N9XWnf/w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xfcqqa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 25 Aug 2025 10:13:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b28434045aso174527321cf.2
        for <linux-sound@vger.kernel.org>; Mon, 25 Aug 2025 03:13:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756116780; x=1756721580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kSGpgoMKAE4/OLKOS3q3sOnQ0DxnfDEvngbBHIulXJU=;
        b=dhhuOV4BibMHetPF+CxPI40PLF0Ysqsf8xu6bQkob/uAZ5A1RGSjCeG3echfF7UTYo
         qHfQahGVES027B1GFA66RqxtjKfPzRO6blcLOUWE6Rgogmtdg1g4h4+TUg54lPERTdyO
         2Eg+vcSSUgHgyd7vvhP0oyXzH6vQXraGjrdUI/bdaHFodNc9obeauz3VWEQqEjSM3Q+p
         HgjOp8AznPjjjctbUdhq6Js0wQp8DByzJ163KVjFBDUoL4/WKp5/oWZrcWcMCcx+6VXT
         MIXCW03seKWMoMc8g5wXbBplxbrFTMTELQEwrMzLwHFYZTvqoOIbdkLMlJ0+p3aw8LPU
         pz9A==
X-Forwarded-Encrypted: i=1; AJvYcCVCTmcpRJX09t9d7A2MjQ8vEM9NcsvaGPQU0hyrpWUdnKKF5U8iNXFsf9JH/tr1d7rG1+GJQ9/596US0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPGqdzEMesgrcPCkFTw9VvffzDr3dI2nF9g2OSkmvpDlE6MjS3
	WpsECHS667dRs342hwZcP5KtCxuQSZIRZUs3Ql85adBKB8MSc9nHycUmWurNJhTwXHbVq5Cwks1
	ztof/h3NM9+tU1oawssBFb3J0kjgWI2UbXSWEkHGBU3AaGsBkgMYPd+Evx3d25TevOw==
X-Gm-Gg: ASbGncsQBR//K5+4LlRJKsdWvq94L7zrmeWCO5zGT15MhhuOPdOwq+nfbW9DzHdhFJI
	CcUeyIwjNYZhTIZxxWnGvDahguPiWAg08I9r08atn8hYP8lncV8nTpaCsM577rpALmbl59xBjwr
	uc9+U87UTfMppkW8LBaYneVNex9/a5dMsYx1CcnK/VDBEJd9H+UloON0P9RIsIyaF5iAnPlh4c7
	0JKRISJSThZ78dJBs/rox8h76VcDcaAyFaW0TqFSW34ISYqX12H11kt0Mel5wcBPLSVdGnfXGb/
	QtK5sytLkdNFk6Tw1kBap+Gp9tr/zyogk7cbAxypHHD4b4soW/2Gig==
X-Received: by 2002:a05:6214:1d28:b0:70d:b2cb:d015 with SMTP id 6a1803df08f44-70db2db15a5mr57117806d6.67.1756116779664;
        Mon, 25 Aug 2025 03:12:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOnY9gws40NRoxP1ky0M65480RnEkGn7SLBORQFmruM7OnjhFUae7l7V+Z3KiJbquOo1nbOQ==
X-Received: by 2002:a05:6214:1d28:b0:70d:b2cb:d015 with SMTP id 6a1803df08f44-70db2db15a5mr57117556d6.67.1756116779189;
        Mon, 25 Aug 2025 03:12:59 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6359b8d6sm5798645e9.4.2025.08.25.03.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 03:12:58 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH 2/3] ASoC: qcom: topology: convert to cpu endainess type before accessing
Date: Mon, 25 Aug 2025 11:12:46 +0100
Message-ID: <20250825101247.152619-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250825101247.152619-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250825101247.152619-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX5wxitRcG6VeR
 XCrDmWsg0ud9i5hVS2QYv4O13mK6KUtE2x9g14rtzFDDFarsIbrb4j3hz1EDbFetiwNicTqkOwJ
 ZYM/vCwBMNMHI2XQIfLrYBZDQw+JS+1vtaj8GerzM2HgsmcQCwNzauRj85euBqRR1+o63AhYzTM
 254t78tnEpywL7+0shjmz6rZPRteYWZa6goOG1Rwd7ol4oDpg5MCya7ZLnIMTCHqSCL4+kDBHnT
 7x30kV5Ohf9cluA2u4g4zE2cUzoiIgBXtC6tkZpoXAxTMCg5GAPIehTOB7agsNJ2CTKUxLccuWj
 JaLhMQosWPYHlRC/6rQuhc91D2RLoml/qGvYxKZfW2wOXMwHza6I3yarvIszhywtgxAczPrl4nH
 bx/qTN33
X-Proofpoint-GUID: fuMjNchOsH7-g0T8wMQLQUD8qR_CoMjI
X-Authority-Analysis: v=2.4 cv=MutS63ae c=1 sm=1 tr=0 ts=68ac372c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=OR_sDe2PA-1rWwznPDAA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: fuMjNchOsH7-g0T8wMQLQUD8qR_CoMjI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_05,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

Looks like some of the members of module config are accessed directly
without converting their endainess to cpu type.

Fix this by using le32_to_cpu() where required.

Fixes: c7ed4c2debfd ("ASoC: qcom: audioreach: add support for static calibration")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202508230741.heXmHeDC-lkp@intel.com
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index c2226ed5164f..f61285e7dcf2 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -314,7 +314,7 @@ static struct audioreach_module_priv_data *audioreach_get_module_priv_data(
 		struct snd_soc_tplg_vendor_array *mod_array;
 
 		mod_array = (struct snd_soc_tplg_vendor_array *)((u8 *)private->array + sz);
-		if (mod_array->type == SND_SOC_AR_TPLG_MODULE_CFG_TYPE) {
+		if (le32_to_cpu(mod_array->type) == SND_SOC_AR_TPLG_MODULE_CFG_TYPE) {
 			struct audioreach_module_priv_data *pdata;
 
 			pdata = kzalloc(struct_size(pdata, data, le32_to_cpu(mod_array->size)),
-- 
2.50.0

