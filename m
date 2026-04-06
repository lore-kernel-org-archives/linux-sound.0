Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6654A334C1C
	for <linux-sound@vger.kernel.org>; Mon,  6 Apr 2026 12:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775478757; cv=pass; b=UHKTA/O2J1S2gBA88HQQjXWQaVmqbBtFiVPv650gxkQ2o/u7ovFVH+8cObqtqioN+3zmvqe/Wgf6HHrvp+vpGdy3eFX2RavxErjnlxRyleSDX5ZXbYSxJRy6D94SS2G+SKWQt6vv7T/n/mbIIz0Clk0Kbp8hJsHhv6b9RWcSjus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775478757; c=relaxed/simple;
	bh=NnYpzCjbOPa23Fsh/bL9Mp8xGA8K8foKfgmggy1BxJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=flKKli7/AgqVUcWRXYcx13CdvnvjgUI/CCI+SZpdlVXgnLYBFak7D94svNyfjr0GeBN3rl8mN/q/+0zte58cw7HwVSWrEsnsGFs6/0Oi5wa068zC1zx/zpbBwhIW0h9qzq1QyvRfrRvus98SMZqBFQENMv/Nskwexjbs2CK7C3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+gwmV90; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+gwmV90"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2b299b3c739so4650175ad.3
        for <linux-sound@vger.kernel.org>; Mon, 06 Apr 2026 05:32:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775478756; cv=none;
        d=google.com; s=arc-20240605;
        b=bfJ1sJ2SR/3L65sYXDRUWAM+ZFi/6xZSAtcAGf6LTEo1mcmGLxRZFp4UppoVzsDnH/
         8e5bj++xvLLHc3xMzWFjcldgTqUWM8JG+qShBRJjmnSCBUqM7tijWUBsXJP0JzD67FjV
         VPocZwCvzumTx2X0pJqBRhYhbUb9uoPcTBlNdwCummXaIShsENWc+jM/gopYY2Nqi+Hl
         z/6E5vRxTvplqR/ikO1/2M9DpeL2yxD0pC6usVzWBOYEDYjnoXAIsxh7MbWmaN/hASuC
         NnXRlGXPf3NmG4n4iuuMCC/itaA26XHhHuhqtv+IbDeN+WzpiTG1hhcG+SNSTgxRzQ1c
         xpCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BpJLMv/PN8ttKmYeWwPZWYWOIWYBgFzlU3AGL8Sjwio=;
        fh=YXsDakAvh5TFcFFX4rGcOZP4EyKjEfqQnzTcTrguV78=;
        b=jShFlPKJqjVE/wnS3ZbPIQqea/85yU49TDHXwCaryeb9VXOooA+phKKKJSB4P12i/4
         eOFUuc/ul7K8OrUsXtQStyo61jQn2WhVTRPZXcYdrmBFpv8UrZNcyEFthn3slBBUaAJC
         OMPA1lwRjMOD/tFLf3DxFlV9JxqzM7Nd8DSm8JQBPVqCKwrJFD0zjAbsGx7uLDg51fW0
         UMbqBEPFI7Lj3xtpmT97uKZnw7/Ve1dwRAs6D1ybVsONOPyTKmF60Z5PGyqiHD+l7dXq
         oBwl6JTij6HKnAa5ykZApMbmi4VW6C1y3T9vOcfyovR9b3HUmmhuhHwiHaGsa2I655u6
         NxZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775478756; x=1776083556; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BpJLMv/PN8ttKmYeWwPZWYWOIWYBgFzlU3AGL8Sjwio=;
        b=O+gwmV90EhAzTgPuoR/DsXbd+e9m+urrblot0oqEfepq1stiHBFtmLgYMfWsY5Ou69
         qZZfLKBS3BHQm3uksntzh3Qlw8OWhlulDCefBzcsfX9Petd2uoNDNyN1EpdhXQKd0cMU
         frffudik7CBD0hNmH78A1KVPwJ2BEdVkJwo5fWUcNFYRCUwL+FblB8EDUXLfbh21o7rJ
         gu9A48ydiN4oerKVEmWNRPGqYqhER/tydRxGqxdF4gSVSbl+Qyz14BNHC11MHqOEJdZV
         +q22SqbktD/uAGNqCqM4xn4gYL6w9/osCCfksKprAI1KYwRliuhuIt1T4e2LWN8K5+Zd
         LRFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775478756; x=1776083556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BpJLMv/PN8ttKmYeWwPZWYWOIWYBgFzlU3AGL8Sjwio=;
        b=D5dLUgEhHkXM8o/CQbhB10WfUsP6LpVETCt5FBFbDL8wlMnpFzHZ4+BzNNMDADPHj6
         0/KE0TbDfHpxSlLhfV94sTw1PmEw57qn/A67NqJNNgDUOlcUscfitG4j5ima9mq2a5gE
         uKddzgCgEThaM3PxI/qVTueK5l+T2UlqFN0Qa4QZbOMV9JkkNbYAFT43u2EyuBBL7rhj
         TCuwkO0is7WoBdZSSo5vebJ0yuzzuqqzYceoOg/JgbZd9D25e1Mex0PuKslLsMKJNqLQ
         2Lw/Vfb4FGquvr9TQYOfn06OogE+LtOTrBWC5PICmxlColb/GFCEDD+cxJyCxnTeF7J8
         wnfA==
