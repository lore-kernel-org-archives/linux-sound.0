Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFA034403D
	for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 12:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761912456; cv=none; b=bU1p6VIrefyI5zLkCGNd1iJBhdXHAUaIlxqMtVa/FtAunz6S2NNvGxmQ6qHUWvwxjr0J6p8O0C+4+SSMlOAlhEXMyv+CK7KyYXJrRfVkth1n0AEs3SgRgQ6UP8z5Bcjl3yB/BWUCuX4m1JSHe36q/hCyre7X66UGlqjWaqNh4Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761912456; c=relaxed/simple;
	bh=FBHTA+kR2fbsMsa/SrJEtQSqf/pZXq187Gm8uu9urMc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i/4+p2LXVHavCkzi3Fgpq8NgRWfZFF6OoVsXzfD2ivetfEjtHsEmcIAjIHZ/A7A3QXYubD+ArhGEIC+9P6SrB3Eykb/NmqUbLIwRq+x59B7bcTv1QlGa4OlWLrY5AgcPqErYuOvjhEwu2cT01SrwVDTpf8QYAnuWLT905hVZQaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fSdKXISG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YT8qa4ZK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fSdKXISG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YT8qa4ZK"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59VA3qk32558892
	for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 12:07:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=4032bjOkzCR7p70VNAqkoxOuXsJLBApNSv9
	jSTqGdeI=; b=fSdKXISGFb51HUKLJs7JReOl4+DP6ySMFtD8dxrCiwqaW5ImG+f
	BmohCnrnQtRctcsIf8luHV+SBB6W/LIwHRU8zVsFg5OXiGYGfuD3sbcuQTPSLTtY
	dcCmVoZg/Hop7xNEcHIYUBHOXIdl2aRSmxR8FB6eO0czuGUqGn00j4EPnkzogdUf
	H7eMitzzbVzWqmvkecrvDRjie3rSsqv2HsaoW5u7f0FYTy/JQPtbBg0XeEe9s5+h
	l2SVdQXdtJ20kQd/2/UHL81QFBf9h8AB/q9LO7obCXhpu/IdYNWCsGC1nUDV1ibu
	CMUdYjuQ+3xrZ4LkXx85AQqLmBhvm3MfOEw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4u1gra1s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 12:07:33 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-554e68b14cbso933449e0c.3
        for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 05:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761912453; x=1762517253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4032bjOkzCR7p70VNAqkoxOuXsJLBApNSv9jSTqGdeI=;
        b=YT8qa4ZKck+WGZpnQoxOyOcL0EHKjt/tPH5feZz9qL6+lXV6kRRhx/D9aYNWFZpWaB
         iMGD7AFdemgiY8iY+A8wnKfQsV5DtYikRALuM268xXmAqUiJQnV14cryPqcCe9O7dwDr
         9aX79KbS7VfpkFnBqqjqTXgQRFIC7uMnTy1zlP30xXsZo0QJSMrVer8bV+Hd/d2u7HgA
         2UUTNEKOfDXwX3VqA9d8lZLArLM+iHWXSZ5/062f6CSbHe/ARbEOXq5Bo/vdw77mcokE
         ngf8mYsUToyDddt0a5hU8JHA7wt7IoB0qCWV3PmC1uiqmMOLVnCFirk4qeVECwv+xkHP
         F6aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761912453; x=1762517253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4032bjOkzCR7p70VNAqkoxOuXsJLBApNSv9jSTqGdeI=;
        b=sRod//zjZ/M+Nri+bcnBf1frTfhqgeXVEV5zgd4uVy0x8xHyWinvkIvLQhhgrT3XK9
         HV/hMXpl4au5tidVrWkWxc+0umna+6Hj9zedazg0htAQRzjp+3kJSZTBOb+2YCjp0Rc4
         CvjgqTkVzEPFZK6WdgZziDLoW9QxIeRz2A2JMKAwTEf/nm9FgSPQcC3+0b/KFC76SVFq
         pgiLrL093C24aUCdoN8XMVbYzgWpJ7DJBiBc20SYl61dDvoO13DccIZZn8R9RAdW/qNn
         0ySzzzxiOI0CM/9/EJQkemI2N08EzQkuM9xsIqwbGbK1yi62snyhZYxEtdMeCJjh8v3r
         rd1A==
X-Forwarded-Encrypted: i=1; AJvYcCWwaLwhzv32HA485cBWccy3h56DRZIw8wna5zK2mAaj892UGQ1tg3LVH2jfMfQU7raiziMZ6Mj1K2VTKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+oVx6ZTSDpNFVwnd6J4EHPnIMRHp4mNN1aw8vkNIPwjtaQn9r
	xAA9SzhtWdqxqBI1KBiFQNV5qygy2/G2BBVUE8agPON+xWluT1LjwcROITvUYVq2m7+yNJubvJ7
	NSIlkaHa3+rnsoI5MxHMMa6rhYQLSkr0kFBetHJ2T+lTCHUmUbgKI8LTuFmZxEYR00g==
