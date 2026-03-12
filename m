Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778231C8634
	for <linux-sound@vger.kernel.org>; Thu, 12 Mar 2026 17:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773336243; cv=pass; b=aqGF8aEBNgO7F0edRgX9OpufKYLbZbG5HNHZ7NU0VjCIsj5HsmxzLKUXH+jd8OeQxq41mj6/Y3WSiakOuBYD5Tjsq/hRbmM9uFSwoPIfgbJcftNwJ4+Z0W9Fnou16nPs5SHNO9UjUGrE+46vtRy1x/CF76RBJszvdUtiFi088Ok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773336243; c=relaxed/simple;
	bh=cs9NydnZlUj2ytjzvPGe3kpN6J9plhpBN0pmEXhJkR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eoDU+tsoNSIZojzkK0Fy15vqIYoXFKOFunpYSWqQPtfO6MWTzKXSpXU9Q8g9rwfjrDtJq3rAJ2V4ry8qHtrp9wFyRhu3Yg60hx2YE2dU2REds8EgoKaJQBqNRDBjRoSoFq4tDBmXMD9sKrVIQ2SYtbiwuxe+vK5GWPTp18jyps8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FH2nfdSy; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FH2nfdSy"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-50906a98ffeso35261cf.0
        for <linux-sound@vger.kernel.org>; Thu, 12 Mar 2026 10:24:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773336241; cv=none;
        d=google.com; s=arc-20240605;
        b=VWhpXktGyaqBJ/5jv+JOLuDnY8jMcNQQR3RV8cfyMWP1cxOyL3a/J9/8XSdpl/QXkf
         UoJ6RXqu5hPj6mfB55k8zBWvPpll2PNJZ//Je/StpzGkY75Puyhdoh3aVbBjkplkrafy
         kIPfRHDE/M7o6Bhj8WW/jYez4JFlXFkQo1FOzXtiSn0lGsZRK+i9MTFRk3fcu5fhbN2S
         MrYnLxesJ0icnsSoKTJ6TS9qFzR6WXBglgwF1HFQjRmgSERmumbR46LEVJv3noLUUXSC
         vM38z+r/gHpOPc5dDirFpY1TK7NLWT+QiEiOTW7/AqlpKZSlBEpUJFP5CxEKp63XQM0L
         fO/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=drMga890hBoz1tXxKNjKqbtUxogSlXx8qnX/9lqYuDg=;
        fh=KAL1JtOGip956YA0X7uP7mBqPiZozrn133lUui8tj7U=;
        b=Da6siC7vNQ7TF43EUeWupgh9UXB5C5KzyGz/TGjFN0GKpZIr/KEFJiaVd8Q/3Ft0E0
         E2IkJo9kNjzQ/yDKvbGFXeOl9+D9aiVHg1hfOdX+cD17GBGFIsVRW+/xrdJ3sXoYhl9g
         lRShyayIwZcQYbirV9QDebUlDjjb3sdU4nzWvzw6EQScNJ8OWOw95KSME4ccnDle+qRd
         5k5DCqrIwkFY8P0VaPWFJeFr0KKsDrbEKujQvVJple4RzPmts0dEbUsBlyOqnJ2wbCgo
         OfrkxzPH/h5dAYQmyoWStvlj/p35C+WXtxDmBc87jiymwOOUuyYJz9s6EVdmsVjBbk3j
         Xl4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773336241; x=1773941041; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=drMga890hBoz1tXxKNjKqbtUxogSlXx8qnX/9lqYuDg=;
        b=FH2nfdSyarhBgZpBIcrAgIjZPxkpFYnowuFIBR2Vo/ZXdwrtgktBIYSOvOPdgfyXPM
         4zk+RWK0I/4s/m4hCtD5K+s4XSzM0ZYKGOfrLSj30JYlgQhUuYI+szwNZymUXpRLgS3i
         oPsspWJuSMdF2186ypaj/kzEbabt9Rva7iyV+9m9ZwdUEIH7ecZyOkXP0a1LYU8E19HH
         YxzzuQJJ+ma3fRIOJCHWcXi/hD+IC/jvSw8OUB6iQULlr7PfRHKhNqFRA7ft7K8VF/4t
         rxeHd98Bi3H0IuZncj3EVYx4zzG+XSmGTRpZrbJLUiR6IWncGymTFkvdJMsN31oz+KxN
         dr6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773336241; x=1773941041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=drMga890hBoz1tXxKNjKqbtUxogSlXx8qnX/9lqYuDg=;
        b=d4EQI7qtt8P6WIGGF4HQ6huZMayHmqmUIhTWK01GuwybJWE2kdk2qPG2Pzx/0RqyMO
         1Fh8BzP0IYTRRRCL83b2GdVaBpMd8MvF8DdzFEZwbxiNadbKdnAMZHbjsPLqyfA9h4hh
         hLzhWOgGuMPtdXzN0nyG3uG+uwdI+JwrSt0r9IR1StqGmelRhI41ZO3I7ZMR+UeYnj1s
         bqyT2AC1BWbxP1hlkAgTarOWsHoud8Nchj/FJWen9cKAkIwzcBi9RuK5zMwvwnlRFN63
         7hNwQ1Ng0wokaNzS5w/KMt/wv+zRwHMfA04kmDGH6RgofgRk5pLcsQ82J3rHugWk3eEf
         V2pA==
