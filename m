Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909F334DCD6
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 08:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774598820; cv=none; b=XZ+fGAgu0qqonsGN3ct88dZc7BOzIy2aYHvULOCznMNDSERcJT7kCtacwTAcYXOkehz+uvi/QNUJ2l1ikJi0Ht/osBW0iWiwuS634doHtPKsPzN+YGNeW0HzwPORxe+WwgdauXx+WfRRU3OusHVGN2nJ7axZJjJbAd8huMDuSIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774598820; c=relaxed/simple;
	bh=LsuoM6vSS2icn4IcCYbHnTFkI9szULOyzJ6/FpfPSuI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mTHHV5uudZ8CGSN/u08RVwpOWW/Yp3Z/jhZEwdNxv70BJhiiAaZY5OLzG3LEnot8piRW9yqOMgnj7PHg1HDAQkd8wdJALL8wbRxwyr/wCG9uwfG146JZGv9uOpc87E0suUC58x3+ySxk1uG/zl4VP+0OrESARq/F4LO16WhQqVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-40f1a1f77a6so1309523fac.2
        for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 01:06:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774598811; x=1775203611;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qHzybmIOhEZ6f1NrVP3jgghQyfbqKSz0qw+kQmDQIR0=;
        b=GAfxoxbX82uq/6TnL3UnY044HXLRy579ZscxVxk0T0DhUZa8PVaseoByoQMuUX3SEo
         zpPsEGCiDt13cvVPSfMnQKB3/fr/xcmp8TmNahgxCkF4CHeWGPe59t01kMiF4Pw6aWdn
         PG7xUrHo6dV9v4MQOdwJ4si6iqPcjE+3oQrA7CwE2tryH37a5BYgFecYEex9jV1/50Dc
         021kjlaEpOOUNxQEZ3sjdL66BuywWljML1pZjV4QCEJSCcZhcvm1UHjsK5TmjhEPaEIl
         wdzILGozm3L1CK50+WTtaJyubLET7lPWgV6U6lYQlqRUnqACE5nuuiiD7WEdcMz49iCh
         PuyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSAArYKeWy9qgm9jy+IH3oQN1LbXI7Xd8npaxPA1/t5bVWZN/jQYyDPfrUBUNY5YnSaKyjovArs5S8TQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuZ/i+ZmNyUGsDsWUaDtXWX9Pvukrq+JYvL+sjC+nLBGpNs2Nb
	dh1aCoMyoktuT4UXek419y7/AbbrcHZhQSs48RHSOHY0RORb/ErJc19Pc0eN04g9WfM=
X-Gm-Gg: ATEYQzz0VAWZr6UROvgE2Pyb1OieVLGAmDDqnSYhZkvHYfnsQSPsTybEZE+cWHuGKoz
	wgEOoSJraB4k2TK4guQjAWCRQLtY87wyOwKbNmQ0dYECYaiwywReMelcpo1fjoTOl6fOz47okMH
	6Sr2eVWL9vd31AA3n3yxwnXfx+ksARfaz8P6uW1D1iGY8YANNmJ00Ymz0ILNco0OK7MWRPBkTe6
	ZAuleHc6XlF7HZW+lgFivly3JbyLWJ071BgfYkkvroIR+Ga43fuMlJUst3XFYTpmq4HwOny65pE
	5VSpkSv9mOLGAerHhzluELfBmj9C5zM2bNIlM14aMuDYMRlLJ5AVUGKkCBt/Vdm7UQJqQrjOVyO
	fuV3LQ9lyxM3taIiAN4t5zChhCZqepy/PMbgg1YRHKAePExlUr2CXSPRfF4LnW6RNDRC+PbNSNl
	DJsFGeqonHjY9IxUCLxJUghBfVJemCKXqa1Ay9CzU+6LpBfpQ6ZtWE8ROx5EIy
X-Received: by 2002:a05:6871:3323:b0:417:2b13:f2cd with SMTP id 586e51a60fabf-41cec0e2c18mr676250fac.10.1774598811281;
        Fri, 27 Mar 2026 01:06:51 -0700 (PDT)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com. [209.85.210.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41cc7ad6b94sm4564096fac.9.2026.03.27.01.06.50
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 01:06:50 -0700 (PDT)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7d9b1c57a4cso1470537a34.3
        for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 01:06:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXe9XUyA/Xw9rWmsIA2Xo6OBF29V7PnH92UFNHnF3RvWEtXZOOcHau/Rpf46KvJxbCEax9PIZtIohnBJg==@vger.kernel.org
X-Received: by 2002:a05:6102:560b:b0:5ff:d1c8:a85e with SMTP id
 ada2fe7eead31-604f930a02dmr530378137.32.1774598416378; Fri, 27 Mar 2026
 01:00:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319155334.51278-1-john.madieu.xa@bp.renesas.com>
 <20260319155334.51278-5-john.madieu.xa@bp.renesas.com> <CAMuHMdVbP5Bbr9KuxoEb48zUvubT3CN7sC9oVat2NcNWaBwOtQ@mail.gmail.com>
 <TY6PR01MB1737720136E84FAF590F637C4FF56A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
In-Reply-To: <TY6PR01MB1737720136E84FAF590F637C4FF56A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Mar 2026 09:00:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW5W7bWa7CBYNoQqOKQVogmmnCbt1u8RREc_7p+0fNGmg@mail.gmail.com>
X-Gm-Features: AQROBzBkJOmSHv5z_VHomTtftX1LPSPJAufke2TB95A8lqe7V-8DI3QQuxsJ7o4
Message-ID: <CAMuHMdW5W7bWa7CBYNoQqOKQVogmmnCbt1u8RREc_7p+0fNGmg@mail.gmail.com>
Subject: Re: [PATCH 04/22] dt-bindings: dma: renesas,rz-dmac: Document
 optional DMA ACK cell
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Vinod Koul <vkoul@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
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

On Thu, 26 Mar 2026 at 23:42, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Thu, 19 Mar 2026 at 16:55, John Madieu <john.madieu.xa@bp.renesas.com>
> > wrote:
> > > Some peripherals on RZ/V2H, RZ/V2N, and RZ/G3E SoCs require explicit
> > > ACK signal routing through the ICU. Document the optional second cell
> > > in the DMA specifier for specifying the ACK signal number.
> > >
> > > The first cell remains unchanged and specifies the encoded MID/RID and
> > > channel configuration. The optional second cell specifies the DMA ACK
> > > signal number for peripherals requiring level-based handshaking.
> > >
> > > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > Just a quick head-up, as I haven't read the actual secion in the
> > documentation yet.
> >
> > > --- a/Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml
> > > +++ b/Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml
> > > @@ -63,17 +63,27 @@ properties:
> > >        - const: register
> > >
> > >    '#dma-cells':
> > > -    const: 1
> > > -    description:
> > > +    description: |
> > >        The cell specifies the encoded MID/RID or the REQ No values of
> > >        the DMAC port connected to the DMA client and the slave channel
> > >        configuration parameters.
> > > +      Use 1 cell for basic DMA configuration.
> > > +      Use 2 cells when DMA ACK signal routing through ICU is required
> > > +      (RZ/V2H, RZ/V2N, RZ/G3E audio peripherals such as SSIU, SPDIF,
> > SRC, DVC).
> > > +
> > > +      First cell:
> > >        bits[0:9] - Specifies the MID/RID or the REQ No value
> > >        bit[10] - Specifies DMA request high enable (HIEN)
> > >        bit[11] - Specifies DMA request detection type (LVL)
> > >        bits[12:14] - Specifies DMAACK output mode (AM)
> > >        bit[15] - Specifies Transfer Mode (TM)
> > >
> > > +      Second cell (optional, when #dma-cells = <2>):
> > > +      bits[6:0] - DMA acknowledge signal number (from ICU ACK table),
> > > +                  where 0 is a valid signal number.
> > > +                  Required for peripherals using level-based DMA
> > > +                  handshaking (SSIU, SPDIF, RSPI, SCU, ADC, PDM).
> >
> > How do you expect this to work? #dma-cells applies to all DMA consumers of
> > this provider, and these SoCs already have DMA users relying on #dma-cells
> > being one.
>
> Indeed.
>
> > In addition, you cannot have optional cells: if #dma-cells is two, then
> > all consumers must supply two cells (of course we could switch all of them
> > to two cells at once).  However, as zero is a valid signal number, we
> > cannot use that as a dummy when no DMA acknowledge signal number is needed
> > (we could use e.g. 0xffffffff instead).
> >
> > Is there any other way to provide this information?
> > E.g. could we have a table in the driver that contains this info for the
> > (presumably few) MID/RID values that need it?
>
> There are actually 89 entries, and I could identify 3 peripheral
> group with linear ACK assignments. Thus instead of static array
> we would get a simple function handling 3 req_no ranges.
>
> Something like:
>
> /*
>  * Map MID/RID request number (bits[0:9] of DMA specifier) to the ICU
>  * DMA ACK signal number, per RZ/G3E hardware manual Table 4.6-28.
>  *
>  * Three peripheral groups with linear ACK assignment:
>  *
>  *   PFC external DMA pins (DREQ0..DREQ4):
>  *     req_no 0x000-0x004 -> ACK No. 84-88  (ack = req_no + 84)
>  *
>  *   SSIU BUSIFs (ssip00..ssip93):
>  *     req_no 0x161-0x198 -> ACK No. 28-83  (ack = req_no - 0x145)
>  *
>  *   SPDIF (CH0..CH2) + SCU SRC (sr0..sr9) + DVC (cmd0..cmd1):
>  *     req_no 0x199-0x1b4 -> ACK No. 0-27   (ack = req_no - 0x199)
>  */
> static int rz_dmac_get_ack_no(const struct rz_dmac_info *info, u16 req_no)
> {
>         if (!info->icu_register_dma_ack)
>                 return -EINVAL;
>
>         /* PFC external DMA pins: ACK No. 84-88 */
>         if (req_no <= 0x004)
>                 return req_no + 84;
>
>         /* SSIU BUSIFs: ACK No. 28-83 */
>         if (req_no >= 0x161 && req_no <= 0x198)
>                 return req_no - 0x145;
>
>         /* SPDIF + SCU SRC + DVC: ACK No. 0-27 */
>         if (req_no >= 0x199 && req_no <= 0x1b4)
>                 return req_no - 0x199;
>
>         return -EINVAL;
> }

Nice!

Note that you can use ranges in case statements:

    git grep "case.*\.\.\."

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
