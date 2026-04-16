Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DEF396B63
	for <linux-sound@vger.kernel.org>; Thu, 16 Apr 2026 12:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776343508; cv=none; b=EaZ2O63AwkwY0sqzRlzJ+pF0V3e2MiRtQry3dE2ObmQ7DnW6xJvAiLHNCcSVqyOYtu17KWFfQ+LCZQF/NMLNCTDloNKuhGe3Qw9kjSfjHVa7IEt4Z3p1HHaEiNGUm3AXLGTl/3bHbvpPFKqAR9WKvSMcWPGs3l5qiPiivGenyrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776343508; c=relaxed/simple;
	bh=4kn9I0bcpQj2uVpf1c/P1i5ST8RdY7n9EFWCzmeUKtc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VwU1vaKwavAqSaTZ6jYS6HkfM8RgUnSSH3+DwdK5QwDgLu9a6rXKiii7aRAtibz058YGyI/6APV4hg9DvsSbGekfWCDjbShE7ehdqyieBaNziWyYO/YP9baWgylh3lULw8+LqB7U5NxCza1Qb5WdmKUfNa0VkDlBtM41NPHU0rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-60579e72ff9so396789137.1
        for <linux-sound@vger.kernel.org>; Thu, 16 Apr 2026 05:45:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776343506; x=1776948306;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y6Trmvc791/1rDJLy3WyaJKC+o+3NUld8T5eNLrCZnc=;
        b=ZFwa+CyvaRD2XdYilNFSyLjI/ugMGwPBMrvxpcn0tAdqQVVs5XYw9m2QCpBC9Gx72z
         IsbMxI00ndwcLYdrhqCEYcjXKFbPHQuJ19RlhRhB76zX2oVHh/zHOgmpw02TjPFy5y3p
         Hva/l7R3vb32xDxxYTpkrA3Hf7ogmSiJx+ppNkRwEO0Q/xiAmxkZ8S5CSI0DsUxaLOF9
         j4tBcBgbDFvaUC2u4HXzNPlwgm376+ETU2X2+ulu9RqyVXxgyg7KOyZ3NhsHz67ZG0x2
         ktJBxUdkp44xRUqZGfhsFyRcoUu36uHMWEI7Ldeq/yOiHEu+ZY8ibbd8FxFsCvXuq+6v
         9R7A==
X-Forwarded-Encrypted: i=1; AFNElJ/83lADXtK5RixxYRYY68nEWKGVxEZYddJ/M0K36uBw6t44oExIlBFFthJ5EhOSaHht/202lokC9OLbLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwO0HpVW0XI/7f91+lXPagm2BxI5bDtc+1IxZ9x0V1s1QkNZmMj
	RX4L23ewApmE8NSXm44U3jIu01O2cMnhdvyUV9MoG1/PPfwqMVg6BtcS8sWgDK+1
X-Gm-Gg: AeBDieuZiEeUa+0uVRK5QNMqUilUrKnrz4ILlvbI8BJh5Mg/5XkwT6VcRKU+Q9uBnPU
	uknsM3Zes2zpJhzY3/kfP2SieDzsN0dLDB58sZUzaxiN3ipzkA/bcyfe4SxCEQa3B9mQLb6y7IS
	ah8B6OaAOEjj9VBqK71giwlDBczFpTRsmX88ht5Vj9i7P1pgII2RcFW95MUgb/u8okzfukPjel0
	yaV/7UzcVGImkF6RlPitp6rQczuV+S/8nlFeMgcG7w8hUz3zNBS6JAgj/3vYgnQTjliwbZ3xORM
	Xnj3gt4RPGEMfjqm+ktfsrcFaBLo48y32NW3y3xQRyTe9c/oIebi2Qx7esPEDOORgAbB9xdXAej
	ZA9IqF1eysAJIWned/DYpuBXQqKyku8r0WdZGZ9FAAAtlJgkYKtGDMdVr28Rb82YXDsHDR8h6Lp
	Wm5hCGkmnlZO9cXTePygxTuODHVrUJqogFqUeKXtI4ycqqaPrrCKqMeSIdAWqk6fhdx35OIuI=
