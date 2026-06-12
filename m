Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E043E92AC
	for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 11:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781264754; cv=none; b=FJIFGMy6e4un07zARj/fTZTmuP0NkReF1Vi/1l3MrTG9C9G0l4sUovL94M71e8LDLkb2k602KKCbNPWF+v0lH52KIFFKzf/Y5hlszsSfIoFkVo4h2iJ8cTIaPHG40suPqqoXIRyR967Vf+pTOSKQQI1YgH23bdaaj1A8/vwTljc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781264754; c=relaxed/simple;
	bh=oGUJQrXok0oefnVapsoFTOkDTq4rMzW8cVDmbrT2fZo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FKsHGY6cvCTGYXcALakmOcR/8kHFC4Bn4G6FDiFlirnz0pqIpd4A2/b0zK0nXl1QobW5o/YXD+bALx74bg76bvgPWgxSPHKLSIGOuFqUnV4zCV2b/YeEokjiYqOFhDIWDuHDPG8fL0Ef2JPuKr1z+Oc89HpX2O4UphHoeEjpxS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-9667ea2fc22so39440241.2
        for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 04:45:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781264752; x=1781869552;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZNp4g5Gvhs1Bf1iVWmOM1OJf0ux2oAi1myswnuPAOFE=;
        b=jQTSeqb8+Mygo61vy5vc5SWXe8SeMvaoqQzkd/vWyno6jxsWtTrrmhjcs2jLfZwQt7
         WOUoN6u+SSmMAhqDmWw6UQulbh/ukbCTEw7xL3UFQofJMjOTNAgaTNeJPDrpJes6g7GW
         Ud/Tj8pIfShjtpcFFEJujvxyRlHr+PO4or+GE3ekemO8pghxgNcxax9+lxEq/wDA5bWt
         iMZQqY0xOifrp2be+ocsrYVKi/ZWO/yXTwzGlYhMc8siq1msEbQNsouFg8+I2goSKU21
         IsgkX7Cd/YygW63fHax8Cwfpu4W9Riqoe9iLuLrSEh7AFp9k5wdBZEtapi1W2xyVyuC8
         D7ag==
X-Forwarded-Encrypted: i=1; AFNElJ+RdaX5zltmHLoU7+qFbMS4XwsTvXGlv8wAxhaEGKGtfSnRJYaLc6YKdSltIoUNdzDyLX6rrpdFT3Eotw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoDH1gnVJLiXnrz+lpjD9Di3BL1OAgKiefHejAwBjTpRuBktGI
	3ODR2xVLoIwAswEQLqt+PUHnWQfPYLTxQNwVcaGaawidSPPHAV+C3DsySqt7nx8+
X-Gm-Gg: Acq92OFJgqw13+JvFf65AtzP/iimHNjUX4uVjOAL5zd3phf6Y7WHA0UrIKMzvVLnyCJ
	yoq56kXD6Z7nDePpJskQRUn3gdbXlFvcdW2VUn+iqsH0rtUp1oJMmpBoKgjp373OIAVWvX39vaT
	LqsM/R4rz+/U40Tq07NTpa9nyt/PPK+KlQ96K1BZX4/5JI3+OTJxneEYjZmMB8uZ3Lj3huQGLxw
	6tH+Hyht7P9Krm0/4QnMX2pxtsm9lotc4i11vrklcpKgx9FKLM8L6NCvSSbyeXeuJJqASJ2MzJk
	bxdTa6I1iETvMphWRQl9FDg/nmm/YrT8AVKu+HA0hbUVt23UNT6E7XlqstiDucbiYc4/75pF+yF
	/rTPAv1eTgmosutl/oBSLJfPSkI7WBhi8cesDdduT5faUfL3KsAMQjdqIwcuanMFFa/FloPCXdO
	zGU2b5W9C5ACaHw2mZUCYhEoKGJoGOKJNJujRkg/mfS5a1kjiZFMOjvRh46rCkiu6y
X-Received: by 2002:a05:6122:da2:b0:5a3:5938:6935 with SMTP id 71dfb90a1353d-5bb6c0af4c4mr804172e0c.6.1781264752271;
        Fri, 12 Jun 2026 04:45:52 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bb691bc485sm2267058e0c.12.2026.06.12.04.45.50
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 04:45:51 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-59eb501bcf0so255166e0c.0
        for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 04:45:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+Ebh5Eb/frSMvSvQENeMjVAn7w0pG2fVOsBKfha1PxaHVJxRE2M83jUKCYHECoAb6iH9x8HFEm5+y8BQ==@vger.kernel.org
