Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0891B374186
	for <linux-sound@vger.kernel.org>; Fri,  3 Apr 2026 07:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775201827; cv=none; b=PW8S0MF2wGT0kMSe8GJxOCmfhETBUjvGuJqDTvDKxx52bokoABZeb41gGkqcUSymdU6uyO/QZpfbtyb5OYTTC4Rmm2pNsNNdGuNtn6P2dJXW3Dp5I7bsITadurWVURFh34FqII2FDsZF1Dw3nS8woHDGeUrSHXFP0t25lWa14x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775201827; c=relaxed/simple;
	bh=RQFIDvkQ6UcLgwztbD8oBHl4tS+ZCKb3aINkg7VeBsY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aQXVLw/lYp/FjRTKXgWlVfD25jcmjn65hYNc0xIgiio46t1pVq250wUiKzouH+YE+0BDunpCifthPAYGg7ZnrvStFBdiAnZOfSz7GyQPD95R/7rjdXEmj90Kryd2sPoEdythuUbW38X+NwrEq08Q0oPSh1W0mZUTtZpQD8iYu08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-60508c1df45so1129780137.0
        for <linux-sound@vger.kernel.org>; Fri, 03 Apr 2026 00:37:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775201825; x=1775806625;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d4N0YKA/XUUd7O8Nr0votH0EtcIVeq9XRBqx9j9NkIk=;
        b=PW89bL42FCHCaiNm3NUPlJEmJc+asg6k+nOoKpXJqPpywx557BUjSs4pv3pbgulCMn
         +OFEXZdW1ALAonq9AELYAGPMvTjqym5NIeEb8B6St+z68B6+8+jQshOJAGG5UV3TtdaE
         PAmTe+ZD7ySRIhN/AjS9TgdF5d+IwYk+7rFqLFdKnCuevql1XK24t7JeMFk/qc1C6Wbq
         XJbCnP8itWcHqGgIEXwiq5vWokCf6ZEVOMM9Rt1dZPY3tt0NQOIxh9GctToJNvmSyXVh
         oZ9kMuJaRIfP9M96GCPaSq45OvZNm/83uH4DQ3suu/WUR8jQ+6sbBf+nR2fPNONUkoqW
         EQxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzIvoO6aNNGUcxtaCnLhVKLckAApXZjDiDhjobpczOPYbDnUrbcDmOcQXFdwIY816+oMzNx7Wk8AH0SA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3XP0EQh9lniaWJTxYE6vebJE3nabSjnCEngoV/uJFWixBZn86
	UAJUZEDLn5G4sqQEGpbfZ2LI+N9R9kwk3qqTDnMfi0V88W5qkfxlThJ1fh4DSCI9
X-Gm-Gg: AeBDiesbztMT+GCyn6FI4vknuuNEdIpA/2YWgF/v95VNCfzbzju5cVqlx/XOWvzmnhu
	+VhTS80341QxIEOWm369XHZp0pwHoXuVo7QjoFlfh7zvN5aP6jYxbJvlDP1zVw4rFVujQeWt8x6
	bYqyjaDmL/wLBXQnt2vKrjQi24SAwQ8HmCEPXK7cY4ayKPGfnowOscxlcurFWEW0zjtWDbX4m4y
	0ucLBKeA0TVGCT1GOFOzIuOiOOeQMTBJSQdHBOasF9ZBtmPEknoWTrTPMcvHEmHrMYVmvvdzo9i
	ZTvRK0nAY8aV+X6gaLTEHHAu76nVeRJjeSh92Ll2UDQSpbG0hQIiyDuOiXZr7TLDbuYucx08C9Q
	wKvaNtic6exHGanFQpxFltRNl1cfMHplpNZW+823kKup3DlWQUawAglXAM9aXxlPkNxFoaO4rM+
	yAzWm3qQ1bRsSOZlPNVNE8UtpoxyOY2QmTQ3rIAAXo21X2F83UpPBfzY9MOv4Z
X-Received: by 2002:a05:6102:f0d:b0:605:315f:49f7 with SMTP id ada2fe7eead31-605a4d81988mr717349137.6.1775201824900;
        Fri, 03 Apr 2026 00:37:04 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-953fbac4aa9sm5358241241.12.2026.04.03.00.37.03
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 00:37:03 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-605a8c4ebc6so323671137.2
        for <linux-sound@vger.kernel.org>; Fri, 03 Apr 2026 00:37:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXCqnBDTVgPb8M4MVeg4Zz/yfJV6FPOdY8yzdJG2RWUdGg6yoxA6nvircGb2UZf3Q4oXfpCkC6fpJIxfQ==@vger.kernel.org
X-Received: by 2002:a05:6102:f0d:b0:605:315f:49f7 with SMTP id
 ada2fe7eead31-605a4d81988mr717338137.6.1775201823680; Fri, 03 Apr 2026
 00:37:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402162436.12059-1-john.madieu.xa@bp.renesas.com> <20260402162436.12059-10-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260402162436.12059-10-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Apr 2026 09:36:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUHzcq_f8t0hi-FjiG2FByNmx8k2sz9-QEqzroLSWqXNg@mail.gmail.com>
X-Gm-Features: AQROBzCXZAB5loNy5rsTC4EAiI9aKFN2pLERVORaR-uHChRoGZT6taMr9lCmLJs
Message-ID: <CAMuHMdUHzcq_f8t0hi-FjiG2FByNmx8k2sz9-QEqzroLSWqXNg@mail.gmail.com>
Subject: Re: [PATCh v3 09/14] ASoC: rsnd: Add ADG reset support for RZ/G3E
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Biju Das <biju.das.jz@bp.renesas.com>, john.madieu@gmail.com, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Thu, 2 Apr 2026 at 18:53, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> RZ/G3E requires the ADG reset line to be deasserted for the audio
> subsystem to operate. The ADG module clock is already managed via
> rsnd_adg_clk_enable/disable() through adg->adg, so no additional
> clock handling is needed.
>
> Add support for the optional "adg" reset control on Renesas RZ/G3E SoC.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks for your patch!

> --- a/sound/soc/renesas/rcar/adg.c
> +++ b/sound/soc/renesas/rcar/adg.c
> @@ -771,6 +771,7 @@ void rsnd_adg_clk_dbg_info(struct rsnd_priv *priv, struct seq_file *m)
>
>  int rsnd_adg_probe(struct rsnd_priv *priv)
>  {
> +       struct reset_control *rstc;
>         struct rsnd_adg *adg;
>         struct device *dev = rsnd_priv_to_dev(priv);
>         int ret;
> @@ -779,8 +780,13 @@ int rsnd_adg_probe(struct rsnd_priv *priv)
>         if (!adg)
>                 return -ENOMEM;
>
> +       rstc = devm_reset_control_get_optional_exclusive(dev, "adg");
> +       if (IS_ERR(rstc))
> +               return dev_err_probe(dev, PTR_ERR(rstc),
> +                                    "failed to get adg reset\n");

Given this file already uses lines longer than 80 characters, the
above statement would fit on a single line.

> +
>         ret = rsnd_mod_init(priv, &adg->mod, &adg_ops,
> -                     NULL, NULL, 0, 0);
> +                     NULL, rstc, 0, 0);

This one fits for sure.

>         if (ret)
>                 return ret;
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
