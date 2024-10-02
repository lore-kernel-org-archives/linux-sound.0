Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E261754B;
	Wed,  2 Oct 2024 07:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727853800; cv=none; b=n9N3JTG8GgiT9YQM+9PoNREJiyfL28B3s8SGggu9BMGzhszx0XchvQGXrYz+bB/JYDvqEFMr+qMUzE0Um/e3qm18s6CSQhLsDofv+cWsRg3UgMbpdg1UUKIanQKIIuPCZ/7cSaOv3FAasXI7CCt4ZfZhq4HSWOHz9RADmAIpcaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727853800; c=relaxed/simple;
	bh=3a08W0TgqggciiLJe1T08f0RQidcojzfZg/MmmmqjaM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YUu2UO/s7xCxKZWB2m5bpYFfg6T1w2AKBIWrmzsrWYssCAwQWuW7kKjkgXwsxaHncs7GW1ITJJsONT60DJnEBxUhPYgv8ib6eBBEIkvAdTrTcA4UNbwmbhfhrOjkUWyYJTSN5uhhS+gutsq34qoL9Riics+kZOxR4AcZ3JO0Z+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pSGZ6YdY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pSGZ6YdY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 220FEC4CEC5;
	Wed,  2 Oct 2024 07:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727853799;
	bh=3a08W0TgqggciiLJe1T08f0RQidcojzfZg/MmmmqjaM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pSGZ6YdYE5P55NWbMhYARSWfcw2Nu82AULaqMmzLyT06EZE0wghSS7zgc/hIE4dkL
	 DabSR1vBe+UxePCW8HruPB/X6G7TqNtfTAqDtRLYcsXWr7VNjcGTqc2KdOQik4aRuI
	 E2eZj2BLxLGQQWxYvyoKtD65hXR70AQJQW3xLahAHckyIooZiP3zrI0eMBjy0OAmqp
	 Wubbzv91IRyWzTZHpCRZBNoILbMeDoNQAsJ7wYfLEBK3DIJPb6QSrQpIPci2JqDu9N
	 ErFbV6kmG2f35M5iL5XXAeZ4OB7AFHVj81sIlFnjwUJdMINmCagpyx/A++IInHUAd/
	 tMiHtSsp0/dhw==
