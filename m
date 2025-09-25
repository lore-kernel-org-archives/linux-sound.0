Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B9C1C5D57
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 00:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758758492; cv=none; b=XNbLbDb5aOsbVxsCC27zHbljapgBYjyAQ+4Hdpvn4f3b8iH7XgThaKhKf1TtrDSTvjdZs040UAE413+W3T1CgoppN90oHzAgDr5SzlHqT0gm0JOaK+Ybe8inZdUAIikF31uomwg4Dx3RFCdOt0AHKhrNZr/5g6kq6/UBYEiFJfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758758492; c=relaxed/simple;
	bh=wUjm9tiuEjm4WDKMtLaEVjupuwrzCUIqav7naVhiw54=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I6mknONMJog61XM/MJH386S/HjKBZg0qTKHY48SaP6J8EAnrV1QnPU3BWaVixrZlvU8EpIvmgZEQTfi+kcSgTPoW2AFxJEf3VcFEMYe7fvR0EIoDYlxGri+gNlE7OYE0H9dcWCFuAOrMjMynswFnzJqal3Fmt2civRDgV/xdkeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iUBilzg5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iUBilzg5"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCoZJP016452
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 00:01:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K+VNJSBTVMlxlPAe2fqelqrYwMmiJ5bopSAQ68gbNL4=; b=iUBilzg59EP6OYTr
	+nXBQ7d4JD08A9ShBno9C8B9WG4hf0zL6L9w52Jk9PWj57txMH7gBrkAKkba2N8M
	ROPvus/m+FpfOFFAcALRj4TIHzB5p5tIZZWWhYm7KLxKMW6QuyeZLS+mNpY9JIqa
	stDxsGHhawjUzwC4XFAFv4xXqlV0C5uVjOLiQmfLp90M2Gqr9kMYitlQULtkGvuB
	PU8VX7UAsNNVibpO697lAuVrJ/F3BgZZWHc/o78KKh2RIjQrlFyEH1Vpey3TXPk5
	e8kBWMrzZNM5voSowbKCHNe815ib1k3UXB80hG2hRzgX6sxFxau/fjNYtiCrjr8S
	olsjGA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3nyhwxn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 00:01:30 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-77f14f6a553so1373002b3a.1
        for <linux-sound@vger.kernel.org>; Wed, 24 Sep 2025 17:01:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758758489; x=1759363289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K+VNJSBTVMlxlPAe2fqelqrYwMmiJ5bopSAQ68gbNL4=;
        b=X+Hwprb7DV75547n20uK1Fz78COyLUq6LywxDQJBwMxg5Ru3AQYUecSR6na4mb2tQ9
         c1HmHU3Zd8SrKRzI4lQLcflu3claA0+gAXkEzxzyo2INTVOXWOtxPijbcd4xCb+zDiqV
         XADoA89c/9YvDA/tpmT3c4N924KiBxWD/1BbuaX35Zp+Zd47EbLkGzRD3sRQAlu31A18
         AWsOxt8y5JDNIgZhiWXYct2+tQ5wj0y5fIwaVxmH85GIvQUqguTmPClUjlaVeYEk88xi
         25qgBFDtWXVMRb7B4HltUfrLZETat6D17nBXK55Gr0+uBdmEdmlE5VVROGkDMuBxq49I
         BITQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDU7lMEhlJvwa6lOH+e/QIRYMcqfiFkjhyXyQPsby8sNlFrFbt2UGiV81TgcRunK7mLLzMSpzCaYL9gw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ7sMZU9ZLOX38LeionE5W7Nsrrs3kvr/P7myTMTyz1wqRA/sj
	l4bXUcL1SmZKcM3AC7FGE06T1eIA/IZaokBoWhnPw6nO2RvQN1JdQsymCe93AJg2HoPGdB5rC5m
	7hDdwfCOOgjxfS5hwn5fcrTgZaLk64NepiUscaJrW9JtdWudc3XN1SIjT7YnFAvMRIw==
