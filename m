Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031EA3054FE;
	Fri, 28 Nov 2025 10:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764325751; cv=none; b=nQCKLuF5E7QE4zaKBuwf0xf9qU/ufMyj+xmahEd278pawpeNNPFATGROJ0zilag37ZhezZYJZOaSz6ifnoYwB0WuwhLAWqVI1xpqKfD1xlZa3ePGxmK4b/1DeBBg79hccVC4BYukIOOKPEenq02NoWXgZa/+qjcgPCXJ8bav7yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764325751; c=relaxed/simple;
	bh=+4cZiJHjxPfc6J65GfEcXgkECtDCsaJQYV4W3cBQUGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gDpH77uzDCasUBRXiQpDZHQk7dEH8ao5/8wFUMTdR1Pc819MnOIyMmeCCs508i9S6k3a0hU29CyETefKVUssiFa0wk6U6QFlz15XJWS039Bd30M4JMFStnNi/l4Sp7jclEcL9OI7YEiW+Gii31k4b7joecnanVusdaKNlxDFGsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t6dXWyRi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t6dXWyRi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4883C113D0;
	Fri, 28 Nov 2025 10:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764325750;
	bh=+4cZiJHjxPfc6J65GfEcXgkECtDCsaJQYV4W3cBQUGE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=t6dXWyRiQeC8MwpSiRS7YJo3TF3gx4NmUpmZNzdjYgb7ce0Du+21H/XsOnnqVwYvu
	 b+zssIj9clG20vuZTr+Il75gLeBsUpORY4/T72FoDWh5xQDFMI2cMbaGaTIKyUadi/
	 FJiSK9uVOWtePbZhW0usPQmTAkm843umPcznfbnUY9VS6n4b8H1DSEHNLEzV6j8fLw
	 tz9E0kfttrZoD2Q6MasRRtkAntnexCBz4RSvx9VHDcF+PPLBl3HraabbJdIguzKum7
	 eJFUyUkqPnnRULLMe44gk9V7bu/HzpJhoSrgShSfu4Y3GnU2XwFJ6ybQg7Moq26Fyi
	 qea2d2xdbs+dg==
Message-ID: <f9ce51ce-6fe9-4612-9be3-552736ea19a7@kernel.org>
Date: Fri, 28 Nov 2025 11:29:05 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] ASoC: dt-bindings: add CIX IPBLOQ HDA controller
 support
To: Joakim Zhang <joakim.zhang@cixtech.com>
Cc: "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "robh@kernel.org"
 <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, "perex@perex.cz"
 <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 cix-kernel-upstream <cix-kernel-upstream@cixtech.com>
References: <20251127094301.4107982-1-joakim.zhang@cixtech.com>
 <20251127094301.4107982-2-joakim.zhang@cixtech.com>
 <20251128-fearless-kittiwake-from-arcadia-662dbc@kuoka>
 <SEYPR06MB6226157DB7A5D5486500063A82DCA@SEYPR06MB6226.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJoF1BKBQkWlnSaAAoJEBuTQ307
 QWKbHukP/3t4tRp/bvDnxJfmNdNVn0gv9ep3L39IntPalBFwRKytqeQkzAju0whYWg+R/rwp
 +r2I1Fzwt7+PTjsnMFlh1AZxGDmP5MFkzVsMnfX1lGiXhYSOMP97XL6R1QSXxaWOpGNCDaUl
 ajorB0lJDcC0q3xAdwzRConxYVhlgmTrRiD8oLlSCD5baEAt5Zw17UTNDnDGmZQKR0fqLpWy
 786Lm5OScb7DjEgcA2PRm17st4UQ1kF0rQHokVaotxRM74PPDB8bCsunlghJl1DRK9s1aSuN
 hL1Pv9VD8b4dFNvCo7b4hfAANPU67W40AaaGZ3UAfmw+1MYyo4QuAZGKzaP2ukbdCD/DYnqi
 tJy88XqWtyb4UQWKNoQqGKzlYXdKsldYqrLHGoMvj1UN9XcRtXHST/IaLn72o7j7/h/Ac5EL
 8lSUVIG4TYn59NyxxAXa07Wi6zjVL1U11fTnFmE29ALYQEXKBI3KUO1A3p4sQWzU7uRmbuxn
 naUmm8RbpMcOfa9JjlXCLmQ5IP7Rr5tYZUCkZz08LIfF8UMXwH7OOEX87Y++EkAB+pzKZNNd
 hwoXulTAgjSy+OiaLtuCys9VdXLZ3Zy314azaCU3BoWgaMV0eAW/+gprWMXQM1lrlzvwlD/k
 whyy9wGf0AEPpLssLVt9VVxNjo6BIkt6d1pMg6mHsUEVzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmgXUF8FCRaWWyoACgkQG5NDfTtBYptO0w//dlXJs5/42hAXKsk+PDg3wyEFb4NpyA1v
 qmx7SfAzk9Hf6lWwU1O6AbqNMbh6PjEwadKUk1m04S7EjdQLsj/MBSgoQtCT3MDmWUUtHZd5
 RYIPnPq3WVB47GtuO6/u375tsxhtf7vt95QSYJwCB+ZUgo4T+FV4hquZ4AsRkbgavtIzQisg
 Dgv76tnEv3YHV8Jn9mi/Bu0FURF+5kpdMfgo1sq6RXNQ//TVf8yFgRtTUdXxW/qHjlYURrm2
 H4kutobVEIxiyu6m05q3e9eZB/TaMMNVORx+1kM3j7f0rwtEYUFzY1ygQfpcMDPl7pRYoJjB
 dSsm0ZuzDaCwaxg2t8hqQJBzJCezTOIkjHUsWAK+tEbU4Z4SnNpCyM3fBqsgYdJxjyC/tWVT
 AQ18NRLtPw7tK1rdcwCl0GFQHwSwk5pDpz1NH40e6lU+NcXSeiqkDDRkHlftKPV/dV+lQXiu
 jWt87ecuHlpL3uuQ0ZZNWqHgZoQLXoqC2ZV5KrtKWb/jyiFX/sxSrodALf0zf+tfHv0FZWT2
 zHjUqd0t4njD/UOsuIMOQn4Ig0SdivYPfZukb5cdasKJukG1NOpbW7yRNivaCnfZz6dTawXw
 XRIV/KDsHQiyVxKvN73bThKhONkcX2LWuD928tAR6XMM2G5ovxLe09vuOzzfTWQDsm++9UKF a/A=
