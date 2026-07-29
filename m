Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E9648D885
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 13:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785332069; cv=none; b=m3oAWuu9VKkpe0cciJ3Lh95U00KAhJB0GdYA81EA3k6ajGL051IxvrY4Ig6m2Twh0JcMLQADNsJhqGYhuz8alAoSnSFyCBh90NomywDkhppl/jUbzlLySiXqREcoDELqVjO+j+E0CoJQZWVazNBQcr7js1Rmhyqw8DcZDx922nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785332069; c=relaxed/simple;
	bh=JlA8WG36lpxsGdfIi/MW6WDvmloEfplyvj0rIQ9ASoU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eWitdvioeauwZz3GjkzJ3FOERLKNqk7zEjRyzuUCNZ3DyJrj8pRMTyQIxSyKCoVMlxFrtkFjJ7ThTKR7e8etQt0DANHiAKYces9BWmB+xN0rT55iB2WMXLNZpou98qzh/Ll2cvQgRsIPuRZ2FDuFKKcPbxmSksNfb23BdUbWwRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oawSbPzk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dRyO6j54; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oawSbPzk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dRyO6j54"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TD8EIp2062146
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 13:34:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ncbG0Ydi+yb0hSrpjcQVK5pW64j2kj5xFhEpwulSCt4=; b=oawSbPzk+AN6kupz
	mj3kTAkJTWyILv2ujTyyJjEyAIXN+t+HjqPWuO+yQSRbptzDoH1TVjcwzW74wOOi
	BGCaL2ticMCGHECG+oFp2VltwVTdSHGrLnNs1m6jURjp0kL8ZxJEF31+GPKpURru
	pEacXJeNoIPd7ceIltXNFiVVJ+8tTWB/EOHLDKw9vyU7iLw32i+8Xkzlx2HwcWCB
	tSCMYJugKZRBEBJ5j7wrIKNLJZBRVaasJS0KzRkiiwuuvspS5Dj4fNUV5RDf9hX4
	61b15rdaNkhxpnlpvobXFanqLmtXwG4MscZ4Vf+Ci4PBAyK9VpdwsGErrOixH1ne
	HPkKBg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgrcgf0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 13:34:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51a8db414c7so14540031cf.0
        for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 06:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785332059; x=1785936859; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ncbG0Ydi+yb0hSrpjcQVK5pW64j2kj5xFhEpwulSCt4=;
        b=dRyO6j54NX0ipP6jcefZsFD5EnePz4NRC4uvVK/eq103rzthEMLmTWqkHfHDHNPeXY
         7ANWh/KH6SAuXMKK+ml4sYvcLs9Ajod9omH5d1fBRnLwhDb/aQ18Z8Ma9Vdnn7phwRSQ
         2hqJ6JJEO8xoeW9gRPNJSdfrZC5RUccyKQsKbfsS8Ql/uLG+rQqTdv/ZGGo2MVkpuUNH
         yu/7SRyKPf15rLM9ee6nNrnJB+geH8UhJAvETRQUfjlsYDtWcfhDpW34XHtz7VxXs7yf
         UBZ2QbLeHSeKS+FaFeD45amqFpZgmvtDTXGPsgwfZw3DA8DSdh3WkIeX7v05sqMVyGOM
         enLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785332059; x=1785936859;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ncbG0Ydi+yb0hSrpjcQVK5pW64j2kj5xFhEpwulSCt4=;
        b=cJjw+dLPoB5MpuUS3TWoenFNofI+W6ulxfFhsCtBFsmCkmfwTX61Iq9G8VNnfxtaup
         ZvurMB/jVIQRftFE+zYZcXewFOtZb1OGbHFcm4CGFEEiuoX5PTANa7sIGyoMKJoXcUhx
         QOw18kmiXvqU7ZQ47YOSoGzXdjk56snI3ONgus7TPFk/uCEFoQs/7ZrwrSzRhfUKonxT
         w4oA3kaCfFjo6cY+pH9e1tDYAK+waKQ0HhjPAnHJTRbIvO6iiMmP/MwH2/LWH950wsEz
         ztHROnD2T+KiHHzfXkwBb6DK023uzwOKU2TUk1Vks0xGPiwi2H62HGsclHL81YMnY7Pt
         YIiA==
