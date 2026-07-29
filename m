Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6973A6EEE
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 12:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785328576; cv=none; b=Bm+z1mAezsf36LYF4v42rckqux5SJsVFKmiYJHH/PK+b/mPMA4T232cnwOaraOfcdxX1iJCObxXhoAMLgwOvBZMDrW2N+Y+dUH24daZdtnD+Qe/iwFQxqJBMGsbqVjpZZbK0nBrkFpOOIiA+QYUK0D8Z538+qG/4uZVmnQRB8uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785328576; c=relaxed/simple;
	bh=b+iNsDFEHoCrdY3q7/dXhBGQBGrcI1IKuOBRzn7zAds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bhqQv7FEzwRJG/0ZIHS+Rn3yOQp4WTbpHSptspgU0tYH5drVr9mCrGkOu7wjskblxN4Ozc67jw/g5WjLS69pFoNGw6DeTgWd/zBcgODaRmmLCDpgrkaR9uywQq7mdONGOIYhgWrPLTt6DD3BPadFI8U7DxaPUy0EMHV5ChjZFz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LugtbWXW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DLOw6gEr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LugtbWXW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DLOw6gEr"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TCO8ls1814513
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 12:36:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/y1ew/AaO4a3TiUoZQMqr3KatEChOpw6KP2tFHQUBBM=; b=LugtbWXWveq7yjdD
	e0MFujqOckmzpkStmmE3+Rw13C7v3VWBzdN5bkNQY5cH1I7pon74vnJTkxwz82cg
	9wbcJA6wkRoH5OKfX0MPzHQyDcBB42VXoFBF/1Zk9wu+mFabiFARInRY+Y7YTBd3
	W62vV7pfwrlMxE06Q9dbSBW81JxW6AO4+FaYR1SyGlPjRV8YC9SJJG3UE9jlRw8X
	rcB3V1SN3gRPmXvFPus1dd7wt1HhDiBEivE2Pt4o2F4TDGkuXswBfyTvudTIBkMT
	OVVguOuP29t8TRrkDlUXsu/PjWjZ3Tr4W221Tue7Bb1zPq87sIkH3WYpivOnXtGQ
	1HP21Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqhg8r1km-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 12:36:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5174a236220so8676081cf.3
        for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 05:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785328565; x=1785933365; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/y1ew/AaO4a3TiUoZQMqr3KatEChOpw6KP2tFHQUBBM=;
        b=DLOw6gErmb7qnBWp7OJ3GW+TIPdmHeZ3Z0l45KPFjliIcYWnWtiZqPGtRc9oq1F84Q
         a1ySHoPjCWhrsK30nymNy2/dABdZQw66VMIJ8BfG2OSFAZ+pV2VNF16z5dMM2MR9zaDc
         sH38ht3K/4GJR7cw7hfW1j6TwjrMV69ILMEpt3P0C6NMmtQF27COiRHsN+kw1t8ZTv4X
         r3WDkztdqhKrm3xnfXSqVxnSQUKMCAA0wq862a9kze6AjMlu8G5OsaRiQwv1T5CeQU8l
         690WywJeC9SknaZYvchMGtkO/JDA/5G9kroxorT8btjl510jqNDp/gt4Fp2T0xsMOT7A
         N6Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785328565; x=1785933365;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/y1ew/AaO4a3TiUoZQMqr3KatEChOpw6KP2tFHQUBBM=;
        b=LvMJl2LhBVTOuTCzeSxd2xj3v4tty7Y50JJWv6MW7Y4P2JcQYrnZ8ZiPJ22NS1PbWl
         rCNYWaXNrhjwlisfsSm50mf1rP+hRc+MDYoWezaufDBpw5/oVq7RIC5PkHW+yU5wOrpy
         T7DVgJDxp/R9gsr217dSqjklimBjSffh2GscnATsXfrydWYMA7OryRUps+TjjjH4H7I1
         xxHOC5tpwd4FFPqQbRqph2MOox/kyAKkG6sTdWiq6oxITRT7ucG2AOdRw8g2BCkjB3C9
         F86blCfP9z7fikoFheN1OMaPzg5q7DS63Z9IBfEWHEx1B0fTqpaGu3NE25+7yv51ZN1B
         YoUw==
