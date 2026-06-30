Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1383291C10;
	Tue, 30 Jun 2026 06:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782801616; cv=none; b=q102Y7x/C/NnuPs0IE7+8FXcOMSNhVUEj9THay1ecz8UqTAbTQqvSuaBS+NIyOIbD92V8R+FkcZ2pvUkGLcK//iEul4fbH3LHRabhjBZNUknYWNxGuSx1G1QExX4vTZkmtEfQxobQYgFtt7Ia2RO3hAEScXGs8SCwAwPTRXnhOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782801616; c=relaxed/simple;
	bh=tPzUUgKX5I6bopctVswm3qvHLGFdUqAjogaDEX43PGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g8aQcy6j4CVyZY4xjmZWl40IOPlPevMo2Ebt/YW6OxqX7b/KN7rfyJHmQv3bujlRSV8gQmGt9rfuIExOE1WLDpqD2ySyMvdHTRG9mT9i7pdsjoWJJOlWcVoFAPRR2x00c6lLDkFn7UTuE3hBcziCGgjKkrDR/w1WlIWrMZL/JQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zo82KfFn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zo82KfFn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 387281F000E9;
	Tue, 30 Jun 2026 06:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782801612;
	bh=1zK/FCFxCZYzG1d3MdwSXsiqqSvH2UuFILULEPPXJy4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zo82KfFnm91JHEO9rwac1k3/5D5cvqSQmCvj1Q4EebADzTxSiqpGE5nBAo3o2tFqJ
	 KlsBv8Fk38EmtJilevk3enjxTjq8fc+QIsiYDB7Wq0tFplDDKvyg7mq5CZos4/e/YT
	 +lNp5bEf4lUZGBzcvhb4VgHRhiLqFtLxOM6tvJ2UROdFvUEuRPPtm8puKfOyhv/Woc
	 tuti6clWePWEnPsoB8vJAb3bZjBXJSN0pLsQwPSiV8u+rIm9n3fSjx0rv83YE+MlC9
	 OHR8Rkufpt41k4PsiMXWPkjifxv1npflyHTKy9BGGikfnEv2vLUHU0BV+UqeSBpf/3
	 CtAzTa0sqA9rQ==
Date: Tue, 30 Jun 2026 08:40:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Neo Chang <YLCHANG2@nuvoton.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, 
	robh@kernel.org, krzk+dt@kernel.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, alsa-devel@alsa-project.org, neo.chang70@gmail.com, 
	kchsu0@nuvoton.com, sjlin0@nuvoton.com
Subject: Re: [PATCH v5 1/2] ASoC: dt-bindings: nuvoton,nau8360: Add NAU83G60
Message-ID: <20260630-amusing-striped-urchin-d49c93@quoll>
References: <20260630021510.821919-1-YLCHANG2@nuvoton.com>
 <20260630021510.821919-2-YLCHANG2@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260630021510.821919-2-YLCHANG2@nuvoton.com>

On Tue, Jun 30, 2026 at 10:15:09AM +0800, Neo Chang wrote:
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: mclk
> +
> +  firmware-name:
> +    items:
> +      - description: |

Drop |

> +          Left DSP core firmware.
> +          In PBTL mode, the Left firmware is ignored and only the Right is applied.
> +      - description: Right DSP core firmware.
> +
> +  nuvoton,pbtl-enable:
> +    type: boolean
> +    description: NAU83G60 supports PBTL mode for mono output.
> +
> +  nuvoton,dac-cur-enable:
> +    type: boolean
> +    description: |

Drop |

There is no formartting to preserve and I did not ask to introduce it
here. I commented in completely different place.

With these two fixed:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

