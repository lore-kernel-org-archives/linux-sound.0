Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736F32E541F
	for <linux-sound@vger.kernel.org>; Wed, 18 Mar 2026 23:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773876113; cv=pass; b=Q/b0VwpPtumM9aJGoYWXn2B73Ehd+9r351ebkfBDsojUyWQuxHc0LoiR397Ziyhb4P9DAcLTEJIZoBX0wS8gND+4s1IpgAWmVwjCitHeh9XhOWKlUTgtbUR4O1JzGukqAbMhIW9fPgRHSapttKRpkPD3RREAC4b0mijrDGh2xZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773876113; c=relaxed/simple;
	bh=sWPkuLJXrcBX9S3aX4yM+gQyI9/bx+U9y1A0D2W1Bz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CuDJDBucqzcjG4FBfk6sDGrSGgPaU7X9YgFtdqotSGKcC9Vr9rBQLcouzltGpAPBO/hDMJYKu2ipEGXhJktOSh/uFl27txOb6iZ5ExMB8nc12wBvvLUtIgW2/Uwv2Htn9QVemsJ3E6MsGnNVj6oPVlVAcjPtzNVo7Luw3VNP1dY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H2DHbpJg; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H2DHbpJg"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-50906a98ffeso197311cf.0
        for <linux-sound@vger.kernel.org>; Wed, 18 Mar 2026 16:21:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773876111; cv=none;
        d=google.com; s=arc-20240605;
        b=lPVSZRrYG16141/ssm7bI0kt0uUXD/iUXPIBNwyo8++KtaVLMHVLUI93iDbLxcPhiN
         9Or4qo3wdAXdu7XT7x2HWrJz1ufhgO4mFbap8AlH+DlXuF23dIMFcpO/Yxy9JCaJn9rg
         1gHSjdXGb/BJtLPy1g4th7HNDVS1vYplomCdeJBQy8uZKHSIkG0LZK9l1uff44tp2fxD
         zq0fZ+XI9uNkyL/VLHMOi5GEa+s79CZCHeTJuqTGVAkVcd/XJ5/nvkTcQbFJKkWHPCPv
         5SX+Urky55TamTged3FyLCG77Ul1YwgqBumTUO3sG1RzGe31XsDX1zR1Oa9eP0yh7kKI
         YvfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m9rV6JpeFuPhu2T+JRvifOR+f3O83Iw8gXacOywKROQ=;
        fh=JIFpQQt1lgfNSCUgkOGlYBmpIlal3GxDPBHl9TcVy4s=;
        b=gnGXYVSwNMCKqhyLcUb5TvAHFwNlfS1tCU5YewPiTRC9Kg8FTn0bKEYsR4YGIBLNU8
         Gk8La//N1fvJc1PKRsCbSfCxFSGK/BQNhTh+VwAf5H4ZZcDc4Nv79VJPsr8/CUab95/P
         oNIM5WadO/bHuQVq22RADSSBz3pGJfK/v8lmzN7fzHhT9zlQPS/W05vciFwUGO9J8wfR
         IGyZ+/yi9ll2vG5i2RIITSFvc2XTI9EKgiSl9dr2q/v/SyXYJm3PBvr1rLme4YpMhGqf
         f75zvhjYTnrq4h1aGY4rCnWguV1xuMLZ4i2KQgaq50c42WfWj28yKliZ5lAs9U1FcYGl
         HKCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773876111; x=1774480911; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m9rV6JpeFuPhu2T+JRvifOR+f3O83Iw8gXacOywKROQ=;
        b=H2DHbpJguw8NvIiLyeFMFnAd8A9NJl4xFdl7DohesIVytl9S61tLC/Ee1OvtUa//OV
         7d+7iaX26PR4bl/G/I9P6eVamYnoeStGJjlaCyyJaQ3hXl08BKpmG7UvDMsM82V5vNVu
         Ygeu0wFdZnhixWUrrsHKKlq3EApgNj6eQv/GS0FaHybmS9MHegGMJB9xTo0f+Wr6z6/7
         j+aD1DYTrzC6C3KgLDG1B9aZCmFBSWRMVerYj5SsXmy0CLN5aV8CUppXrVmq605TgHIc
         BtJ0x5GcwDiz9+C14QYEI2Opj/lE/LrtA5T41pgiS2tCSob4AE8BYTiBB7JfYobMrjQE
         2X+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773876111; x=1774480911;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m9rV6JpeFuPhu2T+JRvifOR+f3O83Iw8gXacOywKROQ=;
        b=P/Vr3D1fI8PIzckTWY7g1chEA2tp2y8UUJdtsPDhMWGHO1iIwYX7b4nZonFifJGLPf
         XE1Rby8AT9DaXIJ2OLxNAB+pEWcdmP4k1bolOdxO08NROHbrM+52biJRMHuqxwLo2nR6
         mOhubAjJG1bJQh56i2XfRWS5yxv4gECZ3NPcMgi30pk2XSrri1IQfff6NChrXq/bXtdA
         BKEuHGcUXmc/970Gcyp3GoWyg0F0lsZOQ1zH0EVullnrB0jsvzuMbSSYp/wUaTMy3zU3
         ygGjhCZwvnnRP+zEamhFng3f9uNoWmO0/OfeETbwLgNQUQkdzN3afi/5xRoA7OiTv8LQ
         2+Jw==
