Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0353368BD
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 05:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782709533; cv=none; b=tqM6l+R56Gp042hcFKpizo9oxUN1wEEfWfuBBSCsHcr6lXBn/+SdqgmckmzYFaXf+rZkciQuVg4lIz32T0Muvfy2Ue+zId7xj/uFtipA6WufaFF2017NJJtjL8Vf9bdIvkLmcgmXQBGc5KzyTdo52Zcp08fI+ZFHJbMVEg/omIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782709533; c=relaxed/simple;
	bh=8aOJRHKBmfc1+7Rwpqn2N1sXUGdR14XHUpIhVnxAONc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nh4q++TIFamNta5Yjfjtcei37TFitodyykSsa/hV4HjvprXqzdjlYg9GBJYSYe2K7y/xvYiqSYjFLGGeqOunRUtJE4jUB3Nms1dHkrD0UA2Wxvi+m3YMHmwOlT61REX/8PX+oei0sfcpKtLXN2CcTXsrqMckaWCJcZ4w5uDhWpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mcgo6nzT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kWn0xzqa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mcgo6nzT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kWn0xzqa"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NJID1724570
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 05:05:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nO3s3VCHHewstNRZJ4t4fpECAVq2VYK9td73k2+GiRw=; b=mcgo6nzTLpNWQlQk
	H0WYlKlFw4NrefmbGgQJsCcX5te9uZxZLwvK5rSWDIN3OoX7sWFzkHZByEzkBAwh
	CIfB1Cec+02ejRvAC9sgBkBVSvmsTSba2MzGDObdG6qhWfNqxllCT70C2x47DVa2
	4sogiU8RIWZfgY1QXcZ9kQKLW8qfL+YeNOHwviiucsrhjzPVS6SuCt7B/jekd64R
	Fr+zlGiYZSPhtONknfPBLO1fvH6k9uHvibKkKK5NK3ybL16OkqdPE3HtOapgDvFp
	9q/R9kf6M1z7pDuuvnAjUJ0IGvHKt3ZapYY05DSLbOpDVz7WBCJnphPAJZQ0d7jB
	mG/4+w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26w6mjpg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 05:05:30 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c9bd8b9c7so3449482eec.0
        for <linux-sound@vger.kernel.org>; Sun, 28 Jun 2026 22:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782709529; x=1783314329; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nO3s3VCHHewstNRZJ4t4fpECAVq2VYK9td73k2+GiRw=;
        b=kWn0xzqay+rIQu58h4/EotDFhTR9DNsMwgT6T4bn0xED4Lm/K8vtPxxMmINQnqcOmN
         9mfzEFNoMpRw4/Gzn+I57HYQRCjuAgdsb+Et+1G2vEoxOc94O0MPIAIfAJ74x9uFz5je
         kdx8N7n3RRaLgGCcO+9E0oyyEs/u6pl9ZsHNqmT3nRWHul1qA6+N0ZTdFK7tcF094VA+
         REjjLolHzg+3rMFp+WZc6eTN4LQPpu5p7aoQqOm1rktNcMkj+DzzJXyV8mb6tsNQfA0F
         zXg7z4jWYPYuFAkhWdQZx3lAf+H/Kyh31jQVg7zy6ebwNaWwBj5eeBZE2Vr0DSM7B4GD
         sfuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782709529; x=1783314329;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nO3s3VCHHewstNRZJ4t4fpECAVq2VYK9td73k2+GiRw=;
        b=f4W4/Czs8FcCbzfK8RM7zxUYZfTiPG8eu0i7XD0/KkOMu4r2MLCUPAS0weg7rCkutw
         PCPjlzOAeLLuKYG5fmlFH1jjp51FSPMZJ+ENBreeC9ch72+2/b3p6OHSnmyvVrYNok97
         UaOxySTcjg1xfJU8E26xHv9clEgLMbWF9bJi5wlcs9gpq61s5/QcnA+eOKpvYz2VroNb
         cXQWbxAtGZbD4ErViz8cMSZRRexOHrw+5RWBrDZS5thR7YjRwPN0MD+Tu4PWM26yHWKa
         py7dQyYEVnO4KVu1d5VrcrvNNMNJb73wqR0GAWLcNC7ZlEQVSSe9fszSrriL4X+kBRLO
         19Ig==
X-Gm-Message-State: AOJu0YzP10jCiw6v/CQzvy4pNQQZT8SaDMWZtEuUd/tNX9R20Jhb7V9N
	mC5kCEgnzkQ8GuL9AAC1tprGFPf8Y4yg9lCHeMyirevrbpMt8UVHfDvAowhGPrZBtWpPZRzjkAz
	+bWchenRatUIKB23UqAIg1P9Hb4DmFIZhB3BvpvI0s7RMEdPqhqeGmcnXGyy1EeI0vg==
