Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FE936C0DC
	for <linux-sound@vger.kernel.org>; Wed,  8 Apr 2026 09:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775641431; cv=none; b=rfknxVM6rrYvCeswPAXamYUx3WM5qUyWN4gcTZLRU+k/z85msKllEeKRnoaMsA/Rqvw+0cyvOzC0V/L7JgGPFDNXTQqSOFsz6jYLUa3quxmTrbAOah0VZ+85ziA5E4JxSqG+yHEt7nh6oD3Dp12mp71XbDj0Fi7Z+OtaVnmcSDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775641431; c=relaxed/simple;
	bh=W4ocsbAken2i1Z0tr+aaOqS3kOkoeXQXKr5uS8XVQrU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WIIbsySQ4gyqK8Off7h2q5+gOiCufEGm3kgjHuTNu05N4uvBrbNQAN1x16cr6xLTpRRNeo7A26ECBTpGPhBZGSHJTmSw+nZ6969qepbA90VTSKqkdbw68GJAmpNFLY/SdeGp2ljPM5pvgsZMMXopbbohAAU0JxMhPRMy5Y8OYMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8cb5c9ba82bso943104685a.2
        for <linux-sound@vger.kernel.org>; Wed, 08 Apr 2026 02:43:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775641429; x=1776246229;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ENmHKB8IOhUHnCXPKR1y0jyIBHSgRsTMWLYy39EVq6U=;
        b=sYVu2kxAyCvTYVadjMwAS0clxW7jdiA0yYCfHOuAowDU2brxhKMNR3+utmkZTKOG1E
         yhxVRlMvinnzyLlvMRK4v+aWBG0kqHoxRv7QOLA7aAzslKN5g/FUw3BagK892LP0Uq/4
         sM0zXs8epcCN/pvpDWrWDGGg/eLNU9ktf+tKSH5C22hgAvK7bjyxUmyLNzwx4hXLaAAe
         o3KZZaSy2up+3R9IlUanj95nCjFAhnApgQcziK/ySBnQAMnoYHCY5SD16WzeE1hpkioI
         bM3GvMRLA/YzVi6l7ZsaMNON1EuL0A7uBsj1Z/X3W5I84c+VHV+TjENEsHj5eCQIKbg0
         vD7w==
X-Forwarded-Encrypted: i=1; AJvYcCW09D7RTImulf6QuyJw876VF+4f9aC9cfAtr/nvdBgwdU/g62JcKKMG0mkoQTO5mbUDQxINC8r4lxYvXA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5K3YRavkcAxHBZI48iWZZbjo//AROkPgDvEJi8YfOnS7I7jGd
	VtuOspKB6qJeYyXiG+M0PIbbjKHwvIDwyxkT6EMsHoY1lccdjPWj3huYcYc6mf0m
X-Gm-Gg: AeBDies6KAjZtlVeVtlbdZWMFo0S8OHvVOjbdFwqOgSEgROrOkbwr2aHNhHfFMLGqV5
	94MBYMv4Ylc8JXX0M6Qpqvh+CHL43Dc4JaC97Tel8uqDQKWn4kzRFhT8vriqEMwVyFqUAs5Q7nj
	HPwOTYNdOcokZm4yBySgPiYETn8pxDb6cy9YsW8RhzZBxcbDPHFkge1YSeybnzZ2e4rus643EKk
	w4C/kASqTtoHCxO9KGXcqQS0tsutCFlw3IEZRGpfgUAcv8q40c2wNw+/8nUjIwBfGXQs96Tk64+
	p956HAcWzfOzW3vOtpEkcJ3U6wUpb6+xEyBHrXKvusAba9OXxvmixAYmwJMZ6FyDY/Ot8RPd4n5
	oU/wPakCOxosx/9l3KxVHlGlUVz4BP/KKygWBdW9XP+8vLZo0yryB7il85ov5a/WRvCacUFYpEh
	lG5vVLIkWBD0sXJieeA3WyNTdfMeS56Y62Va5eFJNU/zfi5Xw5FVjz47+KRaIcrEfk
