Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862E730F93B
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 10:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757069199; cv=none; b=HeYCUg/N4bwpCHHKRAi4g4QfNKL57imODj5T4ISY9VLZQESJTHSPw28RVO+Va/7MdACTUTdGN+7pxmuDeKb+oNhLTh23LbeLzkiKIKLLumDa0/xa98xbc7zBwUDZ9WlbDvBvKoK1Z6rgEOkKIhDiwAHCs4lsJvrCCC1HM1b5TrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757069199; c=relaxed/simple;
	bh=I6p/yTUh+A8pt4l7LAMv/W4PT4a6ow9nByy4vuG00yw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O8Rgv64QpBs8y/fjcipzTVJU8ooefjpSxUT7NFkhIjWPeh6u8od51RKmcaQVnUfkML8NtFDnY7UAYXkgKqTI4FMab8xMSdDWwsUUvgl7crLon8UTqlVl2yDIBdvRP7/94nLF3dQU7VvIMYt5Lr/GvA6bX1IK4tE/KZ+ovWpeEKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b/GXWPnn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b/GXWPnn"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5857Ll0M008288
	for <linux-sound@vger.kernel.org>; Fri, 5 Sep 2025 10:46:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eNfKE5usjc1AEQtJ4ORFpDrJWu8KVDm4Y0laoBTlgb4=; b=b/GXWPnn6rdIS+ff
	4RS0hdb3r6CKWOuE2ASRJYXEXjln9K4Y9ukHuSsDJt4Op46o63pQbuPwaaittgl8
	eIMr1Ng2lKPpVQ9WR1FRlUDTy9UFh5KNazS6mDBwizQEi7mSQT6jRVCLGYzWk1RK
	chbAZzREu3Lfd1MOe/4CQ5UCVeFsFbSotRuDN6BECbPTlNVStY6bImaVZ7rgQn0a
	onvbD7DbLe10Mla8/Dwf/vXsTFovF3wsWVYsQS91oG6NSXp/sWL2AcRB2fb/8B63
	hWQ8xKXDe0eEFbl6SF8pjmh0t5N3Kuwy2YNzFdtNoPnkRGyY3zM9fJvxHS/FD2w9
	moaWeQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjtsjy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 10:46:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b10991e9c3so3485141cf.0
        for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 03:46:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757069195; x=1757673995;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eNfKE5usjc1AEQtJ4ORFpDrJWu8KVDm4Y0laoBTlgb4=;
        b=TDVRfczrreZc0zvfJSloM1X9I9I208Xd6KDyuVkNcYwViews4QGdc8ZxY3FD4InX/8
         qgBTWVcU5puHE1eCtWTEXHuPEM0qYLPoZarBFCV53MXnKJC2sAtaJf2fgtPmvIr4l8Gv
         6t7DX/rId2Z5YR4XBXqCVcraucfG/TydqMJXAulAGrNPLQK3PwBN80vUHxK1UGY4iMk+
         //5X3cqk1wJi754u+a02CFYwA2KVsIwXu4BALBPR/zEqNNuNBmXyEzeJIM0WGw3g0rjT
         ywyCbJEZScrFv3ge1ZKvNeF6FmHNmeizgBO49v2L/GufGdDargT8XgIYfDHhLdz0s274
         J62Q==
X-Gm-Message-State: AOJu0YwTZmjcXbZeanVcDjZAbtH/cS94OU0bAdUzazpzLWLT/djeZto5
	IgSxqeC5Om3Dc6LQxXqxLmqrva9j3kZ+rblgP5Xo88KqBh8MTWr3qV3Cr3Y4wpoFp6IIgn7VPX7
	vmWoylPbH7joZgb6rnrEHU8brnuyr3B4vCTFWZhwZRpXYKSU2bwM8DG6omTZcGZ5Bpw==
