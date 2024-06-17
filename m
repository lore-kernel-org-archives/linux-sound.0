Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62BB73466
	for <linux-sound@vger.kernel.org>; Mon, 17 Jun 2024 14:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718633092; cv=none; b=iJ4VCjm4nxjyoiJGhX13XwV8Y46jJsmLn+BTozGvzlCVZOyh541pVQ3gdFm0NSw7aPfOj/G0ABr5MK10XGoEkgfBqgoNiHC+QVwbsD25+5+yPj9bF0ztZDHWmJgW/VUDkZx7/TRIVtE/k1jC6pbXIS2dZgDnKO2UXVu/4qAAcyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718633092; c=relaxed/simple;
	bh=Oas3OL/b/DriXAm/mtEfV6t2J9RXQPvR4MOBk+IH9ug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dJAb7k+RKGOimSJ8E2E9eeguPkyOSfNYzP3+EhadgrkAyjm6lBCA4R4qy8qOzLFHx4+ndvws7vKO/eg5CzmxY0oFzlAcTjTDB8ymtTTITWQSA98vY+Bkj0NPRE7L4qPGhkdFwrh7E1LxlSC+Wm+qJNPa1Yv+gES55pjboKwu+Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com; spf=pass smtp.mailfrom=timesys.com; dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b=RgR4RvD2; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timesys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b="RgR4RvD2"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6b081c675e7so23673806d6.1
        for <linux-sound@vger.kernel.org>; Mon, 17 Jun 2024 07:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718633090; x=1719237890; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NuiBnTAk1GdD7Nn+nX9o9bL0mw0aUr07eq17+hCN0VA=;
        b=RgR4RvD25MqKkP5yHsza/YCgd4DnnH6w6F0W51CE1jcyikrZLCZ1LEvRkoBarAXqit
         G5fmnPbgEXmlo0KJ3H3WRhhswMbOvbkc2OChEJk/3+x4hDEbkODg4BiSbJheDwGv/qpI
         uuyjlksk4DSYL/npr/REK7HtGTz9U8O5aTZx5PSxUw9w5nC568kgxyVVKwJCjJQAloH5
         m7CQVXoYeIMNK1idWmxO9hbwMHQk8aJq82JAIASGQXyN9qr6sp1B6LAHSs7qP+hxttbx
         K43ipEwTAus3mCyWaQGwMGZtTU0lqwFDE4g0kpxyhHqI75BzpkKxcqMtAvlJHdL1S8Ae
         0Q7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718633090; x=1719237890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NuiBnTAk1GdD7Nn+nX9o9bL0mw0aUr07eq17+hCN0VA=;
        b=eJk7f0TM+9ACSCcxwjea37rdx6qp7C/wbamw5eOCLborLEgSzN2P2uQ80MmgLOXdXR
         EO1Cf36R3Hq8imOPotj3araBOg8B6s1WAN/rOlPhUvmcHlDdbDbKeOKYzaNyXRM7zkKr
         c9S3Fjmwh44qNJnLEbOR4MgCzhbRgsK70D+JCiSIKvmw+BufWw9We1We1vreX2DPAZAb
         kyEteFmGzWAduYLOijM39DtaRcAyh8oB0HTA9i2Y35zWn0MYTjvSYfz5dEm5cUZ8H2H6
         J3pjSZ/bhQ2oY3sYAIEoZRcPz/X7Psf1yqWCaxbRMU6xkXwPMAGx6eNuwv0MKaaiQFUx
         gH5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXY8RNi0n3c5XZwhnb4zNuOeJhpl8tZ3/jaxJqfpLezOCl2GOur9xagVUELWe6bRvwGfEQw8n7c2pNGw2eW8WjzE7gsDqaJbfpgRLg=
X-Gm-Message-State: AOJu0Yx+z7KWKecNptGl+YJW4Ys7zjcMibBIS8nexnuq2dTeLr/9aDXw
	D2VwhchRGqbBvN1g7/iIU1nx1bOMC6+aXHnoxvhhwoKo0sH6F48LAipJwA/impLuMv+lXCGglL8
	6NQijjbnrLoY3ZFy5lOMkOEREWFmq890b9iLAxA==
