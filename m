Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2742F4314B0
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 12:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785327485; cv=none; b=KNurE2JXCcYY3KJepwzohNNdDQWiI+pHu1C7HL4yKRMZQikv8Gw2LZ2sKveft1F8xpETHNtcCuY8fE96CFfjYhEotEMY8iR0rlWrccnQ7P9no/6GRankw/J4W/iKB7ZWNm1G6CT2Kq86NITvKUMfd6+r2vwlydF00Z0OI75cb0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785327485; c=relaxed/simple;
	bh=XFNOQjyXquiXGVIZ0XLx3c2mZBrHIE1tP9VygcQlH4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rHv+aUn64k9JwH/QjbkAKFlnFr2/2rZlWOiQXPF2pSiGf8QU+pHRDxtARJwQkNf/i9Xsr3A1SdOoQcmFwAVDSeuAZ0ZExF6SgbJfgKZO6/5PBoxSK0aljnd3u7m507tbltHMNTmZHR98PzxbCsesTno0WiECXXFH6XBEV3UVUR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Czg0D2cp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QXJpMAQm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Czg0D2cp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QXJpMAQm"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TBvmR31929466
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 12:18:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dcALPi8e1umwIbUkcXXCGQ1MbABqonpV8qqtdSQE76U=; b=Czg0D2cp9xhRJ5i4
	5/GMq4mw1j+Hnt9AQkfI9Ymt2PX8SjSQB2HeDHRnCsVLRZ7Gzv4vU9NP68mdxigY
	55o0MXJl1xySP2us6+V0Hg+RXTikEyAmDAfkig+eJ65jv9MorcTnHjsfH90xYslZ
	lA37r0l0V8buCqOaVzj/VI2I3lEnN7VIggKLFj8AnjQ1AgDhKSIZSv5TlYBEbB3X
	wEx2++xqjLi5kaAc+10UHAxoeMI4DFHTaiTOR+ZJZIBsXFDHyCzUxP834n3hL3np
	C7rw34D6Ym5HFVqaQ8qpPimJiUtOsx/jpHvH91xvpK9TpIlR+RWJn0wLElcglSCB
	qaGiRQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqh3xg2f6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 12:18:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1c7f135bso17153961cf.0
        for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 05:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785327482; x=1785932282; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dcALPi8e1umwIbUkcXXCGQ1MbABqonpV8qqtdSQE76U=;
        b=QXJpMAQmkiWR7otCcl3YcvVQkDFFFtrXiJxW1hQ9P8DULzODB/oqfX+kr4ejlbymqg
         fGGF6eOIzmbW99lGyTE4uvyBpir8KW+FzQwgDa4BiGnrP218HiatsZZtWR2lUJdy7VNv
         lxuC/Rj67VZ5UJky5QewJ6HM1KBiaWfpyduFCfZFdRapW6nc2B4oFRIRcQV4rSK97VF5
         ssOAeWboR2FIPyDcIttwIutRRo27Eme3bq2XAui/0CMj56IU+zNr7s/ZHZsCVcqqbH0b
         0nwsThiWpO0EkgHCQTGc03A+L6ViwwZi32CAx7Qyhxv22V4YvWhgAnNYUEvC8zfScYPf
         kfuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785327482; x=1785932282;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dcALPi8e1umwIbUkcXXCGQ1MbABqonpV8qqtdSQE76U=;
        b=M/3pnlN7kknq6YLpff7jqEkW4SRMVlhELrR5VbQVCANNwF5f5BTMStWScYWxHleRcp
         MQfyv9TzmyCnMY8xxxnl7rIPohOkGCg9sM6bJuvQ2oGdYHWVOBUPoXebwctcN5Z6XPEN
         eZ0qxPBfoA6v8dhReGdaHLBsVA7R4Or4yqC4EKHWmfruKWS+sswVHymxWtyc6yRZz8DL
         FCPMMiUeQJYWPFxUZXFhTCvRv7fbAP0mih6nbU/A6UIE9NVru+ZM3LprrN1dxJw5MhuD
         BmAbzM5cNtfmLgBz04WiZhleXyzHDDHy6bu5PKC5p1XCEzYTSezz9XDw3Xp00kFcyVS5
         3PuA==
X-Forwarded-Encrypted: i=1; AHgh+RrN1uBsGqH4QPPow3Pohrbq0TrFQ7sYPffwxThvcCf4mOjM64rSqdgvf7KaZDSRgTE+vb2R7NY22G33PA==@vger.kernel.org
X-Gm-Message-State: AOJu0YySFI7FUQFaiCCvwP4Z5/thznkKc60T3U1Ai5NqmG/A6JAPrCOi
	WDIWSORpmeRC3S2Z+qd4akPjY3MZHhD5mmIgFP0KP7ToaO7GaiftENVGj75rbzIrjif99fK0IuV
	2vpBizbfhXmytO6GiBX8fYNKY+OXhbbPk01Uks1Qlwgz7pYGLlOFb6X9LqmcV2hPI1g==
X-Gm-Gg: AR+sD12ytauCtMd1jh0vSHk6Wm2Pa2wTxp6dJx+dxJBD5r6BQ5j8dvq2dUj5WDWAz7M
	H5qy85YsjIB4yAaIvO/KApI0QDI3525a6C8YOi6CWo8igRzYxT4GktCDfsJ9Nkz4XPHQF/hOz4Y
	4NhUoOv6RuDOQ3pLNk6yZsVMU3L5qq4dnq7B0MQaekPdVk/XgXdkT7Uv1FBAWvSYAOZQbmjKFzs
	vxtgaxh2nTGJAdoSpLyOtdivSrXVnfYT25HkMtUnymM7Z447MXTL1AlSKEuj18rwlTgdGq2ZjKX
	BHfl0HG+3Z3Zc12j+dFcvb/+BlvNvIUe8YMP5LEKxJu4gDvw2RlntRUie9BKMuI/KgyjUw7fGkh
	bpmAwr1hnTFGwfDjmBGPzO4rbJ7I=
X-Received: by 2002:ac8:7f14:0:b0:51a:8c97:fb90 with SMTP id d75a77b69052e-529d71d2b65mr56815891cf.57.1785327481808;
        Wed, 29 Jul 2026 05:18:01 -0700 (PDT)
X-Received: by 2002:ac8:7f14:0:b0:51a:8c97:fb90 with SMTP id d75a77b69052e-529d71d2b65mr56815511cf.57.1785327481270;
        Wed, 29 Jul 2026 05:18:01 -0700 (PDT)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49764d77970sm56598785e9.5.2026.07.29.05.18.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 05:18:00 -0700 (PDT)
Message-ID: <d0891f90-b69b-4b27-ad58-94c342ad9a6a@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 13:17:59 +0100
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
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <219d44e2-28ed-4c54-bd00-66e687a0ba48@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEwMiBTYWx0ZWRfX5Wg9SFBWCBse
 RUcpjXLMzE/qvX8w9uDv2Jn9j6nqrZWWkPOTDQBCwJufbT8WeXiTqgdzTw7WUEvqInZJiPtItUc
 V8AuClZYa9fHZaHiDn0oNgh667nCH/k=
X-Authority-Analysis: v=2.4 cv=Opl/DS/t c=1 sm=1 tr=0 ts=6a69ef7a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=GYSh3LzNAAAA:8 a=9ySP6EWktxY0XWfVt14A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=lWcdFasyL5yHfcDTNXXo:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEwMiBTYWx0ZWRfX+Byc1/4J1Rkv
 pZaHccaxz/vHaON9C9P16Mhq3m1qHNSgcG+fAMib+CJ1pndb2TnQkdXE+4Rz/5UmkP00sw4ne1j
 N0IZiRMwUSDtkhwn9lk0W3TQ1MsFntebTEeK14XBQSj718OW/BBikUAzmBqwHMqZNG9rEvrRAmH
 G8zqPXLQQRqCKeubz7hWIzkDFb4wpdhX2GMRhOXO1porQn986oF/hO6rmiwJm+0Ro284e9J6val
 xxwhvsCWKRIq9nNp3lPOjefsSgCjDcMsN6f1LFESzdF3IMu2eEJNNBIVmaLlVZt4UbURuHiThOM
 sM8SQqp3XTI1xrlNvKPsa9oOJRrwhBqN1tf8rTE1tmhex7Cs1tKIpjCJ/Eca/sv0IWZqDHV0YUz
 rrwl2mXcnRz+p+Ew6JtBvYtw4J7d/IN3iyjODhE1OMBhHqZTaZEro8dezN09PH8P8t4Spgg+H/G
 8hBvVzK32SdF6mF0BVg==
X-Proofpoint-ORIG-GUID: OxL5EXAetq143ALkjLQ1Fn_E7kEVZYNz
X-Proofpoint-GUID: OxL5EXAetq143ALkjLQ1Fn_E7kEVZYNz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290102

On 7/29/26 12:40 PM, Krzysztof Kozlowski wrote:
> On 23/07/2026 01:42, Srinivas Kandagatla wrote:
>> Describe the WCD9378 SDCA peripheral node (compatible sdw20217011000)
>> driven by the wcd9378-sdca codec driver for headphone playback, headset
>> mic capture and jack detection via the SimpleJack SDCA function type.
>>
>> WCD9378 codec can be wired up in 2 different modes.
>> "mobile mode" on phone/tablet SoCs is enumerated as tx and rx device,
>> each of which has dedicated control and data lines.
>> "compute mode" on compute platforms such as Glymur is enumerated as
>> single standard MIPI SDCA class device.
>>
>> Both modes share same Device ID, compatible; qcom,compute-mode selects
>> which driver path is taken.  Supplies, reset GPIO and mic-bias voltages
>> live on the SoundWire slave node in compute mode and are forbidden in
>> mobile mode (owned by the top-level codec parent there).
>>
>> Assisted-by: Claude:claude-opus-4-7
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  .../bindings/sound/qcom,wcd9378-sdw.yaml      | 200 ++++++++++++++++++
>>  1 file changed, 200 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
>> new file mode 100644
>> index 000000000000..2ed4ad92958e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
>> @@ -0,0 +1,200 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/qcom,wcd9378-sdw.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm SoundWire Slave devices on WCD9378
>> +
>> +maintainers:
>> +  - Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
>> +  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> +
>> +description: |
>> +  The Qualcomm WCD9378 codec presents its SoundWire slave devices with
>> +  class ID sdw20217011000 in both operating modes:
>> +
>> +    * mobile mode -- two slave instances sit on separate SoundWire
>> +      masters carrying data only.  A separate top-level codec node
>> +      owns the codec's supplies, mic-bias voltages and reset GPIO.
>> +
>> +    * SDCA / compute mode -- one aggregated slave sits on a multi-lane
>> +      master and carries both control and data.  There is no separate
>> +      top-level codec node, so the SoundWire slave node itself owns
>> +      supplies, reset GPIO and mic-bias voltage configuration.  It is
>> +      marked with qcom,compute-mode.
>> +
>> +  Codec drivers that match sdw20217011000 use qcom,compute-mode to
>> +  decide which mode to serve; the presence or absence of this property
>> +  also gates whether the supply and mic-bias properties on this node
>> +  are required or forbidden.
>> +
>> +properties:
>> +  compatible:
>> +    const: sdw20217011000
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  qcom,compute-mode:
>> +    description: |
>> +      Marks this SoundWire slave as the single aggregated slave that
>> +      implements the codec in SDCA / compute mode.  Only present when
>> +      the codec has no separate top-level codec parent; in that case
>> +      this slave node also owns the codec's supplies, reset GPIO and
>> +      mic-bias voltage configuration.  Absent in mobile mode.
> 
> I doubt there is really "compute" or "mobile" mode, so you just wrote to
> match use case, but that does not match hardware.
> 
This is hardware fuse setting, its not just usecase based but it changes
complete wcd9378 hardware topology, in mobile mode we have 2 soundwire
devices representing tx and rx side of wcd9378 however in compute mode
it only has one soundwire device dealing with both tx and rx. compute
mode is sdca class compliant device.


> I think there should be no separate top-level codec parent in the first
> place, thus this property is not needed. You always list here all resources.
There is no top level aggregated device when the codec is fused in
compute mode.

--srini
> 
> Best regards,
> Krzysztof

