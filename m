Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6E32417D9;
	Fri,  3 Apr 2026 07:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775200859; cv=none; b=bHI88Kel3rqEuzE49lGaiRm/iasrOWvpgnX9zJIPScQJHP5DdtpFHIEouYgzTi5t2r2SykwQ3XXSdHSDslEK2n8swbjOMjHSOzw5x9Tmmf8cl9zfXOOmTlNfSjmn6+IpMA+vMLi6WVw33OvW7Geb34R8BoIC+DuZkPpfxVzCimk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775200859; c=relaxed/simple;
	bh=IP6AlMANAo90BWJlLpndZeWuIqXzIJilOy2As+KxlwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JTtY8UPInwhBAU+hL8WefDhx8LCEUxDzKiigrPtL/hr9A3O3OIlf6peMUg10xVOMV64t2P7/r4Phm0gwJ/o77SmRIHFM9jydEXeHSOQMmEruxNAPvtYu2t4Jv9kuRclRYw+jB0Dtbn50wohgCMcwgTrgQf4tvoCTnQQ2lQ9Rxms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=obc5E4b8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="obc5E4b8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46459C4CEF7;
	Fri,  3 Apr 2026 07:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775200859;
	bh=IP6AlMANAo90BWJlLpndZeWuIqXzIJilOy2As+KxlwY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=obc5E4b8C3/XfsAdTz3h3h/Tr4Jf2qn/WO83XydRvPzlPqx9ALtRYlgpN+DvwJXQb
	 y+dRIkNQ499kuMlaNKpSz14r89SQgFXQ6o8qDaYauOMeCFdk585q2GVZ2NoPKZyTpW
	 6lJaiFT/RDvnofY9X9BtSRqfCDlBOfPTrntf95eXSorQbEnaxHkoXW8MArxCivRIJi
	 OpZZ5XYaahDdAx+Afqep0lDQnt8F0zGi1sdgLpV1JeA++m5dogKfd3MG/vkv3kxRlI
	 cAL8+JdTSZJU9q9qWoi5Cea7CP5haDhC48ThzOZfg1pWZfuJA7O7D346haGJfc+tHn
	 L4jpU7NC8I9lg==
Message-ID: <2450b3d3-bfa8-453b-9264-f341fe871136@kernel.org>
Date: Fri, 3 Apr 2026 09:20:52 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] ASoC: dt-bindings: Add ti,tas67524
To: Sen Wang <sen@ti.com>, linux-sound@vger.kernel.org
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 perex@perex.cz, tiwai@suse.com, shenghao-ding@ti.com, kevin-lu@ti.com,
 baojun.xu@ti.com, niranjan.hy@ti.com, l-badrinarayanan@ti.com,
 devarsht@ti.com, v-singh1@ti.com, linux-kernel@vger.kernel.org
References: <20260403050627.635591-1-sen@ti.com>
 <20260403050627.635591-2-sen@ti.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260403050627.635591-2-sen@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/04/2026 07:06, Sen Wang wrote:
> Add device tree binding for the Texas Instruments TAS67524 family
> of four-channel Class-D audio amplifiers with integrated DSP.
> 
> Signed-off-by: Sen Wang <sen@ti.com>
> ---
> Changes in v3:
>  - Renamed ti,tas675x to ti,tas67524.yaml
>  - Removed tas6754 compatible instance
>  - Changed pd-gpios to powerdown-gpios
>  - Cleanup unnessary "|" formatting
> 
> Changes in v2:
>  - None
> 
>  .../bindings/sound/ti,tas67524.yaml           | 277 ++++++++++++++++++
>  1 file changed, 277 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/ti,tas67524.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/ti,tas67524.yaml b/Documentation/devicetree/bindings/sound/ti,tas67524.yaml
> new file mode 100644
> index 000000000000..b8da1360e698
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/ti,tas67524.yaml
> @@ -0,0 +1,277 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/ti,tas67524.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments TAS67524 Audio Amplifier
> +
> +maintainers:
> +  - Sen Wang <sen@ti.com>
> +
> +description:
> +  The TAS67524 is a four-channel, digital-input, automotive
> +  Class-D audio amplifier with load diagnostics and an integrated
> +  DSP for audio processing.
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,tas67524


And where did you give me chance to answer to your comment? You answered
2:40 AM of my time and four hours later - 7 AM my time - you send v3.

No, read again the feedback. I am not reviewing the rest.

Best regards,
Krzysztof
