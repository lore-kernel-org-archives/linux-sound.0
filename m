Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668B1322B6D
	for <linux-sound@vger.kernel.org>; Mon, 27 Apr 2026 15:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777302282; cv=none; b=iErwgEl04p8V8pEil+ORhQyQZbVsHlHlXW6ERqY/i5FBBfOGBaeUTK1Fnwv8CpqKhuldazFKIXtJ4a33bqYq3RGDsCuk2tHdb7yAWhc+Ray6M0ZFJA5suyKEeg3DvczR6Lc+rSWvcYTWQGW4JOAVckYUcrEaNPuVPMX1IQyIzOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777302282; c=relaxed/simple;
	bh=CminYBQxC/Tnq1I+ccvUO34jiNCE2lmXe7vUwoemivw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rlb7SkQaZYEosQ9u/y+RkQTy6w/6xfOEYT9JpLTwwjK2Eh87YbBPtHY5pOiBWrxeTY5zk3F75WCi9BHsBoYaRONBAKOYHR8DGon1k7zNMBfV2eLWD6hpfcV6Bd/IyEDf/tWF+SUjxK33LH5KNCHrAdzxvjoM/1cxd2xPz8IqwWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gb938pxT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ecid/csx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gb938pxT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ecid/csx"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RCpCf82383072
	for <linux-sound@vger.kernel.org>; Mon, 27 Apr 2026 15:04:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1yuiHJInWiG/Li3+crKA+5BjpM+44e0DojtKyELy8yQ=; b=gb938pxTEhCjkpJL
	9Ot3Gl9Z5qs9BZCtrmZ/bGl0lyCD8xY+MxxXF4G/RORFkU49ShqYfpbGUGeBYPFF
	rlyxPZb/pT9Dc7AJTBfWczI7F+mS8RcZIhNicrbiwH4SzUf4ugk+cAlqI62bHjlG
	CUAzWK7uJPFdKj4WnlNyPRjcdwrcoI5SHLhypfPKGBw3rdbybyNCpAPQMujW3VgA
	7y3HzT++lA/MaorleuQlnZRyzk0PL+mj7ae30mJfmwyTmj5XCL8bzEgZ8r0G5vPc
	7w6E5CVyEOURJlNREBZHDu8cUI/Kv9R7mYgvrCqIm96aGupaBNO4EiZ5EG9oyVKt
	q7J4hA==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt85xrh9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 27 Apr 2026 15:04:40 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-42319cb91deso1031625fac.0
        for <linux-sound@vger.kernel.org>; Mon, 27 Apr 2026 08:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777302280; x=1777907080; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1yuiHJInWiG/Li3+crKA+5BjpM+44e0DojtKyELy8yQ=;
        b=ecid/csxytH5KiisV+uwy3IPCwDjshs5+XshQL7RKVEBza5SHao6vtanxHqKZzQwCl
         kKxUp7PnuSOL00g+HkGBSrMTeI2T0CyGjHYhmRwUssrSvgKzSHONpS/EngGx/I0532Kb
         +7ks1D8HVDab7IFKZzH0T2e/yRLU1Qk23SR51gzLHo7KKm4c8VgLscR07NIPUyrBjJ27
         FUUSauEj6+g++yZWTaP8ZhE+Pjmd7aMHtp1wrTJ9yEl40K/jGgTxCj6tU9MMOxBI1QjB
         WVor0Uk8VgrzUJZMcntZzc7QM07DTlV5aj+IxWOwibkz/nBp3E24yuVQoQ2iApqaA2Yo
         Al9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777302280; x=1777907080;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1yuiHJInWiG/Li3+crKA+5BjpM+44e0DojtKyELy8yQ=;
        b=QEeda1CC7pPP0NQqO/Urx3ACpQ6NX4IEeTcVWAx07m2tssBnzDwkgC+mEpKgeVqBxo
         IsJXQkhz06KhttaQbvhaDBi/FUbh5ytBMHyxEfEV6/X0uNYbRTFCIG59qQjgPAd0Orsb
         qxpHG0NoIY7L87SnOsYS5PpYcTpqANXeArloVwBadJpEB28QvQSfaLM2dzIIxgbKa2Yu
         DPg8ujk++nvZ4kiSBSn4vJKmWll/gjSHElW1QvfCCFgaCY53Mz2goO9juH+kBQ7hdKKK
         hfpz/KmbtsZoa9th0m8Tgz8KpD03HWXlZ3dN0rYoGYOfJXiWVUfIv34TXk7/YoO0uxok
         ARLg==
