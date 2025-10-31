Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CE234844C
	for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 11:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761911315; cv=none; b=fmTVIU9bnxwA1Qe5Kyc7tb/nZSR0RZdXj6YHc4p2ZaKHbRVatou6yx6em+40Rfw4TiOxkWJJLk04CPpUTDE5ELk5KFwXmGnqiQwZz8goXax6FVATZC9I13ZiaFu0Jtnn2rIbkm+EmP56FbXHPi/F+nnbChcDM/16fyUhytqaf9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761911315; c=relaxed/simple;
	bh=Af1tMCfkDQ1lQfRQaKUsYRHlEVRdIg23yVqZC+J8rAU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mVvN5muXoplX3taPug7XTTTxZ63iRCpDljyaDkiFHfc/2RrVb3yr8FcrgGR7TanYWS19lmY+3t0LXJ7uWsQslBhQMK4ugdfBXX0Nu2Y43Gc0eNdO0dJMLIHEJgByIBQQ72SOs7YGcUAXTaqJ4wabHLSVqHNP9mVOLJUnpiGedG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O86p9YC0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YcYYIaUK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O86p9YC0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YcYYIaUK"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V3IZ9q102826
	for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 11:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4E/WBBGg3Ro
	41UM204RDH20wPcFyThixToHapyaAtXQ=; b=O86p9YC0yydZYc1gQ4KVQHVEx+B
	5iWNJgUTwstuR0RcAo03uXagPh218nIJGfTAXznbyBLqY27IB2GrEr33GvC0nVYM
	FZsrtXr5+ywg7GZE964OuijP/TkSy6OBda68QSccxNQKDphHyDpM6FHXFYRFfh4r
	GGOQRe35Sq1iRI10vDtKC0Zw/02sNRsCss8LeZl5L6bC5DyfJb8hGWTUif2qz4Kq
	qil9dS3/CZmP3sEdFG4TrToNblrJhpmfwCkTu2fpH5LKy9D3lnWmfiptKIOCfgtj
	WqbqzIXbE0dQUHwZtQSdj37tk/H8JB5hoZJP92AOgwKGhx2rb8kttwiZ6mw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4ahdk1fk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 11:48:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e8916e8d4aso96373021cf.2
        for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 04:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761911312; x=1762516112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4E/WBBGg3Ro41UM204RDH20wPcFyThixToHapyaAtXQ=;
        b=YcYYIaUKPLmretsRMDtRHMqA+bvUtap+t06yf6uz4JMp5+FDY8Jfoyh/Fg+raL9iVp
         HlnCwwmkDj/F1KwGZ0uPSECyFhnZlRSE00KtJtHClOgrTWV+WGE0NHdTbGeA9MniV1zg
         myOX0BlaHUUUcNh7FgfYXgL7cjzsPH5IpyakXhmbGI1jrZhjbZq6ABni+DOZGjE7CimX
         ehbccmdTU36jqoO7j/ralDbEvBL9/njTzDpMazxht5wYOqEf29UuNR9zS4QCi+8W0xC0
         EMYvnmR5ZW2WzlDp5lwTbcHjyr7q17/Xc8fu6Zq2k/NGeXfmYD/1xCVGfoP8J7W+i9C1
         kCGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761911312; x=1762516112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4E/WBBGg3Ro41UM204RDH20wPcFyThixToHapyaAtXQ=;
        b=ZAxnNjJDozOeV3nsm+rleQi5yyugyFzpC5wzfJScM4aOIMi8Un6YRVLRC39LE4UjPd
         jIrHRY/U+8ZBrmIAH3CmVzfcIe29rOSw1tfgODjJ4EKWreBCuFqPWj35qmnXjJws2dUe
         zNEOxOPGdJzqBB/OYqjVxk9vCfPdwWqFZ9nGx5dHsleS7losE/4z7fgosd8Xh9ejBYvb
         +8DcQ7kzgAJe4WBb17uejN4/OOuK5UC0a9tCN/6df6A2BJ85d874Ko6sBtXhRAnTXErs
         RHb7aru1wfmGPavBfuK5KIzrNrXG3ffGLFIGLMDDA1RD5TPHlJddSCvsm+MxHC6vxF7N
         Njnw==
X-Forwarded-Encrypted: i=1; AJvYcCXT/UHPRQ5Mcv5V6R21wtVoIJlfuZgnf/SNzhWa7wnB9mQtXpWirSMYXy3kmR1Csr4UNpAPWj2UKIQ+3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ6rBfVIASqfnvS1HSnYVPXNAjZ3o2lypP9ai4CYHr0crNuQ4D
	T60sHKyEi3acLEYsS2S1+bTUtq3ctdv0ed7XxasmZTsRmxQKqaKELzn9yoFv3Zb0ln8/A/SqxaW
	gf8jb+wChb2jzGgFs/cMWw95U1OVJo7iQCcH0pSAzYY5nMyfyBn8RBaJ2odZsiqtp0g==
