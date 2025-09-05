Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F52536CDF5
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 15:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757087097; cv=none; b=M8TF1XS6lqndrL6h3a4SDQGtqXRzLBvNN13znb8sZfzLsyzTBlbKwT9bReqBpGdhoDp7on98npcWbsidixr2TuGboS7R/XueMNxzhdFm3jxAyFNYdz/Y3XnOV4BnXKBViSDoVbkuVeUbi+PZ8m2X8AfawkOwZuE32sXqmumZhbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757087097; c=relaxed/simple;
	bh=/5tS1Na4bhQKzK4q//dUm4k/XvEXFSaGVZ5qLzvaXmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YsolNU6mxGk1R7x2meq16j0ZG07DgEqugdU+eHfn6conrZPtTDhvWu5OZr0B1RYFJS0vfmxldITIvoSDaNYR0WtsisG/XN71nrRURYu6Ic+TYO5P0C2UZbd5cBEjs9fqnxIaj8L3NzMGzqcGwqL73qtaw0cufnYbgz4kdpoFPno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SExit0Tb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SExit0Tb"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5856pswW013583
	for <linux-sound@vger.kernel.org>; Fri, 5 Sep 2025 15:44:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mTLagKpBc2r
	L9dFOYPZ/ZlF6mHj5oBgr/ydkac/ztb8=; b=SExit0Tb+n8lSToMlcDLLokZP/u
	nk7QXrzUVMxnKsqKUC51rQgeHqTohoAPqOk1ZIknTxdwxFNQxCq8Tj4DrXGKxuOx
	aiRLouO2APKuJu3DGnLdi+7u1CyKljrzUw20rR0D/y1HA8RXFmCd2VUOf12+DsqX
	/NCC04/Q2NpWWGCVNQ9ZmYkHw06CprVC2ZWuT5FLx3p+xBMrBFWfcg3XoTC6Yjkk
	qUjvYFdjwUbo+0gq5i0l65ffVmvI/hvdaaMExRD04wIcjQmXSOHvzvNjDSIH/HLb
	i56QHD37Ms03boC2uhDB9aU2JWM7wfUJklGbQCAaVsQMpxb3+Q5yTAYZbhQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wyfjav-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 15:44:53 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b339e7d107so59020081cf.0
        for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 08:44:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757087093; x=1757691893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mTLagKpBc2rL9dFOYPZ/ZlF6mHj5oBgr/ydkac/ztb8=;
        b=fjwVQne65GKlWwWc4zpAS0IGQ3WS5AN2DplG0EQZQTDk5ApDkH2XCqlB2uTqm4+/Ub
         RIHua5rB33HA+7/720JtXr4z9e9Te60dtqC/ej2rFgO6FThOU1r0/GCfwPw/m1asD/UF
         /eNB/uhm2c1yc+zTTmuPVNEYRxY308c1gG84B5lMJ7zysU4tIkPZJ+eXXBb4kN6Nh1ny
         C3dv8bHBN3PfL+1R8vmdborCljBgHXG6HaEaWSd5wb2qRzFbM1EQPkPjsCl08w7BiQqg
         6oPS6ZU0EtP6fWZlL0C9AbgmarKGyK9F1sbNe0ZO+2yiZ8r1rEsOIgDO453VM4taofvs
         lYhA==
X-Forwarded-Encrypted: i=1; AJvYcCV3ThWYJf8ET5dH4HNOdCnuHxHjZx6FXpCKeHi4sjGTYeCjTRI2c6Y3CM1yUdxmx9gf8Nl1Hfp1fJxZXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy+y8EMTyTPvWvB5VNuRRUN1HrAm25xX9pCq1hBCwxS+8JgVK3
	OD65smMnPV3rM6bVWGN2I/v0Zwn4AgVRKBqL7ArTfkkuOzcuFuQv9IVHhlaCH3257aAS6tDRXu4
	xk7ogTpnyDFU8i2o4GuONxDCEI/W9lTDRWG9cMbKR7hNkK/CZo1mDg2eIaZeX2fn1ZA==