X-Forwarded-Encrypted: i=1; AHgh+Rpz5zHTLqrw83K97hsO1/LpqtHVtapu6lyMjYUU98GqHFtGFsU/pLGX0wjyXxB1MyHvBrTBkIIGYPXrZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBFYoskXBJ4gj3r50hIhck7jw67eCX5qnGOXL589Ufjg6Yg/ka
	/FBgMrsqBS+vH3w1oJwoJYJ+BQ2d4xKHcIaF7OeC4esqhfyIEl0yUxby6pyZDkKAKXWpXA5JUVX
	4HDjBYIElaimM4tCMuSpqeX688LyeKRwOV2HoiScU4ltZR4BC8oQffV5Mnog3ysCmFQ==
X-Gm-Gg: AR+sD12feI4b5iJp+y+siSaSn37DUcPRAsJCz6him6nj+iNeHv6DQpAJan6jJ8kWLzz
	8xado3v169g9Vd9NqQcLTl7qOKe9wf9FoJF4B2rQ//ph9pz2rNmaNpK8+YHUOeilBxsNjS1h32S
	h1f4LR1P3LkbnBhTvebbJuqcGUc7NVjROnj2qjFaR1GLPUZzAYvkc01I2KSQ2PBYogHbPk/h3bS
	JHE3AsT5uU9nKxpql1bI8oPzERokFfffzLY6MSC6wrxY4wKN9SA9FQeZM6DM+3REoKKZtkBRNwz
	gTTtamEP7rkop9wQAAkFFk/4J3/bw88qjyzP42dTIejfKYDfFjA3sNzuixxD6OHePZr+L+3veeY
	DzabGusbn8NDFiOEeY3x2WGqZRT4=
X-Received: by 2002:ac8:5cc6:0:b0:51f:13a1:807b with SMTP id d75a77b69052e-529d7274af8mr64630121cf.88.1785332059061;
        Wed, 29 Jul 2026 06:34:19 -0700 (PDT)
X-Received: by 2002:ac8:5cc6:0:b0:51f:13a1:807b with SMTP id d75a77b69052e-529d7274af8mr64629441cf.88.1785332058528;
        Wed, 29 Jul 2026 06:34:18 -0700 (PDT)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4976bd6dcb3sm61258425e9.11.2026.07.29.06.34.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 06:34:17 -0700 (PDT)
Message-ID: <b123882c-c51f-44b3-9004-bc1c4242af81@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 14:34:16 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 7/8] dt-bindings: sound: qcom: add Tambora WCD9378
 SDCA codec
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260722234221.884765-8-srinivas.kandagatla@oss.qualcomm.com>
 <219d44e2-28ed-4c54-bd00-66e687a0ba48@kernel.org>
 <d0891f90-b69b-4b27-ad58-94c342ad9a6a@oss.qualcomm.com>
 <3c484a68-5db8-464f-992a-6c7584841a10@kernel.org>
 <0cb5a2dd-c49e-47e3-8cc5-ab2ffd397a32@oss.qualcomm.com>
 <ba147ca6-3788-4cbe-95c3-949ae73ee8f0@kernel.org>
 <54f1c3e5-0b84-44a6-a03c-3cd65792de9c@oss.qualcomm.com>
 <6ed441b8-7148-43ef-9c9f-4bc30c468443@kernel.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <6ed441b8-7148-43ef-9c9f-4bc30c468443@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5kDido1QsrwI_DsJph6bmmouLm-2CaNu
X-Authority-Analysis: v=2.4 cv=Id+3n2qa c=1 sm=1 tr=0 ts=6a6a015b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=GYSh3LzNAAAA:8 a=ZVtt1C71RM4PWqMEfuwA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=lWcdFasyL5yHfcDTNXXo:22
X-Proofpoint-ORIG-GUID: 5kDido1QsrwI_DsJph6bmmouLm-2CaNu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDExMiBTYWx0ZWRfX5z2BRgUPkEe2
 NUE+xxOzTiAIVMJ294Pa8sY5svG1rEDt5eRN/SFixSMInjmBbacrxU9OX44CucLC13GRVE1N+/9
 D8WS8y0OZ5i/9VuCk50IoVXhdHeO5+Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDExMiBTYWx0ZWRfX0ywmbsxDVPEW
 jhlV1gn+y43fKs1P0xwmRzBE7k6rB5TAxSc/i/TzpCNNcWVWXm1T1Le9Nv1efhpLHioXG8l12I6
 BGUTjXPjctieiMX1CqCFu4W+YHaRqSrV8K+D1Rel9J4UIsbj0q705Zk25XmwMB2krMUSHea1Zco
 SGjwzNgV/xjt4kU74yW3qFLdCBuf5Wow4ly/BTbUAcInI3tJmMkbYwX3wqZH9HfdPSV5UWrNXiU
 Nrz7FdiZyayNdGdLmGb9+m0jOA+iwRUzJxw7IS58Cl91sEWXjEI9Y58mR+H45dO6ewjO6ZLbqUT
 DWJboCWeKFprPW+m4FwGuwDWVPsUt+A9kGW3oEIWXoEQlLx9/M+1PsW9hEtDEfA1NiemiziITh9
 B1bXoXEbN0l+hgUKCMxlCuCDWfd7aXoaBpi+XzJh5gjuWlXLOgC3ykq7Vi7QXN3uk5OsGczBpEm
 zfqItEikVnDOrTvgo8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_05,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290112



On 7/29/26 2:23 PM, Krzysztof Kozlowski wrote:
> On 29/07/2026 15:02, Srinivas Kandagatla wrote:
>>
>>
>> On 7/29/26 1:43 PM, Krzysztof Kozlowski wrote:
>>> On 29/07/2026 14:36, Srinivas Kandagatla wrote:
>>>> On 7/29/26 1:30 PM, Krzysztof Kozlowski wrote:
>>>>> On 29/07/2026 14:17, Srinivas Kandagatla wrote:
>>>>>> On 7/29/26 12:40 PM, Krzysztof Kozlowski wrote:
>>>>>>> On 23/07/2026 01:42, Srinivas Kandagatla wrote:
>>>>>>>> Describe the WCD9378 SDCA peripheral node (compatible sdw20217011000)
>>>>>>>> driven by the wcd9378-sdca codec driver for headphone playback, headset
>>>>>>>> mic capture and jack detection via the SimpleJack SDCA function type.
>>>>>>>>
>>>>>>>> WCD9378 codec can be wired up in 2 different modes.
>>>>>>>> "mobile mode" on phone/tablet SoCs is enumerated as tx and rx device,
>>>>>>>> each of which has dedicated control and data lines.
>>>>>>>> "compute mode" on compute platforms such as Glymur is enumerated as
>>>>>>>> single standard MIPI SDCA class device.
>>>>>>>>
>>>>>>>> Both modes share same Device ID, compatible; qcom,compute-mode selects
>>>>>>>> which driver path is taken.  Supplies, reset GPIO and mic-bias voltages
>>>>>>>> live on the SoundWire slave node in compute mode and are forbidden in
>>>>>>>> mobile mode (owned by the top-level codec parent there).
>>>>>>>>
>>>>>>>> Assisted-by: Claude:claude-opus-4-7
>>>>>>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>>>  .../bindings/sound/qcom,wcd9378-sdw.yaml      | 200 ++++++++++++++++++
>>>>>>>>  1 file changed, 200 insertions(+)
>>>>>>>>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
>>>>>>>>
>>>>>>>> diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
>>>>>>>> new file mode 100644
>>>>>>>> index 000000000000..2ed4ad92958e
>>>>>>>> --- /dev/null
>>>>>>>> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
>>>>>>>> @@ -0,0 +1,200 @@
>>>>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>>>>> +%YAML 1.2
>>>>>>>> +---
>>>>>>>> +$id: http://devicetree.org/schemas/sound/qcom,wcd9378-sdw.yaml#
>>>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>>>> +
>>>>>>>> +title: Qualcomm SoundWire Slave devices on WCD9378
>>>>>>>> +
>>>>>>>> +maintainers:
>>>>>>>> +  - Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
>>>>>>>> +  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>>>>>>> +
>>>>>>>> +description: |
>>>>>>>> +  The Qualcomm WCD9378 codec presents its SoundWire slave devices with
>>>>>>>> +  class ID sdw20217011000 in both operating modes:
>>>>>>>> +
>>>>>>>> +    * mobile mode -- two slave instances sit on separate SoundWire
>>>>>>>> +      masters carrying data only.  A separate top-level codec node
>>>>>>>> +      owns the codec's supplies, mic-bias voltages and reset GPIO.
>>>>>>>> +
>>>>>>>> +    * SDCA / compute mode -- one aggregated slave sits on a multi-lane
>>>>>>>> +      master and carries both control and data.  There is no separate
>>>>>>>> +      top-level codec node, so the SoundWire slave node itself owns
>>>>>>>> +      supplies, reset GPIO and mic-bias voltage configuration.  It is
>>>>>>>> +      marked with qcom,compute-mode.
>>>>>>>> +
>>>>>>>> +  Codec drivers that match sdw20217011000 use qcom,compute-mode to
>>>>>>>> +  decide which mode to serve; the presence or absence of this property
>>>>>>>> +  also gates whether the supply and mic-bias properties on this node
>>>>>>>> +  are required or forbidden.
>>>>>>>> +
>>>>>>>> +properties:
>>>>>>>> +  compatible:
>>>>>>>> +    const: sdw20217011000
>>>>>>>> +
>>>>>>>> +  reg:
>>>>>>>> +    maxItems: 1
>>>>>>>> +
>>>>>>>> +  qcom,compute-mode:
>>>>>>>> +    description: |
>>>>>>>> +      Marks this SoundWire slave as the single aggregated slave that
>>>>>>>> +      implements the codec in SDCA / compute mode.  Only present when
>>>>>>>> +      the codec has no separate top-level codec parent; in that case
>>>>>>>> +      this slave node also owns the codec's supplies, reset GPIO and
>>>>>>>> +      mic-bias voltage configuration.  Absent in mobile mode.
>>>>>>>
>>>>>>> I doubt there is really "compute" or "mobile" mode, so you just wrote to
>>>>>>> match use case, but that does not match hardware.
>>>>>>>
>>>>>> This is hardware fuse setting, its not just usecase based but it changes
>>>>>> complete wcd9378 hardware topology, in mobile mode we have 2 soundwire
>>>>>> devices representing tx and rx side of wcd9378 however in compute mode
>>>>>> it only has one soundwire device dealing with both tx and rx. compute
>>>>>> mode is sdca class compliant device.
>>>>>>
>>>>>>
>>>>>>> I think there should be no separate top-level codec parent in the first
>>>>>>> place, thus this property is not needed. You always list here all resources.
>>>>>> There is no top level aggregated device when the codec is fused in
>>>>>> compute mode.
>>>>>
>>>>> There should not be a top-level in either case. This was always Linux
>>>>> driver limitation.
>>>>
>>>> That is not true, its clearly a hardware topology thing.
>>>> Codec has two devices tx and rx, Only one of the device (tx) has access
>>>> to CSR registers of the codec, so rx and tx are pretty much a single
>>>> aggregate codec device which is why we have top-level representation of
>>>> the aggregate device.
>>>
>>> So two devices, but not three. If TX has access to RX, it does not mean
>>> there is third device. If there was a third device (that top level
>>> thingy) you would have it here as well. You don't have, because it is
>>> purely for Linux.
>>
>> WCD codec is a single Codec IP Hardware block which contains two
>> soundwire interface devices. Effectively we have one aggregate device
>> representing codec which encompasses two soundwire devices.
> 
> You have only two devices.
> 
>>
>> Third device is the only place where we could represent entire Codec
> 
> No, any of these devices could. The top-level is a fake being.
> 
>> rather than just soundwire interface devices of the codec.
>>
>> Am not sure what is Linux specific here, its purely hardware topology.
> 
> The Linux specific is because you needed a placeholder for power
> sequencing. It is not a pure hardware topology.

Not just power sequencing we have

1.  tx and rx register read/write interactions happen as part of this
device ex: reading and writing rx blocks inside codec needs to go via tx
device.
2. connecting/interacting TX and rx processing blocks ex: mbhc
3. power and codec internal clock management


> 
> Otherwise, please point me on which/what hardware bus that top-level
> codec resides on if it represents hardware topology.

Its external codec to the SoC.


--srini
> 
> Best regards,
> Krzysztof

