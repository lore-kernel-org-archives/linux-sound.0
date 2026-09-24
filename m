Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1B6330647
	for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 22:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790287452; cv=pass; b=hw38KYEE6mMcw3r5YWUYV0J/MbV3yAs9GKe5y0Ig/j6V7yQg3pW+Ahp3gz2WnAhhpItrDyto/5ecvGg2oe0MgKCEtBCTrEY79G/HplvYscNcMK1VthLiwJrQ0MTHY+UeLs+UlrKCJskcgwWwCQXT++/oFHONkvOAOvf1J5Kimqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790287452; c=relaxed/simple;
	bh=UCPWykPSeFLhhECC9JKMywpS2K7qYEIBFzqJhcYbxZ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gN+h0FwWUVhXuMXFUX5+IUByJVpEhA2A466eJB0GJgEOI0tDXbb/jrIJiAFaj3EeJ075xx+6rPq798odrmM13jLdDw4VpHPlB70yjCiO2JdLwCoe7yvZqWZ7e8efmUyWleDwmF05nn0SD2DdLkqVBgomghJ4wZ1/lMna3di3dOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n/cVNg8J; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n/cVNg8J"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f0b1eso41373066b.1
        for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 15:04:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790287449; cv=none;
        d=google.com; s=arc-20260327;
        b=IuTmSZBOw/vcYRojdeQmHZmKGaUtA6/2a5t6u416E62msHVy73hzYq49xUsT+QOq7O
         Q1lsR/z5fRVH7YRXJA97twHcuiHuB6MBhl5Y4+c+EioIhUYqH3ep/X0fHVQpFVla7I2F
         qfQLzQEGduN3iCd1Sn09F/z83SPFn5nmOdGfCE1IMkCKW59nbSOeDLbyJlohXqPlyEBu
         0w5uTNn0Z3EBZXQPmoZGkgalKF02+PX50Sagi361YLTiBgELOpd99Ac/9IAL/V200UEa
         m7E5woTl1mFsXcwz0kLwN0Kzvws3tkOdMT0UgO9wxJI9QqpN7wDFLrTylp9ObjuaGU9q
         WJfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Cr7dYgudHu+YtLQISezbH81OFiuDdMrq+aTJZsl4PNA=;
        fh=aA7rSYGHGWLYq73Krg8+TNE8J1LuS7nFSr5IAg5L6VU=;
        b=qAqFL2mucMG1Bjru04Sgl38H0zypyJLRRxPMDxpZm90IGclVAAHgRZUdaplZ12ve5x
         IyezX6ohyatmy/pYxE+n6Vvgcpuo+oeCA9sMsAE6vchGuzKy8VQD8TZdYGptGK2NYjIk
         DQ+4hubcSjz+T3nEB1w6XxzijVhN8LsC7qbEzsDtDeh15mdyBCtJWHmprl7RzrddXawi
         RK0U4wAtgDzEzBO7X4d6lP+nCblKbvGrj8EeTfEd8IFC9duWRP4IwR0qEpygWtIuuJ7u
         L4BFHtycI3ONT0HO82OswL8WVYhPkLhV9EjumOphXZQyXdLV6LY+vPZRa2wdR88mBa71
         j3kw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790287449; x=1790892249; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Cr7dYgudHu+YtLQISezbH81OFiuDdMrq+aTJZsl4PNA=;
        b=n/cVNg8J+epaVSps6OF98mAXo5jr3knHjQ9tRVUxTC2B9B2DF/M3GSwgoILbtK0UJJ
         5djh9J0j67a5TVAiUIqIV/C1VUfz3WOqo2oy+OFAxO5vkS/B6arzzI9+NTLSxKX90Xt6
         XCz5EkEdEs7Xa+9sG7MBGstBWay0s46s0vkOncoP2zO2QM2P8Y7kVm/zCi1NV5bnprt/
         iGTDJQbj0i/8heqBkxyjA5XD2gYZP2mavSLM7NKnrLKz0ZJHEJTBN5c+zgP37wq1ugDm
         VeJgRqmvETYwYVkwTMPEKm1ZhI6gDxOH6OVQrdYb0aTQMP49MSDSAvyj7mrM4DKBY8il
         UqKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790287449; x=1790892249;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cr7dYgudHu+YtLQISezbH81OFiuDdMrq+aTJZsl4PNA=;
        b=TJCxO0YEoJ7+iTNAqSlQVhk/GAfshji37vbNDfAx/qupa+ymTZw27Cu3ri450KPb9J
         a72axRYFyI3pWWhOaa4mskrn/RPpJOxsn9ooRXev5BO+M49t8bbW/SO0/eRARrSa/f8P
         8Huv6eTCJnfblFekxdtiKz5OwH5bC9r5jVptwhwId3kkivu9HjpPo1Dn+sGoR3QrBrc/
         mPRTn51e/Y0zo1qbRNr5KzOgk08yfhYudRKhNU3G2iN53t9WtwF9Oyr+NBlqMRiVnELO
         hROAZsX0t2yjq9KVUlaltD7FhRjmp9BFiWgnNLKKP+08txplE8vYWmpu7Ialj5GMg8C2
         r8Gw==
