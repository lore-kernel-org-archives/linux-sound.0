Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D43441030
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 14:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779460678; cv=none; b=m3Itfx2RVy6vBRI5ccRhzR5XVyoT12VUquGHm7ah+qupPEvfwiyVSgaq5iQCys15zdEb4tKeoU8EOUwdwhABuTMmEVtR0aK+Rt7FVoym+WopjfP8O1+bEEWDByAqwUPaTS60mvfeulkQVcB4KXIoU0+l4ydso9g+fJYEX19lAzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779460678; c=relaxed/simple;
	bh=lTIBQ47pbAMIqF3fpNZHDRlS9eKE8tkyqjtAgFiMLYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K2V3kA1Z1d7XcK5xzITXdbG4yS00RfqIuPNeLUSXzLDw9VaED4Nwffd+/KGi0c7ei5Y98Ve6FNPECL0GQ9BXWqvaAvar+Ym7xTVAtkYZ/d3OpNAmKCIIvZ9yb/g0pQZJVwMsw/XsEF6ggeBgDC33OlulFaTp5wGXTQBiuXUIwKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L+PKpz7a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QP8+rJO0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L+PKpz7a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QP8+rJO0"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8sCEE2765182
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 14:37:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TRsdhbKrlcwbu3ddt7KwUjrF0xGG72TL3Od7JWEaEsw=; b=L+PKpz7aLxkLNrc4
	jxnquLOoD2WwnA6sS3/hn2XQIQz2MZaxz77DeGNp82fgMj2rwMVDgYuizuGC/Y5P
	KSokwhj2WKNFyzjHfvQniTwhG/QiMvs4kkIw5l0wKmxIPfE3DZ1cJb/or+pxMP56
	z2CrfwURk0iItK+ur3Ts0RdCVFp+Z2VpFpXEUKNwehul1KdR5va+gBOR4idOHtXk
	/SkPq+AtSyL4gsposeWYVAE5U7c4cCrElCyrxWbkPjL8wHJnoJLADP3lIHlFQpdZ
	uGelrlWId4VrH/5HPxj5ZQHO9AHG1KNzOy0FgHOCGMmDMszQyDZ9luKvf0m4a+vx
	v4koVA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea3u7wdbw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 14:37:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-914ae409b05so35242885a.1
        for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 07:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779460675; x=1780065475; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TRsdhbKrlcwbu3ddt7KwUjrF0xGG72TL3Od7JWEaEsw=;
        b=QP8+rJO0mMVRZsArCqZVYPjiyrDaW2alPrRs2qXvQ5OzSzillpM74IJKmbSpgPlVPa
         BkbzPLPNN0oocOOGjyIbiAu2jZEA0rf/TOtuVfZHGI75UgzbiAT/gonw+PUqML1/ZkSV
         Fcu7XQVfl1fx9JI1GcBme7r+7Fb3GS6MEUUGOHce04AX440DyNmmy7FxJ8yW/cgF1aJb
         HVng4tFINMNN2rJtuHeEBEn+Dl/svkb6vLVr9s3kNW6N4++ieWIBzvgxkjGwRqdRp1dc
         ESp3ajG8CbyZ3CeEGknhr0Wl/+YRkmXL3qtWG2raGVI6PmoQ7ujJY9YSOpyWSxmpPiHl
         39nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779460675; x=1780065475;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TRsdhbKrlcwbu3ddt7KwUjrF0xGG72TL3Od7JWEaEsw=;
        b=qWi7ncu+Uvr7QdqPW+Jcz0S5Gf8S1/U1fKVgJuMBbpTrAY5+9hjs0Nbwmxr4aFUiGy
         VjbpFlQLAftLQQSPQ8myOX2YnkpuvqFRCcKXU9WqkkRirAFO7V4RSzPdtJ4ZzItBCrF/
         m8WgtdLZbi+vekj2Z6w3R2QALzCH/dyEYy4NTqLrfPDADsUkQXvEykM3p3MVPpBg5jPY
         0xGubAIZojIJkABAVJPLVLJv7h1wcd+BQqzxRQisVgeJFi2efwf9E+PnNY9Jd2iMBQ8Z
         Xxoa4Wm41ykzfSuY8KmfZS5eo9EPWwlMJz4HzXZwiBN5qHnA6h4DB4NPKYoPWmdgp7Cs
         CW8g==
X-Forwarded-Encrypted: i=1; AFNElJ+6ZvifvAy+nqiGfCcx3gfns8i1BaywMwVxLa3T6tTniqsrXq/GX4UzVB5PJWtCl2RZKmECtaEkEvYNzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyE5gEOuuAQPhO0r1eSknAvn6riQHW+zXIysS0c7zTljj/UaI1/
	cprfbJQPrt7UhrRneE6XVP6f9n4gifNqFqWieLkoBCTYm8Wki+ycq+F42XBpVETCjXOpttT8rJh
	GmWDMG6BGORBDTSkKQkhhxOycOKyIm92H4fTKdmoogeL+YT9AbcEgO8JOCc7qxZ6cHA==
