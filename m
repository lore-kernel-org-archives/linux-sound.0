Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087132AF00
	for <linux-sound@vger.kernel.org>; Thu,  9 Jul 2026 12:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783601905; cv=pass; b=e5+gQSa0Vs96DCRDgSldKyN8wTFkd3w9tidCq59MvJzCgZdV763QUN5uOYX6CQzDWlRCSF5jP077+0NXwsrT/At+weF5TOzmlf0G8d8RA1yGw4FDCSpdRw4ntIeSviJ1lnuie52bwgI0txFDeYLhczAATiQFtjKRAny7lSuOq/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783601905; c=relaxed/simple;
	bh=KK9hwDA5AiKvzeH/qTHjFkFP9rQGMq1on8mUHUTgAYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ow7gQulMi3rODat95kH+a8dO9G4wa4OvYuNUqZvvc0gOfhcGbL2x3h8lwiCeRcieH//UkajKZO5ve/8dk5/goMlf2aCci4HTWs8EGdb8HaK+RmdsdcpgXKh2RdfhQCdg6s8GKXEiU9o2ZJJMX5AghdoLaqWg+38R4I57WWk2QfY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AiTUziEX; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AiTUziEX"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-51c22c61795so12507481cf.0
        for <linux-sound@vger.kernel.org>; Thu, 09 Jul 2026 05:58:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783601902; cv=none;
        d=google.com; s=arc-20260327;
        b=emerf4MTrcf47/sZ+C297vC4xtYVY38mhDGdbBYBTUriHIZvUN3pQQE/4DqyoSpWbW
         akZ1u8EJtaSyQslqc3d1VkX+GpVHpK0u4UTZlSL6rxk44MQkRE18C7Kq9FEue8kx01N6
         qGPqXF6nqDgB1K4A9gXFlL7xFU8+O8kROUqqC9hTgB1qNnNka+2YuX/gnRQcg5bKFoNc
         XGhdFXbREQXssYTL3e6n7HcM7VEzoYopW8fm3GhUkZ7d5LABOP2GNtlpwk1vQfr8VL2m
         9/i7ayoBxAE2J2rLHvYuWKMaOkL1HoM1D/Lx9ZStImtPJNNhc5xKJl6T8EuREdiF0SbW
         AYHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QSEuXHG0Lq8Epm5YYWS04gzhKK04Q5sfFYXLYd70N18=;
        fh=yaXK8DCE5puuvGCEIEQm9zdX/whUSWq61VvaN9JpEsE=;
        b=mv+AotCqfO9K1mBKNlaQrIXCvlClZPOTugXUnwLWwDbgH2GkIW0LBpHnOws2R1N7BL
         hfj663aUwxZUYM/+kUrgNS78ME8zEh03+mjjyG5sIw5gv3XdgmE7K06raH4jq2ct7lNA
         21kLYK4xliTLJ7DSsy/Bylll/EUoyvXwGYXpLOGGJvCSNWdqE2P7nvcQ1jGzF1g07dl3
         NO0FzwTq8bVrZqf3VXYDupaBTCyMYXo/3UBw8EkDTmGuaD5AK5EfNyV4dLo0fTLszVrw
         uaRJDDrb6j8cJg7/9LsI0MpJsCXLCMnUY8hgSG0E2W6Dv/UTVDD0fCREzWNO8YqBoX+E
         r/5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783601902; x=1784206702; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QSEuXHG0Lq8Epm5YYWS04gzhKK04Q5sfFYXLYd70N18=;
        b=AiTUziEXQHeNMOoFbyp1TB0KLT4kk8c5pOWEFqXz0ddM+yBwYkAVmCIrvPTKuXUzlc
         A1MUnmhFAYQIM6nnb40vqIwQNL13ADMHbX+YbHkRJPb2/G71L9wCqGdKL0uqlsz53dKW
         IB/CGbxz28spiIKwGBnPsvcqK+Dg2iaSsJA0GBeC0Z3HmmN9YxZMCsCJaEVfsEE4PXtG
         vKQBamjQnH7FpnmXOm4gQgZuH9vY4yhoPVFQ7b5GGxqYdyb41CqlSA8XlB4gQlA99C+O
         ebrP5l+ZF/i6aVyygvlKXNnc8p6NzHKfIF28uJC1AjCJkZh6XltmQKfWtEibUYusKEBZ
         aUog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783601902; x=1784206702;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QSEuXHG0Lq8Epm5YYWS04gzhKK04Q5sfFYXLYd70N18=;
        b=KVP1Nw+YnFqOFxfIrvG4lzTnbs6oQJ9Ps60WFTtsMWRemhyhkq5Lmozjz0BTY85hxL
         S27nY7Hejh1YNWykrOqkXrtL50nWI2dt+wEsUhpVCKOjzkf4yUmPFKiPFMJ0n/cilinG
         IX5Pa2VE3HozBh41sZS86pqe20ku7Ujqk42aqnvhzfnjJcFjY26pZAyrQIIQ6rqhPf78
         BIZ/0Vi7HcrxSsUpwJST0ff68pEZX+LgefTUnEkQXCv3UACrNoWt+MxMPUDVjYXSKji2
         dgBbLaqjHAQ0IUuKzJR29HRewn2uOQbRjhnzUFZkiW/vdLvgJ0tu5L+uG+xIbAyDvOLb
         dnJw==
