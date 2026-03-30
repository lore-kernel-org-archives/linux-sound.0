Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253B8386425
	for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 18:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774896489; cv=none; b=HlIBEyRnxzbZNTePdrHZXlAdbB/rjaZ5ge1jKa43s+BGJ8mR4pzI1b6YARY6tH+Cbc7zrfH0Le63xRrkpa3X3cqpNbqzTaEkj6rt5na9vEixSWnhaX65ORHXV5VQzX3wop1SWUVVNUlMpLvtfO7e5N3nNqHisK47Jtd4+c7i5N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774896489; c=relaxed/simple;
	bh=PZJA8OYSHkcjEb6yeCr4bU8DRy/2gacrQ+n6Z6q9zPk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IKtT6XNp5zGQHn5qlIDI8Q2+Zmf6ljG6VLPulnIorH1hCGxEp570WBEftSwi+muls98mBeCU0IosoHy6tfv62wmsPyjObkAJX0f4wNs7j4LOdcx+gz7G6pKSkB9IKa50YOc4bWzxiEdZBgiNS2iELVyYHPFChaTRWzJfc7rj5RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56ccdd0044dso4163794e0c.0
        for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 11:48:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774896486; x=1775501286;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gmbdfERIdYVjSOaA8rBMP7lXVvFsi5yyzuqKEhnFPsQ=;
        b=BVjJm+8Ytg6RE36m1/hYsBnzFqt6Pq/VwUofDcNIJi8eLG1MZ5WAhxDtbKH5d+N6Af
         JzpTB6rCnb6sVnsdqCyS4tJ5/tyiDErvGHQGD7J7Iy1vOSDT8Rp1pWiRcZU4ChNWwTWd
         zPAReXwg5asdX8tdAIcRLp8m+GiJ2QhE7QzgtDzRplfAia3uFNVYvit9LY0xhTu6PChH
         QD1hBEXMlTGzJfO6aBU1EnXQRfOxN9SdOLcm1XBc3i4zYsXFhm95AWQd40aXi+pXwibt
         z2L69BDrh+44x4ROBgf/FM9b4/pgKcJt4P8reswspiQTaGWezdathEru6smGGxOKRULZ
         7d3w==
X-Forwarded-Encrypted: i=1; AJvYcCV0ZNAX4z6IYZ5zvmyvXl14h7UYCloUVzbTZAL4wKdobIYkXIOtnJEjN3o6u+KHjnHx91tXD6PUebPMVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCn1sqzBH7buqPLynmfi5DxYyEYbPgfRSwZ5HrMy4nBzp0EhSs
	EbVZcSUM+6A3p1MX5h8J5jEkE0uEnH9YfyM/W7LhYlfaX91x9+KrH/4oqhTtMQTa
X-Gm-Gg: ATEYQzyoKEP/EJu8Y9aYPJDVpOs5TnqyvlN5qPoBbcDGbEnuGP/jIUHkJ5wiwBTu57u
	pfWXZUJ2rBIGRAUlf1/vX8Hwfy9JgI0XDYquzAkkKeGDlw4Ib3zinITKS8JTJEozq7nCtNj+oDZ
	N1KK9iiiLmDbAEi3N4mMHHmIWwIqXAHIDfAWwvYp30MFXAE3AVr7kNtTAhjOqLAVh35z1J4N99s
	Gvgrj8xsqxubp08K1NDpddXBbGGeWEh8vEHmWNDbQY9bKgegBBJLelDtQ1kaNUBNqntMe2cM6Oq
	po5DsDPJtq9DEVtvTnBQWB/BvFmvjN8LWwDbYrB1H0qo37cLp816+w9tuvAiFvfJhcbnzZ7mbak
	LM52tztbgnXn7XjDjFnpD8lMhzXB9/bYNTd+ojS8VatInKtjZ5pTu9kb06a+XXYbg6dbfCAjuiq
	4OrtzTtxyvhWA5jZ3G/FgV1M7A9BbByfzEnY2Q/FCd7SIlCPMBO8kjrhbmctQT2Z4N
X-Received: by 2002:a05:6122:2983:b0:566:ec03:4683 with SMTP id 71dfb90a1353d-56d7bfc69f8mr406912e0c.2.1774896485992;
        Mon, 30 Mar 2026 11:48:05 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d589f9c0esm9379343e0c.9.2026.03.30.11.48.05
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 11:48:05 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56ccdd0044dso4163769e0c.0
        for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 11:48:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV9J4iO8UxUhAmNmYa6DAcO93Ttw0/d3M+/EreW6mzIZMB4EwQdHMwqP/Qzd20pL2D/K9gPclzn/sT2JQ==@vger.kernel.org
