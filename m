Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BE42264A9
	for <linux-sound@vger.kernel.org>; Fri, 24 Apr 2026 06:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777011882; cv=none; b=ZPb5iFv3pyp0zjDhiOjSn+E5BWDB1auTf2El7q8Sxo3JecuujZPEiUZeSXawYspvjeGxLRsU2aIii03YZ1sYs0dcSOiMVwguUV9hl4jfGjzr0ivsqQtalz/HZjpLuDYaLYh9VfA8R1vNqSjLv9xPqJVjhUFUnn0SJOf1fWQZfXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777011882; c=relaxed/simple;
	bh=jWnKWFsq2UQMYrWu/2lPXunCsMi2nCGVKHLymQhz4/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KdPRfH9uYxvL0TF0nMux5zXzw1Ty6i5qjvfy3R9q3ZwtLtfembgPZ8+3XLolVEIui6XioBetINn6CvBe8p0iSbba2vH2EJKdQ3I7hS46frOt5yBe/GFIfNXAVrBu/BTqH0tzYjhES+baOn0NSFBtF50DhV3g2ICP6sBD98oBmVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-56d9ed609d2so2232426e0c.1
        for <linux-sound@vger.kernel.org>; Thu, 23 Apr 2026 23:24:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777011880; x=1777616680;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FapzwhdvoGXDd8qZ19lMZ3BT1g7fv1HHVzqpUQuOKIY=;
        b=UOdByKETFMpuOI71hUijwIMXxAdk4kvaUWPv+3s/NKLZinDwvaInR3gh/kEF6VCqeg
         C25zkcQgNNRCYjzMoBREUJcQYxTs74yqKjQOwEjkTP4cJ7pOlDB7NYcV7Bzh5f6IxWRu
         zrs3ZB6QEyp3HYvi14xkywomCqBMmF8oC9R9sgyhlvVPdYeBuGeaDytWa/TDKbAm33d1
         DCvkAJNmoh5XoaVzfWoqFIda+vO4CUQUukvXwk+R6T2BKRd7GyyANKUX5B0SCU7qGcaq
         viSUIvc2O/Kk3a8to3H9WkwsNR3mVyjMfyUXEfLp6Jj1o+JHIn2KMvUuGm4OVlM6KaPM
         CmRg==
X-Forwarded-Encrypted: i=1; AFNElJ/Xbc3yyxut4YuKWrHLJEznQywRne/uNQIDUhGsiwWnw2eQW6EnWsY7R1y7YXtRAo2A0+nSgd0KD0yUgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzylKHyU4mi7C2HfiaCU+7114lUpmGo+LJQ+LPLi2Gc1kCYDSE
	qRYkJl//augfINW5LaZcZLZ+wm/Zoyi51nNIEUynyUdvRAcMIyuliTU3TLXzpRQlsxY=
X-Gm-Gg: AeBDiesHS5fJZrPZt+BnZNnfa4nUiTeRkYeJBKLLcWsYuwTMD+3s4CiEQ9J3RN7FE8/
	D7pCFmJUA2iBc/h35bZbd8JrK67UAaBSYtJISuOVqUjfSHVQDAWCiZeAgvrf9LweXrV4szabmhd
	uAfYRHdyM9LyoM28+7m1obMdCoEia61CAWIg8ARYXSy4P6g4PjdbwbehuKgpDKOUQlsTXwOduyC
	QO44MsZXpwcp6yO5Nase+p2mf2e5QanvguongR9d7oI92mJpkDvqvBdFI33J6bP90KphU/wKAAq
	TdajB+cihpmg2SRvsliGHxgmT//4OERU2AJ6xIdHoiwHme1SyoyzL1Pc5w8H/AbFYaDJeVszB9T
	Ykc0VK2syI8ur6M4sfe/68tVt+y/VgvK7j1lHlVxn4twNudkzlcHERgNJTSgdNZ0a31UMzilW/7
	lObfltB8v6u+ApweDrrVQg9JJHeyQhbIq0xVYBKsRm76YA0I7DJvrZdpC16Al1+9wmTOOYlmOLo
	48=
X-Received: by 2002:a05:6122:e144:b0:566:2711:d8ab with SMTP id 71dfb90a1353d-56fa585db6emr15780839e0c.6.1777011880081;
        Thu, 23 Apr 2026 23:24:40 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56fa933a54dsm12855641e0c.16.2026.04.23.23.24.38
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 23:24:38 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56eec951db1so2217442e0c.3
        for <linux-sound@vger.kernel.org>; Thu, 23 Apr 2026 23:24:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8mq7g4bQAAMjm9eXEey86+U5zVDW5LVVTxQq9uAwv5DHL6qN537LN03wqFXiDLeK5h+/+9uvumRFcwCA==@vger.kernel.org
