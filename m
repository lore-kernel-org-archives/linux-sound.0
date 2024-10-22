Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DE712C491;
	Tue, 22 Oct 2024 06:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729579116; cv=none; b=neBgYyS0I1rkPXcsOj3l0IdU8cu+OJYTf4M+mLVgjxPS2bJCewdgG2y5nUmhWmvNIxhtvGcrou1C6GcWluKX6ioVmuv4Rm+ANIjNgH0muyScQoiGiPiimtdh2CTHocAdXEmXYo7Rfd2yMPULZEBF8ukRo/qeSpJnS93EAde9k54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729579116; c=relaxed/simple;
	bh=9pcPlD06pv+SEQV6FitZCFxRdWx6qbI19wDrDPQq0p8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G7r/VQ75zcqb3sfaMg9VRv57Vh4goretA9mpM5MWoceCK0FbziiOxZ/YcXY3a9UM3Q6wkSw1SmmFj+yWDZpBA1rsL9bgrnuN72fnuUDBSB7Ss5kjK+qPCUcy0UpV5PU0CtmGBB/gQae7+3ZJ+fKs6mmDBiF7LzodJq7/c1SPzU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lLE3vcHx; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lLE3vcHx"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43168d9c6c9so32144605e9.3;
        Mon, 21 Oct 2024 23:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729579113; x=1730183913; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9pcPlD06pv+SEQV6FitZCFxRdWx6qbI19wDrDPQq0p8=;
        b=lLE3vcHx4KAjE/BeJyB0zK5KGFJkYc1BkarPc1eS63AjIOanYH74j514+YoksfneHj
         +Kzw3ANf+1A+7cl0RU9WpNnWpHWdOD+aNQw5xe1CQvcYIrgxm+jlYJafWqR/tvnbhjqT
         L4nS2e5wlaSrynKDseXw7h+uopgN2gFVIa6XdTxXS3anTFo3w8JWvb49DzdacjLr3pmw
         tTqczDNshfBGaZklvelkM1318hIsxSwDNO28l8nvpFmp4FwiQrvJYQX8tRX3zAnf42ub
         O3zewRQ8kFdDOw7IqZFiWyxNNt6gIgpw0l8U1+xkReWDLnlvmp1O9eAcQJ3ZNAYDvHho
         9l8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729579113; x=1730183913;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9pcPlD06pv+SEQV6FitZCFxRdWx6qbI19wDrDPQq0p8=;
        b=BduHGmVu3Vs9gySvOylw8zt0ttckNoUuiap0VJUOlF2QlL7zbCGSzg4OtILxfM9HzI
         xmAd8oeYCtUzcVjJs8jaLjg79JhPoaoODP9H+bl+cnEpsS7j6k/du2dKXFkDg61tjHa2
         NTW7l6t74geEkE35znZmPBvPiXF3TrNmMUmRzHGkPZnBthBRYGSblqWTzFak0iHRTx5s
         Lqgm/VV1qgcKtti7QfLopv/GoP4kBbhzrAu4P3r/8brRUV3I62CZ/j5QTz+tgqEO59Gh
         k6qF+Ne4nqzJ1vbjHqAqDjU/Ho3W5XUQ4tdLf9qkybR6n8DgvL9Us65ieJKE9KqLxq/I
         hjWg==
X-Forwarded-Encrypted: i=1; AJvYcCUkDk1sASfANhMNBihvMlJcsvGbX633zcC8LN3GhmGv/K6JPOVDaPer5kQqLpXKIAcmZfklXADIaFUG@vger.kernel.org
X-Gm-Message-State: AOJu0YwWtm2Gi1I/EW9ILM9tp5qtTW4Ad8LW7bjUguxj83iiSueLEACM
	nLhe1G+JdPWNHlTh7nL3fLhim9O0VpwHWxq8V/XvPUGR7JVRcq802bZLlPlOx8I8V19h
