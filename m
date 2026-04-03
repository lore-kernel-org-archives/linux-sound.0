Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EC228466F;
	Fri,  3 Apr 2026 07:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775200784; cv=none; b=d2OZ+tMyVNDPOuKFPWhcvPKK7PX915NYfTweCo0emacJYdg57IY5qq2SfW1e7ymkvrGfU6Xsjbh8EP4pyaZNz0DkU8OKILBl3V5De0SW4GBR6Up2uGEwwrLbwL87ahp+W2nsfyJvy2MvgYJshPKLYy5XLUsFO67V3NsaF0LXeww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775200784; c=relaxed/simple;
	bh=m1ADwcOxnxwgi9JICfWJKWEbH2sRKsuMJFFYWPPxcv4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UTRg0CyP8Nd5tdYv27m5+0WRCGOcKsIupITLl7BOgKrG+3DCp8mGCInbHDkgPo6H6pzyQS8YUlb2lHzi2pkzKwrwGuNOw5i2RsSO/5rukJfI5gNYrSt4UThdYblD1tK0ZBoWxwk2IAPe0awIxE2GE78g6Y3G56mR4zeUq9bNrPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eXNZXyvZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eXNZXyvZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A98CC4CEF7;
	Fri,  3 Apr 2026 07:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775200783;
	bh=m1ADwcOxnxwgi9JICfWJKWEbH2sRKsuMJFFYWPPxcv4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eXNZXyvZIlOcg08m/EQ2P73GvGM/9SSPaUSlrTtNBNl9GCv/RSsZ9Q3Ca2fzLgaYk
	 /7kYwudBsLjv8Kox6orFzXKxTNyYQE0L9QBRJUtevdVlntGGGBTOSbqJ2uBfn3IGLb
	 1nmP8mqP7Wj3RKExOK1+u2X3D2hUIJeLiUCEuEgERNWCN660RuXcvAQRmVVC14NOOQ
	 aDxL4fveaRrt3sfA+Ngu3PFgPZoeHP/hsrOfdk/fdwnc0fSC41TCIMf+W2H+LWk2LD
	 I8dsAlOwJZJeNP/ylWoXmpJp9eAcBiCJugj2XP1+9Tk5j7DNvjhhtvsN5VaFqIpYVq
	 /JatP1r6bFkBw==
Message-ID: <02517021-74cc-4023-98f2-fc7a485b2d2f@kernel.org>
Date: Fri, 3 Apr 2026 09:19:37 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: sound: Add ti,tas675x
To: Sen Wang <sen@ti.com>
Cc: linux-sound@vger.kernel.org, broonie@kernel.org, lgirdwood@gmail.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, perex@perex.cz, tiwai@suse.com,
 shenghao-ding@ti.com, kevin-lu@ti.com, baojun.xu@ti.com, niranjan.hy@ti.com,
 l-badrinarayanan@ti.com, devarsht@ti.com, v-singh1@ti.com,
 linux-kernel@vger.kernel.org
References: <message-id-of-your-RFC-cover-letter>
 <20260401223239.1638881-1-sen@ti.com> <20260401223239.1638881-2-sen@ti.com>
 <20260402-funky-lionfish-of-grandeur-fadba6@quoll>
 <b35904a2-0913-456f-b89a-f9f45e6a686a@ti.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <b35904a2-0913-456f-b89a-f9f45e6a686a@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/04/2026 02:40, Sen Wang wrote:
>>> diff --git a/Documentation/devicetree/bindings/sound/ti,tas675x.yaml b/Documentation/devicetree/bindings/sound/ti,tas675x.yaml
>>> new file mode 100644
>>> index 000000000000..23e4cc77b4ae
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/sound/ti,tas675x.yaml
>>> @@ -0,0 +1,278 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/sound/ti,tas675x.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Texas Instruments TAS675x Audio Amplifier
>>> +
>>> +maintainers:
>>> +  - Sen Wang <sen@ti.com>
>>> +
>>> +description: |
>>
>> Do not need '|' unless you need to preserve formatting.
>>
>>> +  The TAS675x family (TAS6754, TAS67524) are four-channel, digital-input,
>>
>> And devices are not compatible?
>>
> 
> They're compatible, and I didn't have any differentiators for this 
> initial driver. So I should only keep one.
> And also rename ti,tas675x.yaml to ti,tas67524.yaml.

No, you should express compatibility. See writing bindings, writing
schema, example schema docs or DTS101 talk.


Best regards,
Krzysztof
