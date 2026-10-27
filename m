Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109839;
	b=k0azl7uYsjWRzXJSMxhIpYjcanCdsPHVbtskS0CJ0tbx/HoKo6HCroK8dmUrR+DRUD6d
	 h7xfnjbO+puIGA4FZNuzfGHrulbKsGk7s7la+Hrb7rKJVHciTyvLpZqiYZ3nGQ8B64zSM
	 a6JksJPOd4LGZnOmYeQDfVvcNejvouXUvYYZtfx5nRGcYmz2vey8h2SyRT4RKSmBZXDai
	 TaY5uJq4IHfM+GfBJAKCu4dfPj+27twO2L955JOlb//b64ffO2NWcs+WwiGj21XijTJ6y
	 RGLCdO04KvXN2rZ9Lf30xLSTxrErACR/FaIwuaLKv69U0qdfocELlwQB2W6CN07j2yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109839;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=z+zcjRUmFJarKKBVLCxCx+rQ5bd46t8d9JLDCiSJycA=;
	b=nIQMNBDsHT3lNpQh+hubO6R8saEwm1KMKY39+qMpiYVC4WSTFPP08i7yncBzbDTi7/nA
	 U8Z8I2oirg1v32H8bm2OBLgh4VOoCpL5lPWU32FNZz6yHdSCXk1RarxU86F2Zngp9PiFp
	 RfIwIvZqTKU9LPuID031weep0PE8P35WFDXobk7sjVEexYCVVqn6vIEpEG10vL5tNOWJz
	 xvsv1gvCaqVNmxrpZ7KX9ML390KWpiSCjm2wi6A3oGdSqvAzcPO6cZy9vSQ+1qFCVybGu
	 jO8gmbu8Pmwvp0ZW1HrrnDD8+OZn3hWGBQX0X1iJrvNhloJeNbN4W8Kd/sNUg99RuPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UYdyAjbn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UPRljlt7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721EF606A31B
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 14:03:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 721EF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UYdyAjbn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UPRljlt7
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RDo7ja1486555
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 14:03:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z+zcjRUmFJarKKBVLCxCx+rQ5bd46t8d9JLDCiSJycA=; b=UYdyAjbnGesBz71W
	iVQaXe8qeCZ0Rupd2jondt88J1qH9S1pOo/qi3Z4EuXB6lyNRXzynxQMQS4pVt4G
	drLcMBce0anTIO5En/zvLs4tVGWXIY9NjPTFmWHu8yb9glvFqF0YdMZOwnIgjZDH
	DnaTN2t1g6LOMH2FluAsLrZAnoaIHpG9eKxpD4z9ssZZU3FnmrnNXvmep2BSucZz
	6OcrJGb6sN6X1W7IvC1hXQfjjmSU4f+5wjrtlddaZhSN5hBIRFRHqhgdxY868xvu
	L6PsCLS0MF0BP6EyUJ59pD4i0tGfM60Kuc2nenyobOB/cR64DuliVsIpEm8lcVj3
	I5tUTA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjp2t9vvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 14:03:57 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc50d537cd7so299885a12.1
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 07:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793109837; x=1793714637; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z+zcjRUmFJarKKBVLCxCx+rQ5bd46t8d9JLDCiSJycA=;
        b=UPRljlt7EyYoa+04TX97q9IZlsTHb6EV/0IkDooKwfJxL3PPxANG2ydSDh+sctpt5t
         TDr6yZevQquyAtbwhkqW/BIqI0snRS2C93/hxopSFKsf325nJ3A37nlww5nviQVxWuNl
         wV4YOkFvz5snBnTIz6JlslWkO2hHyIEzok2C7avVYh53TM6SKhv6Bj8Pj1kTrLSQ0e5f
         pP9diZlTFzXvve2lQpndduUwNv16XcV9Gqh+U7vOspzbOGdFtNZBHhoslTS8C6uDD8gn
         Np+1ZBxcv29Xl2EvUBfhl1sNccvQRc2lYTSz62QEMLFhMqpRA3OmGO+Tr7WXnO+5cxyt
         hlSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109837; x=1793714637;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z+zcjRUmFJarKKBVLCxCx+rQ5bd46t8d9JLDCiSJycA=;
        b=IQCENktPeUM+EPNH8XezSLmVc5ZWPhLatb2DoJ+B/9EryctO/xTwwh8XSS4Icx3W34
         8iR4K2brmIMxtOaWhucsuseCHm8KzSr2DqxF8AIxtJ0dGajlNnQjTPgPmgDIc4IukpWY
         4AScRRfNDlebVm5ZGxRCLGdly/Xd5lOpoDiTP6DG2OknzUsjlCtiIroA9iKUXCs8scje
         yl84Kihg2LHkdRVoLBlTCmTebNMqd1k+v1xIXaKzlm7PUH+YKv/G4DnFv9YvpvJmranq
         2AjFEWqeLsJQ8iTQTTsXMii5CQ+CVADIZ6D8DSBqkOr9uw31uaf7P3iEl/pAN0iTadVv
         HhZw==