X-Forwarded-Encrypted: i=1; AJvYcCWSaMPJyQWfOsb+OQGXmlZ51qwiPEEcG63Gr07GXp8mm0LBZ/Vm2738CMYxXG37JJ0xr1qLAaHF8ifhrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwePwsqzBg8qtavGAWo89v3GH8xY9526kQfzEmin0yECACT1A2e
	q6jEclGIUpnatjpS7c9nsnbBklJjlKz/XLBj/49HME7zdS++BDBVScb+Mkh8E8mCwF9tY79Ct9u
	T+AOsVteUGgUW9SqEMAyAzU+weLNYdwMWJrRD8t/C
X-Gm-Gg: ATEYQzzYrkXCpEsUlg/lgiQhUQNslAD9FJ/CVjSOl9Q/3MGXoVdBLms7j8uJ7azL2Vg
	4Bh/zzh45AUE9cBfKTgNBUM2oa+J8WHN5ZFeu+ojMtmJq8i8uTsjAyV7XbWzDY9ZpQE+vJ9GUex
	TxFdRz3PfWBgl9yb3jqxHDKDhvlbfB+Vte7BOoEgF25jpVP2aTDeH7GeQOj8/Jz0QCtBenrj4Am
	l5zEnmUPLowU+jgRyrvOPGH59+IhOh/P5yESreML++xcnSI6oFvZ7GuBPvyRFi+awg/vIpbBoD4
	p7RirMDB/DZy
X-Received: by 2002:a05:622a:58c:b0:509:45f:fdd2 with SMTP id
 d75a77b69052e-50b2747cab0mr3002981cf.15.1773876111071; Wed, 18 Mar 2026
 16:21:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309022205.28136-1-guanyulin@google.com> <20260309022205.28136-2-guanyulin@google.com>
 <505ab422-f933-4674-8f93-8744d0e67c6d@oss.qualcomm.com>
In-Reply-To: <505ab422-f933-4674-8f93-8744d0e67c6d@oss.qualcomm.com>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Wed, 18 Mar 2026 19:21:00 -0400
X-Gm-Features: AaiRm539Hmpj3e5uW-24en7eVbe4K9Ue0STys9HF6sxG6gvj_pbB9iJ_D2yzCoI
Message-ID: <CAOuDEK3b4BtHVYhLH_NkE1fP1-9ncqvAq6VedBzWLm=D_YDHQg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] usb: offload: move device locking to callers in offload.c
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: gregkh@linuxfoundation.org, mathias.nyman@intel.com, perex@perex.cz, 
	tiwai@suse.com, quic_wcheng@quicinc.com, broonie@kernel.org, arnd@arndb.de, 
	christophe.jaillet@wanadoo.fr, xiaopei01@kylinos.cn, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, stable@vger.kernel.org, 
	Hailong Liu <hailong.liu@oppo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2026 at 4:17=E2=80=AFPM Wesley Cheng
