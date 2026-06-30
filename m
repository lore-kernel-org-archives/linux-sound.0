Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC243E63A8
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 15:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782834259; cv=none; b=EQIfbG29pjMADxxHukLOaSRlvit2NECkHHiSNMh2+aYzEe6XLG6O1YCWAhuvqnKK3bMn0UbydrSqbhn1GoS5XLVCIY8K84PVYUB6TuIEZGiJ3v+Y+oQesc9C8jHPfnQKaBBR7Tkc0kEFUvh9mQtUbZfXfd2mx1HYS+kmdQAO6rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782834259; c=relaxed/simple;
	bh=CuTZcG0NTQSK1IiuWewtoKi7VjACdfVhijFD8N0XzcQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N7tHQ1l+YIyyooAeagS8IC5rMu7pIRYvMirwGEBi+r7UYpdQlNwniaxVX2yO3vIwTxc72mIra5ID9onl6JJUQ3wH6ayp2FhZsaPxG3CGZ8G7Pd5nXGAN5DtDdC+s5bGzDHtgsqxvog//sNdL0T5Qvh966u7wynAieNU4XdrnFXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5bdad7c16a6so1478239e0c.2
        for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 08:44:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782834257; x=1783439057;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yXzNdN4BqbMf7eZ7YSG7ooOCqB2xenrTYSdSfGtHZp0=;
        b=M6p/93bXg0oZ/EcYjS2lZfY/fS1UOEwXE9Ew0sFERo6wMgcbyeCKa9Vbd04gD+8F95
         P7hD8VfcHUfLPuR7fMy7eztrk+O660QE3mWRo+h5OE+dc92VZrXJYnFEwQeKGimRu6Sy
         n5dG557jOVS9XekyWpoyarUEju2vdmsEvrLYbnHOp0gfRjrPDIygzHlHRtDrbW5jc8yR
         J2YF0tpMjFE1mKBlUyqXgIfuPLLIbCZTBhg1faVZNOp2ke4L+B3Z8LhknvAvRJzg+49t
         +X1qESJCBpyfUsR23PQo3UIlWTc2bXKyJF8TO/mt0kyb0/MrBtkpQzM4qlylTRTb6VP9
         iU4A==
X-Forwarded-Encrypted: i=1; AHgh+RqcaB/vywjH/HpEPTUx8KJx0XVdYSdwHMezksLQrkeIfN6l+LLj+N95eXMmVl7oThVR4IEcgTeXKbno0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCeihkIDUTers02ATTxvX2ha0eCnYNfvf0MwHJMhnDmEAJ8a7V
	WXctJ2BnPRVEzWnaSaxj6V+M8U4cXS258xt+jcyFPsWl/z/dO8Jk+udtTwQrXRwbA/o=
X-Gm-Gg: AfdE7cmKdzrH+6v3J4FAiBM4s4cXCxvklEUWpbAEA0mJoPdPcSI53gQmrgnzRkjEdiN
	1ZJ6s5TOjyWuATlbd4AbOwfGodkLBHI9GoNlpDZYdVGEyhadpCzzcisv78ISUgf+Sh4HAlZUPvV
	oZh0YO5A5se0O3OdYfE/YcIGJuxz6T1khVh0OMWRMli9fwPFvm6z/vNH6Z5JzqsZEptCCGdPuI1
	g908arGWe6IDXpqDrka1+dh5IzkArPjI7VU2Q5TK7yXJInlsRzXOUOTgmsnhDrbLe/eWrR1sUje
	4nvL90ssE/ziHScQt0IpCIjEJ/SxsRjVJMkJ1JpzUIezA3MhYgfiX/VaZpo+ocydS7q9+uRb/Z1
	zcO0xk2HH3fgJR7lVWE/SLJY8cXl+16QELa+lRNlwAmmICcsCU7eRe4vbz9suxZ93iqeJOcNnga
	kQZYs8VEz0QlADt9x2xDqqZ5FGtsqh1DGjVT1dSj9yK5KohFZduA==
X-Received: by 2002:a05:6102:6442:b0:738:6994:eb8 with SMTP id ada2fe7eead31-73a333ba660mr2213911137.0.1782834256936;
        Tue, 30 Jun 2026 08:44:16 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96965e99958sm1185026241.5.2026.06.30.08.44.16
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 08:44:16 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-9691ba8bc8aso2908002241.1
        for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 08:44:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrkMXuor3eWzvqbPYRootb6XxwqFNwuFlyRLCWCnCSPc2tgc16oZzbb0VKdZOhhB+wZYPfmsSJC2o4I8Q==@vger.kernel.org
X-Received: by 2002:a05:6102:3047:b0:631:ec2d:12bd with SMTP id
 ada2fe7eead31-73a35ff1e67mr2422168137.5.1782834256087; Tue, 30 Jun 2026
 08:44:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629095326.37302-1-ahmisaranrao@gmail.com>
In-Reply-To: <20260629095326.37302-1-ahmisaranrao@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Jun 2026 17:44:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdURWZ-MFLNXVra-nwRi2m-fPnY0JUU=WFR7YOYBNi2w+A@mail.gmail.com>
X-Gm-Features: AVVi8Ce0nVeOsm0mLFiUh1ZnQx2aijL2YQYWOUlGz5qCeiV3-tLvcxG9byGNYKo
Message-ID: <CAMuHMdURWZ-MFLNXVra-nwRi2m-fPnY0JUU=WFR7YOYBNi2w+A@mail.gmail.com>
Subject: Re: [PATCH] ASoC: renesas: fsi: Propagate platform_get_irq() errors
To: Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
Cc: kuninori.morimoto.gx@renesas.com, broonie@kernel.org, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Narasimharao,

On Mon, 29 Jun 2026 at 18:25, Narasimharao Vadlamudi
<ahmisaranrao@gmail.com> wrote:
> platform_get_irq() returns a negative error code on failure. The
> driver currently stores the return value in an unsigned int and returns
> -ENODEV for all failures, which loses useful errors such as
> -EPROBE_DEFER.
>
> Store the IRQ in an int and return the error from platform_get_irq()
> directly.
>
> Signed-off-by: Narasimharao Vadlamudi <ahmisaranrao@gmail.com>

Thanks for your patch!

> --- a/sound/soc/renesas/fsi.c
> +++ b/sound/soc/renesas/fsi.c
> @@ -1992,7 +1992,7 @@ static int fsi_probe(struct platform_device *pdev)
>         const struct fsi_core *core;
>         struct fsi_priv *fsi;
>         struct resource *res;
> -       unsigned int irq;
> +       int irq;
>         int ret;
>
>         memset(&info, 0, sizeof(info));
> @@ -2007,12 +2007,15 @@ static int fsi_probe(struct platform_device *pdev)
>         }
>
>         res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       irq = platform_get_irq(pdev, 0);
> -       if (!res || (int)irq <= 0) {

This check also covered irq == 0, but that can indeed no longer happen.
Might be good to mention that in the commit message.

> +       if (!res) {
>                 dev_err(&pdev->dev, "Not enough FSI platform resources.\n");
>                 return -ENODEV;
>         }
>
> +       irq = platform_get_irq(pdev, 0);
> +       if (irq < 0)
> +               return irq;
> +
>         master = devm_kzalloc(&pdev->dev, sizeof(*master), GFP_KERNEL);
>         if (!master)
>                 return -ENOMEM;

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