X-Forwarded-Encrypted: i=1; AFNElJ9wS89D611f8eWTuLn9pFImnXWENtPYvcTJyDmz/REEkqSq79MmdXSshudVMsAwcP/x3brzxdOka81LPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFxgpE3+uZvPgxZ3sfLIIHvPwdjPa7Gf73/kXwfvVEdtrw0PTg
	WIjX1SSBIy/0PJZMP4f9MuDzd8WWUh5BkSfMNL3f/YPipkpsET9qsjQUgUUO8nQQKhUkPS8Ebn9
	JL9T+rZc+y4jItkkZNSjqh/nPdpyjl4m3WeQL01HoRBOUb6iya7O9FfgSnGSFxwpTRg==
X-Gm-Gg: AeBDievzb3qB9NoHyF+O56OyzYOA9/saMDAxHQUYaLg9uB8nF4bhQ/VsPB7Uv6bzNUC
	5F5iIbS+/8lY8/0nOGSTJ/Yz8qcrI6DYIunmkW7ffNAZWQwn2NLmwNZoWJxMRozLvQHoparApJc
	W39zZinKAfIm8YlU0TaFHtmAcxT9UiftRPr1obJszVw/zAYNl3FNbr6lkfBybh9hvUsKyCymzCg
	4OHQpdTg7XtFh12pa2OhNY2VVv61ew71fT3S1ymaNUa+B7xOLn2hVZhyAr8tvz/9yqoX6WKMYe8
	qmbiA2c0NEBChZBowHYnR3lI0IjPUqB9tE3ilbZa1AF6mYJ7hivYE/TXAgZKWUXOzBdj6DXZcor
	xX977iiuI78j7K/DltfTe9tbza0lRMQQd0tj7jY1WxKdwy7pUbkl4eUCcNxOIw38JXwNDnPDmqb
	dI1daLDW9kvvG/gg==
X-Received: by 2002:a05:6870:c20d:b0:430:11f:eea1 with SMTP id 586e51a60fabf-430012019dfmr5442726fac.1.1777302279667;
        Mon, 27 Apr 2026 08:04:39 -0700 (PDT)
X-Received: by 2002:a05:6870:c20d:b0:430:11f:eea1 with SMTP id 586e51a60fabf-430012019dfmr5442673fac.1.1777302279084;
        Mon, 27 Apr 2026 08:04:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c4d455ddsm7175365a12.18.2026.04.27.08.04.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 08:04:37 -0700 (PDT)
Message-ID: <f537f19b-5d6e-4aaa-827b-fca3b8a44177@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 17:04:34 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/12] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: add
 LPASS CPU audio variant