X-Forwarded-Encrypted: i=1; AJvYcCVqgfkGI7l83egHh7+f6EaeZf3+PqDRdrnwRkUbQvxOZYIPcJBtbN1q04mUvwbfst4Io6ANSdDwRnfe/g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwqj8B5rcgnJrylRV91sdNU0mWo8OXJA6vqHHY+iWGQy1rqg2J
	D++3J5QSQVHX6SAfFZwTmuZ7pjvMWT3zWG1MkiBWOqzcHOessiFahS6WTJcjHHjNXJYt9yuklug
	wcZQlcsM+fMGqg+yhMXU6s4MeQC8e3O8=
X-Gm-Gg: AeBDietxBay9uMdbtp0C/67ot1AmZh9cIm3IGIaTblZS085KFI7fB7oZNGuoULhy6yI
	h92qFrf3xjlA1+0lDA1EmoY23dfqACA968Ez9H7ANenhEKmr0HX+/UBAwS0N6ptXz2U8CvdWMCT
	tM54/FKksktTX8Sle7LqT4onJ/TlziYjfanAvBJ11e6UsPggeDyezhyE9Aw8Bln7GukrxkuQIKH
	U+PoZhVH6K10026Df5QvVbmhQ/kwPzjRSQuqu2hrveL8hqH6aeuYeoW8ud5W0W/QH+RKAscDxYL
	Lzn49+FWaCGF7Yi/bfbSzZsKa8P2qebtenFb7Q==
X-Received: by 2002:a17:903:2c04:b0:2b0:5075:96d1 with SMTP id
 d9443c01a7336-2b28176a618mr133938205ad.24.1775478755494; Mon, 06 Apr 2026
 05:32:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403112655.167593-1-phucduc.bui@gmail.com>
 <20260403112655.167593-4-phucduc.bui@gmail.com> <87v7e5t16l.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87v7e5t16l.wl-kuninori.morimoto.gx@renesas.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 6 Apr 2026 19:32:22 +0700
X-Gm-Features: AQROBzA0_93mm2t7r0WlUl14fX7SUBUPYxStZohF-_IJd-zBH4HmuI7FuU4RnJY
Message-ID: <CAABR9nGUyTkDmB0SgKAuM1Pp75L=m1q4bLSfhobm98TswDnt8w@mail.gmail.com>
Subject: Re: [PATCH 3/3] ASoC: renesas: fsi: Fix hang by enabling SPU clock
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Morimoto-san, Mark,

Thank you for your review.

> If it is needed for register access,

Yes, enabling this clock is essential as it functions as a bus bridge clock=
.
Currently, the SPU clock is still enabled by the bootloader. In legacy
kernels (v4.2 and earlier) using the Armadillo board-file/defconfig, this
clock remained active after boot, allowing the FSI to function correctly.
However, after migrating to a full Device Tree (DTS) implementation,
the kernel's unused clock cleanup mechanism disables the SPU clock
because it isn't explicitly claimed. This leads to a system hang every
time aplay is executed, as the FSI registers become inaccessible
without this clock.

> you need to call it on
> fsi_hw_startup/shutdown() which cares suspend/resume too.

I previously attempted to manage the clock within fsi_hw_startup/
shutdown, but the system would hang when stopping aplay
(e.g., via Ctrl+C). This happens because certain cleanup operations,
such as fsi_irq_disable(), are performed after fsi_hw_shutdown()
finishes. These operations require register access, which triggers a
system hang if the SPU clock has already been disabled. Therefore,
I moved the clock management to fsi_dai_startup/shutdown to ensure
the clock remains active throughout the entire lifecycle of the stream.

Furthermore, my testing shows that using dai_startup/shutdown
eliminates the need for explicit Suspend/Resume handling for this clock.
Since the ALSA framework typically invokes the hw_ callbacks during
power management transitions rather than the dai_ ones, the SPU clock
state remains stable, preventing any illegal register access during
these transitions.

