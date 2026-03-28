Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A59E30F815
	for <linux-sound@vger.kernel.org>; Sat, 28 Mar 2026 15:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774710442; cv=pass; b=T0YV1yEH+DkC54qf1yJ833/wVrgbveZBTrbQDWL6ygzGUgEtUfyh7c+F2g9XRzDkOdNnR6ezokonafcsaWLxPRfZKVUYxlmu7GGQiLpxmDNkwfqKlD2ucmeDM1hO4CI38d4rDkteiDQCTzwQ8Gv9jeqI1PBmpMFj0gMKSwaqP84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774710442; c=relaxed/simple;
	bh=+25HSy4Nh9sW/+Ht25CiiDC24+4BuXR+UDHKdcNctQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GS3zfQFsRdbOQHlYDUQyVLDIiI5xgAtU0KCweYdcMyIfv6bniSHRGNP0FrlFokmxQhaXH8aN/aV6XybWQdXa/N/fpUr6q2k/tFUxbzEM4Pq3osBby7EuAKd089WRYat9WtoOIjg/Sw7VLG37qRT8t9ZmiDT+dhviFP8rCFvHOG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AufogAnt; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AufogAnt"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-509062d829dso368941cf.1
        for <linux-sound@vger.kernel.org>; Sat, 28 Mar 2026 08:07:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774710440; cv=none;
        d=google.com; s=arc-20240605;
        b=TlvqzBizTrydRbGcgCwyRwYLcQVjRKXrvLZe5ZgQarH/3omLFSQeUva8s/CwxwBUcp
         45lNUibyrTrR8sFYFGAHQg93J8skpK/iBgChxXC9Sg8vttVOBBpV5Z5lNWQXutq1uzTZ
         Q8cTf7Ts2KF25bs87sNhYISuaad1M4kBsv5zPtbFJRjov5TEo2kTuw+gakDTdjDw7ah+
         z40HYnvEer/IGJqUrA9FoJxlMXqJMR5oL+0qLc1tKWlbqcoHT6eVfv/Rx78MVwGKTIxU
         QOkzkp64nsDMr/YDAPQOsbF/d3c3vRSspVqsHCkiszU/nhhIlO9X8bp/Imnk/VlpRuSH
         Wrew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MYSq0ecok7/Nk88ydJ03AyrQ9n3U+lTc9bL9MpdtneI=;
        fh=xworoLjOFa3XTxiG33OGJg1HmhAY77YVLNELgHNI1uE=;
        b=j6Giabuc4CV8OSDigGhiuLHURY5swoTc1j187412DEw5/nRHFIK3+Uu0f91KLUkgSp
         E7tTi5bKft4aFjTSTLb91S3iecaj13k/h4w4/h3KqQYq80yG7bEuEHQHDs0Bwtz/6ufJ
         L3IBDIM3kyq7927onfnfhr8Kni85p2N/5lYGHiqynqF1j3R4PkWrbU9dMfXny/GpC28m
         G6qwmpxBcblKE5c2EaELyCpJQs6tUSf7jBVU0FSiLTIRA8gBaoE4D+TbeiPOF+neNHbg
         3rkxWJ6OALGqQbFKn/BEa2sRqd3SNgUap7NGteRlyOAFkhEBvNEeBeVDTbE5Y7pDnk/K
         jPmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774710440; x=1775315240; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MYSq0ecok7/Nk88ydJ03AyrQ9n3U+lTc9bL9MpdtneI=;
        b=AufogAntoJsn4YGPdKXcvWacFH7pU4PcAXa+MoYfkCIaguhP3vqKCh/sPHy3td38WD
         byH3Xiz2vzG1wRKvZJ63aM6Jo2/nhgi5Pl+2OmKVaKzSx3vhCoPXOPdIRBqA1VfXxXPP
         HBuD64GIDBVmN2k//fTrYMiEbASBJN4WVcNSxPxdmJt60xPiimW0Sj6lUuJwZSv7d6Wb
         +a7u5TU1DU7QCsw2X44zzmCHi14fKD8vyVZnld63ib7PT+KgIigrA4657VRGb99NVQ1Z
         QZfjt0nwi+/dfDLH9euqKJ8dMxHl9I/zS5yA7rrDQWRmOYf6IgbnF8/kU5LCSysSutmX
         KjDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774710440; x=1775315240;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MYSq0ecok7/Nk88ydJ03AyrQ9n3U+lTc9bL9MpdtneI=;
        b=SpTXs3pLi1/7tVybWQT3mDccU2X1QGYLSmh+NCFi2U8Imtt0U1AkW6AwxPwKPsCLuX
         w0BsZBh7kG2LzP8rcbIsxpK2nxwKMb7V6RCIDtZ9XiZWl1urgk4ltXC+nHpplb5btlVd
         jitHR6dkOtM88iLI0Zxpdn4MR20aFezRkDOPjxmOkMWacltN6wNSZTpe5qX7rguKYEHF
         CisvheE3C7qU+iPE6fjGZhbcIEEDW/aDId+rGZ3X1wQty0Cb01H3E3EhVpeGupgHyo+C
         DSG+ZRDxftD1RL1epTWCOyIoGJHfHveGBx7KxQZvKmmC+82cGyQTEZjDJGUVOmovLeR4
         2okA==
