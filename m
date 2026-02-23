Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A779C33B961
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 18:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771870091; cv=none; b=Mcd8Sb97mtkeUoZrz9Gr/q3papET+cF4/N1dvcrNueosD4ZZgeiTzubhQ+kknwsAQJL4nrZyjt7hGHV+Gw8Tr4mzUWVfSRLPz+RZXvUOZjNEmB/Ofh4ue825Pz79qY5RO6GXUpdJo4hYt4nmEpIZbXt4mkYzeTxEcfZhPTaErTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771870091; c=relaxed/simple;
	bh=sSGa26gpWdI3zubzr4vR8voY2ZZ9uOTTFQpEZo9CUFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AsOFuGKtAkBsw+q3So0XpAVpmg54z/RgkEnRzc4fDBacchuK7+NIxHbdEQVlbz5FaI0DNryUoxiBTviM2EM4QQU/AxPYqMAxhutL4Kz+fiPIswSbj7tFGYOlq899iDBAUvYdUqJYcauNxPmIF2dKoI7P2an/3Cu0GFkmQZFCsaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MDwcp8Bf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NT1eaPuM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MDwcp8Bf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NT1eaPuM"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NGRMAR1640673
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 18:08:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WhVePPPT+SN
	r/7D2LWKoUshhH2y0lkEE57VXfglAsco=; b=MDwcp8Bfxy0VgGZWJDylw48t4FS
	bYHoWtHaXMuoG/0tq7FLaYjsZbWhXJ/xBMHFLTR7xLQdy3d1m+D5V27hE+bKfW68
	iyzHM27H+8+dUxOf0X1bykUAATwdC0HIjB8JznuYJ06GFG0pdSrDFodGY72hT2vF
	aw0tw0t4BGu+oaxZ2ir91aVeOWd3qQcZuBWx5r/amHh5iHa91P3LOLENkRvk2Jmd
	SACHVlmp4KLCNfJWsjNiHMNWw/fbbNJJ3Son0YDWZ2mTTX4/U+QlynKDdkKanWmD
	C0NeeW6DWJ+WepQq/Aez5HDT3VAsT2JCD6pSf8B5fBNxeFrxW0jVEzHxfrA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgte8rb49-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 18:08:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb4d191ef1so671830085a.0
        for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 10:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771870088; x=1772474888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WhVePPPT+SNr/7D2LWKoUshhH2y0lkEE57VXfglAsco=;
        b=NT1eaPuM1w34HVNY7gZFlfEA4h2DIXExkkMtnUVl1yMIX8XICoZ7Tpc5IohGAvFG+3
         ESggBOYvowdRZwBHpWM9hXIlUitcrR4hRIkJDshQy66FkH3oA/zAmYyVnbDP2w4JQuez
         /bRn5MZkS4RUGoShpaN2sRb7ST+ctm+0pX8yz12xB1gybLCY5l9UC9+SqkqP40MgOVqi
         z+lc3iGDht9wQVP0T8ggH8Z+30wFQixEQYYMk2dwgDHng+r/xiOnML0K+bblgl8XhOMy
         BlAXdI1Jphtz9XhECz3P3noSeZGrY3TG7ZvwK9HMvjJvdD5k2S1c/ZcQ+WLN8t/5iWHG
         si0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771870088; x=1772474888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WhVePPPT+SNr/7D2LWKoUshhH2y0lkEE57VXfglAsco=;
        b=rQJKUHsn3lW1dM26OUJKUq4OvtSnbk4EXa416rINDNDBFjQMb24TjIQsSZxL5aoEev
         lbVxAr8UyyxiTpL9wKIvLDxGRIKqGLiSXTwX123P+FOgplQSHIva6f31OxAmOCT6Wher
         +AGto6/UKfJRmyt31CL3TR3TY6lzSu1m5Tf9bIBWbf4ez4h+vQDfUJEptwPbqIT7r774
         Y+JTlgVfh3Ddn4ye3XDK2myfRb9bS2HtAk9mzyAs4RDI6pwUzbs3A7DsGbX3giWgArkm
         BoFXXKZ0pM/PFPiOBDV9WPEj5jDVRxeBzRyoL6AEMqM4bApdiK3JJKDQnmctvK3AnH9J
         m42A==