X-Forwarded-Encrypted: i=1; AHgh+RoSke85DBcDXfL7ccyTF/eEIWCD5z3fNcH4dRZjLbfXuiOaXAg0jRuI06XECNBCtxF3LnppSgjS09dC+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywspy0i6soOvObToww7gsOSjoyZT9MDFjOEJTaMwn/oZTyrxNae
	0/78I+VEjn2l3zjpBZRsTiD/eYoFQA4B22bUNGbTtN9ovGKl3ZRRBjs3RssfsVarPt6cKbM4/dr
	xY5UXIX9+TWdtv0th7raqIdT+WciAmkLVoQ==
X-Gm-Gg: AfdE7cmK51k4/vhW31YWxzcNFu54m4YhdPHB44EgUGUWfnUL+t8p1A34ec7sV4FHe0v
	k0vKbRN3kZI6x6hWPy6niSIEKQMGSpBX+AC4DTkO7YPdDYj+6LYbCJfUnute3DN1IybzkUCKvrW
	LXqy93izXj0x2hIxmjwkmex1vJyQ/y20NgIf9778lI0fabxtCCO2A1cHl63J72hfjWbey3eTzd1
	0m3XRnkrsCBH2TtXGqpohCXrXtqE2wgQNDG1YWBTVzPaIrJiB4iTE9GFZ2icelJY0R1twEtUiip
	xRi/pT3DPPHhBmaWOldHY1USJ6NKFxCxvyWb0Y9Tb84mlTDKQIM7HTq1wf7V
X-Received: by 2002:a05:622a:191c:b0:51a:8c9b:64a1 with SMTP id
 d75a77b69052e-51c8b40e801mr76177561cf.69.1783601901767; Thu, 09 Jul 2026
 05:58:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709043740.329504-1-phucduc.bui@gmail.com> <CAMo8BfKVyG_nwDkeX=7fdOxz0m5SPD3YpFxRbEEipfkjejNqHA@mail.gmail.com>
In-Reply-To: <CAMo8BfKVyG_nwDkeX=7fdOxz0m5SPD3YpFxRbEEipfkjejNqHA@mail.gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 9 Jul 2026 05:58:09 -0700
X-Gm-Features: AVVi8Cfs3TSHUNj7eOt39nBwu3qAV_XKer3j-_pp-XWt2Wr8XLZnqXDuYRv3594
Message-ID: <CAMo8BfJqNLTUVqXb1miMvSaYhE5bE_8xho7f678_1PJXoWXOsw@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: xtensa: Use dev_err_probe() and drop redundant
 error handling
