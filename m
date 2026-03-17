Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D9A39023D
	for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 08:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773736926; cv=none; b=oJqNRmEio59EEI3O7vobHMsBrRNVtOFoC52sc5a/spcd2hnOCs+B3b//4oi8+FUOOmc5VD0wnRnKRRus/KuXS6s/Q7KdIU/wJCTu37NiD8FlAzlg0OES6xUpy02GhU5yAsNnUzLUoadbWne0ZYa8U4Sr2aF6KzmfmCHNHT1iZL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773736926; c=relaxed/simple;
	bh=1IbAI1LF70M+Kjw+h3BaLZwBsh7cf418N6PFDl+oOnk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=La3I1yat6m+xIiZBlZ+24o4GkyQBp3mr3ULmyc7ysvx8Op0PWBfROQX6r9Gn2mHj22erGS4tePdKJKLlqFpBA/n0RYyOobzcN/4zHcH30AsnmYN0kTm38VqUmTnqNK5mENjIihcoMgWLBi9BP6Gef64NedQgmPuaCHkZ/fzzaH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8cb5c9ba82bso773340985a.2
        for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 01:42:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773736924; x=1774341724;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=idH2bB7nbOzzZw2WFTC74GwVow5g1kiitlzGsuFZK5o=;
        b=NIyYhne5PN6ZSM2LTm55hyygyX7cdpWwaZmcs1wFHiLsTDyly98Mq4qVv7XMz/61Nv
         HixwDSor/uKNNFjrWW0FfWEmVEOxyKFJrBGMBBG/O37sSUFlyoRHa7EUHZyVib4epZXW
         CDOIi9jdn8GU1ErUF8A2VweZRu45DVlw/I5f0el/2ZHn8Cx0UeGBCV9wdCOd1ly29CMX
         gb68zu5XONRgT/CV35gSjlLcTfEZTdETw0LyUR6RE+kLTGnw2OkG/ka4nVGa18BmPDYc
         YKBQ1q9x8Z9Zv8rl0CnfEPOfuDbzVTrDjKBCPMNyQnTwV99EiDdRY7hVJlue9qmVg1qB
         fj2w==
X-Forwarded-Encrypted: i=1; AJvYcCXpRCEBml9VzbHujYs1mly+1DjztgLLkwWVh+YMdlruONmhHrqpdCBlWFhAWWnQgL1eGsUwvOHOje10aA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFgQyH5TU2CxoPVX3d4jyL4aCx6DfqGTl8bB8wgbuHTE2eKv7p
	LBkH6QhtcwPn5aqDxBiCQ7x0pYSGO+OBet5Zyp6n8oqB3m9iqWv8l7nw+JfPCnHZ
X-Gm-Gg: ATEYQzxIlevkU8SBwpZaVk1T27iWGSemkr5gqPmD2FRohjDDtkPu6FOu9/fkXIzBNS+
	bR77gc+q3+VUw/6j3FV0gC0wZr52l93EVd09yghz6oWUQvlWhp3grmwR3NQ7VcUYKckmDNCyIDL
	LyGb1hLnSI8gNDFXj+fVSp3wK6SpdeuDrXPHiR30Z9kpXY++VfsxR5HKoiTEX+xyCfAdtVNxOpv
	cFn7E2RzY+iCoJCcS19w4v4tL+nek69y0d4/jriu/ffASVBJrHbOPsm6+hOAy6Z6ZRYkZfppQvC
	YLYXjX23H1TJ60UNNPlEksT/Poh/Zga30tpX5S9ckDHdtmhznY206uCr0d3O5laRv9d76AaaUGp
	u8K5EWKoy4CV9szO9w8GxB9/eGi+547rodlLLsCqK8C6y3gIi44XT3tM9nArabBlNMMRS2wRtfG
	B5zVrVroYKnm6l/KzRbAY/l3gpF7vo48LD7ajs9BTdrSoGLvkQ8/zyp3NN1WOLPydD
X-Received: by 2002:a05:620a:6919:b0:8c8:8126:7770 with SMTP id af79cd13be357-8cdb5bafcb9mr2339057485a.67.1773736923924;
        Tue, 17 Mar 2026 01:42:03 -0700 (PDT)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com. [209.85.160.175])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda1fbcd23sm1608996785a.1.2026.03.17.01.42.03
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 01:42:03 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-50919fc3a14so64324441cf.2
        for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 01:42:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXurhDOvpz1zahdIxMB5e3dIHNIRr5bwpZ0l7GD02yyXEioZTHSDb5RsUuRe0cgFwNCQcWvM0CPpqmbZA==@vger.kernel.org