> As Mark mentioned, it should be optional.
> Otherwise it breaks compatibility.

You are right. I will implement it this way in v2.

> And we already have fsi_clk_init() for clock initialize.
> spu should be handled in it.

> Now, it is called if clock master (A.

> (A)     if (fsi_is_clk_master(fsi)) {
>                 if (fsi->clk_cpg)
>                         fsi_clk_init(dev, fsi, 0, 1, 1,
>                                      fsi_clk_set_rate_cpg);
>                 else
>                         fsi_clk_init(dev, fsi, 1, 1, 0,
>                                      fsi_clk_set_rate_external);
>         }

You are right. Currently, our FSIA is configured as a slave,
so it never executes the clk_init() function.

> I think it (A) can be checked inside fsi_clk_init().
> fsi_clk_init() is now called when .set_fmt, but it can be called
> at _probe() timing ?

Yes. I can handle the implementation/coding side of this.

> Should we also be managing the clock during system suspend, or if the
> power consumption doesn't really matter should we just keep it enabled
> all the time and not worry about starting and stopping it?

Regarding the SPU clock management, I haven't measured the exact
power consumption of this block yet. However, to keep the code simple
and ensure maximum stability for register access (avoiding system
hangs during cleanup), I am open to enabling it once in fsi_probe()
if you find the dynamic management in dai_startup/shutdown
unnecessary.

> This is going to unconditionally require a clock called "spu" on all
> devices using this driver, not just the one SoC you mentioned as
> requiring it.  Presumably this worked at least somewhere (possibly the
> clock is always on, or they're just lucky that something else enables
> it) and this will cause regressions for those platforms?
> This should either (ideally) be conditional, or use _optional.

Thank you for your suggestion. I will switch to using
devm_clk_get_optional() in the v2

Best regards,
Phuc

On Mon, Apr 6, 2026 at 6:52=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi
>
> Thank you for the patch
>
> > From: bui duc phuc <phucduc.bui@gmail.com>
> >
> > The FSI on r8a7740 requires the SPU clock to be enabled
> > before accessing its registers.
> > Without this clock, register access may lead to a system
> > hang.
> > Retrieve the "spu" clock in probe and enable it during
> > DAI startup. Disable the clock on shutdown to match the
> > audio stream lifecycle.
> > This ensures safe register access and prevents system
> > hangs during audio playback.
> > This is required even if the FSI functional clock is
> > enabled, as internal units depend on the SPU clock.
> >
> > Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> > ---
> (snip)
> > @@ -1554,6 +1555,11 @@ static int fsi_dai_startup(struct snd_pcm_substr=
eam *substream,
> >                            struct snd_soc_dai *dai)
> >  {
> >         struct fsi_priv *fsi =3D fsi_get_priv(substream);
> > +       int ret;
> > +
> > +       ret =3D clk_prepare_enable(fsi->master->clk_spu);
> > +       if (ret)
> > +               return ret;
> >
> >         fsi_clk_invalid(fsi);
>
> If it is needed for register access, you need to call it on
> fsi_hw_startup/shutdown() which cares suspend/resume too.
>
> And I guess it need to count user, because we have FSI-A / FSI-B ?
>
> > @@ -1963,6 +1970,13 @@ static int fsi_probe(struct platform_device *pde=
v)
> >         master->core            =3D core;
> >         spin_lock_init(&master->lock);
> >
> > +       /* SPU clock is required for FSI register access */
> > +       master->clk_spu =3D devm_clk_get(&pdev->dev, "spu");
> > +       if (IS_ERR(master->clk_spu)) {
> > +               dev_err(&pdev->dev, "Failed to get spu clock\n");
> > +               return PTR_ERR(master->clk_spu);
> > +       }
>
> As Mark mentioned, it should be optional. Otherwise it breaks compatibili=
ty.
> And we already have fsi_clk_init() for clock initialize.
> spu should be handled in it.
>
> Now, it is called if clock master (A.
>
> (A)     if (fsi_is_clk_master(fsi)) {
>                 if (fsi->clk_cpg)
>                         fsi_clk_init(dev, fsi, 0, 1, 1,
>                                      fsi_clk_set_rate_cpg);
>                 else
>                         fsi_clk_init(dev, fsi, 1, 1, 0,
>                                      fsi_clk_set_rate_external);
>         }
>
> I think it (A) can be checked inside fsi_clk_init().
> fsi_clk_init() is now called when .set_fmt, but it can be called
> at _probe() timing ?
>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto
