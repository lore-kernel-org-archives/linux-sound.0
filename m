Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABDB21FF21
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 12:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779454491; cv=none; b=XbvE2MmxL85S1/RJs+Yw5hi3FW9q3ZoZ5PaLf1W2ckTqpFVXa0W02d9HJMN2oCnSeUCOfh6Kf1MYX5361lXIHUJCl6NbYFgsnMGxDcwWmLGVe2Q3nwDPBhc/4ne5nsBfb1brITwtnC7iWd95xWJyEoZYgpwn6HDTejeX8vzjYKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779454491; c=relaxed/simple;
	bh=VXs78MA6J6D2rEIL2rbG2HPAMQtSJMsnE8RkJzkUqFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Co2GaDT93ei+QwtHKRu5YEv4BAyhXv+dRjUNnfV/SMJsradPrlWcgVtkc761ADTh/LPduXwWsr4jtynqoSsS+pCyLvGLXVaPvk94clKurTg4M13qqBlesIkaLR0KCDRciUA+fUlcoV85UkKXQ3r92wBZTOl/1suVWRBIqPIh3Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eH3ezz6C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XYLAs1ea; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eH3ezz6C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XYLAs1ea"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8oXpa3532131
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 12:54:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ea0S4zQrwmtFxTVo56imyzNGzEUv3R6pf0Xv6mhSt+4=; b=eH3ezz6CCIOp99hd
	5VYtElxxuxo4usmOpIB6+VfqXgWbE6fasfSd0zClgJB3qfmeDH+WUi/er3UZPkfo
	LIIQ4UrlIPWdr5CQRDlGqOGbmeZzbFDRfOs0wSkYIk+nqOQBlwYp2LUlDbRUjqV+
	M7L4Nn0ZqW4iVZiJptSXUz92XeVZMPQ/5942ok2YqjX00IZp0dIp5XNvbko1GDzP
	GtjBnBHDodkjsfOSzkcNKmBDkLAJT2s4Qv3COmLpSc86SyaW9rqSAqWfDp9TfG/I
	EiuHemXfTQ3R88JwEgYOsInARjR8Mg8UNCOi9CaTc6DvM5it/fVFfsUfCZDOmXqp
	U4atBw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea39gw3fk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 12:54:49 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82fa1c94b37so7745439b3a.0
        for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 05:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779454489; x=1780059289; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ea0S4zQrwmtFxTVo56imyzNGzEUv3R6pf0Xv6mhSt+4=;
        b=XYLAs1ealLlWAR4I0npoIwzt4IXtj41vYcsjs2RJ8dv8ZXTXi8iLtjwvySte4eeVAp
         bhMvo5rOsg/s/OXSVrNTLjqgoZZX8Bz5d4XFwXZwCn0uFqIbKH6lb1aCyAjG7e0S0W5v
         BPpiJS2DKfq3Uwv/Otu+BO9ZckD4zZPJ8ViNHWa5o+jvzcBw333FfQWFQK2/hFsptSwE
         Og5R0aJ4hjd5lfgbbrGkU33oBjbWN1mkjXjgCL2pgRF81yjYfNThQ7oTBW55+NxzGxme
         JC5J+pSdmwfdV7ib1f5C8ZTk3wwwLsfH58JHiMm/b3hSsr+AhHJwD21QsRDomEdCL4sq
         xDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779454489; x=1780059289;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ea0S4zQrwmtFxTVo56imyzNGzEUv3R6pf0Xv6mhSt+4=;
        b=lcoRucBsPOd4Thg/WuiVkUdLRxbHQB77McXViJ+Uf8fWhC1fgSocyu13hCmBOrgGQb
         RQyDgjSMIDBJworVFsb4u7velnKqZ2qJ+1ckEV6ywkSolXviNmW27W7npUtMOHmLfeKL
         yaJXMlx3YOznZvTVvbEh9X8GmEVBDgzUvwIhWVq1Qq/1u+VbWvBg5+CBbGY4mlftnNZt
         RBbJjzcg1h5A5X37d2t11tXWh0yrrPOYKZjxQB8Eb2nXX9AVESb5GkjBTZPiWZn5wWjx
         y4qmmeSSZJmH/mHivbOeYuYPnIUqFi5sOGVOIYtQLROyLgviRi154iqWkeHSmChe/cv7
         HXjA==
X-Forwarded-Encrypted: i=1; AFNElJ8735UUKdNLEVxLwDeqcR3chbs/OYgRs4IrY+Dyybatw01zxF0FCTvPl+3xLJjoMzH/KrwgRTUjmr7P0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9QeLFk2kAM9MD4TVwRARCyz0uhBcHccEm+SRw/hDvl7KQOceN
	xjTf+6BVfFlvsOpm9SFi3wdX0VUF4xLZCsXfZALG3uIg9N/9qYSqiHemOb5od/1Doa6dN4C4IgG
	pBs0F8HHRUdc9hxP2PJBRnNv378lq8ftSM8Q215WZCqDKeZs4ci9fRE0hiKbrIR29VA==