X-Gm-Gg: ASbGncsm320t57bKKFFrH7f97qDyWgG8yAs8iUkKszQl57HfeGFwAmbiHPjD0QjUZYM
	lbnrriZJ02IpOgJpvWoK49ajQxrRRrkEJnrQiB8sEqxVGY1bzkemPdtIeULrh32HfHWt0TbtWgt
	NF0sKCCnIIMUeEf2YlVjV1QvJZ5qgEjk/K4Jg7BT0AnkVCZwhClPIqMIMRtLdFKyacNhWkd5H4g
	WkBYJEoQTyM8v6C3EFs/DWRs0ojbWvH0oXC4BClxewAg1IeBUGmoNqHiwl8Ka4mYk0NV6ZGgAds
	51IgCzs7m+foC1DZO/4tjGC/1kjuKEHpuONW7S3hFfN6VTQmiXPNDSuqO5bSWY/Hy4jrX03UXoK
	x2tUZbhAX9L5htKnJJYGPuA==
X-Received: by 2002:ac8:5ac3:0:b0:4b5:e391:e3e0 with SMTP id d75a77b69052e-4b5e391eb76mr31070351cf.0.1757069195334;
        Fri, 05 Sep 2025 03:46:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHw8Dn21yvKCjUW8kKlGcrNzT5lmLe1h8eGatVckUE6o1c8jbDA7+nCFwuH00rX+I8cOcqToA==
X-Received: by 2002:ac8:5ac3:0:b0:4b5:e391:e3e0 with SMTP id d75a77b69052e-4b5e391eb76mr31069951cf.0.1757069194370;
        Fri, 05 Sep 2025 03:46:34 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0484e8a4a1sm340288266b.83.2025.09.05.03.46.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 03:46:33 -0700 (PDT)
Message-ID: <b321019f-3ff6-4c6b-8285-77ca291492a2@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 12:46:31 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] ASoC: qcom: sc8280xp: Fix DAI format setting for
 MI2S interfaces
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        prasad.kumpatla@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
References: <20250905104020.2463473-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250905104020.2463473-4-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250905104020.2463473-4-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68babf8c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=4EjxHe3qrgCn2qlGiy0A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: eqFrct4iE5o8bLM3vIh81qqGwkW8U2D_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX1EACvXAdwSHs
 YEnABPnG9AgG0+kTDEQyG/WO7YRa2FPgVA6c+2Jaq7hJ515tcM3A66pCXdrniVkDo/TaMGZLFaX
 wki4FP9WSqIck2sxOA56sNvcihs/KBACd6xQdJusoH0FgtcStkpE4uvar6BtENUT2y3amUX2BlE
 R8B4VOW6lg/fugigo4v+0LzkL8tZ+w2bt5qsw6p/Gmithx9L6ptfOOc5r8lCl09DW/rTKbugtmx
 aamiC6H8Mkl7LgU8IDZ9ULLf7drM9FPhGkcA0DQ6Zsnwm1Y/QHcqAT0mgkdqXemzwva1KgLn581
 0bnPCAsFYinLNjL+pynjmlb9UxIGjOJWrSGqG71u18TpaTUgQKLjiJY2r6Wty5woV9v8YDGvks6
 MAiwoJbe
X-Proofpoint-ORIG-GUID: eqFrct4iE5o8bLM3vIh81qqGwkW8U2D_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

On 9/5/25 12:40 PM, Mohammad Rafi Shaik wrote:
> The current implementation does not configure the CPU DAI format for
> MI2S interfaces, resulting in -EIO errors during audio playback and
> capture. This prevents the correct clock from being enabled for the
> MI2S interface. Configure the required DAI format to enable proper
> clock settings. Tested on Lemans evk platform.
> 
> Fixes: 295aeea6646ad ("ASoC: qcom: add machine driver for sc8280xp")
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  sound/soc/qcom/sc8280xp.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 73f9f82c4e25..2fd06354923a 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -32,6 +32,9 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
>  	int dp_pcm_id = 0;
>  
>  	switch (cpu_dai->id) {
> +	case PRIMARY_MI2S_RX...QUATERNARY_MI2S_TX:

there's a discontiguous (i.e. asking for another 'case') QUINARY MI2S

there's also a SENARY MI2S, but that we don't define upstream today

Konrad
