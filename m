Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC3C43CEDB
	for <linux-sound@vger.kernel.org>; Thu,  5 Feb 2026 17:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770311662; cv=none; b=nmzbX0+8gzbPpTRtCCyezRkoUSv+oh2EaI28eUnyRs2zHBBcgEcgNxkPQ2ikq24E+LnyonLEkxn5cXwA7pfhGVbiWnd9iOPvk7DRVFdFcqfgo6N7SuczvbQ04UOJJTn3C/xdW5F99hHaGopVMuOyyu7CqZlObAxpOx3GjruQSMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770311662; c=relaxed/simple;
	bh=sSGa26gpWdI3zubzr4vR8voY2ZZ9uOTTFQpEZo9CUFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BAGxCDU6aAPuUifhiILJT59EhNRcwCX186rVh19duejJdv8nSBnMUbFB/3VwoS7itnAEILE2uJpPwJVZ+kUBw+cXbepUZOAN4TbcC9J0E9wGjOQvTpB+qIsuLrVCO1cMcteRo4kVXm8MW1iuEh5ZZJSnLoM8Eoh0ZRkq6xFA920=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WstSw2k3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RCYDeT0w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WstSw2k3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RCYDeT0w"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615EDIKo890638
	for <linux-sound@vger.kernel.org>; Thu, 5 Feb 2026 17:14:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WhVePPPT+SN
	r/7D2LWKoUshhH2y0lkEE57VXfglAsco=; b=WstSw2k3qVqbsDmyfc3XQMJE30O
	eKRUT6op5W/aIvPFhuFYlWL2PIvq3tNcpdA4JiEpt7+luT+fkgn+8oR3bEwh7xDN
	CSdUXJNZW4uXIWDIafcbYxmDnq522IrYw0347s1G7abEReZJJoXuRfWcmBNLtmU7
	nn4kjyRnG9EVAUOFP3fNpB2I1cYfw6050R8xHkCltUh4056EiU6nrugwakHUgX+b
	YAZRP0mmcc+FEM+fizga5fVdgjq9lPbhNdDrDxtKiyZf0v9LItsxNL1UNAaq2OI9
	SRkSPNm/yv0PD/Hk7zdXGV6Df7lr3reKhh7v6AlHsQ1iN2r6djlY9+19Aqg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4prx9vhx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 05 Feb 2026 17:14:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8bb9f029f31so425710485a.2
        for <linux-sound@vger.kernel.org>; Thu, 05 Feb 2026 09:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770311661; x=1770916461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WhVePPPT+SNr/7D2LWKoUshhH2y0lkEE57VXfglAsco=;
        b=RCYDeT0wrbtsulB0fS/dNVMkcxSqmB40SsNIJf2t/Mo5p78gQqCznS93e15ty12um/
         8Pg8TXxoy/kHCPAFt1uXnrth1iEi6gts/U15n9jasqkayEnNigKQVS0Edc0BmgdfU6tv
         Gk3QGNx9JsEc25kgh0ULiGy8eUJ05aX4bEYgwt//L2vTS8t+S48te1RFYzxNCox4ujAn
         g2R8765Zaibzqo0mFrkD5kXKWD8I5u8xgVaJR8AvJUVM4HF6sOk83xTkrby9ZdOcL29I
         KYgQVDETtOv/pD72F1ggC7XTt+7baZZ5Xcxk2Zkd99z3yBvHQ3Liwvfa9PsGN4WUGWlf
         JvRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770311661; x=1770916461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WhVePPPT+SNr/7D2LWKoUshhH2y0lkEE57VXfglAsco=;
        b=n64K9lfujdtixfG5cNjiW72ed8Kg3DYzvbiuqx6okq4JBhc1N5HFLXtC9KWP9ImsU/
         Z79DcFLAXToaILDhEmzMYAQ6w3cpDlE/2ss6Eg97iZ8uGQbJuPOOA5HVkDtio6rqEmhS
         mbK1QyiwQvi2ytXbuZefqK8sBAO/el1OIverWUoQDz6yJd8ZQGHvU6GtTc65p0Nvj7dN
         EUiiFfg52i/X3z7i9EqDWZ658ETuDFEfg9MJlTIwby3dh9PKCFcXTdToXELIYMqJv8um
         JvWUSEuIxVA/dAAfa/LNQZ9Jf1GCpsUoWiU30OqgFxsQLWdLETQL8L4QSOr60z+FZgJ2
         0fHg==
