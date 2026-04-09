Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46543C9EDF
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 15:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775746870; cv=none; b=SVwiTv0VxjN7uJU/Sa/SuCj9FuiwapBhOtoViqkE3pgJlgBv8he2Qfl0bsSrCyjdm4UIAniPDdh1PLPvi4MVWrwtSNBJ2AwE0x/5WTeF7DF7bnWxQqS45JimdTUPvrhD2J+qllzZmLuqdYR8IkRuQmiV/ImSWL3FmcAcMA07WPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775746870; c=relaxed/simple;
	bh=eU/0+H99y8aVk6sP9KjelkGrwI25brq919mGlv3x2Hk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PeaA9dAqBtRqa35lgee/Ci/akwiE2cO50CU+OIgEwxFKV5niAOjwojJ+16vfdcuALjU8Joozmgeg6+75jF5lKsVXPD/d6smJ+Mi98u3f+xenpAGGpV0ss5NfQqr4CNYw0RXFeRPJqtJbhJTjqVYaXNfIDUJA2E3GqKQxYoHyaw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qb1OkkCH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qb1OkkCH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AFD1C2BCB1
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 15:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775746870;
	bh=eU/0+H99y8aVk6sP9KjelkGrwI25brq919mGlv3x2Hk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qb1OkkCH1LcUJwMlp0smxmHg9hIF3gIFKwKysxol5849BsjqGbavzIzwDpFa+AkkQ
	 lxaD+RlVa1Ax+8ynGXbDUMsh6qRcneZeXqgWMj3DJc9n8S91sMykqQzV1+pZDfRzai
	 MMwbNo3ac9CmCvrpHFNeGJgtsB/HkyuWOnxzO1nu7pQW3gsrJPhih2bdJdeQ/DPsqX
	 MlrLMJ3HDJVr9qlo98K/reOaqTSrn7KeH24KcKnTuMdJHFoQDjy4H+h+qD7/oNsOuf
	 jB01gzBiYZ07i+hr9TU2cwIx3iiwv+I28wXXREJadg/YEv1GLK0+nDZYEnHIf+lNKC
	 LHjkU5kJUEuZw==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-66f727d6849so1379648a12.1
        for <linux-sound@vger.kernel.org>; Thu, 09 Apr 2026 08:01:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUbicoUNsGzA290eNUe9ouR8cszgHcLKe78nQ+1Fd6YJDilCWwsQrZi5fs+9YUFGjX88JRzhwrvH8Kp/g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu1Jml5wu4i/+Ii98Zocpv0/p3e/GV/pecmvxME7r6bEiGhZw7
	s9BMe1fTEU9GkTKvlLwOULPFRCCvyvma5+KDKuJdrlIIZXWBIIv9eN0LPBEShEDAc5bOV+9NP7K
	YHfvoSlOh4Jly0/M5vPSlrPfE65YxLA==
X-Received: by 2002:a17:907:9341:b0:b9d:3823:e7b4 with SMTP id
 a640c23a62f3a-b9d4768d4d5mr176438966b.31.1775746868558; Thu, 09 Apr 2026
 08:01:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330101610.57942-1-herve.codina@bootlin.com>
 <20260330101610.57942-3-herve.codina@bootlin.com> <20260408122901.GA42727-robh@kernel.org>
 <20260408190932.0ab936b0@bootlin.com>
In-Reply-To: <20260408190932.0ab936b0@bootlin.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 9 Apr 2026 10:00:55 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK4SHQS6MciQpLSrGWo2knqs7-eB3yoAv2J54bSfW-Lxg@mail.gmail.com>
X-Gm-Features: AQROBzCAcuc8BAMdceAwtjXPdIRiZc9n-UNPxD81LODZJ04zE2BvrbZCjHXObas
Message-ID: <CAL_JsqK4SHQS6MciQpLSrGWo2knqs7-eB3yoAv2J54bSfW-Lxg@mail.gmail.com>
Subject: Re: [PATCH 2/4] ASoC: dt-bindings: Add support for the GPIOs driven amplifier
To: Herve Codina <herve.codina@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 8, 2026 at 12:09=E2=80=AFPM Herve Codina <herve.codina@bootlin.=
com> wrote:
>
> Hi Rob, Mark,
>
> On Wed, 8 Apr 2026 07:29:01 -0500
> Rob Herring <robh@kernel.org> wrote:
>
> ...
>
> > > +properties:
> > > +  compatible:
> > > +    const: audio-gpio-amp
> >
> > To be consistent with other GPIO controlled devices: gpio-audio-amp
>
> Ok.
>
> Mark suggested to merge this gpio-audio-amp with simple-amplifier.