X-Google-Smtp-Source: AGHT+IFj292MaSA+uQzu4Kutne2WGpYWL/OvZOC6J/AIk/lJKBvqooSWcTNLFnhEDUHUj5J2yQCLew==
X-Received: by 2002:a5d:4d03:0:b0:37d:476d:2d58 with SMTP id ffacd0b85a97d-37eb47693bamr8382231f8f.45.1729579112836;
        Mon, 21 Oct 2024 23:38:32 -0700 (PDT)
Received: from ?IPv6:2003:f6:ef15:2100:888:d3c6:a442:4910? (p200300f6ef1521000888d3c6a4424910.dip0.t-ipconnect.de. [2003:f6:ef15:2100:888:d3c6:a442:4910])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a4ad97sm5887561f8f.41.2024.10.21.23.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 23:38:32 -0700 (PDT)
Message-ID: <a38c5d3e4f1cdf90f53b8c17ef7508faaf760f89.camel@gmail.com>
Subject: Re: [PATCH 2/4] ASoC: dt-bindings: document the adau1373 Codec
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Nuno Sa <nuno.sa@analog.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, Liam Girdwood
	 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
	 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Lars-Peter Clausen
	 <lars@metafoo.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Date: Tue, 22 Oct 2024 08:42:50 +0200
In-Reply-To: <pj5clifybfwljpq3usfgca7cy54xpmzngdckyb53wc3u4lts53@gtm2mbuiiudw>
References: <20241021-adau1373-shutdown-v1-0-bec4ff9dfa16@analog.com>
	 <20241021-adau1373-shutdown-v1-2-bec4ff9dfa16@analog.com>
	 <pj5clifybfwljpq3usfgca7cy54xpmzngdckyb53wc3u4lts53@gtm2mbuiiudw>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0 
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2024-10-22 at 08:06 +0200, Krzysztof Kozlowski wrote:
> On Mon, Oct 21, 2024 at 03:46:46PM +0200, Nuno Sa wrote:
> > Describe the adau1373 Low Power Codec with Speaker and
> > Headphone Amplifier.
> >=20
> > While at it, properly add a MAINTAINERS entry for ADI sound bindings.
> >=20
> > Signed-off-by: Nuno Sa <nuno.sa@analog.com>
> > ---
> > =C2=A0.../devicetree/bindings/sound/adi,adau1373.yaml=C2=A0=C2=A0=C2=A0=
 | 102
