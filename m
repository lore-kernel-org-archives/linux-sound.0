Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992F33A8724
	for <linux-sound@vger.kernel.org>; Wed, 13 May 2026 09:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778665333; cv=none; b=SgbMOow7/txyQzCzCOp110++VLdUH//U46ISbXzCkTMPLAMpHqwrFmqOnBx/TJkgL6GYQk22kgoOcijo5If+vssraJkJM0sYTw+zXbGXV0A4IxGPzVqstErhBDpHsbTnhnH9iOSHNnT76mIgL/LlEl66+hWnflRyRfNHHXcYt4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778665333; c=relaxed/simple;
	bh=uVYsoxVIXinsrUNO2qPk1Z0E1qtPCaft8XkhDwMRN48=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R5mzHoJgplWyRG0f2MrrcNLOOypfmUYgGYbVuytfzGeZLQnNE3f/HDuHed4+H/4+1IVLh8wqEOZQ8o2FDpmKK8iprq5QxzPyava/SvExSNRWSUWt9mLQvEFaDeKdERcoK1pEuJNd4QvheqfcwAKuSFs1asTjNEMHgp82EpZMY8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-56a86f0a23bso6082770e0c.0
        for <linux-sound@vger.kernel.org>; Wed, 13 May 2026 02:42:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778665326; x=1779270126;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=imrv8gGof0CUbxurFPeQ8Hwv6N5BbSJLpDwNoIBJTok=;
        b=hzA6Ivkw1bYy5pLwJV1Y8QfBtgT4ZPqSUah6G6XopHEZ+nUsAAkfJo/NYUyUtvZYh0
         RkaCoTIgElqxzIK4awrH6Z9d3gWQYjgNOr1ZLxwURJOAD/TVpLk6TFC4Yt1IxW5KWHyw
         7rP2GXTrUapNEJIFWf8zucJur4De+YRtgCGshXfuMfMx9R/nuC3fAAvvGHAmzCCvz8w4
         r3nY9xKYRohGiENrYC9CBzX4WJG90yCukndq7kMzgT0Cf8+MMEU3XuTrSPW0lFOEPeh+
         0Mxdy2tAtNZl2v6j5WzSiCz23DxBQy+wybgqYkB71TlXEKK3yB2Pq8itZNgGoGAXsJ1J
         G1Rg==
X-Forwarded-Encrypted: i=1; AFNElJ8RvCy2I5c2pBjJNHJuLWFGIQPv1yk2B7P1B9mg0sIjrlxAafNkg3ddOQuUkKrjo/I9BUTMymYraPcljA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl2rUm1Z/nf34BbW8bXf64UHnwHBMvlYZfLuQlg6GpR58zW85S
	Pf82xDVYswiMKn+yyAa1lQKikUNFV2boAXNju9Ioc2NwLluehppstFMgI4730N6r
X-Gm-Gg: Acq92OEE7zlaWpED/428ev6yJqSvfdfe7QpjPP4g1d6oM/fozpUH/McLot8hlPZvhkC
	0vXaROFEqyFoheLinodWH+BhGhAQXWk9c6hzpwhLxkXfpQbK08CO2JTy6C1Z1kWDeBTTVe5jqAn
	2r3DjC577udMRPzEEtWBet/vzsW9uW1gAxAv4kdiwTzHC0t8hVfgtXV4NzPl16//HmfrNuOPNOt
	HfXOBvGsWpKGbZ8d7L5d5YVDJUulYU00W3pX0rJOQPiv1XnQROjxcuV5iJjsOMeS4R4IcuzY3i0
	nPBv82aMS+Uy6E/WF6JPxphpQ2jPqfhscFvkv5H+aOYM/Rvg0fICWjZLUjVuWZHNCdLL1JD9UuI
	KTgMgwfcUKvcIpeZ2opZbpWz33w2ddgtKfNhyR/+EqfPUAurKF8zjaa1G2A5yKuYIfrGCoTi5b4
	XrLIY8oU0bE/+eYHBf+hbmT+vfVaWXR0geDFkxuHMuM0Y27Tc5FXyI4wHL04ik+2sv
