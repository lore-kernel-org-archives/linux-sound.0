Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A94220F2A
	for <linux-sound@vger.kernel.org>; Mon, 29 Sep 2025 05:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759125132; cv=none; b=Etsrd0Llu7RUx05CylAwAm2CA5Rkv0JOzJ6hEDD4fbS+Jf63s4eG263mNKEXaiQfTP6o6trBsOvVbId/8wKdSti+YynnJnlNMLfB+qoD8CyPehfUB+E9fSzV4VYzqmTBgDVtXXSrHU6covXnQm0aGe9EF3vwWVDTX6Q/MDJmKTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759125132; c=relaxed/simple;
	bh=XUBwfWdpgq5g7qZ2fkMwmcj0ZQ089xhmdCE536NdRcY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eDPkQIJPQjOSPqu43XXf7FabAdF2rO0g7JgvjgGlS2B/5B5WPyBQZz0XJtpnE3ImuqGpldfnERymG99Yra4rmAQslZ2BiGYrmbgd7vjHqPzeeg/n3pJE9q+Z25cAGFIcLUmMnZZkjebq73WuHcyyF8eYxkCwF1n4lbs4Y4mSfi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ghj5Y0Pj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ghj5Y0Pj"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SNrK7E017957
	for <linux-sound@vger.kernel.org>; Mon, 29 Sep 2025 05:52:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bbHMiANAyI5VpOiOH9+PkDIHUQcsra2Awt7fKme/mwc=; b=ghj5Y0Pj1cimy/6o
	lQ6eq4rbR4HLdMBNyl0net2Yt2AY7sxbPz2VHq8cW8q69RCfGpjQhvxUF4gsixwz
	+1KuX2A2bvoLV64HDRQPoqosSUWTsYFmlat3pftJUuKSyQ8V/CWf7IrL1A7rnvYH
	iAyvrQfpxx06f4DV526JkMWcpSXKHRmE/HhDgc+EKNwhOzD4j+B6Ts1Tht249uTZ
	hHWQOwbJxR5GSBZ5pCDOoCOlJyr8cP1URwu56wJXdf0en2b/CVSdLRzTdZqfiluu
	jxT1Bk8YW5QItweIk69i7iTO//WgapYlh8KCyFyJ2tsQyz7LVOOS6w9qjUNxbCMb
	4JxDqg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e80tm07a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 29 Sep 2025 05:52:09 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-783c3400b5dso633581b3a.1
        for <linux-sound@vger.kernel.org>; Sun, 28 Sep 2025 22:52:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759125128; x=1759729928;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bbHMiANAyI5VpOiOH9+PkDIHUQcsra2Awt7fKme/mwc=;
        b=MORz0rRZVI0HyIMmRFJw4CXqBqXSDUow5ONYmWJ12WPz3wulvUoZq1nO2PtFrEE7B7
         xq6N+eehpQ2UGrx9d7yPZIWZix63uZ8rw41jYz4F288xt/y2BG/OeYzpE7N6cgQmTaDH
         WiNqV99P/D89sLw52gPxY0MVxm8/1vxNQgdfZccMotK/SppNiEhd0U89vvTSBis4AL14
         AvmPgrdOtGHLDiiWdT+EI8SZZ6DDfJo5eS2FTkM50/nUBCdUaFOD8CUG1ffOdlEI7HcO
         G4BaW/i2Xb38qMzkMceBVfOE0+Dt4M6KoIUWJ7qdsbNKq8h7/a/P396OdxUHKChYmKZp
         XMMA==
X-Gm-Message-State: AOJu0YxmP0A5aQfVuTgGLhrvAq3WyKTarQigjrepXPIJ1Lm6/4N9Mzhz
	ttpADJG+DkQY15DS/Rx73uNfTPByznD/PMlqh8sip+LDrT1cVmdY/MiQn+9JaD/je0UAJYDQHIf
	EbvJn0QUyIHi1davVm/K+B0d1qiZegKAmLYu2O0s0FeHPekHjGIkQjM4e5Bd2rXpt5g==
