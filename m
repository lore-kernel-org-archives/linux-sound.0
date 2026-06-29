Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5AA2DAFAF
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 05:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782710715; cv=none; b=sb3K/UNP4agTbNhBK6h6hrjC/pYY5YsmwlRz98HpundzkMbPdad6hF1AJncrHVFRmNlDK1MG2eKBm4DrhyiqnXHfMMZU5cBrXR694YNjdHJReOzoBfnYbmFHcI3RMrAhyb5kpM2q9NtkRGxE6PtiEfBk1FL9UexjNqQf8dRCsTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782710715; c=relaxed/simple;
	bh=3fsySZNJTDVB4JSAuMEOgU7jkxjFmNSkojHyrgfoseY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tYU2n96cdJisqlxGgACirtL5WFopPj0kOX5BrSUqgVpZ0afpm5gUW3lp3D5O/OVDJ8VvkhfL8AlioLhOxZTd6SaSc/9FU4d6CSuz6k4fSR+G16I/nK7BFv89CHUnRUTwwX8+PbvJUS5+h6tbi6bLOnBmBCv7b3kz3X7AWcfV7FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ptWIoWy1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B4oqMNE1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ptWIoWy1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B4oqMNE1"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NOMv1766950
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 05:25:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2/UWnySdbWNtKsfc3NsH11bLgfeExMa8Kg3noHbEtSI=; b=ptWIoWy1mds5fetW
	T5B91igL5n+EqJgN8loLr08SSzqtQCgUZL5hqrPGpQckV4+n8chDJ990hs7663H9
	fVYmj9pG5hFjaHPEWEVvKJ4BC6hKIEEzSaPY+R1Zm4alA9mufr1EEqf0dORO4Chn
	jApUD1CA21jyNu1RXbmnqP+g/zGB/4ghg0HV2Z4zDkcBaEdyIUizUvO4MwgfX+Ec
	K05k2fDZN1W1AbNpCMce3CMR1b6aKWTtoFGym0anSDVpce69iETMSG92fHeE0jVF
	nHB1ZHO+SWJUwTUJ5/VizjYgldQhQwobQOKI+06CW5Pl7AP+LY01139jBgmWBLSc
	78xOlA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f270a4nmn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 05:25:14 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c42d96713so1808866eec.1
        for <linux-sound@vger.kernel.org>; Sun, 28 Jun 2026 22:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782710713; x=1783315513; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2/UWnySdbWNtKsfc3NsH11bLgfeExMa8Kg3noHbEtSI=;
        b=B4oqMNE1B0XP5PmzkpbemehvhKBtFfZ/sJzzzrf2KieZjpA/Bq+ZAWii3hHC9Ri/J5
         567MHDI6qJR4NnPS3qR8G2y7gLo3WCdAFmtiJ7VIGvlDcVHV3JTXF3k4BJc1hRaW3Jj/
         w3gUiUHOZ6kpDqbQa9+QDDfByWtwIdwo0PPIal1R9Sbqj8senml/W1xtRO3YBdMyDlmh
         xIOfkRu3Ba5c/HEtqUQuTwT2FDf63H7xibz9HWgXC0IbUuDhf49nbSu6pMfBPH7/DFep
         dGNbQ+Dw44NMmKuoeuc5iBtgWKfC9oOcta3PFpM+0x12ikDD9TScDMaXlkLwfgR4SZPy
         pLlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782710713; x=1783315513;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2/UWnySdbWNtKsfc3NsH11bLgfeExMa8Kg3noHbEtSI=;
        b=k26zY66A3JORj79Zdx+zN8jXUP8pust4ROTiWJ8c3eaev7IBR5br11+eDnv6jPyQPO
         2ogIasilBq/h9KA9CPYE+TCnsfpW4L6eiZUrEbf6NQl3hu9uJvbCUEjb5WiKwK5Y6f9g
         hj8IvuA2fH7+yf7rxs6D3YiDpVzShobcY1p8oo/t31j0Fp4zPP78jXW5+196BV5Mxn54
         EtFp2ZpZPjBnKcKgy3x0wCUB9F78Mv9B9b4e7WhI+Mmzod+i9nsIBs3eK5eKbgn+vJGP
         u7N0RbhZiHQfuzo61h6u9CqVG6asAGe8YNu2Yu5VyLeB95W8f7ULTCT17MEX+P9pmmDc
         T1Dw==
X-Gm-Message-State: AOJu0YxTiJ+PimZc5u/sa8VDBi2ChF1jkpqRxHVydAwBMx+FfB4qZyoT
	wCTZ9oV497Pg1bRB1MOiUd5y1NGS7DSSmSC5Nc9MGb25KDr2LwW9Rhn+qK9Wud4MZwPuaUZSPMD
	93evGw2WEUElUcU5NBO80+MBZ+/wG00gfI1pJCoE51Q3mYLPHBPSsrSspiSALDdvkmQ==
