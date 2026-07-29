Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A356470122
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 11:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785323712; cv=none; b=rDyPDUpQWUi/KoX5K0nO3QP74lgi17L3pAU8wrexYIYYWkLrVTDYEECGgZNRt9Xh1epJnioHHIGebcHErAi/47grFDpl7zK4iUKWjJu73UUlgKqE/9vWvXjOpGCtfFLdmwYGTQoYm3d3vXnd3YP65FBkwdA37Wd/EBdCNCBn1y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785323712; c=relaxed/simple;
	bh=NYRLzx0L6KpTeBJx6/hTArLoeDY/+iVVycecu/KP4Zw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G6B89xzrf0Cx6F/OqkojFwAjTtcaqMdDkyCYHW6jvmXxDFusOtamJpEDDvtjfEM2wlVlMyM30MAtnC4cO2IlZCI0Ei8ItTSsX0MBM0iKElFKIMK4UGRupOGD4XWxWxKwDR9UPs2Vs3UNgOMd7slxkkNvnQu1HDIOIyREJGp/JzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fGnb6HJE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T3quekZc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fGnb6HJE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T3quekZc"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TB7Hkk1788368
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 11:15:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FTtGFyVExZjG81osSPE1xfdyF5nPo8UstDr/MfUnwD8=; b=fGnb6HJE9YLfWboR
	3Sm2dLkckPrlgBPQ4G2NNSGnrAwyDbeyWpv6R4FV+4yXNHlvIjnyyoQfAPzmdX3N
	mMVqHPNMhbkNXj6ZR3EmoVmDdZuO2fUG4y7/wOsjWY6zoQtJLDZxRWUU697D3brK
	av2nUBrNJ6QbGYr4C05sJuv6LTpIE2yjLQ68BQQJDsWTnHeBxyBTAyceIaL6nxgg
	F23768KLzPwgZWZrTo1TpjoR20uIFBhORjCmzGpLMQRexmg4MWr+fJLVM56+qgzO
	4Y+7RBrgcwWmC/efO0pNPjTWB9LNWm4X3pRbaLeE/DLj3Xne9CKALidE+mRBDI8S
	C1ru0A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqa331p6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 11:15:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-522de3c645dso16241241cf.3
        for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 04:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785323701; x=1785928501; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FTtGFyVExZjG81osSPE1xfdyF5nPo8UstDr/MfUnwD8=;
        b=T3quekZcqZmCQsMHBDUAFA9TrteKAK3G3WqeurzpnIc5z4XQj4P3N5phqGthm+KoWO
         dAFMKEg/XVnwKfd0EnVezLjTHDQG1IbV/rs+Dj/7af6ypPK3d89sWPl4UWGg6fHf51sl
         Z0AP9D9guW3/AKV0qnYSowQIhWaO69e10NluIp1kfl4SmuC+Q17192RosLV+SEyt1EA6
         QORZpGno2Ywrq850oom+3eCSkX5AMj9aTgfVNi9TjaMXzChKfvHT7lfqDPfF9tujeRJd
         1c1N39ncmuL1bfGvufBuzKHPpJsR7ZFlxaQMh6qOb+FoMVJD/JG5ak2uFBQmgrJMAAlk
         e7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785323701; x=1785928501;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FTtGFyVExZjG81osSPE1xfdyF5nPo8UstDr/MfUnwD8=;
        b=d4BQFHRCjUCaV0pNNqKDTHqmowS/MVSrvIWJFP74pS2gIwOOwTmftkWWEMjJ5T+mef
         mqWb2Y8Y8wfSFNWQAZLfP/k+oLgnSCJ8G9ubi9L56YRoldSbBhzQPMzIwNt+vUYReQS0
         huHURjrdNHhqMCmdHnwCx0NKoqt1Cvb+W8KXSan27AP0bBlEArJc9B341CdT5702evMx
         hYorOx86t/amgWUxsfIe9SUuIB2rPt7RuKy49Qkwc6I1GCulngtsS3XLnvqkWKvOG4Kn
         isVNocDjkfsyCm32p3ruj3QFQCGCViqFPZqiqMCxIk/4EGWevxtG/MmobjOywABFNfxv
         MhjQ==
