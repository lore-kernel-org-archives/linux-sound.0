Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CE43FD126
	for <linux-sound@vger.kernel.org>; Thu, 26 Mar 2026 15:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774539276; cv=none; b=MezOzijkN4Km0m2tLmdTO7p+jEcJdm7QwzLvbQYPXLuC8p+rPwrrZVdvo8peJ2oRpSzRi/NuaflHv2PJh4WVlhfrQm07s7C4DbWoXBCLOMHtcGsyaNpExEhOT9cAfl4Wd5h1m3zLh9uMkqJ185DqfC5hC+ihl5y67voQ2Lz+DFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774539276; c=relaxed/simple;
	bh=peWwslY60X5deNxQgqJv7OYyoSx6v0JNvTUpeeVZ1q4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q1qG6eyINCnOqmjrbV3hx3dp6aQ7P8GWZ14RL/oazW3dxLA5nvDscX/5CHMwB07XxTSd2KPgiqoukmclYAakkW0C1FkEDCNN2QQZNr0uSLUhHNXmgXWKTZZThb2gPxHNvW96bTytOieIRDVjH1dQGWV3sgyi6iQXki+vyORz5Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56ce44a204dso843390e0c.1
        for <linux-sound@vger.kernel.org>; Thu, 26 Mar 2026 08:34:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774539274; x=1775144074;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ICY5En3i4NzNQi5qrag5c9s0SZbURVLCotK2DvpExx4=;
        b=Wcw3Cuk9/cuUx5rboSW+tQTGsIMA4dqrDL43oJ0Y855Dr5SfIRWG24bMFB8SKTFDx4
         zpzRFzATEZ0K3nTMmZ5a8xsDGFFIVZATOyfrK9yuaOKa2Odjc8lmVFRB7gNOXvLvYN3B
         Hxap2O8Rfr8XSbcwSbb3OvS5daTC0aOJ3dm6a95CwtywVL0BOFoamwjt8lHE+drKc22O
         Q2ho/Ibnyqvb6XuUZ5kpkvRPyhs8cFdnOEZPdh0xgJCSV0yy/zDY711jO+7DQEjk6cFJ
         owq/elgUysfbTVILwy4cb5sT2T9D7vt8fUAArMTEI3gBIbwbD6DpPpBvdiYsmCSZkyva
         Y3Hg==
X-Forwarded-Encrypted: i=1; AJvYcCXv1p875c508To2NPYLRWKKTlgjD2JuDtTG91IqmKolURhagzpDX2qdHErji5e/xQl1tXHZAyZgt5p2oA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhWI4okefeRDE9hi66WCNy2dxWlfb9yoP3nB4vgVInbOQamtYg
	cEFpz8BWc63yWZGRCI6tht5Tz4/GjGraiFZl73UrTISh39H8ADZGrYg0wNrmUySONdI=
X-Gm-Gg: ATEYQzw2va+ihjlds9nFF0VnNe/1QC+lte0lVWw1+LxrSjue65MXwkzvjUWbQ8IDWXJ
	WDUvmNA/op/Toe38wJu7TwkfI9Y8Q/tXb9QiJ1tLs1pveu4t6l9Au7IZ9En3sTz58XHiWTjLQTm
	Zx1J4A2Je77VaISqyQGeOzK53jzlE4bM9WT+202HiyqdezA75o49f+JcYJYRnMWp7rg9VgJGz6e
	DasJMZ5x7yoIevYuje5I3Zc7HAlYNMY0k9xinyewOYz8t/BIxEx/4hvcIqrXgKHT+T2+WKCt+Pp
	Pi14+udNI3GUhI063HRdf/i6yHFzgRJAusRfo/QlmdBub7UoItpLNiu84CdP5Od49SZTFZFeZdz
	RXdO+D0cxt76B0Ly7/ktktnUlo633yunlAJWkGGmoMFYJV9MYtY9uhFc4Q5s3ODCBjHWxQR5vbw
	vCFwmToHXOSJs4U0C0TnEFvL8ej1oi8KTqTOT1tmsS1rnSmjG1ylh6gCT+kPifXW0M
X-Received: by 2002:a05:6122:6c02:b0:56b:7f53:9ab2 with SMTP id 71dfb90a1353d-56d22066f25mr3881204e0c.10.1774539274241;
        Thu, 26 Mar 2026 08:34:34 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d31d71725sm4982551e0c.13.2026.03.26.08.34.33
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 08:34:34 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56cc67e01deso1067572e0c.3
        for <linux-sound@vger.kernel.org>; Thu, 26 Mar 2026 08:34:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXXKYDUYdjLIinQ074+bx7TOTbNKpL4bu/wL1djflGHXGNBDkbJAPFGP1e/2dSHZ14Er7xsmK5kMv+LXA==@vger.kernel.org
X-Received: by 2002:a05:6102:5801:b0:5f5:2539:9b11 with SMTP id
 ada2fe7eead31-603870ce0f5mr4152226137.14.1774538871002; Thu, 26 Mar 2026
 08:27:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319155334.51278-1-john.madieu.xa@bp.renesas.com> <20260319155334.51278-5-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260319155334.51278-5-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 16:27:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVbP5Bbr9KuxoEb48zUvubT3CN7sC9oVat2NcNWaBwOtQ@mail.gmail.com>
X-Gm-Features: AQROBzCXM6uPDs6UcVr58TTtg0-_14CRbEgbIPerOfaOzDyxBM9HF9kuEp2hlRY
Message-ID: <CAMuHMdVbP5Bbr9KuxoEb48zUvubT3CN7sC9oVat2NcNWaBwOtQ@mail.gmail.com>
Subject: Re: [PATCH 04/22] dt-bindings: dma: renesas,rz-dmac: Document
 optional DMA ACK cell
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Vinod Koul <vkoul@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Thomas Gleixner <tglx@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	John Madieu <john.madieu@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Thu, 19 Mar 2026 at 16:55, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Some peripherals on RZ/V2H, RZ/V2N, and RZ/G3E SoCs require explicit
> ACK signal routing through the ICU. Document the optional second cell
> in the DMA specifier for specifying the ACK signal number.
>
> The first cell remains unchanged and specifies the encoded MID/RID and
> channel configuration. The optional second cell specifies the DMA ACK
> signal number for peripherals requiring level-based handshaking.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks for your patch!

Just a quick head-up, as I haven't read the actual secion in the
documentation yet.

> --- a/Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml
> +++ b/Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml
> @@ -63,17 +63,27 @@ properties:
>        - const: register
>
>    '#dma-cells':
> -    const: 1
> -    description:
> +    description: |
>        The cell specifies the encoded MID/RID or the REQ No values of
>        the DMAC port connected to the DMA client and the slave channel
>        configuration parameters.
> +      Use 1 cell for basic DMA configuration.
> +      Use 2 cells when DMA ACK signal routing through ICU is required
> +      (RZ/V2H, RZ/V2N, RZ/G3E audio peripherals such as SSIU, SPDIF, SRC, DVC).
> +
> +      First cell:
>        bits[0:9] - Specifies the MID/RID or the REQ No value
>        bit[10] - Specifies DMA request high enable (HIEN)
>        bit[11] - Specifies DMA request detection type (LVL)
>        bits[12:14] - Specifies DMAACK output mode (AM)
>        bit[15] - Specifies Transfer Mode (TM)
>
> +      Second cell (optional, when #dma-cells = <2>):
> +      bits[6:0] - DMA acknowledge signal number (from ICU ACK table),
> +                  where 0 is a valid signal number.
> +                  Required for peripherals using level-based DMA
> +                  handshaking (SSIU, SPDIF, RSPI, SCU, ADC, PDM).

How do you expect this to work? #dma-cells applies to all DMA consumers
of this provider, and these SoCs already have DMA users relying on
#dma-cells being one.
In addition, you cannot have optional cells: if #dma-cells is two,
then all consumers must supply two cells (of course we could switch
all of them to two cells at once).  However, as zero is a valid signal
number, we cannot use that as a dummy when no DMA acknowledge signal
number is needed (we could use e.g. 0xffffffff instead).

Is there any other way to provide this information?
E.g. could we have a table in the driver that contains this info for
the (presumably few) MID/RID values that need it?

> +
>    dma-channels:
>      const: 16
>
> @@ -212,6 +222,20 @@ allOf:
>          - renesas,icu
>          - resets
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a09g057-dmac
> +    then:
> +      properties:
> +        '#dma-cells':
> +          enum: [1, 2]
> +    else:
> +      properties:
> +        '#dma-cells':
> +          const: 1
> +
>    - if:
>        properties:
>          compatible:

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
