Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD66D39E6D4
	for <linux-sound@vger.kernel.org>; Thu, 16 Apr 2026 11:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776340677; cv=none; b=cOUujlsYqzw2feUVFyqnWgcHjxylxzfRVMpfrGdtE8H/13YaGHmt40jMAwa6XLrliRXSCdq6iy7Yop3GngldLOYhYAgQR4gUqaheZshaB6kPEuoMp+ahHEbku60JTNzBOZSKibn4zDqZEpX7cOt3FAqPh/TF+aPeyvg08xbRZq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776340677; c=relaxed/simple;
	bh=2D98nQHSqEFRJlL7St+tNzQJ/s9VFno3rk5REp8EmWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OnOlkIjYDlrSdpBr6mFEiqqZgxbtw9RAsrYOb77L8n+7DcP2wJ3BjqMjuWOQhCARqslNmS6L/5N4/flhiA7GOPbauZz+BnwngxbajxIezLZbAOif1tG0WO4HLAY+bhnn6w3LGC6Qt/uNbFrrhdBufKjwgAIpDrja08MvRCy5qAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h8X9yRhA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AV3Fkv+f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h8X9yRhA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AV3Fkv+f"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G6Ossg2652064
	for <linux-sound@vger.kernel.org>; Thu, 16 Apr 2026 11:57:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AhcM77xlh2TTAbjpbAcgrTr/3hSLsHGWppej/lGE4oY=; b=h8X9yRhAhcpWwcvH
	LZiT2XyVvxY1wphmBgR0jhM1qd1wzCgZoTU8YQk5a5zQGXOumBdIWJO9SDGXDZaG
	DLfwsCw+HnEwog3JrGC+dXjgbvaI8iV/rCQHrVF15KOAHbUBGe4K29QIMs+zl7lk
	bD8kpnVyXS53UQQeJZiSPLklE/8hDamAT1Q1kGByIP1zrE043WA1obrkNPg4Yjij
	wv79gOqftle0eJIfQxwp1yERPlQarjkuSHLPU7aozstYodVVQC8h1wDC0aJ08ZBG
	mMR8J8qYarVgfFzsGR+sFucmfIG4XhV8GPAIKwmSt5uFFH5m4nZv19+zKFREdr+d
	LYKFow==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djtfuh5g1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 16 Apr 2026 11:57:55 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2e8ff14e5so40300645ad.3
        for <linux-sound@vger.kernel.org>; Thu, 16 Apr 2026 04:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776340675; x=1776945475; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AhcM77xlh2TTAbjpbAcgrTr/3hSLsHGWppej/lGE4oY=;
        b=AV3Fkv+fY7w+m2bNGhlnxh/cPu6fLnbSKCQgecyty8MZLZ7H5Ko/2vWa6vD1nZlmqX
         xb0BbEvcMhoSsooGbAkEYGutIwsdn0zLB+ncmVc70u/QNGbAiKgsNtYpc1TdrTlVbLHj
         dRR7mzT5JrBb3rQEOo19WR1K/XE2l0uklR4SABg29/x+lYwav8s6yLC3m7VG9nx0/qCm
         xB+eZdUuZrkfdXDTBL1nD9g5qbfFlYU5Opbq2c9eZ60JpcN2cL4gOBIRfrE4yTwC51er
         l5IMJx9oNfnriJLxNXot31cgyXBpe36OFcZgQvMwATFlFZb5bY5lkphmRTfZYzPGJdEf
         Wjhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776340675; x=1776945475;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AhcM77xlh2TTAbjpbAcgrTr/3hSLsHGWppej/lGE4oY=;
        b=GnUWZzE2KkE1hfcyAmilnPR8AFbgkYOpNYClcLQlDLwEScfUgZOSkbAv8ik5D5/TlN
         BmSlqzDX9NiyVRzmxIfdZ7y7z49jJHC1XiA/5ItP6Bx0Za99NF8LzS+jqby4B0nlEyF/
         U5KxIHwJpxuO3FCFiNlE/s504tUj8fO2bF8MbF3wyC/lkmDf2e+Efrj8XMOGhW2zEqqC
         ieQzXF8CHmOHZEOiLuXShaDzIv/MGmQPVTEy805BPqYV74UfR16NMpTZForyXdem5EnM
         wywzn+ejAso6ZX01oMS/Rd8Ztts988luCG8nKTbj/vlLiLaolTOuZ2OaSCjuyTQd+2kC
         6g4Q==
X-Forwarded-Encrypted: i=1; AFNElJ9RtVpZMuq038ctCAliSo2DKB4BjUvTIbkKGR5+xdnXZVo3RH+jdhL7Mm99GPPeUpRVZninuOWHqRCviA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxORH/UZw9Iz0XAXG7x/moGH6Zu7jCwxvt7I+fDkQ3jczjylDwl
	GeFJZh598dYXaAVTi/AaKOrlRe1da7PBewcDQq8qnrEV+ZHsURJGtUX4fyEzHFdcuWhXkc219Di
	NnWp3KuxdT959ozwlK6T/T07NirX4fxdYy9HQf+gPK7Y3Eo+mRGtBGna/2ad6KuTcHQ==