X-Forwarded-Encrypted: i=1; AKwUvBy9rQGsjRml14LBuBEyBSvfwSP+dtJqQAFm8HaA53vnCL/xexa0G155Eum9055l3jUbBAxOvOxs1MRN7w==@vger.kernel.org
X-Gm-Message-State: AFuF++ncveGg5GTG5sB6uUULGm3luWdy5fsskzra6eNetdknsQVnfoBK
	QRP9OjA/PqdrAzR1zGO9Tqj2Ccn5wCMItC57hc06I8I1syD35byjrJan8sTd0QPi0a8yzyqJoRM
	1cABGpRVRIBtnd20n9yeKpDykeG3Kdg==
X-Gm-Gg: AYBFou1r/KApXH+YMleQkz8veoaUQqQxm/JAeCdECXrnXqu/XH+q1YY/LcJO6CKYmxS
	7xLe1aRALVHwGY7LMyTVS+nuulDeo71wbgSDh262/AcEJCDe46mNm2/cEfCSBWvAWduPxsoiuCD
	wiiqTFdRGrrR73olxE7yxd/8ylrhvQgdtIz/wdRDr6Yg7iFWaf3yDmQuund4bf1Y9nTyY+9xL4X
	LhWVTk3iGpJlf9W/bIkL3t8hBG376KeTyVVgxzXCwcgtBGr0IWC7D2Wpll1on15utBDozQY1PqO
	/hWBcGNBpaT6+jga9DXgItFHRC9DzU9O583tArCzjtdGdBz0S0ikOOvApJkhiN//Dn227hhy47F
	b4iOwaakbdHgbjVwzklNPlRrSxBKB9w9RMM8mVmr88MZi1S4bzgNFS0ybVIT/dMncEsbS
X-Received: by 2002:a17:907:9306:b0:c29:f5d8:9c7b with SMTP id
 a640c23a62f3a-c2ac22ca80dmr360018666b.42.1790287448555; Thu, 24 Sep 2026
 15:04:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923030641.992569-1-mhun512@gmail.com> <arOc2HZm3JCf5tjJ@opensource.cirrus.com>
In-Reply-To: <arOc2HZm3JCf5tjJ@opensource.cirrus.com>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Thu, 24 Sep 2026 18:03:56 -0400
X-Gm-Features: AclHuK_4Jp1hMYF-kdtO3xj5KB7MKhICx974fvLTFZOhQYR63pYwwCIBr3cBE7Q
Message-ID: <CAGEsz8HN81_F5h3oDzJvyiF5FidOfUYGnwH+JsbLNQ6GY+_Lfw@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: wm8962: Stop IRQ from requeuing mic_work on remove
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, patches@opensource.cirrus.com, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, Charles. You're right that the jack check duplicates the
existing IRQ mask handling.

I'll update wm8962_mic_detect() to mask the microphone interrupts,
wait for any running IRQ handler, and cancel mic_work before changing
the jack pointer. I'll call it from wm8962_remove() and keep the IRQ
registered for the other interrupt sources.

I'll send v3 with these changes shortly.

