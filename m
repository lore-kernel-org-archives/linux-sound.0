Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80EC8231830
	for <linux-sound@vger.kernel.org>; Sat, 16 May 2026 11:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778932593; cv=pass; b=gNMuuHQWeBRD1Osq8Nm9lsapbM5uOsq10hcWXtSOJ+S9c7Ay6vs5vytruApP9HLFnMjsWVoIGXZHn6QN/TwCzet6sLRyKxjEJ+CtAxItPaCUgwXeFS4i+O/cjIV7ZVMs1Fpko0zYXlzBpn/0lYc/1m+omtySB3hVLP4m9E8m4lk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778932593; c=relaxed/simple;
	bh=7QyYKbH4NtzTLiNAjB//SALR0HNWGH6snToS6ryNEIg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LafwFegUTbrtfqiYAy8VI62UjHrl6UEVbt19CwLCy+vPa7FwztoaoeZObxzxjolNxbORRbczUbJfAyYC8o5OnGgFhJJPRPisO42aygndQuY9AfzgdbpTf1lvv+8kHLER0e8g1uNme5vP3PVWwoOR8xHhXc2JWlo29GbuRtIy/sk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FkM9hEWt; arc=pass smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FkM9hEWt"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-36936dcf19dso297658a91.0
        for <linux-sound@vger.kernel.org>; Sat, 16 May 2026 04:56:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778932592; cv=none;
        d=google.com; s=arc-20240605;
        b=iEPmAH9m43DKkG07YCKLzx717G2ajPbwKu7Q15a0dr6Ecj14n4y4d8s0X4efOgUThl
         dAgrZugcJwT5IExuHc4gUl9pU5filqi6wD/zB/44O8+mguHwd9mi9IeNeicFqoUVRCV4
         C9aYQSu7O2OO8AInw3rKrO9XlFGJ9C8tybvzLBoY1pfonJ45Wy5am3uHHexGpXZtVunW
         5kPuDntugJBipIGj18tdvvolV7KmkMUy5kSzYJOzIs5keCOs6GGhwDVlugzqvPZjGKU3
         QDrvR0EaV3qYsMRngha3hW+SUqLmnjPffsKU20J6lTfvIhevwSCPWKSV8tVlKrmY1s0Q
         AU7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g3Tnm8GfrdaS1CO5k7Ifb/71wv0N1iYSyYKMb0AGSQU=;
        fh=hmOwUE6/caAVS8FjKnvhFnXfVLoaJ5IQODWkxWG0wQ0=;
        b=CxYE4V/N6jLPKd4Q+yB1CEwOoQ+6as1FDaZe4EnO68Dhs90eMMGsZwYlP4ooWGiVdA
         J/NIIbTPJJL9RfuEiodfa6X/Bo+E01mYm08yxtJ2v7BmKvU1Z8fskSrWc1JTHaN79S95
         5fyQ9h5cko68g9QEY1C2xask6iytevcisyA9MKSfCW7tihvdnAU43aOr0r/M59ViHCmU
         l5MNEhxT5m/kOzO8MaBPm0o2bVlAjy+Mj5V8vSpDsC0hec0j8hfnsIMeLuE0HhPh4zzA
         Vq1sBNXCqdV8jjv5Jp0xvfQX/z7C+oLmSQSkxqh12ktN9FUYpjxXXmFKELniY3RgrAcy
         26VA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778932592; x=1779537392; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3Tnm8GfrdaS1CO5k7Ifb/71wv0N1iYSyYKMb0AGSQU=;
        b=FkM9hEWtgZBHuprSIg8k3jYSrOXVO60ap5ja65sYYc6N61UU/CDKce/5w29CQ+lnbX
         dVbQousVUpBiAhkxwke9YlvscjG9WVxqdJZTlAhC7MTS7G4zyrS/eCJp4w79LzjMdV1g
         FKFgMEqXA2tuXy3bEIhQNYBjbxe/Mbh+RyqUQiHdNSD2qwOvJAR9VeAgqsMSqFDerZ0a
         4xRFUAukKS++CsgZLXEzGm27A0wcbAG7WC5vZdnx1ugVwh2DjTmZ2KrJVo0EduHv5tv8
         x0E8VgW0SA178Yfk3KEdv7MLjxOYBeKAo50T1STQcmZzYZ7ixOZppKm5Q4pjOvbfPI+Y
         c2pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778932592; x=1779537392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g3Tnm8GfrdaS1CO5k7Ifb/71wv0N1iYSyYKMb0AGSQU=;
        b=EMQhiFcFPsVhCWE0y2wJjEFK7TstqfxKcjQIjs8fVrtTIFxlGAMr4ayI8JbQMbBWJw
         r6mzBpSs1Icc6ShhZxFT+1ojimpyrTPTrD7MaoFrqhA+Z8H5bIdmOWof8fFrRMIn8RQk
         JlA8dF3AanEILPyusypGJ4Q93SWtOHqKpKe4pe6WnbztE7YZUify7CITK5ZCuRR6rMjB
         4OC4en9Ahcxqog7occr8piLTbjh3vLIYFumw+xexIp5mXZ+1o8xk61PyBzMNw/6aULgi
         DRXL4VwAZ24hpn5a010dk3erDa56BtDz2shNYb03itUZGQz2hJ6u6p2BFh6iM2g2wvnj
         n9Bw==
