Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D93155A5D
	for <linux-sound@vger.kernel.org>; Wed, 25 Mar 2026 08:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774425794; cv=none; b=BZhBAXKsvD8X1vIGhLU3O//Xh688uOjubWuBd3WiuXIiHpEQq2fp0gIe5yX/tsA4OhaxgkNWztT8D9lWg98YHdLu8hoQ9U2a2RPmLk5XciUYGyX9pt7Zg/rOSmrANbW+eEoS5dU/scqSZQCaKtAKB5KDeKTxDQ1/5gIwPvfSEDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774425794; c=relaxed/simple;
	bh=ZYG/k7kjLeCs+G5BXN/DGjRFcRRtBzlVxNoa6nU4SS8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i5TluAIuNPM2MLuEHuyaRjE5I5lC3qb4FqU6qikGVKznB7relX3fbh/bvbIwrP1e+vvUAcpA5hc0O+O6VsaeUI/cGRzM2my0whcSA1m/tp0WZ9bFIfSxnd1cHr7iUGZ90I+dj0/hXCfkfhqkoGCOdFLp6mLvN/fQja7y6lFQJrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-56cc6fe8815so2708783e0c.1
        for <linux-sound@vger.kernel.org>; Wed, 25 Mar 2026 01:03:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774425792; x=1775030592;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zEgogPO73kZUH+F/LPjEzcWkUO0MFC82X3nlBvBxxvY=;
        b=EApfDGwkr41vKxhwZ1X0vXSPTZlvHUT8mqtwmt+jZNtnEkI+RLGC7S5C00rUnPREmk
         gYCuPZVDzJV7oxbimUzfl/XHtGTC9z+TCr6WXfkU0ZvoA/r7NgBjHPAYA1G3Af1vJZY0
         +icCo3SLUbQXcqe9ZNJghi0lgh2snh9vZE27lFTULvjjJFWuBxwVI9yM41SWBHLXLaks
         zGmhryahBB3ExF/BJ2YmHwsJuGwqKjgd+9jKD6/0VvhNoEUjMLzw5BB+FsWffPjHUJzZ
         QvjZYsbqsXcO45YFsqzuH45/leKnWU7XNOQRzhrkMBIFqivNVxQJpbPj3lWfpq0tbQHB
         81cQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKgTAH6sMJy2KtwHxmCskuuooj6GIg9zBqRbMPMB0e+SGh7m3jjmYLDAcjq0MEUasSMBkZYafYExAIag==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu/yY/7N1GxgiYYyCg/+GdGj9b1dFIBZXI7v2npkAMDo23zp1A
	NB2MWPPZaXsFjSbMOA2Rz8g2iFzFLH4k+wKAo5kU538onnJdaAKIE3r9t1S3/ipIXxc=
X-Gm-Gg: ATEYQzx18YRUSA+vMvcSY5MwF1Q0l7pOzDLleTq0IC8MH55c0vBasx4B7GDscPsdwiT
	wIkWho7mH7aZwWORQmOkB15efNw7P4Il9yQYm/X36+HYEdFJgq+t3bUHeMxHpR32bUn1mxWaRA2
	qWu1y3Hjgu5LpzjvNq+PBLsChv6dyvoZ14n3H8T8dTqUaWws9Dhv5lO2K9/9E9aTsZq2NUghWOS
	SqhT/Mbthg4gDrPDfXUqJwAjx6UMCizjAb7VjLVVj/OKlcAyUyTP12wCbgsKskN8pbVh1cyi/Wv
	RPTUcG5Wd69glDkNxkEZzuKmRjFAILCWx0GWp8MA+hZ677dfPuDlzn/sY1TBBXC/kF94j1rLmdJ
	SMfxHRWcJxkCQlAzE8RYm+0bd61rVbAUfkvZoCjNm0VuFtUOCEdZjDhGa/NIsvBz1Jhus9QHh0i
	LmDs5d4h4KhbP4ZiomPz1kE/h2k+VnI1xfhngcAEM7nOO2xAm97KYp55dxSwLyM1Bm