X-Forwarded-Encrypted: i=1; AJvYcCWvshNHS4f4RyS279mwHCPIiArN5T7TMzdrlf2kv8MjYCbM/OrYy/KCITRIL7/EkXq1bF5J1rkAy2OtTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIOVsrJrZ5+SaK8PvS8C2Xz/FyvY+sZwvFkSj776OL7XZGzdZ3
	KppKYtmRpkcbc2fR0dpMrKeOqMWl0yU3xbTf8//p9HfLigkUdFKnHMs0isJ12dfKXA9XBdAWbEj
	/ovTFj/FFyoQZhr1HbNeh+2xInx6jyY+Svx5nhn+j
X-Gm-Gg: ATEYQzzBLFo+D+UW2wwFuKCBnhZNkZb13hstCGyUyF3Xik4o9fe8/0GvKO3WPFA8ErL
	iefKkIJ3+m7hvE/+xZ7TFBXzGauYOE1F5Eqy7q875CkeTTXsECt5rU+HGlLq7K5K7qLFLo4afhR
	ze7WdUtMuVPR8/LNO4I8gUwpuCox0Xxaute8r6GVvlbYpomO39ICPSovYJcv73+3md6mGjFiR9T
	8BbE4ube9hd27EtngnByZGmhEXewE0LgtfAHYlLX4sq36rzZ3G3XEAvuXxns5LgsM5nplMl34m1
	PlsF5ink
X-Received: by 2002:a05:622a:354:b0:4f3:54eb:f26e with SMTP id
 d75a77b69052e-509585b04d0mr230561cf.1.1773336240812; Thu, 12 Mar 2026
 10:24:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309022205.28136-1-guanyulin@google.com> <20260309022205.28136-2-guanyulin@google.com>
 <2026031134-uncover-siamese-cdf9@gregkh>
In-Reply-To: <2026031134-uncover-siamese-cdf9@gregkh>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Thu, 12 Mar 2026 10:23:48 -0700
X-Gm-Features: AaiRm506FY_oJhi6wIWrihwWospchNxvGjcFGure-VJM-x4nJE6EzoeYpJH_Y7A
Message-ID: <CAOuDEK2jBncFtBFmn0h6fg519ErDC1tvLjpsUua2iWean9h4RA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] usb: offload: move device locking to callers in offload.c
To: Greg KH <gregkh@linuxfoundation.org>
Cc: mathias.nyman@intel.com, perex@perex.cz, tiwai@suse.com, 
	quic_wcheng@quicinc.com, broonie@kernel.org, arnd@arndb.de, 
	christophe.jaillet@wanadoo.fr, xiaopei01@kylinos.cn, 
	wesley.cheng@oss.qualcomm.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	stable@vger.kernel.org, Hailong Liu <hailong.liu@oppo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 5:26=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Mon, Mar 09, 2026 at 02:22:04AM +0000, Guan-Yu Lin wrote:
