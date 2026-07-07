Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980073C1969
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 09:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783417433; cv=none; b=rBrmYBGzTPScPU6B9zx0WWhQenX7oiq/2Qbrf/uFhqtKy2GwNRBqOcsjDaZM4sYvHX1lAXqzPHmAirLG4UlNKbbSAWoaa9XYLqClXh16bDwb7hlUihBubj2Cz0jiAXnmPNwNVv+L60T0qnLtqj9eGogSJDwVYS3vRncfDQHuel8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783417433; c=relaxed/simple;
	bh=gvlfJ+GjIc8QbJcuGrmTB7YHNaI9OwwSuG3scOuw7Uw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xpm0mNAMVwC9PoLYKqv/KrqfAT8JFHJL53u46RVSIZtwnMqrqyZLlCaQPMZ6E/Te2FKGdbrtsRlp/ncPyVkMzzqkatzFIsH7H4HvsysQNlsZEaWFEnzrExBZV+VHGR1+psAY81dpIxCJ4+hU41CkR1vaEzRZcD2bxrpdgib3+FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TJuNgvCP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZCmEaj3n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TJuNgvCP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZCmEaj3n"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678DqrV3206049
	for <linux-sound@vger.kernel.org>; Tue, 7 Jul 2026 09:43:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XiCqGFPrKANfRZuEJahNsbH2lLBIkGTPF/XTZTnYXNE=; b=TJuNgvCP9ox7YyWf
	X42CImIRfLw3kY9Lbe59FPFvBFmErzknCC7Do8rrF502u02TV9zagcz7bG+Ep9+4
	LXMxDL3+vFUOGB7kdjeHrmvDGeD+kzWlLQw7Sz/6t+EXFO05qj2kZQY/ddMjjE2k
	kkPaYo9rmKWJvBboBpIKg5MFaFvZxMWmws6t1s3kPh3QGJEEtno+veVlEl1g82WG
	k6mpytfK/oLkrPqZkRELDw3FwXvT/xRx4RKrk1GRZCh1JSoGtd87HdoMd/X3j9U2
	p9baLmKP4i0jg5tWxtnX806T6YBgEb8390joWVwmnh9SoJY7SxJVq55W/223X9kL
	aJzI+A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8fdw3pm0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 07 Jul 2026 09:43:50 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc6dd43737so65284515ad.2
        for <linux-sound@vger.kernel.org>; Tue, 07 Jul 2026 02:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783417430; x=1784022230; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XiCqGFPrKANfRZuEJahNsbH2lLBIkGTPF/XTZTnYXNE=;
        b=ZCmEaj3nBKdjNvqKJaJjmTDwkGWWuRi7CfDRIV+y/5R3UP7swN71+c3BjnK/BazRkU
         FyKKSd7NBaJ18TLccmFgLmGrP0vqdePUtFPSUONOFoN8W5OAKibrTJ82nAow7o6IGuqq
         uVtpncoiw0UJSN/G972HFc6Gqe8RDXMxQlhP3PmBQVAva+8XljcXMh5e0Ap5GBlrK3MS
         XSbuB3eV+3meJxiAni1hqOhp8DweNiJRBbMDuDUSzJbwbs/ql4k4EsvJVclRiyA9hzGz
         i/KH/0MvSSz8a+1RZZ24uuk+Rte9vR4JL+ZDEn4Jnp2LnAO7WZOW3bXINcWEHIIGYtuN
         SBxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783417430; x=1784022230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XiCqGFPrKANfRZuEJahNsbH2lLBIkGTPF/XTZTnYXNE=;
        b=dzVDkJuoBdLjyBZiGC4EN7AwDqCwC905qq1QFDndlclTOTUzNP7nAjVqqFMb93sg27
         BVKM4hViwcCFuQ84DHbqcvUq27E6ZWQmKLQu5PCDLBtgb00qWhFaO5Ul9MWIONDl6711
         W1oqrWLGfSHRrRlHrTZRKqFr9xU9GL3yIyDrI+j6nKFMt6zSGT73hTxhPfZKoTdH2Pgr
         4STLczsU0w9NzlYEfFEYDkzhzflLCZtgG3/DCKFDihXEzBqc013XBy7Xn8UwlU8aZNGT
         h/DriEpGyOvqukkXukpD6yc4KeCr1qYfM4uHPLjP+1lpKwY+XAnmxjTm66JaxPOHvFa9
         mCzw==
X-Gm-Message-State: AOJu0Yw3DaE1aG6/Okmj3DUwHzbOtWxmGFY4cgfQDnw1sGSNU7s+Q6RL
	0RIORp2MY5tXW/XtKZdYR3jpFdFivq+2Gy7uaFRiXIjooFxpZNVeJm/bBeZY3E9db+tvm7sFMzt
	ZyKog117vAa/DfgQxZ0I+U9BACBu6qiIHWZBTaFHCor6n85ACci7pD6yerp3xp2srgQ==