> > +++++++++++++++++++++
> > =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A02 files changed, 103 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/sound/adi,adau1373.yaml
> > b/Documentation/devicetree/bindings/sound/adi,adau1373.yaml
> > new file mode 100644
> > index
> > 0000000000000000000000000000000000000000..b2b5b2226ed7b354f2fb7871c1727=
2b347
> > 921fa5
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/adi,adau1373.yaml
> > @@ -0,0 +1,102 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/adi,adau1373.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +
>=20
> Just one blank line
>=20
> > +title: Analog Devices ADAU1373 CODEC
> > +
> > +maintainers:
> > +=C2=A0 - Nuno S=C3=A1 <nuno.sa@analog.com>
> > +
> > +description: |
> > +=C2=A0 Analog Devices ADAU1373 Low power codec with speaker and headph=
one
> > amplifiers.
> > +=C2=A0
> > https://www.analog.com/media/en/technical-documentation/data-sheets/ADA=
U1373.pdf
> > +
> > +allOf:
> > +=C2=A0 - $ref: dai-common.yaml#
> > +
> > +properties:
> > +=C2=A0 compatible:
> > +=C2=A0=C2=A0=C2=A0 enum:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - adi,adau1373
> > +
> > +=C2=A0 reg:
> > +=C2=A0=C2=A0=C2=A0 maxItems: 1
> > +
> > +=C2=A0 "#sound-dai-cells":
> > +=C2=A0=C2=A0=C2=A0 const: 0
> > +
> > +=C2=A0 powerdown-gpios:
> > +=C2=A0=C2=A0=C2=A0 description: GPIO used for hardware power-down.
> > +=C2=A0=C2=A0=C2=A0 maxItems: 1
> > +
> > +=C2=A0 adi,micbias1-microvolt:
> > +=C2=A0=C2=A0=C2=A0 description:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This property sets the microphone bias =
voltage for the first
> > microphone.
> > +=C2=A0=C2=A0=C2=A0 enum: [1800000, 2200000, 2600000, 2900000]
> > +=C2=A0=C2=A0=C2=A0 default: 2900000
> > +
> > +=C2=A0 adi,micbias2-microvolt:
> > +=C2=A0=C2=A0=C2=A0 description:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This property sets the microphone bias =
voltage for the second
> > microphone.
> > +=C2=A0=C2=A0=C2=A0 enum: [1800000, 2200000, 2600000, 2900000]
> > +=C2=A0=C2=A0=C2=A0 default: 2900000
> > +
> > +=C2=A0 adi,input1-differential:
> > +=C2=A0=C2=A0=C2=A0 description: This property sets the first analog in=
put as differential.
> > +=C2=A0=C2=A0=C2=A0 type: boolean
> > +
> > +=C2=A0 adi,input2-differential:
> > +=C2=A0=C2=A0=C2=A0 description: This property sets the second analog i=
nput as
> > differential.
> > +=C2=A0=C2=A0=C2=A0 type: boolean
> > +
> > +=C2=A0 adi,input3-differential:
> > +=C2=A0=C2=A0=C2=A0 description: This property sets the third analog in=
put as differential.
> > +=C2=A0=C2=A0=C2=A0 type: boolean
> > +
> > +=C2=A0 adi,input4-differential:
> > +=C2=A0=C2=A0=C2=A0 description: This property sets the fourth analog i=
nput as
> > differential.
> > +=C2=A0=C2=A0=C2=A0 type: boolean
> > +
> > +=C2=A0 adi,lineout-differential:
> > +=C2=A0=C2=A0=C2=A0 description: This property sets the line output as =
differential.
> > +=C2=A0=C2=A0=C2=A0 type: boolean
> > +
> > +=C2=A0 adi,lineout-gnd-sense:
> > +=C2=A0=C2=A0=C2=A0 description: This property enables the line output =
ground sense
> > control.
> > +=C2=A0=C2=A0=C2=A0 type: boolean
> > +
> > +=C2=A0 adi,drc-settings:
> > +=C2=A0=C2=A0=C2=A0 description:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This setting is used to control the dyn=
amic range of the signal. The
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device provides a maximum of three full=
 band DRCs with 13 entries
> > each.
> > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/uint8-array
> > +=C2=A0=C2=A0=C2=A0 oneOf:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - minItems: 13
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - minItems: 26
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - minItems: 39
>=20
> and maxItems?

Hmm, I had the idea that if maxItems was omitted, then it's the same as
minItems? Because that's the intent... We can either have an array of 13, 2=
6 or
39 entries.

>=20
> > +
> > +required:
> > +=C2=A0 - "#sound-dai-cells"
> > +=C2=A0 - compatible
> > +=C2=A0 - reg
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +=C2=A0 - |
> > +=C2=A0=C2=A0=C2=A0 #include <dt-bindings/gpio/gpio.h>
> > +
> > +=C2=A0=C2=A0=C2=A0 i2c {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #address-cells =3D <1>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #size-cells =3D <0>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 audio-codec@1a {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 compatible =3D "adi,adau1373";
>=20
> Messed indentation.

WIll fix. Normally my IDE handles this pretty well...
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 reg =3D <0x1a>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 #sound-dai-cells =3D <0>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 powerdown-gpios =3D <&gpio 100 GPIO_ACTIVE_LOW>;
>=20
> Extend the example, you have like 10 unused properties.

Will do

Thanks!
- Nuno S=C3=A1

