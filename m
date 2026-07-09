Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D064175A73
	for <linux-sound@vger.kernel.org>; Thu,  9 Jul 2026 12:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783601765; cv=pass; b=KR6CMrJra82/Rr2Iq/lxyeM08pN7IMRRHDac92GxawJdmmfBt5n5y6frrillCCndaxcSNFHid4KMlRB+5cdbnH0KcT4IW0giBMMo4vwE43nv3ZTvFHT+frrsoe9FNv6vmHBUhPkqNSKNWEJhWVeF45h38CRz5seWOiLm5tk5Pdk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783601765; c=relaxed/simple;
	bh=A152yl4FQfF8oVlvpbYjbJssufd60wO1F8sbKkaZKHw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ADY35LwTWh2Ra5URY9rTB6+aOlabVIaIZcrBk6aB3f2pl8+ux2QptxjTOVQx+FMZ+mE9t1rE/P3cbYkXLkLcyKamVeBcalxtArgbTU+5fjw7+aDRtZOIVc2q3Jt4VdXcVes1p2EFvAfRpkGk6QvEQN3YS7CEuRg0St+N5xJ5Xm8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mUk1kAMa; arc=pass smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mUk1kAMa"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-92ed19f4d60so55134585a.0
        for <linux-sound@vger.kernel.org>; Thu, 09 Jul 2026 05:56:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783601763; cv=none;
        d=google.com; s=arc-20260327;
        b=LZ0weLXM/IjUBqu0LPvkRP6q76ejop1yV2lNwoMpjZwxJcb4eBfaVY5g6wojF68/Im
         +hOH8uzT1r/e8kJGk2WTQ99KJUMLLDbpuvElYH26rQFeNFD4aL/dAlfn4a3T4VMUMWU2
         9XUpmzKZEpa2oOay6y0FjuDLX+6Wf7675dDw0y0FQbsF/RDmIen6+UEqXoPFDmirjFnw
         REAKK9I4KJ25CCF47x9UZJCcKx/dfBNFpvg6FGI1fJbGh0RCjwljtSIG8p5VSHnTef8Q
         J2HgawToqnauE4cEQkMHCJ9Nd3uuXn3tZmq2jbbo3DCZFgXrUajd4ctYXJTUUn0cQXbt
         Pp3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ESw8uE8weAtu4Nmi9uNYxuVBX83lEZ3HD0Yy/xZDAL4=;
        fh=XFzU4izjZHv5P2DEr28reCg2qSfNkalR3GeGPWkM0GE=;
        b=DbZUTBd09Jk4moj5duAoUPpikgh1npW0NaKoIIIfeXBqHlPNP017z7TF1dQzND+2HI
         Bzv42HlCdWaZWMBt3NUDGinQYXs5bLhdLppd9dn35P5CWlu4hDxP7FKbyGExd+fjvEY3
         acqr4QX3pT79y72w+sO7FqMuVLseYTDZuLMAQ0aFrwlgZpX84q5hqh5D+TN4udmGKTFD
         OaXO7QZcl3LnqxqItS9Vc63T/Ttz8G/gNYtYL9yVCnoLvYdEZmXoHcEz+R/k0X6BOPzs
         7jW2zPN7YXqD+Fj6r+QBi5TNNd7D/TIzXRxwYE+z09OA8GeseU5jMujdhvEGip1AqH8y
         3uFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783601763; x=1784206563; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ESw8uE8weAtu4Nmi9uNYxuVBX83lEZ3HD0Yy/xZDAL4=;
        b=mUk1kAMausFnNXp0JQaKw0f2Kkc/VnmiCFxisdJtPA/+qB+yDHt0jYW/ax4/G/2EXI
         aKyGGnupvocnK3Lq3GDzYe8+e5Le36V+VHXRPjuTZRHDwsRA/ZYAP3D0CfLx2UaaLqwA
         z888pfr55gz2wokPvRvzNx6WSs7JWF4b/ACaRoPIp7/pBtN7cl8ZwKOD4mslbl3U97La
         1Zk6CCDXSmWX0NZBgnni11diM31VCuD6hJr8tFIQAh77QRmTDQCxvXLPvq0Ov/8e37Zf
         HedGkZsyQIO3gs5icLHeyVLfS/amzo6FlNy+55v509BdqqwxUtWGG8nsVMJvPG2/3BjP
         yuNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783601763; x=1784206563;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ESw8uE8weAtu4Nmi9uNYxuVBX83lEZ3HD0Yy/xZDAL4=;
        b=k50wheQB+0wZTFePiK/02nH1LbBqujPWRQQXaIn2/FJPlp8/9bQveIOpoLxNFv51gv
         VzAMmAO4Ti4nJ/w7A0JnxfYlbLwuzTM3NXn9uCvMkxsdBWxo2isFy4Bx8ufusruZ/dvi
         HEAtgnMS3jPpyB2RAEuI7MOn9fhNBTO9khvqrY8VKHhZYlizjCUAydN9tIbfEHkXTvGR
         kyLfBaV2O3s2R4L+XUPcDX3FPVZIkolkoFV5zODivXUXjE7U+W6ZuY62D47mmVgaWfB9
         c7bSAOLR9XD0PVHks/uejOLEYHt4UpZt+nEeExc0qtAgwG2Mg2Dbla6G/I0PGZ1/9Bfr
         U7XQ==