X-Forwarded-Encrypted: i=1; AHgh+RoLeFNkc6Ey1IcoQuSNxxXufOmL1SIBVu/lhwjP0plDMxMUE5xv2uQaeYB3noUOZX3j5VgGFhzdpTTM2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGTPDhbVNqPbZZyykJqbrlCQ6vX5ImihUe2kdwyT4v1aG/rTRM
	EV2ai2eiVfLJbfUVleMWJUFffau98Vdqn0sWE4pH6vgpCbiqshMytbBOEZDXvpZpOfG6e1UbmEH
	FNsD9Yoi8cG994hxcJyKlex5RIXwtmuMyIChIYiE47uovATPTiwyk4NWOZj2/hH/lmg==
X-Gm-Gg: AR+sD12ltgL+dFzbqTsGbQsfzNqG37TSsgWS3NVCrXFvQYnxiPq3vWA1UDJFQWguNIL
	1PevFcWtbvSStVehFIbC8uvECbo0/YAdWK/rrB1PsAI2zSdeZhtIYmHOF+2VRdFLRZOalPbsbH2
	DpXcLZ4SQhh26AHIEPt/Wv1DtB4SXZI/UPV2OiM74vXkAONZYYhngocW3+dBALkujEtMuyVVGgi
	T7kd2kTXwUfsIv30gkziDMEjCkz5fCFaIQeS8oWx47NCN+c1lyh7i569+i4da3/tpr9qhdffDAT
	Dgazb6z8vdAHMunaJsL9YX7HlDjMnLDV/ValGKXUqEeYx1AN/dhsVKYSuU+ecdWXaql/9PNbBPu
	l682UEEsdwXwSWrWsP7r766c8V+8=
X-Received: by 2002:a05:622a:4d91:b0:51c:164b:b240 with SMTP id d75a77b69052e-529d6faf287mr57170221cf.4.1785328564540;
        Wed, 29 Jul 2026 05:36:04 -0700 (PDT)
X-Received: by 2002:a05:622a:4d91:b0:51c:164b:b240 with SMTP id d75a77b69052e-529d6faf287mr57169831cf.4.1785328563999;
        Wed, 29 Jul 2026 05:36:03 -0700 (PDT)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6a050be9a91sm839143a12.13.2026.07.29.05.36.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 05:36:03 -0700 (PDT)
Message-ID: <0cb5a2dd-c49e-47e3-8cc5-ab2ffd397a32@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 13:36:02 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 7/8] dt-bindings: sound: qcom: add Tambora WCD9378
 SDCA codec
To: Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Charles Keepax
 <ckeepax@opensource.cirrus.com>,
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
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <3c484a68-5db8-464f-992a-6c7584841a10@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEwNCBTYWx0ZWRfX2uJrShn4jHt9
 htagpBYt+gxibGFZkHjDtCro1NV+8xXKOdXe4kmugwDObvVc21OOPRqatLUzdvdKSH6kvzTv/sd
 fTzk85PhGAUqyrt+IIGs0GXCFDl/W2s=
X-Proofpoint-GUID: AVErr6xSkLiqljyNpPGKvivz0EzYU7A-
X-Authority-Analysis: v=2.4 cv=LOdWhpW9 c=1 sm=1 tr=0 ts=6a69f3b5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=GYSh3LzNAAAA:8 a=ueJt-ghu4yImuhG8B5YA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=lWcdFasyL5yHfcDTNXXo:22
X-Proofpoint-ORIG-GUID: AVErr6xSkLiqljyNpPGKvivz0EzYU7A-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEwNCBTYWx0ZWRfX+mIXO4j3tq46
 ZTQlygm9sPvKfo9M/yWWjomz2oHlRP5abr6EMFQcFtfo5+VxlasB4LXRCTNCVFyYT2ymgKW4nM8
 guDrEgMizhB47o/wFAx/cRyuszoQCq8nzhKXIFmH3a3uo4Aj9DjhvxSxadVLXYwgpyIqF0OTtUA
 eQmnL7lhzCpZrVKOzYo+4Yt4ETn1AEwGT3OU9CBn7oRkFOO9EQvMUCYh5QoLe3NRKToy57cxMhV
 iuZLTdErXr+IH9+l1gdWb/z9GT+HhsAfuyu5MLIo0MRkf5rSauneqgjhzqTT+PPoxTvTC/8NOvL
 jHgyGOcIucFmvcK6tpbM14uv6J+XpVq5/72nq+4m6M2u9niK2LFjGwgF+oTXtqPsC8qlK3Vt7E2
 Nj2u4ZyBY4oE5se+5sfSrWYwxm1iT4yB85iaGmn66PzWCfgjVVB068MXHKCD7HkGcQnHjaYU0Ws
 adurC2BNYgiBxOuOXqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290104