> > Update usb_offload_get() and usb_offload_put() to require that the
> > caller holds the USB device lock. Remove the internal call to
> > usb_lock_device() and add device_lock_assert() to ensure synchronizatio=
n
> > is handled by the caller. These functions continue to manage the
> > device's power state via autoresume/autosuspend and update the
> > offload_usage counter.
> >
> > Additionally, decouple the xHCI sideband interrupter lifecycle from the
> > offload usage counter by removing the calls to usb_offload_get() and
> > usb_offload_put() from the interrupter creation and removal paths. This
> > allows interrupters to be managed independently of the device's offload
> > activity status.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: ef82a4803aab ("xhci: sideband: add api to trace sideband usage")
> > Signed-off-by: Guan-Yu Lin <guanyulin@google.com>
> > Tested-by: Hailong Liu <hailong.liu@oppo.com>
> > ---
> >  drivers/usb/core/offload.c       | 34 +++++++++++---------------------
> >  drivers/usb/host/xhci-sideband.c | 14 +------------
> >  2 files changed, 13 insertions(+), 35 deletions(-)
> >
> > diff --git a/drivers/usb/core/offload.c b/drivers/usb/core/offload.c
> > index 7c699f1b8d2b..e13a4c21d61b 100644
> > --- a/drivers/usb/core/offload.c
> > +++ b/drivers/usb/core/offload.c
> > @@ -20,6 +20,7 @@
> >   * enabled on this usb_device; that is, another entity is actively han=
dling USB
> >   * transfers. This information allows the USB driver to adjust its pow=
er
> >   * management policy based on offload activity.
> > + * The caller must hold @udev's device lock.
>
> Ok, but:
>
> >   *
> >   * Return: 0 on success. A negative error code otherwise.
> >   */
> > @@ -27,31 +28,25 @@ int usb_offload_get(struct usb_device *udev)
>
> Why are you not using the __must_hold() definition here?
>

Thanks for the suggestion, __must_hold() will be added in the next version.

> >  {
> >       int ret;
> >
> > -     usb_lock_device(udev);
> > -     if (udev->state =3D=3D USB_STATE_NOTATTACHED) {
> > -             usb_unlock_device(udev);
> > +     device_lock_assert(&udev->dev);
>
> That's going to splat at runtime, not compile time, which is when you
> really want to check for this, right?
>
> And I thought all of the locking was messy before, and you cleaned it up
> to be nicer here, why go back to the "old" way?  Having a caller be
> forced to have a lock held is ripe for problems...
>

The challenge is that the USB stack automatically holds the lock
during the hardware/software USB connection change. But USB locks are
not held when we create/remove xhci sideband interrupters. Hence, we
need to manipulate the locks by ourselves to distinguish between these
2 usecases. What's your suggestion on this sceneario? Do you have
other options in mind?

> You also are not changing any callers to usb_offload_get() in this
> patch, so does this leave the kernel tree in a broken state?  If not,
> why not?  If so, that's not ok :(
>

The current upstream implementation triggers deadlocks in some cases.
This patch simply disassociates the offload counter manipulation from
sideband interrupt creation to address the deadlock. After applying
the patch, the offload counter won't update until the next patch in
this series is applied. Is this considered a broken state? Should I
squash the two commits into one, or keep them as they were?

>
> > +
> > +     if (udev->state =3D=3D USB_STATE_NOTATTACHED)
> >               return -ENODEV;
> > -     }
> >
> >       if (udev->state =3D=3D USB_STATE_SUSPENDED ||
> > -                udev->offload_at_suspend) {
> > -             usb_unlock_device(udev);
> > +         udev->offload_at_suspend)
>
> Can't that really all be on one line?
>

Sure, Let me change it to one line.

> >               return -EBUSY;
> > -     }
> >
> >       /*
> >        * offload_usage could only be modified when the device is active=
, since
> >        * it will alter the suspend flow of the device.
> >        */
> >       ret =3D usb_autoresume_device(udev);
> > -     if (ret < 0) {
> > -             usb_unlock_device(udev);
> > +     if (ret < 0)
> >               return ret;
> > -     }
> >
> >       udev->offload_usage++;
> >       usb_autosuspend_device(udev);
> > -     usb_unlock_device(udev);
> >
> >       return ret;
> >  }
> > @@ -64,6 +59,7 @@ EXPORT_SYMBOL_GPL(usb_offload_get);
> >   * The inverse operation of usb_offload_get, which drops the offload_u=
sage of
> >   * a USB device. This information allows the USB driver to adjust its =
power
> >   * management policy based on offload activity.
> > + * The caller must hold @udev's device lock.
> >   *
> >   * Return: 0 on success. A negative error code otherwise.
> >   */
> > @@ -71,33 +67,27 @@ int usb_offload_put(struct usb_device *udev)
>
> Again, use __must_hold() here, to catch build time issues.
>
> And again, I don't see any code changes to reflect this new requirement
> :(
>
> thanks,
>
> greg k-h

Thanks for the suggestion, The __must_hold() macro will be adaped in
the next version.

Regards,
Guan-Yu