To: Val Packett <val@packett.cool>, Xilin Wu <sophon@radxa.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Judy Hsiao <judyhsiao@chromium.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260407-dragon-q6a-feat-fixes-v1-0-14aca49dde3d@radxa.com>
 <20260407-dragon-q6a-feat-fixes-v1-12-14aca49dde3d@radxa.com>
 <29a7dd01-7513-4fe5-8546-d57757b3b2d0@oss.qualcomm.com>
 <88B7BBB9133FBAD1+ccb025ea-4999-4701-bb18-c57a42cabe2f@radxa.com>
 <2f830f17-4bc5-4ebd-a66b-8068a14a871a@oss.qualcomm.com>
 <c3b833d8-2e8a-4418-9043-6cd04d9901e1@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c3b833d8-2e8a-4418-9043-6cd04d9901e1@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Zs3d7d7G c=1 sm=1 tr=0 ts=69ef7b08 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=rs9IiGjxfO60RFTHbSYA:9 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-ORIG-GUID: qxtTTXgZEJMY9M6IXXJnKAlGVraDPRwG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE1OSBTYWx0ZWRfX6yAGC+v8Oxqp
 JZAEyiHKe2rcd/0wR7JgqVfEGoBcvKX1yi/q0Ct3qqKm8OnVtFzAublJdtf1qjgJpgkXe6nEL5M
 /aP3kXh4FKp3qhnYxeg/4fK91fAw7puRJAFuVsk6IzbGy9q+4zSNRxTxGEb6XZDthUM3z6QwLdV
 sTcaQ2/Kx6uBNQM3M+uiu7/4FF2iemqTLVd79m8hMuVtFEQrR1OfXaaeZC8HKeOjgo5W4px2vky
 v9kk4kM5xZjZvx9EdSQ1HobQQuKT8NiV4OfNPFkYH3yBF8WSJksKvmnZ53p1JQrUzUxHcXanOom
 xWYpW2DH5a1TgVzKrftWaocS+DLwUJzsUPYHU33NVhu/eevcX4IJsT3Wd7Zc2UIGMg6Zbuqr8LZ
 OqX62vI1LBeWeLWEvVOfULK6PhX7IDKvUDwSveaCZaNrlbyGOWdclDALKKSJxwZo3M8xE2SDse0
 sM8xaN9uk9dt9VCSvMw==
X-Proofpoint-GUID: qxtTTXgZEJMY9M6IXXJnKAlGVraDPRwG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270159

On 4/24/26 9:07 PM, Val Packett wrote:
> 
> On 4/24/26 9:28 AM, Konrad Dybcio wrote:
>> On 4/8/26 11:47 AM, Xilin Wu wrote:
>>> On 4/8/2026 5:06 PM, Konrad Dybcio wrote:
>>>> On 4/7/26 5:20 PM, Xilin Wu wrote:
>>>>> Add a qcs6490-radxa-dragon-q6a-lpass-cpu.dts variant for debugging and
>>>>> bring-up of the host-controlled LPASS audio path on the Radxa Dragon
>>>>> Q6A.
>>>>>
>>>>> This variant enables the LPASS blocks and codec macros needed by the
>>>>> lpass-cpu driver, wires WCD9380 playback/capture and DisplayPort audio
>>>>> to the LPASS CDC DMA and DP interfaces, and disables remoteproc_adsp so
>>>>> that the audio hardware is owned directly by Linux.
>>>>>
>>>>> This DTB is an optional configuration for systems booted with the kernel
>>>>> running at EL2, where direct CPU access to the LPASS hardware is
>>>>> available. It is useful for users who need low-latency and fully
>>>>> controllable audio.
>>>> I believe on Chrome platforms it was done this way because at some point
>>>> it was determined that they would specifically like not to use the DSP.
>>>>
>>>> I think this is more of a hack than anything else.. but at the end of the
>>>> commit message you mention low latency - is the impact actually measurable?
>>>>
>>> Some of our users also specifically prefer not to use the DSP [1] :)
>>>
>>> Based on their testing, the AudioReach/ADSP path imposes a minimum scheduling interval of 10 ms, which is much higher than the 0.67 ms they can get on a Raspberry Pi 5 with direct I2S/DMA.
>> We passed on this feedback.
>>
>>> Since the lpass-cpu setup works properly, I would not consider this a hack.
>> Well yeah it works, but I was really hoping it would be made
>> unnecessary and available for removal sooner or later..
>>
>> But since there's a genuine usecase, perhaps not.
> 
> lpass-cpu is also great from a "I don't want my pure libre operating system to touch dirty proprietary binary blobs" perspective, but you can definitely argue that that's not a genuine use case :)

That's a genuine usecase, but probably not realistic (in the 'actually
zero closed blobs' sense) today, if you want to have a featureful and
stable system

Konrad