In-Reply-To: <SEYPR06MB6226157DB7A5D5486500063A82DCA@SEYPR06MB6226.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/11/2025 10:54, Joakim Zhang wrote:
> 
> Hello Krzysztof,
> 
> Thanks for your review.
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzk@kernel.org>
>> Sent: Friday, November 28, 2025 5:28 PM
>> To: Joakim Zhang <joakim.zhang@cixtech.com>
>> Cc: lgirdwood@gmail.com; broonie@kernel.org; robh@kernel.org;
>> krzk+dt@kernel.org; conor+dt@kernel.org; perex@perex.cz;
>> tiwai@suse.com; linux-sound@vger.kernel.org; devicetree@vger.kernel.org;
>> cix-kernel-upstream <cix-kernel-upstream@cixtech.com>
>> Subject: Re: [PATCH v2 1/4] ASoC: dt-bindings: add CIX IPBLOQ HDA controller
>> support
>>
>> EXTERNAL EMAIL
>>
>> On Thu, Nov 27, 2025 at 05:42:58PM +0800, joakim.zhang@cixtech.com
>> wrote:
>>> From: Joakim Zhang <joakim.zhang@cixtech.com>
>>>
>>>  - add CIX IPBLOQ HDA controller support
>>
>> Please write full sentences. Loook how other commits were created, it is not
>> the first cix commit, right?
> 
> Yes, not the first cix commit, I will have a look.
> 
>>
>>>
>>> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
>>> ---
>>>  .../bindings/sound/cix,ipbloq-hda.yaml        | 71 +++++++++++++++++++
>>>  1 file changed, 71 insertions(+)
>>>  create mode 100644
>>> Documentation/devicetree/bindings/sound/cix,ipbloq-hda.yaml
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/sound/cix,ipbloq-hda.yaml
>>> b/Documentation/devicetree/bindings/sound/cix,ipbloq-hda.yaml
>>> new file mode 100644
>>> index 000000000000..c9e4015a8174
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/sound/cix,ipbloq-hda.yaml
>>> @@ -0,0 +1,71 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/sound/cix,ipbloq-hda.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: CIX IPBLOQ HDA controller
>>> +
>>> +description:
>>> +  CIX IPBLOQ High Definition Audio (HDA) Controller
>>> +
>>> +maintainers:
>>> +  - Joakim Zhang <joakim.zhang@cixtech.com>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: cix,ipbloq-hda
>>
>> What happened here? You miss SoC compatible. I did not ask to change
>> compatible.
> 
> I used the cix,sky1-ipbloq-hda before, but you ask to use the compatible as the file name, I think it's may not quite suitable, since we may have sky1p, sky2... later, so I add a unified compatible here as a fallback.

"Filename must match the compatible.". Your explanation "use compatible
as the filename" is also correct - use what? the compatible? as what? as
the filename so in place of filename. So how could you make it reversed?
filename as the compatible?

Your changelog is very vague and does not describe here anything. It's
really not useful.

> 
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  interrupts:
>>> +    maxItems: 1
>>> +
>>> +  clocks:
>>> +    maxItems: 2
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: sysclk
>>> +      - const: clk48m
>>
>> clk48m is the name of the pin/signal?
> 
> Yes, this IP requests a 48M clock.
> 
>>
>>> +
>>> +  resets:
>>> +    maxItems: 1
>>> +
>>> +  reset-names:
>>> +    items:
>>> +      - const: hda
>>
>> Why this is here still?
> 
> I am not quite understood, don't need to list the name of the reset-names property?

My bad, I thought you received review to drop it completely.

> 
>>> +
>>> +  cix,model:
>>> +    $ref: /schemas/types.yaml#/definitions/string
>>> +    description:
>>> +      The user-visible name of this sound complex. If this property is
>>> +      not specified then boards can use default name provided in hda driver.
>>
>> You did not respond to several comments and did not implement them.
> 
> I investigate it seriously, I tried to use the sound-card-common.yaml but it should for ASoC, and this hda controller driver doesn't belong ASoC, so I just refer  to the hda driver as they done, such as nvidia,tegra30-hda.yaml.

You still should use a generic property common for everyone, not come
with own flavor of it.

> 
> And the " ASoC: dt-bindings: add CIX IPBLOQ HDA controller support " also not suitable, as mentioned it not the ASoC driver, Can I change to "ALSA: hda: add CIX IPBLOQ HDA controller support "?




Best regards,
Krzysztof