X-Gm-Gg: AeBDievQvry9aoMVntOB7fb31c8e4d6z0gIaZ2yxuGC23DDs9lqLFCFyF1qsJTbLJOz
	9wsxjhWgiSY8xK9ObEZ7Ewv1EyFWqd8f3xS/QL82qpQtlMTd/wPCtHT3mBidYEU+0wQv9Ncq/Id
	mZbskQoqDU67H0EoyqfvlSQoHLSliuZexFPiK4aZ1WLBoFB0s3sZABhlA46xQK3TMzg4zY5vxpE
	iNN0TaMnvgmQDP/X/zV+ybg+oAt4ZRj0T/bmSdIEac4duyS968UXeBf4uKtRk0caqxSuqUM4M36
	llEI2IuS/Dt8yaKlyMnHG8bbyVFGB6SuLZERDJvsGmcilYvlpl7ImjY2GX9HTv1Bh5mt02Aqvm0
	DfQk7wNqNlPnpw+fnoRzlsn5pfZxqQwJ39xp2fHWaDVR0op0w4g==
X-Received: by 2002:a17:902:7001:b0:2b2:4e5c:69a9 with SMTP id d9443c01a7336-2b2d59411a0mr170402535ad.5.1776340675212;
        Thu, 16 Apr 2026 04:57:55 -0700 (PDT)
X-Received: by 2002:a17:902:7001:b0:2b2:4e5c:69a9 with SMTP id d9443c01a7336-2b2d59411a0mr170402405ad.5.1776340674727;
        Thu, 16 Apr 2026 04:57:54 -0700 (PDT)
Received: from [10.219.49.106] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b47826e11fsm71025905ad.44.2026.04.16.04.57.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 04:57:54 -0700 (PDT)
Message-ID: <bc1e2efa-a77c-4f2d-88c5-8d56b8c7ca31@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 17:27:50 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] ASoC: codecs: lpass-wsa-macro: Switch to PM clock
 framework for runtime PM
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        srinivas.kandagatla@oss.qualcomm.com
References: <20260413121824.375473-1-ajay.nandam@oss.qualcomm.com>
 <20260413121824.375473-2-ajay.nandam@oss.qualcomm.com>
 <05ec7d33-1dd5-4e67-9c88-03e39e02c39a@sirena.org.uk>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <05ec7d33-1dd5-4e67-9c88-03e39e02c39a@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: nndZetSyMpwyfqZ6pClT6FxvG8mcwwHP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDExMyBTYWx0ZWRfX5R5YAzsTknu0
 vc7h7piMu0Hjfe+SD2ef+tmmU8cDaxnCYRIA6nvHyXm9wJ04+5RymoS/3vCwzABv/dM30Im0aml
 /IpesZpIK33Tod/VsoIbOApMuAjOi+hW2xt7a8vELSiRtQc3gilLVICzb/+qNjj54a5eUOgqon+
 Fa0vHBr3FHhHyUt7RnNQoAEdYg1HXnHkhecRNs9vvA/IKYSOnuqQCGsk1xkkymzTEo3X4SSr2hk
 /7gyH+vulKK5aN/hOht1dfRuwSdcswg5WkbfWv7h8LW19WIfRzF3/5bVdftyxR8Sdf1RTyICmek
 kn188u6SP1aE97YeqbrBdLsWFoZVHIOkOoCrW9+xu+ApjyNvlhKQK5QAtcoAwKKRksZjyVww2fi
 SO2+5b+rum0FGgP8gXFSWT5igSve/W7jJh1UiqfMHyBfAH68F3xMuGhJU2cxpcrthhLZqdlwlOS
 uYrMNKtFJUtYLLjXOXA==
X-Proofpoint-GUID: nndZetSyMpwyfqZ6pClT6FxvG8mcwwHP
X-Authority-Analysis: v=2.4 cv=KrF9H2WN c=1 sm=1 tr=0 ts=69e0cec3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=u64-0Fqa_K30FgdVMnMA:9 a=QEXdDO2ut3YA:10 a=uv9OGK0VPFgA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160113



On 4/14/2026 5:32 PM, Mark Brown wrote:
> On Mon, Apr 13, 2026 at 05:48:22PM +0530, Ajay Kumar Nandam wrote:
> 
>> @@ -2868,34 +2846,12 @@ static int wsa_macro_runtime_resume(struct device *dev)
> 
>> +	ret = pm_clk_resume(dev);
>> +	if (ret)
>> +		return ret;
>>   
>> -	return ret;
>> +	return regcache_sync(wsa->regmap);
>>   }
> 
> This doesn't unwind the clock resume of the regcache sync fails.

ACK, will correct on the next version.

Thanks
Ajay Kumar Nandam