X-Forwarded-Encrypted: i=1; AJvYcCXH11AapwvA3TYUFmPfX6EQb+ca6nLiT+r8IOibJ+5bA32GNQzZ/Btpk5mWc5RxTQAS0E+xlD/i7dLoEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsiHxTHxjOHppPTd3JHdvE9rl8zgSDCYws2gw723OFD7gh/HGD
	IBJag0rmJgk45hhhND9i+jiW7HXPQ7X8qbzelMIGSLVnrgzpLMFPVV8lYUsYNiIo2lWKrxCV097
	Jn2zfyCsC0XhVxJW9JBYcoeeRqIgb6eX/+tPP20+79QpBZgyI42OUB+/KEo2kLN+C/A==
X-Gm-Gg: AZuq6aLIvUaFje/qYfc2cJIcoOqw2nh5WsZDdCwuRVqrGG5l1/j0AVUhFdYvJw/DCCJ
	Np1re8GWgXeCr/+wPIdnJrXcwdlwfIPFsN93I1Nb1OMogIg+Ge6BkXNPNiTVmh6QIG2Z0Zgirj9
	IK43pR/dTdXodwtob0n0aZmhqcLKeRpN5ZC3YLAszVbN+zQ1ErNa68pCK4QnYMCFho39l4wGjvB
	sARn+MO1i9mdhQ3k1f3tyMHgAJghCFwvwqI20vQKKElgcpm5p7HZq3OAJnMhghK/+/MhY/Y4Kn/
	Dj0srnjEc9qglv/oP9+ebviwnf3y0Ps9wZba+HU5nDO5AT2ypTgilVZjKY85bea3n4wleLk47lI
	otyKK/wOdHYlP/e4mo20YOc04RIyqyMUzQVw6Ju1w2Xk=
X-Received: by 2002:a05:620a:691a:b0:8ca:450f:c389 with SMTP id af79cd13be357-8ca450fc3bamr291868485a.62.1770311660832;
        Thu, 05 Feb 2026 09:14:20 -0800 (PST)
X-Received: by 2002:a05:620a:691a:b0:8ca:450f:c389 with SMTP id af79cd13be357-8ca450fc3bamr291865085a.62.1770311660385;
        Thu, 05 Feb 2026 09:14:20 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43618057f87sm14802849f8f.21.2026.02.05.09.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 09:14:19 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
        cnor+dt@kernel.org, srini@kernel.org, perex@perex.cz, tiwai@suse.com,
        alexey.klimov@linaro.org, mohammad.rafi.shaik@oss.qualcomm.com,
        quic_wcheng@quicinc.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 04/10] ASoC: qcom: qdapm-lpass-dai: correct the error message
Date: Thu,  5 Feb 2026 12:14:05 -0500
Message-ID: <20260205171411.34908-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260205171411.34908-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260205171411.34908-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: RkIa-mHPhgVRUr3e_ZAzGe4Z4Ok0gcPI
X-Proofpoint-ORIG-GUID: RkIa-mHPhgVRUr3e_ZAzGe4Z4Ok0gcPI
X-Authority-Analysis: v=2.4 cv=eLkeTXp1 c=1 sm=1 tr=0 ts=6984cfed cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=QkacBUY9L2qTTJrEq-kA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDEzMCBTYWx0ZWRfXy81uZYNbczir
 SSs4Fks2yj2uWGRb0lI7i/c4ndxkAyLLKSllckmE8h5UpC60gMPU2nPdBxYBrGLUUmgpBn/AzMq
 ZDUpbKKeDqBnGNqP1/0rN5Mg8j811pKkcO8L1beWaUoj18zENQgnk5vPswWXh1ce8UwERBidjvi
 QQ+rN1fghp4Bl+fEd0pxm8h37vujgxlayiL9UZbeIRJq514aTsqYKPzwfFwRZJ8FQg+NpSsXQPb
 4fQDON72ybxlzMc+tW84FmZ90NwIKQ04++L4aBz3gc62gHKvSqKzopeiKq20d124gtQU/JZKDZ3
 oFW9KYUz7QArHumncGLs/v9mDLI4jD8YGXdHTF+tGQPkepCeYBdyU0Q04jOFEs2KNjQALNsPTZU
 AF9RHoF64RED7oxPj1VbHFcnayB1wEewkMIF9S+BkbvmgqZI8CeRGmEHW9WyVrqRCT5VKtSW/IE
 3oSL/JPHGQIdV6m6ebQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_04,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050130

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