X-Received: by 2002:a05:6122:6606:b0:5a2:4391:1730 with SMTP id
 71dfb90a1353d-5bb6c0dd1abmr737507e0c.7.1781264750451; Fri, 12 Jun 2026
 04:45:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609113836.45079-1-phucduc.bui@gmail.com> <20260609113836.45079-3-phucduc.bui@gmail.com>
 <CAMuHMdXku0BVRgwWWv1vNccKpRbvTu+1b0TjYacNJH94XBDOGg@mail.gmail.com> <CAABR9nHFHWFeEaaYE6X9fqt_Zb-3pF=jJbHQpsiBTgkS5LyTLQ@mail.gmail.com>
In-Reply-To: <CAABR9nHFHWFeEaaYE6X9fqt_Zb-3pF=jJbHQpsiBTgkS5LyTLQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Jun 2026 13:45:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWsLeEzjCPHEa=nY-kC0n34RHL3kUMW30vneUajCWwTRg@mail.gmail.com>
X-Gm-Features: AVVi8CfnD-TjdQCjcklRKqlAWA3VoQ7yU75YfPEvom1NYLk1a4nkIC9X_AZgb2s
Message-ID: <CAMuHMdWsLeEzjCPHEa=nY-kC0n34RHL3kUMW30vneUajCWwTRg@mail.gmail.com>
Subject: Re: [PATCH v6 02/11] ARM: dts: renesas: r8a7740: Add clocks for FSI
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Phuc,

On Fri, 12 Jun 2026 at 13:08, Bui Duc Phuc <phucduc.bui@gmail.com> wrote:
> > I have one more general question.
> > arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts configures
> > audio for FSI (fsia_pins), but does not fill in a clock-frequency
> > in fsiack_clk.  Instead, it fills in 12.288 MHz in fsibck_clk, while
> > the schematics call it FSIACK.
> > Apparently the FSIACK pin is shared with FSIBCK on R-Mobile A1, so
> > which function is used depends on pin control.  However, the DTS does
> > not perform any pin configuration for this pin?
>
> I checked the schematic in more detail.
> On sheet 12 (FSIA section), the FSIACK signal is connected to the
> WM8978 MCLK pin (pin 11).
> It is also connected to the X8 oscillator output (pin 3) through R121.
> By default, the board populates R120 (0 ohm), which routes the signal
> to R8A7740 pin K5 (FSIAOMC).
> If R120 is removed and R250 is populated instead, the signal is routed
> to pin G3 (FSIACK).

According to my schematics (RevA), R120 is not populated, but R250 is.
So the 12.288 MHz clock is fed to both the FSIACK-pin of R-Mobile A1,
and the MCLK-pin of the WM8978 codec.
Which revision of the schematics and board do you have?

> From my understanding, the default resistor configuration places FSIA
> in slave mode.
> In this configuration, FSIA receives BCLK and LRCLK from the WM8978,
> while the codec receives the 12.288 MHz MCLK from oscillator X8.
>
> This matches the current DTS configuration:
>
> simple-audio-card,codec {
>           sound-dai = <&wm8978>;
>           bitclock-master;
>           frame-master;
>           system-clock-frequency = <12288000>;
> };
>
> Therefore, I do not think it is necessary to provide a 12.288 MHz
> frequency for fsiack_clk (xcka) in the current configuration.
> If the hardware were reconfigured to operate FSIA in master mode, that
> might need to be revisited.
>
> I have considered testing the alternative resistor configuration
> (removing R120 and populating R250)
> to switch FSIA into master mode, but I have not done so due to the
> risk of damaging the board.

I haven't located R120 and R250 yet, so I don't know which
configuration my board has.

> As for the relationship between FSIACK and FSIBCK, I am not sure.
> The schematic I have does not appear to describe FSIB at all.
> The HDMI section only documents video signals and does not mention audio,
> so I do not have enough information to determine whether FSIACK and
> FSIBCK share the same pin on this board.

That information is found in the R-Mobile A1 docs (PORT11):

Table 1.3 Pin Assignment (505-Pin BGA Package)
    Ball No. / Pin Name / Multiplexed Pin Functions / GPIO
    G3 / FSIACK / FSIACK/FSIBCK / PORT11

Table 54.1 List of Multiplexed Pins
    Pin Name / Function 0 / Function 1 / Function 2
    FSIACK / PORT11 / FSIACK / FSIBCK

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