X-Received: by 2002:a05:620a:710b:b0:8cd:bffa:655 with SMTP id af79cd13be357-8d41da56bcbmr2739792485a.38.1775641428929;
        Wed, 08 Apr 2026 02:43:48 -0700 (PDT)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com. [209.85.160.181])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8dae66c0c3bsm162875785a.20.2026.04.08.02.43.48
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:43:48 -0700 (PDT)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-50d6b9bca48so77215541cf.2
        for <linux-sound@vger.kernel.org>; Wed, 08 Apr 2026 02:43:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUY3gBHOBrPxcSva/5vuMLkwtvfCM6jcka5mHZtrnwAd1Ig1+HpaaVZJgk92+h+Na61E/yBF5iBCq5Aqg==@vger.kernel.org
X-Received: by 2002:a05:6102:f9a:b0:5df:8f4:61e6 with SMTP id
 ada2fe7eead31-605a50dbbb6mr7039796137.32.1775641100526; Wed, 08 Apr 2026
 02:38:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402090524.9137-1-john.madieu.xa@bp.renesas.com> <20260402090524.9137-3-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260402090524.9137-3-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Apr 2026 11:38:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU+a7cXRY=yEmXQW9=rYnyMCifhZs+je8LDHL6r=mBDMw@mail.gmail.com>
X-Gm-Features: AQROBzBW_0NoE-RyS2BqqQAlrdl0pZXBq89zZ06PmjJcnH1QXimxqhe4p2F4Ftk
Message-ID: <CAMuHMdU+a7cXRY=yEmXQW9=rYnyMCifhZs+je8LDHL6r=mBDMw@mail.gmail.com>
Subject: Re: [PATCH v2 02/24] clk: renesas: r9a09g047: Add audio clock and
 reset support
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Vinod Koul <vkoul@kernel.org>, 
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

On Thu, 2 Apr 2026 at 11:07, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Add clock and reset entries for audio-related modules on the RZ/G3E SoC.
>
> Target modules are:
>  - SSIU (Serial Sound Interface Unit) with SSI ch0-ch9
>  - SCU (Sampling Rate Converter Unit) with SRC ch0-ch9, DVC ch0-ch1,
>    CTU/MIX ch0-ch1
>  - ADMAC (Audio DMA Controller)
>  - ADG (Audio Clock Generator) with divider input clocks and audio
>    master clock outputs
>
> While at it, reorder plldty_div16 to group it with other plldty fixed
> dividers.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a09g047-cpg.c
> +++ b/drivers/clk/renesas/r9a09g047-cpg.c