X-Gm-Gg: AfdE7clQo3Ji4JZ/fOu7hSFqfqHPENPkXDqas0WEGEgGqJQsHkziBHP3D9LrvnfT85S
	oxHYR33dWktQaaeYmuuY3LamvmnAc4BL/LMddjNqJJyA87Sdp5MM7IXgk45PNm+EZu6BqvIpHUA
	xJyyBRFgQTgAiU+cxWu+gGJ9MxBpUhNWkfyyLsElJMO9XB0W51PKXysdci6lB9ShRjxG8gZxD/5
	D9D48WCB2SWaXe44y8f10ne0s/RtzmuWxkjfTgcS2QVkltx/iROqqCAKrYPcT3e3LWSfyRt+962
	Mmm/4Odzyhz3fDVvOXy8tMuu9OWD3rfKf9N0LjbkSHHeAlaUXf/AhX632DF4Bzap+HAWVTShHFM
	1qHUqgkC4NlqGZUsjcstXaRgaUVonCYdoWV2tEyTV6vWJ2bU5ww==
X-Received: by 2002:a05:7300:d0c:b0:30b:a257:3a2d with SMTP id 5a478bee46e88-30c84fd07e6mr13311461eec.26.1782709529455;
        Sun, 28 Jun 2026 22:05:29 -0700 (PDT)
X-Received: by 2002:a05:7300:d0c:b0:30b:a257:3a2d with SMTP id 5a478bee46e88-30c84fd07e6mr13311436eec.26.1782709528887;
        Sun, 28 Jun 2026 22:05:28 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ca5f15024sm31653192eec.17.2026.06.28.22.05.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 22:05:28 -0700 (PDT)
Message-ID: <49d60b9a-127a-4f3f-84b2-ebf365257b8f@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:35:23 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/8] arm64: dts: qcom: shikra: Add QAIF CPU node for
 audio
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Harendra Gautam <harendra.gautam@oss.qualcomm.com>
References: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260616201315.2565115-3-mohammad.rafi.shaik@oss.qualcomm.com>
 <41118d35-2b3a-4f49-8add-bf501bb93040@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <41118d35-2b3a-4f49-8add-bf501bb93040@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cnjghbY75mB-WFX1DJGUxKpg0PSA8CCz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA0MSBTYWx0ZWRfXwGID6n4SOdvX
 BINXyYuP/LX49DV4Z+5SoM4dJWT4cmtKxsCSKumI33Ou3qace3OPQXWKLId/izu8s7ppDb9TCfZ
 rQUyPUA2NlEeJcZMVvrRv+0grMggXBo=
X-Proofpoint-GUID: cnjghbY75mB-WFX1DJGUxKpg0PSA8CCz
X-Authority-Analysis: v=2.4 cv=SuugLvO0 c=1 sm=1 tr=0 ts=6a41fd1a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VdTWikP8Db9nZ3PMghEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA0MSBTYWx0ZWRfX0GroWSEJiBzl
 KhF8yFGSf+0/usEI6PGgbr3lr0MY1kBh9sc07kRHJyo75icPob+YI6UdCs3B2VGT2Z3E5kv/Hbh
 GxJNDXtnh0ySJQSwxUvWnvFn30iLfLvMGZJahbwUDlUCLUQz0bvAmwiZS5Lv9RuIPk89LM8XepW
 4eRaUOcDjdBItu6qKCvcOnkxeB4PpSks7hrY3KssoMIdfc+Zjghp0lWMopaydVRWcug8bOg5hxu
 IQe9TLSSlNKlJVdSK4dQcNeY9GuN6BgIWLmBCrw7FFjeEVEw4wPpcpjC4PUCZ9zDHumAbUE2Sqj
 u84m0w5VxW8ICP5hId/FWyaHOxM94Y6+HTWaHwH0EvAZJwfiiACz0/4F7em7pYr44RhVGkxlON+
 iKS4KS5cVSDq2SKTp/PXEJJYDXojvPhvEJIIJ7sbMUYBkftgqWhqD1gOLyyda9jrVBKEIizBIuI
 oITDc+oFcQc1yeWXAyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290041



On 6/24/2026 1:50 PM, Konrad Dybcio wrote:
> On 6/16/26 10:13 PM, Mohammad Rafi Shaik wrote:
>> Add the QAIF CPU endpoint in shikra.dtsi so board files can connect LPASS
>> front-end links to backend codecs.
>>
>> Describe the MMIO region, interrupt, IOMMU mapping and required clocks for
>> the QAIF block. Keep the node disabled at SoC level; board dts files enable
>> and consume it in subsequent patches.
>>
>> Co-developed-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
>> Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra.dtsi | 46 ++++++++++++++++++++++++++++
>>   1 file changed, 46 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> index bc4ad2bcbbec..e58c87fc8cb0 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> @@ -2017,6 +2017,52 @@ dispcc: clock-controller@5f00000 {
>>   			#power-domain-cells = <1>;
>>   		};
>>   
>> +		qaif_cpu: audio@a000000 {
>> +			compatible = "qcom,shikra-qaif-cpu";
>> +			reg = <0x0 0x0a000000 0x0 0x20000>;
>> +
>> +			interrupts = <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH 0>;
>> +
>> +			clocks = <&gcc GCC_LPASS_CONFIG_CLK>,
>> +				<&gcc GCC_LPASS_CORE_AXIM_CLK>,
> 
> Please align the <s and "s
> 

sure, will fix.

Thanks,
Rafi.

> Konrad