X-Forwarded-Encrypted: i=1; AHgh+RqzQcSrylmZ/YGaSJMCqrqIRan9dMGMMFoXTJkB6of3/XJMDwieGiJqHWiQ9R3aAsxUGMytgZIaGGzbNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5Vj5e9z6GCa42A8DVRdVIjAovZV60BNzYYD1mIOkyTrQ7STIe
	sDDHb2tuLvakNHE8dtC11S6qYW0eMyry5NOSElQ39QdRdZvv4mfccG3O2v+aeXKD1vOxdSvIzOl
	G68mzSCwsmxf1FFXxv91X0M53qS6ARW4=
X-Gm-Gg: AfdE7cnmPqXu/qAnavAox6OFz90QfvHehWmrwq9H3Oc+bwNKlpUO/aiyJe157MiQ9VZ
	TP1s4anm3Tl79ZdrbAh4Kaxad/PojeGwU3TEn/OT9+Nu1lspBZ/T0lqylGAGgQ/Fxp9gMgnMV2w
	tBvwAscu6SfYe1p9PmiVihoXXQVqPuTEbzC4MNiM2b5/mhV5Qw5J4HRUiB/6c54vhxBBek+HaVP
	QuL+oJj8aI8qLXGde7VpYof/4e+seojcE/m4fNx77+FFMx+NJ+PUbgoFlIjM5KCJYJWBjp3ukjY
	CSmqeMNmuex6HQlLS6yW/xgN5IiFXN5BAfKqYhtXAbWbHZgQKDjde//29ANk
X-Received: by 2002:a05:620a:1986:b0:915:9da9:b541 with SMTP id
 af79cd13be357-92edab242c6mr291823985a.10.1783601762806; Thu, 09 Jul 2026
 05:56:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709043740.329504-1-phucduc.bui@gmail.com>
In-Reply-To: <20260709043740.329504-1-phucduc.bui@gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 9 Jul 2026 05:55:51 -0700
X-Gm-Features: AVVi8CeYvVkO-o_imHHoszFAVP3I9f6VTGBSIv4eQtAcBcWOLMBO_hJtoEvut44
Message-ID: <CAMo8BfKVyG_nwDkeX=7fdOxz0m5SPD3YpFxRbEEipfkjejNqHA@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: xtensa: Use dev_err_probe() and drop redundant
 error handling
