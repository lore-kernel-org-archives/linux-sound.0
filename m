Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9313F3C5528
	for <linux-sound@vger.kernel.org>; Mon, 13 Apr 2026 12:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776082739; cv=none; b=T3prpZZ5tatwYuYVuhBnCqDLZ4SqMfCWj5LXrDDsHm1Qppt0fW16ZKlLprfwjaFyB1la1tVPPZ59rG6bg5WFwWONuZRUraJad6gGd/2P5VLwsG+OTyamOVzmtxWKdXekXz5JQfuss/Utne+DjQzoKzAd070kuI1ar3StpBfobis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776082739; c=relaxed/simple;
	bh=+XVvtrOb6sUd4M1mjXM60gdJnIjDO3h6AAaRAM6nC4Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DY0iGlPgcJwf0TF2YQFXudcgnuUmBdTwcM8EoPCHF71AqQ1zHEA7d4Fx+Ek3Z2cUNbxienn7vE8hBfN3kY0btT9L3MWu2ZIQx7P9/RAoiZlSWlv/FV9h2ZPawwhtK1aKGzFpISJ71vT6Rx3hRpx0ZZ/0dIQeE0vvsMPeUX1QEzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j5VxvLgZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b/2eqdUl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j5VxvLgZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b/2eqdUl"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DC7eV22186578
	for <linux-sound@vger.kernel.org>; Mon, 13 Apr 2026 12:18:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Yns9nvbNXPM
	4TrtSu4abBOXjoeDxYcQDqoClmO9sAno=; b=j5VxvLgZFgUqhJ5DuLBmnI14xiM
	2084BIyrJ5+g4XkDiFu9CgEDXLeetRzHM6qBSLTCOmJqVz9sJkHbQkYLSwdamdbz
	MhmiHctx9ZYteKyNrrp4TH1n2CeMdGikix3v1CnbF4nffn+TMxJEdPZvoUsxWJsy
	iqsO/WaJlqKP+8QJg+9jGGXUtgaQLgMODPdwm/PeXe2fz3nPKha895sgs1dGzF/2
	Ato6GcJTtsDpSw7ZaIzDt6V1uvqSfRrKsIpjYIrXuayQZiRysVgDbwIU7LC3ekly
	pv58xFHALYeA0ztNF4uK/JGsKokcofp5kb9YJ8zDpJGWCaoGZj0tJ+KffGw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh07hg0x1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 13 Apr 2026 12:18:57 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-950c363a552so1835946241.3
        for <linux-sound@vger.kernel.org>; Mon, 13 Apr 2026 05:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776082737; x=1776687537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yns9nvbNXPM4TrtSu4abBOXjoeDxYcQDqoClmO9sAno=;
        b=b/2eqdUlJyVaduoR0Sjq4z1/BWKRCcP1lOToIyB7RlIcogzJAzMxZA0wNmpBbJiklX
         e4IutgEC6NB+vQEuhG17OS5but7so1mabI4iYR97LhO02yTQdi4d49Acv04KGKZpYU4O
         HkO4bsITKreJct1a+OTv+P2w25KK2HB3Jk2zjJp+FYQENB9tyhnXHfvfMM7ZXowMuT7D
         TXKZnaaEDLl20wxyZ28RwN/3qn2ON/wvcFNCfPpPXii4J8Gpfd63lAmUBkBY6RcBJiRg
         zCm8XXhks7PEKHqoMXXmKlCY1o7VqbLsgowHq9HjiF7TLVrIjFQg55pP0g9CJvj7vmmj
         zOjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776082737; x=1776687537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yns9nvbNXPM4TrtSu4abBOXjoeDxYcQDqoClmO9sAno=;
        b=rbyQN9Uf4rQ2HyUuuXvwY/fzlab7uxGUFtzzMcBFTnLlQEeWJLaLot8tlO/WSHrQfI
         nR1BZUseoEoj1S4IJ6bbvUZ6bqFHE0tSEvuThtJ2SDKjwsN7F1XIyqC57sMNS/hZrqe9
         zJOfezYGTseUbqrLVL6wtDiWy2ImhT2q9lausUee9FOisaDbSrf/qUyVxDb8FAkoKdqx
         BlnVy76NLmyS2C4qgaJ1myl0A7bBiBMYHMV1fvHqdliurB+TSBIu1tneo4/1Vss4KSGW
         J+XY9qmS7TFtnxGMZ8pjK2A1UzikUzg5hpZNCt/3/CJfQME6oEpSLQQ/h1/uPJYU9uSz
         VwiA==
