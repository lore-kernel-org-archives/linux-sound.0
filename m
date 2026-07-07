Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F14243C055
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 17:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783446382; cv=none; b=Obd3xyEKp76NYBe73ygEpHejNTK8gUyWrv33weiUWjPRNZ3R/P7QBCnL7+jNQ+QzmTzUmYalajV7njXN0UoYH4nRaXSQpqfKUyoMybcuQ7KY38cLw+5DKxca2qKwg9N3ie1QJsI8eBy/P8i7ZWgpFvZYNJu5TCpgI762jYZVeJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783446382; c=relaxed/simple;
	bh=UJHy+4fNGIppWeJZqbXwBUa9YncdTApJbIpjCz18jrg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fXuiNb/kwVSVT/DYXuOgbl7FGE0Gx+R8Pvk5W9rcxNF2GbCor5PJ6wfqjP9kTestl4Y3dYezGncsx8lu09bcxVtJyU8n+6bLAFOWjGkdRl7PA79p3RX3/mq3c+9aUCQSzJrNc7F4XF9CKi5g9pm1hNx4mESQ7VBzmXcj8c996dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KshfqSeQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GvzeKAkO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KshfqSeQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GvzeKAkO"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667FTiQa3996643
	for <linux-sound@vger.kernel.org>; Tue, 7 Jul 2026 17:46:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lj6ipWG8/ZCBp2SdIngrB7J1LRaa3Myn9bd+SxBiSmg=; b=KshfqSeQT5t06b4u
	tRJfl9ugoF/wayAl611H2E9RzC74isPR2tlslDgyDSJFI5uOtZ9logHHQtcWo7Ef
	g/cdv7DDMln63b06YUHcYaIqPWuD2A1lXln6PTjL4ixBjCGWFEqYtYY61cTw5VT3
	47A2RGTRcBQzEdiVA4d73mnTGQF1hyT0y9viSRj0PdKnt7i6f+ZMh+QwmPf/BG5Z
	uqYaJSDC1ooRbZ7bTVUUTJDYI0DUhWvkKrUheywJl7HLNKcH7+23IKUEOn2Ojdtx
	/yo7jdSEFHOtlu239e3o/1lGLLFK2x1d1Ra1vMOInIHU8E+eCAZhvDUuuKmpS2lH
	Y74JsA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8su73bx4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 07 Jul 2026 17:46:19 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso4089575a12.3
        for <linux-sound@vger.kernel.org>; Tue, 07 Jul 2026 10:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783446379; x=1784051179; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lj6ipWG8/ZCBp2SdIngrB7J1LRaa3Myn9bd+SxBiSmg=;
        b=GvzeKAkO1+QqGyCfwsJiDtOBjc9CSFbqBlXOo7G1Sq4Obg2dFC13SO4Zzu6rD+gwKI
         khWaApus0SsBYv8nyqwe1ltmSeJQ440j2xwEY6PXTScYRdI6qV22nr/VbhN490dSP0nB
         f4awLOdAUsz+FRiXlWdA+UpnSOYgtbvKvoCisaCcwP0zlyJPTiWgUlZOr16Mxo8ExWv+
         3Q4TE8/CwwP2LNHIbs/8A25SUHiXC2VzwRg5XWdY3wA00PCe1liSrmxlOMWWRd7WwpVV
         +cB8eqi000re5rJrJXSahDAfP/u/nbezidOwcVTUnYHcoGA+nV+xNIVXoOxbC6OnbC1K
         t+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783446379; x=1784051179;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lj6ipWG8/ZCBp2SdIngrB7J1LRaa3Myn9bd+SxBiSmg=;
        b=bYJUjfsAflFKuikvSaT1yAmd7Xay2KF7ZzhWVjUEmneBaE3egUQPAf1FftHsbbhjiK
         jwAnaILOwHz3M3k36tuewuq2drvJl9Pkpu+cdGTWJX5gmnkXZRjYBjPkRdy6W0v/3IRR
         DgU2gtNND+3LyqZGN2VAVUT18v07/bhCLCmoLGlWDTZyBlePd0/zKBHMjSyb/7In7W4L
         85qonSFlNv7MPcfFt8uxjj+jdAiDV4qFfp58QfTHqFVZ2fSUZSV/VvOzC0UBJSPws29p
         8ZlieN0ytgvtdy84m0eMJ5o5LIvMa9LvvJ3KwavZ0NxMtck6JtHdSN/RiuQXQ/FNwuGX
         vKYQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro0Tq6CLPV4eC5zspNkrY9RrtVd4OYLJ+VujIPtson8VSY+p9biLiXtJyhKoY2oRIHk2zSKeKw/bzDXyA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywze9XLeDdoo2YIZK47e8SSausQ/ACRJl4xNvA4EpaI2MR9WMnU
	U9rCT2WTs6+nt4fZ2X5In/fDdMOJH5MluIR1qy/JbzIn85GUL8MM5QVrkXyHDJ6HQs+z/qpGbAj
	o9pedMCD3hBi34Ipue3S7qorjFwE7aHaH0J8CsrDLUwfBbD97ntZuGM14tiCouDWCMg==