X-Gm-Gg: Acq92OGrZvs/XpbtZ3EAZ8Ign3L9m4zBypBWWCJwcN1NeZ/8wa74JS3cZ+rThBP+b+z
	LI3rhZksJv8XIDQXtL4kb2B2evf7ifOjWKlrfXFPEHjKi+kVJvUxgFqlu3dTxVX12coigBsXh16
	AQixksPt8tHoCFMQ+HhhdRrmEIDK/D3fP2Y1yraBKBqekEUW5JCzo7LIG+ZctPI+ZFiYptEtxHe
	GuzxnLfae3pRbuVpHYzY29AuKWIxS5MpfxmuSXE65oc4TvHy0leh0KgsPOWwob3B1JsicT2zxFN
	AZ6m5rL1DUL0uKO6O7LlNkpWsqHwjtCq+EaioyqSmfIiE27zDnDrZ0t6LUVc6jtKZBKQ0s8xF3N
	1SnfoMXfiq5PKPdOGFq1f9+NVlXfXIfIBxUb9Wiwg5ROLUDaoZw==
X-Received: by 2002:a05:6a21:4782:b0:3a2:c9a1:2c22 with SMTP id adf61e73a8af0-3b3294ca167mr2620204637.6.1779454489323;
        Fri, 22 May 2026 05:54:49 -0700 (PDT)
X-Received: by 2002:a05:6a21:4782:b0:3a2:c9a1:2c22 with SMTP id adf61e73a8af0-3b3294ca167mr2620181637.6.1779454488823;
        Fri, 22 May 2026 05:54:48 -0700 (PDT)
Received: from [10.219.49.212] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164b1af1csm1868442b3a.27.2026.05.22.05.54.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 05:54:48 -0700 (PDT)
Message-ID: <defd5a94-613c-4178-88d4-f41db53e9333@oss.qualcomm.com>
Date: Fri, 22 May 2026 18:24:43 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] ASoC: codecs: lpass-wsa-macro: Switch to PM clock
 framework for runtime PM
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com
References: <20260518081738.2453957-1-ajay.nandam@oss.qualcomm.com>
 <20260518081738.2453957-2-ajay.nandam@oss.qualcomm.com>
 <c2223ce4-0e9e-4fdb-b289-4e98e64f8e95@sirena.org.uk>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <c2223ce4-0e9e-4fdb-b289-4e98e64f8e95@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Yr8/gYYX c=1 sm=1 tr=0 ts=6a10521a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=knVCPYfzRBhieiZ2OR0A:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: CvU9x0P4wms0hRL2XEG8TkxikEJER00o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEyNyBTYWx0ZWRfX7zVtfxwgFjCF
 prlT7O8ubeT0KeTZIbDo7jYSj9Q8MN1U8TciRRVj98KfPPPB3wyR3XIPu4X7uIZmvM2bdc6Wvph
 3K9Mce7M+/5BlzwdjMsmxje7iHvRRz3cUaIuC2KoGDbK27OELwWfPHdkdVAnNpAYS7gwcB5z9pF
 kjd6Q2vIe4hkbpfJiE8FAWFT0HaKx2wH/0+66Hh4tW8TCe+KkoaizJXBAYEN8MRuLYWIitPVJGx
 kaStpiPnScU5GcjqEWF2LD7jje1gCv+n7n7Nv5b6GDi1lSMQAN6SYIMAngZlfR/7MrYO3Vhdk/W
 HT5BBF4piwnRP0xncTsCZppB2SMAaJ8JuGtjBuUI7p2EmPnBSB/iFDQlOnFOwiOs8pxVGC47+YF
 NV95YAvOu2nFJlZNkZ4FvHhoLHUGiCCH5iyPJY2Q4375O0AkIWP3qY7zb3nByvERmQ90SvYU9UB
 /mgkqQZNAiJenEmagyg==
X-Proofpoint-GUID: CvU9x0P4wms0hRL2XEG8TkxikEJER00o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220127



On 5/19/2026 8:03 PM, Mark Brown wrote:
> On Mon, May 18, 2026 at 01:47:36PM +0530, Ajay Kumar Nandam wrote:
>> Convert the LPASS WSA macro codec driver to use the PM clock framework
>> for runtime power management.
> 
>> The driver now relies on pm_clk helpers and runtime PM instead of
>> manually enabling and disabling macro, dcodec, mclk, npl, and fsgen
>> clocks. Runtime suspend and resume handling is delegated to the PM
>> core via pm_clk_suspend() and pm_clk_resume(), while existing runtime
>> PM callbacks continue to manage regcache state.
> 
>> +	ret = devm_pm_clk_create(dev);
> 
> The !PM_CLK stub for this just returns -EINVAL so if that's not enabled
> then none of the clocks will be enabled, the driver needs a dependency
> adding.

ACK, will update in V5. Thank you for pointing this.

