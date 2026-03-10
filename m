Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3F443DA2B
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 09:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773135731; cv=none; b=mHEeEzuagZEQ+QU7HArmXO5yFSBjVz/IhIPW0jKDT71DvwFpg7759qMbEds0C0Kvz9nsttvs4+7qwCFteaUuH4UcUHv9jLGx/u6jKAJIvLtlgASO8dXxLihS4Pm922+jmtwRp1nXzvwNU3GtvCDu0ho72KoCE6tJP38g/k3jRj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773135731; c=relaxed/simple;
	bh=bD/4bnYSirndGUL0J1A1EmOJVqndfilXfQsnQcUiwa0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hG+E1HV7jafkhVoYVc516ZzUBGg/Ae0ar/h+RMmLrD+F6FGwYsAH1WYUCQQc8jagelci7b1osjC3z78rfv49dIb7AXZYdnw+rRmgKR9nzKR+WyQncLobOiHE2+MX26/Sl0XOfYyAnJ5ftUsAmpXSYszaesZza4KhjW2WnSTR7Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UVFbNN7w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GnN4E9KB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UVFbNN7w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GnN4E9KB"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A95IcC2020612
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 09:42:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+9PLSR3xKMehVF4KMjG/IYea2QIcahUxs3nwETs5z3c=; b=UVFbNN7wPg3pyZte
	EQjpXvYYFB0q3TsDCTwR3mYOrxaGjAUdRQynx4VuHADmAKeIuJvvwoOE4DrYPf6J
	rj8pV87504HA/VPB8jhnJeYzbEB62vf8WEuX392hdY57cLAlS7Qyz6Jp/9tqzDuA
	InTT94tL8H8x1oZdHKAKpLDOKtkb5TchvmzcBJ8SfXcdO4IP//8Qd/ZUfQ6exrb8
	aTAPbUtIwPJ1l5oJJM613Fklrs2C0aKIDs/f2JQVMA7bmdjBClnBcJUo83DlhuMB
	ZJQbr4RZb2eqs7v+XBb/ps9oXhTmbUhy8HsGRMTirU7cN7mQAkuq1LkVyPOLR3pY
	RjTlVw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyhbukq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 09:42:07 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3598ab49242so6422223a91.3
        for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 02:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773135727; x=1773740527; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+9PLSR3xKMehVF4KMjG/IYea2QIcahUxs3nwETs5z3c=;
        b=GnN4E9KBUFxHq79OvUn8eu+X6wq6qtFYZLVpfDzFTuudiR4F5QDsQR5QsgSXciIUr4
         GngJV8FZR6aA48YQ09HsOublpIKi1VCp9m40w6Xy7HHyG45+SYR7Y0xi8YKXvLe+1CwN
         Y832HRn/6U1AAe7Uj+S48shVEaDTGExu3DPUA1PkardmYZGULIaMPkIW0M1x4hslgiOw
         ZR9Pdudu/WPPa/Q0aZK6m7+tUGyO0EEQFu0G2O+MyUjY6J0DMEltayz1GtwQO1BvccDp
         n344HJEVdQ+b75S2u0A6O9skrWYP9ZGAyTzNaNnEE5ewmlF+zmKqxNx0Bm7zAEv2csrg
         oUoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773135727; x=1773740527;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+9PLSR3xKMehVF4KMjG/IYea2QIcahUxs3nwETs5z3c=;
        b=cEGeT+dVjlc0uPWu/NvWEwSyT6AfIJoez1YaMz1OK907BBAs9lp4b+GGFuQ0nZvUb0
         kMZMjIL4W2z3ESU5bw6K91uWzCZaRPYYrUUMHRgpizmJ1EQW92vGqpwsLPy0SXFn/Tog
         vDAfdqYu2OONcymS528PF79JhAYkdi+q6+Zvprhk/u4ktGCWRNcopKOJjo8PmtCSjHg1
         JI6i1WcWVq8cVq0BCi8Fc47Pzx3JpTtQGw437OYuiZIU9gYTQHydMtsPzaBAW9qGydT9
         DbqgEUbygdOzidnGiBi6/26PrEgGW3vgaYsl3vngr3Ni3ZHBDOcH4W8Rfmia/RxkfSHX
         2hMA==