<wesley.cheng@oss.qualcomm.com> wrote:
>
> On 3/8/2026 7:22 PM, Guan-Yu Lin wrote:
> >
> > @@ -27,31 +28,25 @@ int usb_offload_get(struct usb_device *udev)
> >   {
> >       int ret;
> >
> > -     usb_lock_device(udev);
> > -     if (udev->state =3D=3D USB_STATE_NOTATTACHED) {
> > -             usb_unlock_device(udev);
> > +     device_lock_assert(&udev->dev);
> > +
> > +     if (udev->state =3D=3D USB_STATE_NOTATTACHED)
> >               return -ENODEV;
> > -     }

Could be removed. Since the udev is in USB_STATE_NOTATTACHED. I expect
the data structure being cleaned afterwards, so actually counter value
might not be important at this moment.

> >
> >       if (udev->state =3D=3D USB_STATE_SUSPENDED ||
> > -                udev->offload_at_suspend) {
> > -             usb_unlock_device(udev);
> > +         udev->offload_at_suspend)
> >               return -EBUSY;
> > -     }
> >

This check is still required. Because the suspend/resume process
depends on the counter value, we can't modify the counter value while
the device is suspended. If we do so, we will have an unbalanced
suspend resume operation.

However, we might only need to check for udev->offload_at_suspend (if
we ensure the device is active when we want to incremant the counter):
1. If the offload_usage_count is 0, we won't decrement counts at this momen=
t.
2. If the offload_usage_count is not 0, the offload_at_suspend flag
will be true anyway.

>
> Do we really need to be explicitly checking for the usb device state befo=
re
> we touch the offload_usage count?  In the end, its a reference count that
> determines how many consumers are active for a specific interrupter, so m=
y
> question revolves around if we need to have such strict checks.
>

Please find the explanation for each check above.

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
>
> IMO this should be handled already by the class driver, and if not, what =
is
> the harm?
>

We can only increment the usage count when the device is active. For
counter decrement, the device could be in any state.

My initial design is to resume the device and then modify the usage
count. Another option is to check only whether the USB device is
active via pm_runtime_get_if_active, and leave the device-resuming
effort to the class driver. Do you think this is the better approach?

> >       udev->offload_usage++;
> >       usb_autosuspend_device(udev);
> > -     usb_unlock_device(udev);
> >
> >       return ret;
> >   }
> > @@ -64,6 +59,7 @@ EXPORT_SYMBOL_GPL(usb_offload_get);
> >    * The inverse operation of usb_offload_get, which drops the offload_=
usage of
> >    * a USB device. This information allows the USB driver to adjust its=
 power
> >    * management policy based on offload activity.
> > + * The caller must hold @udev's device lock.
> >    *
> >    * Return: 0 on success. A negative error code otherwise.
> >    */
> > @@ -71,33 +67,27 @@ int usb_offload_put(struct usb_device *udev)
> >   {
> >       int ret;
> >
> > -     usb_lock_device(udev);
> > -     if (udev->state =3D=3D USB_STATE_NOTATTACHED) {
> > -             usb_unlock_device(udev);
> > +     device_lock_assert(&udev->dev);
> > +
> > +     if (udev->state =3D=3D USB_STATE_NOTATTACHED)
> >               return -ENODEV;
> > -     }
> >
> >       if (udev->state =3D=3D USB_STATE_SUSPENDED ||
> > -                udev->offload_at_suspend) {
> > -             usb_unlock_device(udev);
> > +         udev->offload_at_suspend)
> >               return -EBUSY;
> > -     }
> >
>
> During your testing, did you ever run into any unbalanced counter issues
> due to the above early exit conditions?
>
> I guess these are all just questions to see if we can remove the need to
> lock the udev mutex, and move to a local mutex for the offload framework.
> That would address the locking concerns being brought up by Greg, etc...
>
> Thanks
> Wesley Cheng
>

While developing the initial patch set, I did encounter the counter imbalan=
ce.

Following the discussion, we could move the device resume effort to
the class driver. This way we only need to check if the device is
active before manipulating the offload usage counter, which doesn't
require a device lock. Is there any concern with this approach?

Regards,
Guan-Yu
