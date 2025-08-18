Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83A6320CB5
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 12:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755519778; cv=none; b=KoCftkm882aFYlQmn4PpF8QPLH4OCO3M++RZY850lPyeZt2CNSISm1DuWHWFg4Zxne/zoVTfROEdYssz9nmg3Oi8R2dPCFm0AbSr3F2I93lHx1V27xp7WFoKPowTK2JK7bSbpB4Mr16sV8nfJaw6QBaj5YczgEOAz1AoXI8B1GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755519778; c=relaxed/simple;
	bh=JCKIVW3Vnp7HuLWLnbUgbVk+bUV6UaYytum8NP0pPgs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nD86k1MGC1DAnGNQRLQp2lwOiSImVGUKDHRpriLrd9DqZS+LRrMESXS3mKVnpeTeIRp7UP/b8MRwdF36tlsK6iH5bf0bc4kKCWr1uwOlTLcg75fb/HlSiBIViKqITMdvc4qxVpoO5tLhQqC2Jn3LWI8veV+8da1qcXVjSHcIl5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i4Okl02F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i4Okl02F"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I80Lvp030728
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 12:22:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Q1s0Zyj4qhx
	N9eeMbMRlym+e7IsQucdcHjllLnnn6HQ=; b=i4Okl02FpVqyfsGJmwyYg4lkCrY
	djDTnu0DzZsndu5uWBIIr7ndJk91LF1s2j7dWyHB9ut6FnDZZ1umhzbikjSBoXce
	/G8ic68fqTY1UKTYiXk93PahNH91OQi4vy5X6gmz42CiWNBHLhm5VkRRRGIRK7XS
	MVWmX6XfYsoHsCeUw2LVbVA0bt4RvA5Zz1/GNoHMVywPFL8OjujH23yd2rbclo6U
	dsyYeT9PDkUmDOhbvxIdbQwq02Z5vEIIi3Cr86wMeDumbkOOnfkKLs7klbEeiEFc
	7inxbEHH8SXSZ3Bik5wtATp2oNMHz0xMmcynPffzsuHCbCVF/WQTVS/W+uQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj2ucpgj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 12:22:55 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70a94f3bbdbso88301046d6.2
        for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 05:22:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755519775; x=1756124575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q1s0Zyj4qhxN9eeMbMRlym+e7IsQucdcHjllLnnn6HQ=;
        b=Vcy2RdylNMdXIYiDPReYffblawF+YsKxxRO0sMaVwOsJ/sCrIbRF/j9WWgbEdJyN2a
         e6q2zWhHuTZC61ctseWbPRDdWXfTD/ozAVA7rSbKV5W+Sbg00y8YMLpQfG0C+AZ8Qr0c
         AwJo4qgQgPSPWQ+wde5JCtgZVnM26SmK7KHXrmXnq/MVwgVJVE3m8DgMX8x08gWofWwW
         W04zlZ1Z5ZpCHzmkjWGMFHvBqnaLeiFryMxxnRqOx5PxjVzYIeQjUOCBGVvd5C4F0BD2
         jZAZNWMbMSPHdR1ejBYZf5UyI7cpfLSx3lz1mOOZdWSzWRGRbfblqxYAar8XIbqTUJ2a
         8J3g==
X-Forwarded-Encrypted: i=1; AJvYcCWIvMMPQ7FOYTenZkWbtgK3OfMKwL8pW4gaLVlIaMHfcc02GZyNkf4UeLBY1AYSYHe3wzwcom6JclukiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3IgYf8u5ZufP6duvpHGKmS/lsuEauMA2nw5EZdWpEmiOmn8wa
	CLNIiRdsWtMbZJ3xMWi5kD+TCob1Pfq1+jPsheiim78Lnusos/o+s5DkgEEsW94QgQDNs5/TDaj
	V/LzM3c8b9/W2vFz1ffUvLAO3vPdgNsgYuUThn94P3zQfXMHc7ve2+G9Z95swtKLrFQ==
