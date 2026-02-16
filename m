Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C003016F7
	for <linux-sound@vger.kernel.org>; Mon, 16 Feb 2026 10:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771239238; cv=none; b=UxEAbpj/M4WLmUZwbwnYq6YwKhl0ZQd+76xveJkeLNkbHv2/SuZaN5cYV+QwU3tPtIoeF8Qf8keoeRsbvO0tVoR3HhTjrYSyC8aOpXU8TizJvfccc15s7COy65Ol3x9FDPZfNdUnrkSFvBi0Q0m4t3TR4KOQzxhz/FfaL50/xIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771239238; c=relaxed/simple;
	bh=UlEkGTGIllzJjcj1vpPZqPHwtWge5pHUmyyG9E18Cyg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lSHieAVnhxEUKacWT2uLQwCC9k9aVA581twCFTUkPn78h0syVTb3T76ZFYoLgfi95FNi0NxVuBGkVx4PXshppr4ivHddcd51CWwAiXCRAu4lUePOYeyWwHBjR7s47YzWZvAxSKI5zpGmRM1U5s9/ZXEBhV5TC6hdglqKzFrttvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IOo2vy07; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BxUaXkA9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IOo2vy07";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BxUaXkA9"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G8fwAf2802096
	for <linux-sound@vger.kernel.org>; Mon, 16 Feb 2026 10:53:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gh/tKm/6XgT6aWWSRjrbhrc3i/EPKiGjArcoNsxyffk=; b=IOo2vy07XhtQLrRE
	aDejHiZeE5MkVyoqbqTtOcsFcOwtmJBoPI6r1hCCOBcX+Vr9VMZbmPM0vUfHZy4D
	YTLXtzpr5ZxpWG/ShRsdiYhqYMwgm/k9Tr4nBAnkTQjrtzw8cdu1+9uJQMe4Rzns
	BPDVM92CF9iBECU2G8Eq/l6FErz/Ba8w64fovridvk9FLH2UVOlli3ygHegZmkxM
	7RYZtxVxA9PlnXXeTTSYDjRsDY7JJEYl+S8mh4Kxf8HO2TUWTM1ejUdD+sps18ek
	c2Ye/3QLKBdCbesuweIMEQwPgO1B9mAa7hy2Ga1kuso3O8E8VK3lR9Y8GkHQtite
	v7mcHg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbyxugawf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 16 Feb 2026 10:53:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-506a610db26so24664511cf.3
        for <linux-sound@vger.kernel.org>; Mon, 16 Feb 2026 02:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771239235; x=1771844035; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gh/tKm/6XgT6aWWSRjrbhrc3i/EPKiGjArcoNsxyffk=;
        b=BxUaXkA9Jx7kj1CJ9wRoefVhWON/AqdVbSf7lUNVu4bF4Nb5UAyLp1My1xJ8RmmRCv
         FDadVBNghuFg5Stp26ZoDcLzsHw+NpAeOBOy3cFYGfXGd7A7pPwY8RLf2I3k91q91itp
         Dh5b6BgHba/HiMD7QW+to0vm7xzsNXXtP9FL/14gqF9QVDnjKscq4TNJAuoP7DP4Gnm6
         /H6canaPBoZJDvTKSLagycUilsXRzY3WOS7BR9vagPK3QTnkCz8tBh26zZkzUhVqIWZd
         MX3UZyqot07UZptPqTB+GgxxXCOz34Y+jb41rYURDPqst2w4Tb8FJCW3MM0KmgxjhtFN
         1lAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771239235; x=1771844035;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gh/tKm/6XgT6aWWSRjrbhrc3i/EPKiGjArcoNsxyffk=;
        b=L07VmGHPeTpJrP2al3rrqLXAYGCVDAX5EyK2zkPZje6oKVmfvpmG4y4d1fsBZQ9ogD
         ie9/MGWBsOXl4v2pc41xiHDBQU2/WGk1xP9ZSxOOCKWgMisolyHoYDntHjjEgAr5KD3W
         6njTBLUSMHH+IpIkZGerhbl49+3vd1L0OpFqjvTpCY8JhTjhE2pavHenF9scgloORORQ
         2ibjSM0/SHOfKy7htD8K0Tnnz+u58peaGKkKyzcFEW62E6Lw4ZvnLShYPpMpZm3Ix1mZ
         emwZ9yVgWFIPVvkAPI2+xW7WWwT3K9P99J4rHQklSJiD7BX/H4IVcbWp69VJBUqngAMs
         RUxA==
X-Forwarded-Encrypted: i=1; AJvYcCXhgxOsfDYh2JJ+u7QNTuKzyo7t/HYj1sIZ7/EVU7DvVaWMXCN3riOCNUcMT8MaPDQ4bNy8B3WffeSH/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBXiSPm4qBhkWEOLaDaeu/a3FarykmmqJUHXeZkStSreFxv+P3
	qo8hdy+Rx3pFnY16x2v1WNjH+BdwtTcT7F7lkScdZ4JZVIMY5uOT7G8edXqYnO7pVZ7GPsCww8n
	1LhGmF4/L0rLZEplW07zL/EXB/YWPQ64+AF3VjWuqamvuuJ7rklA/c3VlNyeknVdmBg==