Message-ID: <2f59b15f-06a6-40de-bd94-ef7c8cfa6396@kernel.org>
Date: Wed, 2 Oct 2024 09:23:12 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: dt-bindings: davinci-mcasp: Fix interrupts property
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jayesh Choudhary <j-choudhary@ti.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241001204749.390054-1-miquel.raynal@bootlin.com>
 <7f5wtbnn32l6l76z2yjjfponrysr55yi7hgfmtdegilg7dcc4h@pkupvwap4up4>
 <20241002085604.277d5006@xps-13>
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
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJgPO8PBQkUX63hAAoJEBuTQ307
 QWKbBn8P+QFxwl7pDsAKR1InemMAmuykCHl+XgC0LDqrsWhAH5TYeTVXGSyDsuZjHvj+FRP+
 gZaEIYSw2Yf0e91U9HXo3RYhEwSmxUQ4Fjhc9qAwGKVPQf6YuQ5yy6pzI8brcKmHHOGrB3tP
 /MODPt81M1zpograAC2WTDzkICfHKj8LpXp45PylD99J9q0Y+gb04CG5/wXs+1hJy/dz0tYy
 iua4nCuSRbxnSHKBS5vvjosWWjWQXsRKd+zzXp6kfRHHpzJkhRwF6ArXi4XnQ+REnoTfM5Fk
 VmVmSQ3yFKKePEzoIriT1b2sXO0g5QXOAvFqB65LZjXG9jGJoVG6ZJrUV1MVK8vamKoVbUEe
 0NlLl/tX96HLowHHoKhxEsbFzGzKiFLh7hyboTpy2whdonkDxpnv/H8wE9M3VW/fPgnL2nPe
 xaBLqyHxy9hA9JrZvxg3IQ61x7rtBWBUQPmEaK0azW+l3ysiNpBhISkZrsW3ZUdknWu87nh6
 eTB7mR7xBcVxnomxWwJI4B0wuMwCPdgbV6YDUKCuSgRMUEiVry10xd9KLypR9Vfyn1AhROrq
 AubRPVeJBf9zR5UW1trJNfwVt3XmbHX50HCcHdEdCKiT9O+FiEcahIaWh9lihvO0ci0TtVGZ
 MCEtaCE80Q3Ma9RdHYB3uVF930jwquplFLNF+IBCn5JRzsFNBFVDXDQBEADNkrQYSREUL4D3
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
 YpsFAmA872oFCRRflLYACgkQG5NDfTtBYpvScw/9GrqBrVLuJoJ52qBBKUBDo4E+5fU1bjt0
 Gv0nh/hNJuecuRY6aemU6HOPNc2t8QHMSvwbSF+Vp9ZkOvrM36yUOufctoqON+wXrliEY0J4
 ksR89ZILRRAold9Mh0YDqEJc1HmuxYLJ7lnbLYH1oui8bLbMBM8S2Uo9RKqV2GROLi44enVt
 vdrDvo+CxKj2K+d4cleCNiz5qbTxPUW/cgkwG0lJc4I4sso7l4XMDKn95c7JtNsuzqKvhEVS
 oic5by3fbUnuI0cemeizF4QdtX2uQxrP7RwHFBd+YUia7zCcz0//rv6FZmAxWZGy5arNl6Vm
 lQqNo7/Poh8WWfRS+xegBxc6hBXahpyUKphAKYkah+m+I0QToCfnGKnPqyYIMDEHCS/RfqA5
 t8F+O56+oyLBAeWX7XcmyM6TGeVfb+OZVMJnZzK0s2VYAuI0Rl87FBFYgULdgqKV7R7WHzwD
 uZwJCLykjad45hsWcOGk3OcaAGQS6NDlfhM6O9aYNwGL6tGt/6BkRikNOs7VDEa4/HlbaSJo
 7FgndGw1kWmkeL6oQh7wBvYll2buKod4qYntmNKEicoHGU+x91Gcan8mCoqhJkbqrL7+nXG2
 5Q/GS5M9RFWS+nYyJh+c3OcfKqVcZQNANItt7+ULzdNJuhvTRRdC3g9hmCEuNSr+CLMdnRBY fv0=
In-Reply-To: <20241002085604.277d5006@xps-13>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/10/2024 08:56, Miquel Raynal wrote:
> Hi Krzysztof,
> 
> krzk@kernel.org wrote on Wed, 2 Oct 2024 08:34:44 +0200:
> 
>> On Tue, Oct 01, 2024 at 10:47:49PM +0200, Miquel Raynal wrote:
>>> My understanding of the interrupts property is that it can either be:
>>> 1/ - TX
>>> 2/ - TX
>>>    - RX
>>> 3/ - Common/combined.
>>>
>>> There are very little chances that either:
>>>    - TX
>>>    - Common/combined
>>> or even
>>>    - TX
>>>    - RX
>>>    - Common/combined
>>> could be a thing.
>>>
>>> Looking at the interrupt-names definition (which uses oneOf instead of
>>> anyOf), it makes indeed little sense to use anyOf in the interrupts
>>> definition. I believe this is just a mistake, hence let's fix it.
>>>
>>> Fixes: 8be90641a0bb ("ASoC: dt-bindings: davinci-mcasp: convert McASP bindings to yaml schema")
>>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>>> ---
>>> ---
>>>  .../devicetree/bindings/sound/davinci-mcasp-audio.yaml          | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml b/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
>>> index 7735e08d35ba..ab3206ffa4af 100644
>>> --- a/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
>>> +++ b/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
>>> @@ -102,7 +102,7 @@ properties:
>>>      default: 2
>>>  
>>>    interrupts:
>>> -    anyOf:
>>> +    oneOf:  
>>
>>
>> You need to change interrupt-names as well.
> 
> interrupt-names is already using 'oneOf'!
> 
> The extended diff looks like that:

Indeed.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