X-Forwarded-Encrypted: i=1; AJvYcCUi2PHjGsEb4sXN95lebUCM+HOPEvJVqupBhTF/PIBdVAxxRPZSflj8AXR/uLgHOxd8SjTK1YCFoDtfPg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/n2lb3e/FLgFe4rvUm0vWTAdNw1guCQsyCPZBNNbluAcBp4NU
	h7Sd6ISWY74f3mfPH7yxF3ba0vikSLjxV5HpE4U+cPS4AsYu+1FrP67hSsiFUJ9tYVw1Nsbg0rY
	IXdg6rZt9GELY5KIaNuvw1IFqcobuiBeIMLp56nIC
X-Gm-Gg: ATEYQzyGN5v5qMyzTr2+Zsoiip7tiHl8MFaNJtmZtt+/VMBMFl/Tr43rJ21S6+DjoHl
	HLlvRdieyhv6Gi97fQBy7vh/wcw5U4A4leWqpJNwce15fo4OySyKcIqrzG2mVwzhu1Q02kBpTvG
	cOg/sd522Y4E8mmhozKdQm3e3ZT2e2rjeUUQSE7HtEeABrtD42FP7t3R/3PkAHJ27kXSg3N2MRX
	toMAQoqT6/AXzv1Vf46B55O4k1kXrMAf05lIqveq/ptujx4g2nwbGtHIoEIQV3QO6xWojMc7iTF
	Gggk3AJaXxWauJl+6ac=
X-Received: by 2002:a05:622a:1209:b0:4ff:cb72:7c03 with SMTP id
 d75a77b69052e-50bb3d40dd3mr8303251cf.3.1774710439333; Sat, 28 Mar 2026
 08:07:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324203851.4091193-1-guanyulin@google.com>
 <20260324203851.4091193-2-guanyulin@google.com> <bed5a8c0-2611-464a-bfd3-b00a8648727b@linux.intel.com>
In-Reply-To: <bed5a8c0-2611-464a-bfd3-b00a8648727b@linux.intel.com>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Sat, 28 Mar 2026 10:06:00 -0500
X-Gm-Features: AQROBzCwP314OdG765RsMY_jZphlo5IIejJb1-BR4VDw1M_2VFoPa4yRhQk-JsU
Message-ID: <CAOuDEK3dHL3mwjem__tqOCHOaNLa9joymncZNZBRh6py-HzUhg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] usb: core: use dedicated spinlock for offload state
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: gregkh@linuxfoundation.org, mathias.nyman@intel.com, perex@perex.cz, 
	tiwai@suse.com, quic_wcheng@quicinc.com, broonie@kernel.org, arnd@arndb.de, 
	xiaopei01@kylinos.cn, wesley.cheng@oss.qualcomm.com, hannelotta@gmail.com, 
	sakari.ailus@linux.intel.com, eadavis@qq.com, stern@rowland.harvard.edu, 
	amardeep.rai@intel.com, xu.yang_2@nxp.com, andriy.shevchenko@linux.intel.com, 
	nkapron@google.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 6:58=E2=80=AFPM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