To: phucduc.bui@gmail.com
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 9:38=E2=80=AFPM <phucduc.bui@gmail.com> wrote:
>
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> Convert error paths with messages to dev_err_probe(), which combines
> dev_err() and the return statement while also handling -EPROBE_DEFER
> for the clock path.
> Remove the redundant "err:" label and return errors directly. Paths such
> as platform_get_irq() already log failures in the callee, so they simply
> return the error code without printing an additional message. Inline the
> pm_runtime_disable() cleanup at its only call site.
>
> No functional change.
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>  sound/soc/xtensa/xtfpga-i2s.c | 60 +++++++++++++----------------------
>  1 file changed, 22 insertions(+), 38 deletions(-)
>
> diff --git a/sound/soc/xtensa/xtfpga-i2s.c b/sound/soc/xtensa/xtfpga-i2s.=
c
> index 9ad86c54e3ea..fd0990201b40 100644
> --- a/sound/soc/xtensa/xtfpga-i2s.c
> +++ b/sound/soc/xtensa/xtfpga-i2s.c
> @@ -533,34 +533,25 @@ static int xtfpga_i2s_probe(struct platform_device =
*pdev)
>         int err, irq;
>
>         i2s =3D devm_kzalloc(&pdev->dev, sizeof(*i2s), GFP_KERNEL);
> -       if (!i2s) {
> -               err =3D -ENOMEM;
> -               goto err;
> -       }
> +       if (!i2s)
> +               return -ENOMEM;
> +
>         platform_set_drvdata(pdev, i2s);
>         i2s->dev =3D &pdev->dev;
>         dev_dbg(&pdev->dev, "dev: %p, i2s: %p\n", &pdev->dev, i2s);
>
>         i2s->regs =3D devm_platform_ioremap_resource(pdev, 0);
> -       if (IS_ERR(i2s->regs)) {
> -               err =3D PTR_ERR(i2s->regs);
> -               goto err;
> -       }
> +       if (IS_ERR(i2s->regs))
> +               return PTR_ERR(i2s->regs);
>
>         i2s->regmap =3D devm_regmap_init_mmio(&pdev->dev, i2s->regs,
>                                             &xtfpga_i2s_regmap_config);
> -       if (IS_ERR(i2s->regmap)) {
> -               dev_err(&pdev->dev, "regmap init failed\n");
> -               err =3D PTR_ERR(i2s->regmap);
> -               goto err;
> -       }
> +       if (IS_ERR(i2s->regmap))
> +               return dev_err_probe(&pdev->dev, PTR_ERR(i2s->regmap), "r=
egmap init failed\n");
>
>         i2s->clk =3D devm_clk_get(&pdev->dev, NULL);
> -       if (IS_ERR(i2s->clk)) {
> -               dev_err(&pdev->dev, "couldn't get clock\n");
> -               err =3D PTR_ERR(i2s->clk);
> -               goto err;
> -       }
> +       if (IS_ERR(i2s->clk))
> +               return dev_err_probe(&pdev->dev, PTR_ERR(i2s->clk), "coul=
dn't get clock\n");
>
>         regmap_write(i2s->regmap, XTFPGA_I2S_CONFIG,
>                      (0x1 << XTFPGA_I2S_CONFIG_CHANNEL_BASE));
> @@ -568,41 +559,34 @@ static int xtfpga_i2s_probe(struct platform_device =
*pdev)
>         regmap_write(i2s->regmap, XTFPGA_I2S_INT_MASK, XTFPGA_I2S_INT_UND=
ERRUN);
>
>         irq =3D platform_get_irq(pdev, 0);
> -       if (irq < 0) {
> -               err =3D irq;
> -               goto err;
> -       }
> +       if (irq < 0)
> +               return irq;
> +
>         err =3D devm_request_threaded_irq(&pdev->dev, irq, NULL,
>                                         xtfpga_i2s_threaded_irq_handler,
>                                         IRQF_SHARED | IRQF_ONESHOT,
>                                         pdev->name, i2s);
> -       if (err < 0) {
> -               dev_err(&pdev->dev, "request_irq failed\n");
> -               goto err;
> -       }
> +       if (err < 0)
> +               return err;

You convert other dev_err() calls to dev_err_probe(), why not this one?

>         err =3D devm_snd_soc_register_component(&pdev->dev,
>                                               &xtfpga_i2s_component,
>                                               xtfpga_i2s_dai,
>                                               ARRAY_SIZE(xtfpga_i2s_dai))=
;
> -       if (err < 0) {
> -               dev_err(&pdev->dev, "couldn't register component\n");
> -               goto err;
> -       }
> +       if (err < 0)
> +               return err;
> +

Or this one?

--=20
Thanks.
-- Max
