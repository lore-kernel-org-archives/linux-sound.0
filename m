Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77C61A9F83
	for <linux-sound@vger.kernel.org>; Thu, 16 Oct 2025 00:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760576053; cv=none; b=eKV7wC9mGoQkIrjE74zRCPuApY6YmDBABTcECLnkiM8g3ZdPva+BWyK3V0f82HdTs/a2U9UImGhwrCT80hsFEM+2bQVdp0caaq7rY7+iH4sC60PBRGX1IPCiH3KoVFlt++Xun2x+XnfnlozBqtijpMJfnsJoblK9k71vSSbGUjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760576053; c=relaxed/simple;
	bh=vH+a72EDIkUM9pwMm2kYQjHGx30x2K6yasIivY3TuA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=puSItoUsWtigTSTMCtPOovdIyydnf/x74vjiJHKo1ke2wDKP6BPJ9tgTRd6OI8itgE0Xs0t6QceRHiCqpMrV2vI9L++SkLRRDUNz8NEIkv2+h9QXrYk7EkHfLx0e/11ZQPtuINPlRdEwHVJ6odZ2gt0D/npRWuMhfUeuJm3gzQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pi/UMMuQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pi/UMMuQ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FJ5lRh017291
	for <linux-sound@vger.kernel.org>; Thu, 16 Oct 2025 00:54:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qxfHuhhNJmqQ3d2VcILRyWBJ
	+3hCsvxWDQcdnlZza2w=; b=Pi/UMMuQM0HH5U28kt3N3oS1QnqYS9nChIoRjx3X
	81IJc4RUt3O242I8hVDVSqBt2fUcWDCnjHGfznkpN0KIOvuXEbkAVO1U2fxOfzOu
	rZsuXVc50JxK3Asov3gyaqZOHY20nbstYGz3pRzBCf82DEoSPim8AvUuate4FJ0I
	MBqWJr1qDdZtQysP8JgU9/FXhQLKxtz9ardnMHcSE7YMifbXHfivXJ0g7hgSAnsH
	DnAb5lOWw+66vN5QbpwXuFcezlz3WOTjMi5xWVNnofoylmOOljSXHYMeZmxxa0/v
	AANJpogQdP/lpyRZ+AvOb/a2L6wMSA0KRIb9g7M2gC+LUg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrtbc5e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 16 Oct 2025 00:54:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-88ea6169a96so128946485a.2
        for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 17:54:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760576050; x=1761180850;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qxfHuhhNJmqQ3d2VcILRyWBJ+3hCsvxWDQcdnlZza2w=;
        b=dij4dCsTcP3dLhXEBQJXuqGuYHVcdSwf6ahZOE4dbEqmRYZWTmPdztRvqsaE9Wtck+
         qvsUceZk1a2efgkd/O4T4einYV8rDH29Yx2a3Q3ZE0ykrgxYPlzU/TEQygBEmQDf6XCx
         vPJObnqSfWkCRKp82DE6b7JdYLwff070uxgm1/tCZ9nbS8N5+XFORrfTXK6n/uHFRrYe
         bLLEp2Eysm56mabvOPIf+Yr3awydnCYSlU7tOiE0s8SrG+QGtm/WJqd1j8HuDx2M/XMO
         xdiHaPXWFAS8YsvJJRfz63PGSQNEPkcX1rTDI5+dWlOX6UH2/lqdSTLJYiurHMxkY0if
         hxmg==
X-Forwarded-Encrypted: i=1; AJvYcCUwjTLgtz4fwo3fnMQar4GDfWdVJSQHEqcYz45jzGXMZJuCKDMSWxVxHdO0KqHPlSTNvgVVnrViOzyklw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfdmHA7wPLKwbqrvSZTP6YueAgQ6zPVplxM4GmsodzclhDv5OV
	F6ZB3GbxrXBQ9qoOHwaX48PgrOleN9nCZyVIeYa55fjeWfD6Zn3Akp/egFTHDxgDp4KjnuCGY/9
	qYn17a2SUeWz9M7gfOgQUrpya/VYd09cE+mcQwEvJhP9vBQD4vffMZo9CV6LK5kNTFw==
X-Gm-Gg: ASbGncvKqIIoboarK3O1iZ1hX9bvx2l1ZhNOLr5SKmCBOmR7dyiMXG9MDXUXZYD+bSr
	t3uDDDO0Woh5/0C/HM5x4T+Vpsh95NeahYzLqGcreUVbR7hCdxIC0WnaCnWustMk+MksU9cXTzE
	OZiYQtePbFjBGaFqm6+tL9FQSQBHGMhSNmgBUqOWasaHDjZrtQ1h24KkcWlWu716d9lvsm0JYWw
	YqdHu70HWVoixgor3XxkB5pF+2lqT+zf6nMUN0Vi5MAYfqv/KqdwLzOU0Xo4Azx375oGM8s3BT9
	dM1I0k8W8INDAiysIlCfr/V0tcPbCt8B/0NPl+fLIh0Rr/UUuJK/8NdJsSb0mtdoYqma220tcuU
	1y8S8hrCACPjf3afW78hweeS06E8a7AyAiArYbfKy41LjoFmbU6q65Vyhx77c/LpBt2iQZ0Rwc4
	wHHtN5Y+tPNIc=
X-Received: by 2002:a05:620a:448b:b0:849:35:dbfa with SMTP id af79cd13be357-88353650dc5mr4012683985a.86.1760576049761;
        Wed, 15 Oct 2025 17:54:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGElMuGPAJN+DiUGo3XVaPROIJfyWOt2P2s41k10L760vcozXlWS2xA/eYrcc7Qr1TpeWYa+Q==
X-Received: by 2002:a05:620a:448b:b0:849:35:dbfa with SMTP id af79cd13be357-88353650dc5mr4012680885a.86.1760576049349;
        Wed, 15 Oct 2025 17:54:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59088581d51sm6672261e87.118.2025.10.15.17.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 17:54:07 -0700 (PDT)
Date: Thu, 16 Oct 2025 03:54:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: prasad.kumpatla@oss.qualcomm.com
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rao Mandadapu <quic_srivasam@quicinc.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: Re: [PATCH v3 5/5] ASoC: dt-bindings: qcom: Add Kaanapali LPASS
 macro codecs
Message-ID: <6nyqz5fsqyqgtsqk6xxm4iorzoelhkgnghm5xczh6iamvmdfpa@2vff2lk6sq7e>
References: <20251015-knp-audio-v2-v3-0-e0e3e4167d87@oss.qualcomm.com>
 <20251015-knp-audio-v2-v3-5-e0e3e4167d87@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015-knp-audio-v2-v3-5-e0e3e4167d87@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: U7H8c3VOp8D1wLRqGfWsyf8p4JVVO2Z4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfX+yc5sH6z8CL4
 useoUL02hXVH1u0vydWtbSQ2mYZwdUv49TmLyAhxb+VSaAy+516PilQvsaZ9jdC+Rqs0XZFsDH7
 RXms7UAX1N0+RNCoFXnCAap7GzsF8ICOZ+0LVcCHQ4DP3wUGdjNpDkJgXvqK4YHdNTr45GsusiA
 vg01LHRy66623MJCZpa8LTAvJPXZbVgyQum2sYcE09GQTJGqlqQTKfi5C/UhaUhdIOoV3EOAzVM
 g8wr+P5tN2gogidZ4Zc2Qn5VuEnI7azI+OFyBRX4d1fLjEYw9C5sMQvyBiq6RFm2olBKhgZxwuN
 wsvpZIqZcB9nXxn3oH26zMF0RAAB6kX8n6n52OmhTM52Twn5PzAu14gNoSSrHAm4lB/fshKv9+Q
 jWBwQnqJgEuj1Njic1fWZfeRRencsA==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68f04232 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=EgWSWpgtYvY55qVivvkA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: U7H8c3VOp8D1wLRqGfWsyf8p4JVVO2Z4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022

On Wed, Oct 15, 2025 at 01:27:19PM +0530, Prasad Kumpatla via B4 Relay wrote:
> From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> 
> Add bindings for Qualcomm Kaanapali (LPASS) RX, TX, VA and WSA
> macro codecs, which is likely compatible with earlier SM8550.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

What does this serie of SoBs mean?

> ---
>  Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml  | 1 +
>  Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml  | 1 +
>  Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml  | 1 +
>  Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml | 1 +
>  4 files changed, 4 insertions(+)
> 

-- 
With best wishes
Dmitry