X-Forwarded-Encrypted: i=1; AJvYcCU90XxGpjEKGy/DdooK8BdcfV4BWFMlorgzAKUrDmoIiPaCYL2Ef3cHs8P/yUXvijGnsXhjk2oyQVc9zw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoyXG+pipoRv1KmQ1DVthWAiObuEbLtiK5+/ghjBuk3IJkFK4e
	06HB/YzZZyke43NpFdZL5vQAsI+TJ5JYQm6nFoTL3Ie9hs0M5ZMdwNnfI9IOcm8FnEbOIM6tJSq
	fLjk2Q6L4KfrY65tggv2GfCx/fOoyq7LvLpqFHRUGCDdhKqsgIOW6hKeGN4rzil3M9w==
X-Gm-Gg: AZuq6aK64K+SKVxbF99VNHLNCBHP2h/rT2tOZxc/8JB9+PMIdfTBSDBI0EqOi9Vhxbk
	SNKn/6Bt3PtkzD6Ctrls6Yfh1PmfsLj4qiKWk4WrqoshYcVtNw+fzfuGFpCjRoHhyyjxak5jsld
	FQxwyvnnL7tHJqDYUGarj/q/evYUR+rmIex7aNxVTiABePBzDgp0Jp6ZCxQsUMCe4UbDV5U3miu
	1lNPkSBUUreIpbVRafcpq4Y58YoYeL2BPU9a+fzD9y+dBtWirZRRP8yCku4O+YE/dXyrjrgEkKm
	qwqnn2HG0urnxxlS3nk8UATfY8oW9FMfBbnAvPE4FUSzl2XyW67TBpaFLsug5Bw6yPg7sEsXtzC
	5ohcuP2osQ7l5kc0kKEw1qEkPrVtAcT6gYxmLrS0LgvEap4wwyWhAK/k=
X-Received: by 2002:a05:620a:414c:b0:8c6:e0c5:7bc0 with SMTP id af79cd13be357-8cb8ca1557cmr1140795485a.36.1771870088147;
        Mon, 23 Feb 2026 10:08:08 -0800 (PST)
X-Received: by 2002:a05:620a:414c:b0:8c6:e0c5:7bc0 with SMTP id af79cd13be357-8cb8ca1557cmr1140791085a.36.1771870087683;
        Mon, 23 Feb 2026 10:08:07 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d401aasm20458574f8f.23.2026.02.23.10.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 10:08:07 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 11/14] ASoC: qcom: qdapm-lpass-dai: correct the error message
Date: Mon, 23 Feb 2026 18:07:37 +0000
Message-ID: <20260223180740.444311-12-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223180740.444311-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260223180740.444311-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: r6tHmGtwYjVvvZTFgZiVaGq7c2ehYgVs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE1NiBTYWx0ZWRfX6WN/RcOVCYX1
 RtV+VRPVK4AJrydev0wOkzVJ5YdZpGFW+JppPgSS9FpJlo8tqqWTX2oF3BqavfQZsjjUU5LGd14
 XQjPoZthNFpf/YEmUiqW1+RW+72OsGPptlXOt7UExHiSYRH9Xp47+f4xAOBAemp0YFzsWMHX/lf
 pyItKy0hsH5FLG7ZUglmTHtAFa+AXXan3WO6V4gJIm8AYThYKKnuZN0eJrH4mafrYcvdw+JcqZ2
 BeldrMSwt8BA8CVOPRVtAk8eow6XNqOQAS2pM1AyRb1RViF/pou5f5cOBA1DySANTBSGbMNLzN/
 /zEXkL/Gxmc+sxfY/u0qSK5z58VNSCZuqVhumTkYt2QWtIWxWK81ZULwvvhsUZ2gle3JQ/uLp+c
 5SWy4Pcfx2Nje9nZejt14VICg9NDHudJMXiUgMPlQky2/iz7kZCUmaCvLMGbNpMLG6BR35WQ3SM
 40pDmALM8lHJAJe/sRQ==
X-Proofpoint-GUID: r6tHmGtwYjVvvZTFgZiVaGq7c2ehYgVs
X-Authority-Analysis: v=2.4 cv=WqQm8Nfv c=1 sm=1 tr=0 ts=699c9788 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=QkacBUY9L2qTTJrEq-kA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230156

Fix the error message to reflect the actual graph stop error
instead of graph close error.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index f68d4b4974f3..fc246485e326 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -150,7 +150,7 @@ static void q6apm_lpass_dai_shutdown(struct snd_pcm_substream *substream, struct
 		rc = q6apm_graph_stop(dai_data->graph[dai->id]);
 		dai_data->is_port_started[dai->id] = false;
 		if (rc < 0)
-			dev_err(dai->dev, "fail to close APM port (%d)\n", rc);
+			dev_err(dai->dev, "fail to stop APM port (%d)\n", rc);
 	}
 
 	if (dai_data->graph[dai->id]) {
-- 
2.47.3