X-Gm-Gg: ASbGncufL1Nbnpsj21XrIXUEVdLgaq+ua0m9Jf5/DFj21UhGam/KwN357k5+rz2gYwP
	N2MlVXPRwKotmpP2M8QICF9yfd4Qej3+t4YQwg0u8CC8vvyFCVD9Rc8L4VmcIYe9535AGKI/8d+
	VwY06qhAPGC65kguQJS57AN7NTYvF8Gsj7CdF3P8qUUGvQ23kPPxo66N1did2Q+Au31VQbIlYjV
	Kz9lN55f+9kJN5733uM3vJt5h9/rkKvTxxcKHs6632MOA8tN+rNNeMbh+7l0GtDG1X6RM8mn/zy
	4i9LVp71EuHKbKndcfe5MScki1DexUuUxaP60XDuI7rce5EKTfnaJg==
X-Received: by 2002:a05:6214:20cb:b0:70a:cfa6:4028 with SMTP id 6a1803df08f44-70bb060c400mr102225346d6.25.1755519774776;
        Mon, 18 Aug 2025 05:22:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtod+zAN6dMjolYmwj14N6c1+Q0ATWvvWPcGCEBNXnfbj7vopuJbRImMQjax+QKZKBMkDymg==
X-Received: by 2002:a05:6214:20cb:b0:70a:cfa6:4028 with SMTP id 6a1803df08f44-70bb060c400mr102224866d6.25.1755519774299;
        Mon, 18 Aug 2025 05:22:54 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb653f657fsm12601563f8f.29.2025.08.18.05.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 05:22:53 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 5/6] ASoC: qcom: audioreach: sort modules based on hex ids
Date: Mon, 18 Aug 2025 13:22:39 +0100
Message-ID: <20250818122240.1223535-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250818122240.1223535-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250818122240.1223535-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MJ9gmNZl c=1 sm=1 tr=0 ts=68a31b1f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=8nb5IOs2KV4HrawvOq4A:9
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: baqKbcpmNGa4394KDfdQbg3kOHPavNpR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMSBTYWx0ZWRfX8L9o4lh0K0gq
 XFnnRL9nsG3xO+vfrvUzLSoMjg137xWHErDxv1mjjpkV2sxrK44ljXIf31tw1vX4LYSw6dQfrWX
 KA+WUXApQxhk4COJzlNjG6VAuFUjt8cpdZRMonG1i7f77SrS6eEdcEF/+DDEZZymVKgVlM4p/xC
 JP1rVdC2MnTemSl4dU5c7dpT8vuiCMmHibDJstHyr2hnDtv0t0cjY5U0hACXlWPAeoAO7KzWnUD
 jzKBiJ05+H/BJpJi7suwVme2eI5QkB2VXfm9MjO9ZjiUNWvcO1Rc0j0DsLL030q1fCixuF0yp1L
 5UlEk7BOlDVpjLRRA1dUzfsqkjp47yJATsfr7/zbBrgGDG6PW4Xt1wJFUQumMbQLjNU5Jz5ekOF
 X4j8VSVU
X-Proofpoint-GUID: baqKbcpmNGa4394KDfdQbg3kOHPavNpR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160031

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Sort the module defines based on its hex ids.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 512886042224..790fba96e34d 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -18,14 +18,14 @@ struct q6apm_graph;
 #define MODULE_ID_PCM_DEC		0x07001005
 #define MODULE_ID_PLACEHOLDER_ENCODER	0x07001008
 #define MODULE_ID_PLACEHOLDER_DECODER	0x07001009
-#define MODULE_ID_SAL			0x07001010
-#define MODULE_ID_MFC			0x07001015
-#define MODULE_ID_CODEC_DMA_SINK	0x07001023
-#define MODULE_ID_CODEC_DMA_SOURCE	0x07001024
 #define MODULE_ID_I2S_SINK		0x0700100A
 #define MODULE_ID_I2S_SOURCE		0x0700100B
+#define MODULE_ID_SAL			0x07001010
+#define MODULE_ID_MFC			0x07001015
 #define MODULE_ID_DATA_LOGGING		0x0700101A
 #define MODULE_ID_AAC_DEC		0x0700101F
+#define MODULE_ID_CODEC_DMA_SINK	0x07001023
+#define MODULE_ID_CODEC_DMA_SOURCE	0x07001024
 #define MODULE_ID_FLAC_DEC		0x0700102F
 #define MODULE_ID_SMECNS_V2		0x07001031
 #define MODULE_ID_MP3_DECODE		0x0700103B
-- 
2.50.0

