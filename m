Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3483D301B;
	Wed,  8 Apr 2026 17:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775668184; cv=none; b=Rfcnh31o8hTlYgc6XXDMME84+hUaUbJqwGMr8yw+Fz6BK9o+DTkHW0H9FPp9Ql+CfeOPBg6mZ4EFqy06DyECgF9Tyi9imxYwKEis3uMt2jvhvQdbvx1x+sKVuXha44SMzR+fdy2d8X7ak7d+n+F6E3YtpyLGu3kYrgMjpoEgXes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775668184; c=relaxed/simple;
	bh=Kt8jM7J0A3YvG+76r1CTs2wEIplelcRKm7qBAdNUfDU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NTRnEjy9MKXdhSvFszv4UvbAmn0q23qVWaBm97gIvkVlKsrXAejXD1qdvmt1ylR6zxBf4ki34gzbpP3sWPWTHEBH4sSWAJ8KRjO8Fyz8rSb/vhN1PRdq9MSyMlKa9cis1V3ylbqX/hrtrv1g/UKS+Lsy4NrF6JKMFRxuzUQZhXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Pmz4Zi7k; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Pmz4Zi7k"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DC422C5AA9B;
	Wed,  8 Apr 2026 17:10:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5689B603CE;
	Wed,  8 Apr 2026 17:09:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 43A8A10450171;
	Wed,  8 Apr 2026 19:09:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775668177; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oy/bAOYl1r+E1Ph4KLAy06T/uPj0Ap2V/p/wTp6bZOY=;
	b=Pmz4Zi7kS+STrY8HGoov2AbkJsq1H1R8dg3eIRxIpDT1ijqVBel10julkGK0HQwF8Pqck9
	1ZdTrMhjF0mRFJnY1gaqK+cXlYqsN9xlvGyW7cvUq3OwzP9jbAIRn//S+cuTs/bqJPnr9W
	Zt1VvyvJ51BcB1+VxrX9iZ/BMFCDAWmatT6z21sGGSAg9rTKGAvigp1r1n8KhXvEAhW3UZ
	STFUBtJBTS/z2wvw8XiQe5XYF+9xAxhwz5b6vyAgNk6oZPkeBFVeg544nUcuHIXrm2vtbP
	yqJg8BDsKHeq8GZjuhqhE9BwAelzlLeMCvxiq81yZ6b7J8o4vKq01h7yNJm4jQ==
Date: Wed, 8 Apr 2026 19:09:32 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Saravana Kannan <saravanak@kernel.org>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 2/4] ASoC: dt-bindings: Add support for the GPIOs driven
 amplifier
Message-ID: <20260408190932.0ab936b0@bootlin.com>
In-Reply-To: <20260408122901.GA42727-robh@kernel.org>
References: <20260330101610.57942-1-herve.codina@bootlin.com>
	<20260330101610.57942-3-herve.codina@bootlin.com>
	<20260408122901.GA42727-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Rob, Mark,

On Wed, 8 Apr 2026 07:29:01 -0500
Rob Herring <robh@kernel.org> wrote:

...

> > +properties:
> > +  compatible:
> > +    const: audio-gpio-amp  
> 
> To be consistent with other GPIO controlled devices: gpio-audio-amp

Ok.

Mark suggested to merge this gpio-audio-amp with simple-amplifier.
This leads to the following question:

Should I keep the 'gpio-audio-amp' compatible string ?

Should I keep two bindings (this one and the simple-audio-amplifier.yaml) or
should I merge bindings?

...
> > +  gain-gpios:
> > +    description: |
> > +      GPIOs to control the amplifier gain
> > +
> > +      The gain value is computed from GPIOs value from 0 to 2^N-1 with N the
> > +      number of GPIO described. The first GPIO described is the lsb of the gain
> > +      value.
> > +
> > +      For instance assuming 2 gpios
> > +         gain-gpios = <&gpio1 GPIO_ACTIVE_HIGH> <&gpio2 GPIO_ACTIVE_HIGH>;
> > +      The gain value will be the following:
> > +
> > +          gpio1 | gpio2 | gain
> > +          ------+-------+-----
> > +            0   |    0  | 0b00 -> 0
> > +            1   |    0  | 0b01 -> 1
> > +            0   |    1  | 0b10 -> 2
> > +            1   |    1  | 0b11 -> 3
> > +          ------+-------+-----
> > +
> > +      Note: The gain value, bits set to 1 or 0, indicate the state active (bit
> > +            set) or the state inactive (bit unset) of the related GPIO. The
> > +            physical voltage corresponding to this active/inactive state is
> > +            given by the GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW flags.
> > +
> > +    minItems: 1
> > +    maxItems: 32  
> 
> 2^32 levels? Seems like a bit much. Also, unless you can change the 
> values of all the GPIOs atomically, aren't you going to get some 
> artifacts while the gain is being changed? Unless you mute I guess.

I didn't want to set a particular limit related to the number of GPIOs
used for thje gain value. Of course 2^32 is obviously a lot.

What do you think about 16 for maxItems?

Related to Artifacts, yes they can probably be there. Also the mute feature
is not required. Some hardware use only one GPIO and doesn't implement mute
feature. In that case no artifacts can be present.

If mute is implemented, it is the application responsibility to handle
mute / unmute while changing the gain value. I don't think we can do anything
at driver level to avoid those artifacts if any.

> 
> > +
> > +  gain-points:
> > +    $ref: /schemas/types.yaml#/definitions/int32-matrix
> > +    items:
> > +      items:
> > +        - description: The GPIOs value  
> 
> Can't this just be the index?

