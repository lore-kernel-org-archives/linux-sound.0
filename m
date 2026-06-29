Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C40E38AC8A
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 05:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782711330; cv=none; b=W7dGrbJHoJJzb0TdUOF9aV8khkoFLzI4Ho8Bo1yaD2haKq6Fy5WcUehY0Uj47VXyYopvqPLaMaQucNXu40/GHRbz7z88hBlc8etD83f00XlOn0MUDAbt4F/QtbGAqDNGmx4gG5Iv6P9AwUwggeJYL7UziDLPihdF9NUyshI3guU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782711330; c=relaxed/simple;
	bh=PxaZIWbiRfKq/pjVX+fFLjPVwm6NqZ+lpXwCPgCITwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YzfV2G9ScdbBHj9v6eNNCLsFN17qaFvH0gjV1hMmOcpFGCI2GWulAxus9oIKR19T+Ic5xaO8LkYhxOQEsvx3beow59L01QBnBtIDbjHeqAOr30VCCZunqjoly6WYXhFykh22QSAduDtT+kvPr1akQmxZyTpu11bH1DV8pEnE3Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KNmSRr8j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MXRDL7VU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KNmSRr8j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MXRDL7VU"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NT7n1777384
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 05:35:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G1lNe0N0L5HORX8OGtk2WAQHROy/AL8D/HxbtZeZ3jI=; b=KNmSRr8jY3dvNKh3
	QchGfbWF8eYecE1ett6kxRFC87AZgyrSSM7IKlUNLDzVGdIAkeqhHwl6zq4V6qEb
	X/EdM1i0wfE1vLdNlBfnYS8RcRUMradtuhGiFZjhOvCwsa+gMQHuXqMfBmMaC0w+
	aBhbq2m1OpWhe4Gu0X6iLRNMgZpAqrUMDYllsDm8zsO61QCUlnZ4R/ly+iBO+lmG
	DFZJlbExf0Yd0fd69hT1syZEd/pA6Oxl3Nc4isJXKQx7FVcY7dloHvhMAIN4ji4b
	EAJH0rJonnIuuSHUrpwZ1b7L9Xr6pwZdLl/DkCtAliDYfvOhGrJdPj4yUdh17gC1
	Ig51aw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26x8mqna-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 05:35:23 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d97a4e08fso2117331a91.0
        for <linux-sound@vger.kernel.org>; Sun, 28 Jun 2026 22:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782711323; x=1783316123; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G1lNe0N0L5HORX8OGtk2WAQHROy/AL8D/HxbtZeZ3jI=;
        b=MXRDL7VUn0zW2sXv/IWJCmmDIhhwZcHReVoJVm5bALWcvv3JvS3gK9BtPg0BsVq/9G
         CGwEV8QFuXfKL/EKglTR5wo5JJdgFh/CX9aK6CqawHYrZ8QYOEIKoKJ5GnSqGMa/v+mh
         0PPQnUeuRPGsagLhfYu8iUh3xd3HPrleSjkj0zjCnu99x4bSQOVw85vcMiwu5er/sMGl
         cbYnFDuDQM+uFSbKfMjzKQ067TPrnKFxwwussjy3e9uMglLcrCDt41LQZV9kLHESWxwd
         i486rWgdBoqiBUBX59uzOoRk60s5z7gAs67ngNh1tMR8v8lCTB+QroClJtEB+ESKSc/V
         gGKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782711323; x=1783316123;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G1lNe0N0L5HORX8OGtk2WAQHROy/AL8D/HxbtZeZ3jI=;
        b=Six9NIw/YaWSNCzd1PmRrQt+6mITUTtJX24fL1MfxPlSYgsAqXbpe61BAYsuKHuoZ0
         u1WrX+SMpgwwB1U2SeFB6tYH8MnQqPImxdlaa6HRbfCErtselWrYt/UbGVNMxSCtuFWc
         Pl3XvyktwKJLCUJp+zdssx6GDZxQNR7/PITRHh0JkN3sbAqVrBpvvixeaw6y0/QMtc0C
         AgPcMFNXGqmzgGnhS7QMJo9Kn/M3xkOYiGVT9lBZDZyTYG/JJPJSvWSXj0E1iZ3O4Jfb
         kkLmNDMYXF21uLlnSX+3J6OQDnNaqYj9ewSC2UlXXteSpdKYM96u6dppxYPn7pbUwU6U
         WyZA==
X-Forwarded-Encrypted: i=1; AHgh+RoW6XCD/Pc1ybJx75ulHSiE4PzRYmHGcP5SuhYq+IahAOAc8czmiGGoBgepdMZ8yi+xlUP3pIqeieGEzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVUx/IutVj/aexCDdXbuFUGJJvcKRVk7qo7ybDBqYErarab9NP
	//sKCAbxdDpkZZoeeyDeveCRDXl8cXtsVWxuwqtxFz1u+pH3vzQ7bS2kdeG0o1UuAragmpzV7P4
	B25t84NCLtfaCHf05vrzNU29IOQPX8ICA1bHD3BzDF8F0BiieZiIqpp5V04P2VYjz3g==
