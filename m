Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343993806CA
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 05:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782710936; cv=none; b=e+jnyFWe4Ko/o8xc2E5Y1XklKPU117cijX32CzeHrRfWFxZFbA7o+v5rhCmtBxfh/cIuijTk3oFlDkGY0kbUw43XZFcRIBAWYIrhqt0a+wIKiXPlok7xob7REKbffAyTH1kB3FOxzqQS7SDjy+fI+7s7mi1PQ78ovQVkxNTQ58c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782710936; c=relaxed/simple;
	bh=i/ns2A9bAE0EmLPTO/wzo67pfSla/PTMykDg6NWWMV8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LrNApu8rOZ7S5hUniBhgiVy8/zXrnzSk9vMFS0GBRnWZfu47KZgfdkzmpbNBFVCTgQOdjbjCNPEMUq2Q6nfbaMcQANJW2mTXvR5NvspBXSI2Sip0ZkOHAzi+u5VCWrO6OcY0id8Bo5gUehzq5XTPKHbSg4eFI5hlkbPTWbXO2/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vu4yylak; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jj8Y3ENT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vu4yylak";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jj8Y3ENT"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NGAw1787623
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 05:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aYdUEeJcaNzG8VXD+Xvkckg03RgLqhj0sXz+olIF58k=; b=Vu4yylakj4YLfU+W
	4cIpQpNvDoqCWpnmBGyUF9qgWxRzFIWLueIn4Cc/D9fpzHH1Y+0e3QCTN6RK0Yjq
	zEgCa2qCE8VYa399s6DrV1fATh7Xx9dmCUcWd4mwTpTp6ZbtJeOh7EzHOzSFsQ2U
	GhYCdbZ7ZaAVewEGSmbPNXcKEOktK7Jz3KMs8c++40zY2wu1a/fDTiXfx1cPcLeo
	ycMR5rkwvixzwVm3MpA+hZ9EWgN2Jbla/KrqE6OtYHkaTUKC8ajsad9cSQa0Xx5o
	zcswG0arSadBZGC3Vq7Jf4zSLSFL0Qn9Yuf7wGnj7vooGya93dzNY5hNQE7rjXJn
	XwbAmA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26tuvp5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 05:28:51 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-845c296374cso1914879b3a.0
        for <linux-sound@vger.kernel.org>; Sun, 28 Jun 2026 22:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782710931; x=1783315731; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aYdUEeJcaNzG8VXD+Xvkckg03RgLqhj0sXz+olIF58k=;
        b=Jj8Y3ENTXKHCsofnFFjdRcnbLnBEng60wy9GS1OZqqXj6xLn6vdi78EoN8+RWIwOnp
         pRU/+qqbBWjnKO2rTn+EIr8eofqsliqNR/0SffeAdojVlwvt6GSvKP2oirpLKv81vAoV
         obF2NjKZTO13CnP6/TWm94FWkUMcee9m8Pbrv5iWbpI6zWZrOIk+J83uaUV5iRSVsMFY
         3MuP2lGHDanOdvme7mdF6F50vnYXjFUE8y1Axv+oxV63dMrLDGDiI7rLT9lpbJGsqo6b
         kQp22xX6KKchWwBOhySHOIenZ7IoOqefsn6B+cbu3cFhIPD6biKq6y/BpV18m+/LHH+I
         ck9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782710931; x=1783315731;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aYdUEeJcaNzG8VXD+Xvkckg03RgLqhj0sXz+olIF58k=;
        b=Cv1cE1W3HGJZsV1KW+4ptF77TKfpfe1SchVUgkxk0wUHVGLWUP53jpxH0ml4ztrWqp
         +bdzBWuCheIoxpvDzRUahi7K8uGdY28j7ArNgPLRU4X6R6dTZz0EuFeLH8cr5TRsKH5J
         ikbW9762G5a5qPVbIRPtWjs1hznRYWa68dL25/BnuceulQPmDSP9O/5rBSQbIfdNNal7
         ugIgRnHlzhU70lEWV6OyQFWgeBGGUSASGMFz82dDm9bEbCW7/gbRUT/cdqebgv7xvP5S
         xoPLLK/BvUI3A06bRdVe+PctK1Zi4j8dpKf7iY3OmgFb93+Gu4k/l6T77UcC6HGRI+wG
         v62g==
X-Gm-Message-State: AOJu0Yw9lZ2DOxWaduqyFmzhMBJwX1I///BuoKfI6gZ96jCMBTXGurRT
	23XrxYW3MKs1IXAe7dwm+Jw3ve95EDqgOqWLk0LrNwpVVndSCxVDWLr4a6Tzmy08TFQin3uXy5z
	pLg7slrINp0k+91LUC73QSA2YLuUMhyZlqGK7mq7vSiGG7EIdhUx3FEdcSs9z8y4MHA==
