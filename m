Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893E62737E3
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 05:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782709213; cv=none; b=dM9zRC+F/AixdCRlEmVHbBqwRfDx9Nf5ga4Pa321xRiID6T7qz310LIZ70/Bws+ZroDYMZm8ugg+RybtRwwZokyfwn/MxO7+72ibeMbfyNIklJnlyJj0kMUcOOwRWEGjef04ymysbZNu0uLhLe04IbVrcvJHTP8kSCOosKlo6gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782709213; c=relaxed/simple;
	bh=U6aiEFk28xe5SvO/yLkJnO8WbyNlnrJ0dXv5Hg7E+xE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GiGuDzxIoiTdc23d6+ygmqPRKRvTBiTDgdJgvjzeaZLMps+aHmnYiALlTo1tYRK2krJAR+KEHlvY9T0b7WcB0vwflSsqyworyMAfNysDWqZ1cwAiRneAfxlMgnPCBqgyrVxvdkJpu9tOOhv8wYTunn7+wvrsQcSKVXXdFkMaIQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZHZXT2B2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U7W73Fc8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZHZXT2B2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U7W73Fc8"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NHXu1787648
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 05:00:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vz2AE3fe/xpGnAimt/15bVfH5RoWvbl0nmIK+xDjCNs=; b=ZHZXT2B2lSS4uFPl
	Y0RvDR1S3sNTUNML6basKc/X0EZDrG5KTqyr2cNNnR7OO2lthCqJN9eflVIx/jla
	PaV4zzyzONzwNZddfMPYl3D5bnX0Iw5vIJPbAuJIqHBxc/gwGX8myUAf8ASgBpTW
	vpQOIn6Vv58cCkXVlWNJqcGJPl+TVTmBaNh9ByF4W3rEL0RQKDfxuvTl+J6BDWAF
	wqaniy6GDCeDcD9P8JgIxDTp3BYeVLChb/YblL8fBGy3F0RtcWNW1K7zNEesorCq
	ktSju+5lNY1097WK9ZGswaIggyqd5j4AXSKBzm2MQtNuVVfczkYmIz5auj1w8hRx
	1d9cLw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26tuvhx9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 05:00:11 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so13589949eec.1
        for <linux-sound@vger.kernel.org>; Sun, 28 Jun 2026 22:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782709210; x=1783314010; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vz2AE3fe/xpGnAimt/15bVfH5RoWvbl0nmIK+xDjCNs=;
        b=U7W73Fc8vRwAUBpNtRZ4ouou7Hrw/Uzk/ZZ3+VK86C3FeEoSgVpiptK6J5a7m9NrP5
         vpSV4eaHhEbVy9+Nng8FU/V7Kku4jfU/yYk7S00RaXRriS0VT4TH0NrCaaT8tl4JS4TT
         27qTqbmpyiChSQjnUpSfQaTzofLWPlNY6evTotI3CUwLdemfOe1Y7i/NjBJ49FQbzdym
         8aOFZRlHOP5hup3DtXmtR1VThLYqCoug+yL4cLjy6X7rMlcuJEWrl/qNKkaf+omaX4Pt
         Sa4C0VRfIqXLSJMItl3xRUpc9QLTceSguuxmUQt0fjbMl5nLeIp8+J4Xk9xdkRGjziP6
         sTKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782709210; x=1783314010;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vz2AE3fe/xpGnAimt/15bVfH5RoWvbl0nmIK+xDjCNs=;
        b=kz6q9S8kIoGPFC3OkUU1bUAQnkR6OIiAC/O2AT8rvhu5Y1ZhuRgndkaHl2vjncFlg4
         dH0+zmPPZaNjvtA3PHVxPADNDmREvbEVm2n9J25sor1YvxjZghQoEbSVNdTHP5Jg5O4a
         arGa5gFAjXHUg4NqxCmfPxGa/+uLKs8abMOpI6j/aM8o37fzI4z4kyyrJvbjDR29I7Nk
         8lmVrd8rczeOHx5p9q/Yzec1elb3GFXh8irQBBAq4JVGM3ZPZ/apraxwKkdChIgs7uMd
         8SPfLFveg/ob5xWduxOAaoFTB/C12APwdPzgDGXRACxR5s2cDoknwe6JBfJtNQdmAoS1
         4ikA==
X-Forwarded-Encrypted: i=1; AHgh+RpNhxlvfKNF2tQvvkTtVmDqarWjDW68Uy3J4atEFoy9zLE0qyNGOp22KOCvA9PwUTYZ+PqJdRSDmwq2ZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRQIV6tZtELF9neCtQirscn2uGiWJid6FJPFdfHnRxvJ6qHIhL
	lAF4DrfrOrnUFlZpZmfZRDIxHIki6GkHRkwXTPWQ5vS5Vg8rN03vD55NqtmvkhuJbDCIIGgY1aQ
	q8jLjabV0ruqroynrssla+iUW5EhAH+SFrc4Y6Q1r5m+BX7FQYi9RWCGVQRMsE0P0Sg==