X-Gm-Gg: ASbGncveu32b0JHmFZ6LLZa8bxYtKsztPkN9z2avOVFm3WnV51nN/kzt6nQssYasoOw
	Y/Kjxc5f2EDLPh4ZPiyVZu/ZwlaXPyrZ6TKoi2gZHo/aX5jR8a8mgor1fmMA5V6vCZ0Lot5LEmU
	he2Vckc02uf3HVGXSvICZzdgQRcmmdLbjLIPG9u+UpuL7Hv4CcxxPSjGt83z32DD/Y6yo/oVXm5
	pYjKhvnfv5X9CPKNgDjrz4gzvqXy+WLLs3PcB+4sAAzNaU4/HwtyIuPqxnb9QDXpWDoLwscIix/
	SqG+9HHZKc1KIsBcejTPQiAjdcqeUL6gT+Zf69V92NgkJ3DllO1Td5n3Y6Kc46trpPQgWVHTPgI
	EyO0=
X-Received: by 2002:a05:6a00:3915:b0:770:fd32:f365 with SMTP id d2e1a72fcca58-780fceba320mr15850368b3a.25.1759125128346;
        Sun, 28 Sep 2025 22:52:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8QHbacnDb03pS+a1cSXE1NrmZSWsLadYC2GBzyt68+4gmxErOu5O3Q9uGrkNveCF4qF3Z6A==
X-Received: by 2002:a05:6a00:3915:b0:770:fd32:f365 with SMTP id d2e1a72fcca58-780fceba320mr15850309b3a.25.1759125127505;
        Sun, 28 Sep 2025 22:52:07 -0700 (PDT)
Received: from [10.92.183.157] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-781023c2b29sm10258850b3a.36.2025.09.28.22.52.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Sep 2025 22:52:07 -0700 (PDT)
Message-ID: <d77e580a-8d55-49ba-82b5-a1d868dab572@oss.qualcomm.com>
Date: Mon, 29 Sep 2025 11:22:01 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: codecs: lpass-macro: Add support for channel map
 mixer control
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        prasad.kumpatla@oss.qualcomm.com
References: <20250902062300.212021-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <708dc6e4-1566-4c72-9f3a-a34f935ac247@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <708dc6e4-1566-4c72-9f3a-a34f935ac247@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyOSBTYWx0ZWRfX74XVvLCPzk4s
 4BN5COVs3CeHhmIf7lLsWuX7FQXiIecUVIZllxyyFvQR7GIqlLzXOXDACm2kH3MLq9KvE8xvFQk
 uCUSR3oifnGZREqxnL/Wxh4AhAAdBsDLxhhuEABmCRlxcYg10NmmS3hymgqeyb8Bbigisf4ZYwD
 P+6xk6WdRsDkgw8Y7Cy/lOpFZ08CJ0S7edimC5Gs0XTmOgpwqmsrbENvGI4dpZvpltCU1WmH5A7
 gs8hJyTUUpuYW8u33Ejw+C95dvhgvhHUheo/T2RAKKVK8abnW4sRt+s8KEZZRDntzpoe2BqFQaA
 Hwx91x6C923b4K85FcFkm8LLR85nr++UDgfmBQHGW8wJTy8DVxU01YE+PzGvVt5pbuwYz3S2zSh
 ISSP/+KFcK+MVO6WHdb6YytZjErdVA==
X-Proofpoint-GUID: jGpZYwEqcsrp8CdVam9178MgrYF3GGSs
X-Authority-Analysis: v=2.4 cv=OMkqHCaB c=1 sm=1 tr=0 ts=68da1e89 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=o-7Fb8226cIMJVCjAR8A:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: jGpZYwEqcsrp8CdVam9178MgrYF3GGSs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270029



On 9/2/2025 6:28 PM, Konrad Dybcio wrote:
> On 9/2/25 8:23 AM, Mohammad Rafi Shaik wrote:
>> Introduce the channel map mixer control support for LPASS macro
>> codec Digital Audio Interfaces (DAIs). The channel map mixer controls
>> are required by APPS to configure usecase-specific audio routing and
>> channel mapping.
>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +int lpass_macro_add_chmap_ctls(struct snd_soc_pcm_runtime *rtd,
>> +			       struct snd_soc_dai *dai, int dir)
>> +{
>> +	struct snd_pcm_chmap *info;
>> +	int ret;
>> +
>> +	info = kzalloc(sizeof(*info), GFP_KERNEL);
>> +	if (!info)
>> +		return -ENOMEM;
>> +
>> +	ret =  snd_pcm_add_chmap_ctls(rtd->pcm, dir, NULL,
> 
> double space after '='
> 
Ack,

Sure will update in next version.

some how extra space error/warning is not seeing while checkpatch.pl test.

Thanks & Regards,
Rafi.

> Konrad

