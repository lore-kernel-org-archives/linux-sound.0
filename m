Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE75387362;
	Fri, 10 Apr 2026 07:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775807573; cv=none; b=sONZdf8rUhPkOFvxOyQiTuouiMLeEX91As6/MhyHEnID0RgiUrQHFu/A/6AS7mw8dZQ+5+M/fWR8P7zPF5CPH9c0+G7Pyw/CZcHFLxcypyD6mxtnF/pNOvf5ipc25zyoErLkyoEfpB8mFbcUq1g8sVcDX+8yX2JLqpNw2aX3oKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775807573; c=relaxed/simple;
	bh=On3sPjQdkSCY/QGac7HCv94DWl2MdNb+QTAfi7v3M8s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VERiW8YqmruiQ77EccWjvTIvVIiJLEiEwShdU16hyUfKcIzxBlx7r4ELMFCnY+i/LOJdF3eD1DMm3BN4hrx1rZnjtZYYlSWNd4Nwhf0UQL+T6oKwrAkkfYlp40XJKaUrtDpyz88gPEZK/o2WHv05Hg/V+bR84dyvwmQukPYmKIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=xWa5dGPv; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="xWa5dGPv"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1E0364E429A3;
	Fri, 10 Apr 2026 07:52:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E553D603F0;
	Fri, 10 Apr 2026 07:52:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DB7971045001D;
	Fri, 10 Apr 2026 09:52:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775807568; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UpCgt8IIGYMIiNdVzfsPwqSVZXoCi5LgZgi/lwSze/0=;
	b=xWa5dGPvDsIS5bAGiB/IQYT3wiJrhNBulYPGSeasuhAhXH/t3kRHmZlrrTba6AI+EiJ+D0
	7jZmNG4vjtESMypwGi7nGl9Sw+cvl+fmW+IYKzRfiYpqXXF7EfzemgHIZjDmjcIPiVXDTi
	+kqP/46jaOJN2l17JSrMsGrYki/loSXAEpDTNM9bFHVGuHjI61wb/cJS2MRXK5VzQ+mc8f
	vKhCugRdYnq9+0eOXStS04GrwjsRa9CKjTnKUvh+hV9hTjnEjLTLFmNvFu8VBk4331wafU
	sV5wnNn1e34kTvby8BP/ayrWP7WXztL9qjOd+iMMbW+Q/Be72Bj4RKOJozTKAQ==
Date: Fri, 10 Apr 2026 09:52:42 +0200
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
Message-ID: <20260410095242.0826fe7e@bootlin.com>
In-Reply-To: <CAL_JsqK4SHQS6MciQpLSrGWo2knqs7-eB3yoAv2J54bSfW-Lxg@mail.gmail.com>
References: <20260330101610.57942-1-herve.codina@bootlin.com>
	<20260330101610.57942-3-herve.codina@bootlin.com>
	<20260408122901.GA42727-robh@kernel.org>
	<20260408190932.0ab936b0@bootlin.com>
	<CAL_JsqK4SHQS6MciQpLSrGWo2knqs7-eB3yoAv2J54bSfW-Lxg@mail.gmail.com>
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

On Thu, 9 Apr 2026 10:00:55 -0500
Rob Herring <robh@kernel.org> wrote:

...

> 
> > > If not, then gain-range could be expressed using gain-points instead.  
> >
> > Do you have in mind something like the following?
> >   gain-range = <0 (-300)>, <3 600>;
> >
> > defining the range from -3dB to +6dB with GPIOs value 0 for -3dB and 3 for +6dB.  
> 
> Yes, but since you can have reserved values, that won't work.

In that case gpio-points can be used.

The other solution will be to allow multiple ranges:

   gpios    Gain
   0b000 -> -6dB
   0b001 -> -3dB
   0b010 -> 0dB
   0b011 -> Reserved
   0b100 -> +3dB
   0b101 -> +6dB
   other -> Reserved

