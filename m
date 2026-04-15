Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D84422541C
	for <linux-sound@vger.kernel.org>; Wed, 15 Apr 2026 09:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776243785; cv=pass; b=ZNZ1Dh5rFNX2TF2dtXAs7DboLFf5a/cTMvTRg8PqyCM5GK1tbeHkpQmFENY0WQsrOh977FxDMuAQ8Jo/w6I8X4KVHtklOGoPzVvqXzO9JSRnY2O0FRe+3XMWOxaeGKn+484UHrp/A6E9dTTMxEA5YYYtTQHjjEYvOnjn8q/TW3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776243785; c=relaxed/simple;
	bh=g8oimaORGIUiIaEIuPOcRHBRcNq8Tz0N0WhtWq2zChE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=prpvmJaPaheb4SGwGOTj34QDuAPXxvofB6uxIPFde8hSo6l2xohWO+gbBfO4EOlek+9aYvrAOwQAUC5bT4kietTnmIGYdBM6IGofGuKrWe+gL+pjLiP4L4M/F7enOusVUzfW0kv/9Dttz/FhPYeAnE1LM8ZfnEl0AbG7pj84NtU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QkUhTmjM; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QkUhTmjM"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ab46931cf1so40759705ad.0
        for <linux-sound@vger.kernel.org>; Wed, 15 Apr 2026 02:03:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776243784; cv=none;
        d=google.com; s=arc-20240605;
        b=T8nKdO8+UWWJe45nWcf74+avvniBfAPE8Kg8o5X3ktoa7rtXjHH3gnbTCtuZ+aGOl4
         XLeywX+SXaDFgYvLNUUZY37IR60RESAgPUFYQVvDvJVpfOdv02+PuHCWGYSsi+IyOfx7
         dhUKWV1qWK6DFfjV4EJHyOcJlAYLtMaBUYLVfxI0bqycFbbN/W4vjLO6IS0UAOUC38Ku
         wlufycFhkqQxQKyc0ZrMOPV9xkaCORGWdBBlrBmUzmF/oUoC6Qds8Ou2KG9FQUUtwED1
         EZbNZcknmfxq3rYGIN0sRmQC0TEIyWOSYz0QfXgn3uaBr+TF3UvHaWFhghK1jfyBw3tv
         7Xig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GhSm6AC+EBob8Si9/iWbHEozFaMuoZoR04/c65WN25w=;
        fh=PHpKsLl3usZgdCr8PwnLySvtwZIs9cuSP6UEJ3lnYqk=;
        b=iRbBowWS9YmcliOOTb70pTvLeJEVgWdOwOnjbnzoUwVWGY4qDUcVl9sV8RzyTaFcym
         y9xYhEwK4Zrt93BJbjsu0Z414ggo6YShfRcFXdc3XVMWM4l2iQIjICPX9Xg2Z7rS77YJ
         RZGikjl4QI72H7Q6QQnYRf6NUbzYlKSA7oLsh8aBRCFlcyLA8YkC76zyaJFgUonJxDBg
         S2d9L1bifIcYyPmPkccrhvCNzfAAKFwiU9+KQLzhYj8QKFFdlFbtS0mYfF/smKGUy54C
         LrNBhNzwnMA+4Af3n2r5bir8CshDZXiXmwhdPrhG9qdeHhmpjg9uz6WU2Nk07s5THRiC
         VhUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776243784; x=1776848584; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GhSm6AC+EBob8Si9/iWbHEozFaMuoZoR04/c65WN25w=;
        b=QkUhTmjM7pkE6g+5OaZLFr/xsxJki72icpopITnJXsTxr/eoNjsNLWlhkb2LxYMrL5
         rU9XzA1ktSeZzK1rtjMamf08jlXU9wLaOEQ14IC2Noo4jv6o+xrsXquYxIXJPNDbz7xd
         toh9ib+sTh18uq389ZelxTojGvIV3G620IlnNtwpr6W5bD8E4we9lA8Y4vo9ZSU2fMId
         E2rvqN64dTEbLFryoRZn5nWX6Zi38sZRnZCUjCiBQKSlu0W6RrUh7N5u8KxLz2B0WKlp
         4pBaOy/mSBYb2Q/Wmc0YZ123pCpEPPa/mu4/NtyrpyI8n1o440TYLiEuS/zasPKQnPNj
         9a3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776243784; x=1776848584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GhSm6AC+EBob8Si9/iWbHEozFaMuoZoR04/c65WN25w=;
        b=MQo2nB2v1sCeTJS1W/3H3sEfe5l19t5ZW9Sc3swib6z1l6aI9VJ+8iM1bxgnpZMXFY
         7LvJSgwMgq/VE+39xgjuu+IHMJTxfjtBoncgHkkPF8edraZ7YxEKWXpM9X5FbBlmJuQM
         8qWtc8pujV+Jt9NM/jt5r15/96h6VnuH+MUKOj/gsDmL4SlOMYqrq/bNpLhvd/4tabcy
         0DOkkV9KHh3kOrW/PcOmR+DNQ2i7fSjdVUcftOIc2vCuhCJl5UVuLBFun65gk/3CQVSV
         04UeTOrCv43rVnkBnkap7Hcx6YhdSG1Rh4arhlrdyNiF6zAMRQf2oCborRtgbaUlztzc
         2XwA==
