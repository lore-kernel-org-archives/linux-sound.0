Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7004B3B27C4
	for <linux-sound@vger.kernel.org>; Wed,  8 Apr 2026 09:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775641302; cv=none; b=s2rZVYmkTc1pRpJT7a3aWi2WtGBzkYiOMtsKu9f6NeEd+DwXmLYb7iQE9DdRmTIksUyqUBaVJkNKNye2ORDwM4Eay2F10VI+pqA/lewdBJTQKZ0oMQn+OlGqYkoWxmiYKbTXAqhwDmUd/586ufHEelCy+S/WAn7PVdBlKEiJX2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775641302; c=relaxed/simple;
	bh=O0dPKIPUwqcZQdDhmwfagNKRPoro50YwQ5jiiYuAkY8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OW6k46rJO3exnTOBR1pcbqjEEsv3ktjoO6vHZuWVZTD88nOt+/agJZiTtzMvxp8fFesz5xyAelLZos7bvK2zmeLyqfGLYUAxU2gv9N2wQEKKAiLM4NRYhSTg+baLoAs0BquLCEGzra9LbwqVnMOYo0A/MmBDnfmEAb/gvAwd47E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56d9c4f7f0bso4168637e0c.2
        for <linux-sound@vger.kernel.org>; Wed, 08 Apr 2026 02:41:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775641297; x=1776246097;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quvvcejYXNcTSghIu/ABG/aBBVzSmRl0OrHbMTAKiNc=;
        b=nt2TeZ532uyXLIjxEUVUjrvldbMye1OloaAhW9vlEHeanVQX2eFnavnwkKbiwGcvin
         tROBsI6RhoDFjsY7ZC7pI//JA5NV+fIcUpNnE33vK8fOfIvv2PS+vF4fklcQABzWyuk3
         XO3NdOjtsVj231u7i+THqQmp9MVrFITQW5+X1ZONRbs4nq1CAOiwp/qdNCMn15v0gxRY
         SlmyMJ3Cl5tlImjUOPXYQtxRtrfoK6feMJy0QICwsUwJizaIYFFqeA+uTiXgRpUDjAgL
         NMO8zhJKXQph+GuPb7IRRey9a+WipTsT+dBcFjw9llz1XZtKvMl4o+2LNiVyAThvbREe
         MpCw==
X-Forwarded-Encrypted: i=1; AJvYcCX6DL1UA14nwFPULJ/4+4SqCaPPvzr0CFsH6gPdNi/DjCr2X9+VOUJa/P3dnu1dqGaTP5dGZPIoR8Y6dQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoISNCzsvVx+FXUtzj+KZA5B9Gn7z8OBcYKs8nZ5uOL4JUz/nh
	FNn2OUdw1byrocOapsKzaj5Ha/K5juBfkIWp89iBzZ3azbAvoy2q1ve6vUiioNmC
X-Gm-Gg: AeBDievqi3dIi5UClr9VAldjCXwcjf88ztRbLhuS/jGb26ndDS3Mv9iKDRDqCUpW/r1
	ejc1to/3hHl5JOIRqP3E+jFOvWgPV0A2mjoVYsGCyAEsn/GSmrZyWVhBGPMvDYBipVPbdjU2d5Y
	jg8FXm0Mnt93w+LzujvYOJdlzs2aN6tEosCi9KwPX52T0qw40br5IHRQZvYIyfnB7xNkQCZyseG
	XBWaTYTRV/2wzn4rDy0YjstUYefqh4MJAfvXsoPvdlemPk7HGQlD0hYoQBoELhlyHgoQx1CaZMz
	yBWN6B611pu4XXKx9Rx2THoZMHuSNIjJCeK5gGCvvUwiG5Cl9o9+SqqyzwxicLu5vEASQo5i8/s
	vL5D9hHipafb1kb5fcM+7P8ESCH4iO62HFTel80AnJeSsem0xJn954ydwh6d6pLYVf+FbZfhami
	VPggFqxPie+iIn2rp0Clrf6Y9ZaHUhg+j4UoQOgPXoHEaZq+FW7X/8BBiRJb2ehtro
X-Received: by 2002:a05:6122:a5c9:10b0:56e:e9cf:7134 with SMTP id 71dfb90a1353d-56ee9cfa0fbmr3844069e0c.3.1775641296675;
        Wed, 08 Apr 2026 02:41:36 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9bce02f3sm19607884e0c.14.2026.04.08.02.41.35
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:41:36 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56d95bc93e3so3850695e0c.1
        for <linux-sound@vger.kernel.org>; Wed, 08 Apr 2026 02:41:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX9Mun60r3zaKqbDi63BGaNJOunM7YIfiLWpUQFQriujvsc/SmmKclIYzWFSnMmQEvpuctvBqkKpSSWzw==@vger.kernel.org
X-Received: by 2002:a05:6122:a5c9:10b0:56e:e9cf:7134 with SMTP id
 71dfb90a1353d-56ee9cfa0fbmr3844058e0c.3.1775641295235; Wed, 08 Apr 2026
 02:41:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402090524.9137-1-john.madieu.xa@bp.renesas.com> <20260402090524.9137-25-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260402090524.9137-25-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Apr 2026 11:41:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVLb3Wj=4qK_5jLsiN28i2LDYPVH9ch91Y6e8XyT+yjjA@mail.gmail.com>
X-Gm-Features: AQROBzD3bL2aOOG6EzT_imFnbWnAbXmWWZH1UF0TeTlDTbev2ZgK_ZCcpyzlvIk
Message-ID: <CAMuHMdVLb3Wj=4qK_5jLsiN28i2LDYPVH9ch91Y6e8XyT+yjjA@mail.gmail.com>
Subject: Re: [PATCH v2 24/24] arm64: dts: renesas: r9a09g047e57-smarc: add
 DA7212 audio codec support
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

On Thu, 2 Apr 2026 at 11:10, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> RZ/G3E SMARC board has a DA7212 audio codec connected via I2C1 for
> sound input/output using SSI3/SSI4 where:
>
>  - The codec receives its master clock from the Versa3 clock
>    generator present on the SoM
>  - SSI4 shares clock pins with SSI3 to provide a separate data
>    line for full-duplex audio capture.
>
> Enable audio support on RZ/G3E SMARC2 EVK boards with a DA7212 audio codec.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts

> @@ -280,6 +358,42 @@ &sdhi1 {
>         vqmmc-supply = <&vqmmc_sd1_pvdd>;
>  };
>
> +&snd_rzg3e {

Please preserve sort order (alphabetical, by label).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