X-Gm-Message-State: AOJu0Yz3nVQLGIS81+z6ATRKXvpvtJvqKBI78whoVCdX5NLk1wBZ/frz
	AZbvcJ2OsWnV0+MNMi1E7mMt/bITMiKrX0htUqmbXsIph87TJGsSxu8KbGMZnFRiCRvFU6u5Uz3
	JT4oU7KQkgTNlRBF6sAd3erd/ZFq9wt1rq0dX2c3h3p0LJf8RcWY6VgMmN3IIm3clnA==
X-Gm-Gg: AeBDieug5LihAQ90nPlREfce9k4KN6/8hKQc7nLux+CknlysUj+9ci7Yn49R4LYQ1iA
	Ih545b5zeNWyazsr45YtS4BiDObVSTvODL5+NjmoTQNda8f6WgnV0QoURvPGI+NhjAn9U9SCz8h
	shmPo56THAv68IdZ9Wv9G9pv/U8uHvCJDIVSQPYECYlNMuJ/4rcljE2w/7rLV4Lo1fo3mzB431A
	4QvBEn272KWlafeyYM8fD4VhoYm/YKlKG7YGbnGgtrwssHKC9fCFDFVAQ45YjGE4KUSugzOsWZb
	LrYrUmaj/r5iHkV/PCD3fc5muzLmHdDSiVq1yTv3kxsL54JZ1DaXuHE1zcaMOy2y34N25GVmVUg
	HwCacaAVRE1K7Cc/eX9BC3P1Du5A7dHXskzdipK30hGQhdC0PsA==
X-Received: by 2002:a05:6102:3a0c:b0:610:1239:f6d7 with SMTP id ada2fe7eead31-610123a0b70mr437422137.18.1776082736833;
        Mon, 13 Apr 2026 05:18:56 -0700 (PDT)
X-Received: by 2002:a05:6102:3a0c:b0:610:1239:f6d7 with SMTP id ada2fe7eead31-610123a0b70mr437408137.18.1776082736416;
        Mon, 13 Apr 2026 05:18:56 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9568c185a71sm1449231241.7.2026.04.13.05.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 05:18:56 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, srinivas.kandagatla@oss.qualcomm.com
Subject: [PATCH v1 3/3] ASoC: codecs: lpass-wsa-macro: Guard optional NPL clock rate programming
Date: Mon, 13 Apr 2026 17:48:24 +0530
Message-Id: <20260413121824.375473-4-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260413121824.375473-1-ajay.nandam@oss.qualcomm.com>
References: <20260413121824.375473-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: js8pq9rl9-CL93HTgP_08jsgYJbXQW2m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEyMSBTYWx0ZWRfXyQkdWTAjAVMH
 aLkN29lwn6bHO6IMXHdTolEy8PB687zaBQq+VJ4y4z+WgUofE3g6+VT6e2NmIsEJe/BsEqldWZA
 LkUtv/ZAAtRLX9knvLCiEXshfhvKQyErZzw6nOqF3CzB96e5+zIRMMmesvgghOFEzqUIgLhpA4o
 zYxS2KxaHc/VeoMtoPUk0JkFG890TctmFnfn0wPhol+WhDr0rSzCXEKuptIaexCMGKcbfwPiTsi
 3xJHt6k8aPSaBF1x1xZk8WL4LZd5SckF/rtCQhrBEYNoYZPAY6yOfka4UUABaZhj/+2HJg8qUUH
 0gDzk8hdJpfvgb8Z0x/nDyHw9vUvLkf1Xap8MoS/ZAS7yTQDuNTle0d4/9pn2U9qkP0Yr0ynI3L
 kprlORyP0/Tn6SgbxXr9xsOCyrWDGdyGaEjLm9I7U31lCzYyBAWe0i5UE4/l8t8oOsLpIIgPuX4
 oqHevux62BwYV9QDkLQ==
X-Proofpoint-GUID: js8pq9rl9-CL93HTgP_08jsgYJbXQW2m
X-Authority-Analysis: v=2.4 cv=QtNuG1yd c=1 sm=1 tr=0 ts=69dcdf31 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=EF9g5WYaJUPSkAj6upQA:9 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130121

The NPL clock is only present on some platforms.  When it is absent,
wsa->npl remains NULL, but the driver unconditionally programs its rate.

Guard clk_set_rate() for the NPL clock so platforms without NPL do not
attempt to access it.

No functional change on platforms that provide the NPL clock.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-wsa-macro.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 6aa6c4d95..8c8c50a63 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -2774,7 +2774,8 @@ static int wsa_macro_probe(struct platform_device *pdev)
 
 	/* set MCLK and NPL rates */
 	clk_set_rate(wsa->mclk, WSA_MACRO_MCLK_FREQ);
-	clk_set_rate(wsa->npl, WSA_MACRO_MCLK_FREQ);
+	if (wsa->npl)
+		clk_set_rate(wsa->npl, WSA_MACRO_MCLK_FREQ);
 
 	ret = devm_pm_clk_create(dev);
 	if (ret)
-- 
2.34.1

