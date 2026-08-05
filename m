Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0BB45A2B8
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 12:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785931416; cv=none; b=kyJous0PvcV356impB8Shtk+tWarXL0eohD5nq2AsdbAq/xlxLyNBXxUJUnnbGYpyvj+e5Tg5xTCY+CTvea0QNJ15E+uyPmbwajpcA/Ac5BnIMiserxHuS0AhiLeMq80dMTn6b6rEKvidETyggQ/AIp9RqqnUJVx7ofACITgn0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785931416; c=relaxed/simple;
	bh=mWDkhCDQt28Rzz6I2tZE/YSz/t9DgfeaNNfvuTOIjvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QFf4uScYXz282iLL9/AJgaqDq2JLvbiEYIHOG/gBP4jynMSD/J/l+/F7c8SnxBBUAOS3AAFxin4kDr99pVHEBfsBUKI5BsWA1JHCzVmiD9wY4hXMD23bmCFtu40457DIt2TekR0OfP0Ba1AQ3Z2LqWZkZefc78kn8+y4pJSBFpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-9693bbb962eso501843241.2
        for <linux-sound@vger.kernel.org>; Wed, 05 Aug 2026 05:03:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785931413; x=1786536213;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Cmx7yQpz7FXmZJPiqLpJPoIkgxVuzO0p+i85ObW18Pk=;
        b=nl7gwxNUb/U7/8AETVyrOGDXdumRklV6b/EwbvrUvOZn4tGYki5rO9zwps0JhWdLTO
         CPfj2fFemTZ3kBOlsHYlyPkQDldE7/YLG9iWGp/tmSZ7aVd3qc5H6xql5RgPN4b8KHg4
         flcOs3K527sQL2mdXIXpfgUzaOSriuRrpbZXi4g7dTSwQyRqnwzCY9Lw9gZyxCt3vkCO
         YmD5aGm1Az8pe15E9+Ql+HEBHeCiw06gujmO7gGrz91lfAPHpk1qMxhUAqMKrnLLIdBO
         vbINpi1RRYC619D4NdyqmkCLCF8bhINrKv4Lxjg82uo5jSraNGbTxOvCv4xLKH5kgD8i
         q1OQ==
X-Forwarded-Encrypted: i=1; AHgh+Rorm9vywlZUfcW7Y/F+AYDVMSueVvg0x25MDd7/PdH/yXFGswzb0cbDcmXjSvv5RmHAlnuUkyIOXuqbiA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbz43JaoJ6yWjatxnT5kJg/pbWG00H9CyLOc8KszRsifSCaTqo
	EXSuJbn5W+Hsfd57RFDidApJWsGHUqHhBvZOU+8aybnwAXvJ765Im79VXbHwnBCJ
X-Gm-Gg: AR+sD13YGb2Nulk+yv6I5zdSTK5/7yuwMov7s3j6u5ew8VE0nrPO+mYXd12idzFlWEn
	+Dc3mGvtGJvHAMeEbFJ0zhB8lj5curCt3Kgapb5ESUu4gtT/YYx0RT4asIsuWjJr5VYWjxRhHSQ
	36iJX30c6JY2i3NpiU/QQRW5D31S6ArDKCI3bYEwq/jDQ13HYZwuLXY7lDo/9YxKmRIoz4zfY5Z
	Zw1EVvVi5NpNV5UrBN/BXU/rni1xOsiymmUSHGOmDdecnkBUL4Xe/Cy0I9ITTUYzD2hBd9lWG4O
	kdO7aaNVXpWNORRoOIcVlTKmR2EdZ7gpFskB2aN3HW/xcAeZq32y/cgHpFKL1q/ebw605O4j/59
	NCmkek6hAh+ycmRUvB15wDjpWmjxMW9FJsWtBq8weKBlBrYhXoOOCkJ43d9anNeFFeSxPzSlQJG
	a7+lS8EFOYS6smaRsDm6E0Wv8r+ba6HS5Kwy//tvflOwyy+0o27hBRkd8CMujWH1cSrvsStUQUI
	gleh6d1Y9WosgLQPWmxHams1OYvGw==
X-Received: by 2002:a05:6102:5689:b0:739:4fa1:50aa with SMTP id ada2fe7eead31-760e8f3596emr1630836137.14.1785931374404;
        Wed, 05 Aug 2026 05:02:54 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-760450312a1sm1970323137.2.2026.08.05.05.02.53
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 05:02:54 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5bfb5e20a90so619122e0c.2
        for <linux-sound@vger.kernel.org>; Wed, 05 Aug 2026 05:02:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqMzv/6pocwZgSMhBl7fcNBFL2Gf6kEfSCJoHSronrVXwYd64smnJtlqu+XDqgjjnY1IR2zY3lpDngTQg==@vger.kernel.org
