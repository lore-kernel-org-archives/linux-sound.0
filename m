Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3C742C4E8
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 07:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785827853; cv=none; b=kX1m3+jCrvOPEl2/KeBejYzkqfUt26WH3eirifIcJT6yBs1jM628iyfYgaWNSZ7FGCneMP11PHfQks9BJYKbt5c+2vFcc0HJpifZcETSfRQDEpIoLBEe3AO8IkcZ2sNbNDiuIFAkQxuwx5enNdb/qFnTaASkZ3ma3w/z/LlqMZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785827853; c=relaxed/simple;
	bh=AR+rClDi+44W8PdxcQM1L2dchoFiNrLzRIsqOdlIcxY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=scvcbKMak+ms4ODbdNdRGOrs+lgOSMadsBd+qmI/9IqVHu9VaoLljc7jSfNXe7xbb80edU9DtoFnNwCxOv/tuvkRZygfGLET33tIbV48Hg1kXoNfGh3osFWFs8nqLJBQ3qiibqCgV2CK4qyQQCqKiVTD/P3xz9vRrIgm2QjcUI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5bfbbe5220dso364078e0c.1
        for <linux-sound@vger.kernel.org>; Tue, 04 Aug 2026 00:17:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785827850; x=1786432650;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9QaVWHqdbaHxJymge1QHJLI8YxtJ974S/kpxpp3uip0=;
        b=LZI4xUnvCrcrsZXrSGKdj6fZ8p+lvWHNOMTZsLsILqy+x8Gt7bmaWFThPq3jAwceEG
         UAQh7YCuNGQVV7rTebyy2b4LvsXtmvNOUinQ1AySg4n8A/G4YsAf0xG1zjcAWHJl83fW
         qdEyJ8AwEBqu4qAG61KDVSERl79I4P57CvDa5MAwO0j2X8ieqYO7ZW5LWLTwoBf+e4XU
         dF6TgWficrrF+oLlLDC9EQGA14T5gT0iPcFlRSkUSKWWmA1YyDi6CnYO4utEViEryd+e
         GmtjFaD8oB9E5qRs/7unDF52SpC1GgRkX2WvJ2OzSBPIqS4Wd1UV0NKJoluEgm8z4yoE
         RjNQ==
X-Forwarded-Encrypted: i=1; AHgh+RrDxLHZ8YMi7Mp+XI9pyQp08Wd51wiyfZjzHHFtabWl7Ei1M+BE0glD/eILcNgyvLwFvOxV5RzJdBcbbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTRUlp/nQm9DqRGilsD00Ae/yLBeKXuq2mObKcfRz9JTV4MCbt
	da56YVBuS1xxjfzamHn6/ZRD+ScakOplmo09J6j8CFOwHTxq4DYQnxWTfYUhpgbL
X-Gm-Gg: AR+sD10wYsQ2fkxzRpgHD6JwXe7hoHdg7Qsva/Z2owAwP+P6HtY+qVpfvZ0MWLOgMsO
	inFO8fqrwedvlhiSvGVV1lyVq47UOFY+of2mbKBsnLOTk/g65qLanu03+R65MppACc0pv+F7gFR
	+ixOwxB/9/Op88t9wq8PjTsYo42Z+xVJKkgOP/Ohp14H+WSJaNayd33eB3OOdPB/4FBNHtg3FJP
	wA/9ws2QNtvbXdEzwll2SLtl7sBHNNBgVA9OK/VXGC8H8tUifHArW4rizfUEMtzGq9emK+6cUq8
	gzgZiYb9ne4q7lmIMyGSfFf2H5c0C8YttKeJf0IYFDlYCe0Fm4Yc0/G/5LiySn8dHvASD3zoOfB
	a+vIALJMNDDrANgl/ipS0GVXWL7eRb5potxKnEzVzMvBNphaJgqp2GAxGMYQkPB8numJGJ0e2bK
	Ow0ab1fXuC7P8DUGn0kTbbxsF0+6bbmTXqC0ZeIRiQ4t5YeINep/UPzNTCzPAAfNRCkzB55Frgl
	ThCOtMLCl0TjgIxwsQdc/Tifw==
X-Received: by 2002:a05:6122:6602:b0:5bd:b0a7:47e7 with SMTP id 71dfb90a1353d-5c3c3b749e6mr925344e0c.3.1785827850325;
        Tue, 04 Aug 2026 00:17:30 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c3d08b1e05sm21822e0c.11.2026.08.04.00.17.29
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 00:17:30 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7377dde7bc6so395783137.0
        for <linux-sound@vger.kernel.org>; Tue, 04 Aug 2026 00:17:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrqKmw7YeQFxIVe1IzfUbfQ062IAVedg07EIxGrkVRaKiwA3h2KW8zYZ9czzrmCofJLi2yenjNTC7vHTw==@vger.kernel.org
X-Received: by 2002:a05:6102:6311:10b0:745:4670:42fd with SMTP id
 ada2fe7eead31-75f7692562cmr648867137.20.1785827849793; Tue, 04 Aug 2026
 00:17:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87zez4rmrq.wl-kuninori.morimoto.gx@renesas.com> <87v79srmqx.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87v79srmqx.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Aug 2026 09:17:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUbNyR17yEBd3j8Uxr4yXYp6ryjzSynrNJ2ncpZARXNYw@mail.gmail.com>
X-Gm-Features: AUfX_mzRnNKFH45GXbl0DGVj0vcTLIJaytPw-Ya-8ltGiTeNTwsrSeFMCn-wAXs
Message-ID: <CAMuHMdUbNyR17yEBd3j8Uxr4yXYp6ryjzSynrNJ2ncpZARXNYw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] ASoC: renesas: enable COMPILE_TEST for AC97 SH7760
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Morimoto-san,

On Mon, 3 Aug 2026 at 03:55, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> AC97 SH7760 is not compiled with COMPILE_TEST, and there is no defconfig
> which selects it. So it is easy to be overlooked for compile test and/or
> ASoC updating.
>
> Let's enable COMPILE_TEST when it was for SuperH / SH-Mobile
>
> Then, remove #error which hinder for compile test.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- a/sound/soc/renesas/Kconfig
> +++ b/sound/soc/renesas/Kconfig
> @@ -63,7 +63,8 @@ config SND_SOC_RZ
>
>  config SND_SH7760_AC97
>         tristate "SH7760 AC97 sound support"
> -       depends on CPU_SUBTYPE_SH7760 && SND_SOC_PCM_SH7760
> +       depends on SUPERH || ARCH_SHMOBILE

You can drop the ARCH_SHMOBILE part, as it is a subset of SUPERH
(if ARCH_SHMOBILE is enabled, SUPERH is enabled, too).

> +       depends on (CPU_SUBTYPE_SH7760 && SND_SOC_PCM_SH7760) || COMPILE_TEST

You can drop the CPU_SUBTYPE_SH7760 part, as SND_SOC_PCM_SH7760
depends on CPU_SUBTYPE_SH7760.

>         select SND_SOC_SH4_HAC
>         select SND_SOC_AC97_CODEC
>         help

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