X-Forwarded-Encrypted: i=1; AFNElJ8pdfEpMFmmFsU5hILlYxuFZj+hE3LAyn3AoLm+ScRe4HCNVCSVWQGuo3jhmzkKPXeYtJgqLvjMUiVanQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJgXYD+fjZzlEdtXJtPuCmg+hgtNLc/jdfWiQ+UZyUii5+zN5c
	XuC8uR1HcecEVcewCVjGbZ3vzPoCQOQNscHHajc20qN1nFjCBH4w/QOy6tuCd8vKfzWyCsBCcWv
	GEBp+7POUrAIEZCvon2/fyKfDs2PGo/Q=
X-Gm-Gg: Acq92OHkiP7TUDr5xr8oZnz2d19nCwzoklpZtEi+94Yus6ueSYGbKT5hGn33LEDE6rN
	74Q0xhrVU8kKdXM7YwA+Ne6uM0OBcbSi06eLCa4I5kHdCCZXKHregGOok0BBmDF/c/ImBx+iOSn
	F4K3tjOhxTFtvJhKo35kFmqm8k2hYRW2dcP5zYMUPIMTxvIZutImtg/aDCkyYOUu5hLxxxEtGyC
	hRRMPGXLCpTKQ8DU0OqBX4PxvBHKKawI/e8g/8/mO5eAZn4+aP3qneG/sZ46Ckg4WInjRcQdgKk
	iJ4b9+ld8AXJ5Wd4/v1lotvuPJgV1lOWM9EExleN
X-Received: by 2002:a17:902:fc84:b0:2b2:eb9d:1648 with SMTP id
 d9443c01a7336-2bd7e9a02e3mr81606565ad.37.1778932591918; Sat, 16 May 2026
 04:56:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513105003.81880-1-phucduc.bui@gmail.com> <20260514043314.62222C2BCB7@smtp.kernel.org>
 <CAABR9nGhwtBu9Yhbn-BTD1Scykp2h6eQbtQtT13DcnekUdum1A@mail.gmail.com>
In-Reply-To: <CAABR9nGhwtBu9Yhbn-BTD1Scykp2h6eQbtQtT13DcnekUdum1A@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 16 May 2026 18:56:18 +0700
X-Gm-Features: AVHnY4K87wbzdoBlkwWjKd4mYgN3M-8jhbsSCXPKekL4N1DL1gksd-L0oaFEhQw
Message-ID: <CAABR9nGZM3Bnb3DnObdp2nOJmW6ezmXqRSBtgS00Ps2ve4zsbg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: sun4i-spdif: Use guard() for spin locks
To: sashiko-reviews@lists.linux.dev, Mark Brown <broonie@kernel.org>
Cc: linux-sunxi@lists.linux.dev, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Marcus Cooper <codekipper@gmail.com>, Chen Ni <nichen@iscas.ac.cn>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I am not entirely sure whether the issue is exactly as
described in the Sashiko review.

