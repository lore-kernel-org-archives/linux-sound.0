Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BC6391842
	for <linux-sound@vger.kernel.org>; Sun, 12 Jul 2026 08:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783845955; cv=none; b=E2RERgBCeD0Ugi+KFxnf7FPr9HOPzP3NrFQ83GrlvTegIixZNPqvvs5dQSbdLhxFh/bOjQub0BF+zr6SUlGJsVcZw/S0k5OH/5+Ae3fXyjUy0f8m0F2sRYM0CD+W/7fsx4OzkHPRgr4okUkCdd1czcm9/+E1Ax6k28m9OLn0i7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783845955; c=relaxed/simple;
	bh=zWHY5hZ/8Ox8s31q8zApgayyvinHfRJ82OuShKdkkZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MTF88piycW6aUA0R0TxszoZpCGr+xRKnvkguDlBZN4PtwAc1TYgh0hbEouzGXYXVEFj8Fl6+UqTmS12klYjYhXmnHjRezgPSuEI6Kd+lTZq3t+qPmESVK7RLxB/qu1lgkdKZz+IdtAit092FYr4QG3brK/3NIJKa3g8Aflt3Gzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZJWBwY/2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uww/Zk8T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZJWBwY/2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uww/Zk8T"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66C7Sc2P1822114
	for <linux-sound@vger.kernel.org>; Sun, 12 Jul 2026 08:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xf+qvVGz/Rsik4m6OuGXL2+Wevl0zm2bIBnoam/yT74=; b=ZJWBwY/2zF1me725
	90VJ/QBNnyioXyxDHWnp7KXHE8WW2sN1f62N6wjE+8iPYpJi4NO+L28xvXpJ3IkD
	fYeds8VnVfdRTrVpSCVONzu0tNLvCYajb/+Me6YLuZzicbZWIujftU7ik+iwHg2U
	/AOJl/tge6f8XQOdpVv+4AYQ4ziVgyScAWfgww6anajW0gl4D4F9kw42QfsFWCd9
	+h+xdO747XHVL7jnvtCxdciMKGSn9kd9f4j27SHtjRoM35E9+Yb//rpph7dRV4GD
	2x6aQK30vBaTegOiSp24/PWHTRQDbLypejsefj5XywdOmaB0rNf++rZUIPcJ9O6j
	DshVsA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf482bq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 12 Jul 2026 08:45:53 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88fc985a65so940538a12.2
        for <linux-sound@vger.kernel.org>; Sun, 12 Jul 2026 01:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783845950; x=1784450750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xf+qvVGz/Rsik4m6OuGXL2+Wevl0zm2bIBnoam/yT74=;
        b=Uww/Zk8TwLuNsUXVN8zW2gX7XxAiKH9aLyTJgVQ2tLRYfMp5XOUYWJyWltrGnvAFi+
         ey9cyHJ/kHoLXKW/diWNqHewoTVXmsMsuAQY6o+neQgG7MMN1VA31IJsfSgBzs/JmfKF
         Zi9STE/kxcOQJ/IdrqYBAsz4gh9+MlU6I32bj5Yl59uugMAlSRgkOHHn8MO6msDMOj39
         fjHJj+KXc+mJv8tj7rHVcqKg8M/VWkc6GcOLBkXSfre1Az/myXY6LFcdqiRPLxNF+7Uk
         BfB8ogstne5WqKCSmXkxRpiKU8rkh9JVKu+E2BQxFlLWuUuuAGJ5MCtLqcSZXT8nQn3A
         lz3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783845950; x=1784450750;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xf+qvVGz/Rsik4m6OuGXL2+Wevl0zm2bIBnoam/yT74=;
        b=KheF0PqHLDVvuJkUicP579j7uqTSuglW66xUP+PWFKYzklSfhNl+tnURhP8UFWd+eN
         N+cKqOzhyR72xwIojgvmzPHtLup73JXH1Rv7wPgolBYhfK3sVU07lWZK7gEaVzNzKQVA
         HmRcy8CulkPLNuFFAhsgl1DonWn5F7bbUzm4HDgxRilX6yTCR7siEMm4i0zlM1POCpae
         411XlQq4BUzmOJnfd3R/OtmYqf6/eBT1WariU7HitWLn+IJvm1rg0KqmFtUwl9P20Yot
         mBrc8kpzOaMLfpw5CAlL5oL5B7vSbLnalGDmpcqL5SQQlUWvB1LXkoJtW2Xmjr/GaIC3
         NGMA==
X-Forwarded-Encrypted: i=1; AHgh+Rqe8FWNO3rgZbkTdVGV8hD6lQ/z2DuhAr47vp3soQocLHtqrhLIX2f4LsWCfPmT9Wh0uTkkLGZNQ33XmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrKGx/oE3DayS2HqPERbps4xTVEOORFwBwYXA/soWJvQZIq7YG
	I5elXIDidGM+YdGpyp+HdSa16AiqbdqBYZwTJ0cn5eqIPIxamdDLvfleEwsDl7xv5UWsD2LHQfa
	QEE5dhw6oxUKCca/jN9odtxM6QEgeEkFtjtGNnNmiKDP7Vdpq7z9zD6DAS8zPG0LfFQ==
X-Gm-Gg: AfdE7cknAPJgNLFt9UW90XhJmX9b8m43CQL9Rr5GIvN4Gw16jzKQdBRA83xtVj+JKDE
	KyzzXpSwrUH0ECRGuL4+xWfhLO16gzhLIQk7wBIGgBQUZy9hDZjDCxLy1Jwr1U6AJB08BJVEQ2M
	FtzKGkIkHoruii60GGXppSOXPS/jQu89XnsyOCTS6pdEfoXDV5xtoZOkNKo+gwAW5DECb0bI/pN
	KKg5v9fn8s7NvisNIh2W91KQvSuwGNDaOMnoVhwoglY4ChTSpBae+vUFF0BASgpvxEnSfQlhTKJ
	pGHdRf32lV8VzLQM+I+LQI23dz9SIcv742HDRpSJjZBrsAbRpVLZtOF2PpyujHuW/aJ4eMIoayA
	IOecwr/mllkpnHGW00U1yrw0g6OsyViPrVRamYRsmWRoRdsev8w==
X-Received: by 2002:a05:6a21:e083:b0:3bf:7fa5:8922 with SMTP id adf61e73a8af0-3c1100092dfmr5538564637.2.1783845950579;
        Sun, 12 Jul 2026 01:45:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:e083:b0:3bf:7fa5:8922 with SMTP id adf61e73a8af0-3c1100092dfmr5538544637.2.1783845950089;
        Sun, 12 Jul 2026 01:45:50 -0700 (PDT)
Received: from [192.168.1.5] ([122.164.92.133])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d7c8bsm62094370c88.12.2026.07.12.01.45.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2026 01:45:49 -0700 (PDT)
Message-ID: <b1b896a6-aae1-484b-ae1a-5a08efb82c4d@oss.qualcomm.com>
Date: Sun, 12 Jul 2026 14:15:43 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document
 DAI subnode
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20260711125740.3083236-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260711125740.3083236-2-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260711-mauve-skunk-of-contentment-f51be0@quoll>
 <6438237f-ccb4-4143-9ac7-43f5dcca955b@oss.qualcomm.com>
 <2b4448d0-81f8-410f-b849-0d957a2d2a17@kernel.org>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <2b4448d0-81f8-410f-b849-0d957a2d2a17@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDA4OSBTYWx0ZWRfX+Br2SZsqJQdt
 Adt2jsHvJrYdQYrJUSLdHv3VejXYI0V1QCRZSqnhmI2A4DniRZiLG2veoqlXxjSYaz6TIdZnV2f
 3KVLQjXyFtbqnVpCUidW1/Mr6JT0agI=
X-Authority-Analysis: v=2.4 cv=OsJ/DS/t c=1 sm=1 tr=0 ts=6a535441 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=tlK9sNgGSfv7srgBb5RqhA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=XwPME6NCRsOL8v_XlRkA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDA4OSBTYWx0ZWRfX6u0Vd6xzsapv
 MZdDGD/jvTKzPzYCHlRT9fqLCKVIfe4j39lCyTbJvsnrK0EhWtQXwjaY5brrHqcb124S08Y1cT6
 hAWCsJKfuDl6vqPIJe72X3pLUFSvkbLZ98Qtva7l2RXb0G5VN/xM5EriqGcdCcFu4M4mCPddpEY
 QXESTCTQkxZYTopTrtPzZvuR+YzLrQWKystcpviwcpOQButGfPxj1LNiY08Aj9+cgaLkAmYrRop
 Ab1+Uc0RQqdvanjkMuQplt9Mj99ESkjG0WBjqZoLo1rpQ4tDtpyUY9PJeV6lsCL1RfPdSLLl8OL
 NHVrMo2tXafxh+6KYVue+QmF/Qo7bMrKoakI3R0WWNsWIxBGyn9jn1cHAFERuAGUjOhv5bzCbp2
 WIS/dGihArpen2u6n+Ud1LEhzOBwkQWocfHxK2PXqHSa3eA9FeYLja6sFsyUHSJz+lCdn0jF/hs
 DPUKQxqU3Ms9ld3uYXg==
X-Proofpoint-GUID: 9MXjRo_sbvBgrlQmwxcEzxIeU6F0Kvho
X-Proofpoint-ORIG-GUID: 9MXjRo_sbvBgrlQmwxcEzxIeU6F0Kvho
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120089



On 7/12/2026 1:41 PM, Krzysztof Kozlowski wrote:
> On 12/07/2026 08:44, Mohammad Rafi Shaik wrote:
>>
>>
>> On 7/11/2026 8:41 PM, Krzysztof Kozlowski wrote:
>>> On Sat, Jul 11, 2026 at 06:27:38PM +0530, Mohammad Rafi Shaik wrote:
>>>> Extend the qcom,q6apm-lpass-dais device tree binding to explicitly
>>>> describe Digital Audio Interface (DAI) child nodes.
>>>>
>>>> Add #address-cells and #size-cells to allow representation of multiple
>>>> DAI instances as child nodes, and define a dai@<id> pattern to document
>>>> per-DAI properties such as the interface ID and associated clocks.
>>>>
>>>> On platforms such as Monaco and Lemans, third-party codecs are hardware
>>>> wired to the SoC and do not always have an in-tree codec driver to manage
>>>> their clocks. For these designs, clock line enablement must be driven
>>>> from the platform side, and this series provides the necessary support
>>>> for that.
>>>>
>>>> On QAIF-based platforms such as Shikra and Hawi, responsibility for voting
>>>> I2S MCLK and BCLK has moved from the DSP to the kernel. This series
>>>> introduces the required device tree binding support to represent and
>>>> vote for these clocks from the kernel.
>>>>
>>>> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>
>>> Drop my tag, you made a important change to ABI.
>>>
>>
>> Ack
>>
>>>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>
>>> Drop, you cannot test a binding (in the meaning of Tested-by tag).
>>
>> Ack, will drop Tested-by tag.
>>
>>>
>>>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>>>> ---
>>>>    .../bindings/sound/qcom,q6apm-lpass-dais.yaml | 58 +++++++++++++++++++
>>>>    1 file changed, 58 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>>>> index 2fb95544db8b..f3a8b12d7fc8 100644
>>>> --- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>>>> +++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>>>> @@ -21,6 +21,49 @@ properties:
>>>>      '#sound-dai-cells':
>>>>        const: 1
>>>>    
>>>> +  '#address-cells':
>>>> +    const: 1
>>>> +
>>>> +  '#size-cells':
>>>> +    const: 0
>>>> +
>>>> +# Digital Audio Interfaces
>>>> +patternProperties:
>>>> +  '^dai@[0-9a-f]+$':
>>>> +    type: object
>>>> +    description:
>>>> +      Q6DSP Digital Audio Interfaces.
>>>> +
>>>> +    properties:
>>>> +      reg:
>>>> +        maxItems: 1
>>>> +        description:
>>>> +          Digital Audio Interface ID
>>>> +
>>>> +      clocks:
>>>> +        minItems: 1
>>>> +        items:
>>>> +          - description: MI2S master clock
>>>> +          - description: MI2S bit clock
>>>> +          - description: MI2S external bit clock
>>>> +
>>>> +      clock-names:
>>>> +        minItems: 1
>>>> +        maxItems: 3
>>>> +        items:
>>>> +          enum:
>>>
>>> That wasn't here and that's also not correct, usually. Especially that
>>> it does not fit your clocks property.
>>>
>>
>> The reason for changing this to enum was that some hardware may expose
>> only a single clock, which can be bclk or eclk instead of mclk. With the
>> previous positional const definition, such configurations fail schema
>> validation because the first entry is always expected to be mclk.
>>
> 
> master clock feels like something should be present there always, but if
> that is the case, then you need:
> minItems: 1
> items:
>   - enum: [ bclk, eclk ]
>   - const: eclk
>   - const: mclk
> 

Thanks for the example.

I will follow the same approach and update the binding accordingly.

Thanks & Regards,
Rafi

> Best regards,
> Krzysztof

