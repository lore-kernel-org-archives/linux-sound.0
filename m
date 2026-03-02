Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFB235F5FC
	for <linux-sound@vger.kernel.org>; Mon,  2 Mar 2026 11:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772449504; cv=pass; b=hQPZ1DkgYyCnmfpXLm/yd2ugMncvpAW0oCYZXzd1KBbp10XgMHBjvnIEusPCyDa01F4Sli1bsyZt/lT+umPonKGhFJzVhm/3IAUeN1XRm7TKD6rBxRPrSZszGkfKd9TwSYQDCjd5k4Bmu63V6MORx3I9Jrb/Me4qi/9bfzWqCCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772449504; c=relaxed/simple;
	bh=MNN0MxQutkVAICnu21/rtSu7MZP/rEU4Ta6qHPWAsoQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zhk3FrB2JSky8A6g/EW6gIe3X7WQOK+2zJLf0wFxCgZs8Z5ZTfUdiCKrRVoBUIQ8lEBiVnsB8p5fRwNXwHGEBEDo7OZfeDp2eAm9q5HvAMSBMl9VMN/OIh9FDP65M9NubaSkoVWMm4lFvzrVuIWQ6qLuNgcEb4JK32Um5AWA+gE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nFI7GPod; arc=pass smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nFI7GPod"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7d596a5be31so3403508a34.3
        for <linux-sound@vger.kernel.org>; Mon, 02 Mar 2026 03:05:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772449502; cv=none;
        d=google.com; s=arc-20240605;
        b=UCApE18OpWQ5Qv8CpJX6ZNAjSpOC7Kd19u/2K/Lw6lZ23aU3HXavuRbDElT3uw1NhV
         BOdvV7ioc+NJTds+GKapY4NLdq6iApKl4ZYejP+evX1M9sS9XjJYWmG2zF1o71skuE/G
         c/gATj22GOqf4cmkzPVXfi6Rzhj/8haBxBnO5KkSRKjZq8BOd5g/vYvoq31oPCPDKMsg
         rpshPxSXymweycOA0Im4JE2ieMuSp+JlSU1AsxaNnyWnXgQRmEEN+XBcUUeogE615EIi
         KHJzhHmP8tRaG/joFxEYdQRmgls1NpBJ5ko07I+7yR8IM6mxD9bWVOcPwPeAKhD1NxEZ
         Y6Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UpW1qD1SJXhXQMOWzRKDDnDlmrJmewCs6uD1CPB0kj8=;
        fh=7W+rWrxJ+u2AhXj5onpYW3f1++TAGUGnMGtkeG4w+Ik=;
        b=llVzYgYsHhE7rJq5vBq7w9OlDtlbCNYLQPMDX5D6Aigt0Ax66vE8YbjrR5nxO5cSgU
         TXK3MGAheJO4wnsFa7TtLZnzMZBmvRuvOKfOYNtC7nFRtWSRGYFUMrv7kWtRop2aS8at
         XEy4Cue3pn21KAjkWAMDncFEhLOsvXTbKejKBZSpNAUnpl4OjVndVW2mgRqmI8KTKJfW
         cWLLV++zSaae2Xb/iipyNvFFppYwK/Zcx88usz+83F7QtR4SdYJWI5fAUeqnPH62JmJV
         GvImVqPHemn5b8zTwHFjpJEZEglCDe9/cVoUhi/F1/zt0QVfrK7o8ntfqO1tvYDUJMFc
         VJfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772449502; x=1773054302; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UpW1qD1SJXhXQMOWzRKDDnDlmrJmewCs6uD1CPB0kj8=;
        b=nFI7GPodwr4K7PC1HWfUVpPzdSjla2PQOIxDuEcBwSuSUvTWuwE5h20gW/c+gCy4t2
         u7QR/gPdyhMLyDTWmpznLdei1863tjE2BSGZTCnbBiufkUiS8X2sFkbHvf3zZU+SGT85
         Zdsw87IoZOF0vQlTKF+4+Nc/XEH5dCA0fEA1vh1IIJpbkto5aoGMyyrDS+SrhIZjaZVs
         vRYmlqAhwrxFdRyUdJ/JrIG2/Gpu+z6egxQjMYD3S0qZzGC7YK/grNnR5wEECaM1p0lb
         LeT+svI9a4QLe600affzmHLczk+PGzyC1rZ0JbA9hsMhED94j2TQnwiOMoUmvSFiGP08
         Ydbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772449502; x=1773054302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UpW1qD1SJXhXQMOWzRKDDnDlmrJmewCs6uD1CPB0kj8=;
        b=DV5+f7SFNbaBwKw2ZbWYdVrJP1k8b4CSjcogPfiB+hdk+lOs58zXdY8waYH63qBOsv
         o3cEY+MEDt4hsQNqFvxo1laHFXx9mLBSsgvRucQhJOr1T+Ie1pQL2RRxsCeE46NAti3e
         x2JxiwinH4aQNi9lewEcsxTBdgMuUwCOcfAhK0ygJCvVqAyc9NWc9MFmUM6aXCGqRdpi
         7Aw5yKjAdNjWpfGn3j+cNQWdFwyl7D4crBmikgxwlX9/j3TdODxZ3O+SQtv0Ia3ikEIo
         MzQK+s2Z+qQk0FquubR6wUS1OTbeJ6Q5j3LSNlz3uN0h0Yl9KCZaLOrupqZAJcx5m1Z9
         wP6A==
