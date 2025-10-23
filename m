Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E629F3081A7
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 09:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761211848; cv=none; b=nwphYsW9vda2H/WzsDeaWBRafwjUX9bz9GAuI/Xq9GNcf1KejgWPuJni5srzdV80ErQc4wj2+26RSs7ldKmiE79Roihg0A1dzax0vMp3bvOOrBG+mbDx0cfIfaYK53vwqxS1kdY3gqntoXa7gbb7c3mNoNM2RrIzkSBH/QJJIbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761211848; c=relaxed/simple;
	bh=gDpUDiXrDas6zKuKFZJhSQFS5rIKPulwiUd2vxXh9MM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Krlzwzit0upLdt0XgN2bE8EFjSGavsNphVO0YzSCxNRjSCWHFh1vYokq1flufvy8kQNvIt3QrNv04GYYol9wpoj3zs6ofvvosDjqbA1szYg+7tHgKShSmJoIbtJu1VFtjrWucUVecRtiqCxXhs7psAjRXKvgV7sQNS4h8c9eK6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lbNeaaBT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lbNeaaBT"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6dfkB000663
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 09:30:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lvgrhya8OiRRBgIX3KTvLE88himJCuk7lyQHjo9ZbF4=; b=lbNeaaBTGPJafyi/
	nyzF4ismjyfezEmXhep83IaTcL6tanuI7Znm21t2ByjlsqjpPG7mj2zh2WxSmT9s
	9Os6es7xQowzcKhOlwIRFZooJl+VMMsukNkNAZTavmJnoSdRVX81GfgAMuG3+N5P
	bXIpjM414MM4qGuzXfFFajL9NtK2Zhr+S9tWZAXUHuUtad4yA3YGMNUejyD91/M5
	l1EdcZAfWbvj2u+4wP1VzhcjDg+L4OAwrx9/VlTq4qveH7N1zsnTupnT9apVG+Tz
	RGkiBAnu/ohYoGtZpokqqRZXxZu7xn5W4M+eIXE6dEb9vCB9lZqNPqgbjh6Ak0C2
	H16HSg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49w08wdgmv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 09:30:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e8bb76ee59so20094891cf.0
        for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 02:30:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761211843; x=1761816643;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lvgrhya8OiRRBgIX3KTvLE88himJCuk7lyQHjo9ZbF4=;
        b=Yp5g+2VzPA5nYuW149zlDWaqFufyflbkwgVu2veCboVHOs96+LKHlNUAs0qtIMYIhd
         B1bYH/zWWneRUgExMMvlm0KXwkqZImd3cqecYqN7nJnvtMrM/zVwH5a5RSic47HvpNvm
         SJ4/waOTSvC9LTriwvtJejk+BERUR5bNLaMV2DqjDmBOTeGnl1Q/Uypw0DaWPBLEau8M
         eOeQ2+SE2YsuwlVh8SpNLyWU0gj2ZZJHHfTfBcTTZ3liHKH22v41z3sTaGNVGkdoX+BR
         XF+A9Kmc4U4xAN4dODKhB8EfYm8M93TobL6+Peb8BqBTz7STJf1EKOc9mlHXwO3xRXGK
         g9Rg==
X-Forwarded-Encrypted: i=1; AJvYcCWQAnsQXMbsrLS2tn4mNssTaqmKIYbggi8l+HKQd9qIDl+yjy2jv3jh5hJSVplfJgaGkgRFcROYo4i0nQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk9wL2rOwP/5SwnoBCM3CjhfsZhpqcVcV1a0LLRceK17od1ZG4
	uqMa32TjdHltess36+WQYOHZ70qB763mgIh+Pjw7d1+1FQlzC8/k+I8T3pLBfeW8SqTSij7s0yC
	pFvONf5KheeWBDvfLT67DvI3rbXsT9ZGVN/jzam0IBzHXhdVyL7q6exUsEZPZg1TmXw==
X-Gm-Gg: ASbGnctgzP3z7U6qsRCdfIulJ7c33TmYmvq1bcQqVskennRMH++0TE/oJLY3pxZY1+t
	NGy0L9ACL6aM+cxU/tGydkQxnAIG2akjKPbEsJuXcH65AV+sx+Z42PPHoZyc8+7OmHFgAAeRINE
	TMqDPjxwfpWOjSB2Mj8EHZCJZq6EO4ThbuMevtWf+39PNlppMA+ghT4yS6n5/z8ngCj0NOb7+QW
	c3up1J2WYitdYc8L90EiO001GCDl5tGfwcyAjiQV/sD1fSKkVDOwRQHAaVW0qK3c7JdeaMklWFP
	9UzG+j0L0qfnOq3/rlLpo9uLe1xhoe3Bt0KkZMIrXnhQOLUYKOHV48EtZR99FE5J9dYTCL+UjTg
	vIOY/Tm/I2VydIlSOpFnNNFIXzg==