X-Received: by 2002:a05:6122:21a7:b0:56a:ed84:e2 with SMTP id
 71dfb90a1353d-56d7bf9a1a3mr395634e0c.1.1774896484928; Mon, 30 Mar 2026
 11:48:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319155334.51278-1-john.madieu.xa@bp.renesas.com>
 <20260319155334.51278-8-john.madieu.xa@bp.renesas.com> <20260320-peculiar-cat-of-acumen-c6f6b3@quoll>
 <TY6PR01MB173775E9970A41ED3A7FFF1DAFF52A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
In-Reply-To: <TY6PR01MB173775E9970A41ED3A7FFF1DAFF52A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Mar 2026 20:47:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW6Ac_=BugNJaqWnazdDsuzBB765jpzXt8fUasbypXFxg@mail.gmail.com>
X-Gm-Features: AQROBzBY2yW50P7_EhVQZxwFTstX-3Z9DxWPu0ijoIOHvrdSgZhFLZHzJwI06ec
Message-ID: <CAMuHMdW6Ac_=BugNJaqWnazdDsuzBB765jpzXt8fUasbypXFxg@mail.gmail.com>
Subject: Re: [PATCH 07/22] ASoC: dt-bindings: renesas,rsnd: Add RZ/G3E support
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, "magnus.damm" <magnus.damm@gmail.com>, 
	Thomas Gleixner <tglx@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, "Claudiu.Beznea" <claudiu.beznea@tuxon.dev>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	John Madieu <john.madieu@gmail.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, 
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Mon, 30 Mar 2026 at 17:40, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> > From: Krzysztof Kozlowski <krzk@kernel.org>
> > > RZ/G3E has a different audio architecture from R-Car Gen2/Gen3/Gen4,
> > > with additional clocks and resets:
> > > - Per-SSI ADG clocks (adg.ssi.0-9)
> > > - SCU related clocks (scu, scu_x2, scu_supply)
> > > - SSIF supply clock
> > > - AUDMAC peri-peri clock
> > > - ADG clock
> > > - Additional resets for SCU, ADG, and AUDMAC peri-peri
> > >
> > > RZ/G3E has 5 DMA controllers that can all be used by audio peripherals.
> > > To allow the DMA core to distribute channels across all available
> > > controllers, increase the maximum number of DMA entries in DVC, SRC,
> > > and SSIU sub-nodes so that multiple providers can be listed with
> > > repeated channel names.
> > >
> > > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

> > > b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> > > index e8a2acb92646..bc8885c4fa24 100644
> > > --- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> > > +++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> > > @@ -58,6 +58,7 @@ properties:
> > >            - renesas,rcar_sound-gen2
> > >            - renesas,rcar_sound-gen3
> > >            - renesas,rcar_sound-gen4
> > > +          - renesas,rcar_sound-r9a09g047     # RZ/G3E
> >
> > Do not use underscores in compatibles. Previously used wrong style is not
> > the excuse here, just like previously poor code, mistakes, bugs,
> > unreadable approches is not justification to repeat the same.
>
> Got it.
>
> > >    reg:
> > >      minItems: 1
> > > @@ -97,20 +98,22 @@ properties:
> > >
> > >    resets:
> > >      minItems: 1
> > > -    maxItems: 11
> > > +    maxItems: 14
> > >
> > >    reset-names:
> > >      minItems: 1
> > > -    maxItems: 11
> > > +    maxItems: 14
> > >
> > >    clocks:
> > >      description: References to SSI/SRC/MIX/CTU/DVC/AUDIO_CLK clocks.
> > >      minItems: 1
> > > -    maxItems: 31
> > > +    maxItems: 47
> > >
> > >    clock-names:
> > >      description: List of necessary clock names.
> > >      # details are defined below
> > > +    minItems: 1
> > > +    maxItems: 47
> > >
> > >    # ports is below
> > >    port:
> > > @@ -136,9 +139,17 @@ properties:
> > >
> > >          properties:
> > >            dmas:
> > > -            maxItems: 1
> > > +            description:
> > > +              Must contain unique DMA specifiers, one per available
> > > +              DMAC. On RZ/G3E, up to 5 for transmission.
> > > +            minItems: 1
> > > +            maxItems: 5
> > >            dma-names:
> > > -            const: tx
> > > +            minItems: 1
> > > +            maxItems: 5
> > > +            items:
> > > +              enum:
> > > +                - tx
> >
> > Multiple levels, multiple if:then: (further) - I don't find this binding
> > manageable/readable. You should split it, with common binding defining
> > common part of hardware or interface if there is such.
>
> I as you suggested, I'll split it. Just to double check, should I fix
> any bug found in there (like existing compatible strings having underscore
> separators) ? Or should I just split and make sure only new SoC support is
> bug free ?

You cannot just change existing compatible values, as they are part
of the DT ABI.

When you split RZ/G3E off into a separate file, please drop the
"rcar"-part[*] in its compatible value, and move the SoC-specific part
right after the comma.  Perhaps "renesas,r9a09g047-sound"?

[*] Disclaimer: I haven't read the RZ/G3E audio chapter yet.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