Thanks,
Myeonghun

2026=EB=85=84 9=EC=9B=94 23=EC=9D=BC (=EC=88=98) =EC=98=A4=EC=A0=84 5:33, C=
harles Keepax <ckeepax@opensource.cirrus.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=
=EC=84=B1:
>
> On Tue, Sep 22, 2026 at 11:06:41PM -0400, Myeonghun Pak wrote:
> > --- a/sound/soc/codecs/wm8962.c
> > +++ b/sound/soc/codecs/wm8962.c
> > @@ -3115,7 +3115,7 @@ static void wm8962_mic_work(struct work_struct *w=
ork)
> >
> >       wm8962->mic_status =3D status;
> >
> > -     snd_soc_jack_report(wm8962->jack, status,
> > +     snd_soc_jack_report(READ_ONCE(wm8962->jack), status,
> >                           SND_JACK_MICROPHONE | SND_JACK_BTN_0);
> >
> >       snd_soc_component_update_bits(component, WM8962_MICINT_SOURCE_POL=
,
> > @@ -3203,9 +3203,14 @@ static irqreturn_t wm8962_irq(int irq, void *dat=
a)
> >
> >               pm_wakeup_event(dev, 300);
> >
> > -             queue_delayed_work(system_power_efficient_wq,
> > -                                &wm8962->mic_work,
> > -                                msecs_to_jiffies(250));
> > +             /*
> > +              * mic_work reports this jack.  Removal clears it before
> > +              * synchronize_irq(), so do not queue once it is gone.
> > +              */
> > +             if (READ_ONCE(wm8962->jack))
>
> This feels a bit like its duplicating the mask check above, I
> think it would be nicer to ensure that works as intended than
> adding a second layer of filtering.
>
> > +                     queue_delayed_work(system_power_efficient_wq,
> > +                                        &wm8962->mic_work,
> > +                                        msecs_to_jiffies(250));
> >       }
> >
> >       pm_runtime_put(dev);
> > @@ -3232,7 +3237,7 @@ int wm8962_mic_detect(struct snd_soc_component *c=
omponent, struct snd_soc_jack *
> >       struct snd_soc_dapm_context *dapm =3D snd_soc_component_to_dapm(c=
omponent);
> >       int irq_mask, enable;
> >
> > -     wm8962->jack =3D jack;
> > +     WRITE_ONCE(wm8962->jack, jack);
> >       if (jack) {
> >               irq_mask =3D 0;
> >               enable =3D WM8962_MICDET_ENA;
> > @@ -3247,7 +3252,7 @@ int wm8962_mic_detect(struct snd_soc_component *c=
omponent, struct snd_soc_jack *
> >                           WM8962_MICDET_ENA, enable);
> >
> >       /* Send an initial empty report */
> > -     snd_soc_jack_report(wm8962->jack, 0,
> > +     snd_soc_jack_report(jack, 0,
> >                           SND_JACK_MICROPHONE | SND_JACK_BTN_0);
> >
> >       snd_soc_dapm_mutex_lock(dapm);
> > @@ -3594,6 +3599,15 @@ static void wm8962_remove(struct snd_soc_compone=
nt *component)
> >  {
> >       struct wm8962_priv *wm8962 =3D snd_soc_component_get_drvdata(comp=
onent);
> >
> > +     /*
> > +      * The IRQ stays registered for the I2C device, including across
> > +      * card unbind.  It is the only producer of mic_work.  Clear the
> > +      * jack first so a new handler does not queue, wait out a handler
> > +      * that already loaded the old pointer, then drain the work.
> > +      */
> > +     WRITE_ONCE(wm8962->jack, NULL);
>
> So probably calling wm8962_mic_detect() here. Although
> granted that probably needs some small fixups as there are a
> couple races, probably also makes sense to move the mic_work
> sync in there too.
>
> > +     if (wm8962->irq)
> > +             synchronize_irq(wm8962->irq);
> >       cancel_delayed_work_sync(&wm8962->mic_work);
> >
> >       wm8962_free_gpio(component);
> > base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5
> > --
> > 2.53.0
>
> Thanks,
> Charles
