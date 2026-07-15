Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6677444C66A
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 11:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784116543; cv=none; b=jNp3lLEGbhONj1VgiOhz3n0vVziD5sG/E5RkYmqZucTBXevRzM0DsGGLH2ynV3eXeEdQsrT3tPea8lYLZgJ4OCeCiubF85LLWJQ5UntODdfIOGyYopDBkcxtb+cMUiRU3BMzfzMBFeqgoFgHO9fuC53w4/BONfdOQyNriMihPcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784116543; c=relaxed/simple;
	bh=4AQ54cmWPnFr+3twy3tWFaNtgWbMsdIwWCHjq4Tfy8o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r5dI89W0MytQBCK6yGmX4dz0kBijOOt1yHFlEv2AOFEvTSdkm1jV6A2jxhrnKLOI/93TZ2t45Vj1+CQYM48qFtEPF/Z6KbCddASTbW2Hj80D/83JZLFrsk29+b/GbZ97I3iXILr5xmRImnUrHsH+WpIITGXvPv+utTVI7sAWfCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iJxxydr4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d1p5T6dA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iJxxydr4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d1p5T6dA"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBcruw523553
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 11:55:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yofOFhOUZ2WUf0mVwglBwOGTWyTf8BugNAcaGQjT+eA=; b=iJxxydr4g2n8GI1W
	/L1dnOmQJ5XK0MOqkPemV1kPlPlgkZ5mqObSbGD8oE6fdQQPUv6wcl7zMgwCGXXh
	4gN3pZMnZjatSuRqMI8pp2az50cLbA6tCK05AKzEDuqOpD6x2czdD9xG0CDiNMbE
	Ad0mzfRsX1OFLgRw05eSAV2XVC9g8mjatDq5daa1RfX+FMcSefFUxJWbDsxjX3B4
	le5wpgFf+RfxIYhw4yo55KFwWho99fEMRlnrv7Da5XOErhYVSB3NUfJoM46pkwsd
	jzXPT4C9Ji0gHzzUEm/pa57H18WINsC0ALgkXECP3ynu9QimzTUBsionGPGkNhtF
	1NWPUg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe68wrx9y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 11:55:40 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-380a638fb5bso2517857a91.0
        for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 04:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784116540; x=1784721340; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yofOFhOUZ2WUf0mVwglBwOGTWyTf8BugNAcaGQjT+eA=;
        b=d1p5T6dAPWOibE4Voj5s/7cFy5XvAYeEP9pOpgmagRxS0Ugx1bZrHkqRwVrXbi2zZg
         I3nufVzdKLq+Yh1S9uetNYjlrmvcViIppZBfiVbt5l1KdNwUzoi4FEIJcqutpVbkX1ZL
         YiuvVdwtkBQv/gp5jFxBQnKLo9sJsA2lEdVtJ5Kh+7Hfed5xSwoPwEE/skx1R4NcbkF1
         6D8U5RLJg18FVmGiONLa3Fk6VoBlfHW0aCdCuvpXz5M4AkZft3kd2t1l2i63r56vmV0M
         xIBrRo9Ffr3KPyy0fI/oNdRdIOZSqMCztg2ekVRiDZK1nZjMdNpPUb1mHqvOD4Wr4z5r
         vRpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784116540; x=1784721340;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yofOFhOUZ2WUf0mVwglBwOGTWyTf8BugNAcaGQjT+eA=;
        b=ftFnbIHb+3BPup9vzucMdwi9ysYC6kiFO5rKwacN3SPZWahISmOxm7AD5jAJbGoHDZ
         xkObG32HpGKZJyIKRDusiJCirbJlEoD8RHJIxLtlS5XSSOXtZoKHiJfm2jTUor4U3BUi
         GO7/qlEEmiAYofEMe+DVpCcrk80/HvB3KKKTXXIJkIc7xSguel6M5F22VUyVRWk2Havf
         tbqfJ2Wf85dl1QLKhV9j1CEgJo2maIiB18BGQfr6PdaYHt0VJ3o9KdGVqZMjzGSKXYqU
         DcaQRgnskEtn+4Hc4ZQXFLy6P6KHbETV2/HwqgRuQc7MY3uYN8RVnxbxRYCVHb4+XLE8
         xqxA==
X-Gm-Message-State: AOJu0Yzgk+3oBmv4T5XofHNutQPifamlSxUUOlxM2KqMo2xKY7YAxYgt
	UeuYTf7NrDyoNgx8xRntXy5sCQIYuadsNDSmn0MRw2yCBmCoroN5QbefUDQqsn21pnU+5A+VsJu
	Bx+5KQvxlgwBtFiaZs7Ju9a0ivq0RLIkkOWU6TI+FKjhQHcP1xd+v7i2a6I1Auv10YQ==