X-Gm-Gg: AfdE7cm+5m2A0Fw4xGzplCmCbdIBy93aQboosix7vzqK33oGZjveQ66KpgfumxedT/q
	VEkxa+7J56yrf+c0XtrLb7dlTLF1xuBWdlMkQ+om8H2vR4IoWFF7Utzux6Fo6DivqzQO4bRowUz
	JDjJhCA08/sKhVwwaJ+KrmfkWqigoU9a0t0FlEuhHzmCz1LxOBGhltJl7XpDAHkwgyQEFK4n7aY
	JUIPjItIVgUcHr//GiCcm/MWEpAhPPHSTMbUb9u9ZMPLumx8YnuYmYZECAlU9Qfx87s37Vo/Rln
	dM1QBnU2Jn7PYOcoD31PVKEH0ZbrWdgHXjHWRvA+jj66Oou7s7nfjNiEWK87Sy/XXlDWT2/ln9a
	ltOtmXB837xFUdhuc59qiDii/agaLkL3y7QcBop8/rGBYCyJ2Sw==
X-Received: by 2002:a05:693c:2d8c:b0:304:c9f1:a0f6 with SMTP id 5a478bee46e88-30c850ac4c9mr14824171eec.33.1782710713394;
        Sun, 28 Jun 2026 22:25:13 -0700 (PDT)
X-Received: by 2002:a05:693c:2d8c:b0:304:c9f1:a0f6 with SMTP id 5a478bee46e88-30c850ac4c9mr14824148eec.33.1782710712902;
        Sun, 28 Jun 2026 22:25:12 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7ca5e601sm40256750eec.25.2026.06.28.22.25.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 22:25:12 -0700 (PDT)
Message-ID: <2f24a5d5-05ff-405f-aaa5-090762a33863@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:55:07 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/8] arm64: dts: qcom: shikra: Add soundwire and macro
 nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260616201315.2565115-5-mohammad.rafi.shaik@oss.qualcomm.com>
 <2c615e8f-674c-4def-b789-6e9c445a2241@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <2c615e8f-674c-4def-b789-6e9c445a2241@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA0NCBTYWx0ZWRfX/hx+O2dOlY5p
 uNL6Jyj+3fUV4VI2RqxYqPztEyfItVujaV5RGRE4njHYx/l6W5bZNkHF475bvIQJoVc5NGNXIV2
 LEhKu6JrBGbmyT5QUqPjp4TeFWxbNQ1JfJW7lFOKKCz+kah0o1rrgUsx1ds5nZKe5RPT1YD6dMb
 nde/T+tZHEVHNH/xtKDN+QK3GTLnxF4p7tHTdIKjB+Lt294Lj5xNw8YzNiHDJJP9Iz6ynP/znpN
 jkuQ2qDrMSEVzkr6fa1xGCQ3RvkC07W2boDRF7GBfPCKkGbzRItA+s21gczFN77gEkOGVvZmoZ6
 pOhiPRi4FvCA47Rm1SKxGnOzkgR33Y4fFSKUi4zbC9v1AgftBcL4L3e7HbDB2vU/BrrlB/fkV3O
 4zZFuXr+PEmjeST9NgD9Aae7+GmcrgCjSx+QAYgnQI7eF/L+IQQPScrR1T1ZQWMBhYpHKnHRLHA
 zEK1LPCZr9c0XKVWrqg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA0NCBTYWx0ZWRfXxLP2pWcCyOSl
 5SswvhaXcJqVphj7MJlmmrcJUe/2izYmTDgEv3Z0tMH4O6rgNaI/QR7lsxJdsEEnkYOYu+K0BsF
 EFoNxFNDgmF0+E2SDdDz68cxUZt7mjM=
X-Proofpoint-GUID: Nh7-pKJikYJt7joaCLOjFWeGnNBqRcW-
X-Proofpoint-ORIG-GUID: Nh7-pKJikYJt7joaCLOjFWeGnNBqRcW-
X-Authority-Analysis: v=2.4 cv=Fe4HAp+6 c=1 sm=1 tr=0 ts=6a4201ba cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=oy-t22pWcpDjRAVjGbQA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290044



On 6/25/2026 5:15 PM, Konrad Dybcio wrote:
> On 6/16/26 10:13 PM, Mohammad Rafi Shaik wrote:
>> Add SoC-level SoundWire masters and LPASS RX/VA macro nodes, along with
>> DMIC and SWR pinctrl states required by the audio data path.
>>
>> Keep these nodes disabled in shikra.dtsi so board dts files can selectively
>> enable and configure them.
>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
> 
> Just a couple style nits:
> 

Ack,

> [...]
> 
>> +		rxmacro: codec@a040000 {
>> +			compatible = "qcom,shikra-lpass-rx-macro";
>> +			reg = <0x0 0x0a040000 0x0 0x1000>;
>> +
>> +			pinctrl-0 = <&rx_swr_active>;
>> +			pinctrl-names = "default";
> 
> Let's move this down.. maybe above all the #cells
> 

sure will fix in next revision.

>> +
>> +			clocks = <&audiocorecc AUDIO_CORE_CC_RX_MCLK_CLK>,
>> +				<&audiocorecc AUDIO_CORE_CC_RX_MCLK_2X_CLK>,
> 
> Please align all <s
> 

Ack,

>> +				 <&vamacro>;
>> +			clock-names = "mclk",
>> +				      "npl",
>> +				      "fsgen";
>> +
>> +			#clock-cells = <0>;
>> +			clock-output-names = "mclk";
>> +			#sound-dai-cells = <1>;
>> +			status = "disabled";
> 
> Let's keep a \n before 'status', everywhere
>

Sure, will fix in next revision.

Thanks & regards,
Rafi.


> Konrad