To: phucduc.bui@gmail.com
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 9, 2026 at 5:55=E2=80=AFAM Max Filippov <jcmvbkbc@gmail.com> wr=
ote:
>
> On Wed, Jul 8, 2026 at 9:38=E2=80=AFPM <phucduc.bui@gmail.com> wrote:
> >
> > From: bui duc phuc <phucduc.bui@gmail.com>
> >
> > Convert error paths with messages to dev_err_probe(), which combines
> > dev_err() and the return statement while also handling -EPROBE_DEFER
> > for the clock path.
> > Remove the redundant "err:" label and return errors directly. Paths suc=
h
> > as platform_get_irq() already log failures in the callee, so they simpl=
y
> > return the error code without printing an additional message. Inline th=
e
> > pm_runtime_disable() cleanup at its only call site.
> >
> > No functional change.
> >
> > Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> > ---
> >  sound/soc/xtensa/xtfpga-i2s.c | 60 +++++++++++++----------------------
> >  1 file changed, 22 insertions(+), 38 deletions(-)
> >
> > diff --git a/sound/soc/xtensa/xtfpga-i2s.c b/sound/soc/xtensa/xtfpga-i2=
s.c
> > index 9ad86c54e3ea..fd0990201b40 100644
> > --- a/sound/soc/xtensa/xtfpga-i2s.c
> > +++ b/sound/soc/xtensa/xtfpga-i2s.c
> > @@ -533,34 +533,25 @@ static int xtfpga_i2s_probe(struct platform_devic=
e *pdev)
> >         int err, irq;
> >
> >         i2s =3D devm_kzalloc(&pdev->dev, sizeof(*i2s), GFP_KERNEL);
> > -       if (!i2s) {
> > -               err =3D -ENOMEM;
> > -               goto err;
> > -       }
> > +       if (!i2s)
> > +               return -ENOMEM;
> > +
> >         platform_set_drvdata(pdev, i2s);
> >         i2s->dev =3D &pdev->dev;
> >         dev_dbg(&pdev->dev, "dev: %p, i2s: %p\n", &pdev->dev, i2s);
> >
> >         i2s->regs =3D devm_platform_ioremap_resource(pdev, 0);
> > -       if (IS_ERR(i2s->regs)) {
> > -               err =3D PTR_ERR(i2s->regs);
> > -               goto err;
> > -       }
> > +       if (IS_ERR(i2s->regs))
> > +               return PTR_ERR(i2s->regs);
> >
> >         i2s->regmap =3D devm_regmap_init_mmio(&pdev->dev, i2s->regs,
> >                                             &xtfpga_i2s_regmap_config);
> > -       if (IS_ERR(i2s->regmap)) {
> > -               dev_err(&pdev->dev, "regmap init failed\n");
> > -               err =3D PTR_ERR(i2s->regmap);
> > -               goto err;
> > -       }
> > +       if (IS_ERR(i2s->regmap))
> > +               return dev_err_probe(&pdev->dev, PTR_ERR(i2s->regmap), =
"regmap init failed\n");
> >
> >         i2s->clk =3D devm_clk_get(&pdev->dev, NULL);
> > -       if (IS_ERR(i2s->clk)) {
> > -               dev_err(&pdev->dev, "couldn't get clock\n");
> > -               err =3D PTR_ERR(i2s->clk);
> > -               goto err;
> > -       }
> > +       if (IS_ERR(i2s->clk))
> > +               return dev_err_probe(&pdev->dev, PTR_ERR(i2s->clk), "co=
uldn't get clock\n");
> >
> >         regmap_write(i2s->regmap, XTFPGA_I2S_CONFIG,
> >                      (0x1 << XTFPGA_I2S_CONFIG_CHANNEL_BASE));
> > @@ -568,41 +559,34 @@ static int xtfpga_i2s_probe(struct platform_devic=
e *pdev)
> >         regmap_write(i2s->regmap, XTFPGA_I2S_INT_MASK, XTFPGA_I2S_INT_U=
NDERRUN);
> >
> >         irq =3D platform_get_irq(pdev, 0);
> > -       if (irq < 0) {
> > -               err =3D irq;
> > -               goto err;
> > -       }
> > +       if (irq < 0)
> > +               return irq;
> > +
> >         err =3D devm_request_threaded_irq(&pdev->dev, irq, NULL,
> >                                         xtfpga_i2s_threaded_irq_handler=
,
> >                                         IRQF_SHARED | IRQF_ONESHOT,
> >                                         pdev->name, i2s);
> > -       if (err < 0) {
> > -               dev_err(&pdev->dev, "request_irq failed\n");
> > -               goto err;
> > -       }
> > +       if (err < 0)
> > +               return err;
>
> You convert other dev_err() calls to dev_err_probe(), why not this one?
>
> >         err =3D devm_snd_soc_register_component(&pdev->dev,
> >                                               &xtfpga_i2s_component,
> >                                               xtfpga_i2s_dai,
> >                                               ARRAY_SIZE(xtfpga_i2s_dai=
));
> > -       if (err < 0) {
> > -               dev_err(&pdev->dev, "couldn't register component\n");
> > -               goto err;
> > -       }
> > +       if (err < 0)
> > +               return err;
> > +
>
> Or this one?

Doh, the answer's in the change description.
Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

--=20
Thanks.
-- Max