X-Gm-Gg: AfdE7ckeesv1t7ZcQxSD4AghLqaYo/k6+VLXmS8wyPvvY7OXMOZ6e01V5rtnrOesqvB
	GPukIaNfH8tAVF5DvYtwbl2kBsLLXWsN+14NnOFVldVp1xLOSzRNQ0Pd90KwGeKg2mXOY9uLKLu
	Lx6dTgt3b9mVspWwH7C2kpZUpKDViItgDKQi/IT4c6o6UPEUbIeZhInGMMfg6DG26rbzGv2t3Iq
	+OEFRWLoBM2mbU5/pazF871ZKjCYwsxukpHOl3glaT8yD85+KA92w438Qd57MwFmO35hr+H5P+v
	T1ROwDgW+TIgArUlscBk8AZt01Q9jMGpInvKzlhKVVce6qjykdHWZ6tfU1Tmwc+9GCypT7MyRpU
	+Myc3CrGcl2xbteTO9B0DjRx37yFm3zZIE7Fm9cPILXHHOusG+Q==
X-Received: by 2002:a05:6a00:14ca:b0:82f:38df:681c with SMTP id d2e1a72fcca58-845b39a28demr15665498b3a.6.1782710930888;
        Sun, 28 Jun 2026 22:28:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:14ca:b0:82f:38df:681c with SMTP id d2e1a72fcca58-845b39a28demr15665489b3a.6.1782710930457;
        Sun, 28 Jun 2026 22:28:50 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3fcc5ffsm10886817b3a.9.2026.06.28.22.28.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 22:28:50 -0700 (PDT)
Message-ID: <6761522a-5de3-4b4c-aa2a-90985031677f@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:58:45 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/8] arm64: dts: qcom: shikra-cqm-evk: Enable sound
 card support
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260616201315.2565115-6-mohammad.rafi.shaik@oss.qualcomm.com>
 <979bff6c-86c8-4192-bb38-4e43e57e8834@kernel.org>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <979bff6c-86c8-4192-bb38-4e43e57e8834@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA0NCBTYWx0ZWRfX7xRCeufUBynd
 WMwt9dIcJvqYAJrqaKvl5TjTYNjqa5daujjqYbKMLJdy2EJ8RANOA3YU6gZYwuoQS1NjA5B4NV2
 0YyxCDfWz8sU6OCFZvm1Gi85TQRLPL4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA0NCBTYWx0ZWRfX4RVKZ4voQZ/V
 roN/S67Kg/uwmqGLScDbs+VAEHlvyD047+m11ko1GkGQsumkkKvPhlnWNOrsoTC16Rw1yySOK+P
 gsivu3F4w/48N8NSO0j11sVF7py8nhzoELK6XWWle1stOA9teTb5voOSY7//yKhV/j3zuUYw9gG
 HS+42IvI51waMbLsFHTvJli0xul08kT1QIgFA3nWRkKbvLWXqBKe8xS0VqwL92LtqhCm9OhrOQy
 52DoB1qCOU/36qL+9IE/D//TceU68WJ9RkWD/eRjQebPTspg5brIb3sNPhXBnPuzHcZ7DbGw5RU
 H2nNTXph1xlYHjdW2N7UUnWmfH+1HQc06l/vNhk9Ar6uD/1uqkOzTWpkVj9lyIZTFbjKy2dlf7R
 NIMcqOph5ppJSheZYW9+cNQ4wSnMn7PxkiG3t/MWwthYb2YvclGIBE4WDNmErKnglhAMMHfV6vg
 0wvZXmP5LzrCfyqa6pA==
X-Proofpoint-GUID: Poay9gB4YlZ5UMr4ypek3FsF6mTiaVX3
X-Proofpoint-ORIG-GUID: Poay9gB4YlZ5UMr4ypek3FsF6mTiaVX3
X-Authority-Analysis: v=2.4 cv=DY8nbPtW c=1 sm=1 tr=0 ts=6a420293 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=dV9RIOcyXjINfkMfKl8A:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290044



On 6/22/2026 7:16 PM, Krzysztof Kozlowski wrote:
> On 16/06/2026 22:13, Mohammad Rafi Shaik wrote:
>> +
>>   	wcn3988-pmu {
>>   		compatible = "qcom,wcn3988-pmu";
>>   
>> @@ -60,6 +129,79 @@ vreg_pmu_ch1: ldo4 {
>>   	};
>>   };
>>   
>> +&gpr {
>> +	status = "disabled";
>> +};
>> +
>> +&i2c3 {
>> +	status = "okay";
>> +
>> +	wsa885x_i2c: speaker@c {
>> +		compatible = "qcom,wsa885x-i2c";
> 
> This was EXPLICITLY NAKED as in disagreed.
> 
> When you receive a NAK for a binding, you cannot send a DTS six days
> later having that wrong compatible.
> 

Sorry about this. I will wait until the compatible is agreed upon in the 
driver patchset.

Thanks & Regards,
Rafi.
> 
> Best regards,
> Krzysztof

