Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D338F41DE0D;
	Tue, 21 Jul 2026 06:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784616486; cv=none; b=WjsW58urTqkSgIIMfkUa+FO5lbbHpPfqL2y8PaR/0zQuihCUx3nrICNUcDgoQflPByei2mdfQJjUlGlH1uYA50qhfujgu8IxRiL5dbF4RotoMEvJ6Q5BqrdWDhmiQjezUoibhLQFRfomP1X25lhNTyaAw0Obms87zVUOrzibkdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784616486; c=relaxed/simple;
	bh=oZqUSki0lSiZk5rsUXpeGL6vruLF2oPt3Y+MRxOQ5f4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HG55/Rca9wKCYzuoVSLKYkU3YDGOSFQcNjusUF0AUlDokUsMrQgLgwKbbSLzmlQ4ooF/1GLOSXmVb89ujZlWpllL3wyh1tOBG8hNe4sXS1aYBloTqR/sCL4lReBWosmdM+9Ah/V4MuOjKbxEGBk8Ct41xPrAPn4dFb6Knmqiz0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UTUF7xPQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UTUF7xPQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 726941F000E9;
	Tue, 21 Jul 2026 06:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784616485;
	bh=/JUMLqzj6fOHdfOyj5iXlmKfbuFHeUYbYWgYpKr+ev8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UTUF7xPQxqNfqYRwQIKxSWDIGYDII2y86dWle/aDT2XnYiYWI8Z50Fs4aVH2izXCn
	 gYh5K2M40eyycnv1NWmlxBbppf8DURPzUfN6kbK/TlvoXR4bMT3K5OEiZ7VCHurGck
	 nrERz4A5xNwh/0lx/I/njYsZ1OdMH4feZuesemPHGYq0nYda2bORN3OwxFlXfjXn8j
	 oD6DKYf+vkVSBvIeMLbMnkXOf0k8U9fEhirMTvxeABTQuy3+/2+utf607gB2ubXYbu
	 Bvbx9aie5lIHytlgK7BmE4E3jDgKXtA9kvWkqZop/GQEp7rj5N7Ig+osNtzC5Y6bey
	 cJyHUA0kq4klw==
Date: Tue, 21 Jul 2026 08:48:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH v6 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais:
 Document DAI subnode
Message-ID: <20260721-fiery-sheep-of-piety-4fd04b@quoll>
References: <20260720160226.1026440-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260720160226.1026440-2-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260720160226.1026440-2-mohammad.rafi.shaik@oss.qualcomm.com>

On Mon, Jul 20, 2026 at 09:32:24PM +0530, Mohammad Rafi Shaik wrote:
> +# Digital Audio Interfaces
> +patternProperties:
> +  '^dai@[0-9a-f]+$':
> +    type: object
> +    description:
> +      Q6DSP Digital Audio Interfaces.
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +        description:
> +          Digital Audio Interface ID
> +
> +      clocks:
> +        minItems: 1
> +        items:
> +          - description: MI2S bit clock
> +          - description: MI2S external bit clock
> +          - description: MI2S master clock
> +
> +      clock-names:
> +        minItems: 1
> +        items:
> +          - enum: [bclk, eclk, mclk]
> +          - const: mclk

This does not match your clocks.

I gave you exact syntax to use, then in previous version you used
something else. So I reminded. Again you used something else.

If you decide not to use it, sure, your right but YOU CANNOT come with
clearly invalid code as a substitute.

NAK

Best regards,
Krzysztof

