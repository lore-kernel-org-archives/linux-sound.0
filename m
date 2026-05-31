Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31977335BA;
	Sun, 31 May 2026 12:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780231852; cv=none; b=T9pyF1FlWj+/MGgGrutYN5S98s93j1/BZsFGd2pjH1wVHSoXDSQRNkUaa4eBVnuGtVwbmGvdlBa32veihfJXnd5RzbhvxfNn6dSOZ9tX/6cAoyJlPVqGyyPGgAUY31jZR+QzAgUIUcEv2QA0OVuaFOjq+iBTt7Bxl314veRrMOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780231852; c=relaxed/simple;
	bh=Y0ZNGWF5ybDHA3q6v1FBavIc9knxuv0yqYP/tvODo8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sJ/xiZ0IKJ3L4/O53RA4NUAmQNISmXIdaAbV2aC3JMwP1ob0XGo+xXoJqmsTolNE13FB+0qxYDlW7mXmLAryygUwvTdA6c88HY9wPAZEJZP+exPRvXBVFa/D+5txgNWEed0SlBu5g2rthc7Z/cnV9P6V58hmpdlbJvGxApBvgs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wuk+tkTc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wuk+tkTc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E2D31F00893;
	Sun, 31 May 2026 12:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780231850;
	bh=pPJtg0Wcp4MUws70XPBV+NH7akiMREPUrdzBpYNX2Ng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Wuk+tkTcZYyZ03R1HZ+mwBnVW0r4LzTUs0k5m1n/xZfcaNxykCczgyV/Kfq1OOstP
	 HW/ydjaxNpFY5Z9sNuZuIAB4QdjbyPJqm2rPbDIG/X7FbVgErad7treEKmI6hGZJyr
	 75lSlu34iugMqFA9V190tlZuCPOQ938W8QXi92Lm0TkjXKt41Mow18FusAkFlawGcn
	 7SXIBjNQmxk8M0NXseODwcMFHM5/L4Jr96jEBAcCP3udhTFFxdgOHXKXWqJN1E8wv3
	 ngfz4X7ZfrkmmEed5Edeu3i8hU6Wds+DIrVZ0QvqXBIJXjWIM4xvuhPrwAWDZZAL3V
	 rqsHvpxoe+ZiA==
Date: Sun, 31 May 2026 14:50:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Manish Baing <manishbaing2789@gmail.com>
Cc: claudiu.beznea@tuxon.dev, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ASoC: dt-bindings: sound: atmel_ac97c: Convert to DT
 schema
Message-ID: <20260531-uppish-poised-potoo-4fa89b@quoll>
References: <20260530052812.115994-1-manishbaing2789@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260530052812.115994-1-manishbaing2789@gmail.com>

On Sat, May 30, 2026 at 05:28:12AM +0000, Manish Baing wrote:
> +properties:
> +  compatible:
> +    const: atmel,at91sam9263-ac97c
> +
> +  reg:
> +    maxItems: 1
> +    description: Address and length of the register set for the device.
> +
> +  interrupts:
> +    maxItems: 1
> +    description: Should contain the AC97 interrupt.
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: ac97_clk
> +
> +  ac97-gpios:
> +    minItems: 3

This stays...

> +    maxItems: 4

this drop

> +    description: |
> +      AC97 link GPIOs- sync, sdata_out, reset, and optional sdata_in.
> +      The driver primarily uses the reset pin.a

and instead list the items with description.

> +
> +  pinctrl-0: true
> +
> +  pinctrl-names:
> +    const: default

Drop both pinctrl properties, not needed, already core schema provides
them. No need to mention that in commit msg.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +unevaluatedProperties: false

Best regards,
Krzysztof