X-Gm-Gg: Acq92OHH0l0h4gpIRZOM9s+csHUfbjqj+io0SwITNF7gVKYA65enzboAyXubPjfcqLB
	s1fqcHawAaqkaRxVVG9xBIsflHBFBmCKDLWNNa5hmQpaR5HJ0pxM6vSP4WgqvHnC9cwSCL3SDtw
	FUaloaZsArCHk538rf3CmfxHXbxHKsI2e5hlCbGd5Zqe8eoRzFbNQkGomzh3cHXQySLVvQ4IppP
	ekfJHL5NjXyn5A5oNubvnBbL5VWjH/PxomTAxu2ie5y27rR06E5nbWs1D49qhQ66HuMWNTcwNMJ
	Bb/fT708BA4qMWHlwg619xKjtY4ajGHbxkwtbXlHgvIn8FJdhSm09p5S2O/z4RGatAIuYwDweHO
	v+b8UXwVZ01HDSs7E2ntWwTHZog96/5ukIJOGbbo4vgLbmQ==
X-Received: by 2002:a05:620a:460e:b0:8cf:c757:f1d1 with SMTP id af79cd13be357-914b49c1522mr420120485a.8.1779460674637;
        Fri, 22 May 2026 07:37:54 -0700 (PDT)
X-Received: by 2002:a05:620a:460e:b0:8cf:c757:f1d1 with SMTP id af79cd13be357-914b49c1522mr420115385a.8.1779460674118;
        Fri, 22 May 2026 07:37:54 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc66d5b1csm61135566b.56.2026.05.22.07.37.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 07:37:53 -0700 (PDT)
Message-ID: <3ffcf6a0-e975-4eb4-9a4e-d6afb583e0b3@oss.qualcomm.com>
Date: Fri, 22 May 2026 16:37:50 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] ASoC: codecs: lpass-wsa-macro: Switch to PM clock
 framework for runtime PM
To: Mark Brown <broonie@kernel.org>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com
References: <20260522073324.e18bb240b6f6@oss.qualcomm.com>
 <20260522130459.3411038-1-ajay.nandam@oss.qualcomm.com>
 <0c408230-61cc-4751-938a-06e715744c66@sirena.org.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0c408230-61cc-4751-938a-06e715744c66@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aIXAb79m c=1 sm=1 tr=0 ts=6a106a43 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=knVCPYfzRBhieiZ2OR0A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: t8LZwvedTM-j1oP69nt4TpLEUw2j2eLi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE0NSBTYWx0ZWRfX7xzWXadPvAud
 o4Rrp5xm6LeiCu98LQxpBtp0Un9UrFuKYPoLbai+y6ET7/s0JspwD2l4NGF+eC90SdQ0g8b8WSd
 cJil844ky9gJjBaozFoGxX38PsVouBzaCM8i/aXeJHzBXeyaNXH+wm2ywsB8RI60SNS3ohdwWor
 O/M0cvx3+aS+X2hcwPufDAfMlQJd5YyHSGN5Uolw/cjcZr3NnmW8fbdT+EL8ZIljQCWXmkC1I8M
 S2caq+Uc6WoKLTNEZMieG7uXno0FrZuf7CoVnZZ6x7lsEPJfWQrPh4HNiq5GAgbRQQzGGQCw8ob
 ta7Ztldr9pcLEHhjwThtKMKcwsw8IxE3sqRIVhG6raUr+N6nd/zip/o3PZYxrqYO+q50HXydqB4
 nZxOWvNsgaHjsEEUvxr+xeYxNjIAnuw2Gi3eJZFSGe97K+p3hzeesgX1BdwkLOlqxKkJg8O90T2
 4MU3i75cXoskilQQWww==
X-Proofpoint-ORIG-GUID: t8LZwvedTM-j1oP69nt4TpLEUw2j2eLi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220145

On 5/22/26 3:17 PM, Mark Brown wrote:
> On Fri, May 22, 2026 at 06:34:40PM +0530, Ajay Kumar Nandam wrote:
> 
>> The driver now relies on pm_clk helpers and runtime PM instead of
>> manually enabling and disabling macro, dcodec, mclk, npl, and fsgen
>> clocks. Runtime suspend and resume handling is delegated to the PM
>> core via pm_clk_suspend() and pm_clk_resume(), while existing runtime
>> PM callbacks continue to manage regcache state.
> 
>>  config SND_SOC_LPASS_WSA_MACRO
>>  	depends on COMMON_CLK
>> +	depends on PM
>>  	select REGMAP_MMIO
>>  	select SND_SOC_LPASS_MACRO_COMMON
>>  	tristate "Qualcomm WSA Macro in LPASS(Low Power Audio SubSystem)"
> 
> Shouldn't this be PM_CLK?  That's what the APIs are actually conditional
> on, currently this will work out since PM_CLK depends on PM and HAVE_CLK 
> but the indirection leaves a window for things to break in future.

Yeah, leaving it as-is sounds like a bad idea

Konrad