X-Forwarded-Encrypted: i=1; AKwUvByvdBLq7bgol1YFvqfNPWsA8hOXwFIV2TcvaM3ri/DqsEObTM+ZnpshPA26OS9Rbr1HtQGRLO46g0rUIg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLRkVabfo4PUjA52CAtK2HPT08MOIb6Psz1FAalhjHh/slGEhY8
	aiOd4Pf1US0EgXs0OYvH9mRSPDGb5BWrNHlMXhefgTCdlLa4giVuVPQExeKcrymr8SuZzk73x/M
	KctnEbzHxfseYKIYRXXGnh/h3+nWaoHZ2x4aLdI8fkEVdj+gOeErOMpO5jl2XnBIn8Q==
X-Gm-Gg: AYBFou1HEa+T779xp8SkfZoyfq19J2AhZ/68oazof3WsKoWohICVRB00lHUGFEdQBfA
	wbplueTVT1dYdZ0bmq8bBm1tk7rKcrcuOyLA+mC6uYUxrpKy4rteWu+0bL/SsGMrkRi7aY3GTAQ
	7lJWvgBbQXszZNRgRJun8ZSkP1Yvae7w0zTtF6MSEkJZhWtsW0QKPG/8FEKpv7ijhbVF3GFM2sA
	9g02EGkunPfprW94QYzcWBD1Bp3gcj/IMhdkaf91cZd29gg++2vCtXvdB+z1CvYpN05l/BilCGU
	SZog6RFL2PQRZrXEeQYqH8LsIrgO9j9atogogmHgmohItYcUbclSxUPxGkosG4BCNVPtmLLqxYh
	TOLaoyXb08vW7OV6JA+JX/A==
X-Received: by 2002:a17:903:1b23:b0:2df:8909:f719 with SMTP id d9443c01a7336-2ea9c64401bmr146875525ad.3.1793109836873;
        Tue, 27 Oct 2026 07:03:56 -0700 (PDT)
X-Received: by 2002:a17:903:1b23:b0:2df:8909:f719 with SMTP id d9443c01a7336-2ea9c64401bmr146874635ad.3.1793109836298;
        Tue, 27 Oct 2026 07:03:56 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfca563ca9sm28627e87.17.2026.10.27.07.03.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 07:03:55 -0700 (PDT)
Message-ID: <b5f0ea6f-1048-48ed-8df7-2502e7b452f7@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 15:03:52 +0100
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] arm64: dts: qcom: sdm670: add digital audio
 codec