Merging driver and merging binding are separate questions.

> This leads to the following question:
>
> Should I keep the 'gpio-audio-amp' compatible string ?

Yes. 'cause this binding isn't simple...

And I don't care for any compatible with 'simple' (or generic) in it.
Not sure why I agreed to that one. But I'm all for generic/common
drivers.

> Should I keep two bindings (this one and the simple-audio-amplifier.yaml)=
 or
> should I merge bindings?

2 bindings. There's no overlap in property names.


> ...
> > > +  gain-gpios:
> > > +    description: |
> > > +      GPIOs to control the amplifier gain
> > > +
> > > +      The gain value is computed from GPIOs value from 0 to 2^N-1 wi=
th N the
> > > +      number of GPIO described. The first GPIO described is the lsb =
of the gain
> > > +      value.
> > > +
> > > +      For instance assuming 2 gpios
> > > +         gain-gpios =3D <&gpio1 GPIO_ACTIVE_HIGH> <&gpio2 GPIO_ACTIV=
E_HIGH>;
> > > +      The gain value will be the following:
> > > +
> > > +          gpio1 | gpio2 | gain
> > > +          ------+-------+-----
> > > +            0   |    0  | 0b00 -> 0
> > > +            1   |    0  | 0b01 -> 1
> > > +            0   |    1  | 0b10 -> 2
> > > +            1   |    1  | 0b11 -> 3
> > > +          ------+-------+-----
> > > +
> > > +      Note: The gain value, bits set to 1 or 0, indicate the state a=
ctive (bit
> > > +            set) or the state inactive (bit unset) of the related GP=
IO. The
> > > +            physical voltage corresponding to this active/inactive s=
tate is
> > > +            given by the GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW flags.
> > > +
> > > +    minItems: 1
> > > +    maxItems: 32
> >
> > 2^32 levels? Seems like a bit much. Also, unless you can change the
> > values of all the GPIOs atomically, aren't you going to get some
> > artifacts while the gain is being changed? Unless you mute I guess.
>
> I didn't want to set a particular limit related to the number of GPIOs
> used for thje gain value. Of course 2^32 is obviously a lot.
>
> What do you think about 16 for maxItems?

What is the most you are aware of? Take that and double it.

Seems to me 256 levels would be way more than a human ear could distinguish=
.

> Related to Artifacts, yes they can probably be there. Also the mute featu=
re
> is not required. Some hardware use only one GPIO and doesn't implement mu=
te
> feature. In that case no artifacts can be present.
>
> If mute is implemented, it is the application responsibility to handle
> mute / unmute while changing the gain value. I don't think we can do anyt=
hing
> at driver level to avoid those artifacts if any.
>
> >
> > > +
> > > +  gain-points:
> > > +    $ref: /schemas/types.yaml#/definitions/int32-matrix
> > > +    items:
> > > +      items:
> > > +        - description: The GPIOs value
> >
> > Can't this just be the index?
>
> Some GPIOs value can be skipped if they don't make any sense in the hardw=
are
> design. With the index, this is not possible.
>
> gpios:
>   0b00 -3dB
>   0b01 0dB
>   0b10 Reserved, should not be used
>   0b11 +3dB
>
> With just the index, the reserved 0b10 value cannot be skipped. I would l=
ike
> to handle this kind of cases.

Okay.

> > If not, then gain-range could be expressed using gain-points instead.
>
> Do you have in mind something like the following?
>   gain-range =3D <0 (-300)>, <3 600>;
>
> defining the range from -3dB to +6dB with GPIOs value 0 for -3dB and 3 fo=
r +6dB.

Yes, but since you can have reserved values, that won't work.

> > > +        - description: The related amplifier gain in 0.01 dB unit
> > > +    minItems: 2
> > > +    description: |
> > > +      List of the GPIOs value / Gain value in dB pair defining the g=
ain
> > > +      set on each GPIOs value.
> > > +
> > > +      With 2 GPIOs controlling the gain, GPIOs value can be 0, 1, 2 =
and 3.
> > > +      Assuming that GPIOs values set the hardware gains according to=
 the
