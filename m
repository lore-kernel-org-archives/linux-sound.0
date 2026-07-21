Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605D13BD63A;
	Tue, 21 Jul 2026 08:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784623574; cv=none; b=n0yrDt0r3vLQc7hEJG8bRDlyJCB4SSwIs6VftW1TLtNMmShLDZ4ZkVkohf9pKPuDE9nUY6g56lcFp8HC5RfvFoW4b++r58KqZYryMYPLqgxt62MeHHxfPskKZ1Zy1oDg04yYGj7SCLW7zsR0Fg7q+4ZbPpJDqOXkZvu3TZWaYmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784623574; c=relaxed/simple;
	bh=tf852/V/BMkWrWMTOP9oX//lsDR+oEtvAyhnpQy8kTo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rb/v+YYkT2eowbDzHewQflidHplNhf+D5MIiRSHF24iTpUSUtg9YRaAClEqUybqygXc2TFXF9kFoXI0t/G6nnzR/3+rBYmW09q6JvDHbfhpepTdPAyHyfUdCkQvV5pRzM6FU9MgRGwIWXlLEhOW3D10XuGOXPBwdCfPw4LfWoeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FWlvEVFh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FWlvEVFh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13FFC1F000E9;
	Tue, 21 Jul 2026 08:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784623569;
	bh=nQEJMFqzlR0GpDMNNEZa/+TAJKHJC1J+7R2exazfiz0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=FWlvEVFhvtVP5QOxY8D9hMrBnxhs79pHRfBszXuR8AhMRaKzPptNNlQ3mjdhsG8md
	 4+vMi1U5f/FTD52QnoOYThxDSzuY08BHp6QPzxambYoJUrMYRSiKBVwWs3KvwfIX7P
	 0Oi3w0ZE6iEub1FtKHPvnoY0lrrlSWPqGYd+Yj9B/+c7Oa8p+UO1K8Z9kSU8BlSGAm
	 GlyBZjJjtfGPdb5een+YpDHIO/9Ot67T95hkVPdIPrZVENMXo0Ki1p6xnG/moktVN0
	 tKrcqExionVgH5UFqJSghnmntNOndJcJgJU0hPYwSOBFMr/ORjS54Cae6aGGxCLwv5
	 Kdj7co1MVu4fg==
Message-ID: <571d0b42-c566-4426-ad55-514c280b9b1b@kernel.org>
Date: Tue, 21 Jul 2026 10:46:01 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document
 DAI subnode
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
References: <20260720160226.1026440-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260720160226.1026440-2-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260721-fiery-sheep-of-piety-4fd04b@quoll>
 <67179d90-6201-462c-9004-9b4cfd114250@oss.qualcomm.com>
 <2d4513e2-7e14-49bc-8b70-6c07c9f99d6b@kernel.org>
 <e2e50e30-6da2-45d9-b472-dae7d41d100d@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <e2e50e30-6da2-45d9-b472-dae7d41d100d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/07/2026 10:42, Mohammad Rafi Shaik wrote:
> 
> 
> On 7/21/2026 1:50 PM, Krzysztof Kozlowski wrote:
>> On 21/07/2026 10:14, Mohammad Rafi Shaik wrote:
>>>
>>>
>>> On 7/21/2026 12:18 PM, Krzysztof Kozlowski wrote:
>>>> On Mon, Jul 20, 2026 at 09:32:24PM +0530, Mohammad Rafi Shaik wrote:
>>>>> +# Digital Audio Interfaces
>>>>> +patternProperties:
>>>>> +  '^dai@[0-9a-f]+$':
>>>>> +    type: object
>>>>> +    description:
>>>>> +      Q6DSP Digital Audio Interfaces.
>>>>> +
>>>>> +    properties:
>>>>> +      reg:
>>>>> +        maxItems: 1
>>>>> +        description:
>>>>> +          Digital Audio Interface ID
>>>>> +
>>>>> +      clocks:
>>>>> +        minItems: 1
>>>>> +        items:
>>>>> +          - description: MI2S bit clock
>>>>> +          - description: MI2S external bit clock
>>>>> +          - description: MI2S master clock
>>>>> +
>>>>> +      clock-names:
>>>>> +        minItems: 1
>>>>> +        items:
>>>>> +          - enum: [bclk, eclk, mclk]
>>>>> +          - const: mclk
>>>>
>>>> This does not match your clocks.
>>>>
>>>
>>> will fix this.
>>>
>>> clocks descriptions are misleading because they imply an
>>> ordered bclk + eclk configuration. I'll drop those descriptions.
>>>
>>> will keep only
>>>
>>> clocks:
>>>      minItems: 1
>>>      maxItems: 2
>>>
>>>> I gave you exact syntax to use, then in previous version you used
>>>> something else. So I reminded. Again you used something else.
>>>>
>>>> If you decide not to use it, sure, your right but YOU CANNOT come with
>>>> clearly invalid code as a substitute.
>>>>
>>>> NAK
>>>
>>> Suggested change:
>>> https://lore.kernel.org/all/2b4448d0-81f8-410f-b849-0d957a2d2a17@kernel.org/#t
>>> minItems: 1
>>> items:
>>>    - enum: [ bclk, eclk ]
>>>    - const: eclk
>>>    - const: mclk
>>>
>>> I tested the suggested schema, but it results in DT binding check failures.
>>>
>>> DT binding check errors with the suggested change
>>> 1. Only mclk enabled
>>> bedais: dai@10:clock-names:0: 'mclk' is not one of ['bclk', 'eclk']
>>>
>>> 2. bclk and mclk enabled
>>> bedais:dai@10:clock-names:1: 'eclk' was expected
>>>
>>>
>>> With the current version of this patch, I do not see any DT binding
>>> check issues. I tested all supported clock combinations, and
>>> dt_binding_check passes successfully in each case.
>>
>> Your clocks told story that you have up to three clocks, so indeed if
>> you do not have three clocks then my syntax is not accurate.
>>
>> Before we go further, where is upstream DTS using this?
> 
> Currently, the Shikra DTS changes already present on the mailing list 
> include this patch as a dependency:
> https://lore.kernel.org/all/20260616201315.2565115-7-mohammad.rafi.shaik@oss.qualcomm.com/
> 
> +&q6apmbedai {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	dai@40 {
> +		reg = <SECONDARY_TDM_RX_0>;
> +		clocks = <&q6prmcc LPASS_CLK_ID_AUD_INTF2_IBIT
> +				 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +		clock-names = "bclk";
> +	};
> +};
> 
> 
> RubikPi3 DTS patch series uses both mclk and bclk:
> https://lore.kernel.org/all/20260715-rubikpi-next-20260605-v2-6-67601d7a8581@thundersoft.com/
> 

Thanks, I did not see "eclk" used.

Best regards,
Krzysztof