X-Forwarded-Encrypted: i=1; AHgh+RpzADpgZUivwBk+2t7L5pt5E2LqOoUtF+Wqr6P0I9wqfr/6G1w5jdzobFCDyk4nKfPE0L7xhfzN12P0gg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXIxor18anVeLkQfPkHg3QmuKAc2ruWTMibOzg3py+GDNwSRV4
	U5nof/KO9M/jJPh/SQM1U/idSWMe6vok6O2Z7cgwdMs6QDjB4LLKFGqXLv0xE6VWrbLmalqsLPR
	/k3TGqBdaidAmoCZRQqLvjv2AMkS6AHjj2YscU2zQh4v4fF/aW0FUpt4EZ3MRYuyc+A==
X-Gm-Gg: AR+sD11y9gpsWIOhXhlJ/BSNM26DA2Dl2dS1ieADNGgI+l3JxywDATu95O8oeMUQuRL
	XRXjaGtH7Q9g2jjWKnfNrguiPSE+FlOGWuPHCrHVK+6MDxLm+WiSsgAanyVeecZTaAAZ/8lHy3v
	cy0NpsSX1QieuNwtFgazePGrBzAUePTHxSSx6Yemwel9o/viVbJSUrAV8pmAUcvnaP8g66I/s1M
	KWbDuQVLyVAiw/LPQR/KLwEKXll6yh4qkNob1M08Ku0eRTKzQGMHldWUc3YE4PiT9RZNCgJo0tN
	yP3ivgHqhpWe9gqY3/bbXxJFpWSpz4XJf6jwUYNnOomb6svsGdPfAIIKb4OgC6wRc9ms8zrTNwk
	dJo+tPqoLJ56FxRGhLhSVqf3SL2A=
X-Received: by 2002:a05:622b:53:10b0:51c:1a11:75cf with SMTP id d75a77b69052e-529dd9cf4c0mr33125021cf.7.1785323700349;
        Wed, 29 Jul 2026 04:15:00 -0700 (PDT)
X-Received: by 2002:a05:622b:53:10b0:51c:1a11:75cf with SMTP id d75a77b69052e-529dd9cf4c0mr33124671cf.7.1785323699655;
        Wed, 29 Jul 2026 04:14:59 -0700 (PDT)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47fb6acb6c9sm8004426f8f.13.2026.07.29.04.14.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 04:14:58 -0700 (PDT)
Message-ID: <9b7865a4-90f9-4c11-be0d-a6f03603ee1e@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 12:14:57 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/8] ASoC: SDCA: enable on DT platforms and add
 Qualcomm WCD9378 (Tambora) codec
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Rob Herring <robh@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
 <amHqO5pMFmKRNYTT@opensource.cirrus.com>
 <87452472-0ca6-4ed5-a891-3a688598b5b3@oss.qualcomm.com>
 <amNcM0AxYAe4bU95@opensource.cirrus.com>
 <6d1870c1-7fff-4569-8de2-bb45b83cde25@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <6d1870c1-7fff-4569-8de2-bb45b83cde25@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA5MiBTYWx0ZWRfXwM4ONQ1oy1l+
 YsHe7kOq76QbrVDqGmeBOR++phKnpvQXZOvI3ROoRMmHF3o7e2feSORbeUK1XoVh7DtgEiIVo7n
 38gx/bk15tGJZMMfSlOhd8g2unF4Dh/BHPc1nevwhGIkIWYnD/3rGvcqja0yaAhAaNfxHixTzqU
 Dqt+jCurKQZB49ksU07XgD3qx3qsClOMsH1fshO5iLXrhGo0WAU5cmL/zDQSyx5ZWrlfBL9sF4L
 tSWH9cr8sE76KsEuG31vjQpNjUqTOXVLU4p2oHPcAc28kwfWUFQiGUlx5gu12DbSLWFUlagtMIo
 mRyjYnGbhFd1W2wQ4Eev4X5L7sXxLNBYhTjc+NHIH/RkvAQPrL6hU7HDsBihnOMk3/Z8YiKrk0P
 Aby3AAnRGqM1AC2afjNHN0lefRE/ExIX8S7aHT3U8DXw7obJoyqysUj2+Zhs+CosGrOLVM0fUpf
 kQp7aS40yjQryDV9wWQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA5MiBTYWx0ZWRfX6zjNYxUvKPtx
 rlURkrBsQQU+cM6qvkdaPqPxlwXhLFkBF9Z4eTIkAoT8tUJLUYj58dSaQKovzX3gf4NiOqMuVAX
 5heckInWd4mPqHEEG8WCLNbooBUdyRc=