To: Richard Acayan <mailingradian@gmail.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20261003175659.23536-1-mailingradian@gmail.com>
 <20261003175659.23536-11-mailingradian@gmail.com>
 <87839ad6-c489-40b3-bfcc-60c436cd1a6f@oss.qualcomm.com>
 <atYtSXF6QeTkF6pr@rdacayan>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <atYtSXF6QeTkF6pr@rdacayan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AJjzCM5L c=1 sm=1 tr=0 ts=6ae0af4d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=Jm0Y9y7N4wH0DHTafQoA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: 8jmIRWsgqczZp4aDTuQa32iQaVQCwXXp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1NSBTYWx0ZWRfX24Lm0VD4mTaZ
 3CxfMcKJhqemSqtEVIQW6kP0nV4NjCwJhKoBbEaFo7K82bOgnUQjaUHJBqs90mxEMvvNqcop6e1
 y2krHcF5lS5WaegP+YkqECcfhPpoqks=
X-Proofpoint-ORIG-GUID: 8jmIRWsgqczZp4aDTuQa32iQaVQCwXXp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1NSBTYWx0ZWRfX6KhvSpNlpCZR
 BHbwLGa9RQyxsDLYwp5VAKRMycH96JFCH4KtZTg8Twxn2vFdKe0fCaRTIgxiTvyw/LFXjICYqpa
 90g009KYwIWqQgaeTBiPckYdAeq7YJs3fYydJ7hfQdW5r928cJapkvYO+rlgkPBMpLLG4UZ3b6w
 wQ44hI6R3Hbt89qxbxT4ir7KAypa5liU7a2yWC0RErwRUsArvHx0bdOLspPKW/m4LOZrh6lTDGX
 fXUmuG5C6K19NQE2rdXwqeCg+fcQx7qik+YQ/CyCGDTou3JQGj+ta4iDDu/fY3J7Z9K4UcRprjE
 vwzAjrJi5a4KhslExkxVzImRMI1NWs2OXKF7PabF2WfzBUctzDb1KmKZySQ2szdX967s0j3c3rk
 1fQiyOYFLmNK7KUSyGaE52ZdeYNmgt3uSUZtJZmux4llhPC9PqgIAwZCu9CrD7dug//+D+hTZY+
 i1uaAsOyZqqIMJZiqrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270055

On 10/19/26 4:46 PM, Richard Acayan wrote:
> On Fri, Oct 16, 2026 at 12:21:10PM +0200, Konrad Dybcio wrote:
>> On 10/3/26 7:56 PM, Richard Acayan wrote:
>>> Add the digital WCD audio codec to the SDM670 device tree.
>>>
>>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/sdm670.dtsi | 15 +++++++++++++++
>>>  1 file changed, 15 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
>>> index 038ef0f73ea9..91188acd16b1 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
>>> @@ -21,6 +21,7 @@
>>>  #include <dt-bindings/power/qcom-rpmpd.h>
>>>  #include <dt-bindings/soc/qcom,apr.h>
>>>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>>> +#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>>>  
>>>  / {
>>>  	interrupt-parent = <&intc>;
>>> @@ -2541,5 +2542,19 @@ data2-pins {
>>>  				};
>>>  			};
>>>  		};
>>> +
>>> +		lpass_codec: audio-codec@62ec0000 {
>>> +			compatible = "qcom,sdm670-wcd-digital-codec",
>>> +				     "qcom,msm8916-wcd-digital-codec";
>>> +			reg = <0 0x62ec0000 0 0x400>;
>>> +
>>> +			clocks = <&q6afecc LPASS_CLK_ID_INT_MCLK_0 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
>>> +			clock-names = "mclk";
>>
>> This clock configuration is forbidden according to bindings
> 
> It is corrected in patch 11 which is why this isn't caught. I'll move
> the fixed clock to sdm670.dtsi.
> 
>> I'm not expert in audio, but an LLM points me towards
>> LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE
> 
> Does the LLM have access to schematics?

That LLM has access to more than just schematics..

But at the end of the day it's just an LLM. I don't know for sure
and that's why I wrote it that way.

Konrad
