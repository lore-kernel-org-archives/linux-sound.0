Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBCF3CF1E0
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 08:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782204857; cv=none; b=skti3C7vAXqLRj1an/1JnQxx1M6moL2SY12tiiU5mOFKW9nV+3vFweQfWIvm1xU9DS4uEILZWfADVoQIQx2tDc/4xQrKc2c+kskUEoQ9yxo6WtF8UjbjRqsFAp4gCVfTEMhM2hOLN7OcaL58UamSsCk9lX8D0TEx3OiOnQoQ9jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782204857; c=relaxed/simple;
	bh=UKPeFZkVjoN1f5cOoU9zC8RjUtGvrmqD0t/+VYvZqs4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g8h6Fla7HGcEuIX6D0wPSRVllNUIDir0wRghf7zb5ZVfISQL5JdDXz4s7hgCSNcl/KzNl4TX1gelAV9+WW09szGk0q1jMB4aPUbwdNyU2zYSvUVdY4JWj+mrrQsKsfPUgItM/GHX7VaOMqeoV2jmlgan9pvXQ9XliTLsGxb97hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dY63+Hl7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ETmjHYrd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dY63+Hl7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ETmjHYrd"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6cwPU3547461
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 08:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CSmLihCC6mZQWr5AxByQaYexpwIz57mc1SOGzHGUD3E=; b=dY63+Hl7lHY6DDfC
	wbdVJO8lUv0CVAgrHUtRCtn+WuBd0LqrsjAQDdXv+cp0eOIjIwxqQQRO6ivV97iC
	3ZOp9wLemg5Cw36x+SiD6jpaDWK5jSkTB4LH5z9DaOuE5LEsJ/W9ZM3EowrqVp//
	FAPITVA8wPafSijfp+99umvyxWXKXYSymRrlwtOrWgC6oymjv0cATCTZvWNq+YJF
	SO0VLF+QqrkCYrQeArb964o80WCM2pwV3DsJwawV3CebamRh8Z2NgBfXG0I/5AlZ
	nMxoOYaWRgB+oUyGeFUAnMWf9Jrt5SM19hZHpCkdvL+qukrXda8DJ6JW1cM9RXpM
	PRoYyQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey3ebcad3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 08:54:13 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37c9d82cd57so5597499a91.1
        for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 01:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782204853; x=1782809653; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CSmLihCC6mZQWr5AxByQaYexpwIz57mc1SOGzHGUD3E=;
        b=ETmjHYrdQIX7/8mmi8lrTVZYWBEtbc/1PhypjlslEMfOogmlUMMjiNRV5QMaFbv5LR
         36dkbfx4X3LLYI9yEhMzBfFC3iRf6uGpxmHOGJKzgXy0jfKfcHAsAuNUmmFbzPfcJEz9
         nwHUmzeWUAedWXJieXBJOrKx2QXDO319P6tDSNXgmC31RKuzdTDpHTawD43NllesG/jw
         NYOYQqMFBhM6SclMwTv3FrZ35pG6uctsF6VwLo90Rio0EfFUmdRhhNp++ieSTPBKL8Nw
         njCwVKPqYc+afKs/LIHQylLl5L0B29+Yb5Kpcjl33vXxErofTBYVizxWjfzZewdUD86m
         8qwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782204853; x=1782809653;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CSmLihCC6mZQWr5AxByQaYexpwIz57mc1SOGzHGUD3E=;
        b=mabGA/jVYGe7nhhOW+T/ybYcwhXvmIwiZW0oYiskYuasUwg497atUlT5Kng4mm/oOT
         +O0KPJyaKwQqMg5v4kXrIoNmOFKOnybyt5yi+NvuxTT4+jzaHqt7H58qojLUjQ6Cs0iA
         Ge7OXN+wz/L6AgCNS6LXZHSAy9MzrP+lPqWXMAItNzLwUDzTLdhxIGT3AK/XmPemlQU2
         LTqwITzubLRz/NMZI78v8XPjPNHbsrHHKHD3twL4br4c0cPdem3gJqiTmEiLYsMEo6Aa
         mpkc9LqS3h2fxHCdxHOAkLkAYVDIySQVuAg6hR6RwCulOcyHaP88onIX5oowSURs8XPl
         YZWw==
X-Forwarded-Encrypted: i=1; AHgh+RpWRuqRZlxPBBUVUiD0k3hxt8E6wpTLrYGFncIRWrYuyvY+sZLEUEnGpmuX7NIupvK2OSEfOON2J/Djjw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg4NVKGAS1jimm0DIuVDfQiWlNBCm2uRjHlWJITnwtatZjp+Kl
	27R1F+t9+zeqgJWScLegOZlXWrnnVXwToWJPd4KdWtM35q4ai2qWWG5kY890ors5U9e0oYp+lPl
	cAG7ici6QhnBA5IDI+mIog4uQlCOfsptxqNe9HTsJqgyB30ix+IkDp26znpmida2Rsg==
X-Gm-Gg: AfdE7clTUf02spA1nqBLR8N6DM9hpXkzT/JId1xgJJMLxmlexfPFN2EROL0Ducfn7f3
	9K+r0ShzKM30OWxRXY8CKAM1jgzbwDqjdwKMFWaDSgCnHovIZxJzQX9PwpfNEA9r6qMH9RlbqNm
	c2j5D3IMB45/Ob9/hWOTqNsUznUqiABjcTZJXb5WWdM6k68ItGQNL3mHDxZeRbHbnTJuyuFOBiJ
	HbQTKruY25EM0qSNsDZi8TO4LghoOqzJaPOnKtveuU9UQ8psQHvTPqIUgOXZcXPmdKsM1L8E8kb
	vxHwQ/B07WCcE/3keL2w2DJeQ+n/TjaDCw2KiOLbDeCn6GD7eMnVbE3kgzb7Z+8oG8l61K/SLln
	6wc+d2247g7UIDJZRjN/ABAFnA+bkLdxvulUfqdeJ+3Jb
X-Received: by 2002:a17:90b:35cf:b0:36b:8baa:a683 with SMTP id 98e67ed59e1d1-37dd176c01dmr1791498a91.19.1782204852990;
        Tue, 23 Jun 2026 01:54:12 -0700 (PDT)
X-Received: by 2002:a17:90b:35cf:b0:36b:8baa:a683 with SMTP id 98e67ed59e1d1-37dd176c01dmr1791480a91.19.1782204852457;
        Tue, 23 Jun 2026 01:54:12 -0700 (PDT)
Received: from [172.20.10.7] ([106.192.20.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d15de53ffsm12654566a91.12.2026.06.23.01.54.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 01:54:12 -0700 (PDT)
Message-ID: <3705ac5e-7e9c-43ec-bd1f-9757445984b3@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 14:24:01 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: sound: add qcom,wsa885x-i2c
To: Linus Walleij <linusw@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Bartosz Golaszewski <brgl@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260610155708.151067-1-prasad.kumpatla@oss.qualcomm.com>
 <20260610155708.151067-2-prasad.kumpatla@oss.qualcomm.com>
 <CAD++jLkFPb4CZqTsAh_qX1Jt9pWxhwhgbhREe9uybL_S7-t60Q@mail.gmail.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <CAD++jLkFPb4CZqTsAh_qX1Jt9pWxhwhgbhREe9uybL_S7-t60Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA3MSBTYWx0ZWRfX3EkrOKu+LLxN
 /HJhvs3L1I4Xo5Oy939gmKXMl4JZ1X0ADGc5jMlWhQCzaMNBnuKJ6q7XY1c0N4CQOUokKHHmmP1
 J5Ahgvla4s6P5rj3MP6qFfifojXak0M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA3MSBTYWx0ZWRfX+HAT0oYUORhG
 WEfA/FmE0Q/Tx4Y/v7d7dJxRVF3/3fQO7aYbXHhBRK80rbYzdI6WW9fJyHmM+hSvvEtKXa45lqk
 gtg3KEJOB8wTlzcD8F/+QOv/sNx+5+zQcUZ78PMFo6ZmkGmapKRhCLj3t7KkZ5ifv1WT9Tja6zF
 m2ADXByWLm6Zfqwuso89sRpfahEG/vhJ4NpT5A/DnTV2c9Fs/3XUd0rQIph9ipFE/HdHEzzvRqJ
 ZDA+ynRUn5pUWvRPN4W8hDSkVUG/puhmKcuxiqAkMcebTiWVCKpwXOMY4RsegQ/MpeKUu2QIGdV
 hqNp5XDAYr3SV4z8ddbLZV4QAb65njI6H3eI8926eYZ9MtpCy1yCrpm2ulsnuoTBX3CYfbSkcUQ
 iK37+dOS+BML622oW9D20+PjgwM4tPKkJ/725A0OlH5tO6zns4gzi+ksylZfl/omtEmmg5TYRq+
 jBNJXlkG4lE6bnqaSEQ==
X-Authority-Analysis: v=2.4 cv=ILIyzAvG c=1 sm=1 tr=0 ts=6a3a49b5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=GtHFPjVsJ1z6j8OeKiQY1g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=gEfo2CItAAAA:8 a=K5i35rRROUDlzIanDXoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: BIon8CChLD9YHJf_iLu0QCygWCekxEMX
X-Proofpoint-ORIG-GUID: BIon8CChLD9YHJf_iLu0QCygWCekxEMX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230071


On 6/11/2026 2:50 AM, Linus Walleij wrote:
> Hi Prasad,
>
> thanks for your patch!

Hi Linus Walleij,

Thanks for reviewing the patch and for the feedback.

>
> On Wed, Jun 10, 2026 at 5:57 PM Prasad Kumpatla
> <prasad.kumpatla@oss.qualcomm.com> wrote:
>
>> Document the Qualcomm WSA885X I2C smart amplifier binding.
> Skip I2C? We don't need to tell e.g. "PCI" in some device on PCI and
> there is no reason to mention I2C for this device, the fact that it sits
> on an I2C bus will be apparent later.

Ack, Will rename the file name.

>
>> Describe the required supplies, powerdown and interrupt GPIOs, the
>> optional battery configuration, and the optional init-table property
>> used to program the device during codec initialization.
>>
>> This matches the driver programming model and documents the DT data
>> needed to use the codec on platforms with Audio IF playback.
>>
>> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> Perhaps add
> Link: https://www.qualcomm.com/audio/applications/compute-and-mobile-audio/products/wsa8815
>
> (...)
Checking internal to get product Doc to publish.
>> ---
>>   .../bindings/sound/qcom,wsa885x-i2c.yaml      | 89 +++++++++++++++++++
>>   1 file changed, 89 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa885x-i2c.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa885x-i2c.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa885x-i2c.yaml
> Drop the -i2c suffix on the files.
Ack, Will update.
>
>> new file mode 100644
>> index 000000000..1069f470d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/qcom,wsa885x-i2c.yaml
>> @@ -0,0 +1,89 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/qcom,wsa885x-i2c.yaml#
> Drop the -i2c suffix.
Ack, Will update.
>
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm WSA885x I2C smart speaker amplifier
> Drop I2C.
Ack, Will update.
>
>> +maintainers:
>> +  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> +  - Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>> +
>> +description: |
>> +  WSA885x is a Qualcomm Aqstic smart speaker amplifier with an I2C control
>> +  interface and a digital audio interface exposed through ASoC DAI callbacks.
>> +
>> +allOf:
>> +  - $ref: dai-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,wsa885x-i2c
> Drop -i2c
Ack, Will update.
>
>> +  reg:
>> +    maxItems: 1
>> +
>> +  '#sound-dai-cells':
>> +    const: 0
>> +
>> +  powerdown-gpios:
>> +    description: GPIO controlling the SD_N powerdown pin.
>> +    maxItems: 1
>> +
>> +  interrupt-gpios:
>> +    description: GPIO used for the codec interrupt output.
>> +    maxItems: 1
>> +
>> +  vdd-1p8-supply: true
>> +
>> +  vdd-io-supply: true
>> +
>> +  qcom,battery-config:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: Speaker battery configuration, 1 for 1S and 2 for 2S.
> What is a "1S" and a "2S"? Include description here.
Ack, Will Update more details for 1s and 2s in next version.
>
>> +    default: 1
>> +    enum: [1, 2]
>> +
>> +  qcom,wsa885x-init-table:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 2
>> +    maxItems: 256
>> +    description: |
>> +      Sequence of register/value pairs applied during codec hardware
>> +      initialization. Entries are encoded as alternating register address and
>> +      register value cells. The number of entries must be even (register/value
>> +      pairs); maxItems is 256 (128 pairs).
> Can this just be a table inside the driver, if it will be the same
> array for every user? If this is board-unique then it needs to describe
> what each value is actually doing well enough so engineers can use this
> documentation right here to configure their board without looking through
> register maps and what not.
>
> Something more abstract using SI units etc is probably needed here.

These values are part of a fixed hardware initialization sequence and 
are not board-specific.

I'll move them into the driver as a register table, making them easier 
to maintain and

avoiding opaque DT data.

Thanks,

Prasad

>
> Yours,
> Linus Walleij