> @@ -460,6 +483,96 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
>                                                 BUS_MSTOP(3, BIT(4))),
>         DEF_MOD("tsu_1_pclk",                   CLK_QEXTAL, 16, 10, 8, 10,
>                                                 BUS_MSTOP(2, BIT(15))),
> +       DEF_MOD("ssif_clk",                     CLK_PLLCLN_DIV8, 15, 5, 7, 21,

Please preserve sort order (by _onindex, _onbit);

> +                                               BUS_MSTOP(2, BIT(3) | BIT(4))),
> +       DEF_MOD("scu_clk",                      CLK_PLLCLN_DIV8, 15, 6, 7, 22,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("scu_clkx2",                    CLK_PLLCLN_DIV4, 15, 7, 7, 23,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("admac_clk",                    CLK_PLLCLN_DIV8, 15, 8, 7, 24,
> +                                               BUS_MSTOP(2, BIT(5))),
> +       DEF_MOD("adg_clks1",                    CLK_PLLCLN_DIV8, 15, 9, 7, 25,
> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_clk_200m",                 CLK_PLLCLN_DIV8, 15, 10, 7, 26,
> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_audio_clka",               CLK_AUDIO_CLKA, 15, 11, 7, 27,
> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_audio_clkb",               CLK_AUDIO_CLKB, 15, 12, 7, 28,
> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_audio_clkc",               CLK_AUDIO_CLKC, 15, 13, 7, 29,
> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_ssi0_clk",                 CLK_PLLCLN_DIV8, 22, 0, -1, -1,
> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_ssi1_clk",                 CLK_PLLCLN_DIV8, 22, 1, -1, -1,
> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_ssi2_clk",                 CLK_PLLCLN_DIV8, 22, 2, -1, -1,
> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_ssi3_clk",                 CLK_PLLCLN_DIV8, 22, 3, -1, -1,
> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_ssi4_clk",                 CLK_PLLCLN_DIV8, 22, 4, -1, -1,
> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_ssi5_clk",                 CLK_PLLCLN_DIV8, 22, 5, -1, -1,
> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_ssi6_clk",                 CLK_PLLCLN_DIV8, 22, 6, -1, -1,
> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_ssi7_clk",                 CLK_PLLCLN_DIV8, 22, 7, -1, -1,
> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_ssi8_clk",                 CLK_PLLCLN_DIV8, 22, 8, -1, -1,
> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_ssi9_clk",                 CLK_PLLCLN_DIV8, 22, 9, -1, -1,
> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("dvc0_clk",                     CLK_PLLCLN_DIV8, 23, 0, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("dvc1_clk",                     CLK_PLLCLN_DIV8, 23, 1, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("ctu0_mix0_clk",                CLK_PLLCLN_DIV8, 23, 2, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("ctu1_mix1_clk",                CLK_PLLCLN_DIV8, 23, 3, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("src0_clk",                     CLK_PLLCLN_DIV8, 23, 4, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("src1_clk",                     CLK_PLLCLN_DIV8, 23, 5, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("src2_clk",                     CLK_PLLCLN_DIV8, 23, 6, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("src3_clk",                     CLK_PLLCLN_DIV8, 23, 7, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("src4_clk",                     CLK_PLLCLN_DIV8, 23, 8, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("src5_clk",                     CLK_PLLCLN_DIV8, 23, 9, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("src6_clk",                     CLK_PLLCLN_DIV8, 23, 10, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("src7_clk",                     CLK_PLLCLN_DIV8, 23, 11, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("src8_clk",                     CLK_PLLCLN_DIV8, 23, 12, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("src9_clk",                     CLK_PLLCLN_DIV8, 23, 13, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("scu_supply_clk",               CLK_PLLCLN_DIV8, 23, 14, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("ssif_supply_clk",              CLK_PLLCLN_DIV8, 24, 0, -1, -1,
> +                                               BUS_MSTOP(2, BIT(3) | BIT(4))),
> +       DEF_MOD("ssi0_clk",                     CLK_PLLCLN_DIV8, 24, 1, -1, -1,
> +                                               BUS_MSTOP(2, BIT(3) | BIT(4))),
> +       DEF_MOD("ssi1_clk",                     CLK_PLLCLN_DIV8, 24, 2, -1, -1,
> +                                               BUS_MSTOP(2, BIT(3) | BIT(4))),
> +       DEF_MOD("ssi2_clk",                     CLK_PLLCLN_DIV8, 24, 3, -1, -1,
> +                                               BUS_MSTOP(2, BIT(3) | BIT(4))),
> +       DEF_MOD("ssi3_clk",                     CLK_PLLCLN_DIV8, 24, 4, -1, -1,
> +                                               BUS_MSTOP(2, BIT(3) | BIT(4))),
> +       DEF_MOD("ssi4_clk",                     CLK_PLLCLN_DIV8, 24, 5, -1, -1,
> +                                               BUS_MSTOP(2, BIT(3) | BIT(4))),
> +       DEF_MOD("ssi5_clk",                     CLK_PLLCLN_DIV8, 24, 6, -1, -1,
> +                                               BUS_MSTOP(2, BIT(3) | BIT(4))),
> +       DEF_MOD("ssi6_clk",                     CLK_PLLCLN_DIV8, 24, 7, -1, -1,
> +                                               BUS_MSTOP(2, BIT(3) | BIT(4))),
> +       DEF_MOD("ssi7_clk",                     CLK_PLLCLN_DIV8, 24, 8, -1, -1,
> +                                               BUS_MSTOP(2, BIT(3) | BIT(4))),
> +       DEF_MOD("ssi8_clk",                     CLK_PLLCLN_DIV8, 24, 9, -1, -1,
> +                                               BUS_MSTOP(2, BIT(3) | BIT(4))),
> +       DEF_MOD("ssi9_clk",                     CLK_PLLCLN_DIV8, 24, 10, -1, -1,
> +                                               BUS_MSTOP(2, BIT(3) | BIT(4))),
>  };
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