X-Received: by 2002:a05:6122:e44c:b0:56c:db9b:2eab with SMTP id 71dfb90a1353d-56d21f23aaemr1153048e0c.2.1774425791704;
        Wed, 25 Mar 2026 01:03:11 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56cddb94eaasm18551373e0c.8.2026.03.25.01.03.10
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 01:03:10 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56cde757d3dso1753257e0c.2
        for <linux-sound@vger.kernel.org>; Wed, 25 Mar 2026 01:03:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWEJKLx8RkN4sZe78yCnIJtuhDOZFyGFhm4l3rMmQ+nR4ew5eBEeK0++ZLsvGAffOo4mpAoyicYob3Q5g==@vger.kernel.org
X-Received: by 2002:a05:6122:311e:b0:56a:e0e2:69b3 with SMTP id
 71dfb90a1353d-56d21cf9aa1mr1214240e0c.0.1774425790419; Wed, 25 Mar 2026
 01:03:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260320112838.2200198-1-claudiu.beznea.uj@bp.renesas.com> <20260320112838.2200198-7-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20260320112838.2200198-7-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 09:02:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUw+Dg4wEv9+F71aWgY9SLxPO6DyXO+30Gi_sNFpxechQ@mail.gmail.com>
X-Gm-Features: AQROBzBTFk3wDshBCZKCcekMpDggyNDKzrPFZ_w0YB_UnpLQ_sKycSkS0HnN5zA
Message-ID: <CAMuHMdUw+Dg4wEv9+F71aWgY9SLxPO6DyXO+30Gi_sNFpxechQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] ASoC: renesas: rz-ssi: Use generic PCM dmaengine APIs
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, lgirdwood@gmail.com, 
	broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
	biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	p.zabel@pengutronix.de, fabrizio.castro.jz@renesas.com, 
	john.madieu.xa@bp.renesas.com, kuninori.morimoto.gx@renesas.com, 
	tommaso.merciai.xr@bp.renesas.com, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Fri, 20 Mar 2026 at 12:28, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> On Renesas RZ/G2L and RZ/G3S SoCs (where this was tested), captured audio
> files occasionally contained random spikes when viewed with a tool such
> as Audacity. These spikes were also audible as popping noises.
>
> Using cyclic DMA resolves this issue. The driver was reworked to use the
> existing support provided by the generic PCM dmaengine APIs. In addition
> to eliminating the random spikes, the following issues were addressed:
> - blank periods at the beginning of recorded files, which occurred
>   intermittently, are no longer present
> - no overruns or underruns were observed when continuously recording
>   short audio files (e.g. 5 seconds long) in a loop
> - concurrency issues in the SSI driver when enqueuing DMA requests were
>   eliminated; previously, DMA requests could be prepared and submitted
>   both from the DMA completion callback and the interrupt handler, which
>   led to crashes after several hours of testing
> - the SSI driver logic is simplified
> - the number of generated interrupts is reduced by approximately 250%
>
> In the SSI platform driver probe function, the following changes were
> made:
> - the driver-specific DMA configuration was removed in favor of the
>   generic PCM dmaengine APIs. As a result, explicit cleanup goto labels
>   are no longer required and the driver remove callback was dropped,
>   since resource management is now handled via devres helpers
> - special handling was added for IP variants operating in half-duplex
>   mode, where the DMA channel name in the device tree is "rt"; this DMA
>   channel name is taken into account and passed to the generic PCM
>   dmaengine configuration data
>
> All code previously responsible for preparing and completing DMA
> transfers was removed, as this functionality is now handled entirely by
> the generic PCM dmaengine APIs.
>
> Since DMA channels must be paused and resumed during recovery paths
> (overruns and underruns), the DMA channel references are stored in
> rz_ssi_hw_params().
>
> The logic in rz_ssi_is_dma_enabled() was updated to reflect that the
> driver no longer manages DMA transfers directly.
>
> Finally, rz_ssi_stream_is_play() was removed, as it had only a single
> remaining user after this rework, and its logic was inlined at the call
> site.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- a/sound/soc/renesas/Kconfig
> +++ b/sound/soc/renesas/Kconfig
> @@ -56,6 +56,7 @@ config SND_SOC_MSIOF
>  config SND_SOC_RZ
>         tristate "RZ/G2L series SSIF-2 support"
>         depends on ARCH_RZG2L || COMPILE_TEST
> +       select CONFIG_SND_SOC_GENERIC_DMAENGINE_PCM

Please drop the "CONFIG_"-prefix.

>         help
>           This option enables RZ/G2L SSIF-2 sound support.
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