X-Forwarded-Encrypted: i=1; AJvYcCUZJ8461JDLxCdtTVSW3pp9+Fhr9px6L4ufF9SP7RDe4l/zhNmoTYH3VytrneKTqEKR1Np6Hat0s5DCSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyL9iRoHhTEE8R1qfvgrQoi2V/HBI/4bgLIwZ7ZMOoGA3W93cuB
	jJG8HwJVj7h6ptCT9T8rCQmVBIR2c1uOreA0mYGNs57/xmkMC7Vw2b38JeZT4Fdc5Zw0BYkyAMm
	19datYLixlw2H4v/lm+oo+WEY6LfVQU4=
X-Gm-Gg: ATEYQzyOXouK7t/9u0pL34ZbjJN9E9fWhRImv/ZI4JTrKpc833RwZtOvFGQ7cdy4f7f
	7MZkB+GFp2NTSaCTwyg4aqnu0eekv0uY+WK6ApsbawAflqouX8vNTdfzEdSxPLc9ZzgdQlj2xgl
	CHCgJUHfpWIroP+Y2GgXvhStQ/p4HZTqAsknuk85coubpULq0yOX9Ipwn0HjIFq78PBWv45N2C3
	epOStfic21RIr/68tzDXNItfxjVwCgsohLTK+mk5FBf7eRGP3H6eD+uaYv3CzxsbIgj10Qo5v3C
	bzx+l9638/wZygyxD/ptwWAgzvGYhVGT4LsQlz9dOqg8CrMAy50Wxj41cf4iBD/66x/GI+jvilg
	=
X-Received: by 2002:a05:6870:ad08:b0:3e9:1643:5977 with SMTP id
 586e51a60fabf-41626e0fc5fmr6099442fac.18.1772449502199; Mon, 02 Mar 2026
 03:05:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260302002729.19438-1-dakr@kernel.org> <20260302002729.19438-2-dakr@kernel.org>
 <CALbr=LYqfhMi4eGp18r20XFzOWqRYCB8tO0mc_TAydb5cgbX-A@mail.gmail.com> <DGS7NBNUSBI6.16D6UP28IAXYS@kernel.org>
In-Reply-To: <DGS7NBNUSBI6.16D6UP28IAXYS@kernel.org>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Mon, 2 Mar 2026 19:04:51 +0800
X-Gm-Features: AaiRm52arKfwi8YCxjpEdTXQmweggZZESyxe8RNIzUhwuktCE_TgfQAoQ172OQc
Message-ID: <CALbr=LZ6Qu+oi0XiTZO4u+H2Jsv51jWazmK7xPt5EgK9DOy-hg@mail.gmail.com>
Subject: Re: [PATCH 1/3] driver core: generalize driver_override in struct device
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, abelvesa@kernel.org, 
	srini@kernel.org, s.nawrocki@samsung.com, nuno.sa@analog.com, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-hwmon@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-sh@vger.kernel.org, Wang Jiayue <akaieurus@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 2, 2026 at 6:05=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Mon Mar 2, 2026 at 9:36 AM CET, Gui-Dong Han wrote:
> > Applying the following diff fixes the KASAN issue. It was just a minor =
bug.
> >
> > diff --git a/drivers/base/core.c b/drivers/base/core.c
> > index a8cb90577d10..09b98f02f559 100644
> > --- a/drivers/base/core.c
> > +++ b/drivers/base/core.c
> > @@ -2556,6 +2556,7 @@ static void device_release(struct kobject *kobj)
> >         devres_release_all(dev);
> >
> >         kfree(dev->dma_range_map);
> > +       kfree(dev->driver_override.name);
> >
> >         if (dev->release)
> >                 dev->release(dev);
> > @@ -2566,7 +2567,6 @@ static void device_release(struct kobject *kobj)
> >         else
> >                 WARN(1, KERN_ERR "Device '%s' does not have a
> > release() function, it is broken and must be fixed. See
> > Documentation/core-api/kobject.rst.\n",
> >                         dev_name(dev));
> > -       kfree(dev->driver_override.name);
> >         kfree(p);
> >  }
>
> Yes, we must not access dev after the release callbacks has been called; =
no idea
> how this kfree() ended up below. Thanks for catching!
>
> > With this applied, along with the PCI driver diff from the WIP patch,
> > the issue is resolved. I tested this on PCI and both PoCs no longer
> > trigger KASAN. I also ran with other debug options enabled (lockdep,
> > sleep inside atomic, etc.) and hit no warnings.
> >
> > I was working on a similar patch recently, but your version is better.
> > Not returning the string directly provides better encapsulation and
> > makes the API much harder to misuse.
>
> Ah, right, I remember you mentioned that! If you want I can add your
> Co-developed-by: to this patch to account for your work.

That would be great, yes please. Thank you!

And thanks for all your hard work on this patch series, it's a really
solid improvement.