X-Gm-Gg: AfdE7ckTncU2CvyY4Mvh4bOS5wqztV809FQcWp91UGPsqw38i7Prz1y2lQpdDGgpk+H
	bkJaNoV+qPi9T46aUorOTbdVNOe2kctF8x/g0rvkG49YMXzh/gUENyWRjasHz2ysb2yqicliTqU
	VD35a3twAm4XPJ9kAaWML1vMZC4emGdEmzKT3YZjNOBuNfNUkDwX5uWpJa5I73n/GkIEZpsHg9z
	ogMHYyxr9FWZz3N7eoavUILCZoXTLNCg5ZiWQNz1G2jjxZhcwCfnAjgIDV0vWPwr3U+52HNHa/d
	FLRqwqtvmG6jYh2lX23h7gXQ7n1ABAoMEfDyoUaHi9TWtP83SIXLaj85v4/ix+HEszyDX23WDDC
	hLP0dDQQrkRtJTV9buRI8gY3qabYObnaxoc6q+r+Ju+kwZgRNgg==
X-Received: by 2002:a17:90b:514f:b0:37f:bfa2:1887 with SMTP id 98e67ed59e1d1-37fbfa21cfemr5617332a91.8.1782711322911;
        Sun, 28 Jun 2026 22:35:22 -0700 (PDT)
X-Received: by 2002:a17:90b:514f:b0:37f:bfa2:1887 with SMTP id 98e67ed59e1d1-37fbfa21cfemr5617321a91.8.1782711322477;
        Sun, 28 Jun 2026 22:35:22 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c9d8bf1f07sm25282945ad.69.2026.06.28.22.35.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 22:35:22 -0700 (PDT)
Message-ID: <159fe00a-f259-400c-b1e9-7963330bf9f3@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:05:17 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 8/8] arm64: defconfig: Enable Qualcomm QAIF and
 WSA885X-I2C drivers
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260616201315.2565115-9-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260622-analytic-pigeon-of-force-bd53c6@quoll>
 <ebb1c3c7-87ff-4683-bcbd-c088226fc74b@kernel.org>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <ebb1c3c7-87ff-4683-bcbd-c088226fc74b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA0NSBTYWx0ZWRfX+ys+vNdL2hqk
 zInWr+GWLk4mvhjwfCBwbdm1xFAGPL3WBdWBki71o2ecLqnfRUdEgbhjDhsQlVoK3k/RLs8stlC
 SNqvj8WKVidqkvC91voCG74XJFG4RoY=
X-Authority-Analysis: v=2.4 cv=D+N37PRj c=1 sm=1 tr=0 ts=6a42041b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=1-yt-TcySLUHAD0pDGUA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 65841x82lOFlK_jcGPXozqYoo6xIxnfu
X-Proofpoint-ORIG-GUID: 65841x82lOFlK_jcGPXozqYoo6xIxnfu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA0NSBTYWx0ZWRfX7yrp+2IaDzyA
 23jXmP+yA1oFQT4CD5OmPbQB/tDy+vFsWsLgoIg1CPw43V0sBHXYZDjV655ikaQBtPI3+Kj20ui
 7+LarY5v6tKuhL7elaYvMDrSaL9NsSKeeeumwaLHEja6IBvpvUb5aKvzLXulHz2nhGnmtV9JNCB
 2t/7+4D7ZPJrF9sIjZfQOEDTCVGTkL5TUJcfHD2tldSRThYuNYLXITTeehgE5wC9hkXPFtX7wtj
 jBLhsdGzmHRZ68ZLM0YDK03pQZyXHuNUTnU6x8In09Z4t44da2zn53kb+fXM2nsDxzgSij9ywmz
 +1jH9NNUuIblWE6WihhtDOXTG1SeCGQ43126mK14Ji3N2KGi31AnRqFK0ZX6mNkYvCxTVQA72d5
 irsPhcrPLB3Y4bvAlWveQRenEYiKcZtoNziAcI8AyVEMrJU07eyxx143PKm8eY/dVG1YZZhcNrg
 Y5qiHrpFXdT62bCahYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290045



On 6/22/2026 6:49 PM, Krzysztof Kozlowski wrote:
> On 22/06/2026 15:18, Krzysztof Kozlowski wrote:
>> On Wed, Jun 17, 2026 at 01:43:15AM +0530, Mohammad Rafi Shaik wrote:
>>> Enable the QAIF CPU DAI and WSA885X I2C codec as modules in
>>> arm64 defconfig.
>>>
>>> These options are required to exercise the Shikra EVK
>>
>> Qualcomm Shikra EVK, but anyway the problem is that:
>> 	git grep -i "Shikra EVK"
>> gives me zero results.
>>
>> I already commented about this for some other patches.
>>
> 
> And SND_SOC_WSA885X_I2C also does not exist in next-20260619.
> 

ACK,

Thanks for the feedback,

will wait till WSA885X driver got Approved.

Best Regards,
Rafi.

> Best regards,
> Krzysztof