This could be described as
  gain-ranges = <0 (-600)>, <2 0>,
                <4 300>, <5 600>;

As a side note, this will probably add quite a lot of complexity to handle
multiple ranges in the driver. If too complex, the driver will handle only
one range and returns -ENOTSUPP if multiple ranges (more than one) are used.

Is that something acceptable?


...
> > > > +    description: |
> > > > +      List of the gain labels attached to the combination of GPIOs controlling
> > > > +      the gain. The first label is related to the gain value 0, the second label
> > > > +      is related to the gain value 1 and so on.
> > > > +
> > > > +      With 2 GPIOs controlling the gain, GPIOs value can be 0, 1, 2 and 3.
> > > > +      Assuming that gain value set the hardware according to the following
> > > > +      table:
> > > > +
> > > > +         GPIOs | Hardware
> > > > +         value | amplification
> > > > +         ------+--------------
> > > > +           0   | Low
> > > > +           1   | Middle
> > > > +           2   | High
> > > > +           3   | Max
> > > > +         ------+--------------
> > > > +
> > > > +      The description using gain labels can be:
> > > > +        gain-labels = "Low", "Middle", "High", "Max";  
> > >
> > > Do we need to allow these to be anything? It's going to get hard to come
> > > up with 2^32 names.  
> >
> > Well, "Normal" / "Boost" can make sense on some hardware.
> >
> > I don't think we need to restrict labels to a list of known label here.  
> 
> As long as the names are meaningless to software.
> 
> >
> > Of course 2^32 names is obviously a lot. What could be the limit?  
> 
> I would guess at 8 or more, it's just going to be gain1, gain2, etc.
> or something similar constructed from the gain values.

I suppose that gpio-points or gpio-ranges are going to be used instead
of labels at 8 or more.

With a lot number of GPIOs involved, I am not sure that using labels makes
sense even from the hardware point of view.

The 3 possible descriptions (gpio-points, gpio-range(s), gpio-labels) are
mutually exclusive. Depending on the hardware designed, one of them has to
be chosen.

Of course, you can describe 256 labels but does it make sense in that case
with alternative available ?

> 
> > ...
> >  
> > > > +
> > > > +    /* A mutable amplifier without any gain control */
> > > > +    amplifier4 {
> > > > +        compatible = "audio-gpio-amp";
> > > > +        vdd-supply = <&regulator>;
> > > > +        mute-gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;  
> > >
> > > This case is just simple-amplifier...  
> >
> > No, simple-amplifier uses 'enable' and not 'mute'.  
> 
> Yes, I know...
> 
> > We can have the amplifier enabled ('enable' GPIO active) as it is
> > used and a switch driven by an other GPIO to mute / un-mute the
> > amplifier output.  
> 
> But you have no 'enable' GPIO here. To me, enable just looks like
> inverted mute. If there's some electrical difference, I can't tell
> what that is from either binding.

A known physical component handle by simple-amplifier is the dio2125.

According to its datasheet:
  Pop-free power up is ensured by keeping the EN (shutdown pin) low during
  power down. The EN pin should be kept low EN pin high to achieve pop-less
  power up

The 'enable' gpio should be used when power is established or remove.

The mute gpio handle an output switch:

           +---------+   op-amp output
           | dio2125 +-------------------o
           |         |                        o---- Amplifier feature output
 enable ---+         |                ,--o  ^
           |         |                |     |
           +---------+                v     |
                                     GND    |
                                            |
 mute --------------------------------------'


The mute signal switches on/off the dio2125 output while the dio2125 is
active (powered uup) and so its enable pin is driven high.


I can add an 'enable' GPIO here to handle it in the same way as it is handled in the 
simple-amplifier (dio2125 use case).

> 
> I guess my point was that really we could deprecate simple-amplifier
> binding because this one can handle it and more. But I'm not
> suggesting we do that yet.
> 

Best regards,
Hervé