X-Received: by 2002:a05:6122:f8c:b0:56f:6cc0:681e with SMTP id
 71dfb90a1353d-56fa57db05dmr15358381e0c.1.1777011877979; Thu, 23 Apr 2026
 23:24:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260415124731.3684773-1-john.madieu.xa@bp.renesas.com>
 <20260415124731.3684773-2-john.madieu.xa@bp.renesas.com> <20260417-energetic-practical-frigatebird-5b93ad@quoll>
 <TY6PR01MB17377C02109A651FBCB31CFDBFF2B2@TY6PR01MB17377.jpnprd01.prod.outlook.com>
In-Reply-To: <TY6PR01MB17377C02109A651FBCB31CFDBFF2B2@TY6PR01MB17377.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 08:24:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUnbxjbj6ahebyH8VKg5RJEjoZ=bRNRv85EHyYC=Fuvow@mail.gmail.com>
X-Gm-Features: AQROBzBh__-xpGTZuPSCZvvq_Mj1-8UpRxwY9s8nlkbsDmTamvZ85Y60nHWYt7M
Message-ID: <CAMuHMdUnbxjbj6ahebyH8VKg5RJEjoZ=bRNRv85EHyYC=Fuvow@mail.gmail.com>
Subject: Re: [PATCH v5 01/14] ASoC: dt-bindings: sound: Add DT binding for
 RZ/G3E sound
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, John Madieu <john.madieu@gmail.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, "magnus.damm" <magnus.damm@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, "Claudiu.Beznea" <claudiu.beznea@tuxon.dev>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Fri, 24 Apr 2026 at 03:39, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> > From: Krzysztof Kozlowski <krzk@kernel.org>
> > On Wed, Apr 15, 2026 at 12:47:18PM +0000, John Madieu wrote:
> > > Add a standalone device tree binding for the Renesas RZ/G3E
> > > (R9A09G047) sound controller.
> > >
> > > The RZ/G3E sound IP is based on R-Car Sound but differs in several ways:
> > > - Uses unprefixed sub-node names (ssi, ssiu, src, dvc, mix, ctu) instead
> > >   of R-Car's rcar_sound,xxx prefixed names.
> > > - Supports up to 5 DMA controllers per direction, allowing multiple DMA
> > >   entries with repeated channel names in SSIU, SRC and DVC sub-nodes.
> > > - Has 47 clocks including per-SSI ADG clocks (adg.ssi.0-9), SCU clocks
> > >   (scu, scu_x2, scu_supply), SSIF supply clock, AUDMAC peri-peri clock,
> > >   and ADG clock.
> > > - Has 14 reset lines including SCU, ADG and AUDMAC peri-peri resets.
> > > - SSI operates exclusively in BUSIF mode.
> > >
> > > These differences make the RZ/G3E binding incompatible with the
> > > existing renesas,rsnd.yaml, so it is added as a separate standalone
> > > binding with its own $ref to dai-common.yaml.
> > >
> > > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.
> > > +++ yaml

> > > +  "#sound-dai-cells":
> > > +    enum: [0, 1]
> >
> > Why is this flexible? That's a defined device meaning you have one XOR
> > more DAIs. Not "1 and more".
>
> The IP exposes ten independent SSI interfaces, and a board can
> reasonably wire either a single SSI to one codec or several SSIs
> to several codecs. The cells value follows that wiring: 0 when
> the phandle is `<&rcar_sound>` for the single-DAI case, 1 when
> it is `<&rcar_sound N>` selecting a specific DAI index.

How does this work if both types of wiring are present?
e.g. SSI1 wired to one codec, and SSI2-4 wired to several codecs?

> > > +  clock-names:
> > > +    items:
> > > +      - const: ssi-all
> > > +      - const: ssi.9
> >
> > Use consistently -
>
> Agreed, I'll switch to hyphens for all indexed entries
> in both lists (ssi-0..9, src-0..9, mix-0..1, ctu-0..7,
> dvc-0..1, adg-ssi-0..9).
>
> > > +      - const: ssi.8
> > > +      - const: ssi.7
> > > +      - const: ssi.6
> > > +      - const: ssi.5
> > > +      - const: ssi.4
> > > +      - const: ssi.3
> > > +      - const: ssi.2
> > > +      - const: ssi.1
> > > +      - const: ssi.0
> > > +      - const: src.9
> > > +      - const: src.8
> > > +      - const: src.7
> > > +      - const: src.6
> > > +      - const: src.5
> > > +      - const: src.4
> > > +      - const: src.3
> > > +      - const: src.2
> > > +      - const: src.1
> > > +      - const: src.0
> > > +      - const: mix.1
> > > +      - const: mix.0
> > > +      - const: ctu.1
> > > +      - const: ctu.0

Why are these listed in descending order...

> > > +      - const: dvc.0
> > > +      - const: dvc.1

... and these in ascending order?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