X-Received: by 2002:a05:6102:5127:b0:5ff:2569:cfe7 with SMTP id
 ada2fe7eead31-6020e2129e6mr6024902137.10.1773736584585; Tue, 17 Mar 2026
 01:36:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303115720.48783-1-dakr@kernel.org> <20260303115720.48783-5-dakr@kernel.org>
 <DH4M3DJ4P58T.1BGVAVXN71Z09@kernel.org>
In-Reply-To: <DH4M3DJ4P58T.1BGVAVXN71Z09@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Mar 2026 09:36:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW=hfK82_QKXL=n-nMos-HjScKuw9jNTy4xsxJ2qnPYyA@mail.gmail.com>
X-Gm-Features: AaiRm50LJFP1R3ITAUSRjqb1napf13plX5N5KjefHP89RPorlF5H9VKuGn2urAs
Message-ID: <CAMuHMdW=hfK82_QKXL=n-nMos-HjScKuw9jNTy4xsxJ2qnPYyA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] driver core: platform: use generic driver_override infrastructure
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, hanguidong02@gmail.com, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	abelvesa@kernel.org, srini@kernel.org, s.nawrocki@samsung.com, 
	nuno.sa@analog.com, brgl@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-sh@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Danilo,

On Tue, 17 Mar 2026 at 00:57, Danilo Krummrich <dakr@kernel.org> wrote:
> On Tue Mar 3, 2026 at 12:53 PM CET, Danilo Krummrich wrote:
> > diff --git a/arch/sh/drivers/platform_early.c b/arch/sh/drivers/platform_early.c
> > index 143747c45206..3cd17bb0be67 100644
> > --- a/arch/sh/drivers/platform_early.c
> > +++ b/arch/sh/drivers/platform_early.c
> > @@ -25,10 +25,12 @@ static int platform_match(struct device *dev, struct device_driver *drv)
> >  {
> >       struct platform_device *pdev = to_platform_device(dev);
> >       struct platform_driver *pdrv = to_platform_driver(drv);
> > +     int ret;
> >
> >       /* When driver_override is set, only bind to the matching driver */
> > -     if (pdev->driver_override)
> > -             return !strcmp(pdev->driver_override, drv->name);
> > +     ret = device_match_driver_override(dev, drv);
> > +     if (ret >= 0)
> > +             return ret;
> >
> >       /* Then try to match against the id table */
> >       if (pdrv->id_table)
>
> I was just about to pick up this series, but then noticed that checking for
> driver_override in the platform_early case doesn't make sense in the first place
> and was accidentally added when the platform_match() callback was copied over in
> commit 507fd01d5333 ("drivers: move the early platform device support to
> arch/sh").
>
> Thus, I'm going to drop this hunk and add in the following patch; please let me
> know if there are any concerns.
>
> commit 39cae4095efda4b00b436c0fc46f21de84128969
> Author: Danilo Krummrich <dakr@kernel.org>
> Date:   Tue Mar 17 00:37:15 2026 +0100
>
>     sh: platform_early: remove pdev->driver_override check
>
>     In commit 507fd01d5333 ("drivers: move the early platform device support to
>     arch/sh") platform_match() was copied over to the sh platform_early
>     code, accidentally including the driver_override check.
>
>     This check does not make sense for platform_early, as sysfs is not even
>     available in first place at this point in the boot process, hence remove
>     the check.
>
>     Fixes: 507fd01d5333 ("drivers: move the early platform device support to arch/sh")
>     Signed-off-by: Danilo Krummrich <dakr@kernel.org>
>
> diff --git a/arch/sh/drivers/platform_early.c b/arch/sh/drivers/platform_early.c
> index 143747c45206..48ddbc547bd9 100644
> --- a/arch/sh/drivers/platform_early.c
> +++ b/arch/sh/drivers/platform_early.c
> @@ -26,10 +26,6 @@ static int platform_match(struct device *dev, struct device_driver *drv)
>         struct platform_device *pdev = to_platform_device(dev);
>         struct platform_driver *pdrv = to_platform_driver(drv);
>
> -       /* When driver_override is set, only bind to the matching driver */
> -       if (pdev->driver_override)
> -               return !strcmp(pdev->driver_override, drv->name);
> -
>         /* Then try to match against the id table */
>         if (pdrv->id_table)
>                 return platform_match_id(pdrv->id_table, pdev) != NULL;

Nice catch!
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