X-Gm-Gg: ASbGncuXSD/Qah/2o+/fbsGOPkoeaWSIsAFonxAFtd402snlDF+jAUG7Ngt0BmAUk/7
	1AP5xh3Rjibz4pBWIOdt0XeftslB5FxvkOsUGV2wMTP0vRreGBfirvNXP8xT7u/q0Vm55qWaaKp
	57afLBK9Brl/43R923ynNLFm/1N79Eek6/MrQs9gDq3diE4iTmHrrbPyAyutL6A8DLsN/6U3g61
	tYS0I+W9XBIlSCJFLUGr7/pqkxuf3f22gnDxv2zY6viPpv+aVblvX+Kf2pBgrwbPBWCE8ksMMNA
	6E2wYSvHtb8oUismZKcv/7y6iLZ5wAIEAi3HweSMxaBDpdKxcndwUYNXnXI0eaBJzoNqkuhU/x5
	cB/fS5XWV3cjY
X-Received: by 2002:a05:622a:1495:b0:4e8:9140:f3c8 with SMTP id d75a77b69052e-4ed30f8905fmr36356871cf.53.1761911312599;
        Fri, 31 Oct 2025 04:48:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDChzCSezmrewUSkYzqXWcdMnKFB4ONqHBKyhQ6cV/ocS06pTYFwWKhXF7J4KIgeDRzOT0CA==
X-Received: by 2002:a05:622a:1495:b0:4e8:9140:f3c8 with SMTP id d75a77b69052e-4ed30f8905fmr36356451cf.53.1761911312068;
        Fri, 31 Oct 2025 04:48:32 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47728aa915asm86831165e9.16.2025.10.31.04.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 04:48:31 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, broonie@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, alexey.klimov@linaro.org,
        konradybcio@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 5/6] ASoC: codecs: lpass-va-macro: add SM6115 compatible
Date: Fri, 31 Oct 2025 11:47:51 +0000
Message-ID: <20251031114752.572270-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251031114752.572270-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251031114752.572270-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDEwNiBTYWx0ZWRfX4EhgJONTJ9V1
 kOmgBHr1jsz9vcaeyBjeiuZf8B94SEQxjzqfd4EnJscaZs8sy8BH3ikh1i1qqoJnwjm+YV9sZEw
 Hx4T0ztPS4caglUq0Aly5V7XW3pUMe1ti6hozUOTO48quen6aUF/FW8XczIgBuOkWfmJp/mri4/
 6zqjI7vBFb/8tqwyqpRM/or7e6hrLuxGgjWKOD7InTijKvAe5tu2qRk84mWa9c3JVweM/i9PfA/
 b9QjZu9AHvMIXAubuyG/1MTMziHxCLJ7jZCWdjSauhBLAobRi1ReOm47oXX+JxRbl0J+KlmAWr9
 6XXarGcWcV9hKCopPew8f8bBlNGMk5/wEOAkeF1BjurV0MqwpzCPDPFaDsRjRnrvv/t7EaDAQ+2
 4uzqYUkkGN5tymDlEon2O09R3GQqJA==
X-Proofpoint-GUID: 2KbOT323U-rh518KQJjdJ-5Hm6S0Vl9h
X-Authority-Analysis: v=2.4 cv=TsnrRTXh c=1 sm=1 tr=0 ts=6904a211 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=sAbSznBxNPymwqveVGQA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 2KbOT323U-rh518KQJjdJ-5Hm6S0Vl9h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510310106

SM6115 does not have "macro" clock, so its bindings differ with existing
SoC support in va-macro. So add dedicated compatible in both driver and
dt-bindings to be able to address that difference.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-va-macro.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index fbe5ebeeaa80..902abc9843fa 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -1759,6 +1759,7 @@ static const struct dev_pm_ops va_macro_pm_ops = {
 
 static const struct of_device_id va_macro_dt_match[] = {
 	{ .compatible = "qcom,sc7280-lpass-va-macro", .data = &sm8250_va_data },
+	{ .compatible = "qcom,sm6115-lpass-va-macro", .data = &sm8450_va_data },
 	{ .compatible = "qcom,sm8250-lpass-va-macro", .data = &sm8250_va_data },
 	{ .compatible = "qcom,sm8450-lpass-va-macro", .data = &sm8450_va_data },
 	{ .compatible = "qcom,sm8550-lpass-va-macro", .data = &sm8550_va_data },
-- 
2.51.0