X-Proofpoint-ORIG-GUID: 5UDx2E_fslE21HLMA6x0tDJR65W6qSxW
X-Authority-Analysis: v=2.4 cv=Ap/eGu9P c=1 sm=1 tr=0 ts=6a69e0b5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=Zmw2I1zp5UqwoXPyMaQA:9 a=AwzSm4_S9zPOUlDq:21 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 5UDx2E_fslE21HLMA6x0tDJR65W6qSxW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290092

On 7/24/26 3:31 PM, Srinivas Kandagatla wrote:
> On 7/24/26 1:36 PM, Charles Keepax wrote:
>> On Thu, Jul 23, 2026 at 02:24:19PM +0100, Srinivas Kandagatla wrote:
>>> Thanks Charles, for the feedback.
>>> On 7/23/26 11:17 AM, Charles Keepax wrote:
>>>> On Thu, Jul 23, 2026 at 12:42:10AM +0100, Srinivas Kandagatla wrote:
>>>>> The direction from that discussion was to let DT platforms reuse the
>>>>> same class/function auxiliary driver plumbing and have codec drivers
>>>>> supply the small amount of static function/entity metadata that DisCo
>>>>> would otherwise carry, plus hooks for device-specific bring-up.  This
>>>>> series is a first cut at that, with the Qualcomm WCD9378 ("Tambora")
>>>>> SDCA codec on the Glymur CRD as the first consumer. Static table that in
>>>>> part of this codec is generated from acpi tables.
>>>>
>>>> Fascinating, a shame I missed the discussion. Main question
>>>> I have is what was the reasoning behind using static tables
>>>> rather than just putting the data in device tree? All the core
>>>> code uses the generic firmware parsing function so should be
>>>> perfectly capable of parsing the data out of device tree. The
>>>> only bit that is missing is really the sdca_lookup_functions
>>>> bit you ifdef out, but updating that to also support DT should
>>>> be pretty simple.
>>> Two reasons
>>>
>>> 1. This is laptop platform primarily works on windows with proper acpi
>>> tables, These tables are directly derived for ACPI asl tables in
>>> windows. Ideally I want to use it the way it is supposed to work.
>>
>> This is a little confusing, could we not just the ACPI in those
>> cases?
> 
> On Qualcomm platforms, ACPI contains many vendor-specific PiP (Platform
> Integrated Peripherals) methods that don't follow standard conventions.
> This breaks ACPI compatibility on Linux. Consequently, Qualcomm-based
> laptops designed for Windows that are run on Linux have to use Device
> Trees for hardware description—a temporary solution until the ACPI
> implementation becomes standards-compliant.
> 
>>
>>> 2. replicating full Disco specs in DT is going to be challenge, Because
>>> DT describes hardware but not necessarily at a level of register init
>>> tables or to an extent where class drivers need it.
>>>
>>>> Looking through your presentation (thanks for linking that),
>>>> am I to guess this was mostly a device tree people didn't like
>>>> the stuff SDCA contains problem? I do see that some of the SDCA
>>>> stuff isn't an exact match for how Linux has traditionally liked
>>>> to handle DT but also really not sure I see any benefit to DT
>>>> and ACPI support being different.
>>>
>>> I think there is fine line on what can go into DT, some of the hardware
>>> init tables are big No No i guess, Power and other ACPI things are not
>>> something DT does.
>>>
>>> I will let DT maintainers comment on this.
>>
>> Yeah agree be good to get the DT guys thoughts on this. It seems
>> like a misstep to me to insist that the SDCA spec implements a
>> completely different system of storing information for DT. SDCA
>> is what SDCA is now, and supporting two different parsers seems
>> like work no one needs when the one parser we have would work
>> fine for both.
> Am not sure I understood the two parser concern, what we are
> representing in the table is something that sdca core already does after
> parsing acpi tables. So we are reusing the same structures. Its like
> result of already parsed acpi tables.
> 
> I did try
>>
>> That said I don't totally object to the idea of an option to
>> supply a static block of information as you are in the series. It
>> could be useful for transitional and work around situations. But
>> it doesn't seem like a good choice for SDCA on DT going forward,
>> it is basically going back to the board files that DT was saving
>> us from.
> 
> Either we have this at driver level or at dt level, both of them have
> pros and cons.
> 
> If we decide to go with dt, this how the dt entries will look like, this
> should give fair bit of idea to DT maintianers for discussion.
> 