>
> Hi
>
> On 3/24/26 22:38, Guan-Yu Lin wrote:
> > -     /*
> > -      * offload_usage could only be modified when the device is active=
, since
> > -      * it will alter the suspend flow of the device.
> > -      */
> > -     ret =3D usb_autoresume_device(udev);
> > -     if (ret < 0) {
> > -             usb_unlock_device(udev);
> > -             return ret;
> > +     spin_lock(&udev->offload_lock);
> > +
> > +     if (udev->offload_pm_locked) {
>
> Could we get rid of 'udev->offload_pm_locked' and 'usb_offload_set_pm_loc=
ked()'
> by calling a synchronous pm_runtime_get_sync() or pm_runtime_resume_and_g=
et()?
>
> This way we can ensure udev->offload_usage isn't modified mid runtime sus=
pend or
> resume as resume is guaranteed to have finished and suspend won't be call=
ed,
> at least not for the runtime case.
>

We previously considered manipulating runtime PM directly, but the
USB-specific runtime API (usb_autoresume_device()) necessitates
holding the device lock. Since holding this lock causes a deadlock
issue as reported, we implemented a check-and-return-error approach to
remain deadlock-free while staying consistent with USB locking
requirements.

The `offload_pm_locked` flag ensures that `offload_usage` remains
static throughout the system suspend/resume cycle. Because
modifications to usage counts directly impact the USB power management
flow, all updates must occur only when the device is fully active.

> > -     /*
> > -      * offload_usage could only be modified when the device is active=
, since
> > -      * it will alter the suspend flow of the device.
> > -      */
> > -     ret =3D usb_autoresume_device(udev);
> > -     if (ret < 0) {
> > -             usb_unlock_device(udev);
> > -             return ret;
> > +     spin_lock(&udev->offload_lock);
> > +
> > +     if (udev->offload_pm_locked) {
> > +             ret =3D -EAGAIN;
> > +             goto err;
>
>
> Ending up here is about unlucky timing, i.e. usb_offload_put() is called =
while
> device is pretending to suspend/resume. Result here is that udev->offload=
_usage is
> not decremented, and usb device won't properly suspend anymore even if de=
vice is
> no longer offloaded.
>

The current implementation requires the class driver to either handle
the error code properly or ensure the system is fully resumed from
system suspend before calling `usb_offload_get()/put()`.

If we use the idea from pm_runtime_put_sync(): "decremented usage
count in all cases, even if it returns an error code", this will lead
to usage_count changes during system suspend. The system might use
suspend logic with active USB offloaded devices system to suspend, but
uses logic without active offloaded devices since the usage count has
been changed during the suspend period. To avoid this, a
check-and-return-error approach is adapted here.

> >   bool usb_offload_check(struct usb_device *udev) __must_hold(&udev->de=
v->mutex)
> >   {
> >       struct usb_device *child;
> > -     bool active;
> > +     bool active =3D false;
> >       int port1;
> >
> > +     spin_lock(&udev->offload_lock);
> > +     if (udev->offload_usage)
> > +             active =3D true;
> > +     spin_unlock(&udev->offload_lock);
> > +> +  if (active)
> > +             return true;
>
> Not sure what the purpose of the spinlock is above
>

The spinlock was originally intended to prevent a race condition
between `usb_offload_get()/put()` and `usb_offload_check()`. However,
because `usb_offload_check()` is only invoked while
`offload_pm_locked` is set, the race is already resolved. I=E2=80=99m remov=
ing
the spinlock and updating the function description accordingly. Thanks
for identifying this.

> > +void usb_offload_set_pm_locked(struct usb_device *udev, bool locked)
> > +{
> > +     spin_lock(&udev->offload_lock);
> > +     udev->offload_pm_locked =3D locked;
> > +     spin_unlock(&udev->offload_lock);
> >
>
> spinlock usage unclear here as well
>
> Thanks
> Mathias
>

The spinlock ensures that `offload_usage` is modified only while
`offload_pm_locked` remains false. Without this synchronization,
`offload_pm_locked` could change during the execution of
`usb_offload_get()/put()`, leading to a race condition.

Regards,
Guan-Yu
