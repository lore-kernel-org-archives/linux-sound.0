Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0825D2FB608
	for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 10:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755859781; cv=none; b=C6j72ItqUi3qNzyg2Qm/eMS1q161UCOlgA/rw8GF5+9oKbjVIFd+tL1JtcY1D9rroSOEsLRKselLEODZIXLw4hCreNxStV8u0NettpeK597qUnlEAqkBdSCdBXfIiHhn0uQBl85vWOBu8SXGOe9e+WwDBxpjsqp8/RZ+NWBNy/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755859781; c=relaxed/simple;
	bh=ZKAlgxst8/m0craC1V7C11GB9Q3nugJsZw+QLPl6edw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qCMEWoB/5u5dW4TGj9v3TCG2zLVvE6Agj4KQ3j6T9Nj8/t/E3VpumzEt20kZ9VBHdJeQiHoWchZO31Ga5yWcGih7ZE0zCMdgHVW8g8z3Z4j0yj6f6DZQVpWwFKun4CtxFLBNZyCtIjbsku80MFd1v5fM9hp5iKp5CTbXabvmxnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pGBb3j3L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pGBb3j3L"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UJVQ017910
	for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 10:49:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ITmsHBmmXeJ
	H+4FSSoYGod19htesPhZ3ltd5XDG2GGo=; b=pGBb3j3LEe8rzER7Oik/zqH0Tyf
	jPeT1pQ8yT5msGcifOR2Csn8zL0noadBg5zvJ2F5LfdCv/OZkEAwmR7mLZmhji8t
	j9iMdBPR6GNlRlkyIl5iL2AVOnT9BR0LJaDFzhs0SpMzl/v/jjS3/tisWOs2YwQG
	mdY/TQTJIml41iaymUHIyF3eH/Sfsr8XewrggE0M6jZZquNlI5RiZ3h2FscrgnAe
	2Ow69qOiGHRK0/gqda5OrxsRPRybcpLo/ZfQvW7dwGWniDWeMOL+8ZML1uLWkBVy
	HfNSyvNfC+Ji723BGvCsc7cDLsew944Hj96nch15uHCfhKD7tMTt3l4UrvA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52b0sta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 10:49:38 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70d9a65c239so11231756d6.3
        for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 03:49:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755859778; x=1756464578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ITmsHBmmXeJH+4FSSoYGod19htesPhZ3ltd5XDG2GGo=;
        b=nJXK8X1nsAX4IM6GcvZsxEisy461I4K/e/OlALs8SFRkxLkK3cGDL7MZ65aSwOhkjO
         +k0/Lbq4ngEM87H9krINPJm+KfqdBYzeKiFbbZFUtQKcl/TbIYM0HwVy1MvVylzIxBZ3
         Lyrna/Qy1PdJRDCRSqf9e9EendZOt7vh3iNXaqeFkufBfXIi8FqbRLaTdozO6f/aIClR
         Wrc3Xypo1JAB3yBuX5NQfRIDIWkA5HmJtC1lmN7W9Mg7FfJMxigc0nho19voWn81tHa8
         shombqCChD80xq5YANh/4U19QCVBcOhGtf21EoVi/sxqMc0wghbFKSgItve6MnAEcWuP
         ByIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCnLDfZ/O7yBhgW7OEBxJoJJ1kyQYU0/eLgBbeBDgeaVyvgOZ/vNkytBn5bSX7OTLIiWaSfr6J9NsvYg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz71rLAIkuIXmkTAu3+HeqFFPGCHHh6OvBluppo/WZPWVARTeL+
	TK7KVIsduZhSs04zxdV4zz66eT7qdukPh9LxXu+sF38MzLHyxb8dvtZThA5ZmjqpVOZUhy/wOm2
	UlZigh/DB8FsuOo0JKOEtqfrIkZX29/c1t4SzFZbyiTg7Q1I7nGZc2f7R+kynQjKygQ==
X-Gm-Gg: ASbGncv0dYOMp8KcXle/DPGVv0OXY/oRRuDVnnf2RkjY9Cav2a8EBmMXWkDovHMQDt0
	4wdsgpMvkoM1K/fC0LBgAxjOkWn57wrKbnOEfhIdTIIVdcfF7hnHNRRPdIcNvlJCXw8ntoRHGvG
	HK0z1/GYC1eAfC23RpkgWTeu1Yn678IXvYdVtk4d2EwCGu6fdIcTW9bKdR+QaaQPNOSOheob0SJ
	h53mHX5LF9Y4qonW602aPvRUl6biRWOc+r/0CFM7jUAghOOXsKNJbhZkJSqZJ5v0FAyil2yeLBp
	2ghavajg3V46EsVpuBy1ILeNelEA61JFX1Popv8LLqzv8pbqM7fRBA==
X-Received: by 2002:a05:6214:4505:b0:70d:9951:32f with SMTP id 6a1803df08f44-70d9951052cmr21887326d6.17.1755859778160;
        Fri, 22 Aug 2025 03:49:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFriKc6/N6ckQKdexpGrJyZySwTpjJo/jdMFtdFzr5N1m+sNgwNkRxbxRR0ZytSIN41749mWA==
X-Received: by 2002:a05:6214:4505:b0:70d:9951:32f with SMTP id 6a1803df08f44-70d9951052cmr21887016d6.17.1755859777555;
        Fri, 22 Aug 2025 03:49:37 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b50e4249bsm31367155e9.25.2025.08.22.03.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 03:49:37 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        neil.armstrong@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 7/8] ASoC: codecs: wcd938x: get regmap directly
Date: Fri, 22 Aug 2025 11:49:26 +0100
Message-ID: <20250822104927.2621866-8-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250822104927.2621866-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250822104927.2621866-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXzCgiVieWdxdw
 uPQ4cPbj/4wbTm/wNr6HnlbqSgFcVUH9Boa3zaxpuME1LrXtQFTDFXz0zGc1vP1taj44cU3D3lA
 xfhugEgjkeY66koMkmFRY18t1W8hvMVOcQkMktPkp438fRUMmjWAR9FQ1qQQpL65KaqKTE1rRah
 /9MeSUAkYs1exVt2hGkYPxAOt05bgdWUPNTGEY7w+Obe8dEntWbA3zdKHMo3TI3ix/dGMGsGoOz
 2cfAeY/KiNEnUDzTppYr9HFsnRE/lkixiu2MfmBPwPB2gN6P2Nb21JfRSHSOt0bTY5B9iDffjJc
 0atjY15l01tIMVs1r3baKAJmLZv4Pl1Wrks8kweQ1jeY9U3Kjrd/Y1abh8Jt/LxyFMGTrW/SLGP
 DWtBM/P4NpTDm3GGw6LIV96u26+hkw==
X-Authority-Analysis: v=2.4 cv=TIIci1la c=1 sm=1 tr=0 ts=68a84b42 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=AeW90Tct3s7Q8B8mPpwA:9
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: hl5O4eN7_KOxgse94M7_qS60L5TKni90
X-Proofpoint-GUID: hl5O4eN7_KOxgse94M7_qS60L5TKni90
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

Remove usage of dev_get_regmap, as this its more efficient to directly
reference the pointer.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/wcd938x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index 678e4052a255..70302de904dd 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -3388,7 +3388,7 @@ static int wcd938x_bind(struct device *dev)
 		goto err_remove_tx_link;
 	}
 
-	wcd938x->regmap = dev_get_regmap(&wcd938x->tx_sdw_dev->dev, NULL);
+	wcd938x->regmap = wcd938x->sdw_priv[AIF1_CAP]->regmap;
 	if (!wcd938x->regmap) {
 		dev_err(dev, "could not get TX device regmap\n");
 		ret = -EINVAL;
-- 
2.50.0

