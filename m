Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6781E3E9588;
	Wed,  8 Jul 2026 06:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783493601; cv=none; b=PR7rDiMbxiScPwjyUDDeoSskN867eDxBTCXBEZxcRwogjH9Tt3xrZ5UzmhepP9lMNeGx60natHljKKT8y2eFfMQSZe/+UtM6KD74gi70R89q4b84Pe0zDKQNwtO5qHK2O2pYf96UdDKTJ5eDlDKRr4B55YLjdSLNhjiFbFl9vwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783493601; c=relaxed/simple;
	bh=1TXg+jK8In1FaQwsjF+jePgIXle8DMAOtx8Esy8woPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VjpYi/3pWQxCCFD9Pcy+4oaj53bL3Ej+tgSmcZUGtlEQAKGjyJsXQF3ipKpqDv7tvsONNW8Ynvokzlv5JL8VVmegQu/zkG1CXTOYz0d7Rg6m5aYmWpriLWWApGvhg9i8lg7m7vJReFfE1qW6+p2+h5V26eJ7/xGly8SS3bZNdTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZyDgVcci; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZyDgVcci"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2949C1F000E9;
	Wed,  8 Jul 2026 06:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783493591;
	bh=fSKoVHmkmzgUBU6Cv1GH58P6FokBu3F6zxcPPURGhhA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZyDgVcciAuDMjpNLTmx8QZ+oa1Ga7XKkqbglVo1g3Dv0l5hZTnbCFNGttBOky/hal
	 oxXkElND74dV8prkv0vcE+haH0pSWIjBbABLp7NaJ1qZemMbM1jCRG2e5ARMSEERTl
	 JY9kOK43TU/W+y9oOpyR8l278dp17XDBrMhMSbWdYwCW4QtF67Legjbu4eAVghfzOI
	 jwQADZ9tasG0CDeyvZe4giheSDC54LP+W5VL3VVkk1A/Q+dYOJQ76RsTwf/+9/KJtq
	 AFMEOqtNAWn8/1hdQScoG0loAVRIDA8LBhQXTynADqQGg7tRr1Wl4zyQfOVOyDJC1D
	 RRHdj16VBpJUw==
Date: Wed, 8 Jul 2026 08:53:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/7] dt-bindings: sound: qcom,q6dsp-lpass-ports: add
 Audio IF clocks
Message-ID: <20260708-calm-lyrebird-of-tranquility-88fcf6@quoll>
References: <20260707190106.2876465-1-prasad.kumpatla@oss.qualcomm.com>
 <20260707190106.2876465-4-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260707190106.2876465-4-prasad.kumpatla@oss.qualcomm.com>

On Wed, Jul 08, 2026 at 12:31:02AM +0530, Prasad Kumpatla wrote:
> Add the LPASS Audio IF clock IDs used by newer backend interfaces.
> 
> Platforms using Audio IF module backends request the interface bit
> clocks through q6prm. Add the Audio IF IBIT and EBIT IDs to the binding
> header so these clocks can be referenced from device trees.
> 
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> ---
>  .../sound/qcom,q6dsp-lpass-ports.h            | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