X-Gm-Gg: AfdE7cmmDRjo+stiOIyPgStyUkwbHR01rEtUi6qzJQkYJFAhHn+tGPy0n2vm3idKOtn
	vPPYKUd38v4Eba9k7Pl3mbcGCU1T8lM0aDFkn41JJv8ZTeDe5ozlADLOsQaz55/jA5poj7DxwdE
	5HbEtLbzzu1gT05Ls0yVps67UF/JHWBb3BS7CNcctWzFfzlkD95X++5J9D9D5NXQNIIWFDV2zfT
	7kdQrxKnN54i1Ue6U7f2G1KoqUMx66mVj5G4G6txsR8zanWg9Nh1sylGgjXUeY3MeM2cJGrnmjV
	eFvF3BbduiQnisxwE8lT/h3IRHyLmUjesTFWIiPbTMNhX9nyIBrtoPSB0W1ilNaJeex4CjZ/yFZ
	Gy+G/+5R4O6AhKZ+69wAsiR9hj/sicYVij4cInxQWsKx7t6NGfg==
X-Received: by 2002:a05:7300:8191:b0:30c:19fe:3c99 with SMTP id 5a478bee46e88-30c84db2febmr14993419eec.28.1782709210497;
        Sun, 28 Jun 2026 22:00:10 -0700 (PDT)
X-Received: by 2002:a05:7300:8191:b0:30c:19fe:3c99 with SMTP id 5a478bee46e88-30c84db2febmr14993381eec.28.1782709209892;
        Sun, 28 Jun 2026 22:00:09 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52c591sm54780046eec.7.2026.06.28.22.00.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 22:00:09 -0700 (PDT)
Message-ID: <b7ac2984-5d95-4d11-b633-68ae4b64862d@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:30:04 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] ASoC: qcom: lpass-rx-macro: Add shikra compatible
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260608172023.2965292-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260608172023.2965292-3-mohammad.rafi.shaik@oss.qualcomm.com>
 <0387ad24-4b34-4e1a-b6f9-44158417f308@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <0387ad24-4b34-4e1a-b6f9-44158417f308@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA0MCBTYWx0ZWRfX8SBUlcR374Yo
 tuwcK7e24H5W5NbOBwHbjVAaV97Cm3gq2nQQgaZEImqP3ehkb9Z1F+osi39A71Eo+8Y9HL39r5z
 p4OPL7xfxtcv02scG6B3B6L3OnmnXuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA0MCBTYWx0ZWRfXwK8A+fGR3OzB
 vqKiMcuMbbCINu0ngABKvjDKjXt2mXzZXOzd2ufF82plnMfzb3Wu7+Vr25G/IoYqHJxTm5WAPai
 4bsNQtcQv5oQnkw4mEh1pl50H/MDUnhOKBd4+LwEJhVtQwI2NqkLQmyake6p8rN8xazrgJgxDxj
 NJr3RGen8JAvYH0Ob09NdmugED5TC83T+YR5dWyqSoClOhCHCMZD6PjAbmZyn/qc4f6DNrIpgZA
 OzRz1iMU6+xhEf7hnNaFyCGttTZQI52wyP64DNkrIxU0hoZgwDV+oNV/ccKhNAakl7rr9viOPkV
 b+oN8Ki3gQVJyOjUMAN17JfbUkoQp73tWdYdBGy6fpRgsVoojXXQJYmv64EKx/0cElg1pf1auO5
 6X+HtXslqhpN/umSTXrUViKLzf8wvaEXNq00FIN+DPTkPh6Ss+wsJJ+KFccWQy9EnWxchQd1Upf
 lqatcxLft5s0iDe99FA==
X-Proofpoint-GUID: V_FfTe0SYNkhYje6-MV4uFpa2-2Tdi-i
X-Proofpoint-ORIG-GUID: V_FfTe0SYNkhYje6-MV4uFpa2-2Tdi-i
X-Authority-Analysis: v=2.4 cv=DY8nbPtW c=1 sm=1 tr=0 ts=6a41fbdb cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=KZhLYVIlkYrD4OtXSOMA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290040



On 6/9/2026 2:41 PM, Konrad Dybcio wrote:
> On 6/8/26 7:20 PM, Mohammad Rafi Shaik wrote:
>> Add shikra RX macro compatible data and hook it into the existing
>> LPASS codec v4.0 flow.
>>
>> Map codec v4.0 to the 2.5+ RX register handling paths, and enable the
>> FS counter bypass bit during MCLK enable when the platform requests
>> LPASS_MACRO_FLAG_BYPASS_FS_CONTROL.
>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> @@ -2043,6 +2045,11 @@ static void rx_macro_mclk_enable(struct rx_macro *rx, bool mclk_enable)
>>   					   CDC_RX_CLK_MCLK2_ENABLE);
>>   			regmap_update_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
>>   					   CDC_RX_FS_MCLK_CNT_CLR_MASK, 0x00);
>> +
>> +			if (rx->bypass_fs_control)
>> +				regmap_update_bits(regmap,
>> +						   CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
>> +						   0x80, 0x80);
> 
> regmap_set_bits()
> 

Ack, will fix it in the next revision.

Thanks,
Rafi.

> Konrad

