Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952BA26FDA9
	for <linux-sound@vger.kernel.org>; Thu, 11 Sep 2025 07:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757574661; cv=none; b=CH1tbNUSPl0MdMMvFgkCg+Ewav6V3EOmUCKb05gkPBizpGtZkZZ6hjnxHB7JoU11lDRb62R43e1X1hiIg43yGrlEIPstxPBLSL00MTeo4AWXTcG5AwKk5cVuiFROQAU5dh+oyE1/xibV9mKnkK3IlWfgMKu4b37wp1r2lcQf134=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757574661; c=relaxed/simple;
	bh=vl70sf7AjDwcIlQD7K54NwrKW872e7tkmwD9HH31AbE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NKMhAKzVymwKWG7zM53efxVwnwR6MzLtx+CBG+V4GYm6yKI+xlPLcIY6X1BC5m/CMUmitOTL+OUksXvdPQSNtVkGixz2TRSzQztGrEx6Mb6GGU7nnB5RsPM/UxornTKdgYiXWvcF2qUmblM8gvN1TtDGW1OQ3ENwcPO94Ba6Akk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-8bdb4985309so116901241.1
        for <linux-sound@vger.kernel.org>; Thu, 11 Sep 2025 00:10:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757574658; x=1758179458;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oka+5NFB5wMrpMR5fbSO4AzIeW3Sp+JtBLuI9s6Y+gk=;
        b=Mma1Aj5ds/nClhZ0TtTbFfy6MyjRGFnJSAvdsTLT9or3OhSlK/s6vg3bztvK5ONGCA
         0UoBeby27jsKI+lor/taP5eM+ph7WUQ1rRUZEBohga9RS6Ry93q+T3hV//iNdSKForp4
         vMthCMPAl+rm5CYn714nqyzxjsWCzUlzQZtxilryiM6ql127Fy3PsPyzp5eRvFWdY31h
         i4HSHEP6o4vGU9QG8kKEkKzg3q435UmtH9SrswLyRWriMjYbEGNA/qqB9sLHB92Kx8J0
         sK5OpDT7ckiPNxbYmy1LPLKebRdFJlFYQOGMkgBXQGX2eEo4/aVVcTPJTf0+f1eN7yt3
         rvcw==
X-Forwarded-Encrypted: i=1; AJvYcCWwWWDbAsNLogWY+0BOobyddrlHFDZaDiTdS/A9TUHafj9c71YQi/EZPSQ5lp2yZq8AkofxupntsjZ99Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfX6T0HXEuYZBvbKTPVyPi1EBYzO8mc2AXvv/2Fr/DBKAmwpTr
	oY5/sesKqdVzM3UDPx1k/8mxD0ZVeEeLNEvGK60aqFCIL2rBqaOydYRpw0jxGF9p
X-Gm-Gg: ASbGncvOMGSUJNN7gTNT2d2qGgctN+PnvVFzzSYVEScArv5qPUZqfTdKx71gTqw/cF4
	LqBQpZqZIM+ag9ckJsAM/1REyCXxlhxaczB1q1/gEdIuyYwIq3wFhH5GSJgnd3iuJ3tWxHig80m
	pCYNOzr/Dzv2+BnWEA5uRRqg33eDVS314pjjvaaaXW4eKrvrhy/z+cm8LPkrvvQx5XC/in5Nkqs
	AVE2hGBB4VDe5tUtEh1VfxtO8yaHitZUTFXGUGXAUsgBvPtDD2x06b/rm2QpMDBSPZBjC9NNgal
	EZoBFYHud0RAdAB0C90Adk5+xRDen+FqRR4fA8WdTgmeJfabr71dY74Old6xy06uwflpglBg1nq
	0UnQGV100Vq8gkET9wla9dZKVGQyEi6fSFdcG8t8JfQzxN9tZQDrLgGuB4d+D
X-Google-Smtp-Source: AGHT+IF7W3Wudl40+KwmG5EhZydK9hjRng7atLMJqphQfA/LuILFx0bRjHDknFrf0fhheUDKj33Uuw==
X-Received: by 2002:a05:6102:3e1a:b0:521:27b:bea4 with SMTP id ada2fe7eead31-53d0b8fb7f7mr4838865137.6.1757574658390;
        Thu, 11 Sep 2025 00:10:58 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8ccc9662640sm129496241.7.2025.09.11.00.10.57
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 00:10:57 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-89019079fbeso113544241.2
        for <linux-sound@vger.kernel.org>; Thu, 11 Sep 2025 00:10:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUHTUqyq57YOpaq5cCqCz73hJ/W71TvnOYgxy0zSedzAvppiLwBmTFPoFY58PwpOnlixy+Uax8HM8uaHg==@vger.kernel.org
X-Received: by 2002:a05:6102:5803:b0:537:f1db:7695 with SMTP id
 ada2fe7eead31-53d13a507cbmr5112188137.26.1757574657743; Thu, 11 Sep 2025
 00:10:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87jz291yrr.wl-kuninori.morimoto.gx@renesas.com>
 <20250910084736.3336686-1-geert+renesas@glider.be> <87ecsddfqr.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ecsddfqr.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Sep 2025 09:10:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWjNV2TS1DVOUjXV0iw-ioKPqcYcWG2eYe6=prsTf4W3g@mail.gmail.com>
X-Gm-Features: AS18NWCe45WjIvunb1GkWGA1_U_e7GImb4Y75y1bh1rdoSHSYSjzoT01QSF2LnA
Message-ID: <CAMuHMdWjNV2TS1DVOUjXV0iw-ioKPqcYcWG2eYe6=prsTf4W3g@mail.gmail.com>
Subject: Re: [PATCH 1/4] ASoC: renesas: msiof: Use guard() for spin locks
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: broonie@kernel.org, linux-sound@vger.kernel.org, tiwai@suse.de
Content-Type: text/plain; charset="UTF-8"

Hi Morimoto-san,

On Thu, 11 Sept 2025 at 01:56, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> > > @@ -372,10 +372,9 @@ static int msiof_trigger(struct snd_soc_component *component,
> > >  {
> > >     struct device *dev = component->dev;
> > >     struct msiof_priv *priv = dev_get_drvdata(dev);
> > > -   unsigned long flags;
> > >     int ret = -EINVAL;
> > >
> > > -   spin_lock_irqsave(&priv->lock, flags);
> > > +   guard(spinlock_irqsave)(&priv->lock);
> >
> > You want to include #include <linux/cleanup.h>, as it is not included
> > implicitly on all platforms.  This applies to all patches in this series.
>
> Oops ? I didn't notice about that. Thank you for pointing it.
> OK, will post such patch.
>
> ... or can I add it on <sound/soc.h> for ASoC user ?

Upon second look, include/linux/spinlock.h already includes it,
so please ignore my email.
(I must have misremembered seeing kernel robot reports, probably
 they were about direct users of __free).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