X-Gm-Gg: ASbGncvOp2fUjwJBJW3lydZCrAfyY45q0sllUxMp4d/FniK4XjaorGRpfWRwsCnZa+z
	bDseaBrglTvXlAKc8eie4C9oYrgB0DX89nW7QEae+nUxEDxRC5+VE7zxRU3GQ2EF6E0V5+kFwQn
	sZy/KITW6T8KMokwQelaoQvSF3k7nnZINoa4umkexNxZBDmVEoAyHp+a2AASj9V3Oly8U1XBbxU
	mEHRIGj2cIrfulDJTJ1IVb19Af0uiVnOCeU64KPocOsRUArmbrhOld1yNNNDyMrhXsQg/WO0qMx
	1GD+Prc9AHQpljHBSDHMyiDhyLCzco9SDwb56c/ZuMdi+kTHnlCgq1Wsq67GnVLxz99VGhFfrmm
	TqqYj0bSs+iQx
X-Received: by 2002:a05:6122:3711:b0:556:745f:6a06 with SMTP id 71dfb90a1353d-5593e563b6dmr1087779e0c.10.1761912453077;
        Fri, 31 Oct 2025 05:07:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIcGE2eWLXSFTHonsnjJICwses9jJ9xucL5+zcIhg+h+3QNnE7/PCg9OINg4FnGuKQHFTSlg==
X-Received: by 2002:a05:6122:3711:b0:556:745f:6a06 with SMTP id 71dfb90a1353d-5593e563b6dmr1087747e0c.10.1761912452655;
        Fri, 31 Oct 2025 05:07:32 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4772fd280fbsm21273995e9.5.2025.10.31.05.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:07:32 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, broonie@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, alexey.klimov@linaro.org,
        konradybcio@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 0/6] ASoC: codecs: lpass-macro: complete sm6115 support
Date: Fri, 31 Oct 2025 12:06:57 +0000
Message-ID: <20251031120703.590201-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Lo+fC3dc c=1 sm=1 tr=0 ts=6904a685 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=XNMdb2pSUVPagnxhOkYA:9 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: E9QN3G4aOtZU83F9Pecw4caeB2vb0EyC
X-Proofpoint-GUID: E9QN3G4aOtZU83F9Pecw4caeB2vb0EyC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDEwOCBTYWx0ZWRfX6je1OzaFYkvP
 WIuiGG2vpBQaNx5jg+rMtQRq5V+IUOizgkpR8OxJMl7+NLAYDKgp05HYdhWPZEjwLQMwRBY44Gb
 j2JBjW4BGxLJ9iV4NUCTjJyN97hhqz1zdBrp6kHe8EiMdyamKKr7ZnOYDMSFnyxTMWva/Z3C6VU
 Lu+f9gqy+NFfoWaD0xdQlp66RHHTbYUvrV7BQ1H0ZApqAgbmJh00RgbvU0hFzeUKF/DDNaK2cTR
 yL2MW/fe8tCMI2z3auTa2DjeGZ7Jt7qINdKPFFeeoWWPoZlggpuRE6Dpwa39lC+MXc/W713XJsT
 xtq9W6eypUYSwMftUlNI67truU9iuiDG3PF3mIuFsCFsp6n+RdMbuIr8CU7bdlnhpxSbD8WE5+W
 u0c0xmhwg6n5GJRND0J8BBrVu2LlDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310108

This patch series fixes SM6115 lpass codec macro support and adding
missing dt-bindings to complete support for SM6115.

SM6115 lpass codec macro support is added partially and broken to some
extent, Fix this broken support and add complete lpass macro support for
this SoC.


Changes since v2:
	- fixed a wrong patch that was sent in v1.

Changes since v1:
	- cleaned up va-macro bindings for clock-names.
	- cleaned up va-macro codec driver to include soundwire reset
	  for sm6115
	- updated tx and rx codec driver and bindings to have a dedicated 
	compatible due to changes in number of clocks.

Srinivas Kandagatla (6):
  ASoC: codecs: lpass-tx-macro: fix SM6115 support
  ASoC: dt-bindings: qcom,lpass-rx-macro: Add sm6115 LPASS RX
  ASoC: dt-bindings: qcom,lpass-va-macro: re-arrange clock-names
  ASoC: dt-bindings: qcom,lpass-va-macro: Add sm6115 LPASS VA
  ASoC: codecs: lpass-va-macro: add SM6115 compatible
  ASoC: codecs: lpass-rx-macro: add SM6115 compatible

 .../bindings/sound/qcom,lpass-rx-macro.yaml   | 18 +++++++
 .../bindings/sound/qcom,lpass-va-macro.yaml   | 49 +++++++++++++------
 sound/soc/codecs/lpass-rx-macro.c             |  3 ++
 sound/soc/codecs/lpass-tx-macro.c             |  3 +-
 sound/soc/codecs/lpass-va-macro.c             |  1 +
 5 files changed, 59 insertions(+), 15 deletions(-)

-- 
2.51.0