X-Forwarded-Encrypted: i=1; AFNElJ/TDl8+8u+VuhVC4YZE0ONsQtK0FqIjpkkd9f14eruzrBWoCWow620xb6BkgVJaf5WZxdoLZutZFvS5Ww==@vger.kernel.org
X-Gm-Message-State: AOJu0YyH5JoyPt6KXVAdbqolOV7DNm3GwWUVfY2xnq4AFE54Pipmie2B
	SDQaq5fRh5Gv4Q1t7RJtKWTv0wG8IcE89AwS3FpWbsWRvVYl/rxcvStUAlnbCmTrFU7c0W/uy1v
	ZObKgmZvcG3PJAV1Fs+day3A2KFrSgxY72EVR
X-Gm-Gg: AeBDies9k1Df7WuDC8wB5xkatvnZ3PyxlUe1Ivg48b2BcgqhzynSy7KwhdqsVukwU5m
	J0pI08JJOllr/Rwc7lZ5nhb+TKTHo4L/a3/Txu4wjitCDNZQsQnA6yhoAww10Q1cFsCr0ECSiIk
	jjvdoVWAIoLINrvYqtQU1y2wB198RKcpvcfTgGdiUgW9mGOUyMXf/9Q4tlnSBMkaSGn85iHUpy8
	eBqpjwhjKVff2khPMsZsWN2SoESYOazBZVUZYFo2F8llsYANoAnqC4jnLRT1mcxcSYYHLBoD5zg
	QKmLMK8l25cPB6nIbC3QTr+xAOrcoEkT2ToLDqtYiaisC455
X-Received: by 2002:a17:902:ffcf:b0:2ae:4d6b:b2c7 with SMTP id
 d9443c01a7336-2b2d5c7e6cbmr169035445ad.9.1776243783873; Wed, 15 Apr 2026
 02:03:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413100700.30995-1-phucduc.bui@gmail.com> <20260413100700.30995-3-phucduc.bui@gmail.com>
 <87tstepes7.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87tstepes7.wl-kuninori.morimoto.gx@renesas.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 15 Apr 2026 16:02:52 +0700
X-Gm-Features: AQROBzApjElQGcdJZxtKJThRB3FUMvNfZsYqiHMqwpO1zQDkjasjpTPQUplvsIQ
Message-ID: <CAABR9nFN9C4CGsaZoWzrHEjibBLqQ1KmM8o5oG2-pSMcrgMsAw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] ASoC: renesas: fsi: Fix hang by enabling SPU clock
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Morimoto-san,

