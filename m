Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64981A2545;
	Thu, 16 Jul 2026 06:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784182759; cv=none; b=iZNiXkSQZ/Q+kMPD1C9xP3dJFjAsZwlFlEHvGd+wG9PFP0R5W1K5IyXPzsqzgQSMffyXovpIzOJcicGBhcoaDbJPE52L/0w25n2dyKTzZLHIWuxNdBzEoU66vJXcRbKe9EmfMCd9r/Zybdx1qYrHeZ+/l1Z5SeV1p9L/IhWOfAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784182759; c=relaxed/simple;
	bh=GXtBcwvzCn23X9TMuSnPc89rSWYHyJAuEyL2UFcNYQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rTkRzkybgm5Kb2I+Z2dDqEv98Y9A7Zte+g+FlgptynBV3JP03zbrsfZSG3aVyTEIxPzEv9yvteVohn9YWN+TXm3vUOn3G1gyD/rOdwy3tFEucfp+9vgox5CNWyOKl0+I1cfyM+iAdm2Fmzl0flmMOtc0vFMzh+BOV25i0wm3P3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KoA7UNs2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KoA7UNs2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F01DD1F000E9;
	Thu, 16 Jul 2026 06:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784182758;
	bh=nNzTIlXXeV+QIzMVVpXCEP1ovlG1e3ky7RH3GgTN468=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=KoA7UNs2+WAqMBQ8/u7vivpptmEkyOUkSZVDVfKwEwhUM+GUw1iZcZCn6uhfjdZd5
	 66XTUyHh1ZTAfMr3MT6bYxws1zyrN8hHJUVJkbqcTuCsnfEkSA4xx4WOLAVhsL5xJI
	 AgMUqkhKXSb37bg3S3e6AiaZWCvxGfBflGztpWdly4HKYTTlIUT7aoXTIpAXQSg+qd
	 xj+WPjCxZFR7zBNyerPmHN2IJwpWWeWRhWUfBhO8O6Cad52aIpb6Pxdq9P/Eth75fT
	 gKsUlmoukbGmeKvkWGcMfGYdHI0MFyLH0BiFiVjTK+ySGnP8RS190UFS9kid+GM5wV
	 2GfYlYq3D6mqQ==
Message-ID: <e1c57781-846a-4d5a-95e1-90038f88afef@kernel.org>
Date: Thu, 16 Jul 2026 08:19:10 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document
 DAI subnode
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
References: <20260714145250.2473461-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260714145250.2473461-2-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260715-crafty-cheerful-goat-baba95@quoll>
 <5612a63b-4052-41af-8676-9d92811dee9d@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <5612a63b-4052-41af-8676-9d92811dee9d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/07/2026 08:58, Mohammad Rafi Shaik wrote:
> 
> 
> On 7/15/2026 11:35 AM, Krzysztof Kozlowski wrote:
>> On Tue, Jul 14, 2026 at 08:22:48PM +0530, Mohammad Rafi Shaik wrote:
>>> Extend the qcom,q6apm-lpass-dais device tree binding to explicitly
>>> describe Digital Audio Interface (DAI) child nodes.
>>>
>>> Add #address-cells and #size-cells to allow representation of multiple
>>> DAI instances as child nodes, and define a dai@<id> pattern to document
>>> per-DAI properties such as the interface ID and associated clocks.
>>>
>>> On platforms such as Monaco and Lemans, third-party codecs are hardware
>>> wired to the SoC and do not always have an in-tree codec driver to manage
>>> their clocks. For these designs, clock line enablement must be driven
>>> from the platform side, and this series provides the necessary support
>>> for that.
>>>
>>> On QAIF-based platforms such as Shikra and Hawi, responsibility for voting
>>> I2S MCLK and BCLK has moved from the DSP to the kernel. This series
>>> introduces the required device tree binding support to represent and
>>> vote for these clocks from the kernel.
>>>
>>> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>>> ---
>>>   .../bindings/sound/qcom,q6apm-lpass-dais.yaml | 89 +++++++++++++++++++
>>>   1 file changed, 89 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>>> index 2fb95544d..b37c62ccd 100644
>>> --- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>>> +++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>>> @@ -21,6 +21,82 @@ properties:
>>>     '#sound-dai-cells':
>>>       const: 1
>>>   
>>> +  '#address-cells':
>>> +    const: 1
>>> +
>>> +  '#size-cells':
>>> +    const: 0
>>> +
>>> +# Digital Audio Interfaces
>>> +patternProperties:
>>> +  '^dai@[0-9a-f]+$':
>>> +    type: object
>>> +    description:
>>> +      Q6DSP Digital Audio Interfaces.
>>> +
>>> +    properties:
>>> +      reg:
>>> +        maxItems: 1
>>> +        description:
>>> +          Digital Audio Interface ID
>>> +
>>> +      clocks:
>>> +        minItems: 1
>>> +        maxItems: 2
>>> +        description: MI2S clocks (mclk, bclk and/or eclk).
>>> +
>>> +      clock-names:
>>> +        minItems: 1
>>> +        maxItems: 2
>>> +
>>> +    allOf:
>>> +      - oneOf:
>>> +          - properties:
>>
>> Please don't do such stuff. Did you find it somewhere? If yes, then
>> where - so we can remove it?
>>
> 
> It was not copied from another binding.
> 
> It was my attempt to model the valid clock combinations.
> 
>> I gave you the close-to-exact syntax I expect. It was nothing like this.
> 
> clocks:
>    minItems: 1
>    maxItems: 3
> 
> 
> clock-names:
>    minItems: 1
>    maxItems: 3
>    items:
>      enum:
>        - mclk
>        - bclk
>        - eclk

But I did not wrote anything like that.

> 
> The enum version does not enforce the positional relationship between 
> clocks and clock-names,

So you do not use my code, but something completely different and does
not work, therefore you come up with another approach.

I don't know what to advise, but repeating myself seems pointless.

Previous review stays valid.



> 
> which is why I tried the oneOf approach.
> 
> My concern with the suggested syntax is that mclk is not mandatory for 
> all platforms.
> 
> For example, HAWI only requires bclk and does not use mclk, so requiring 
> mclk as the first clock-name would reject valid DTs.

Luckily I did not require mclk as first, so I do not understand why you
refer to something like that.


Best regards,
Krzysztof