X-Gm-Gg: ASbGncusRhJBuPlm+0dRn+qiJ8sX9QOIL2x2v1n3WqTAx0hnoZRbNWW4HGaqGHv40Jt
	27mS3QfTrYShJTKGnhEcdHQ4BVvw47HpiFn6TFE3D2E7aCU/hGHsjnjeemGy9N3OJFqO/fTrEPk
	w1gbpH4JIT2KGE7WvN8SwBl6zhV/QfXwoEN48WeL1LZu9mlbEW0xviIspkO6EprwyD/k6NVGG5B
	SAB3IrY8eN7VEnHGiGesH9JhmlsV+DyfAy6wAZFhKwSUzdWQUqQIGfGn1l1b0UjA/ypdjNltFwY
	w4zhyLkCBZgH17vN1Ufvqhdiw8CdtFrkrOmF8eXD5A9NgRfzUQn76Q==
X-Received: by 2002:ac8:7d02:0:b0:4b5:ee26:5367 with SMTP id d75a77b69052e-4b5ee265a2emr30882561cf.76.1757087092587;
        Fri, 05 Sep 2025 08:44:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaXM5xYiTB//e6nEVW8d4V0nDzBo53JeNS4CwOwWnvV1IpsnA01PjZg8fUI8yb7yuS5+Sj9g==
X-Received: by 2002:ac8:7d02:0:b0:4b5:ee26:5367 with SMTP id d75a77b69052e-4b5ee265a2emr30882001cf.76.1757087091954;
        Fri, 05 Sep 2025 08:44:51 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9bcda91dsm165716585e9.6.2025.09.05.08.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 08:44:51 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        neil.armstrong@linaro.org, krzysztof.kozlowski@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 12/12] ASoC: codecs: wcd937x: get regmap directly
Date: Fri,  5 Sep 2025 16:44:30 +0100
Message-ID: <20250905154430.12268-13-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250905154430.12268-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250905154430.12268-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68bb0575 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=5pqs-Pqnn3KeH4UlXPsA:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: F9-CoZXI7LoyW-GkOSwCr8pta4STCQF7
X-Proofpoint-ORIG-GUID: F9-CoZXI7LoyW-GkOSwCr8pta4STCQF7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX0HVd9x8MS+Ec
 rStIq3oVSyjZ2iXrhx4/we9DNF3BJmUGjqP4SToc5YRAsoN9mvS8ng77rcRGU8qkFEolpiE3TMA
 WDZ9fCZ5CjoTuK4TDibXgfAVu5Yjj/Lrk1eJAjEXLaHsyiqn15/KSEUY+8e6ZAWZ+7M/AoeZyY0
 7Iuh3YgfTbwCh1yu9wvTz6dyyeg8WE3POhg0vgT63XeraQQyqieNWxswEgx1NyNU8v3rgtSZmfq
 odEErhAlqPc4HOc8+Em3/VzKhc2BOUBUdJFtnQD8twXflwLRHxepGBaMzYiFf7VAZl9i5b08k66
 qX9s0O4KVFh0KFWlvOLXwEK2a1VIqBf3y/WrkLD/Ebha5F5x5sKEGtc8VXTNe1ZhkJU20yiKTFV
 XxKFaaEG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101

Remove usage of dev_get_regmap, as this its more efficient to directly
reference the pointer.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/wcd937x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index 5c8faff3976d..2064d707ab0a 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -2790,7 +2790,7 @@ static int wcd937x_bind(struct device *dev)
 		return -EINVAL;
 	}
 
-	wcd937x->regmap = dev_get_regmap(&wcd937x->tx_sdw_dev->dev, NULL);
+	wcd937x->regmap = wcd937x->sdw_priv[AIF1_CAP]->regmap;
 	if (!wcd937x->regmap) {
 		dev_err(dev, "could not get TX device regmap\n");
 		return -EINVAL;
-- 
2.50.0