X-Received: by 2002:a05:622a:1a98:b0:4e8:bb14:d97a with SMTP id d75a77b69052e-4eb81020578mr17636461cf.3.1761211843502;
        Thu, 23 Oct 2025 02:30:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFffBBqQZW9ZspBnX2nRA2fUq8D1XIhDY4m7fLDnOMJqAU+Iq9eeSK2rMWGBbo5Jvh2IgA4Qg==
X-Received: by 2002:a05:622a:1a98:b0:4e8:bb14:d97a with SMTP id d75a77b69052e-4eb81020578mr17636221cf.3.1761211842966;
        Thu, 23 Oct 2025 02:30:42 -0700 (PDT)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47496be2eb6sm56430105e9.2.2025.10.23.02.30.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 02:30:42 -0700 (PDT)
Message-ID: <a38edaa8-d793-4e3c-ba9a-b8717c8e7569@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 10:30:41 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] ASoC: qcom: q6asm: add q6asm_get_hw_pointer
To: Alexey Klimov <alexey.klimov@linaro.org>, broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, m.facchin@arduino.cc,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251015131740.340258-1-srinivas.kandagatla@oss.qualcomm.com>
 <20251015131740.340258-8-srinivas.kandagatla@oss.qualcomm.com>
 <DDN8PM13DWWZ.BCXRTJIFB7PD@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <DDN8PM13DWWZ.BCXRTJIFB7PD@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7M34Fw06LOmDfsMwvfYWt4grhC8GH99M
X-Proofpoint-GUID: 7M34Fw06LOmDfsMwvfYWt4grhC8GH99M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE5MDA5MCBTYWx0ZWRfXyFbgHfvix4Sx
 3AEjgBBPy7FsPh+sGriQmxy4TG1ACQpCbKxNvkEyoeF2b1a4ofl4s6UbOWsoGgcnzYr5OCn4UeR
 eQ9C8mG6ag+5h/1KnLp7GkXVnvtudMxfZ20G36OcuOqO+ic/5ZygIq6kUl0JkNaFbMPT5SUWEyE
 u5mohK/eYunRsNd/bYt7xeagz/VJil70ImaKVui69zYneBGlAGWEzyxpH+7kALdz0z85gP6syjv
 7opBkjfpbeAlK92NZI9RK7wCC/dC+utHzSYUCEX6czIl18FAACjETTXjnK+xMpOBgdtNiCGfsmI
 gdyyQY3NvoxJ6BvizSQxsymXlVMRJ9a1PbFkWrg8QijC6TqU/2XZBjeOFl8/KsLzpWn8yaJN7wC
 8Wao6EeCW9IWrYgLdEU4TWg1TVb8/w==
X-Authority-Analysis: v=2.4 cv=V5NwEOni c=1 sm=1 tr=0 ts=68f9f5c4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=0tmoJSEW-Zqf1m8SmKkA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510190090

On 10/20/25 4:04 PM, Alexey Klimov wrote:
> On Wed Oct 15, 2025 at 2:17 PM BST, Srinivas Kandagatla wrote:
>> Currently we are performing an extra layer of calculation on the hw_ptr,
>> which is always prone to errors.
>> Move this to common dsp layer for better accuracy.
> 
> The subject says that the change adds q6asm_get_hw_ptr but here it says
> that calculation of hw_ptr is moved. Where is it moved out of or from?
> 
> Currently the commit message is confusing.

Sure, Will rephrase this.

Currently q6asm-dai.c implement tracking the dsp hardware pointer based
on callbacks from q6asm, this is really an overhead, prone to errors and
redundant.
We already have buffers and tokens which can be used to get hw_ptr
location, use this instead.

--srini>
> It seems to be potential confusing split with commit.
> ("ASoC: qcom: q6asm-dai: use q6asm_get_hw_pointer") where calculation
> of hw_ptr was implemented in q6asm-dai.c.
> 
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  sound/soc/qcom/qdsp6/q6asm.c | 12 ++++++++++++
>>  sound/soc/qcom/qdsp6/q6asm.h |  1 +
>>  2 files changed, 13 insertions(+)
>>
>> diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
>> index 371389c8fa7a..643ca944b1b5 100644
>> --- a/sound/soc/qcom/qdsp6/q6asm.c
>> +++ b/sound/soc/qcom/qdsp6/q6asm.c
>> @@ -6,6 +6,7 @@
>>  #include <linux/mutex.h>
>>  #include <linux/wait.h>
>>  #include <linux/module.h>
>> +#include <linux/atomic.h>
> 
> Ideally this should be sorted but it seems it was not initially.
> 
>>  #include <linux/soc/qcom/apr.h>
>>  #include <linux/device.h>
>>  #include <linux/of_platform.h>
>> @@ -248,6 +249,7 @@ struct audio_port_data {
>>  	uint32_t num_periods;
>>  	uint32_t dsp_buf;
>>  	uint32_t mem_map_handle;
>> +	atomic_t hw_ptr;
>>  };
> 
> Thanks,
> Alexey