X-Gm-Gg: AfdE7cnt434imobvbKNfCWB+5nBEofN5C0Na9xy23POtMv7MX1AlSgEV66rtbNEIe+h
	lQtbhJPLkrykI+YTSek4t3S/+Du/+C0O/6ghnGZpfUbAi6Bn5+U6z11q33AqzILFZEYXYgoYwmV
	nDCE6nyk/9JotDD6AsLFvegRWtqQt7EHSn0byqsQ1jkiZy49w5hXW9mjvsdoDB2r4ksUa3uyPw7
	cVzK185OQ/YAqT/gLItd9p530G1qG14arLZOHJvxwRNaaN3XdppQ+G2OoDAoNvC564r1WhKNHyi
	yIgkb8WwTw3BHDOlkNEYoEsZGUk7GR5bwXS3skGu3wMeEP01b9KsbJgI7U6FPZMzzwj+ic+ZLyt
	SI37Owxy/h6taRtX+YNFtUtnq6vrOLCOSWdaQ2P0RLoq74g==
X-Received: by 2002:a05:6a20:a11d:b0:3bf:bde7:d671 with SMTP id adf61e73a8af0-3c08ece59e0mr6972004637.20.1783446379014;
        Tue, 07 Jul 2026 10:46:19 -0700 (PDT)
X-Received: by 2002:a05:6a20:a11d:b0:3bf:bde7:d671 with SMTP id adf61e73a8af0-3c08ece59e0mr6971968637.20.1783446378509;
        Tue, 07 Jul 2026 10:46:18 -0700 (PDT)
Received: from [192.168.0.105] ([49.204.17.188])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm16062585c88.14.2026.07.07.10.46.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 10:46:18 -0700 (PDT)
Message-ID: <921ef440-ff39-4c0f-a258-f9fa95876226@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 23:16:12 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: sound: add WSA8855 bindings
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260701135913.1641328-1-prasad.kumpatla@oss.qualcomm.com>
 <20260701135913.1641328-2-prasad.kumpatla@oss.qualcomm.com>
 <96e3edaa-3fac-4006-9941-5e620e61f3b4@kernel.org>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <96e3edaa-3fac-4006-9941-5e620e61f3b4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE3NCBTYWx0ZWRfX65MPLJFB/+Ig
 Zvvv/Wyj3DolfDDgL/Eo1Y657Bgfr9ev83y9pgE4t/RfGAYvq0GuFB/P53ESZoh6L2g+zLAsfb5
 aUb0aBt48zya2Y+uZGO+yuYIHFQ5P7SLWml6avZC9jbVRXvkaDvTDA6kMj6yr3V2MIamt0lN4Iy
 vbqb+FrvcuwUDwId2ARDz/Yk0c2YQwvPJe6fxLINTTLbSBaslee28k6F+zWyFq23/d59EkbKdf1
 nH918/bLaoBzktq8JLGyI9wHClTbZahk6+z7c6iiaNgiMxedIsX0I/mew7YHvev/gMy0gF4tKir
 I7SfXeUjwqsv+BoRwbQA3TVp3mD9C5m3QYIcg80+HvSGcCKsH6z5qI/Sx4YDWWnqYfdL17vuppY
 szbUgC1kXhA6CtX1zY8uhmswmidigtqttI6QEsQF1qa6cn4je/Ek1o3kMphNZIV9sHegooq/D3j
 meOvC1Zof2C9LyAEIzQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE3NCBTYWx0ZWRfX2ofpQhCrHFAm
 BxZWYySgOWwhc9boWjiF1PadJqAd3w0LS6AkDQvK/tYpt6YnWqX1mi8qwhDg8EywnrBpByLJ1sK
 wEiEKWsIN1Spk7xTTbIp+TQicEPmEFY=
X-Proofpoint-GUID: 0RPjr7n0pdVxYUl_eENc3sYEewpgw4mc
X-Proofpoint-ORIG-GUID: 0RPjr7n0pdVxYUl_eENc3sYEewpgw4mc
X-Authority-Analysis: v=2.4 cv=HN7z0Itv c=1 sm=1 tr=0 ts=6a4d3b6b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=/JTPBhwEQko7YaD0RKblyA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=364ozoyseeM246Uf7v8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_04,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070174


On 7/7/2026 6:43 PM, Krzysztof Kozlowski wrote:
> On 01/07/2026 15:59, Prasad Kumpatla wrote:
>> +maintainers:
>> +  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> +
>> +description:
>> +  WSA885X is a Qualcomm Aqstic stereo smart speaker amplifier. It uses a PCM
>> +  audio interface, an I2C control interface, and a Class-H amplifier path for
>> +  high efficiency, low output noise, and low idle power consumption.
>> +
>> +allOf:
>> +  - $ref: dai-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,wsa8855
> This will need exception and I am in process of rewriting qcom-soc file.
> I can include this one there.
Sure.
>
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  '#sound-dai-cells':
>> +    const: 0
>> +
>> +  powerdown-gpios:
>> +    description: GPIO controlling the SD_N powerdown pin.
>> +    maxItems: 1
> So the pin will never be shared? Are you sure? This is discouraged and
> it looks like you upstream old code.

Right now, we have only one WSA8855 attached to Hawi and Shikra. A 
shared pin code would be a nice addition.

I’ll include it in the next version.

Thanks,
Prasad

>
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
> Best regards,
> Krzysztof