X-Received: by 2002:a05:6123:4b:b0:575:2072:54d1 with SMTP id 71dfb90a1353d-575e6fa8eecmr978776e0c.8.1778665325682;
        Wed, 13 May 2026 02:42:05 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-57576d13773sm10933249e0c.16.2026.05.13.02.42.03
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 02:42:04 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56a86f0a23bso6082733e0c.0
        for <linux-sound@vger.kernel.org>; Wed, 13 May 2026 02:42:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9jN0qFgTfbkSKIEvyuWgkGOou/99/Pu4F+axvFNnqlaJzrgCWAeYV9EemNERzJvOQxPHcEKR6u8JYV+g==@vger.kernel.org
X-Received: by 2002:a05:6122:4d04:b0:56f:a329:6859 with SMTP id
 71dfb90a1353d-575e6f9a7d3mr1048517e0c.7.1778665323607; Wed, 13 May 2026
 02:42:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512182631.3842065-1-john.madieu.xa@bp.renesas.com> <20260512182631.3842065-10-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260512182631.3842065-10-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 May 2026 11:41:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWx84+=UMB_zPgRgqAWWO4qmTkOkUEQLzhJ8UD4zLFx7Q@mail.gmail.com>
X-Gm-Features: AVHnY4Kr-XCAHViwq5wXvuNDFdIDqB9sk9joGebrZRK91CK4SGoxuuFnaauWCrs
Message-ID: <CAMuHMdWx84+=UMB_zPgRgqAWWO4qmTkOkUEQLzhJ8UD4zLFx7Q@mail.gmail.com>
Subject: Re: [PATCH v6 09/16] ASoC: rsnd: ssui: Add RZ/G3E SSIU BUSIF support
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Biju Das <biju.das.jz@bp.renesas.com>, john.madieu@gmail.com, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Tue, 12 May 2026 at 20:28, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Add support for the SSIU found on the Renesas RZ/G3E SoC, which
> provides a different BUSIF layout compared to earlier generations:
>
>  - SSI0-SSI4: 4 BUSIF instances each (BUSIF0-3)
>  - SSI5-SSI8: 1 BUSIF instance each (BUSIF0 only)
>  - SSI9: 4 BUSIF instances (BUSIF0-3)
>  - Total: 28 BUSIFs
>
> RZ/G3E also differs from Gen2/Gen3 implementations in that only two
> pairs of BUSIF error-status registers are available instead of four,
> and the SSI always operates in BUSIF mode with no PIO fallback.
>
> Rather than scattering SoC-specific checks across functional code,
> introduce an extra capability flags in the match data:
>
>  - RSND_SSIU_BUSIF_STATUS_COUNT_2: only two BUSIF error-status
>    register pairs are present. Used in rsnd_ssiu_busif_err_irq_ctrl()
>    and rsnd_ssiu_busif_err_status_clear() to limit register iteration.
>
> Future SoCs sharing these constraints can set the flags without
> requiring code changes.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks for your patch!

> --- a/sound/soc/renesas/rcar/core.c
> +++ b/sound/soc/renesas/rcar/core.c
> @@ -107,7 +107,8 @@ static const struct of_device_id rsnd_of_match[] = {
>         { .compatible = "renesas,rcar_sound-gen4", .data = (void *)RSND_GEN4 },
>         /* Special Handling */
>         { .compatible = "renesas,rcar_sound-r8a77990", .data = (void *)(RSND_GEN3 | RSND_SOC_E) },
> -       { .compatible = "renesas,r9a09g047-sound", .data = (void *)(RSND_RZ3 | RSND_RZG3E) },
> +       { .compatible = "renesas,r9a09g047-sound", .data = (void *)(RSND_RZ3 | RSND_RZG3E |
> +                                                               RSND_SSIU_BUSIF_STATUS_COUNT_2) },

Nit: please split the line after the comma instead of after the pipe character.

>         {},
>  };
>  MODULE_DEVICE_TABLE(of, rsnd_of_match);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