Thank you for your detailed review and feedback.

> 1st, please insert white line between "int ret =3D 0;" and "/* enable spu
> clock */".
>
> 2nd, besically, FSI already has "lock", and using it for several protecti=
ng.
> Please re-use it, and don't add random new-lock. It makes code confusable=
.
> Then, please use guard().

I will fix the coding style and use
guard(spinlock_irqsave)(&master->lock) in v3.
It=E2=80=99s much better than adding a new lock.

> 3rd, I don't like above count inc/dec, and mutex_unlock() style, because
> the code unnecessarily complicated. It can be...
>
>       int ret =3D 0;
>
>         if (master->clk_spu) {
>                 guard(spinlock_irqsave)(&master->lock);
>
>                 if (master->spu_count =3D=3D 0)
>                         ret =3D clk_prepare_enable(master->clk_spu);
>
>                 master->spu_count++;
>         }
>         if (ret < 0)
>                 return ret;
>
> I'm not 100% sure, but I guess you need to count up spu_count anyway
> regardless of clk_prepare_enable() result ?

Regarding spu_count, I=E2=80=99m not entirely sure, but if we increment it
even on failure,
the counter might become unbalanced and clk_prepare_enable() may not
be retried on the next call.
Would it be better to increment spu_count only on success to keep the
state consistent?

Also, I have a question about the context here.
Since fsi_hw_startup() and fsi_hw_shutdown() are called from fsi_dai_trigge=
r(),
I think this runs in an atomic context, but please correct me if I'm wrong.
If so, is it safe to call clk_prepare_enable() under guard(spinlock_irqsave=
)?
Since clk_prepare() can sleep, I=E2=80=99m wondering if this could potentia=
lly
cause a "scheduling while atomic" issue.
Would it make more sense to move clk_prepare() to init time (in new
fsi_clk_init() ),
and only use clk_enable() / clk_disable() in the trigger path?

Best regards,
Phuc

On Tue, Apr 14, 2026 at 7:27=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi
>
> Hi
>
> > Enable/disable the shared SPU clock in hw startup/shutdown. Without thi=
s,
> > accessing FSI registers may hang the system.
> >
> > Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> > ---
> (snip)
> > @@ -1492,6 +1492,18 @@ static int fsi_hw_startup(struct fsi_priv *fsi,
> >                         struct device *dev)
> >  {
> >       u32 data =3D 0;
> > +     int ret =3D 0;
> > +     /* enable spu clock */
> > +     mutex_lock(&fsi->master->clk_lock);
> > +     if (fsi->master->clk_spu && fsi->master->spu_count++ =3D=3D 0) {
> > +             ret =3D clk_prepare_enable(fsi->master->clk_spu);
> > +             if (ret < 0) {
> > +                     fsi->master->spu_count--;
> > +                     mutex_unlock(&fsi->master->clk_lock);
> > +                     return ret;
> > +             }
> > +     }
> > +     mutex_unlock(&fsi->master->clk_lock);
>
> 1st, please insert white line between "int ret =3D 0;" and "/* enable spu
> clock */".
>
> 2nd, besically, FSI already has "lock", and using it for several protecti=
ng.
> Please re-use it, and don't add random new-lock. It makes code confusable=
.
> Then, please use guard().
>
> 3rd, I don't like above count inc/dec, and mutex_unlock() style, because
> the code unnecessarily complicated. It can be...
>
>         int ret =3D 0;
>
>         if (master->clk_spu) {
>                 guard(spinlock_irqsave)(&master->lock);
>
>                 if (master->spu_count =3D=3D 0)
>                         ret =3D clk_prepare_enable(master->clk_spu);
>
>                 master->spu_count++;
>         }
>         if (ret < 0)
>                 return ret;
>
> I'm not 100% sure, but I guess you need to count up spu_count anyway
> regardless of clk_prepare_enable() result ?
>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto
