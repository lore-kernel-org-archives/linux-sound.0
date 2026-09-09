Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58405581EA
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 12:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788957918; cv=none; b=nxmU9kg9OcX/wqP/gvYEIB9/kgv6OhO86w3/60kehDQcyLQ1iF+jyJiynYCiXKogG/ra2whhSpkKqsNoHlQmkPGigCqj30pPOqtC1ctUry3WVA7AX4dOp+MZFhQN1TyxUeX2SH75b1e1oyPq3QEEAGPICAugPmFl35xzkJWf5Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788957918; c=relaxed/simple;
	bh=npdUYq9yMIsLpChnrVFm65H8LEUeDfCG65JUETLKARk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CkZ8n5CQt1f3EyC7izgaSB/7uadMLg8TON3nkDGjk7fcVM0AzdHh840gSuCNFy/XBum9vO/h1uCcJtyq4OxPuUQ6RpsDh5aP1bImoB0P+1fukb7hWfJvtgk/6ArTH2FQRFXPWR4yKEHLv9plGuCpIwoW9CCmHy61/GoHNZsN7Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I2T3YKRQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hv3oAhz4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I2T3YKRQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hv3oAhz4"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BoV2p2698515
	for <linux-sound@vger.kernel.org>; Wed, 9 Sep 2026 12:45:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+LSBWZs6PrdGX4mxuF7FdvAqDUtCMH6i87wA9bo8R6c=; b=I2T3YKRQGUnTtlwm
	hUuW8rktwf0XSD4EZJnWJUJ7mjgwltsq8a+UkhgBCsNhXmzOuIpADyLDiI6vbQwS
	txwFaSMn+ZOVWWtecWe+ebmmGhB8OerNlBYNz4JAVdsyNt/kDX/Cw7CSL+D2zoGF
	pP+uxS2B0p3Gc+pB6kzNd7Mmwn8yT7a+EeNZGLtQrWPhuPo7X9a1UqHjOploYAb4
	bWG2Qd+mMScHqgoqezH7I7S9MShTlvBEXpPZYCYxmLBtatJ2xxS/kz2Aitnef8yj
	sq+gPHcW5Js0rbh51WIn7M5+wbgLTtS/dYdIKq6r2JacWireJ+IMXx48G2iIchQs
	TDOMnQ==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk6xh0636-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 09 Sep 2026 12:45:15 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b325074c26so5954005b6e.2
        for <linux-sound@vger.kernel.org>; Wed, 09 Sep 2026 05:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788957915; x=1789562715; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+LSBWZs6PrdGX4mxuF7FdvAqDUtCMH6i87wA9bo8R6c=;
        b=Hv3oAhz4ie9QQiog+FSuVIBmZyldp4eLyXWgod1Ce8atdMCEAp2N6qRM+rwEvOt51v
         BExHrVYJ6FcyFy53JSyMlPd87G7I0mOLXP55EPXGyI28G35RuAo8ONBoT+k77KoLHi41
         hNbNrETaPD7HuEXzY/X672c8bG42RfvU3ND7vSTcUcFs26s7I70LoMJrgLzwpdEEttxm
         dYrCyUstEKTqTCxsq5T5C9eS66vF3L0SOFNFozmLwO1JKPncVm1sIwooIlx7Pa9Uytbb
         zIDbUbbqxW6jKM2n/60tCFXvXEzKMDVsfEUX5oZSXVkgrZljh8OgWkSV0veTgOCXEgDe
         iiOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788957915; x=1789562715;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+LSBWZs6PrdGX4mxuF7FdvAqDUtCMH6i87wA9bo8R6c=;
        b=GE542KAk4vmmiyOJ5DrpEe4acqJuuPjv/0gzf8GnVHkKV4j8dwy2VILbCx2RlcUpog
         1LOnn6rMM0STKseTpKGUDVsojZXUk7D691JuNFvlXOawwtNn3/Sp9ttwW9zyLO81EK5E
         vNz93qwWmwFpvsNLfyyTOjVa8wygpKbC3ysIyVpA4i7FG9unKKFe7EoHDntQo/kq8xqE
         jKM2sQhNjEK2eth+FDlxP7B7Y5UmBCbsMtTlGNWKA/WP+nj+ThSPUMWMRfhk+sfjQP04
         1T9bTLfZofK3Dj4uneL1l2w8iXnWj7x5l/X+ZE9bGxVWAAf3Ct8YX3jhRwqoy8zN1blF
         RHdQ==
X-Forwarded-Encrypted: i=1; AKwUvBx//2pvcCRDc4hh89jZHxm4oe30wHytb6i4Hp0nCzUFVOKxInfQOmDESb+ihktKL5eBK/i8YdcEqB517g==@vger.kernel.org
X-Gm-Message-State: AFuF++nB0poutfkBjcNATFwRrWCAqPQScbL59koCJggGa2krWoc4+tvK
	sF/Ml0iQNGpkIz/JhXOHc0BwPj8inwJ64nCkz3btEcZjlzZ+I8EVPpB0IWab1QyPLid1xoq91nf
	v1FRKZWnE7tc4YCwhyFE4p1glhmZu9/dMYL3/sG6Iw4mNKNkAf2yb6V7rSSLnoDmwgg==
X-Gm-Gg: AYBFou0JzTmUYunMkVtMck1NtZd9AsgfI7LaP7Sd+IgOuPXBOvmnrhYt+8ZgNDg8orz
	+mXU+50DoxPkxDGDiYjZq1VlyJrGX/xRMR3RnuXsjtv6UWWG9ReSFuk7CLiWrwNy+eCU9FnAbWK
	GLeFIiFvqBBhNsYzE+bn4wnJw/SMaRxBqR6Xiyf+GPLGqxE1HrjkncLu+VtwOrcv9WyPiQpX9eb
	w2en/HkCNaX0auBcemZ5v9ngO8u8Iah26lFXeYwrhoOJcPatIggPRVIgLHkjOluNaKs9pyZOWhx
	WcrjwRciAcnaz5+vCTbdn5nSqoL+X211pgkaBpZPn/JqpgNZx2xknm54UehSIbqdQZv0rEhmpPc
	oQfsKaC2o76c6iEx+3DLUi8rcHSP1d5yt1bgbKoo=
X-Received: by 2002:a05:6870:334a:b0:475:a1ec:9617 with SMTP id 586e51a60fabf-475a1ec9cdamr20255122fac.25.1788957914926;
        Wed, 09 Sep 2026 05:45:14 -0700 (PDT)
X-Received: by 2002:a05:6870:334a:b0:475:a1ec:9617 with SMTP id 586e51a60fabf-475a1ec9cdamr20255098fac.25.1788957914497;
        Wed, 09 Sep 2026 05:45:14 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47a7585b25esm5186332fac.11.2026.09.09.05.45.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 05:45:14 -0700 (PDT)
Message-ID: <56dd264e-d17f-4916-b8bb-bb41af063823@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 18:15:06 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/5] ASoC: codec: pcm1681: Enable system clock before
 regmap access
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Lars-Peter Clausen <lars@metafoo.de>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com>
 <20260907-nord-asoc-driver-support-v1-3-997d3b20cf43@oss.qualcomm.com>
 <de0a0b99-9213-442c-ac5b-944a0f6bd432@sirena.org.uk>
 <adcac1a5-6d34-4978-8fce-b9b5a0361b76@oss.qualcomm.com>
 <23de3b70-6284-4c2c-938a-b92d76cdc088@sirena.org.uk>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <23de3b70-6284-4c2c-938a-b92d76cdc088@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0MiBTYWx0ZWRfX6QUq9e3yfIMb
 llA8W9ykfSQdZIKrjookDTFB/H46wpN5M7OHGQlqEMI9SHUdUyp31pJp2buY3NmZOp+LSFuC9al
 j/VDiRHYGTLgGPvTrmfROd4llKdlx92EXBTyXBGs6OwbJKU95bMJskOdsVB5LnLJAT12m36DBJY
 Ol7wsk2MnH93JVYHnORHD+q5vC6cmUWiPseJ7F8eRgkCeYElSCXsoh9JMXpChfZoCOGtcHRahcu
 wVRBZRwf5E74oTsuLARmDbO3NtEh8IEZqWjlxHXyjdlH7uwFToeJKb0W9D/K9yOzN4b11Ck/MCx
 FV2xQyq8ve8AzS08BTrvurwxfqhfUtar/RQ7SHEEuTH839cYKLEelK+3FSRPONqbu4vIM6vFK74
 DVNG4MolGq5YgpZwKNw1hUza44kCNxB7ef6NUafzPvbZKSnIKeC0Ux7lf2jPrnUepfOguoaVoLQ
 UoLb/FWoi+1xfHW0Xwg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0MiBTYWx0ZWRfX1UYJ9Q6mJINp
 2qLVfBZlFlzA/AnTDtDuHrol7LYiJA+BIkHUiPjrjohBXJjnUBiDUb9SGYw6C0fAnRVjfif8QIz
 Mx+UogIfSw0kxKaXcq+/H56dUHFzxZg=
X-Proofpoint-GUID: xoiX411NO0Eof01jMPvwgcJOm0stj9Ku
X-Authority-Analysis: v=2.4 cv=KOlqylFo c=1 sm=1 tr=0 ts=6aa154db cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=iCeh-t31pbVi7WQZdrAA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-ORIG-GUID: xoiX411NO0Eof01jMPvwgcJOm0stj9Ku
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090142



On 9/9/2026 6:09 PM, Mark Brown wrote:
> On Wed, Sep 09, 2026 at 06:06:41PM +0530, Mohammad Rafi Shaik wrote:
> 
>> Although audio functionality working fine without this delay in my testing,
>> I seem to have overlooked this requirement.
> 
> These sort of sleep after reset requirements often end up getting
> implemented naturally due to other things that are going on and then
> issues crop up later.

yes i agree. The current behavior may be working because the delay is 
being met implicitly during initialization, which is not something we 
should rely on. I'll add an explicit delay based on the datasheet 
requirement to make the initialization sequence robust and avoid future 
regressions.

Best Regards,
Rafi.