X-Gm-Gg: ASbGncvd/pKI0dQFUKyKORZ96dUq3IWG12uaCvFZ/PmfOIPXYSHaemPTr95w8ua7t4f
	eojYkt8g2uuxa5ornz0MAwN4mHMB3kcR77wgwlO09vSijAp/l8PwCGzsWYfIoESsfb2/rYXuT+E
	JyyGUtnew3OUoBFXTMCm6im+Ota/IkVEwyChnOE0Wvv6boyG6vnO3KXeS0H+NMjdLfh0azll0Oq
	fRvWvGSYO/w3aIkOUPt3V0eyndMD99ionwYEpykofgqiybuWlWwh+05yldqR2qsmq2hYwJQk/hi
	nZZf0ScVRBrDS8fuIoH5iG87uqHD/Cr5boGAdphVp6XZupK2bruLuuqpd+HjkayRF6G7RrGWOct
	vFvzw9cXE2U/wqL4=
X-Received: by 2002:a05:6a20:9151:b0:240:1e4a:64cc with SMTP id adf61e73a8af0-2e9a4162879mr933807637.12.1758758489178;
        Wed, 24 Sep 2025 17:01:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeVc0LEM1JDvlKULdAll28E9OqkAmHpBcwknBmGejhHBznxK+9gemEW+VfwDBgDToKJcZJQA==
X-Received: by 2002:a05:6a20:9151:b0:240:1e4a:64cc with SMTP id adf61e73a8af0-2e9a4162879mr933742637.12.1758758488646;
        Wed, 24 Sep 2025 17:01:28 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c55a1bafsm423152a12.43.2025.09.24.17.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 17:01:28 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 17:01:17 -0700
Subject: [PATCH 3/5] ASoC: qcom: sc8280xp: Add support for Kaanapali
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-audio-v1-3-5afa926b567c@oss.qualcomm.com>
References: <20250924-knp-audio-v1-0-5afa926b567c@oss.qualcomm.com>
In-Reply-To: <20250924-knp-audio-v1-0-5afa926b567c@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rao Mandadapu <quic_srivasam@quicinc.com>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758758482; l=763;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=AGoAWCmgVcAO74JQoXvSUhPyLCFGBo7GIPrJwjsAmHg=;
 b=OWGKP048rWsxPP8OlddpC+6pb0UowE1EXcygO5YxeDAWbovUNlwPXlHNZmtYU24Rp2LhrI6QJ
 v+fmQcJW4/SBjG3dYBMgxRb/eqeRMjZwHOTvvqmwOpF8wi9jUNaK0hh
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=EuPSrTcA c=1 sm=1 tr=0 ts=68d4865a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=GNlvlv8D5CiX1CDg2F8A:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: DWWus8RUgy7iD5msvvcgWdNC0zA_OZYD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA5MCBTYWx0ZWRfX1Dk0rcjDL4Oy
 FOOdNa9RO4L5LoqLwbfQ7ecV/UE2kGDDwYzCd9ZU11kYJqEqTjTHIm4UMJoncHOD+pg1wyhDr1p
 KJtP/1uNPtznuU1LiaJVF9eu3Ya/49sgLwVQtPM4hBO3Fzmh9+i8bcjUPL8scsG2gpFaD7Mjuo4
 lSMl3rpF7vqk+JULSHldFJ+EI9KZZyQnrhqroTqQtduofM6RihUlekr0pZFFmkvt4hPUEzV89il
 ZHyMCb1GiDRDaIvdy1qI0mZSUAHNq2OcNrmwpuRrTvwy2Ic0Ddlt4weH7AusPJPkotgehM2U76e
 BIxmhe8sLpjz5M/D94nk95AAD7YDDXOfbbXY6Q/iNPUDZvmozK2iqI+38k2K+JtdaNRmK6BtAn0
 RIlFIkaK
X-Proofpoint-ORIG-GUID: DWWus8RUgy7iD5msvvcgWdNC0zA_OZYD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1011 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220090

From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

Add compatible for sound card on Qualcomm Kaanapali boards.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 288ccd7f8866..e231112175d9 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -198,6 +198,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{.compatible = "qcom,sm8550-sndcard", "sm8550"},
 	{.compatible = "qcom,sm8650-sndcard", "sm8650"},
 	{.compatible = "qcom,sm8750-sndcard", "sm8750"},
+	{.compatible = "qcom,kaanapali-sndcard", "kaanapali"},
 	{}
 };
 

-- 
2.25.1