X-Google-Smtp-Source: AGHT+IHgt8vcIdjEnWNHVtl+wLq4vY15nqjqT8vHj/DvbcH6/AFoCHKztbbB0oihPAkdtwCT0DqCv4v4/vIp7abnqNw=
X-Received: by 2002:a0c:db01:0:b0:6b0:6dba:c947 with SMTP id
 6a1803df08f44-6b2afc8d656mr92366246d6.18.1718633089663; Mon, 17 Jun 2024
 07:04:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
 <20240614163500.386747-1-piotr.wojtaszczyk@timesys.com> <20240614163500.386747-2-piotr.wojtaszczyk@timesys.com>
 <83cbf43e-c927-449f-8b7e-5c8d3ee8cece@kernel.org> <CAG+cZ06EeXUDiLsDXkz+6EHqJwpvv2MWwfpvB8AYw0=ZhUkTfQ@mail.gmail.com>
 <83a45f7c-d90b-44d3-b57e-9dad21045e27@kernel.org>
In-Reply-To: <83a45f7c-d90b-44d3-b57e-9dad21045e27@kernel.org>
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Date: Mon, 17 Jun 2024 16:04:38 +0200
Message-ID: <CAG+cZ06kzikieaD_JCBybwWk8XKZQjJxa34Cg4QHxrxpT+j0eA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] ASoC: dt-bindings: lpc32xx: Add lpc32xx i2s DT binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, Russell King <linux@armlinux.org.uk>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, "J.M.B. Downing" <jonathan.downing@nautel.com>, 
	Arnd Bergmann <arnd@arndb.de>, Chancel Liu <chancel.liu@nxp.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 2:14=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 17/06/2024 11:33, Piotr Wojtaszczyk wrote:
> > On Sat, Jun 15, 2024 at 12:01=E2=80=AFPM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> >> Do not attach (thread) your patchsets to some other threads (unrelated
> >> or older versions). This buries them deep in the mailbox and might
> >> interfere with applying entire sets.
> >
> > I'm sorry about that, it won't happen again.
> >
> >>> +  dma-vc-names:
> >>
> >> Missing vendor prefix... but I don't really get what's the point of th=
is
> >> property.
> >
> > Is "nxp,lpc3xxx-dma-vc-names" acceptable?
>
> No, because it does not help me to understand:
> " what's the point of this property."
>
> >
> >>
> >>> +    $ref: /schemas/types.yaml#/definitions/string-array
> >>> +    description: |
> >>> +      names of virtual pl08x dma channels for tx and rx
> >>> +      directions in this order.
> >>> +    minItems: 2
> >>> +    maxItems: 2
> >>
> >> What part of hardware or board configuration this represents?
> >>
> >> It wasn't here and nothing in changelog explained it.
> >
> > That's information which DMA signal and mux setting an I2S interface us=
es.
> > It's a name (bus_id field) of platform data entry from phy3250.c in
> > [PATCH v3 3/4].
>
> platform entries from driver do not seem related at all to hardware
> description. You know encode driver model into bindings, so obviously no-=
go.

In this case platform entries do exactly that, they define which dma
signal number is
routed to peripherals in LPC32xx. They describe hardware capabilities
of the pl08x dma
and which AHB bus the dma is connected to. This was carried over from
linux versions
before DT was introduced.

>
> > It's used by snd_soc_dai_init_dma_data() in [PATCH v3 4/4] to give the
> > dmaengine a
> > hint which dma config to use. The LPC32xx doesn't have yet a dmamux dri=
ver like
>
> and if I change driver platform data to foo and bar, does the DTS work? N=
o.

They shouldn't change the same way as expected dma-names shouldn't change.
Lots of drivers expect the dma-names to be "rx", "tx"

>
> > lpc18xx-dmamux.c therefore it still uses platform data entries for
> > pl08x dma channels
> > and 'SND_DMAENGINE_PCM_FLAG_NO_DT | SND_DMAENGINE_PCM_FLAG_COMPAT'
> > flags in the devm_snd_dmaengine_pcm_register().
> > Typically instead of this platform data you would use regular 'dma'
> > and 'dma-names' if it had
> > proper dmamux driver like lpc18xx-dmamux.c
>
> Exactly. Use these.

Then I need to write a lpc32xx dma mux driver, device tree binding for
it and adjust the
LPC32xx I2S driver for it. Is this a hard requirement to accept this
patch set for the
legacy LPC32xx SoC?

>
> >
> >>
> >> Drop.
> >>
> >>
> >>> +
> >>> +  "#sound-dai-cells":
> >>> +    const: 0
> >>> +
> >
> > The "dai-common.yam" doesn't declare a default value for this so
>
> Where is my comment to which you refer to? Please do not drop context
> from replies. I have no clue what you want to discuss here.
Well I didn't remove the context, you said:
"
Drop.
(...)
+  "#sound-dai-cells":
+    const: 0
"
So I'm confused whether the "#sound-dai-cells" should be in the dt
binding or not.

--=20
Piotr Wojtaszczyk
Timesys