X-Gm-Gg: AZuq6aKGoabYw0LxWt876Mo4UeepNahRibEbfVQizBvOoeTzIM1WWuIwzTew/gGPmBP
	EHboj+EyeGreaR7egGmEgN10EtfI78FA9EPUPCEFiPpntQrcXx2rKBTWfwGZUbG4MNRzsPRxrCO
	jDDpe71HDVlethAj7kMcFn1kyevocFJ4BCusjFm+wUMrIA8hw2P+qwMesRAgbEEQlfLiG0SUuFG
	et+Qn/hBaLcgUwLBeakeu47OYfdMqm7y0dwiczGp/iD2OUGnY+byS0XHyr973o46OOp68wQaZA6
	N2sNtKbEf2xc1ndEV/455HDA4qCBd8mdIFio4rJV7b30enZfko39Xt1RktOGdn7kgSMChI9JCus
	K7U7Uu81cOQQsJx9UPj2ZnJ8DHyCAw7yPDMNKmcQK0nafesTfwrdSUif7zILzTfaSUdOBNjsB0X
	GmNWw=
X-Received: by 2002:ac8:5890:0:b0:4ff:b757:1210 with SMTP id d75a77b69052e-506a661e8bemr100575661cf.0.1771239235141;
        Mon, 16 Feb 2026 02:53:55 -0800 (PST)
X-Received: by 2002:ac8:5890:0:b0:4ff:b757:1210 with SMTP id d75a77b69052e-506a661e8bemr100575521cf.0.1771239234684;
        Mon, 16 Feb 2026 02:53:54 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad3e390bsm1779138a12.17.2026.02.16.02.53.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 02:53:53 -0800 (PST)
Message-ID: <ddb41df1-2d60-481b-999e-cc480a6900f3@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 11:53:49 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] ASoC: dt-bindings: qcom,sm8250: add compatible for
 sdm660-internal
To: Richard Acayan <mailingradian@gmail.com>
Cc: Nickolay Goppen <setotau@mainlining.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Johan Hovold <johan@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org
References: <20260211020302.2674-1-mailingradian@gmail.com>
 <20260211020302.2674-2-mailingradian@gmail.com>
 <yxrhmblavwkuhfrfgskujs7tz7cykojnqnl2mfrf365lhdem35@bgqwiaft67b3>
 <20260211-skilled-transparent-moth-fac10f@quoll>
 <f1b67c1e-cfc1-4d23-a24e-4dd342edd2e9@mainlining.org>
 <f27ec5bb-1562-4bcc-9178-4ff4d4fe00d8@oss.qualcomm.com>
 <aY_uQZxuwt8rDf6n@rdacayan>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aY_uQZxuwt8rDf6n@rdacayan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MIyleYPuPQ8XLid8el7UMpiCs8h_zIKH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA5MiBTYWx0ZWRfX8kKPz32UmJra
 7aYQg4a5XLFVznsekNZWVBbXdUK7kdRnwcmzEoCSMx3d37ZbZCb6sKG1upFYvVj0e6fZJgkQdpa
 tZDvvR5oIlx4lnwn4pQcV6GT8NKxlanUL9TVBjEOgP8INcWHucteYp8D0dxFrYjK0Vgq7+2lbkH
 4O54NjsbQ4roKydo2cYQTUbAG3By9d0uhDKyWfa76lYW/azaFFJNijmnL3iUte+38dIOG1eGiP9
 R86/9BOyuON3yfe1sPuoT9pS5oFBdgCtOz4fiFcbSx30IUOsn8pRg9Ctxd/2zKZheTsvN7Hno9V
 PhqeOSiwxuOGA1DUjfF4D4JOrtJSZyjMEi2YXsOyAr9x0KxAP+aTh2pJi3s1H5vxg2pSeZ2JFZk
 uPR9StmrfudGQoyLomhDAgpT3VV2oiVSWafiJ7LHv7Pl7IwBSTBpr3LVUq75ZwErOJZ5/EiWHsZ
 e8GDE//uVVx2zA4qmRA==
X-Authority-Analysis: v=2.4 cv=BpuQAIX5 c=1 sm=1 tr=0 ts=6992f743 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=OuZLqq7tAAAA:8 a=9TPAvQA5bqdBw0Rm8CEA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: MIyleYPuPQ8XLid8el7UMpiCs8h_zIKH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160092

On 2/14/26 4:38 AM, Richard Acayan wrote:
> On Thu, Feb 12, 2026 at 10:34:27AM +0100, Konrad Dybcio wrote:
>> On 2/11/26 10:55 PM, Nickolay Goppen wrote:
>>>
>>> 11.02.2026 09:51, Krzysztof Kozlowski wrote:
>>>> On Wed, Feb 11, 2026 at 04:11:24AM +0200, Dmitry Baryshkov wrote:
>>>>> On Tue, Feb 10, 2026 at 09:02:53PM -0500, Richard Acayan wrote:
>>>>>> From: Nickolay Goppen <setotau@mainlining.org>
>>>>>>
>>>>>> Add compatibles for sdm660-internal based soundcards.
>>>>> Why is it called "internal"?
>>>> Yeah... I am pretty sure there is no such sound card. You cannot have
>>>> sound card internal to the soc, because you need the external components
>>>> like codecs.
>>>
>>> It comes mainly from downstream driver name [1].
>>>
>>> Downstream also mentions it as int_codec [2].
>>>
>>> There's also an sdm660-external sndcard [3].
>>
>> It seems like "external" means "coupled with WCD934x+WSA881x" and "internal"
>> means "coupled with (digital cdc on SoC and analog on PMIC)-over-intI2S plus
>> optionally WSA881x".
> 
> Interesting you left out WCD9335 (codename tasha), is it never used in
> production on SDM660?

I don't know.

I think both were used with MSM8998, so I wouldn't rule that out being the
case for 660 too

Konrad