X-Gm-Gg: AfdE7cle3QDNYIDuhyoCtGvwJS8yY6iowioFHjOxgxeuSGcGVQ1lCJtNOo4ELfEThnw
	IRGVAEOVMFp48Kl7PvN2cndFFnIb65Vqm201ZEeAZeye21/GrNVHSKG9krf4LZgt3qvP/QISQ0Q
	w4lqLAPhy+Jk8maGSW7ldq5p12kiwT62SDHU42eyMf3i83M/dhZjO8GOZ9p3NXQ+w1w75UYmhMm
	mnNCXw41UzMMJaz7ZZFtKV2G3R+b2fF1u9P+wUgyf8Q7pusS8wO9Qg0B6YMx2UNpU/JMYmu93z1
	RapqJ97NWhhE25jW5uMS45YwxTVtVcTf5tbDyrHq61bK8XQciOsmFaJukz+BUEfRnxRcIUrx3/H
	QkYxAy+ViX/GzfWKgbqRfiGTepW99YywzMAPAmLM=
X-Received: by 2002:a17:90b:3ec7:b0:37f:464d:ea38 with SMTP id 98e67ed59e1d1-38dc72a4995mr14964172a91.0.1784116540053;
        Wed, 15 Jul 2026 04:55:40 -0700 (PDT)
X-Received: by 2002:a17:90b:3ec7:b0:37f:464d:ea38 with SMTP id 98e67ed59e1d1-38dc72a4995mr14964151a91.0.1784116539633;
        Wed, 15 Jul 2026 04:55:39 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e5326c0sm870683eec.11.2026.07.15.04.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:55:39 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 17:25:13 +0530
Subject: [PATCH v2 1/2] ASoC: codecs: lpass-wsa-macro: check clk_set_rate()
 return value
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-xo-sd-codec-wsa-va-clk-set-rate-v2-1-16ca64c2b929@oss.qualcomm.com>
References: <20260715-xo-sd-codec-wsa-va-clk-set-rate-v2-0-16ca64c2b929@oss.qualcomm.com>
In-Reply-To: <20260715-xo-sd-codec-wsa-va-clk-set-rate-v2-0-16ca64c2b929@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-ORIG-GUID: MNkvMdG_KvYBbJQ0CSlwUs8-TJlZ0B9c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDExOCBTYWx0ZWRfX1cuJIQJYzsRo
 CUsZQvEqAzY4pagF48feiar2n9NX/2nuQmFYY4Qww+uf6NQGj2B2TyYLBYNc3HB4XmtvyvCGkBZ
 w+mrQmaslzyxvA5AtUsPeRWIlUEX0hvpKn8+d8xtDkmnLGoxnttP6kTalV2DSxlkHhyFufhJDhc
 jFeVMkmFGxXQ02N5q5Rl4w4VwySLTJDgrCiKES7n1qDUjVDAoW3ecCk62ryPZo5AMNnV0jcj+T6
 E4ImRNl+uJoxHNXMWXP7j7il8l3KlYBQa3Cx9ObFsZKCbQHFS2rmQfxKUylG8uEy1TYyGPZW2H0
 koBzQtl3FqTdHaHjj2zYlbKKuI5YeQr/Vb5IyoY7Z49wcLX/mQHeLLw0Q3Hhogvbgp8CYupl95K
 PuZaH1kpPrHkOXPoAU3ulh/Wa7SKgYOhXGVfj4XYbLmMjblgS4V2SBMzBfE/crZqyPfRJ9fQPgf
 VACvsn0qQsNP9CS6AMQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDExOCBTYWx0ZWRfXzEix9/l+vZiU
 MpjGP4+BfroAFYURptnMZtwN4K3mV0Zltn4ng4D8uZCdDWinQXl/nMPYMlp9hZcMClvH8Hy09wL
 nA/DnAUER7eOwx9NxLS1Qk2U2cGALtk=
X-Authority-Analysis: v=2.4 cv=LbgMLDfi c=1 sm=1 tr=0 ts=6a57753c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=bBduwNICHDKIrEYp1ZQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: MNkvMdG_KvYBbJQ0CSlwUs8-TJlZ0B9c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150118

clk_set_rate() returns 0 on success or a negative errno on failure but
the WSA macro probe function is ignoring it. Check the return value and
bail out of probe on failure.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-wsa-macro.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index f511816aa4a0..fc9e0a37c042 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -2773,8 +2773,13 @@ static int wsa_macro_probe(struct platform_device *pdev)
 	wsa->dev = dev;
 
 	/* set MCLK and NPL rates */
-	clk_set_rate(wsa->mclk, WSA_MACRO_MCLK_FREQ);
-	clk_set_rate(wsa->npl, WSA_MACRO_MCLK_FREQ);
+	ret = clk_set_rate(wsa->mclk, WSA_MACRO_MCLK_FREQ);
+	if (ret)
+		return ret;
+
+	ret = clk_set_rate(wsa->npl, WSA_MACRO_MCLK_FREQ);
+	if (ret)
+		return ret;
 
 	ret = devm_pm_clk_create(dev);
 	if (ret)

-- 
2.34.1