X-Forwarded-Encrypted: i=1; AJvYcCUwnpnt3zt0IaHjA+s2yA6RNQqRSmK3S/tmwgypsyzu9zS9e9p/km0cGlNFDdqlyHlxkHAlsTFhE7p0wA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjOCTPFbUmCh5QxsNQRiHbc6JSQpHAWwHpTUnYYkGQgW9Maj0d
	iK4u50igBYxKJbziUYQOxWKuOEucBxm7EH+7qzrhvutjeQ3OUg+hyF7lue+PaNSbjsjM2JS3Mki
	gtJLX9rf5DOOosw5zX8ZCP6V1I4LN8K41lrs7qKoOtxBnvEpJp2Yps3rEz7B5hCSPiw==
X-Gm-Gg: ATEYQzySy4QHCBVbBNjLA0JKOOp+VrvCd8LVsiWd9FZSJHoQJVISc1L28ZGcA5aEkze
	ULoi1CSVqdKhtluExzqIKrQM/08rn2V+UY/0DOge7k8igNKUZRTw+OqKU/H8pWWlRlAoT6Lorw9
	KAdFdRjW7zClLgQtWDn7MAg/QISWoLa7ajw8LxbzSSPczufdQz+lG9tfxl1GJU+GmURozCl6Qev
	td3JCg20O4bz8doaPVL4w2DBJbb/1VA/GjO0q8VbcBGRrzKOeaRxdexraxQeII1tJZzyCp+KhJr
	QwWYlrrGSzVvr3MZYOVxgP+7m/Lf6xun6TSuhmYzQqcfgYBAky2YD5sEt23YIg4TUihehfhYg1i
	w1mmbx/L7XNfpmGntwLC11AZ6uWvi7TB/4fZsArPePEgJjOSKu6foZhC08HJ4
X-Received: by 2002:a17:90b:2516:b0:359:f0e1:f8c9 with SMTP id 98e67ed59e1d1-359f0e21780mr1393375a91.6.1773135726732;
        Tue, 10 Mar 2026 02:42:06 -0700 (PDT)
X-Received: by 2002:a17:90b:2516:b0:359:f0e1:f8c9 with SMTP id 98e67ed59e1d1-359f0e21780mr1393351a91.6.1773135726124;
        Tue, 10 Mar 2026 02:42:06 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359f080db95sm3471489a91.9.2026.03.10.02.42.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 02:42:05 -0700 (PDT)
Message-ID: <a6f67655-e84b-4385-a5e8-62435f38323b@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 15:11:59 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document
 DAI subnode
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
References: <20260309111300.2484262-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260309111300.2484262-2-mohammad.rafi.shaik@oss.qualcomm.com>
 <3ml7bphfd7abn6mat47yagw7l7whv5hia7ifkbh6yi7gdg24j7@2p4sihkcowjd>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <3ml7bphfd7abn6mat47yagw7l7whv5hia7ifkbh6yi7gdg24j7@2p4sihkcowjd>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Rcmdyltv c=1 sm=1 tr=0 ts=69afe770 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SoZZosWxfwo0RYgDzZ0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA4MSBTYWx0ZWRfX3WXxr9uwogh2
 UCTkgyPuwqnJNlbie99ETOwiSM+JKK2/6ilwTC02D2fdupDaY1Aflv78quw254hPiWUWrBYtSc+
 O/4joVfzlGr9XZFQ3s4WsLkndAaz3Qj8G12rx4Unmt6sw8T+O5BUyOCD7EiXHfAnBwmLnzON5fS
 husIdj0C5il/xftO4EShAdKkeghfNJj6W4ugG3BlGJeRFpa56YO3ZfVUzl4qe5rue4JJAVPZTcl
 8Gm4kCumjJ22HX583iPxKesgsDOf8TrEYIyE3lBVPwilGh43W+bQ3yB7i0wos769Im5MmPYQmeh
 ijKLuIofQJ7TaHtYul03DmzkI9w32vIi6fUn8nXY7/jCUynrzu+Rlz3pLDVmmErYkBPW5DgmL36
 Zt1/As4GFgclWeFZ0SX65oyDRPi95jzof38vFJ0SnS0QJUxoPXCYmc2m/YhZ74f/x6HXIMUfny4
 8wlmZeAmp4sDb2lxkrA==
X-Proofpoint-GUID: GUx8u5RZuIGjqyaNB5srcoTr_oZfmwid
X-Proofpoint-ORIG-GUID: GUx8u5RZuIGjqyaNB5srcoTr_oZfmwid
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100081



On 3/10/2026 1:25 AM, Dmitry Baryshkov wrote:
> On Mon, Mar 09, 2026 at 04:42:57PM +0530, Mohammad Rafi Shaik wrote:
>> Extend the qcom,q6apm-lpass-dais device tree binding to explicitly
>> describe Digital Audio Interface (DAI) child nodes.
>>
>> Add #address-cells and #size-cells to allow representation of multiple
>> DAI instances as child nodes, and define a dai@<id> pattern to document
>> per-DAI properties such as the interface ID and associated clocks.
> 
> Is there a physical device being represented by this DAI subnode?
> 

No, the dai@<id> subnode does not represent a separate physical device.
It models an individual LPASS/Q6DSP DAI hw interface instance (for 
example, primary mi2s, secondary mi2s, etc.), so that per‑DAI resources 
and configuration can be described.

Per‑port description is required because different DAIs may need 
different clock inputs (MCLK, BCLK, ECLK) and can be wired differently 
depending on the board design. By representing each DAI instance as a 
child node, the relevant clocks can be bound to the specific DAI port 
that uses them.

Thus, the subnode is used to describe the resources and configuration of 
a DAI hw instance, not a standalone physical device.

>>
>> Qualcomm platforms like talos integrate third-party audio codecs or use
>> different external audio paths. These designs often require additional
>> configuration such as explicit MI2S MCLK settings for audio to work.
>>
>> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   .../bindings/sound/qcom,q6apm-lpass-dais.yaml | 41 ++++++++++++++++++-
>>   1 file changed, 40 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>> index 2fb95544d..1d770cbcb 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>> @@ -21,6 +21,34 @@ properties:
>>     '#sound-dai-cells':
>>       const: 1
>>   
>> +  '#address-cells':
>> +    const: 1
>> +
>> +  '#size-cells':
>> +    const: 0
>> +
>> +# Digital Audio Interfaces
>> +patternProperties:
>> +  '^dai@[0-9]+$':
>> +    type: object
>> +    description:
>> +      Q6DSP Digital Audio Interfaces.
>> +
>> +    properties:
>> +      reg:
>> +        description:
>> +          Digital Audio Interface ID
>> +
>> +      clocks:
>> +        minItems: 1
>> +        maxItems: 3
>> +
>> +      clock-names:
>> +        minItems: 1
>> +        maxItems: 3
>> +
>> +    additionalProperties: false
>> +
>>   required:
>>     - compatible
>>     - '#sound-dai-cells'
>> @@ -29,7 +57,18 @@ unevaluatedProperties: false
>>   
>>   examples:
>>     - |
>> -    dais {
>> +    #include <dt-bindings/sound/qcom,q6afe.h>
>> +
>> +    bedais {
>>           compatible = "qcom,q6apm-lpass-dais";
>>           #sound-dai-cells = <1>;
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        dai@16 {
> 
> What is @16 in this case? What kind of address or ID correspondings to
> the PRIMARY_MI2S_RX?
> 

yes, The @16 value corresponds to the LPASS/Q6DSP DAI ID for 
PRIMARY_MI2S_RX.

(defined in : 
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/tree/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h)

Best Regards,
Rafi.

>> +           reg = <PRIMARY_MI2S_RX>;
>> +           clocks = <&q6prmcc LPASS_CLK_ID_MCLK_1
>> +                              LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
>> +           clock-names = "mclk";
>> +        };
>>       };
>> -- 
>> 2.34.1
>>
> 