@Krzysztof, Rob, Conor,

I would like to get your opinion on perusing the route of adding MIPI
DisCo Specification for SoundWire in device trees.

Most part of it looks okay to me other than the register init-sequences
are also part of this Spec.

If you are okay with the Idea I can send an RFC version of these
bindings for more discussions.


Below is the sample dt snippet fyi.

--srini

> soundwire@7630000 {
>     wcd9378c_sdw: audio-codec@0,3 {
>         compatible = "sdw20217011000";
>         reg = <0 3>;
>         #sound-dai-cells = <1>;
> 
>         /*
>          * SDCA / compute-mode slave: this node owns the codec's
>          * supplies, mic-bias voltages and reset GPIO -- no
>          * separate top-level codec parent.  Existing binding.
>          */
>         qcom,compute-mode;
>         qcom,port-mapping = <2 2 3 4 5 6 7 8>;
> 
>         reset-gpios = <&tlmm 191 GPIO_ACTIVE_LOW>;
> 
>         vdd-buck-supply     = <&vreg_l15b_1p8>;
>         vdd-rxtx-supply     = <&vreg_l15b_1p8>;
>         vdd-io-supply       = <&vreg_l18b_1p2>;
>         vdd-mic-bias-supply = <&vreg_bob1>;
> 
>         qcom,micbias1-microvolt = <1800000>;
>         qcom,micbias2-microvolt = <2750000>;
>         qcom,micbias3-microvolt = <1800000>;
> 
>         /*
>          * ================================================
>          * NEW: SDCA function topology as a child node of the
>          * slave.  A DT walker (see caveat #1 above) picks
>          * this up during slave probe and hands the fwnode to
>          * find_sdca_entities()/find_sdca_clusters()/etc.
>          * ================================================
>          */
>         sdca-function-simple-jack@3 {
>             reg = <3>;
>             function-address = <3>;   /* mirrors ACPI _ADR[2:0] */
> 
>             /* DisCo v2.1 in use */
>             mipi-sdw-sw-interface-revision = <0x00020001>;
> 
>             /* Errata 01 Item 1: Reset_Function_Now timeout */
>             mipi-sdca-function-reset-max-delay = <100000>;
> 
>             /*
>              * Entity 0 controls: FunctionSdcaVersion, Type,
>              * ManufacturerId, Id, Version, Status, Action,
>              * Device{Mfg,Part,Version,SdcaVersion}, ...
>              * 14 controls at selectors 1,4,5,6,7,8,9,A,10,
>              * 11,2C,2D,2E,2F.
>              */
>             mipi-sdca-control-list =
>                 /bits/ 64 <0x0000F000000307F2>;
> 
>             mipi-sdca-control-0x5-subproperties {  /* Type */
>                 mipi-sdca-control-access-mode  = <0x5>; /* DC */
>                 mipi-sdca-control-access-layer = <0x4>;
>                 mipi-sdca-control-cn-list      =
>                     /bits/ 64 <0x1>;
>                 mipi-sdca-control-dc-value = <0x08>;
>                 /* 0x08 = SimpleJack */
>             };
>             /* ... 13 more Entity-0 control subnodes ... */
> 
>             /* -- Entity index & cluster index (Table 9) ---- */
> 
>             mipi-sdca-entity-id-list = <
>                 0x01 0x02 0x03 0x04 0x07 0x08 0x09 0x0A
>                 0x0B 0x0C 0x0D 0x0E 0x0F 0x10 0x11 0x12
>                 0x13 0x15 0x16 0x17 0x18 0x19
>             >;
> 
>             mipi-sdca-cluster-id-list = <0x1 0x2 0x3 0x5>;
> 
>             /* -- Init table (Table 9 DsdBuffer) ------------ */
>             /*
>              * Format: repeating { u32 addr (LE), u8 val }.
>              * First 5 of 62 entries shown -- the full table
>              * is the QcSimpleJack.asl BUF0 transcribed:
>              */
>             mipi-sdca-function-initialization-table = [
>                 F0 04 18 40  00
>                 /* 0x401804F0 = 0x00  DIGITAL_PLATFORM_CTL */
>                 6E 04 18 40  10
>                 /* 0x4018046E = 0x10  DIGITAL_INTR_MODE    */
>                 4D 00 00 00  01
>                 /* 0x0000004D = 0x01  SCP_BUSCLOCK_BASE    */
>                 62 00 00 00  02
>                 /* 0x00000062 = 0x02  SCP_BUSCLOCK_SCALE   */
>                 6A 01 18 40  80
>                 /* 0x4018016A = 0x80  CP_DTOP_CTRL_14      */
>                 /* ... 57 more entries ... */
>             ];
> 
>             /* ============ Entity subnodes ================= */
> 
>             /* -- 0x01: IT 41 (HPH render input) ------------ */
>             mipi-sdca-entity-id-0x1-subproperties {
>                 mipi-sdca-entity-type   = <0x02>;      /* IT */
>                 mipi-sdca-entity-label  = "IT 41";
>                 mipi-sdca-terminal-type = <0x0191>;
>                 /* 0x0191 = PDM RENDER STREAM */
> 
>                 mipi-sdca-terminal-clock-connection {
>                     /* Label-based reference, not phandle */
>                     mipi-sdca-entity-label = "CS 41";
>                 };
> 
>                 /* Controls: 4 Usage, 8 Latency,
>                  *           0x10 ClusterIdx, 0x11 DP-sel */
>                 mipi-sdca-control-list =
>                     /bits/ 64 <0x30110>;
> 
>                 mipi-sdca-control-0x4-subproperties {
>                     /* Usage: 7-tuple <usage, CBN, sample_rate,
>                      * width, full_scale, noise_floor, tag>,
>                      * all little-endian u32.  Here:
>                      *   HIFI, 48 kHz PCM, 16-bit.
>                      */
>                     mipi-sdca-control-access-mode  = <0x0>;
>                     mipi-sdca-control-access-layer = <0x4>;
>                     mipi-sdca-control-cn-list =
>                         /bits/ 64 <0x1>;
>                     mipi-sdca-control-range = [
>                         07 00 01 00                /* 7x1 */
>                         02 00 00 00
>                         D0 02 00 00
>                         80 BB 00 00                /* 48000 */
>                         10 00 00 00                /* 16 */
>                         00 00 00 00
>                         00 00 00 00
>                         00 00 00 00
>                     ];
>                 };
>                 /*
>                  * DataPort selector for IT 41 is a 16-col x
>                  * 4-row range where row-0 col-6 = 0x06 (DP6)
>                  * and everything else = 0xFFFFFFFF.  260 raw
>                  * bytes; omitted here.
>                  */
>             };
> 
>             /* -- 0x02: CS 41 (48 kHz clock source) --------- */
>             mipi-sdca-entity-id-0x2-subproperties {
>                 mipi-sdca-entity-type  = <0x0B>;       /* CS */
>                 mipi-sdca-entity-label = "CS 41";
>                 mipi-sdca-cs-type      = <0x0>;
>                 mipi-sdca-control-list =
>                     /bits/ 64 <0x10000>;
> 
>                 mipi-sdca-control-0x10-subproperties {
>                     /* SampleRateIndex: idx 1 -> 48000 Hz */
>                     mipi-sdca-control-access-mode  = <0x5>;
>                     mipi-sdca-control-access-layer = <0x4>;
>                     mipi-sdca-control-cn-list =
>                         /bits/ 64 <0x1>;
>                     mipi-sdca-control-dc-value = <0x1>;
>                     mipi-sdca-control-range = [
>                         02 00 01 00
>                         01 00 00 00  80 BB 00 00
>                     ];
>                 };
>             };
> 
>             /* -- 0x03: MFPU 21 (multi-source via pin list) - */
>             mipi-sdca-entity-id-0x3-subproperties {
>                 mipi-sdca-entity-type    = <0x22>;   /* MFPU */
>                 mipi-sdca-entity-label   = "MFPU 21";
>                 /* Input pins 1 and 2 wired */
>                 mipi-sdca-input-pin-list =
>                     /bits/ 64 <0x6>;
>                 mipi-sdca-control-list =
>                     /bits/ 64 <0x2>;
> 
>                 mipi-sdca-input-pin-1 {
>                     mipi-sdca-entity-label = "IT 41";
>                 };
>                 mipi-sdca-input-pin-2 {
>                     mipi-sdca-entity-label = "IT 131";
>                 };
> 
>                 mipi-sdca-control-0x1-subproperties {
>                     /* Bypass = 1 */
>                     mipi-sdca-control-access-mode  = <0x5>;
>                     mipi-sdca-control-access-layer = <0x4>;
>                     mipi-sdca-control-cn-list =
>                         /bits/ 64 <0x1>;
>                     mipi-sdca-control-dc-value = <0x1>;
>                 };
>             };
> 
>             /* -- 0x07: SU 43 (selector, driven by GE 35) --- */
>             mipi-sdca-entity-id-0x7-subproperties {
>                 mipi-sdca-entity-type    = <0x06>;     /* SU */
>                 mipi-sdca-entity-label   = "SU 43";
>                 mipi-sdca-input-pin-list =
>                     /bits/ 64 <0x2>;
>                 mipi-sdca-control-list =
>                     /bits/ 64 <0x2>;
> 
>                 mipi-sdca-input-pin-1 {
>                     mipi-sdca-entity-label = "XU 42";
>                 };
> 
>                 mipi-sdca-control-0x1-subproperties {
>                     mipi-sdca-control-access-mode  = <0x3>;
>                     /* RO, DEVICE layer -- GE writes it */
>                     mipi-sdca-control-access-layer = <0x10>;
>                     mipi-sdca-control-cn-list =
>                         /bits/ 64 <0x1>;
>                     mipi-sdca-control-range = [
>                         01 00 02 00
>                         00 00 00 00  01 00 00 00
>                     ];
>                 };
>             };
> 
>             /* -- 0x09: PDE 47 (HPH power domain) ----------- */
>             mipi-sdca-entity-id-0x9-subproperties {
>                 mipi-sdca-entity-type  = <0x11>;      /* PDE */
>                 mipi-sdca-entity-label = "PDE 47";
> 
>                 /* Managed IT/OT entity IDs */
>                 mipi-sdca-powerdomain-managed-list = <0xA 0xB>;
> 
>                 /* Delay triplets: <from_ps, to_ps, us> */
>                 mipi-sdca-powerdomain-transition-typical-delay =
>                     <3 0 30000>, <0 3 30000>;
>                 mipi-sdca-powerdomain-transition-max-delay =
>                     <3 0 30000>, <0 3 30000>;
> 
>                 /*
>                  * Bits 1 (REQ_PS), 16 (ACTUAL_PS) plus bits
>                  * 48..53 for six pseudo-controls (0x30..0x35)
>                  * that only exist to anchor HPH OCP/CNP/SURGE
>                  * interrupt virqs.  WCD9378 quirk with no ASL
>                  * analogue; a real binding would model these
>                  * via a separate interrupt property, not by
>                  * inventing control selectors.
>                  */
>                 mipi-sdca-control-list =
>                     /bits/ 64 <0x003F000000010002>;
> 
>                 mipi-sdca-control-0x1-subproperties {
>                     /* Requested_PS -- range PS0 or PS3 */
>                     mipi-sdca-control-access-mode  = <0x0>;
>                     mipi-sdca-control-access-layer = <0x4>;
>                     mipi-sdca-control-cn-list =
>                         /bits/ 64 <0x1>;
>                     mipi-sdca-control-range = [
>                         01 00 02 00
>                         00 00 00 00  03 00 00 00
>                     ];
>                 };
>                 /* Actual_PS (0x10 RO) + six 0x30..0x35 IRQ
>                  * anchor subnodes omitted */
>             };
> 
>             /* -- 0x0A: OT 43 (Headphone jack, no controls) - */
>             mipi-sdca-entity-id-0xA-subproperties {
>                 mipi-sdca-entity-type    = <0x03>;     /* OT */
>                 mipi-sdca-entity-label   = "OT 43";
>                 mipi-sdca-terminal-type  = <0x06C0>;
>                 /* 0x06C0 = HEADPHONE JACK */
>                 mipi-sdca-input-pin-list =
>                     /bits/ 64 <0x2>;
>                 mipi-sdca-control-list = /bits/ 64 <0x0>;
> 
>                 mipi-sdca-input-pin-1 {
>                     mipi-sdca-entity-label = "IT 41";
>                 };
>             };
> 
>             /* -- 0x0C: GE 35 (jack detection group) -------- */
>             mipi-sdca-entity-id-0xC-subproperties {
>                 mipi-sdca-entity-type  = <0x12>;       /* GE */
>                 mipi-sdca-entity-label = "GE 35";
>                 mipi-sdca-control-list = /bits/ 64 <0x6>;
> 
>                 /*
>                  * Table 18 packed blob:
>                  *   u8 mode_count
>                  *   per mode: u8 val, u8 ctrl_count
>                  *     per ctrl: u8 ent_id, u8 sel, u8 cn,
>                  *               u32 val (LE)
>                  *
>                  * The mode 0/1 entries route "unplugged" and
>                  * "unknown" to the same SU45 selector as
>                  * mode 4 (headphone) -- WCD9378 firmware
>                  * workaround, not a spec behaviour.
>                  */
>                 mipi-sdca-ge-selectedmode-controls-affected = [
>                     04                            /* 4 modes */
>                     00 01  08 01 00  01 00 00 00 /* 0 -> SU45 */
>                     01 01  08 01 00  01 00 00 00 /* 1 -> SU45 */
>                     03 01  07 01 00  01 00 00 00 /* 3 -> SU43 */
>                     04 01  08 01 00  01 00 00 00 /* 4 -> SU45 */
>                 ];
> 
>                 mipi-sdca-control-0x1-subproperties {
>                     /* SelectedMode: mode -> terminal-type
>                      * range, 2 cols x 4 rows */
>                     mipi-sdca-control-access-mode  = <0x0>;
>                     mipi-sdca-control-access-layer = <0x4>;
>                     mipi-sdca-control-cn-list =
>                         /bits/ 64 <0x1>;
>                     mipi-sdca-control-range = [
>                         02 00 04 00
>                         00 00 00 00  C0 06 00 00   /* unplug */
>                         01 00 00 00  C0 06 00 00   /* unknwn */
>                         03 00 00 00  D0 06 00 00   /* h-set  */
>                         04 00 00 00  C0 06 00 00   /* h-phon */
>                     ];
>                 };
>                 mipi-sdca-control-0x2-subproperties {
>                     /* DetectedMode -- RO, drives SDCA_4 IRQ */
>                     mipi-sdca-control-access-mode  = <0x3>;
>                     mipi-sdca-control-access-layer = <0x4>;
>                     mipi-sdca-control-cn-list =
>                         /bits/ 64 <0x1>;
>                     mipi-sdca-control-interrupt-position = <4>;
>                 };
>             };
> 
>             /* -- 0x11: FU 33 (mic feature unit, no ctrls) -- */
>             mipi-sdca-entity-id-0x11-subproperties {
>                 mipi-sdca-entity-type    = <0x07>;     /* FU */
>                 mipi-sdca-entity-label   = "FU 33";
>                 mipi-sdca-input-pin-list =
>                     /bits/ 64 <0x2>;
>                 mipi-sdca-control-list = /bits/ 64 <0x0>;
> 
>                 mipi-sdca-input-pin-1 {
>                     mipi-sdca-entity-label = "IT 33";
>                 };
>             };
> 
>             /*
>              * Remaining entities elided -- IT 131, IT 33,
>              * PDE 34, XU 42, SU 45, OT 45, CS {131,36,236},
>              * SU 35, XU 36, OT 36, MFPU 236, OT 236 -- all
>              * follow one of the shapes shown above.
>              */
> 
>             /* -- Cluster 0x1: stereo HPH render ------------ */
>             mipi-sdca-cluster-id-0x1-subproperties {
>                 mipi-sdca-channel-count = <2>;
> 
>                 mipi-sdca-channel-1-subproperties {
>                     mipi-sdca-cluster-channel-id      = <0x1>;
>                     mipi-sdca-cluster-channel-purpose = <0x1>;
>                     mipi-sdca-cluster-channel-relationship =
>                         <0x2>; /* Left */
>                 };
>                 mipi-sdca-channel-2-subproperties {
>                     mipi-sdca-cluster-channel-id      = <0x2>;
>                     mipi-sdca-cluster-channel-purpose = <0x1>;
>                     mipi-sdca-cluster-channel-relationship =
>                         <0x3>; /* Right */
>                 };
>             };
> 
>             /*
>              * Clusters 0x2 (mic mono), 0x3 (opt RX, 3ch) and
>              * 0x5 (opt TX mono) elided -- same shape.
>              */
>         };
>     };
> };
> 
>>
>> Thanks,
>> Charles
> 