> > > +      following table:
> > > +
> > > +         GPIOs | Hardware
> > > +         value | amplification
> > > +         ------+--------------
> > > +           0   | -10.0 dB
> > > +           1   | +3.0 dB
> > > +           2   | 0 dB
> > > +           3   | +6.0 dB
> > > +         ------+--------------
> > > +
> > > +      The description using gain points can be:
> > > +        gain-points =3D <0 (-1000)>, <1 300>, <2 0>, <3 600>;
> > > +
> > > +  gain-range:
> > > +    $ref: /schemas/types.yaml#/definitions/int32-array
> > > +    items:
> > > +      - description: Gain in 0.01 dB unit when all GPIOs are inactiv=
e
> > > +      - description: Gain in 0.01 dB unit when all GPIOs are active
> > > +    description: |
> > > +      Gains (in 0.01 dB unit) set by the extremum (minimal and maxim=
um) value
> > > +      of GPIOs. The following formula must be satisfied.
> > > +
> > > +               gain-range[1] - gain-range[0]
> > > +      Gain  =3D ------------------------------- x GPIO_value + gain-=
range[0]
> > > +                        2^N - 1
> > > +
> > > +      With N, the number of GPIOs used to control the gain and Gain =
computed in
> > > +      0.01 dB unit.
> > > +
> > > +      With 2 GPIOs controlling the gain, GPIOs value can be 0, 1, 2 =
and 3.
> > > +      Assuming that gain value set the hardware according to the fol=
lowing
> > > +      table:
> > > +
> > > +         GPIOs | Hardware 1    | Hardware 2
> > > +         value | amplification | amplification
> > > +         ------+---------------+---------------
> > > +           0   | -3.0 dB       |  +10.0 dB
> > > +           1   | 0 dB          |  +5.0 dB
> > > +           2   | +3.0 dB       |  0 dB
> > > +           3   | +6.0 dB       |  -5.0 dB
> > > +         ------+---------------+---------------
> > > +
> > > +      The description for hardware 1 using a gain range can be:
> > > +        gain-range =3D <(-300) 600>;
> > > +
> > > +      The description for hardware 2 using a gain range can be:
> > > +        gain-range =3D <1000 (-500)>;
> > > +
> > > +  gain-labels:
> > > +    $ref: /schemas/types.yaml#/definitions/string-array
> >
> > minItems: 2
> > maxItems: 0x100000000
>
> Ok, I will adjust maxItems according to the max number of GPIO supported.
>
> For my curiosity, is there a way to express maxItems with a computation
> based on some other properties value ?

No, there isn't.

>
> What could be relevant here is
>   maxitems: 2^(number of items available in the gpio-gain properties)
>
> >
> > > +    description: |
> > > +      List of the gain labels attached to the combination of GPIOs c=
ontrolling
> > > +      the gain. The first label is related to the gain value 0, the =
second label
> > > +      is related to the gain value 1 and so on.
> > > +
> > > +      With 2 GPIOs controlling the gain, GPIOs value can be 0, 1, 2 =
and 3.
> > > +      Assuming that gain value set the hardware according to the fol=
lowing
> > > +      table:
> > > +
> > > +         GPIOs | Hardware
> > > +         value | amplification
> > > +         ------+--------------
> > > +           0   | Low
> > > +           1   | Middle
> > > +           2   | High
> > > +           3   | Max
> > > +         ------+--------------
> > > +
> > > +      The description using gain labels can be:
> > > +        gain-labels =3D "Low", "Middle", "High", "Max";
> >
> > Do we need to allow these to be anything? It's going to get hard to com=
e
> > up with 2^32 names.
>
> Well, "Normal" / "Boost" can make sense on some hardware.
>
> I don't think we need to restrict labels to a list of known label here.

As long as the names are meaningless to software.

>
> Of course 2^32 names is obviously a lot. What could be the limit?

I would guess at 8 or more, it's just going to be gain1, gain2, etc.
or something similar constructed from the gain values.

> ...
>
> > > +
> > > +    /* A mutable amplifier without any gain control */
> > > +    amplifier4 {
> > > +        compatible =3D "audio-gpio-amp";
> > > +        vdd-supply =3D <&regulator>;
> > > +        mute-gpios =3D <&gpio 0 GPIO_ACTIVE_HIGH>;
> >
> > This case is just simple-amplifier...
>
> No, simple-amplifier uses 'enable' and not 'mute'.

Yes, I know...

> We can have the amplifier enabled ('enable' GPIO active) as it is
> used and a switch driven by an other GPIO to mute / un-mute the
> amplifier output.

But you have no 'enable' GPIO here. To me, enable just looks like
inverted mute. If there's some electrical difference, I can't tell
what that is from either binding.

I guess my point was that really we could deprecate simple-amplifier
binding because this one can handle it and more. But I'm not
suggesting we do that yet.

Rob