Some GPIOs value can be skipped if they don't make any sense in the hardware
design. With the index, this is not possible.

gpios:
  0b00 -3dB
  0b01 0dB
  0b10 Reserved, should not be used
  0b11 +3dB

With just the index, the reserved 0b10 value cannot be skipped. I would like
to handle this kind of cases.

> 
> If not, then gain-range could be expressed using gain-points instead.

Do you have in mind something like the following?
  gain-range = <0 (-300)>, <3 600>;

defining the range from -3dB to +6dB with GPIOs value 0 for -3dB and 3 for +6dB.

> 
> > +        - description: The related amplifier gain in 0.01 dB unit
> > +    minItems: 2
> > +    description: |
> > +      List of the GPIOs value / Gain value in dB pair defining the gain
> > +      set on each GPIOs value.
> > +
> > +      With 2 GPIOs controlling the gain, GPIOs value can be 0, 1, 2 and 3.
> > +      Assuming that GPIOs values set the hardware gains according to the
> > +      following table:
> > +
> > +         GPIOs | Hardware
> > +         value | amplification
> > +         ------+--------------
> > +           0   | -10.0 dB
> > +           1   | +3.0 dB
> > +           2   | 0 dB
> > +           3   | +6.0 dB
> > +         ------+--------------
> > +
> > +      The description using gain points can be:
> > +        gain-points = <0 (-1000)>, <1 300>, <2 0>, <3 600>;
> > +
> > +  gain-range:
> > +    $ref: /schemas/types.yaml#/definitions/int32-array
> > +    items:
> > +      - description: Gain in 0.01 dB unit when all GPIOs are inactive
> > +      - description: Gain in 0.01 dB unit when all GPIOs are active
> > +    description: |
> > +      Gains (in 0.01 dB unit) set by the extremum (minimal and maximum) value
> > +      of GPIOs. The following formula must be satisfied.
> > +
> > +               gain-range[1] - gain-range[0]
> > +      Gain  = ------------------------------- x GPIO_value + gain-range[0]
> > +                        2^N - 1
> > +
> > +      With N, the number of GPIOs used to control the gain and Gain computed in
> > +      0.01 dB unit.
> > +
> > +      With 2 GPIOs controlling the gain, GPIOs value can be 0, 1, 2 and 3.
> > +      Assuming that gain value set the hardware according to the following
> > +      table:
> > +
> > +         GPIOs | Hardware 1    | Hardware 2
> > +         value | amplification | amplification
> > +         ------+---------------+---------------
> > +           0   | -3.0 dB       |  +10.0 dB
> > +           1   | 0 dB          |  +5.0 dB
> > +           2   | +3.0 dB       |  0 dB
> > +           3   | +6.0 dB       |  -5.0 dB
> > +         ------+---------------+---------------
> > +
> > +      The description for hardware 1 using a gain range can be:
> > +        gain-range = <(-300) 600>;
> > +
> > +      The description for hardware 2 using a gain range can be:
> > +        gain-range = <1000 (-500)>;
> > +
> > +  gain-labels:
> > +    $ref: /schemas/types.yaml#/definitions/string-array  
> 
> minItems: 2
> maxItems: 0x100000000

Ok, I will adjust maxItems according to the max number of GPIO supported.

For my curiosity, is there a way to express maxItems with a computation
based on some other properties value ?

What could be relevant here is
  maxitems: 2^(number of items available in the gpio-gain properties)

> 
> > +    description: |
> > +      List of the gain labels attached to the combination of GPIOs controlling
> > +      the gain. The first label is related to the gain value 0, the second label
> > +      is related to the gain value 1 and so on.
> > +
> > +      With 2 GPIOs controlling the gain, GPIOs value can be 0, 1, 2 and 3.
> > +      Assuming that gain value set the hardware according to the following
> > +      table:
> > +
> > +         GPIOs | Hardware
> > +         value | amplification
> > +         ------+--------------
> > +           0   | Low
> > +           1   | Middle
> > +           2   | High
> > +           3   | Max
> > +         ------+--------------
> > +
> > +      The description using gain labels can be:
> > +        gain-labels = "Low", "Middle", "High", "Max";  
> 
> Do we need to allow these to be anything? It's going to get hard to come 
> up with 2^32 names.

Well, "Normal" / "Boost" can make sense on some hardware.

I don't think we need to restrict labels to a list of known label here.

Of course 2^32 names is obviously a lot. What could be the limit?

> 
> > +
> > +dependencies:
> > +  gain-points: [ gain-gpios ]
> > +  gain-range: [ gain-gpios ]
> > +  gain-labels: [ gain-gpios ]  
> 
> gain-gpios is really optional?

Yes, we can have an amplifier without any possibility to change the gain
value but with a gpio allowing to mute or bypass the amplifier.

...
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    /* Gain controlled by gpios */
> > +    amplifier0 {  
> 
> amplifier-0

Ok, it will be update in the next iteration as well as other node
names available in this example part.

...

> > +
> > +    /* A mutable amplifier without any gain control */
> > +    amplifier4 {
> > +        compatible = "audio-gpio-amp";
> > +        vdd-supply = <&regulator>;
> > +        mute-gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;  
> 
> This case is just simple-amplifier...

No, simple-amplifier uses 'enable' and not 'mute'.

We can have the amplifier enabled ('enable' GPIO active) as it is
used and a switch driven by an other GPIO to mute / un-mute the
amplifier output.

Best regards,
Hervé