X-Received: by 2002:a05:6102:f0e:b0:608:cdd9:2bcd with SMTP id ada2fe7eead31-613bcc516b0mr1301767137.15.1776343506302;
        Thu, 16 Apr 2026 05:45:06 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-958656c0b4dsm2176075241.10.2026.04.16.05.45.06
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 05:45:06 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-610f4cf6ddcso457295137.1
        for <linux-sound@vger.kernel.org>; Thu, 16 Apr 2026 05:45:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ905qoGL1w7YT1JF9WIkP+vM5W//DzPkWM2gSfn2Wj70UNyneEjsp0TIbZBfLt69t1aaDfJzP70b6LjsA==@vger.kernel.org
X-Received: by 2002:a05:6102:3584:b0:600:d0f:bacf with SMTP id
 ada2fe7eead31-613bc3401cdmr1332642137.11.1776343505953; Thu, 16 Apr 2026
 05:45:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413100700.30995-1-phucduc.bui@gmail.com> <20260413100700.30995-7-phucduc.bui@gmail.com>
 <20260414-funky-sincere-polecat-20b0bf@quoll> <CAABR9nEKGSRNp=eK=ZHf6-MNsj=6cDCy1YdbzSPrHyuc3Ux0Ow@mail.gmail.com>
In-Reply-To: <CAABR9nEKGSRNp=eK=ZHf6-MNsj=6cDCy1YdbzSPrHyuc3Ux0Ow@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Apr 2026 14:44:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVPbcz4rF8ojEcvxp1NaM2mbQ2o+HZLwnnjNnX8uHf4HA@mail.gmail.com>
X-Gm-Features: AQROBzAlwTEokj2EdisJZZId_dsgmifb7t182C9EYzjoqr7qTm3MDCvnELzLUhU
Message-ID: <CAMuHMdVPbcz4rF8ojEcvxp1NaM2mbQ2o+HZLwnnjNnX8uHf4HA@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] ASoC: dt-bindings: renesas,fsi: add support for
 multiple clocks
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, kuninori.morimoto.gx@renesas.com, broonie@kernel.org, 
	lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	geert+renesas@glider.be, magnus.damm@gmail.com, perex@perex.cz, 
	tiwai@suse.com, linux-sound@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Bui,

On Tue, 14 Apr 2026 at 12:41, Bui Duc Phuc <phucduc.bui@gmail.com> wrote:
> > Flexible is not allowed. Provide reasons for exception.
>
> I understand and will remove this approach and replace it with
> explicit valid clock combinations.
>
> > This goes to the "clocks:"
>
> Understood, I will move the description to "clocks".
>
> > > +    minItems: 1
> > > +    items:
> > > +      - const: own
> > > +      - &fsi_all_clks
> >
> > I don't understand this syntax.
>
> Understood, I will drop the YAML anchor and use explicit constraints instead.
>
> I will update it to the following structure:
>
>   clocks:
>     description: |
>       Clock driving the FSI Controller :
>       - "own": Main FSI module clock (must be first and always present)
>       - "spu": SPU bus/bridge clock. On R8A7740, this clock must be
>         enabled to allow register access as the FSI block is connected
>         behind the SPU bus.
>       - "icka" / "ickb": CPG DIV6 functional clocks for FSI port A/B
>       - "diva"/"divb": Internal FSI dividers for port A/B used for
>         audio clock generation
>       - "xcka"/"xckb": External clock inputs for FSI port A/B
>         provided by the board
>     minItems: 1
>     maxItems: 8

'move the description to "clocks"' means:

    clocks:
      minItems: 1
      items:
        - description: Main FSI module clock
        - description: SPU bus/bridge clock [...]
          [...[

>   clock-names:
>
>     minItems: 1
>     maxItems: 8

and:

    clock-names:
      minItems: 1
      items:
        - const: "fck"
        - const: "spu"
          [...]

But this imposes a fixed order, and would prevent optional
clocks in the middle of the list.

So you may be better off using a similar description like in
Documentation/devicetree/bindings/serial/renesas,scif.yaml

    clock-names:
      minItems: 1
      maxItems: 8
      items:
        - fck # Main FSI module clock
        - spu # optional SPU bus/bridge clock [...]
        - icka # optional CPG DIV6 functional clocks for FSI port A
        - ickb # optional CPG DIV6 functional clocks for FSI port B
          [...]

>
> allOf:
>   - $ref: dai-common.yaml#
>   - if:
>       properties:
>         compatible:
>           contains:
>             const: renesas,fsi2-r8a7740
>     then:
>       properties:
>         clock-names:
>           oneOf:
>             - items:
>                 - const: own
>                 - const: spu
>             - items:
>                 - const: own
>                 - const: spu
>                 - const: ickb
>                 - const: divb

+ the above making it stricter.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