X-Received: by 2002:a05:6122:289c:b0:5bd:fc23:c9d1 with SMTP id
 71dfb90a1353d-5c3d9162104mr906798e0c.6.1785931373330; Wed, 05 Aug 2026
 05:02:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803132828.3249424-1-tommaso.merciai.xr@bp.renesas.com>
 <20260803132828.3249424-2-tommaso.merciai.xr@bp.renesas.com>
 <44c150f6-b04e-4515-ba71-63780c56c38d@kernel.org> <anDNtrL-eL6VUD94@tom-desktop>
 <8c5f0e53-2515-4744-ac6a-a4c94f2ae2b8@kernel.org> <anMkwfGAW5fBSAEf@tom-desktop>
In-Reply-To: <anMkwfGAW5fBSAEf@tom-desktop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Aug 2026 14:02:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVzvnz-XrgJ2+UrAA-Gj6XjAnz9Q0HqrNCuVQF3+v9X-g@mail.gmail.com>
X-Gm-Features: AUfX_mzB7HlYXBn_cNKB7rJbOxNdM-zSKxAmP2nWd-xohS9mCBFdbwcKjfIe5vk
Message-ID: <CAMuHMdVzvnz-XrgJ2+UrAA-Gj6XjAnz9Q0HqrNCuVQF3+v9X-g@mail.gmail.com>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: renesas,r9a09g047-sound: Document
 audio_clkout clock-frequency
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, tomm.merciai@gmail.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	John Madieu <john.madieu.xa@bp.renesas.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Wed, 5 Aug 2026 at 13:56, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> On Tue, Aug 04, 2026 at 08:20:29AM +0200, Krzysztof Kozlowski wrote:
> > On 03/08/2026 19:19, Tommaso Merciai wrote:
> > > Hi Krzysztof,
> > > Thanks for your review.
> > >
> > > On Mon, Aug 03, 2026 at 03:32:48PM +0200, Krzysztof Kozlowski wrote:
> > >> On 03/08/2026 15:28, Tommaso Merciai wrote:
> > >>> r9a09g047e57-smarc.dts set clock-frequency for the audio_clkout output,
> > >>> but the binding never declared it, so dtbs_check fails:
> > >>>
> > >>>   sound@13c00000 (renesas,r9a09g047-sound): Unevaluated properties
> > >>>   are not allowed ('clock-frequency' was unexpected)
> > >>
> > >> Maybe the DTS is wrong, because property was rejected? Did you check
> > >> this? You cannot document ABI post-factum if it was rejected.
> > >>
> > >>
> > >>>
> > >>> clock-cells is fixed to 0, so only a single audio_clkout applies.
> > >>>
> > >>> Fixes: a86fd3c20218 ("ASoC: dt-bindings: sound: Add DT binding for RZ/G3E sound")
> > >>> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > >>> ---
> > >>>  .../devicetree/bindings/sound/renesas,r9a09g047-sound.yaml     | 3 +++
> > >>>  1 file changed, 3 insertions(+)
> > >>>
> > >>> diff --git a/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
> > >>> index d7fa16554698..6e2b2c93b4b7 100644
> > >>> --- a/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
> > >>> +++ b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
> > >>> @@ -42,6 +42,9 @@ properties:
> > >>>    "#clock-cells":
> > >>>      const: 0
> > >>>
> > >>> +  clock-frequency:
> > >>> +    description: for audio_clkout
> > >>
> > >> Incomplete, missing type/ref, constraints.
> > >
> > > renesas,r9a09g047-sound is handled by sound/soc/renesas/rcar/core.c [1],
> > > and "clock-frequency" is read by rsnd_adg_get_clkout() [2]. The same
> > > property is already documented for R-Car in
> > > Documentation/devicetree/bindings/sound/renesas,rsnd.yaml [3].
> >
> > But was the property rejected? I am repeating myself...
>
> Looking into this further, I found that you already asked to drop this
> property during the v5 review [1].
>
> Thanks for pointing it out.
>
> For context: the sound module contains an audio clock generator (ADG) which
> generates an output clock from the external audio clocks and outputs it in
> to the AUDIO_CLKOUT pin, that mostly supply master clock to codec.
>
> "clock-frequency" is array of the possible rates provided by
> AUDIO_CLKOUT to the codec master clock.
> Based on the playback rate it will request either 44.1kHz or 48kHz.
>
> I will drop "clock-frequency" property from r9a09g047e57-smarc.dts, where
> AUDIO_CLKOUT output pin is not wired.
>
> But for boards that populates AUDIO_CLKOUT we need this property,
> Could you suggest how to model this properly?

Isn't this output the single clock output of the sound module's clock
provider (#clocks-cells = <0>)? Hence can't the consumer driver set
the clock rate?

If the consumer driver cannot set the clock rate, but depends on a
fixed clock rate, it can configure this in DT using assigned-clocks
and assigned-clock-rates, right?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