However, I also looked at a similar case in the
micfil_rate_set() function from the fsl_micfil driver:
https://elixir.bootlin.com/linux/v7.1-rc3/source/sound/soc/fsl/fsl_micfil.c

There, pm_runtime_resume_and_get() is also used to ensure
that the device is runtime-resumed before accessing the
registers.

To address the review comments and avoid mixing functional
changes with the cleanup/refactoring using guard/scoped_guard,
I am planning to split this into two separate patches:

Patch 1: replace spin_lock_irqsave() /
spin_unlock_irqrestore() with scoped_guard() / guard()

+ scoped_guard(spinlock_irqsave, &host->lock) {

    regmap_read(...);

+ }

Patch 2: add runtime PM handling around register accesses

+ ret =3D pm_runtime_resume_and_get(dev);
+ if (ret < 0)
+     return ret;

  scoped_guard(spinlock_irqsave, &host->lock) {

      regmap_read(...);

  }

+ pm_runtime_put(dev);

This should make the review easier and clearly separate the
functional change from the refactoring.
Does this approach look reasonable to you?
If so, please let me know and I will prepare the
corresponding patches.

Best Regard,
Phuc




On Thu, May 14, 2026 at 6:22=E2=80=AFPM Bui Duc Phuc <phucduc.bui@gmail.com=
> wrote:
>
> Thanks for the review.
>
> This seems to be pre-existing behavior rather than something
> introduced by this patch, since the current change only converts
> the locking to use guard() helpers and does not modify the
> runtime PM handling.
>
> If this turns out to be a real issue, it would probably be better
> addressed separately from this cleanup patch.
>
>
> On Thu, May 14, 2026 at 11:33=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
> >
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [High] Hardware State / PM Violation leading to bus hang
> > --
> >
> > commit 0686001584788d984a0f16403183bcad78fe4176
> > Author: bui duc phuc <phucduc.bui@gmail.com>
> >
> > ASoC: sun4i-spdif: Use guard() for spin locks
> >
> > This commit refactors the locking in the sun4i-spdif driver to use the
> > guard() macro for spinlocks. It replaces manual spin_lock_irqsave() and
> > spin_unlock_irqrestore() calls with scope-based cleanup.
> >
> > > diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-sp=
dif.c
> > > --- a/sound/soc/sunxi/sun4i-spdif.c
> > > +++ b/sound/soc/sunxi/sun4i-spdif.c
> > > @@ -427,10 +427,9 @@ static int sun4i_spdif_get_status(struct snd_kco=
ntrol *kcontrol,
> > >       struct snd_soc_dai *cpu_dai =3D snd_kcontrol_chip(kcontrol);
> > >       struct sun4i_spdif_dev *host =3D snd_soc_dai_get_drvdata(cpu_da=
i);
> > >       u8 *status =3D ucontrol->value.iec958.status;
> > > -     unsigned long flags;
> > >       unsigned int reg;
> > >
> > > -     spin_lock_irqsave(&host->lock, flags);
> > > +     guard(spinlock_irqsave)(&host->lock);
> > >
> > >       regmap_read(host->regmap, SUN4I_SPDIF_TXCHSTA0, &reg);
> >
> > While this issue isn't new to this patch, does this code risk a bus han=
g if
> > the device is runtime-suspended?
> >
> > The regmap configuration lacks a cache, and these ALSA kcontrols can be
> > accessed by userspace at any time. If the audio stream is idle, the dev=
ice
> > will be runtime-suspended and its APB bus clock (apb_clk) will be disab=
led.
> >
> > Accessing the physical registers with the clock disabled will trigger a=
n
> > asynchronous external abort.
> >
> > Would it make sense to ensure the device is runtime-resumed (perhaps vi=
a
> > pm_runtime_get_sync() outside the spinlock guard) before touching the
> > hardware?
> >
> > [ ... ]
> >
> > --
> > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513105003.=
81880-1-phucduc.bui@gmail.com?part=3D1