On 7/29/26 1:30 PM, Krzysztof Kozlowski wrote:
> On 29/07/2026 14:17, Srinivas Kandagatla wrote:
>> On 7/29/26 12:40 PM, Krzysztof Kozlowski wrote:
>>> On 23/07/2026 01:42, Srinivas Kandagatla wrote:
>>>> Describe the WCD9378 SDCA peripheral node (compatible sdw20217011000)
>>>> driven by the wcd9378-sdca codec driver for headphone playback, headset
>>>> mic capture and jack detection via the SimpleJack SDCA function type.
>>>>
>>>> WCD9378 codec can be wired up in 2 different modes.
>>>> "mobile mode" on phone/tablet SoCs is enumerated as tx and rx device,
>>>> each of which has dedicated control and data lines.
>>>> "compute mode" on compute platforms such as Glymur is enumerated as
>>>> single standard MIPI SDCA class device.
>>>>
>>>> Both modes share same Device ID, compatible; qcom,compute-mode selects
>>>> which driver path is taken.  Supplies, reset GPIO and mic-bias voltages
>>>> live on the SoundWire slave node in compute mode and are forbidden in
>>>> mobile mode (owned by the top-level codec parent there).
>>>>
>>>> Assisted-by: Claude:claude-opus-4-7
>>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>>> ---
>>>>  .../bindings/sound/qcom,wcd9378-sdw.yaml      | 200 ++++++++++++++++++
>>>>  1 file changed, 200 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
>>>> new file mode 100644
>>>> index 000000000000..2ed4ad92958e
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
>>>> @@ -0,0 +1,200 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/sound/qcom,wcd9378-sdw.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Qualcomm SoundWire Slave devices on WCD9378
>>>> +
>>>> +maintainers:
>>>> +  - Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
>>>> +  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>>> +
>>>> +description: |
>>>> +  The Qualcomm WCD9378 codec presents its SoundWire slave devices with
>>>> +  class ID sdw20217011000 in both operating modes:
>>>> +
>>>> +    * mobile mode -- two slave instances sit on separate SoundWire
>>>> +      masters carrying data only.  A separate top-level codec node
>>>> +      owns the codec's supplies, mic-bias voltages and reset GPIO.
>>>> +
>>>> +    * SDCA / compute mode -- one aggregated slave sits on a multi-lane
>>>> +      master and carries both control and data.  There is no separate
>>>> +      top-level codec node, so the SoundWire slave node itself owns
>>>> +      supplies, reset GPIO and mic-bias voltage configuration.  It is
>>>> +      marked with qcom,compute-mode.
>>>> +
>>>> +  Codec drivers that match sdw20217011000 use qcom,compute-mode to
>>>> +  decide which mode to serve; the presence or absence of this property
>>>> +  also gates whether the supply and mic-bias properties on this node
>>>> +  are required or forbidden.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: sdw20217011000
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  qcom,compute-mode:
>>>> +    description: |
>>>> +      Marks this SoundWire slave as the single aggregated slave that
>>>> +      implements the codec in SDCA / compute mode.  Only present when
>>>> +      the codec has no separate top-level codec parent; in that case
>>>> +      this slave node also owns the codec's supplies, reset GPIO and
>>>> +      mic-bias voltage configuration.  Absent in mobile mode.
>>>
>>> I doubt there is really "compute" or "mobile" mode, so you just wrote to
>>> match use case, but that does not match hardware.
>>>
>> This is hardware fuse setting, its not just usecase based but it changes
>> complete wcd9378 hardware topology, in mobile mode we have 2 soundwire
>> devices representing tx and rx side of wcd9378 however in compute mode
>> it only has one soundwire device dealing with both tx and rx. compute
>> mode is sdca class compliant device.
>>
>>
>>> I think there should be no separate top-level codec parent in the first
>>> place, thus this property is not needed. You always list here all resources.
>> There is no top level aggregated device when the codec is fused in
>> compute mode.
> 
> There should not be a top-level in either case. This was always Linux
> driver limitation.

That is not true, its clearly a hardware topology thing.
Codec has two devices tx and rx, Only one of the device (tx) has access
to CSR registers of the codec, so rx and tx are pretty much a single
aggregate codec device which is why we have top-level representation of
the aggregate device.

--srini
> 
> Best regards,
> Krzysztof

