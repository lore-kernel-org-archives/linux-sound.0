Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EE039FCC8
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 07:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785827471; cv=none; b=Bqy6x+fYn+Xo9Yi/WzN2WA7WokF5loCUbwP515RTQSbb4r7x29ker4JzRT2Glgap4qDYVbPqkFXnRthrkyD0VgSvWIn0TwuLh9jYI2m/JHLveFe4jGttD+NLjZNlqxR4FxhGOnhzjeEyeGmXGVjK4J1efzYVIcUchrYbXSg2Hd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785827471; c=relaxed/simple;
	bh=ZIK40yjlCbZRjafUxvsByuw3sKfH599KQLyEIVrRBYE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J1T/+L/f9JFuJ0qPcebNaZwFOexzZ9EXFVoYb0gjISvkBPX31tEHmu8dqYGSmXr3Thg6M5NpvQvBtaiBR3ep066YfD9LWzR0KGVAyYNINxKVywyTE2kVfSwWseYCVhB7d7FEYmajF02iLh28O4CUhaIQNDSbFVPQjXBHLpQfQD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-966e7380109so2200457241.3
        for <linux-sound@vger.kernel.org>; Tue, 04 Aug 2026 00:11:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785827468; x=1786432268;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HGWToxgHYPc+AW0+YSoQtCCYb5BhiGENFUW1b7lmr0A=;
        b=Jq6iKZBLE+XC3/N4BUkGct1tKuO0si8fU3Cl2UostTw96/gSuWUlN7xTcddptZG2uB
         Tru5SimDOM9RQdqoKzwfiyfEumuFLuTBBoZEYHbRnyNDqdasVn6EKmghhEMRJRNRD4oc
         vUN/TF25F55BeyQcj5zT7OBdgldVGvbCPvgsv9UqLEnfCL3NzvAI98iCtRyDNyHrsgxE
         Yqoz8ek4sSoSW0NLopVtFAm/ylLSqXMadsgG88SNuFf1Dwo6myHVzv0dzh+cYyRaS3Gc
         JcUNJpkSy6EI7XyX+eKJ3+PdOxHNYRuzkKsrDPcgxcFzowEcWRDGfSVx9kWG/yN2Doaf
         6Vag==
X-Forwarded-Encrypted: i=1; AHgh+Ro0qNkmPiEsNbNcowDS7KbYH3vDIQ5H6RATfEE7RtrITD8McHakjnGIvO6e6HivnplUXTpRTySmIVJvLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlMKzrR5IhsvrWhgONrqo8MxxlX14/icOLwPmx+bwKnnfWJqky
	jkIvhTL8IuVGh1XDgNpUmM6Q97r0Dka8tM7E4+k5XtiiRbW13XK9ijtiMw8Tsa3D
X-Gm-Gg: AR+sD10Ulpf14ANkdc3YPF3bYaA1DEf0o9ZYys7AHDlkL9CDAMplndBtpeUDWQPb+Z/
	3BsYuisJBQUkyAixtRpxWtrwuq+ixu8po9kYjEwrlVyEddVKbFj4ri9yjsNV9xvj1AGQjBnNJDy
	1Z5iUJz23y2IqHHdTXmdppQd05AAoTXDIB85lAJUt9Suxz9B7oEyg3BJmEGT2ifVMGQ4FYH5DxX
	DaSLcuBzzEQEwnnlwfvXA1eJwhgxfYAtXX2T6RGZEGi1fRjFZLJALR8YsIzq8F9LZyud6CP2Rx1
	qDQtr9b4yzOy2UzmO5uyJc9Zid8U1axMB0zpgOK3fAje4QGfhyiSPYISGd+Bp6+REsKvdAfgZ63
	BSN0ng/K2YILXQqRPTy71VnRuKa9+6iAzYQy4oeWTyIY8fxwHHTae82RMS98KVLULZQ366O5G1Z
	S7WyMVn1BFXowdnFRqqDJYJAOqI5Nh+WKnh4vYGpY0r0QQt1IjOk7v+hJMfis2FKnuWJQAL6UfL
	e8mrzs4z26LEErtsOFSxGBG4g==
X-Received: by 2002:a05:6102:5712:b0:744:d1a6:b11d with SMTP id ada2fe7eead31-75b2196452amr9735318137.3.1785827467764;
        Tue, 04 Aug 2026 00:11:07 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-76048c6cdbfsm55438137.10.2026.08.04.00.11.06
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 00:11:07 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-966e7380109so2200439241.3
        for <linux-sound@vger.kernel.org>; Tue, 04 Aug 2026 00:11:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoCb/gv5DieIwJbpAST0YwV4oR6wjwY3tMVnB5P4cW34C7jQKyvlaJAY+ghhepboh/grxzPS3yyUsXcfA==@vger.kernel.org
X-Received: by 2002:a05:6102:5712:b0:744:d1a6:b11d with SMTP id
 ada2fe7eead31-75b2196452amr9735286137.3.1785827465791; Tue, 04 Aug 2026
 00:11:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87zez4rmrq.wl-kuninori.morimoto.gx@renesas.com> <87y0eormr9.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87y0eormr9.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Aug 2026 09:10:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVSwY_N3XOa-Gzd4VaS_mNXG8erwm=eK7r_9w_fEspQVQ@mail.gmail.com>
X-Gm-Features: AUfX_mwsxmPkUnPcBJzD3t3PN5F1i-dmlYurP9YQ1xyCLYOpd8CYN3nNXuFUEuQ
Message-ID: <CAMuHMdVSwY_N3XOa-Gzd4VaS_mNXG8erwm=eK7r_9w_fEspQVQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] ASoC: renesas: enable COMPILE_TEST for Migo-R / SIU
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Morimoto-san,

On Mon, 3 Aug 2026 at 03:55, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> Migo-R / SIU are not compiled with COMPILE_TEST, and there is no defconfig
> which selects them. So it is easy to be overlooked for compile test and/or
> ASoC updating.
>
> One of the reason is its complex depends / select.
>
> SND_SOC_SH4_SIU doesn't have tristate title, which means it needs to be
> selected from other CONFIG, and SND_SIU_MIGOR is it. And then, MIGOR /
> SIU has many duplicated and complex dependencies.
>
> Let's cleanup them and enable COMPILE_TEST when it was for
> SuperH / SH-Mobile.
>
> And remove #include <cpu/sh7722.h> which is not used, but be hinder for
> compile test.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- a/sound/soc/renesas/Kconfig
> +++ b/sound/soc/renesas/Kconfig
> @@ -30,10 +30,6 @@ config SND_SOC_SH4_FSI
>
>  config SND_SOC_SH4_SIU
>         tristate
> -       depends on ARCH_SHMOBILE && HAVE_CLK
> -       depends on DMADEVICES
> -       select DMA_ENGINE
> -       select SH_DMAE
>         select FW_LOADER
>
>  config SND_SOC_RCAR
> @@ -75,7 +71,9 @@ config SND_SH7760_AC97
>
>  config SND_SIU_MIGOR
>         tristate "SIU sound support on Migo-R"
> -       depends on SH_MIGOR && I2C && DMADEVICES
> +       depends on SUPERH || ARCH_SHMOBILE

You can drop the ARCH_SHMOBILE part, as it is a subset of SUPERH
(if ARCH_SHMOBILE is enabled, SUPERH is enabled, too).

> +       depends on I2C

I am not sure you can drop DMADEVICES. Have you compile-tested without?

> +       depends on (SH_MIGOR && SH_DMAE) || COMPILE_TEST
>         select SND_SOC_SH4_SIU
>         select SND_SOC_WM8978
>         help

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