X-Gm-Gg: AfdE7cm8M03WZcVBf9eYIcLz9TZQxYwLspevEB1GmRqnXyFUTXwPwNxJqNdIlmZpjmn
	m5RpANGPd0LrQ9S969DTfnteZ3Iy/v4Thiermv8YaJz60JpKKoK9mFlT8YzYjY+TbzyRqXN1Ykz
	K+XXBHiN1lFOVOfs1/6HouiGxu3tNw4jazSXFJ4GmhwfSBeITE8XfKX9cGVfPIUOwB1yZFkLSOi
	IfFsh9Qz5puHYPtqyv8/yuGQ9MP/DVYHYRQqcOcrgijUpEfiyltmjXSFE0B2wMGQ8UAfWN+FMXa
	XK9rh805gpd5LHn1EoiPrcNt2zaRBFPq8KfAzmsxoTPBOvHMqccg7q5KgZmLxlPfF6seW3o5Qlz
	//UxGMCPEoN7TOZvWgeAZir97rXHKoLw8QLJsJNM=
X-Received: by 2002:a17:902:d54d:b0:2ca:304:f93e with SMTP id d9443c01a7336-2ccbf07b157mr47459705ad.22.1783417430249;
        Tue, 07 Jul 2026 02:43:50 -0700 (PDT)
X-Received: by 2002:a17:902:d54d:b0:2ca:304:f93e with SMTP id d9443c01a7336-2ccbf07b157mr47459275ad.22.1783417429771;
        Tue, 07 Jul 2026 02:43:49 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bdddsm8422075ad.77.2026.07.07.02.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 02:43:49 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 15:13:13 +0530
Subject: [PATCH v2 3/3] ASoC: codecs: lpass-{tx,rx}-macro: check
 clk_set_rate() return value
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-xo-sd-codec-tx-rx-v2-3-f61b4622f97f@oss.qualcomm.com>
References: <20260707-xo-sd-codec-tx-rx-v2-0-f61b4622f97f@oss.qualcomm.com>
In-Reply-To: <20260707-xo-sd-codec-tx-rx-v2-0-f61b4622f97f@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5NCBTYWx0ZWRfX+QHl/16n9qaC
 Zev7x6CL6Sf1bWX/CB7MNnkovdPEKtVDa9Zjr/XPLRaFuAx+WzwGgDwCZPsY71gxsBWRJjXsIn9
 5LTeut1/3HaxdO+ONr6nga/87hpvhNI=
X-Proofpoint-ORIG-GUID: zaT8fQPDRLI8YKPP64hI8secAJok0Ip3
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4cca56 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=aH8E-B_xiLpXBELwRnYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5NCBTYWx0ZWRfX1/1NHApyNHKo
 ++ZjPkpyrB6Qr7qglEZtYx9hWLgDpile08vR5PLUGQw5TPHZjPsUj2P2TJiAwKQzfA8o+/+ndth
 oD9yEVUfg084EdsYny59vDLLNoZZr1mUPi3UuSzX7s3DEBrQE2nQxgpwIcOCnl7a404u0fT476B
 bjZRMpyU1KIlQzZnLhkYgrbQQ8ELZJADVWLvcFDI19XxpHVh47d0s3VTfN5DlW6ql8LKyIPyXM4
 yCDGE/DZy3X2qBRv5CFBpVZfgyCGdeEHc68tNdy5TL/MvRayq7LDLyeM314GCZZf2NIRKPDisiv
 T2JCXgZqQ67ti84ZN88tNaslFj2JixBuFOorS6Ek4kg8fTFxYq+sPSBHxF4Wedj5m6UggnlMaXX
 hpZzOKZB8hQBLolxi6lQCVc1XQqjL+DSn8a48yzlcW0NdZUGarEg3K7KPOnoavoW8q7PcYmMKZw
 rmQ/mZRCNiyIWfsWlrQ==
X-Proofpoint-GUID: zaT8fQPDRLI8YKPP64hI8secAJok0Ip3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070094

clk_set_rate() returns 0 on success or a negative errno on failure but
the TX and RX macro probe functions were ignoring it. Check the return
value and bail out of probe on failure.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-rx-macro.c | 9 +++++++--
 sound/soc/codecs/lpass-tx-macro.c | 9 +++++++--
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 927f75050c0f..388cebf461a3 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3863,8 +3863,13 @@ static int rx_macro_probe(struct platform_device *pdev)
 	rx->dev = dev;
 
 	/* set MCLK and NPL rates */
-	clk_set_rate(rx->mclk, MCLK_FREQ);
-	clk_set_rate(rx->npl, MCLK_FREQ);
+	ret = clk_set_rate(rx->mclk, MCLK_FREQ);
+	if (ret)
+		return ret;
+
+	ret = clk_set_rate(rx->npl, MCLK_FREQ);
+	if (ret)
+		return ret;
 
 	ret = devm_pm_clk_create(dev);
 	if (ret)
diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index fc073a556fb5..b56605639a24 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -2319,8 +2319,13 @@ static int tx_macro_probe(struct platform_device *pdev)
 	tx->active_decimator[TX_MACRO_AIF3_CAP] = -1;
 
 	/* set MCLK and NPL rates */
-	clk_set_rate(tx->mclk, MCLK_FREQ);
-	clk_set_rate(tx->npl, MCLK_FREQ);
+	ret = clk_set_rate(tx->mclk, MCLK_FREQ);
+	if (ret)
+		goto err;
+
+	ret = clk_set_rate(tx->npl, MCLK_FREQ);
+	if (ret)
+		goto err;
 
 	ret = devm_pm_clk_create(dev);
 	if (ret)

-- 
2.34.1

